Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D87259D05
	for <lists.iommu@lfdr.de>; Tue,  1 Sep 2020 19:24:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id AFC5422DDB;
	Tue,  1 Sep 2020 17:24:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JuU67y-kaSi7; Tue,  1 Sep 2020 17:24:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 1BFB81FEED;
	Tue,  1 Sep 2020 17:24:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 09C84C0051;
	Tue,  1 Sep 2020 17:24:02 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3D085C0051
 for <iommu@lists.linux-foundation.org>; Tue,  1 Sep 2020 17:24:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 39270870AE
 for <iommu@lists.linux-foundation.org>; Tue,  1 Sep 2020 17:24:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rnqU1YpVqemw for <iommu@lists.linux-foundation.org>;
 Tue,  1 Sep 2020 17:23:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by hemlock.osuosl.org (Postfix) with ESMTP id 082E1870A0
 for <iommu@lists.linux-foundation.org>; Tue,  1 Sep 2020 17:23:58 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 52E8A1FB;
 Tue,  1 Sep 2020 10:23:58 -0700 (PDT)
Received: from [10.57.40.122] (unknown [10.57.40.122])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 401F73F71F;
 Tue,  1 Sep 2020 10:23:56 -0700 (PDT)
Subject: Re: [PATCH v9 01/32] drm: prime: add common helper to check
 scatterlist contiguity
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20200826063316.23486-1-m.szyprowski@samsung.com>
 <CGME20200826063527eucas1p1d68954adf1c25e1d760b92ca0845ab48@eucas1p1.samsung.com>
 <20200826063316.23486-2-m.szyprowski@samsung.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <bbbd5f0c-a0ae-015e-dbfd-4ae41e586983@arm.com>
Date: Tue, 1 Sep 2020 18:23:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200826063316.23486-2-m.szyprowski@samsung.com>
Content-Language: en-GB
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
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

On 2020-08-26 07:32, Marek Szyprowski wrote:
> It is a common operation done by DRM drivers to check the contiguity
> of the DMA-mapped buffer described by a scatterlist in the
> sg_table object. Let's add a common helper for this operation.

I still think this could be hoisted even further out to the common 
sgtable API level, but let's get the individual subsystems straightened 
out first then worry about consolidation later.

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
> ---
>   drivers/gpu/drm/drm_gem_cma_helper.c | 23 +++------------------
>   drivers/gpu/drm/drm_prime.c          | 31 ++++++++++++++++++++++++++++
>   include/drm/drm_prime.h              |  2 ++
>   3 files changed, 36 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/drm_gem_cma_helper.c
> index 822edeadbab3..59b9ca207b42 100644
> --- a/drivers/gpu/drm/drm_gem_cma_helper.c
> +++ b/drivers/gpu/drm/drm_gem_cma_helper.c
> @@ -471,26 +471,9 @@ drm_gem_cma_prime_import_sg_table(struct drm_device *dev,
>   {
>   	struct drm_gem_cma_object *cma_obj;
>   
> -	if (sgt->nents != 1) {
> -		/* check if the entries in the sg_table are contiguous */
> -		dma_addr_t next_addr = sg_dma_address(sgt->sgl);
> -		struct scatterlist *s;
> -		unsigned int i;
> -
> -		for_each_sg(sgt->sgl, s, sgt->nents, i) {
> -			/*
> -			 * sg_dma_address(s) is only valid for entries
> -			 * that have sg_dma_len(s) != 0
> -			 */
> -			if (!sg_dma_len(s))
> -				continue;
> -
> -			if (sg_dma_address(s) != next_addr)
> -				return ERR_PTR(-EINVAL);
> -
> -			next_addr = sg_dma_address(s) + sg_dma_len(s);
> -		}
> -	}
> +	/* check if the entries in the sg_table are contiguous */
> +	if (drm_prime_get_contiguous_size(sgt) < attach->dmabuf->size)
> +		return ERR_PTR(-EINVAL);
>   
>   	/* Create a CMA GEM buffer. */
>   	cma_obj = __drm_gem_cma_create(dev, attach->dmabuf->size);
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index 1693aa7c14b5..4ed5ed1f078c 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -825,6 +825,37 @@ struct sg_table *drm_prime_pages_to_sg(struct page **pages, unsigned int nr_page
>   }
>   EXPORT_SYMBOL(drm_prime_pages_to_sg);
>   
> +/**
> + * drm_prime_get_contiguous_size - returns the contiguous size of the buffer
> + * @sgt: sg_table describing the buffer to check
> + *
> + * This helper calculates the contiguous size in the DMA address space
> + * of the the buffer described by the provided sg_table.
> + *
> + * This is useful for implementing
> + * &drm_gem_object_funcs.gem_prime_import_sg_table.
> + */
> +unsigned long drm_prime_get_contiguous_size(struct sg_table *sgt)
> +{
> +	dma_addr_t expected = sg_dma_address(sgt->sgl);
> +	struct scatterlist *sg;
> +	unsigned long size = 0;
> +	int i;
> +
> +	for_each_sgtable_dma_sg(sgt, sg, i) {
> +		unsigned int len = sg_dma_len(sg);
> +
> +		if (!len)
> +			break;
> +		if (sg_dma_address(sg) != expected)
> +			break;
> +		expected += len;
> +		size += len;
> +	}
> +	return size;
> +}
> +EXPORT_SYMBOL(drm_prime_get_contiguous_size);
> +
>   /**
>    * drm_gem_prime_export - helper library implementation of the export callback
>    * @obj: GEM object to export
> diff --git a/include/drm/drm_prime.h b/include/drm/drm_prime.h
> index 9af7422b44cf..47ef11614627 100644
> --- a/include/drm/drm_prime.h
> +++ b/include/drm/drm_prime.h
> @@ -92,6 +92,8 @@ struct sg_table *drm_prime_pages_to_sg(struct page **pages, unsigned int nr_page
>   struct dma_buf *drm_gem_prime_export(struct drm_gem_object *obj,
>   				     int flags);
>   
> +unsigned long drm_prime_get_contiguous_size(struct sg_table *sgt);
> +
>   /* helper functions for importing */
>   struct drm_gem_object *drm_gem_prime_import_dev(struct drm_device *dev,
>   						struct dma_buf *dma_buf,
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
