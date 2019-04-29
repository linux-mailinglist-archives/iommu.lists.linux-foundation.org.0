Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CDBE469
	for <lists.iommu@lfdr.de>; Mon, 29 Apr 2019 16:14:43 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 3D4562191;
	Mon, 29 Apr 2019 14:14:42 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 4F45C1E8E
	for <iommu@lists.linux-foundation.org>;
	Mon, 29 Apr 2019 14:11:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id C9F3A875
	for <iommu@lists.linux-foundation.org>;
	Mon, 29 Apr 2019 14:11:39 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9284FA78;
	Mon, 29 Apr 2019 07:11:39 -0700 (PDT)
Received: from [10.1.196.75] (e110467-lin.cambridge.arm.com [10.1.196.75])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2B8C23F5C1;
	Mon, 29 Apr 2019 07:11:38 -0700 (PDT)
Subject: Re: [PATCH 19/26] iommu/dma: Cleanup variable naming in
	iommu_dma_alloc
To: Christoph Hellwig <hch@lst.de>
References: <20190422175942.18788-1-hch@lst.de>
	<20190422175942.18788-20-hch@lst.de>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <49314f40-0676-629c-379f-fc05e75fb078@arm.com>
Date: Mon, 29 Apr 2019 15:11:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190422175942.18788-20-hch@lst.de>
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
> From: Robin Murphy <robin.murphy@arm.com>
> 
> Most importantly clear up the size / iosize confusion.  Also rename addr
> to cpu_addr to match the surrounding code and make the intention a little
> more clear.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> [hch: split from a larger patch]

I can't bring myself to actually ack "my" patch, but I am perfectly 
happy with the split :)

Robin.

> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   drivers/iommu/dma-iommu.c | 45 +++++++++++++++++++--------------------
>   1 file changed, 22 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
> index 95a12e975994..9b269f0792f3 100644
> --- a/drivers/iommu/dma-iommu.c
> +++ b/drivers/iommu/dma-iommu.c
> @@ -960,64 +960,63 @@ static void *iommu_dma_alloc(struct device *dev, size_t size,
>   {
>   	bool coherent = dev_is_dma_coherent(dev);
>   	int ioprot = dma_info_to_prot(DMA_BIDIRECTIONAL, coherent, attrs);
> -	size_t iosize = size;
> +	size_t alloc_size = PAGE_ALIGN(size);
>   	struct page *page = NULL;
> -	void *addr;
> +	void *cpu_addr;
>   
> -	size = PAGE_ALIGN(size);
>   	gfp |= __GFP_ZERO;
>   
>   	if (gfpflags_allow_blocking(gfp) &&
>   	    !(attrs & DMA_ATTR_FORCE_CONTIGUOUS))
> -		return iommu_dma_alloc_remap(dev, iosize, handle, gfp, attrs);
> +		return iommu_dma_alloc_remap(dev, size, handle, gfp, attrs);
>   
>   	if (!gfpflags_allow_blocking(gfp) && !coherent) {
> -		addr = dma_alloc_from_pool(size, &page, gfp);
> -		if (!addr)
> +		cpu_addr = dma_alloc_from_pool(alloc_size, &page, gfp);
> +		if (!cpu_addr)
>   			return NULL;
>   
> -		*handle = __iommu_dma_map(dev, page_to_phys(page), iosize,
> +		*handle = __iommu_dma_map(dev, page_to_phys(page), size,
>   					  ioprot);
>   		if (*handle == DMA_MAPPING_ERROR) {
> -			dma_free_from_pool(addr, size);
> +			dma_free_from_pool(cpu_addr, alloc_size);
>   			return NULL;
>   		}
> -		return addr;
> +		return cpu_addr;
>   	}
>   
>   	if (gfpflags_allow_blocking(gfp))
> -		page = dma_alloc_from_contiguous(dev, size >> PAGE_SHIFT,
> -						 get_order(size),
> +		page = dma_alloc_from_contiguous(dev, alloc_size >> PAGE_SHIFT,
> +						 get_order(alloc_size),
>   						 gfp & __GFP_NOWARN);
>   	if (!page)
> -		page = alloc_pages(gfp, get_order(size));
> +		page = alloc_pages(gfp, get_order(alloc_size));
>   	if (!page)
>   		return NULL;
>   
> -	*handle = __iommu_dma_map(dev, page_to_phys(page), iosize, ioprot);
> +	*handle = __iommu_dma_map(dev, page_to_phys(page), size, ioprot);
>   	if (*handle == DMA_MAPPING_ERROR)
>   		goto out_free_pages;
>   
>   	if (!coherent || PageHighMem(page)) {
>   		pgprot_t prot = arch_dma_mmap_pgprot(dev, PAGE_KERNEL, attrs);
>   
> -		addr = dma_common_contiguous_remap(page, size, VM_USERMAP, prot,
> -				__builtin_return_address(0));
> -		if (!addr)
> +		cpu_addr = dma_common_contiguous_remap(page, alloc_size,
> +				VM_USERMAP, prot, __builtin_return_address(0));
> +		if (!cpu_addr)
>   			goto out_unmap;
>   
>   		if (!coherent)
> -			arch_dma_prep_coherent(page, iosize);
> +			arch_dma_prep_coherent(page, size);
>   	} else {
> -		addr = page_address(page);
> +		cpu_addr = page_address(page);
>   	}
> -	memset(addr, 0, size);
> -	return addr;
> +	memset(cpu_addr, 0, alloc_size);
> +	return cpu_addr;
>   out_unmap:
> -	__iommu_dma_unmap(dev, *handle, iosize);
> +	__iommu_dma_unmap(dev, *handle, size);
>   out_free_pages:
> -	if (!dma_release_from_contiguous(dev, page, size >> PAGE_SHIFT))
> -		__free_pages(page, get_order(size));
> +	if (!dma_release_from_contiguous(dev, page, alloc_size >> PAGE_SHIFT))
> +		__free_pages(page, get_order(alloc_size));
>   	return NULL;
>   }
>   
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
