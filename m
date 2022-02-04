Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id E57A24AA2C7
	for <lists.iommu@lfdr.de>; Fri,  4 Feb 2022 23:05:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7D65B40412;
	Fri,  4 Feb 2022 22:05:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LY83WTTTpmgW; Fri,  4 Feb 2022 22:05:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 69EE1401B1;
	Fri,  4 Feb 2022 22:05:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3F831C0073;
	Fri,  4 Feb 2022 22:05:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 026DDC000B
 for <iommu@lists.linux-foundation.org>; Fri,  4 Feb 2022 22:05:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD3CA4094C
 for <iommu@lists.linux-foundation.org>; Fri,  4 Feb 2022 22:05:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DjK7Qaj9gFbS for <iommu@lists.linux-foundation.org>;
 Fri,  4 Feb 2022 22:05:26 +0000 (UTC)
X-Greylist: delayed 00:31:11 by SQLgrey-1.8.0
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 21C82408E6
 for <iommu@lists.linux-foundation.org>; Fri,  4 Feb 2022 22:05:26 +0000 (UTC)
Received: from p508fdcd8.dip0.t-ipconnect.de ([80.143.220.216]
 helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nG6Db-0003Tl-Cw; Fri, 04 Feb 2022 22:34:11 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: joro@8bytes.org, will@kernel.org, Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] iommu/rockchip: : Use standard driver registration
Date: Fri, 04 Feb 2022 22:34:05 +0100
Message-ID: <4984895.Adqdaih0Sd@phil>
In-Reply-To: <c08d58bff340da6a829e76d66d2fa090a9718384.1644005728.git.robin.murphy@arm.com>
References: <05ca5e1b29bdd350f4e20b9ceb031a2c281e23d2.1644005728.git.robin.murphy@arm.com>
 <c08d58bff340da6a829e76d66d2fa090a9718384.1644005728.git.robin.murphy@arm.com>
MIME-Version: 1.0
Cc: linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
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

Am Freitag, 4. Februar 2022, 21:16:41 CET schrieb Robin Murphy:
> It's been a long time since there was any reason to register IOMMU
> drivers early. Convert to the standard platform driver helper.
> 
> CC: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

> ---
>  drivers/iommu/rockchip-iommu.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iommu.c
> index 7f23ad61c094..204a93a72572 100644
> --- a/drivers/iommu/rockchip-iommu.c
> +++ b/drivers/iommu/rockchip-iommu.c
> @@ -1407,9 +1407,4 @@ static struct platform_driver rk_iommu_driver = {
>  		   .suppress_bind_attrs = true,
>  	},
>  };
> -
> -static int __init rk_iommu_init(void)
> -{
> -	return platform_driver_register(&rk_iommu_driver);
> -}
> -subsys_initcall(rk_iommu_init);
> +builtin_platform_driver(rk_iommu_driver);
> 




_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
