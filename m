Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2723F15AE
	for <lists.iommu@lfdr.de>; Thu, 19 Aug 2021 11:00:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 63717400AE;
	Thu, 19 Aug 2021 09:00:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jeB4Knc_Ul1t; Thu, 19 Aug 2021 09:00:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 5C602400C3;
	Thu, 19 Aug 2021 09:00:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 36842C000E;
	Thu, 19 Aug 2021 09:00:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 16E1FC000E
 for <iommu@lists.linux-foundation.org>; Thu, 19 Aug 2021 09:00:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0647B80CCB
 for <iommu@lists.linux-foundation.org>; Thu, 19 Aug 2021 09:00:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UnJkdEFMNhSt for <iommu@lists.linux-foundation.org>;
 Thu, 19 Aug 2021 09:00:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1EE0C80C13
 for <iommu@lists.linux-foundation.org>; Thu, 19 Aug 2021 09:00:26 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 747081FB;
 Thu, 19 Aug 2021 02:00:25 -0700 (PDT)
Received: from [10.57.36.146] (unknown [10.57.36.146])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E605A3F40C;
 Thu, 19 Aug 2021 02:00:23 -0700 (PDT)
Subject: Re: [PATCH v6 4/7] dma-iommu: fold _swiotlb helpers into callers
To: David Stevens <stevensd@chromium.org>, Christoph Hellwig <hch@lst.de>
References: <20210817013852.3222824-1-stevensd@google.com>
 <20210817013852.3222824-5-stevensd@google.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <3cc9eb26-3225-ed2a-8784-cdc2119970e9@arm.com>
Date: Thu, 19 Aug 2021 10:00:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210817013852.3222824-5-stevensd@google.com>
Content-Language: en-GB
Cc: linux-kernel@vger.kernel.org, Tom Murphy <murphyt7@tcd.ie>,
 iommu@lists.linux-foundation.org, Will Deacon <will@kernel.org>
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

On 2021-08-17 02:38, David Stevens wrote:
> From: David Stevens <stevensd@chromium.org>
> 
> Fold the _swiotlb helper functions into the respective _page functions,
> since recent fixes have moved all logic from the _page functions to the
> _swiotlb functions.

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Signed-off-by: David Stevens <stevensd@chromium.org>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> ---
>   drivers/iommu/dma-iommu.c | 135 +++++++++++++++++---------------------
>   1 file changed, 59 insertions(+), 76 deletions(-)
> 
> diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
> index 5dd2c517dbf5..8152efada8b2 100644
> --- a/drivers/iommu/dma-iommu.c
> +++ b/drivers/iommu/dma-iommu.c
> @@ -493,26 +493,6 @@ static void __iommu_dma_unmap(struct device *dev, dma_addr_t dma_addr,
>   	iommu_dma_free_iova(cookie, dma_addr, size, iotlb_gather.freelist);
>   }
>   
> -static void __iommu_dma_unmap_swiotlb(struct device *dev, dma_addr_t dma_addr,
> -		size_t size, enum dma_data_direction dir,
> -		unsigned long attrs)
> -{
> -	struct iommu_domain *domain = iommu_get_dma_domain(dev);
> -	phys_addr_t phys;
> -
> -	phys = iommu_iova_to_phys(domain, dma_addr);
> -	if (WARN_ON(!phys))
> -		return;
> -
> -	if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC) && !dev_is_dma_coherent(dev))
> -		arch_sync_dma_for_cpu(phys, size, dir);
> -
> -	__iommu_dma_unmap(dev, dma_addr, size);
> -
> -	if (unlikely(is_swiotlb_buffer(phys)))
> -		swiotlb_tbl_unmap_single(dev, phys, size, dir, attrs);
> -}
> -
>   static dma_addr_t __iommu_dma_map(struct device *dev, phys_addr_t phys,
>   		size_t size, int prot, u64 dma_mask)
>   {
> @@ -539,55 +519,6 @@ static dma_addr_t __iommu_dma_map(struct device *dev, phys_addr_t phys,
>   	return iova + iova_off;
>   }
>   
> -static dma_addr_t __iommu_dma_map_swiotlb(struct device *dev, phys_addr_t phys,
> -		size_t org_size, dma_addr_t dma_mask, bool coherent,
> -		enum dma_data_direction dir, unsigned long attrs)
> -{
> -	int prot = dma_info_to_prot(dir, coherent, attrs);
> -	struct iommu_domain *domain = iommu_get_dma_domain(dev);
> -	struct iommu_dma_cookie *cookie = domain->iova_cookie;
> -	struct iova_domain *iovad = &cookie->iovad;
> -	size_t aligned_size = org_size;
> -	void *padding_start;
> -	size_t padding_size;
> -	dma_addr_t iova;
> -
> -	/*
> -	 * If both the physical buffer start address and size are
> -	 * page aligned, we don't need to use a bounce page.
> -	 */
> -	if (IS_ENABLED(CONFIG_SWIOTLB) && dev_is_untrusted(dev) &&
> -	    iova_offset(iovad, phys | org_size)) {
> -		aligned_size = iova_align(iovad, org_size);
> -		phys = swiotlb_tbl_map_single(dev, phys, org_size,
> -					      aligned_size, dir, attrs);
> -
> -		if (phys == DMA_MAPPING_ERROR)
> -			return DMA_MAPPING_ERROR;
> -
> -		/* Cleanup the padding area. */
> -		padding_start = phys_to_virt(phys);
> -		padding_size = aligned_size;
> -
> -		if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC) &&
> -		    (dir == DMA_TO_DEVICE ||
> -		     dir == DMA_BIDIRECTIONAL)) {
> -			padding_start += org_size;
> -			padding_size -= org_size;
> -		}
> -
> -		memset(padding_start, 0, padding_size);
> -	}
> -
> -	if (!coherent && !(attrs & DMA_ATTR_SKIP_CPU_SYNC))
> -		arch_sync_dma_for_device(phys, org_size, dir);
> -
> -	iova = __iommu_dma_map(dev, phys, aligned_size, prot, dma_mask);
> -	if (iova == DMA_MAPPING_ERROR && is_swiotlb_buffer(phys))
> -		swiotlb_tbl_unmap_single(dev, phys, org_size, dir, attrs);
> -	return iova;
> -}
> -
>   static void __iommu_dma_free_pages(struct page **pages, int count)
>   {
>   	while (count--)
> @@ -848,15 +779,68 @@ static dma_addr_t iommu_dma_map_page(struct device *dev, struct page *page,
>   {
>   	phys_addr_t phys = page_to_phys(page) + offset;
>   	bool coherent = dev_is_dma_coherent(dev);
> +	int prot = dma_info_to_prot(dir, coherent, attrs);
> +	struct iommu_domain *domain = iommu_get_dma_domain(dev);
> +	struct iommu_dma_cookie *cookie = domain->iova_cookie;
> +	struct iova_domain *iovad = &cookie->iovad;
> +	size_t aligned_size = size;
> +	dma_addr_t iova, dma_mask = dma_get_mask(dev);
> +
> +	/*
> +	 * If both the physical buffer start address and size are
> +	 * page aligned, we don't need to use a bounce page.
> +	 */
> +	if (IS_ENABLED(CONFIG_SWIOTLB) && dev_is_untrusted(dev) &&
> +	    iova_offset(iovad, phys | size)) {
> +		void *padding_start;
> +		size_t padding_size;
> +
> +		aligned_size = iova_align(iovad, size);
> +		phys = swiotlb_tbl_map_single(dev, phys, size,
> +					      aligned_size, dir, attrs);
> +
> +		if (phys == DMA_MAPPING_ERROR)
> +			return DMA_MAPPING_ERROR;
>   
> -	return __iommu_dma_map_swiotlb(dev, phys, size, dma_get_mask(dev),
> -			coherent, dir, attrs);
> +		/* Cleanup the padding area. */
> +		padding_start = phys_to_virt(phys);
> +		padding_size = aligned_size;
> +
> +		if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC) &&
> +		    (dir == DMA_TO_DEVICE || dir == DMA_BIDIRECTIONAL)) {
> +			padding_start += size;
> +			padding_size -= size;
> +		}
> +
> +		memset(padding_start, 0, padding_size);
> +	}
> +
> +	if (!coherent && !(attrs & DMA_ATTR_SKIP_CPU_SYNC))
> +		arch_sync_dma_for_device(phys, size, dir);
> +
> +	iova = __iommu_dma_map(dev, phys, aligned_size, prot, dma_mask);
> +	if (iova == DMA_MAPPING_ERROR && is_swiotlb_buffer(phys))
> +		swiotlb_tbl_unmap_single(dev, phys, size, dir, attrs);
> +	return iova;
>   }
>   
>   static void iommu_dma_unmap_page(struct device *dev, dma_addr_t dma_handle,
>   		size_t size, enum dma_data_direction dir, unsigned long attrs)
>   {
> -	__iommu_dma_unmap_swiotlb(dev, dma_handle, size, dir, attrs);
> +	struct iommu_domain *domain = iommu_get_dma_domain(dev);
> +	phys_addr_t phys;
> +
> +	phys = iommu_iova_to_phys(domain, dma_handle);
> +	if (WARN_ON(!phys))
> +		return;
> +
> +	if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC) && !dev_is_dma_coherent(dev))
> +		arch_sync_dma_for_cpu(phys, size, dir);
> +
> +	__iommu_dma_unmap(dev, dma_handle, size);
> +
> +	if (unlikely(is_swiotlb_buffer(phys)))
> +		swiotlb_tbl_unmap_single(dev, phys, size, dir, attrs);
>   }
>   
>   /*
> @@ -941,7 +925,7 @@ static void iommu_dma_unmap_sg_swiotlb(struct device *dev, struct scatterlist *s
>   	int i;
>   
>   	for_each_sg(sg, s, nents, i)
> -		__iommu_dma_unmap_swiotlb(dev, sg_dma_address(s),
> +		iommu_dma_unmap_page(dev, sg_dma_address(s),
>   				sg_dma_len(s), dir, attrs);
>   }
>   
> @@ -952,9 +936,8 @@ static int iommu_dma_map_sg_swiotlb(struct device *dev, struct scatterlist *sg,
>   	int i;
>   
>   	for_each_sg(sg, s, nents, i) {
> -		sg_dma_address(s) = __iommu_dma_map_swiotlb(dev, sg_phys(s),
> -				s->length, dma_get_mask(dev),
> -				dev_is_dma_coherent(dev), dir, attrs);
> +		sg_dma_address(s) = iommu_dma_map_page(dev, sg_page(s),
> +				s->offset, s->length, dir, attrs);
>   		if (sg_dma_address(s) == DMA_MAPPING_ERROR)
>   			goto out_unmap;
>   		sg_dma_len(s) = s->length;
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
