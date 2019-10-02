Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF1AC935D
	for <lists.iommu@lfdr.de>; Wed,  2 Oct 2019 23:16:06 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 2D39A16B2;
	Wed,  2 Oct 2019 21:16:02 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 52B5016AD
	for <iommu@lists.linux-foundation.org>;
	Wed,  2 Oct 2019 21:16:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id B3979189
	for <iommu@lists.linux-foundation.org>;
	Wed,  2 Oct 2019 21:16:00 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 10C1D1000;
	Wed,  2 Oct 2019 14:16:00 -0700 (PDT)
Received: from [192.168.1.124] (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 243E53F534;
	Wed,  2 Oct 2019 14:15:58 -0700 (PDT)
Subject: Re: [PATCH] dma-mapping: Lift address space checks out of debug code
To: Kees Cook <keescook@chromium.org>, Christoph Hellwig <hch@lst.de>
References: <201910021341.7819A660@keescook>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <7a5dc7aa-66ec-0249-e73f-285b8807cb73@arm.com>
Date: Wed, 2 Oct 2019 22:15:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
	Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <201910021341.7819A660@keescook>
Content-Language: en-GB
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
	iommu@lists.linux-foundation.org,
	Semmle Security Reports <security-reports@semmle.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Jesper Dangaard Brouer <brouer@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>, Laura Abbott <labbott@redhat.com>,
	Allison Randal <allison@lohutok.net>
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

Hi Kees,

On 2019-10-02 9:46 pm, Kees Cook wrote:
> As we've seen from USB and other areas, we need to always do runtime
> checks for DMA operating on memory regions that might be remapped. This
> consolidates the (existing!) checks and makes them on by default. A
> warning will be triggered for any drivers still using DMA on the stack
> (as has been seen in a few recent reports).
> 
> Suggested-by: Laura Abbott <labbott@redhat.com>
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>   include/linux/dma-debug.h   |  8 --------
>   include/linux/dma-mapping.h |  8 +++++++-
>   kernel/dma/debug.c          | 16 ----------------
>   3 files changed, 7 insertions(+), 25 deletions(-)
> 
> diff --git a/include/linux/dma-debug.h b/include/linux/dma-debug.h
> index 4208f94d93f7..2af9765d9af7 100644
> --- a/include/linux/dma-debug.h
> +++ b/include/linux/dma-debug.h
> @@ -18,9 +18,6 @@ struct bus_type;
>   
>   extern void dma_debug_add_bus(struct bus_type *bus);
>   
> -extern void debug_dma_map_single(struct device *dev, const void *addr,
> -				 unsigned long len);
> -
>   extern void debug_dma_map_page(struct device *dev, struct page *page,
>   			       size_t offset, size_t size,
>   			       int direction, dma_addr_t dma_addr);
> @@ -75,11 +72,6 @@ static inline void dma_debug_add_bus(struct bus_type *bus)
>   {
>   }
>   
> -static inline void debug_dma_map_single(struct device *dev, const void *addr,
> -					unsigned long len)
> -{
> -}
> -
>   static inline void debug_dma_map_page(struct device *dev, struct page *page,
>   				      size_t offset, size_t size,
>   				      int direction, dma_addr_t dma_addr)
> diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
> index 4a1c4fca475a..2d6b8382eab1 100644
> --- a/include/linux/dma-mapping.h
> +++ b/include/linux/dma-mapping.h
> @@ -583,7 +583,13 @@ static inline unsigned long dma_get_merge_boundary(struct device *dev)
>   static inline dma_addr_t dma_map_single_attrs(struct device *dev, void *ptr,
>   		size_t size, enum dma_data_direction dir, unsigned long attrs)
>   {
> -	debug_dma_map_single(dev, ptr, size);
> +	/* DMA must never operate on stack or other remappable places. */
> +	WARN_ONCE(is_vmalloc_addr(ptr) || !virt_addr_valid(ptr),

This stands to absolutely cripple I/O performance on arm64, because 
every valid call will end up going off and scanning the memblock list, 
which is not something we want on a fastpath in non-debug 
configurations. We'd need a much better solution to the "pfn_valid() vs. 
EFI no-map" problem before this might be viable.

Robin.

> +		"%s %s: driver maps %lu bytes from %s area\n",
> +		dev ? dev_driver_string(dev) : "unknown driver",
> +		dev ? dev_name(dev) : "unknown device", size,
> +		is_vmalloc_addr(ptr) ? "vmalloc" : "invalid");
> +
>   	return dma_map_page_attrs(dev, virt_to_page(ptr), offset_in_page(ptr),
>   			size, dir, attrs);
>   }
> diff --git a/kernel/dma/debug.c b/kernel/dma/debug.c
> index 099002d84f46..aa1e6a1990b2 100644
> --- a/kernel/dma/debug.c
> +++ b/kernel/dma/debug.c
> @@ -1232,22 +1232,6 @@ static void check_sg_segment(struct device *dev, struct scatterlist *sg)
>   #endif
>   }
>   
> -void debug_dma_map_single(struct device *dev, const void *addr,
> -			    unsigned long len)
> -{
> -	if (unlikely(dma_debug_disabled()))
> -		return;
> -
> -	if (!virt_addr_valid(addr))
> -		err_printk(dev, NULL, "device driver maps memory from invalid area [addr=%p] [len=%lu]\n",
> -			   addr, len);
> -
> -	if (is_vmalloc_addr(addr))
> -		err_printk(dev, NULL, "device driver maps memory from vmalloc area [addr=%p] [len=%lu]\n",
> -			   addr, len);
> -}
> -EXPORT_SYMBOL(debug_dma_map_single);
> -
>   void debug_dma_map_page(struct device *dev, struct page *page, size_t offset,
>   			size_t size, int direction, dma_addr_t dma_addr)
>   {
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
