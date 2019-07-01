Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F72E375
	for <lists.iommu@lfdr.de>; Mon, 29 Apr 2019 15:13:59 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 2341A211C;
	Mon, 29 Apr 2019 13:13:57 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 780C92115
	for <iommu@lists.linux-foundation.org>;
	Mon, 29 Apr 2019 13:10:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.101.70])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id C2CBC711
	for <iommu@lists.linux-foundation.org>;
	Mon, 29 Apr 2019 13:10:44 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8C948A78;
	Mon, 29 Apr 2019 06:10:44 -0700 (PDT)
Received: from [10.1.196.75] (e110467-lin.cambridge.arm.com [10.1.196.75])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2716E3F71A;
	Mon, 29 Apr 2019 06:10:43 -0700 (PDT)
Subject: Re: [PATCH 12/26] iommu/dma: Refactor the page array remapping
	allocator
To: Christoph Hellwig <hch@lst.de>
References: <20190422175942.18788-1-hch@lst.de>
	<20190422175942.18788-13-hch@lst.de>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <847e0d85-36c6-01d1-6547-5ca9d3f0931a@arm.com>
Date: Mon, 29 Apr 2019 14:10:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190422175942.18788-13-hch@lst.de>
Content-Language: en-GB
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org,
	iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org
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

On 22/04/2019 18:59, Christoph Hellwig wrote:
> Move the call to dma_common_pages_remap into __iommu_dma_alloc and
> rename it to iommu_dma_alloc_remap.  This creates a self-contained
> helper for remapped pages allocation and mapping.

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   drivers/iommu/dma-iommu.c | 54 +++++++++++++++++++--------------------
>   1 file changed, 26 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
> index 8e2d9733113e..b8e46e89a60a 100644
> --- a/drivers/iommu/dma-iommu.c
> +++ b/drivers/iommu/dma-iommu.c
> @@ -535,9 +535,9 @@ static struct page **__iommu_dma_get_pages(void *cpu_addr)
>   }
>   
>   /**
> - * iommu_dma_free - Free a buffer allocated by __iommu_dma_alloc()
> + * iommu_dma_free - Free a buffer allocated by iommu_dma_alloc_remap()
>    * @dev: Device which owns this buffer
> - * @pages: Array of buffer pages as returned by __iommu_dma_alloc()
> + * @pages: Array of buffer pages as returned by __iommu_dma_alloc_remap()
>    * @size: Size of buffer in bytes
>    * @handle: DMA address of buffer
>    *
> @@ -553,33 +553,35 @@ static void __iommu_dma_free(struct device *dev, struct page **pages,
>   }
>   
>   /**
> - * __iommu_dma_alloc - Allocate and map a buffer contiguous in IOVA space
> + * iommu_dma_alloc_remap - Allocate and map a buffer contiguous in IOVA space
>    * @dev: Device to allocate memory for. Must be a real device
>    *	 attached to an iommu_dma_domain
>    * @size: Size of buffer in bytes
> + * @dma_handle: Out argument for allocated DMA handle
>    * @gfp: Allocation flags
>    * @attrs: DMA attributes for this allocation
> - * @prot: IOMMU mapping flags
> - * @handle: Out argument for allocated DMA handle
>    *
>    * If @size is less than PAGE_SIZE, then a full CPU page will be allocated,
>    * but an IOMMU which supports smaller pages might not map the whole thing.
>    *
> - * Return: Array of struct page pointers describing the buffer,
> - *	   or NULL on failure.
> + * Return: Mapped virtual address, or NULL on failure.
>    */
> -static struct page **__iommu_dma_alloc(struct device *dev, size_t size,
> -		gfp_t gfp, unsigned long attrs, int prot, dma_addr_t *handle)
> +static void *iommu_dma_alloc_remap(struct device *dev, size_t size,
> +		dma_addr_t *dma_handle, gfp_t gfp, unsigned long attrs)
>   {
>   	struct iommu_domain *domain = iommu_get_dma_domain(dev);
>   	struct iommu_dma_cookie *cookie = domain->iova_cookie;
>   	struct iova_domain *iovad = &cookie->iovad;
> +	bool coherent = dev_is_dma_coherent(dev);
> +	int ioprot = dma_info_to_prot(DMA_BIDIRECTIONAL, coherent, attrs);
> +	pgprot_t prot = arch_dma_mmap_pgprot(dev, PAGE_KERNEL, attrs);
> +	unsigned int count, min_size, alloc_sizes = domain->pgsize_bitmap;
>   	struct page **pages;
>   	struct sg_table sgt;
>   	dma_addr_t iova;
> -	unsigned int count, min_size, alloc_sizes = domain->pgsize_bitmap;
> +	void *vaddr;
>   
> -	*handle = DMA_MAPPING_ERROR;
> +	*dma_handle = DMA_MAPPING_ERROR;
>   
>   	min_size = alloc_sizes & -alloc_sizes;
>   	if (min_size < PAGE_SIZE) {
> @@ -605,7 +607,7 @@ static struct page **__iommu_dma_alloc(struct device *dev, size_t size,
>   	if (sg_alloc_table_from_pages(&sgt, pages, count, 0, size, GFP_KERNEL))
>   		goto out_free_iova;
>   
> -	if (!(prot & IOMMU_CACHE)) {
> +	if (!(ioprot & IOMMU_CACHE)) {
>   		struct scatterlist *sg;
>   		int i;
>   
> @@ -613,14 +615,21 @@ static struct page **__iommu_dma_alloc(struct device *dev, size_t size,
>   			arch_dma_prep_coherent(sg_page(sg), sg->length);
>   	}
>   
> -	if (iommu_map_sg(domain, iova, sgt.sgl, sgt.orig_nents, prot)
> +	if (iommu_map_sg(domain, iova, sgt.sgl, sgt.orig_nents, ioprot)
>   			< size)
>   		goto out_free_sg;
>   
> -	*handle = iova;
> +	vaddr = dma_common_pages_remap(pages, size, VM_USERMAP, prot,
> +			__builtin_return_address(0));
> +	if (!vaddr)
> +		goto out_unmap;
> +
> +	*dma_handle = iova;
>   	sg_free_table(&sgt);
> -	return pages;
> +	return vaddr;
>   
> +out_unmap:
> +	__iommu_dma_unmap(dev, iova, size);
>   out_free_sg:
>   	sg_free_table(&sgt);
>   out_free_iova:
> @@ -989,18 +998,7 @@ static void *iommu_dma_alloc(struct device *dev, size_t size,
>   						    size >> PAGE_SHIFT);
>   		}
>   	} else {
> -		pgprot_t prot = arch_dma_mmap_pgprot(dev, PAGE_KERNEL, attrs);
> -		struct page **pages;
> -
> -		pages = __iommu_dma_alloc(dev, iosize, gfp, attrs, ioprot,
> -					handle);
> -		if (!pages)
> -			return NULL;
> -
> -		addr = dma_common_pages_remap(pages, size, VM_USERMAP, prot,
> -					      __builtin_return_address(0));
> -		if (!addr)
> -			__iommu_dma_free(dev, pages, iosize, handle);
> +		addr = iommu_dma_alloc_remap(dev, iosize, handle, gfp, attrs);
>   	}
>   	return addr;
>   }
> @@ -1014,7 +1012,7 @@ static void iommu_dma_free(struct device *dev, size_t size, void *cpu_addr,
>   	/*
>   	 * @cpu_addr will be one of 4 things depending on how it was allocated:
>   	 * - A remapped array of pages for contiguous allocations.
> -	 * - A remapped array of pages from __iommu_dma_alloc(), for all
> +	 * - A remapped array of pages from iommu_dma_alloc_remap(), for all
>   	 *   non-atomic allocations.
>   	 * - A non-cacheable alias from the atomic pool, for atomic
>   	 *   allocations by non-coherent devices.
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
