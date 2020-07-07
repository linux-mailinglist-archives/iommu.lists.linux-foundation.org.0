Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id E5644218245
	for <lists.iommu@lfdr.de>; Wed,  8 Jul 2020 10:28:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A374489663;
	Wed,  8 Jul 2020 08:28:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cnHcEfJYuLQw; Wed,  8 Jul 2020 08:28:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0F90E886B9;
	Wed,  8 Jul 2020 08:28:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E31F9C016F;
	Wed,  8 Jul 2020 08:28:29 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 42FF0C016F
 for <iommu@lists.linux-foundation.org>; Tue,  7 Jul 2020 22:08:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 3D746204D8
 for <iommu@lists.linux-foundation.org>; Tue,  7 Jul 2020 22:08:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HQO7sn0PAVZT for <iommu@lists.linux-foundation.org>;
 Tue,  7 Jul 2020 22:08:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by silver.osuosl.org (Postfix) with ESMTP id C213B204B8
 for <iommu@lists.linux-foundation.org>; Tue,  7 Jul 2020 22:08:57 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0984D1FB;
 Tue,  7 Jul 2020 15:08:57 -0700 (PDT)
Received: from [192.168.122.166] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9BEBD3F68F;
 Tue,  7 Jul 2020 15:08:56 -0700 (PDT)
Subject: Re: [PATCH] dma-pool: use single atomic pool for both DMA zones
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, David Rientjes <rientjes@google.com>
References: <20200707122804.21262-1-nsaenzjulienne@suse.de>
From: Jeremy Linton <jeremy.linton@arm.com>
Message-ID: <e6504dc5-4169-edf9-d08e-17a378a1ef7a@arm.com>
Date: Tue, 7 Jul 2020 17:08:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200707122804.21262-1-nsaenzjulienne@suse.de>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 08 Jul 2020 08:28:28 +0000
Cc: iommu@lists.linux-foundation.org, linux-rpi-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
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

Hi,

I spun this up on my 8G model using the PFTF firmware from:

https://github.com/pftf/RPi4/releases

Which allows me to switch between ACPI/DT on the machine. In DT mode it 
works fine now, but with ACPI I continue to have failures unless I 
disable CMA via cma=0 on the kernel command line. It think that is because

using DT:

[    0.000000] Reserved memory: created CMA memory pool at
0x0000000037400000, size 64 MiB


using ACPI:
[    0.000000] cma: Reserved 64 MiB at 0x00000000f8000000

Which is AFAIK because the default arm64 CMA allocation is just below 
the arm64_dma32_phys_limit.


Thanks,



On 7/7/20 7:28 AM, Nicolas Saenz Julienne wrote:
> When allocating atomic DMA memory for a device, the dma-pool core
> queries __dma_direct_optimal_gfp_mask() to check which atomic pool to
> use. It turns out the GFP flag returned is only an optimistic guess.
> The pool selected might sometimes live in a zone higher than the
> device's view of memory.
> 
> As there isn't a way to grantee a mapping between a device's DMA
> constraints and correct GFP flags this unifies both DMA atomic pools.
> The resulting pool is allocated in the lower DMA zone available, if any,
> so as for devices to always get accessible memory while having the
> flexibility of using dma_pool_kernel for the non constrained ones.
> 
> Fixes: c84dc6e68a1d ("dma-pool: add additional coherent pools to map to gfp mask")
> Reported-by: Jeremy Linton <jeremy.linton@arm.com>
> Suggested-by: Robin Murphy <robin.murphy@arm.com>
> Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> ---
>   kernel/dma/pool.c | 47 +++++++++++++++++++----------------------------
>   1 file changed, 19 insertions(+), 28 deletions(-)
> 
> diff --git a/kernel/dma/pool.c b/kernel/dma/pool.c
> index 8cfa01243ed2..883f7a583969 100644
> --- a/kernel/dma/pool.c
> +++ b/kernel/dma/pool.c
> @@ -13,10 +13,11 @@
>   #include <linux/slab.h>
>   #include <linux/workqueue.h>
>   
> +#define GFP_ATOMIC_POOL_DMA	(IS_ENABLED(CONFIG_ZONE_DMA) ? GFP_DMA : \
> +				 IS_ENABLED(CONFIG_ZONE_DMA32) ? GFP_DMA32 : 0)
> +
>   static struct gen_pool *atomic_pool_dma __ro_after_init;
>   static unsigned long pool_size_dma;
> -static struct gen_pool *atomic_pool_dma32 __ro_after_init;
> -static unsigned long pool_size_dma32;
>   static struct gen_pool *atomic_pool_kernel __ro_after_init;
>   static unsigned long pool_size_kernel;
>   
> @@ -42,16 +43,13 @@ static void __init dma_atomic_pool_debugfs_init(void)
>   		return;
>   
>   	debugfs_create_ulong("pool_size_dma", 0400, root, &pool_size_dma);
> -	debugfs_create_ulong("pool_size_dma32", 0400, root, &pool_size_dma32);
>   	debugfs_create_ulong("pool_size_kernel", 0400, root, &pool_size_kernel);
>   }
>   
>   static void dma_atomic_pool_size_add(gfp_t gfp, size_t size)
>   {
> -	if (gfp & __GFP_DMA)
> +	if (gfp & GFP_ATOMIC_POOL_DMA)
>   		pool_size_dma += size;
> -	else if (gfp & __GFP_DMA32)
> -		pool_size_dma32 += size;
>   	else
>   		pool_size_kernel += size;
>   }
> @@ -132,12 +130,11 @@ static void atomic_pool_resize(struct gen_pool *pool, gfp_t gfp)
>   
>   static void atomic_pool_work_fn(struct work_struct *work)
>   {
> -	if (IS_ENABLED(CONFIG_ZONE_DMA))
> -		atomic_pool_resize(atomic_pool_dma,
> -				   GFP_KERNEL | GFP_DMA);
> -	if (IS_ENABLED(CONFIG_ZONE_DMA32))
> -		atomic_pool_resize(atomic_pool_dma32,
> -				   GFP_KERNEL | GFP_DMA32);
> +	gfp_t dma_gfp = GFP_ATOMIC_POOL_DMA;
> +
> +	if (dma_gfp)
> +		atomic_pool_resize(atomic_pool_dma, GFP_KERNEL | dma_gfp);
> +
>   	atomic_pool_resize(atomic_pool_kernel, GFP_KERNEL);
>   }
>   
> @@ -168,6 +165,7 @@ static __init struct gen_pool *__dma_atomic_pool_init(size_t pool_size,
>   
>   static int __init dma_atomic_pool_init(void)
>   {
> +	gfp_t dma_gfp = GFP_ATOMIC_POOL_DMA;
>   	int ret = 0;
>   
>   	/*
> @@ -185,18 +183,13 @@ static int __init dma_atomic_pool_init(void)
>   						    GFP_KERNEL);
>   	if (!atomic_pool_kernel)
>   		ret = -ENOMEM;
> -	if (IS_ENABLED(CONFIG_ZONE_DMA)) {
> +
> +	if (dma_gfp) {
>   		atomic_pool_dma = __dma_atomic_pool_init(atomic_pool_size,
> -						GFP_KERNEL | GFP_DMA);
> +							 GFP_KERNEL | dma_gfp);
>   		if (!atomic_pool_dma)
>   			ret = -ENOMEM;
>   	}
> -	if (IS_ENABLED(CONFIG_ZONE_DMA32)) {
> -		atomic_pool_dma32 = __dma_atomic_pool_init(atomic_pool_size,
> -						GFP_KERNEL | GFP_DMA32);
> -		if (!atomic_pool_dma32)
> -			ret = -ENOMEM;
> -	}
>   
>   	dma_atomic_pool_debugfs_init();
>   	return ret;
> @@ -206,14 +199,12 @@ postcore_initcall(dma_atomic_pool_init);
>   static inline struct gen_pool *dev_to_pool(struct device *dev)
>   {
>   	u64 phys_mask;
> -	gfp_t gfp;
> -
> -	gfp = dma_direct_optimal_gfp_mask(dev, dev->coherent_dma_mask,
> -					  &phys_mask);
> -	if (IS_ENABLED(CONFIG_ZONE_DMA) && gfp == GFP_DMA)
> -		return atomic_pool_dma;
> -	if (IS_ENABLED(CONFIG_ZONE_DMA32) && gfp == GFP_DMA32)
> -		return atomic_pool_dma32;
> +
> +	if (atomic_pool_dma &&
> +	    dma_direct_optimal_gfp_mask(dev, dev->coherent_dma_mask,
> +					&phys_mask))
> +			return atomic_pool_dma;
> +
>   	return atomic_pool_kernel;
>   }
>   
> 

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
