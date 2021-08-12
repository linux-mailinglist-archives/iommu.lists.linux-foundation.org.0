Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 601623EA3AD
	for <lists.iommu@lfdr.de>; Thu, 12 Aug 2021 13:27:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D64F540532;
	Thu, 12 Aug 2021 11:27:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5PNobmZ3C8Ct; Thu, 12 Aug 2021 11:27:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id B78D040744;
	Thu, 12 Aug 2021 11:27:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 88B71C000E;
	Thu, 12 Aug 2021 11:27:18 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A3E41C000E
 for <iommu@lists.linux-foundation.org>; Thu, 12 Aug 2021 11:27:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 92C5740626
 for <iommu@lists.linux-foundation.org>; Thu, 12 Aug 2021 11:27:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 91ACX8i3786X for <iommu@lists.linux-foundation.org>;
 Thu, 12 Aug 2021 11:27:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A536A40583
 for <iommu@lists.linux-foundation.org>; Thu, 12 Aug 2021 11:27:12 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id BD7744D4; Thu, 12 Aug 2021 13:27:08 +0200 (CEST)
Date: Thu, 12 Aug 2021 13:27:01 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] iommu: APPLE_DART should depend on ARCH_APPLE
Message-ID: <YRUFhQ9B7goYvsuN@8bytes.org>
References: <44fcf525273b32c9afcd7e99acbd346d47f0e047.1628603162.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <44fcf525273b32c9afcd7e99acbd346d47f0e047.1628603162.git.geert+renesas@glider.be>
Cc: Hector Martin <marcan@marcan.st>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Will Deacon <will@kernel.org>,
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

On Tue, Aug 10, 2021 at 03:47:19PM +0200, Geert Uytterhoeven wrote:
> The Apple DART (Device Address Resolution Table) IOMMU is only present
> on Apple ARM SoCs like the M1.  Hence add a dependency on ARCH_APPLE, to
> prevent asking the user about this driver when configuring a kernel
> without support for the Apple Silicon SoC family.
> 
> Fixes: 05ce9d20d699b093 ("iommu/dart: Add DART iommu driver")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/iommu/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
> index dfe81da483e9e073..e908b8222e4ed679 100644
> --- a/drivers/iommu/Kconfig
> +++ b/drivers/iommu/Kconfig
> @@ -292,7 +292,7 @@ config SPAPR_TCE_IOMMU
>  
>  config APPLE_DART
>  	tristate "Apple DART IOMMU Support"
> -	depends on ARM64 || (COMPILE_TEST && !GENERIC_ATOMIC64)
> +	depends on ARCH_APPLE || (COMPILE_TEST && !GENERIC_ATOMIC64)
>  	select IOMMU_API
>  	select IOMMU_IO_PGTABLE_LPAE
>  	default ARCH_APPLE

Dropped the Fixes tag, as this doesn't fix any real issue. Otherwise
applied with adjusted subject (iommu: -> iommu/dart:), Thanks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
