Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 238DD1CF208
	for <lists.iommu@lfdr.de>; Tue, 12 May 2020 11:59:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id CD9E7863F1;
	Tue, 12 May 2020 09:59:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3DgHCayHoZI7; Tue, 12 May 2020 09:59:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1AD6F8690F;
	Tue, 12 May 2020 09:59:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EC0B2C016F;
	Tue, 12 May 2020 09:59:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 248A9C016F
 for <iommu@lists.linux-foundation.org>; Tue, 12 May 2020 09:59:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 212128705B
 for <iommu@lists.linux-foundation.org>; Tue, 12 May 2020 09:59:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1tJ1JO3zLP3j for <iommu@lists.linux-foundation.org>;
 Tue, 12 May 2020 09:59:23 +0000 (UTC)
X-Greylist: delayed 00:05:49 by SQLgrey-1.7.6
Received: from kirsty.vergenet.net (kirsty.vergenet.net [202.4.237.240])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 260DB86BA4
 for <iommu@lists.linux-foundation.org>; Tue, 12 May 2020 09:59:23 +0000 (UTC)
Received: from penelope.horms.nl (tulip.horms.nl [83.161.246.101])
 by kirsty.vergenet.net (Postfix) with ESMTPA id AB32C25AD50;
 Tue, 12 May 2020 19:53:31 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
 id 57B76717; Tue, 12 May 2020 11:53:29 +0200 (CEST)
Date: Tue, 12 May 2020 11:53:29 +0200
From: Simon Horman <horms@verge.net.au>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] iommu/renesas: fix unused-function warning
Message-ID: <20200512095329.GA18408@vergenet.net>
References: <20200508220224.688985-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200508220224.688985-1-arnd@arndb.de>
Organisation: Horms Solutions BV
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Hai Nguyen Pham <hai.pham.ud@renesas.com>, Joerg Roedel <jroedel@suse.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Will Deacon <will@kernel.org>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Robin Murphy <robin.murphy@arm.com>
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

On Sat, May 09, 2020 at 12:02:16AM +0200, Arnd Bergmann wrote:
> gcc warns because the only reference to ipmmu_find_group
> is inside of an #ifdef:
> 
> drivers/iommu/ipmmu-vmsa.c:878:28: error: 'ipmmu_find_group' defined but not used [-Werror=unused-function]
> 
> Change the #ifdef to an equivalent IS_ENABLED().
> 
> Fixes: 6580c8a78424 ("iommu/renesas: Convert to probe/release_device() call-backs")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Simon Horman <horms@verge.net.au>

> ---
>  drivers/iommu/ipmmu-vmsa.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
> index fb7e702dee23..4c2972f3153b 100644
> --- a/drivers/iommu/ipmmu-vmsa.c
> +++ b/drivers/iommu/ipmmu-vmsa.c
> @@ -903,11 +903,8 @@ static const struct iommu_ops ipmmu_ops = {
>  	.probe_device = ipmmu_probe_device,
>  	.release_device = ipmmu_release_device,
>  	.probe_finalize = ipmmu_probe_finalize,
> -#if defined(CONFIG_ARM) && !defined(CONFIG_IOMMU_DMA)
> -	.device_group = generic_device_group,
> -#else
> -	.device_group = ipmmu_find_group,
> -#endif
> +	.device_group = IS_ENABLED(CONFIG_ARM) && !IS_ENABLED(CONFIG_IOMMU_DMA)
> +			? generic_device_group : ipmmu_find_group,
>  	.pgsize_bitmap = SZ_1G | SZ_2M | SZ_4K,
>  	.of_xlate = ipmmu_of_xlate,
>  };
> -- 
> 2.26.0
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
