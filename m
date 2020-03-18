Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id C8194189B7F
	for <lists.iommu@lfdr.de>; Wed, 18 Mar 2020 13:01:06 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 786A787FD9;
	Wed, 18 Mar 2020 12:01:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hUiID3CY1fs7; Wed, 18 Mar 2020 12:01:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3C89E87F92;
	Wed, 18 Mar 2020 12:01:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2EE77C013E;
	Wed, 18 Mar 2020 12:01:02 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 64C22C013E;
 Wed, 18 Mar 2020 12:01:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 531DD886B4;
 Wed, 18 Mar 2020 12:01:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zByQauCht5GW; Wed, 18 Mar 2020 12:00:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by hemlock.osuosl.org (Postfix) with ESMTP id 595F1886A4;
 Wed, 18 Mar 2020 12:00:59 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C3B431FB;
 Wed, 18 Mar 2020 05:00:58 -0700 (PDT)
Received: from [10.57.55.121] (unknown [10.57.55.121])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BD2B63F534;
 Wed, 18 Mar 2020 05:00:57 -0700 (PDT)
Subject: Re: [PATCH] iommu/virtio: Reject IOMMU page granule larger than
 PAGE_SIZE
To: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 iommu@lists.linux-foundation.org, virtualization@lists.linux-foundation.org
References: <20200318114047.1518048-1-jean-philippe@linaro.org>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <f1f3d844-8080-d26d-200e-a38480895480@arm.com>
Date: Wed, 18 Mar 2020 12:00:55 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200318114047.1518048-1-jean-philippe@linaro.org>
Content-Language: en-GB
Cc: Bharat Bhushan <bbhushan2@marvell.com>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development issues for Linux IOMMU support
 <iommu.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
 <mailto:iommu-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu@lists.linux-foundation.org>
List-Help: <mailto:iommu-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
 <mailto:iommu-request@lists.linux-foundation.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 2020-03-18 11:40 am, Jean-Philippe Brucker wrote:
> We don't currently support IOMMUs with a page granule larger than the
> system page size. The IOVA allocator has a BUG_ON() in this case, and
> VFIO has a WARN_ON().
> 
> It might be possible to remove these obstacles if necessary. If the host
> uses 64kB pages and the guest uses 4kB, then a device driver calling
> alloc_page() followed by dma_map_page() will create a 64kB mapping for a
> 4kB physical page, allowing the endpoint to access the neighbouring 60kB
> of memory. This problem could be worked around with bounce buffers.

FWIW the fundamental issue is that callers of iommu_map() may expect to 
be able to map two or more page-aligned regions directly adjacent to 
each other for scatter-gather purposes (or ring buffer tricks), and 
that's just not possible if the IOMMU granule is too big. Bounce 
buffering would be a viable workaround for the streaming DMA API and 
certain similar use-cases, but not in general (e.g. coherent DMA, VFIO, 
GPUs, etc.)

Robin.

> For the moment, rather than triggering the IOVA BUG_ON() on mismatched
> page sizes, abort the virtio-iommu probe with an error message.
> 
> Reported-by: Bharat Bhushan <bbhushan2@marvell.com>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>   drivers/iommu/virtio-iommu.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/iommu/virtio-iommu.c b/drivers/iommu/virtio-iommu.c
> index 6d4e3c2a2ddb..80d5d8f621ab 100644
> --- a/drivers/iommu/virtio-iommu.c
> +++ b/drivers/iommu/virtio-iommu.c
> @@ -998,6 +998,7 @@ static int viommu_probe(struct virtio_device *vdev)
>   	struct device *parent_dev = vdev->dev.parent;
>   	struct viommu_dev *viommu = NULL;
>   	struct device *dev = &vdev->dev;
> +	unsigned long viommu_page_size;
>   	u64 input_start = 0;
>   	u64 input_end = -1UL;
>   	int ret;
> @@ -1028,6 +1029,14 @@ static int viommu_probe(struct virtio_device *vdev)
>   		goto err_free_vqs;
>   	}
>   
> +	viommu_page_size = 1UL << __ffs(viommu->pgsize_bitmap);
> +	if (viommu_page_size > PAGE_SIZE) {
> +		dev_err(dev, "granule 0x%lx larger than system page size 0x%lx\n",
> +			viommu_page_size, PAGE_SIZE);
> +		ret = -EINVAL;
> +		goto err_free_vqs;
> +	}
> +
>   	viommu->map_flags = VIRTIO_IOMMU_MAP_F_READ | VIRTIO_IOMMU_MAP_F_WRITE;
>   	viommu->last_domain = ~0U;
>   
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
