Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D563ABF8A
	for <lists.iommu@lfdr.de>; Fri, 18 Jun 2021 01:31:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11AC96064C;
	Thu, 17 Jun 2021 23:31:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DkqTHcdHv1BA; Thu, 17 Jun 2021 23:31:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id DF9466062C;
	Thu, 17 Jun 2021 23:31:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C6D04C0022;
	Thu, 17 Jun 2021 23:31:14 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 804ABC000B
 for <iommu@lists.linux-foundation.org>; Thu, 17 Jun 2021 23:31:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 62397400C0
 for <iommu@lists.linux-foundation.org>; Thu, 17 Jun 2021 23:31:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wiwrlPW7LFkp for <iommu@lists.linux-foundation.org>;
 Thu, 17 Jun 2021 23:31:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 87DA84002B
 for <iommu@lists.linux-foundation.org>; Thu, 17 Jun 2021 23:31:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AEEAC6117A;
 Thu, 17 Jun 2021 23:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623972672;
 bh=OQTvXWc5KTHXd26e21lniSV4nLp1qu2sC2xgNiM6A40=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=igsWuyQPQeQ/DRXp976arBlh2Cd5oMHU2rmslY5U2yOFBKGWeEuqoDHh/Bj3mGHkd
 bLMM1Kw2CstAytFNmlUOY8WTs+QEtmm/R9UpxalWSGPL6zjJqu+ywf2zRKIqqo2Vn2
 ska/hVnarr3cmbXV1zh/4q6O7Ya6EcMANA1sH0BM5teIhgKxWe/aPUjXDGMJHDQcyG
 02ttdVu/nqV8fLZFut1pkllMnC/G+MCX8oF5zPpY6lMJCM4R+UgwgZXWkVN0xhuJAr
 UeEfhIO3NooiVZttZkgEwUTjN1Qplp4be+9ogZRntMC6T8c0ripHJgEPpcV4OFRjHa
 ks0He4jC+xUpQ==
Date: Thu, 17 Jun 2021 16:31:10 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Claire Chang <tientzu@chromium.org>
Subject: Re: [PATCH v13 09/12] swiotlb: Add restricted DMA alloc/free support
In-Reply-To: <20210617062635.1660944-10-tientzu@chromium.org>
Message-ID: <alpine.DEB.2.21.2106171448490.24906@sstabellini-ThinkPad-T480s>
References: <20210617062635.1660944-1-tientzu@chromium.org>
 <20210617062635.1660944-10-tientzu@chromium.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: heikki.krogerus@linux.intel.com, thomas.hellstrom@linux.intel.com,
 peterz@infradead.org, benh@kernel.crashing.org,
 joonas.lahtinen@linux.intel.com, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, grant.likely@arm.com, paulus@samba.org,
 Frank Rowand <frowand.list@gmail.com>, mingo@kernel.org,
 sstabellini@kernel.org, Saravana Kannan <saravanak@google.com>,
 mpe@ellerman.id.au, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Christoph Hellwig <hch@lst.de>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Thierry Reding <treding@nvidia.com>, intel-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, linux-devicetree <devicetree@vger.kernel.org>,
 jxgao@google.com, daniel@ffwll.ch, Will Deacon <will@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 maarten.lankhorst@linux.intel.com, airlied@linux.ie,
 Dan Williams <dan.j.williams@intel.com>, linuxppc-dev@lists.ozlabs.org,
 jani.nikula@linux.intel.com, Rob Herring <robh+dt@kernel.org>,
 rodrigo.vivi@intel.com, bhelgaas@google.com, boris.ostrovsky@oracle.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, jgross@suse.com,
 Nicolas Boichat <drinkcat@chromium.org>, Greg KH <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, lkml <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, xypron.glpk@gmx.de,
 Robin Murphy <robin.murphy@arm.com>, bauerman@linux.ibm.com
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Thu, 17 Jun 2021, Claire Chang wrote:
> Add the functions, swiotlb_{alloc,free} and is_swiotlb_for_alloc to
> support the memory allocation from restricted DMA pool.
> 
> The restricted DMA pool is preferred if available.
> 
> Note that since coherent allocation needs remapping, one must set up
> another device coherent pool by shared-dma-pool and use
> dma_alloc_from_dev_coherent instead for atomic coherent allocation.
> 
> Signed-off-by: Claire Chang <tientzu@chromium.org>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Tested-by: Stefano Stabellini <sstabellini@kernel.org>
> Tested-by: Will Deacon <will@kernel.org>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  include/linux/swiotlb.h | 26 ++++++++++++++++++++++
>  kernel/dma/direct.c     | 49 +++++++++++++++++++++++++++++++----------
>  kernel/dma/swiotlb.c    | 38 ++++++++++++++++++++++++++++++--
>  3 files changed, 99 insertions(+), 14 deletions(-)
> 
> diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
> index 8d8855c77d9a..a73fad460162 100644
> --- a/include/linux/swiotlb.h
> +++ b/include/linux/swiotlb.h
> @@ -85,6 +85,7 @@ extern enum swiotlb_force swiotlb_force;
>   * @debugfs:	The dentry to debugfs.
>   * @late_alloc:	%true if allocated using the page allocator
>   * @force_bounce: %true if swiotlb bouncing is forced
> + * @for_alloc:  %true if the pool is used for memory allocation
>   */
>  struct io_tlb_mem {
>  	phys_addr_t start;
> @@ -96,6 +97,7 @@ struct io_tlb_mem {
>  	struct dentry *debugfs;
>  	bool late_alloc;
>  	bool force_bounce;
> +	bool for_alloc;
>  	struct io_tlb_slot {
>  		phys_addr_t orig_addr;
>  		size_t alloc_size;
> @@ -156,4 +158,28 @@ static inline void swiotlb_adjust_size(unsigned long size)
>  extern void swiotlb_print_info(void);
>  extern void swiotlb_set_max_segment(unsigned int);
>  
> +#ifdef CONFIG_DMA_RESTRICTED_POOL
> +struct page *swiotlb_alloc(struct device *dev, size_t size);
> +bool swiotlb_free(struct device *dev, struct page *page, size_t size);
> +
> +static inline bool is_swiotlb_for_alloc(struct device *dev)
> +{
> +	return dev->dma_io_tlb_mem->for_alloc;
> +}
> +#else
> +static inline struct page *swiotlb_alloc(struct device *dev, size_t size)
> +{
> +	return NULL;
> +}
> +static inline bool swiotlb_free(struct device *dev, struct page *page,
> +				size_t size)
> +{
> +	return false;
> +}
> +static inline bool is_swiotlb_for_alloc(struct device *dev)
> +{
> +	return false;
> +}
> +#endif /* CONFIG_DMA_RESTRICTED_POOL */
> +
>  #endif /* __LINUX_SWIOTLB_H */
> diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> index a92465b4eb12..2de33e5d302b 100644
> --- a/kernel/dma/direct.c
> +++ b/kernel/dma/direct.c
> @@ -75,6 +75,15 @@ static bool dma_coherent_ok(struct device *dev, phys_addr_t phys, size_t size)
>  		min_not_zero(dev->coherent_dma_mask, dev->bus_dma_limit);
>  }
>  
> +static void __dma_direct_free_pages(struct device *dev, struct page *page,
> +				    size_t size)
> +{
> +	if (IS_ENABLED(CONFIG_DMA_RESTRICTED_POOL) &&
> +	    swiotlb_free(dev, page, size))
> +		return;
> +	dma_free_contiguous(dev, page, size);
> +}
> +
>  static struct page *__dma_direct_alloc_pages(struct device *dev, size_t size,
>  		gfp_t gfp)
>  {
> @@ -86,6 +95,16 @@ static struct page *__dma_direct_alloc_pages(struct device *dev, size_t size,
>  
>  	gfp |= dma_direct_optimal_gfp_mask(dev, dev->coherent_dma_mask,
>  					   &phys_limit);
> +	if (IS_ENABLED(CONFIG_DMA_RESTRICTED_POOL) &&
> +	    is_swiotlb_for_alloc(dev)) {
> +		page = swiotlb_alloc(dev, size);
> +		if (page && !dma_coherent_ok(dev, page_to_phys(page), size)) {
> +			__dma_direct_free_pages(dev, page, size);
> +			return NULL;
> +		}
> +		return page;
> +	}
> +
>  	page = dma_alloc_contiguous(dev, size, gfp);
>  	if (page && !dma_coherent_ok(dev, page_to_phys(page), size)) {
>  		dma_free_contiguous(dev, page, size);
> @@ -142,7 +161,7 @@ void *dma_direct_alloc(struct device *dev, size_t size,
>  		gfp |= __GFP_NOWARN;
>  
>  	if ((attrs & DMA_ATTR_NO_KERNEL_MAPPING) &&
> -	    !force_dma_unencrypted(dev)) {
> +	    !force_dma_unencrypted(dev) && !is_swiotlb_for_alloc(dev)) {
>  		page = __dma_direct_alloc_pages(dev, size, gfp & ~__GFP_ZERO);
>  		if (!page)
>  			return NULL;
> @@ -155,18 +174,23 @@ void *dma_direct_alloc(struct device *dev, size_t size,
>  	}
>  
>  	if (!IS_ENABLED(CONFIG_ARCH_HAS_DMA_SET_UNCACHED) &&
> -	    !IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) &&
> -	    !dev_is_dma_coherent(dev))
> +	    !IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) && !dev_is_dma_coherent(dev) &&
> +	    !is_swiotlb_for_alloc(dev))
>  		return arch_dma_alloc(dev, size, dma_handle, gfp, attrs);
>  
>  	/*
>  	 * Remapping or decrypting memory may block. If either is required and
>  	 * we can't block, allocate the memory from the atomic pools.
> +	 * If restricted DMA (i.e., is_swiotlb_for_alloc) is required, one must
> +	 * set up another device coherent pool by shared-dma-pool and use
> +	 * dma_alloc_from_dev_coherent instead.
>  	 */
>  	if (IS_ENABLED(CONFIG_DMA_COHERENT_POOL) &&
>  	    !gfpflags_allow_blocking(gfp) &&
>  	    (force_dma_unencrypted(dev) ||
> -	     (IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) && !dev_is_dma_coherent(dev))))
> +	     (IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) &&
> +	      !dev_is_dma_coherent(dev))) &&
> +	    !is_swiotlb_for_alloc(dev))
>  		return dma_direct_alloc_from_pool(dev, size, dma_handle, gfp);
>  
>  	/* we always manually zero the memory once we are done */
> @@ -237,7 +261,7 @@ void *dma_direct_alloc(struct device *dev, size_t size,
>  			return NULL;
>  	}
>  out_free_pages:
> -	dma_free_contiguous(dev, page, size);
> +	__dma_direct_free_pages(dev, page, size);
>  	return NULL;
>  }
>  
> @@ -247,15 +271,15 @@ void dma_direct_free(struct device *dev, size_t size,
>  	unsigned int page_order = get_order(size);
>  
>  	if ((attrs & DMA_ATTR_NO_KERNEL_MAPPING) &&
> -	    !force_dma_unencrypted(dev)) {
> +	    !force_dma_unencrypted(dev) && !is_swiotlb_for_alloc(dev)) {
>  		/* cpu_addr is a struct page cookie, not a kernel address */
>  		dma_free_contiguous(dev, cpu_addr, size);
>  		return;
>  	}
>  
>  	if (!IS_ENABLED(CONFIG_ARCH_HAS_DMA_SET_UNCACHED) &&
> -	    !IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) &&
> -	    !dev_is_dma_coherent(dev)) {
> +	    !IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) && !dev_is_dma_coherent(dev) &&
> +	    !is_swiotlb_for_alloc(dev)) {
>  		arch_dma_free(dev, size, cpu_addr, dma_addr, attrs);
>  		return;
>  	}
> @@ -273,7 +297,7 @@ void dma_direct_free(struct device *dev, size_t size,
>  	else if (IS_ENABLED(CONFIG_ARCH_HAS_DMA_CLEAR_UNCACHED))
>  		arch_dma_clear_uncached(cpu_addr, size);
>  
> -	dma_free_contiguous(dev, dma_direct_to_page(dev, dma_addr), size);
> +	__dma_direct_free_pages(dev, dma_direct_to_page(dev, dma_addr), size);
>  }
>  
>  struct page *dma_direct_alloc_pages(struct device *dev, size_t size,
> @@ -283,7 +307,8 @@ struct page *dma_direct_alloc_pages(struct device *dev, size_t size,
>  	void *ret;
>  
>  	if (IS_ENABLED(CONFIG_DMA_COHERENT_POOL) &&
> -	    force_dma_unencrypted(dev) && !gfpflags_allow_blocking(gfp))
> +	    force_dma_unencrypted(dev) && !gfpflags_allow_blocking(gfp) &&
> +	    !is_swiotlb_for_alloc(dev))
>  		return dma_direct_alloc_from_pool(dev, size, dma_handle, gfp);
>  
>  	page = __dma_direct_alloc_pages(dev, size, gfp);
> @@ -310,7 +335,7 @@ struct page *dma_direct_alloc_pages(struct device *dev, size_t size,
>  	*dma_handle = phys_to_dma_direct(dev, page_to_phys(page));
>  	return page;
>  out_free_pages:
> -	dma_free_contiguous(dev, page, size);
> +	__dma_direct_free_pages(dev, page, size);
>  	return NULL;
>  }
>  
> @@ -329,7 +354,7 @@ void dma_direct_free_pages(struct device *dev, size_t size,
>  	if (force_dma_unencrypted(dev))
>  		set_memory_encrypted((unsigned long)vaddr, 1 << page_order);
>  
> -	dma_free_contiguous(dev, page, size);
> +	__dma_direct_free_pages(dev, page, size);
>  }
>  
>  #if defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_DEVICE) || \
> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> index ff09341bb9f5..6499cfbfe95f 100644
> --- a/kernel/dma/swiotlb.c
> +++ b/kernel/dma/swiotlb.c
> @@ -463,8 +463,9 @@ static int swiotlb_find_slots(struct device *dev, phys_addr_t orig_addr,
>  
>  	index = wrap = wrap_index(mem, ALIGN(mem->index, stride));
>  	do {
> -		if ((slot_addr(tbl_dma_addr, index) & iotlb_align_mask) !=
> -		    (orig_addr & iotlb_align_mask)) {
> +		if (orig_addr &&
> +		    (slot_addr(tbl_dma_addr, index) & iotlb_align_mask) !=
> +			    (orig_addr & iotlb_align_mask)) {
>  			index = wrap_index(mem, index + 1);
>  			continue;
>  		}
> @@ -703,3 +704,36 @@ static int __init swiotlb_create_default_debugfs(void)
>  late_initcall(swiotlb_create_default_debugfs);
>  
>  #endif
> +
> +#ifdef CONFIG_DMA_RESTRICTED_POOL
> +struct page *swiotlb_alloc(struct device *dev, size_t size)
> +{
> +	struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
> +	phys_addr_t tlb_addr;
> +	int index;
> +
> +	if (!mem)
> +		return NULL;
> +
> +	index = swiotlb_find_slots(dev, 0, size);
> +	if (index == -1)
> +		return NULL;
> +
> +	tlb_addr = slot_addr(mem->start, index);
> +
> +	return pfn_to_page(PFN_DOWN(tlb_addr));
> +}
> +
> +bool swiotlb_free(struct device *dev, struct page *page, size_t size)
> +{
> +	phys_addr_t tlb_addr = page_to_phys(page);
> +
> +	if (!is_swiotlb_buffer(dev, tlb_addr))
> +		return false;
> +
> +	swiotlb_release_slots(dev, tlb_addr);
> +
> +	return true;
> +}
> +
> +#endif /* CONFIG_DMA_RESTRICTED_POOL */
> -- 
> 2.32.0.288.g62a8d224e6-goog
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
