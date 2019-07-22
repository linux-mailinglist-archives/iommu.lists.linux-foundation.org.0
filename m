Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E54703E0
	for <lists.iommu@lfdr.de>; Mon, 22 Jul 2019 17:36:24 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id AE0FAD83;
	Mon, 22 Jul 2019 15:36:22 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 14C5ECC9;
	Mon, 22 Jul 2019 15:36:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id B18EE102;
	Mon, 22 Jul 2019 15:36:12 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5751D28;
	Mon, 22 Jul 2019 08:36:12 -0700 (PDT)
Received: from [10.1.197.57] (e110467-lin.cambridge.arm.com [10.1.197.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 351A73F694;
	Mon, 22 Jul 2019 08:36:11 -0700 (PDT)
Subject: Re: [PATCH 2/2] virtio/virtio_ring: Fix the dma_max_mapping_size call
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com, hch@lst.de, 
	m.szyprowski@samsung.com, mst@redhat.com, jasowang@redhat.com,
	virtualization@lists.linux-foundation.org,
	iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
References: <20190722145509.1284-1-eric.auger@redhat.com>
	<20190722145509.1284-3-eric.auger@redhat.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <e4a288f2-a93a-5ce4-32da-f5434302551f@arm.com>
Date: Mon, 22 Jul 2019 16:36:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190722145509.1284-3-eric.auger@redhat.com>
Content-Language: en-GB
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On 22/07/2019 15:55, Eric Auger wrote:
> Do not call dma_max_mapping_size for devices that have no DMA
> mask set, otherwise we can hit a NULL pointer dereference.
> 
> This occurs when a virtio-blk-pci device is protected with
> a virtual IOMMU.
> 
> Fixes: e6d6dd6c875e ("virtio: Introduce virtio_max_dma_size()")
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Suggested-by: Christoph Hellwig <hch@lst.de>
> ---
>   drivers/virtio/virtio_ring.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> index c8be1c4f5b55..37c143971211 100644
> --- a/drivers/virtio/virtio_ring.c
> +++ b/drivers/virtio/virtio_ring.c
> @@ -262,7 +262,7 @@ size_t virtio_max_dma_size(struct virtio_device *vdev)
>   {
>   	size_t max_segment_size = SIZE_MAX;
>   
> -	if (vring_use_dma_api(vdev))
> +	if (vring_use_dma_api(vdev) && vdev->dev.dma_mask)

Hmm, might it make sense to roll that check up into vring_use_dma_api() 
itself? After all, if the device has no mask then it's likely that other 
DMA API ops wouldn't really work as expected either.

Robin.

>   		max_segment_size = dma_max_mapping_size(&vdev->dev);
>   
>   	return max_segment_size;
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
