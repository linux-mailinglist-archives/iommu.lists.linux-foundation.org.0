Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAED21BD36
	for <lists.iommu@lfdr.de>; Fri, 10 Jul 2020 20:53:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 67FF1858DA;
	Fri, 10 Jul 2020 18:52:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c95T8RsuzbKO; Fri, 10 Jul 2020 18:52:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7368E858C9;
	Fri, 10 Jul 2020 18:52:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5F30EC016F;
	Fri, 10 Jul 2020 18:52:35 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A2A95C016F
 for <iommu@lists.linux-foundation.org>; Fri, 10 Jul 2020 18:52:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 3D51188055
 for <iommu@lists.linux-foundation.org>; Fri, 10 Jul 2020 18:51:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eXiyo9WxLEHw for <iommu@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 18:51:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by hemlock.osuosl.org (Postfix) with ESMTP id 242E487FD8
 for <iommu@lists.linux-foundation.org>; Fri, 10 Jul 2020 18:51:49 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1E18E31B;
 Fri, 10 Jul 2020 11:51:48 -0700 (PDT)
Received: from [192.168.122.166] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A175B3FA00;
 Fri, 10 Jul 2020 11:51:47 -0700 (PDT)
Subject: Re: [PATCH] dma-pool: Only allocate from CMA when in same memory zone
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>, hch@lst.de,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, David Rientjes <rientjes@google.com>
References: <20200710141016.15495-1-nsaenzjulienne@suse.de>
From: Jeremy Linton <jeremy.linton@arm.com>
Message-ID: <c7c24764-1014-ec81-e7fe-af0a0ac72ef9@arm.com>
Date: Fri, 10 Jul 2020 13:51:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200710141016.15495-1-nsaenzjulienne@suse.de>
Content-Language: en-US
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


I have merged this to a 5.8 tree along with "dma-pool: Fix atomic pool 
selection" and tested it in various ACPI/DT combinations, particularly 
on the RPI4. It seems to be working fine.

So thanks for your time and effort clearing this up!

tested-by: Jeremy Linton <jeremy.linton@arm.com>



On 7/10/20 9:10 AM, Nicolas Saenz Julienne wrote:
> There is no guarantee to CMA's placement, so allocating a zone specific
> atomic pool from CMA might return memory from a completely different
> memory zone. To get around this double check CMA's placement before
> allocating from it.
> 
> Fixes: c84dc6e68a1d ("dma-pool: add additional coherent pools to map to gfp mask")
> Reported-by: Jeremy Linton <jeremy.linton@arm.com>
> Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> ---
> 
> This is a code intensive alternative to "dma-pool: Do not allocate pool
> memory from CMA"[1].
> 
> [1] https://lkml.org/lkml/2020/7/8/1108
> 
>   kernel/dma/pool.c | 36 +++++++++++++++++++++++++++++++++++-
>   1 file changed, 35 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/dma/pool.c b/kernel/dma/pool.c
> index 8cfa01243ed2..ccf3eeb77e00 100644
> --- a/kernel/dma/pool.c
> +++ b/kernel/dma/pool.c
> @@ -3,6 +3,7 @@
>    * Copyright (C) 2012 ARM Ltd.
>    * Copyright (C) 2020 Google LLC
>    */
> +#include <linux/cma.h>
>   #include <linux/debugfs.h>
>   #include <linux/dma-direct.h>
>   #include <linux/dma-noncoherent.h>
> @@ -56,6 +57,39 @@ static void dma_atomic_pool_size_add(gfp_t gfp, size_t size)
>   		pool_size_kernel += size;
>   }
>   
> +static bool cma_in_zone(gfp_t gfp)
> +{
> +	u64 zone_dma_end, zone_dma32_end;
> +	phys_addr_t base, end;
> +	unsigned long size;
> +	struct cma *cma;
> +
> +	cma = dev_get_cma_area(NULL);
> +	if (!cma)
> +		return false;
> +
> +	size = cma_get_size(cma);
> +	if (!size)
> +		return false;
> +	base = cma_get_base(cma) - memblock_start_of_DRAM();
> +	end = base + size - 1;
> +
> +	zone_dma_end = IS_ENABLED(CONFIG_ZONE_DMA) ? DMA_BIT_MASK(zone_dma_bits) : 0;
> +	zone_dma32_end = IS_ENABLED(CONFIG_ZONE_DMA32) ? DMA_BIT_MASK(32) : 0;
> +
> +	/* CMA can't cross zone boundaries, see cma_activate_area() */
> +	if (IS_ENABLED(CONFIG_ZONE_DMA) && gfp & GFP_DMA &&
> +	   end <= zone_dma_end)
> +		return true;
> +	else if (IS_ENABLED(CONFIG_ZONE_DMA32) && gfp & GFP_DMA32 &&
> +		base > zone_dma_end && end <= zone_dma32_end)
> +		return true;
> +	else if (base > zone_dma32_end)
> +		return true;
> +
> +	return false;
> +}
> +
>   static int atomic_pool_expand(struct gen_pool *pool, size_t pool_size,
>   			      gfp_t gfp)
>   {
> @@ -70,7 +104,7 @@ static int atomic_pool_expand(struct gen_pool *pool, size_t pool_size,
>   	do {
>   		pool_size = 1 << (PAGE_SHIFT + order);
>   
> -		if (dev_get_cma_area(NULL))
> +		if (cma_in_zone(gfp))
>   			page = dma_alloc_from_contiguous(NULL, 1 << order,
>   							 order, false);
>   		else
> 

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
