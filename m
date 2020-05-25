Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D97C1E06E2
	for <lists.iommu@lfdr.de>; Mon, 25 May 2020 08:29:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3BBEE865D6;
	Mon, 25 May 2020 06:29:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iiTSW9Mfx65t; Mon, 25 May 2020 06:29:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7F32C86416;
	Mon, 25 May 2020 06:29:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 611DAC016F;
	Mon, 25 May 2020 06:29:18 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4295CC016F
 for <iommu@lists.linux-foundation.org>; Mon, 25 May 2020 06:29:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 3F252866C9
 for <iommu@lists.linux-foundation.org>; Mon, 25 May 2020 06:29:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0s1g47bLYsVu for <iommu@lists.linux-foundation.org>;
 Mon, 25 May 2020 06:29:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by fraxinus.osuosl.org (Postfix) with ESMTP id DF29D8641E
 for <iommu@lists.linux-foundation.org>; Mon, 25 May 2020 06:29:14 +0000 (UTC)
X-UUID: dc3d5c5a54ba4ee3bd05c71fa17d7cfb-20200525
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=P1I8TepixZCqsFw/5SDkpIp4t3EBgZjjh17TkYpSIn0=; 
 b=O46lawTeob/nLYdbqT5TlZGztNQNKqS0Nyyrh1WRftTrCWvWvBl3ZjxTqKnHeTtHe7ZyjScxXunVYnttekCchCl3OsTbqDyHn3b9oPelNaQGp7L4hM4TVdu3+KTJnCVy58RpIiTrwHjPEhOiAeYnekxPqmbn9AKeL7Ol/E1LV3U=;
X-UUID: dc3d5c5a54ba4ee3bd05c71fa17d7cfb-20200525
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 775050014; Mon, 25 May 2020 14:24:05 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS32DR.mediatek.inc
 (172.27.6.104) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 25 May 2020 14:24:04 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 25 May 2020 14:24:04 +0800
Message-ID: <1590387743.13912.11.camel@mhfsdcap03>
Subject: Re: [PATCH v3 4/7] iommu/mediatek: Move inv_sel_reg into the plat_data
From: Yong Wu <yong.wu@mediatek.com>
To: Chao Hao <chao.hao@mediatek.com>
Date: Mon, 25 May 2020 14:22:23 +0800
In-Reply-To: <20200509083654.5178-5-chao.hao@mediatek.com>
References: <20200509083654.5178-1-chao.hao@mediatek.com>
 <20200509083654.5178-5-chao.hao@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 92AFEB32F57DC18BC921CA743F7ED817C952B9384976B2765F29D5F4525EE1A02000:8
X-MTK: N
Cc: devicetree@vger.kernel.org, FY Yang <fy.yang@mediatek.com>,
 wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Jun Yan <jun.yan@mediatek.com>, linux-arm-kernel@lists.infradead.org
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

On Sat, 2020-05-09 at 16:36 +0800, Chao Hao wrote:
> For mt6779, MMU_INVLDT_SEL register's offset is changed from

At this patch, the register is still called by "MMU_INV_SEL".

> 0x38 to 0x2c, so we can put inv_sel_reg in the plat_data to
> use it.
> In addition, we renamed it to REG_MMU_INV_SEL_GEN1 and use it
> before mt6779.
> 
> Signed-off-by: Chao Hao <chao.hao@mediatek.com>
> ---
>  drivers/iommu/mtk_iommu.c | 9 ++++++---
>  drivers/iommu/mtk_iommu.h | 1 +
>  2 files changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index 9ede327a418d..d73de987f8be 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -37,7 +37,7 @@
>  #define REG_MMU_INVLD_START_A			0x024
>  #define REG_MMU_INVLD_END_A			0x028
>  
> -#define REG_MMU_INV_SEL				0x038
> +#define REG_MMU_INV_SEL_GEN1			0x038
>  #define F_INVLD_EN0				BIT(0)
>  #define F_INVLD_EN1				BIT(1)
>  
> @@ -167,7 +167,7 @@ static void mtk_iommu_tlb_flush_all(void *cookie)
>  
>  	for_each_m4u(data) {
>  		writel_relaxed(F_INVLD_EN1 | F_INVLD_EN0,
> -			       data->base + REG_MMU_INV_SEL);
> +			       data->base + data->plat_data->inv_sel_reg);
>  		writel_relaxed(F_ALL_INVLD, data->base + REG_MMU_INVALIDATE);
>  		wmb(); /* Make sure the tlb flush all done */
>  	}
> @@ -184,7 +184,7 @@ static void mtk_iommu_tlb_flush_range_sync(unsigned long iova, size_t size,
>  	for_each_m4u(data) {
>  		spin_lock_irqsave(&data->tlb_lock, flags);
>  		writel_relaxed(F_INVLD_EN1 | F_INVLD_EN0,
> -			       data->base + REG_MMU_INV_SEL);
> +			       data->base + data->plat_data->inv_sel_reg);
>  
>  		writel_relaxed(iova, data->base + REG_MMU_INVLD_START_A);
>  		writel_relaxed(iova + size - 1,
> @@ -784,6 +784,7 @@ static const struct mtk_iommu_plat_data mt2712_data = {
>  	.has_4gb_mode = true,
>  	.has_bclk     = true,
>  	.has_vld_pa_rng   = true,
> +	.inv_sel_reg = REG_MMU_INV_SEL_GEN1,

nitpick: align '=' with the next line.

>  	.larbid_remap = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9},
>  };
>  
> @@ -792,12 +793,14 @@ static const struct mtk_iommu_plat_data mt8173_data = {
>  	.has_4gb_mode = true,
>  	.has_bclk     = true,
>  	.reset_axi    = true,
> +	.inv_sel_reg = REG_MMU_INV_SEL_GEN1,

align '='

>  	.larbid_remap = {0, 1, 2, 3, 4, 5}, /* Linear mapping. */
>  };
>  
>  static const struct mtk_iommu_plat_data mt8183_data = {
>  	.m4u_plat     = M4U_MT8183,
>  	.reset_axi    = true,
> +	.inv_sel_reg = REG_MMU_INV_SEL_GEN1,
>  	.larbid_remap = {0, 4, 5, 6, 7, 2, 3, 1},
>  };
>  
> diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
> index d711ac630037..afd7a2de5c1e 100644
> --- a/drivers/iommu/mtk_iommu.h
> +++ b/drivers/iommu/mtk_iommu.h
> @@ -43,6 +43,7 @@ struct mtk_iommu_plat_data {
>  	bool		    has_misc_ctrl;
>  	bool                has_vld_pa_rng;
>  	bool                reset_axi;
> +	u32                 inv_sel_reg;
>  	unsigned char       larbid_remap[MTK_LARB_NR_MAX];
>  };
>  

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
