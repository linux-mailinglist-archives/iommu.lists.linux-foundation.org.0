Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A6820D02C
	for <lists.iommu@lfdr.de>; Mon, 29 Jun 2020 18:29:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8C92487577;
	Mon, 29 Jun 2020 16:29:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NnqfWc_f3sAu; Mon, 29 Jun 2020 16:29:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 87F87875B6;
	Mon, 29 Jun 2020 16:29:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6CE44C016E;
	Mon, 29 Jun 2020 16:29:40 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B8D35C016E
 for <iommu@lists.linux-foundation.org>; Mon, 29 Jun 2020 16:29:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B53498815E
 for <iommu@lists.linux-foundation.org>; Mon, 29 Jun 2020 16:29:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id plzgUW7omdAD for <iommu@lists.linux-foundation.org>;
 Mon, 29 Jun 2020 16:29:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by hemlock.osuosl.org (Postfix) with ESMTP id F400D8807A
 for <iommu@lists.linux-foundation.org>; Mon, 29 Jun 2020 16:29:37 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 688D11570;
 Mon, 29 Jun 2020 09:29:37 -0700 (PDT)
Received: from [10.57.21.32] (unknown [10.57.21.32])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8D8123F71E;
 Mon, 29 Jun 2020 09:29:36 -0700 (PDT)
Subject: Re: [PATCH] iommu: SUN50I_IOMMU should depend on HAS_DMA
To: Geert Uytterhoeven <geert@linux-m68k.org>, Joerg Roedel
 <joro@8bytes.org>, Maxime Ripard <maxime@cerno.tech>
References: <20200629121146.24011-1-geert@linux-m68k.org>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <c2047394-ea6e-3bc3-4bf0-a732237dbeca@arm.com>
Date: Mon, 29 Jun 2020 17:29:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200629121146.24011-1-geert@linux-m68k.org>
Content-Language: en-GB
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
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

On 2020-06-29 13:11, Geert Uytterhoeven wrote:
> If NO_DMA=y (e.g. Sun-3 all{mod,yes}-config):
> 
>      drivers/iommu/dma-iommu.o: In function `iommu_dma_mmap':
>      dma-iommu.c:(.text+0x92e): undefined reference to `dma_pgprot'
> 
> IOMMU_DMA must not be selected, unless HAS_DMA=y.

Wait, no, IOMMU_DMA should not be selected by drivers at all - it's for 
arch code to choose.

x86 just complicates matters with some of its arch code being in its 
IOMMU drivers...

Robin.

> Hence fix this by making SUN50I_IOMMU depend on HAS_DMA.
> 
> Fixes: 4100b8c229b32835 ("iommu: Add Allwinner H6 IOMMU driver")
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>   drivers/iommu/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
> index 6dc49ed8377a5c12..b0f308cb7f7c2fc2 100644
> --- a/drivers/iommu/Kconfig
> +++ b/drivers/iommu/Kconfig
> @@ -305,6 +305,7 @@ config ROCKCHIP_IOMMU
>   
>   config SUN50I_IOMMU
>   	bool "Allwinner H6 IOMMU Support"
> +	depends on HAS_DMA
>   	depends on ARCH_SUNXI || COMPILE_TEST
>   	select ARM_DMA_USE_IOMMU
>   	select IOMMU_API
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
