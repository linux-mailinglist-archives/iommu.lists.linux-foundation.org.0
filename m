Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 3366B179042
	for <lists.iommu@lfdr.de>; Wed,  4 Mar 2020 13:23:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 81C3C20465;
	Wed,  4 Mar 2020 12:23:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6FBYgLMXzWw5; Wed,  4 Mar 2020 12:23:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 4A62320463;
	Wed,  4 Mar 2020 12:23:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2BE1FC013E;
	Wed,  4 Mar 2020 12:23:40 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DCCC7C013E
 for <iommu@lists.linux-foundation.org>; Wed,  4 Mar 2020 12:23:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id D8A9B878ED
 for <iommu@lists.linux-foundation.org>; Wed,  4 Mar 2020 12:23:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tGdNE-7JczUj for <iommu@lists.linux-foundation.org>;
 Wed,  4 Mar 2020 12:23:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by hemlock.osuosl.org (Postfix) with ESMTP id AA72A86F1B
 for <iommu@lists.linux-foundation.org>; Wed,  4 Mar 2020 12:23:34 +0000 (UTC)
X-UUID: f60a90d2fe3b473190adbc45265b7a85-20200304
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=OssUNRC3Tj6PFiOJDmNMrtiv3wqgqqKa4MYNjVzDtI0=; 
 b=V+Wb4VIyQmbCZh6bXJd24Ul9B1GMKJyoRpnzns1S1E30lgZlSKp+4lgjPEoFenjzdYFS/mL/ocNUD5hocCipvUkr2/Rtk4AvC094ZNEbH99fNA9feyBAAv5CRGXPoUSs3BT53M37ce5NrkJFouqyxs2n0uae2ouvpwEbM05f8B8=;
X-UUID: f60a90d2fe3b473190adbc45265b7a85-20200304
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 600072106; Wed, 04 Mar 2020 20:23:27 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Wed, 4 Mar 2020 20:22:02 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 4 Mar 2020 20:22:25 +0800
Message-ID: <1583324597.4784.23.camel@mhfsdcap03>
Subject: Re: [PATCH v2 2/3] iommu/mediatek: add pdata member for legacy ivrp
 paddr
From: Yong Wu <yong.wu@mediatek.com>
To: Fabien Parent <fparent@baylibre.com>
Date: Wed, 4 Mar 2020 20:23:17 +0800
In-Reply-To: <20200302112152.2887131-2-fparent@baylibre.com>
References: <20200302112152.2887131-1-fparent@baylibre.com>
 <20200302112152.2887131-2-fparent@baylibre.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: C6605E1F8BA11BF1D3312455B42D32C1E8866B40A03E980F364CC1ED7C780BC92000:8
X-MTK: N
Cc: anan.sun@mediatek.com, devicetree@vger.kernel.org, youlin.pei@mediatek.com,
 linux-kernel@vger.kernel.org, ck.hu@mediatek.com,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, scott.wang@mediatek.com,
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

On Mon, 2020-03-02 at 12:21 +0100, Fabien Parent wrote:
> Add a new platform data member in order to select which IVRP_PADDR
> format is used by an SoC.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
> 
> v2: new patch
> 
> ---
>  drivers/iommu/mtk_iommu.c | 3 ++-
>  drivers/iommu/mtk_iommu.h | 1 +
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index 95945f467c03..78cb14ab7dd0 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -569,7 +569,7 @@ static int mtk_iommu_hw_init(const struct mtk_iommu_data *data)
>  		F_INT_PRETETCH_TRANSATION_FIFO_FAULT;
>  	writel_relaxed(regval, data->base + REG_MMU_INT_MAIN_CONTROL);
>  
> -	if (data->plat_data->m4u_plat == M4U_MT8173)
> +	if (data->plat_data->has_legacy_ivrp_paddr)
>  		regval = (data->protect_base >> 1) | (data->enable_4GB << 31);
>  	else
>  		regval = lower_32_bits(data->protect_base) |
> @@ -786,6 +786,7 @@ static const struct mtk_iommu_plat_data mt8173_data = {
>  	.m4u_plat     = M4U_MT8173,
>  	.has_4gb_mode = true,
>  	.has_bclk     = true,
> +	.has_legacy_ivrp_paddr = true;
>  	.reset_axi    = true,
>  	.larbid_remap = {0, 1, 2, 3, 4, 5}, /* Linear mapping. */
>  };
> diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
> index ea949a324e33..4696ba027a71 100644
> --- a/drivers/iommu/mtk_iommu.h
> +++ b/drivers/iommu/mtk_iommu.h
> @@ -42,6 +42,7 @@ struct mtk_iommu_plat_data {
>  	bool                has_bclk;
>  	bool                has_vld_pa_rng;
>  	bool                reset_axi;
> +	bool                has_legacy_ivrp_paddr;

I'd like to put this before "has_vld_pa_rng" alphabetically.

Other than this,

Reviewed-by: Yong Wu <yong.wu@mediatek.com>

>  	unsigned char       larbid_remap[MTK_LARB_NR_MAX];
>  };
>  

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
