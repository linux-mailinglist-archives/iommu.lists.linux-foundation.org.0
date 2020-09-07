Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E67A25F22B
	for <lists.iommu@lfdr.de>; Mon,  7 Sep 2020 05:46:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D8BDB859CC;
	Mon,  7 Sep 2020 03:45:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YCY4CD2eZmoR; Mon,  7 Sep 2020 03:45:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6319385549;
	Mon,  7 Sep 2020 03:45:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4AD70C0051;
	Mon,  7 Sep 2020 03:45:59 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A756EC0051
 for <iommu@lists.linux-foundation.org>; Mon,  7 Sep 2020 03:45:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 96CCD85551
 for <iommu@lists.linux-foundation.org>; Mon,  7 Sep 2020 03:45:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TkbB63fPNS9p for <iommu@lists.linux-foundation.org>;
 Mon,  7 Sep 2020 03:45:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A059B85549
 for <iommu@lists.linux-foundation.org>; Mon,  7 Sep 2020 03:45:56 +0000 (UTC)
X-UUID: fc2d7b33f73a41f7a03f428ee60e33c2-20200907
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=mMKGJq1Irdy84Dk7/453p0dQlCzRanBPVBBNedi1E24=; 
 b=P9EOq1ceoJ6v6yA29aGdcKM3W63uv5PYkiygfYBy6w9vVkxgGtbU+Mpeh8KIpuPKOy/ArbN13XNJxxAfNrrbDzjJf6pwFpt9h0n2n/r7fjCldYbt1rqud1RgU5/O/uTbKENeJKSt4p24R7F2Zgcm6xJRw3837t+QCkR9ssmhWcA=;
X-UUID: fc2d7b33f73a41f7a03f428ee60e33c2-20200907
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by
 mailgw02.mediatek.com (envelope-from <yong.wu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1169113425; Mon, 07 Sep 2020 11:45:51 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs08n2.mediatek.inc
 (172.21.101.56) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 7 Sep 2020 11:45:40 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 7 Sep 2020 11:45:39 +0800
Message-ID: <1599450232.27773.13.camel@mhfsdcap03>
Subject: Re: [PATCH v3 3/3] iommu/mediatek: add support for MT8167
From: Yong Wu <yong.wu@mediatek.com>
To: Fabien Parent <fparent@baylibre.com>
Date: Mon, 7 Sep 2020 11:43:52 +0800
In-Reply-To: <20200906151928.881209-3-fparent@baylibre.com>
References: <20200906151928.881209-1-fparent@baylibre.com>
 <20200906151928.881209-3-fparent@baylibre.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 508C82F0F2088845E7C370D4AA3DA4F89501BFD7F85F229D412844D957F046852000:8
X-MTK: N
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, miles.chen@mediatek.com,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
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

On Sun, 2020-09-06 at 17:19 +0200, Fabien Parent wrote:
> Add support for the IOMMU on MT8167
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
> 
> V3:
> 	* use LEGACY_IVRP_PADDR flag instead of using a platform data member
> V2:
> 	* removed if based on m4u_plat, and using instead the new
> 	  has_legacy_ivrp_paddr member that was introduced in patch 2.
> 
> ---
>  drivers/iommu/mtk_iommu.c | 8 ++++++++
>  drivers/iommu/mtk_iommu.h | 1 +
>  2 files changed, 9 insertions(+)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index b1f85a7e9346..6079f6a23c74 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -817,6 +817,13 @@ static const struct mtk_iommu_plat_data mt6779_data = {
>  	.larbid_remap  = {{0}, {1}, {2}, {3}, {5}, {7, 8}, {10}, {9}},
>  };
>  
> +static const struct mtk_iommu_plat_data mt8167_data = {
> +	.m4u_plat     = M4U_MT8167,
> +	.flags        = HAS_4GB_MODE | RESET_AXI | HAS_LEGACY_IVRP_PADDR,

The 4GB mode flow was improved at[1] which has just been applied.

If you add 4gb_mode flag but don't have "mt8167-infracfg", the probe may
be failed.

[1]
https://lore.kernel.org/linux-iommu/20200904112117.GC16609@8bytes.org/T/#m613e9926735d07ad004fddbbcedaa50b5afacca1


> +	.inv_sel_reg  = REG_MMU_INV_SEL_GEN1,
> +	.larbid_remap = {{0}, {1}, {2}}, /* Linear mapping. */
> +};
> +
>  static const struct mtk_iommu_plat_data mt8173_data = {
>  	.m4u_plat     = M4U_MT8173,
>  	.flags	      = HAS_4GB_MODE | HAS_BCLK | RESET_AXI |
> @@ -835,6 +842,7 @@ static const struct mtk_iommu_plat_data mt8183_data = {
>  static const struct of_device_id mtk_iommu_of_ids[] = {
>  	{ .compatible = "mediatek,mt2712-m4u", .data = &mt2712_data},
>  	{ .compatible = "mediatek,mt6779-m4u", .data = &mt6779_data},
> +	{ .compatible = "mediatek,mt8167-m4u", .data = &mt8167_data},
>  	{ .compatible = "mediatek,mt8173-m4u", .data = &mt8173_data},
>  	{ .compatible = "mediatek,mt8183-m4u", .data = &mt8183_data},
>  	{}
> diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
> index 122925dbe547..df32b3e3408b 100644
> --- a/drivers/iommu/mtk_iommu.h
> +++ b/drivers/iommu/mtk_iommu.h
> @@ -39,6 +39,7 @@ enum mtk_iommu_plat {
>  	M4U_MT2701,
>  	M4U_MT2712,
>  	M4U_MT6779,
> +	M4U_MT8167,
>  	M4U_MT8173,
>  	M4U_MT8183,
>  };

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
