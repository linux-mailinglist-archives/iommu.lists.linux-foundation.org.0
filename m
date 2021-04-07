Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DD93569F3
	for <lists.iommu@lfdr.de>; Wed,  7 Apr 2021 12:44:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D866F4186C;
	Wed,  7 Apr 2021 10:44:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fIg1GI_Tu6HZ; Wed,  7 Apr 2021 10:44:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E28141864;
	Wed,  7 Apr 2021 10:44:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8016DC000A;
	Wed,  7 Apr 2021 10:44:38 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CA3EDC000A
 for <iommu@lists.linux-foundation.org>; Wed,  7 Apr 2021 10:44:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB86860BFD
 for <iommu@lists.linux-foundation.org>; Wed,  7 Apr 2021 10:44:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HEH6Fr6vNRjL for <iommu@lists.linux-foundation.org>;
 Wed,  7 Apr 2021 10:44:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2AA4E60BEF
 for <iommu@lists.linux-foundation.org>; Wed,  7 Apr 2021 10:44:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 47AB76108B;
 Wed,  7 Apr 2021 10:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617792275;
 bh=/OYd8ejLQFNhGdZWMDHFlb/wavoCjwGmIAxQChr4y0I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lAszGQDh0IJBjt0Zb7UzHLOMuePGL2eE4/Fa3nR+8cALdr/D3xE+fbRUg65zaCChS
 Tw9C9Ho1Ii2Ir5HqgHluupVFxpSi0GhucOKYs3I/v0TcC04EBAYufuFcQ4tSpnbHiJ
 sNfTaqT+4iuid7/+sFakR9fZ+WpxUsytMrx5qRQLefU/Iigd39UlGeCX7RyZUpSI4M
 WPib7+YcHlLoX0XmybUhmv6kl5MpvOthmQ1r2pOV4hevL+NrVlF2/3XjNyGMFmo8Hx
 t2DMY/uaYlS8TnOAEXez9s1NJ9r+iGXiwmz3fjqnHEKojuFLqM0r4BWEK3uCVX08a/
 Gn/jyTL3rHHuw==
Date: Wed, 7 Apr 2021 11:44:29 +0100
From: Will Deacon <will@kernel.org>
To: Sven Peter <sven@svenpeter.dev>
Subject: Re: [PATCH v2 1/3] iommu: io-pgtable: add DART pagetable format
Message-ID: <20210407104425.GB15173@willie-the-truck>
References: <20210328074009.95932-1-sven@svenpeter.dev>
 <20210328074009.95932-2-sven@svenpeter.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210328074009.95932-2-sven@svenpeter.dev>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Arnd Bergmann <arnd@kernel.org>, devicetree@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, Hector Martin <marcan@marcan.st>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>,
 Mohamed Mediouni <mohamed.mediouni@caramail.com>,
 Mark Kettenis <mark.kettenis@xs4all.nl>, Robin Murphy <robin.murphy@arm.com>,
 linux-arm-kernel@lists.infradead.org, Stan Skowronek <stan@corellium.com>
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

On Sun, Mar 28, 2021 at 09:40:07AM +0200, Sven Peter wrote:
> Apple's DART iommu uses a pagetable format that shares some
> similarities with the ones already implemented by io-pgtable.c.
> Add a new format variant to support the required differences
> so that we don't have to duplicate the pagetable handling code.
> 
> Signed-off-by: Sven Peter <sven@svenpeter.dev>
> ---
>  drivers/iommu/io-pgtable-arm.c | 59 ++++++++++++++++++++++++++++++++++
>  drivers/iommu/io-pgtable.c     |  1 +
>  include/linux/io-pgtable.h     |  6 ++++
>  3 files changed, 66 insertions(+)
> 
> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
> index 87def58e79b5..2f63443fd115 100644
> --- a/drivers/iommu/io-pgtable-arm.c
> +++ b/drivers/iommu/io-pgtable-arm.c
> @@ -127,6 +127,9 @@
>  #define ARM_MALI_LPAE_MEMATTR_IMP_DEF	0x88ULL
>  #define ARM_MALI_LPAE_MEMATTR_WRITE_ALLOC 0x8DULL
>  
> +#define APPLE_DART_PTE_PROT_NO_WRITE (1<<7)
> +#define APPLE_DART_PTE_PROT_NO_READ (1<<8)
> +
>  /* IOPTE accessors */
>  #define iopte_deref(pte,d) __va(iopte_to_paddr(pte, d))
>  
> @@ -381,6 +384,15 @@ static arm_lpae_iopte arm_lpae_prot_to_pte(struct arm_lpae_io_pgtable *data,
>  {
>  	arm_lpae_iopte pte;
>  
> +	if (data->iop.fmt == ARM_APPLE_DART) {
> +		pte = 0;
> +		if (!(prot & IOMMU_WRITE))
> +			pte |= APPLE_DART_PTE_PROT_NO_WRITE;
> +		if (!(prot & IOMMU_READ))
> +			pte |= APPLE_DART_PTE_PROT_NO_READ;
> +		return pte;
> +	}
> +
>  	if (data->iop.fmt == ARM_64_LPAE_S1 ||
>  	    data->iop.fmt == ARM_32_LPAE_S1) {
>  		pte = ARM_LPAE_PTE_nG;
> @@ -1043,6 +1055,48 @@ arm_mali_lpae_alloc_pgtable(struct io_pgtable_cfg *cfg, void *cookie)
>  	return NULL;
>  }
>  
> +static struct io_pgtable *
> +apple_dart_alloc_pgtable(struct io_pgtable_cfg *cfg, void *cookie)
> +{
> +	struct arm_lpae_io_pgtable *data;
> +
> +	if (cfg->ias > 36)
> +		return NULL;
> +	if (cfg->oas > 36)
> +		return NULL;
> +
> +	if (!cfg->coherent_walk)
> +		return NULL;

This all feels like IOMMU-specific limitations leaking into the page-table
code here; it doesn't feel so unlikely that future implementations of this
IP might have greater addressing capabilities, for example, and so I don't
see why the page-table code needs to police this.

> +	cfg->pgsize_bitmap &= SZ_16K;
> +	if (!cfg->pgsize_bitmap)
> +		return NULL;

This is worrying (and again, I don't think this belongs here). How is this
thing supposed to work if the CPU is using 4k pages?

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
