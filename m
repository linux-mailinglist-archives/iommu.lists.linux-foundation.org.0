Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id A2ABF26466E
	for <lists.iommu@lfdr.de>; Thu, 10 Sep 2020 14:58:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2E746870D0;
	Thu, 10 Sep 2020 12:58:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hO-sxDi9NbCd; Thu, 10 Sep 2020 12:57:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CC70287100;
	Thu, 10 Sep 2020 12:57:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A701FC0893;
	Thu, 10 Sep 2020 12:57:58 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B7848C0051
 for <iommu@lists.linux-foundation.org>; Thu, 10 Sep 2020 12:57:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A24BC87653
 for <iommu@lists.linux-foundation.org>; Thu, 10 Sep 2020 12:57:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PVM+oAl-McFL for <iommu@lists.linux-foundation.org>;
 Thu, 10 Sep 2020 12:57:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7A04C8764E
 for <iommu@lists.linux-foundation.org>; Thu, 10 Sep 2020 12:57:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CDF1313D5;
 Thu, 10 Sep 2020 05:57:55 -0700 (PDT)
Received: from [10.57.40.122] (unknown [10.57.40.122])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 54FF43F66E;
 Thu, 10 Sep 2020 05:57:51 -0700 (PDT)
Subject: Re: [PATCH 06/12] dma-direct: remove dma_direct_{alloc,free}_pages
To: Christoph Hellwig <hch@lst.de>, Tony Luck <tony.luck@intel.com>,
 Fenghua Yu <fenghua.yu@intel.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 iommu@lists.linux-foundation.org
References: <20200908164758.3177341-1-hch@lst.de>
 <20200908164758.3177341-7-hch@lst.de>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <d944983d-fd7e-f59b-75a9-c6e60919f3a5@arm.com>
Date: Thu, 10 Sep 2020 13:57:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200908164758.3177341-7-hch@lst.de>
Content-Language: en-GB
Cc: linux-mips@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
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

On 2020-09-08 17:47, Christoph Hellwig wrote:
> Just merge these helpers into the main dma_direct_{alloc,free} routines,
> as the additional checks are always false for the two callers.

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   arch/x86/kernel/amd_gart_64.c |  6 +++---
>   include/linux/dma-direct.h    |  4 ----
>   kernel/dma/direct.c           | 39 ++++++++++++++---------------------
>   kernel/dma/pool.c             |  2 +-
>   4 files changed, 19 insertions(+), 32 deletions(-)
> 
> diff --git a/arch/x86/kernel/amd_gart_64.c b/arch/x86/kernel/amd_gart_64.c
> index bccc5357bffd6c..153374b996a279 100644
> --- a/arch/x86/kernel/amd_gart_64.c
> +++ b/arch/x86/kernel/amd_gart_64.c
> @@ -467,7 +467,7 @@ gart_alloc_coherent(struct device *dev, size_t size, dma_addr_t *dma_addr,
>   {
>   	void *vaddr;
>   
> -	vaddr = dma_direct_alloc_pages(dev, size, dma_addr, flag, attrs);
> +	vaddr = dma_direct_alloc(dev, size, dma_addr, flag, attrs);
>   	if (!vaddr ||
>   	    !force_iommu || dev->coherent_dma_mask <= DMA_BIT_MASK(24))
>   		return vaddr;
> @@ -479,7 +479,7 @@ gart_alloc_coherent(struct device *dev, size_t size, dma_addr_t *dma_addr,
>   		goto out_free;
>   	return vaddr;
>   out_free:
> -	dma_direct_free_pages(dev, size, vaddr, *dma_addr, attrs);
> +	dma_direct_free(dev, size, vaddr, *dma_addr, attrs);
>   	return NULL;
>   }
>   
> @@ -489,7 +489,7 @@ gart_free_coherent(struct device *dev, size_t size, void *vaddr,
>   		   dma_addr_t dma_addr, unsigned long attrs)
>   {
>   	gart_unmap_page(dev, dma_addr, size, DMA_BIDIRECTIONAL, 0);
> -	dma_direct_free_pages(dev, size, vaddr, dma_addr, attrs);
> +	dma_direct_free(dev, size, vaddr, dma_addr, attrs);
>   }
>   
>   static int no_agp;
> diff --git a/include/linux/dma-direct.h b/include/linux/dma-direct.h
> index 95e3e28bd93f47..20eceb2e4f91f8 100644
> --- a/include/linux/dma-direct.h
> +++ b/include/linux/dma-direct.h
> @@ -77,10 +77,6 @@ void *dma_direct_alloc(struct device *dev, size_t size, dma_addr_t *dma_handle,
>   		gfp_t gfp, unsigned long attrs);
>   void dma_direct_free(struct device *dev, size_t size, void *cpu_addr,
>   		dma_addr_t dma_addr, unsigned long attrs);
> -void *dma_direct_alloc_pages(struct device *dev, size_t size,
> -		dma_addr_t *dma_handle, gfp_t gfp, unsigned long attrs);
> -void dma_direct_free_pages(struct device *dev, size_t size, void *cpu_addr,
> -		dma_addr_t dma_addr, unsigned long attrs);
>   int dma_direct_get_sgtable(struct device *dev, struct sg_table *sgt,
>   		void *cpu_addr, dma_addr_t dma_addr, size_t size,
>   		unsigned long attrs);
> diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> index 949c1cbf08b2d5..1d564bea58571b 100644
> --- a/kernel/dma/direct.c
> +++ b/kernel/dma/direct.c
> @@ -151,13 +151,18 @@ static struct page *__dma_direct_alloc_pages(struct device *dev, size_t size,
>   	return page;
>   }
>   
> -void *dma_direct_alloc_pages(struct device *dev, size_t size,
> +void *dma_direct_alloc(struct device *dev, size_t size,
>   		dma_addr_t *dma_handle, gfp_t gfp, unsigned long attrs)
>   {
>   	struct page *page;
>   	void *ret;
>   	int err;
>   
> +	if (!IS_ENABLED(CONFIG_ARCH_HAS_DMA_SET_UNCACHED) &&
> +	    !IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) &&
> +	    dma_alloc_need_uncached(dev, attrs))
> +		return arch_dma_alloc(dev, size, dma_handle, gfp, attrs);
> +
>   	size = PAGE_ALIGN(size);
>   
>   	if (dma_should_alloc_from_pool(dev, gfp, attrs)) {
> @@ -256,11 +261,18 @@ void *dma_direct_alloc_pages(struct device *dev, size_t size,
>   	return NULL;
>   }
>   
> -void dma_direct_free_pages(struct device *dev, size_t size, void *cpu_addr,
> -		dma_addr_t dma_addr, unsigned long attrs)
> +void dma_direct_free(struct device *dev, size_t size,
> +		void *cpu_addr, dma_addr_t dma_addr, unsigned long attrs)
>   {
>   	unsigned int page_order = get_order(size);
>   
> +	if (!IS_ENABLED(CONFIG_ARCH_HAS_DMA_SET_UNCACHED) &&
> +	    !IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) &&
> +	    dma_alloc_need_uncached(dev, attrs)) {
> +		arch_dma_free(dev, size, cpu_addr, dma_addr, attrs);
> +		return;
> +	}
> +
>   	/* If cpu_addr is not from an atomic pool, dma_free_from_pool() fails */
>   	if (dma_should_free_from_pool(dev, attrs) &&
>   	    dma_free_from_pool(dev, cpu_addr, PAGE_ALIGN(size)))
> @@ -284,27 +296,6 @@ void dma_direct_free_pages(struct device *dev, size_t size, void *cpu_addr,
>   	dma_free_contiguous(dev, dma_direct_to_page(dev, dma_addr), size);
>   }
>   
> -void *dma_direct_alloc(struct device *dev, size_t size,
> -		dma_addr_t *dma_handle, gfp_t gfp, unsigned long attrs)
> -{
> -	if (!IS_ENABLED(CONFIG_ARCH_HAS_DMA_SET_UNCACHED) &&
> -	    !IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) &&
> -	    dma_alloc_need_uncached(dev, attrs))
> -		return arch_dma_alloc(dev, size, dma_handle, gfp, attrs);
> -	return dma_direct_alloc_pages(dev, size, dma_handle, gfp, attrs);
> -}
> -
> -void dma_direct_free(struct device *dev, size_t size,
> -		void *cpu_addr, dma_addr_t dma_addr, unsigned long attrs)
> -{
> -	if (!IS_ENABLED(CONFIG_ARCH_HAS_DMA_SET_UNCACHED) &&
> -	    !IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) &&
> -	    dma_alloc_need_uncached(dev, attrs))
> -		arch_dma_free(dev, size, cpu_addr, dma_addr, attrs);
> -	else
> -		dma_direct_free_pages(dev, size, cpu_addr, dma_addr, attrs);
> -}
> -
>   #if defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_DEVICE) || \
>       defined(CONFIG_SWIOTLB)
>   void dma_direct_sync_sg_for_device(struct device *dev,
> diff --git a/kernel/dma/pool.c b/kernel/dma/pool.c
> index 1281c0f0442bc5..fe11643ff9cc7b 100644
> --- a/kernel/dma/pool.c
> +++ b/kernel/dma/pool.c
> @@ -115,7 +115,7 @@ static int atomic_pool_expand(struct gen_pool *pool, size_t pool_size,
>   #endif
>   	/*
>   	 * Memory in the atomic DMA pools must be unencrypted, the pools do not
> -	 * shrink so no re-encryption occurs in dma_direct_free_pages().
> +	 * shrink so no re-encryption occurs in dma_direct_free().
>   	 */
>   	ret = set_memory_decrypted((unsigned long)page_to_virt(page),
>   				   1 << order);
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
