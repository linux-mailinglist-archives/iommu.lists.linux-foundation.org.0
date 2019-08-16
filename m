Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E65F090334
	for <lists.iommu@lfdr.de>; Fri, 16 Aug 2019 15:38:08 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 84BCBC9F;
	Fri, 16 Aug 2019 13:38:04 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 07C15C6D
	for <iommu@lists.linux-foundation.org>;
	Fri, 16 Aug 2019 13:38:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id D7DC48A0
	for <iommu@lists.linux-foundation.org>;
	Fri, 16 Aug 2019 13:38:01 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E95ED344;
	Fri, 16 Aug 2019 06:38:00 -0700 (PDT)
Received: from [10.1.197.57] (e110467-lin.cambridge.arm.com [10.1.197.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DEF273F694;
	Fri, 16 Aug 2019 06:37:59 -0700 (PDT)
Subject: Re: [PATCH 03/11] xen/arm: pass one less argument to dma_cache_maint
To: Christoph Hellwig <hch@lst.de>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
References: <20190816130013.31154-1-hch@lst.de>
	<20190816130013.31154-4-hch@lst.de>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <8585fb27-14e0-888c-6749-6862b4e16418@arm.com>
Date: Fri, 16 Aug 2019 14:37:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190816130013.31154-4-hch@lst.de>
Content-Language: en-GB
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: xen-devel@lists.xenproject.org, iommu@lists.linux-foundation.org,
	x86@kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
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

On 16/08/2019 14:00, Christoph Hellwig wrote:
> Instead of taking apart the dma address in both callers do it inside
> dma_cache_maint itself.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   arch/arm/xen/mm.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/xen/mm.c b/arch/arm/xen/mm.c
> index 90574d89d0d4..d9da24fda2f7 100644
> --- a/arch/arm/xen/mm.c
> +++ b/arch/arm/xen/mm.c
> @@ -43,13 +43,15 @@ static bool hypercall_cflush = false;
>   
>   /* functions called by SWIOTLB */
>   
> -static void dma_cache_maint(dma_addr_t handle, unsigned long offset,
> -	size_t size, enum dma_data_direction dir, enum dma_cache_op op)
> +static void dma_cache_maint(dma_addr_t handle, size_t size,
> +		enum dma_data_direction dir, enum dma_cache_op op)
>   {
>   	struct gnttab_cache_flush cflush;
>   	unsigned long xen_pfn;
> +	unsigned long offset = handle & ~PAGE_MASK;
>   	size_t left = size;
>   
> +	offset &= PAGE_MASK;

Ahem... presumably that should be handle, not offset.

Robin.

>   	xen_pfn = (handle >> XEN_PAGE_SHIFT) + offset / XEN_PAGE_SIZE;
>   	offset %= XEN_PAGE_SIZE;
>   
> @@ -86,13 +88,13 @@ static void dma_cache_maint(dma_addr_t handle, unsigned long offset,
>   static void __xen_dma_page_dev_to_cpu(struct device *hwdev, dma_addr_t handle,
>   		size_t size, enum dma_data_direction dir)
>   {
> -	dma_cache_maint(handle & PAGE_MASK, handle & ~PAGE_MASK, size, dir, DMA_UNMAP);
> +	dma_cache_maint(handle, size, dir, DMA_UNMAP);
>   }
>   
>   static void __xen_dma_page_cpu_to_dev(struct device *hwdev, dma_addr_t handle,
>   		size_t size, enum dma_data_direction dir)
>   {
> -	dma_cache_maint(handle & PAGE_MASK, handle & ~PAGE_MASK, size, dir, DMA_MAP);
> +	dma_cache_maint(handle, size, dir, DMA_MAP);
>   }
>   
>   void __xen_dma_map_page(struct device *hwdev, struct page *page,
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
