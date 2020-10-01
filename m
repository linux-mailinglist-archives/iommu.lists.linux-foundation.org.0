Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3CC2804FD
	for <lists.iommu@lfdr.de>; Thu,  1 Oct 2020 19:19:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4F91A8735C;
	Thu,  1 Oct 2020 17:19:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yBW3k4R5ENjb; Thu,  1 Oct 2020 17:19:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id BA5AE87359;
	Thu,  1 Oct 2020 17:19:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9D729C0051;
	Thu,  1 Oct 2020 17:19:29 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0BE49C0051
 for <iommu@lists.linux-foundation.org>; Thu,  1 Oct 2020 17:19:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id D8432229D4
 for <iommu@lists.linux-foundation.org>; Thu,  1 Oct 2020 17:19:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gyaN2Ysj0dZW for <iommu@lists.linux-foundation.org>;
 Thu,  1 Oct 2020 17:19:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 0B02B226F3
 for <iommu@lists.linux-foundation.org>; Thu,  1 Oct 2020 17:19:27 +0000 (UTC)
Received: from gaia (unknown [31.124.44.166])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 069D92085B;
 Thu,  1 Oct 2020 17:19:24 +0000 (UTC)
Date: Thu, 1 Oct 2020 18:19:22 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: Re: [PATCH 3/4] arm64: Default to 32-bit ZONE_DMA
Message-ID: <20201001171922.GO21544@gaia>
References: <20201001161740.29064-1-nsaenzjulienne@suse.de>
 <20201001161740.29064-4-nsaenzjulienne@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201001161740.29064-4-nsaenzjulienne@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, will@kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, iommu@lists.linux-foundation.org, robh+dt@kernel.org,
 linux-rpi-kernel@lists.infradead.org, robin.murphy@arm.com, hch@lst.de,
 linux-arm-kernel@lists.infradead.org
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

On Thu, Oct 01, 2020 at 06:17:39PM +0200, Nicolas Saenz Julienne wrote:
> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> index e1a69a618832..3c3f462466eb 100644
> --- a/arch/arm64/mm/init.c
> +++ b/arch/arm64/mm/init.c
> @@ -43,8 +43,6 @@
>  #include <asm/tlb.h>
>  #include <asm/alternative.h>
>  
> -#define ARM64_ZONE_DMA_BITS	30
> -
>  /*
>   * We need to be able to catch inadvertent references to memstart_addr
>   * that occur (potentially in generic code) before arm64_memblock_init()
> @@ -388,8 +386,14 @@ void __init arm64_memblock_init(void)
>  	early_init_fdt_scan_reserved_mem();
>  
>  	if (IS_ENABLED(CONFIG_ZONE_DMA)) {
> -		zone_dma_bits = ARM64_ZONE_DMA_BITS;
> -		arm64_dma_phys_limit = max_zone_phys(ARM64_ZONE_DMA_BITS);
> +		/*
> +		 * early_init_dt_scan() might alter zone_dma_bits based on the
> +		 * device's DT. Otherwise, have it cover the 32-bit address
> +		 * space.
> +		 */
> +		if (zone_dma_bits == ZONE_DMA_BITS_DEFAULT)
> +			zone_dma_bits = 32;
> +		arm64_dma_phys_limit = max_zone_phys(zone_dma_bits);

So here we assume that if zone_dma_bits is 24, it wasn't initialised. I
think it may be simpler if we just set it in setup_machine_fdt() to 32
or 30 if RPi4. This way we don't have to depend on what the core kernel
sets.

-- 
Catalin
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
