Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5846F259FBE
	for <lists.iommu@lfdr.de>; Tue,  1 Sep 2020 22:15:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id F0C1787038;
	Tue,  1 Sep 2020 20:15:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S5sti5sTJSWq; Tue,  1 Sep 2020 20:15:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id CD29B8702F;
	Tue,  1 Sep 2020 20:15:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B6E69C0051;
	Tue,  1 Sep 2020 20:15:17 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3978CC0051
 for <iommu@lists.linux-foundation.org>; Tue,  1 Sep 2020 20:15:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 171A9203E5
 for <iommu@lists.linux-foundation.org>; Tue,  1 Sep 2020 20:15:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a7xOEmSv03iC for <iommu@lists.linux-foundation.org>;
 Tue,  1 Sep 2020 20:15:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by silver.osuosl.org (Postfix) with ESMTP id 71D6B20030
 for <iommu@lists.linux-foundation.org>; Tue,  1 Sep 2020 20:15:14 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E2BE1063;
 Tue,  1 Sep 2020 13:15:14 -0700 (PDT)
Received: from [10.57.40.122] (unknown [10.57.40.122])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5F1043F66F;
 Tue,  1 Sep 2020 13:15:11 -0700 (PDT)
Subject: Re: [PATCH v9 29/32] rapidio: fix common struct sg_table related
 issues
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20200826063316.23486-1-m.szyprowski@samsung.com>
 <CGME20200826063545eucas1p22eb2c7a643a299f3e1696b4c5bae0694@eucas1p2.samsung.com>
 <20200826063316.23486-30-m.szyprowski@samsung.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <5beb988a-099b-1247-b3d5-257de44b9ab5@arm.com>
Date: Tue, 1 Sep 2020 21:15:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200826063316.23486-30-m.szyprowski@samsung.com>
Content-Language: en-GB
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Alexandre Bounine <alex.bou9@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matt Porter <mporter@kernel.crashing.org>,
 Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org
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

On 2020-08-26 07:33, Marek Szyprowski wrote:
> The Documentation/DMA-API-HOWTO.txt states that the dma_map_sg() function
> returns the number of the created entries in the DMA address space.
> However the subsequent calls to the dma_sync_sg_for_{device,cpu}() and
> dma_unmap_sg must be called with the original number of the entries
> passed to the dma_map_sg().
> 
> struct sg_table is a common structure used for describing a non-contiguous
> memory buffer, used commonly in the DRM and graphics subsystems. It
> consists of a scatterlist with memory pages and DMA addresses (sgl entry),
> as well as the number of scatterlist entries: CPU pages (orig_nents entry)
> and DMA mapped pages (nents entry).
> 
> It turned out that it was a common mistake to misuse nents and orig_nents
> entries, calling DMA-mapping functions with a wrong number of entries or
> ignoring the number of mapped entries returned by the dma_map_sg()
> function.
> 
> To avoid such issues, lets use a common dma-mapping wrappers operating
> directly on the struct sg_table objects and use scatterlist page
> iterators where possible. This, almost always, hides references to the
> nents and orig_nents entries, making the code robust, easier to follow
> and copy/paste safe.

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>   drivers/rapidio/devices/rio_mport_cdev.c | 11 ++++-------
>   1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/rapidio/devices/rio_mport_cdev.c b/drivers/rapidio/devices/rio_mport_cdev.c
> index a30342942e26..89eb3d212652 100644
> --- a/drivers/rapidio/devices/rio_mport_cdev.c
> +++ b/drivers/rapidio/devices/rio_mport_cdev.c
> @@ -573,8 +573,7 @@ static void dma_req_free(struct kref *ref)
>   			refcount);
>   	struct mport_cdev_priv *priv = req->priv;
>   
> -	dma_unmap_sg(req->dmach->device->dev,
> -		     req->sgt.sgl, req->sgt.nents, req->dir);
> +	dma_unmap_sgtable(req->dmach->device->dev, &req->sgt, req->dir, 0);
>   	sg_free_table(&req->sgt);
>   	if (req->page_list) {
>   		unpin_user_pages(req->page_list, req->nr_pages);
> @@ -814,7 +813,6 @@ rio_dma_transfer(struct file *filp, u32 transfer_mode,
>   	struct mport_dev *md = priv->md;
>   	struct dma_chan *chan;
>   	int ret;
> -	int nents;
>   
>   	if (xfer->length == 0)
>   		return -EINVAL;
> @@ -930,15 +928,14 @@ rio_dma_transfer(struct file *filp, u32 transfer_mode,
>   				xfer->offset, xfer->length);
>   	}
>   
> -	nents = dma_map_sg(chan->device->dev,
> -			   req->sgt.sgl, req->sgt.nents, dir);
> -	if (nents == 0) {
> +	ret = dma_map_sgtable(chan->device->dev, &req->sgt, dir, 0);
> +	if (ret) {
>   		rmcd_error("Failed to map SG list");
>   		ret = -EFAULT;
>   		goto err_pg;
>   	}
>   
> -	ret = do_dma_request(req, xfer, sync, nents);
> +	ret = do_dma_request(req, xfer, sync, req->sgt.nents);
>   
>   	if (ret >= 0) {
>   		if (sync == RIO_TRANSFER_ASYNC)
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
