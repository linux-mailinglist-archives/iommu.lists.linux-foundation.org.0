Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C863E32A0
	for <lists.iommu@lfdr.de>; Thu, 24 Oct 2019 14:43:36 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 08D77153A;
	Thu, 24 Oct 2019 12:43:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id DE1871532
	for <iommu@lists.linux-foundation.org>;
	Thu, 24 Oct 2019 12:43:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (unknown [217.140.110.172])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 6165989B
	for <iommu@lists.linux-foundation.org>;
	Thu, 24 Oct 2019 12:43:30 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 02E80D75;
	Thu, 24 Oct 2019 05:43:22 -0700 (PDT)
Received: from [10.1.38.214] (e121487-lin.cambridge.arm.com [10.1.38.214])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 119983F71A;
	Thu, 24 Oct 2019 05:43:20 -0700 (PDT)
Subject: Re: [BUG] dma-ranges, reserved memory regions, dma_alloc_coherent:
	possible bug?
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: Robin Murphy <robin.murphy@arm.com>,
	Daniele Alessandrelli <daniele.alessandrelli@gmail.com>,
	Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>
References: <CAA2QUqLv+eLXuA_TdJ7zM4oBnGoFVOjRjAimuct2y=0MDuaZVQ@mail.gmail.com>
	<d983cf57-f13d-a680-21c4-09b5ca93bc64@arm.com>
	<acf0dd2c-7e12-fba6-b7f8-dfd78c892fe5@arm.com>
	<417fa080-08f9-9f35-687b-c0b82a61628d@arm.com>
Message-ID: <376133e3-25f2-ffe7-ef9f-4613388b2bf7@arm.com>
Date: Thu, 24 Oct 2019 13:43:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <417fa080-08f9-9f35-687b-c0b82a61628d@arm.com>
Content-Language: en-US
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: iommu@lists.linux-foundation.org, alexandre.torgue@st.com,
	Arnd Bergmann <arnd@arndb.de>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On 10/17/19 10:46 AM, Vladimir Murzin wrote:
> I'm wondering if I've missed something with diff bellow (it was a long time ago when I touched DMA)?

Any comments on that? I can only build test it, so lack of testing stopping me from sending it as a
proper patch :(

> 
> diff --git a/arch/arm/mm/dma-mapping-nommu.c b/arch/arm/mm/dma-mapping-nommu.c
> index db92478..287ef89 100644
> --- a/arch/arm/mm/dma-mapping-nommu.c
> +++ b/arch/arm/mm/dma-mapping-nommu.c
> @@ -35,7 +35,7 @@ static void *arm_nommu_dma_alloc(struct device *dev, size_t size,
>  				 unsigned long attrs)
>  
>  {
> -	void *ret = dma_alloc_from_global_coherent(size, dma_handle);
> +	void *ret = dma_alloc_from_global_coherent(dev, size, dma_handle);
>  
>  	/*
>  	 * dma_alloc_from_global_coherent() may fail because:
> diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
> index 4a1c4fc..10918c5 100644
> --- a/include/linux/dma-mapping.h
> +++ b/include/linux/dma-mapping.h
> @@ -162,7 +162,7 @@ int dma_release_from_dev_coherent(struct device *dev, int order, void *vaddr);
>  int dma_mmap_from_dev_coherent(struct device *dev, struct vm_area_struct *vma,
>  			    void *cpu_addr, size_t size, int *ret);
>  
> -void *dma_alloc_from_global_coherent(ssize_t size, dma_addr_t *dma_handle);
> +void *dma_alloc_from_global_coherent(struct device *dev, ssize_t size, dma_addr_t *dma_handle);
>  int dma_release_from_global_coherent(int order, void *vaddr);
>  int dma_mmap_from_global_coherent(struct vm_area_struct *vma, void *cpu_addr,
>  				  size_t size, int *ret);
> @@ -172,7 +172,7 @@ int dma_mmap_from_global_coherent(struct vm_area_struct *vma, void *cpu_addr,
>  #define dma_release_from_dev_coherent(dev, order, vaddr) (0)
>  #define dma_mmap_from_dev_coherent(dev, vma, vaddr, order, ret) (0)
>  
> -static inline void *dma_alloc_from_global_coherent(ssize_t size,
> +static inline void *dma_alloc_from_global_coherent(struct device *dev, ssize_t size,
>  						   dma_addr_t *dma_handle)
>  {
>  	return NULL;
> diff --git a/kernel/dma/coherent.c b/kernel/dma/coherent.c
> index 545e386..551b0eb 100644
> --- a/kernel/dma/coherent.c
> +++ b/kernel/dma/coherent.c
> @@ -123,8 +123,9 @@ int dma_declare_coherent_memory(struct device *dev, phys_addr_t phys_addr,
>  	return ret;
>  }
>  
> -static void *__dma_alloc_from_coherent(struct dma_coherent_mem *mem,
> -		ssize_t size, dma_addr_t *dma_handle)
> +static void *__dma_alloc_from_coherent(struct device *dev,
> +				       struct dma_coherent_mem *mem,
> +				       ssize_t size, dma_addr_t *dma_handle)
>  {
>  	int order = get_order(size);
>  	unsigned long flags;
> @@ -143,7 +144,7 @@ static void *__dma_alloc_from_coherent(struct dma_coherent_mem *mem,
>  	/*
>  	 * Memory was found in the coherent area.
>  	 */
> -	*dma_handle = mem->device_base + (pageno << PAGE_SHIFT);
> +	*dma_handle = dma_get_device_base(dev, mem) + (pageno << PAGE_SHIFT);
>  	ret = mem->virt_base + (pageno << PAGE_SHIFT);
>  	spin_unlock_irqrestore(&mem->spinlock, flags);
>  	memset(ret, 0, size);
> @@ -175,17 +176,18 @@ int dma_alloc_from_dev_coherent(struct device *dev, ssize_t size,
>  	if (!mem)
>  		return 0;
>  
> -	*ret = __dma_alloc_from_coherent(mem, size, dma_handle);
> +	*ret = __dma_alloc_from_coherent(dev, mem, size, dma_handle);
>  	return 1;
>  }
>  
> -void *dma_alloc_from_global_coherent(ssize_t size, dma_addr_t *dma_handle)
> +void *dma_alloc_from_global_coherent(struct device *dev, ssize_t size,
> +				     dma_addr_t *dma_handle)
>  {
>  	if (!dma_coherent_default_memory)
>  		return NULL;
>  
> -	return __dma_alloc_from_coherent(dma_coherent_default_memory, size,
> -			dma_handle);
> +	return __dma_alloc_from_coherent(dev, dma_coherent_default_memory, size,
> +					 dma_handle);
>  }
>  
>  static int __dma_release_from_coherent(struct dma_coherent_mem *mem,


Thanks
Vladimir
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
