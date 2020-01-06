Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id E3794130C82
	for <lists.iommu@lfdr.de>; Mon,  6 Jan 2020 04:22:22 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 545B1203F2;
	Mon,  6 Jan 2020 03:22:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8-3C4GK+aWyk; Mon,  6 Jan 2020 03:22:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 4FB7120021;
	Mon,  6 Jan 2020 03:22:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3FF35C18DD;
	Mon,  6 Jan 2020 03:22:19 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0DD94C0881
 for <iommu@lists.linux-foundation.org>; Mon,  6 Jan 2020 03:22:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 0345684D49
 for <iommu@lists.linux-foundation.org>; Mon,  6 Jan 2020 03:22:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XPfMKHgko0X2 for <iommu@lists.linux-foundation.org>;
 Mon,  6 Jan 2020 03:22:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by whitealder.osuosl.org (Postfix) with ESMTP id BCFEA8202F
 for <iommu@lists.linux-foundation.org>; Mon,  6 Jan 2020 03:22:14 +0000 (UTC)
X-UUID: 57f54413a2e74625b881579fa3447eab-20200106
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=RDSho2ud9PkHmo+SliyxkimBGlr7TcmW+AJEdhiBnZU=; 
 b=gGXhHvdn6IEqW4MMtZ/uMz9roTigWtx+W6NAewHZn4n1fkM06PCs0Aq2Q63g/wxau/QPEXq37eRvjUyxYcA9kWY12WDVwE0qukyU5Nj2RMMSzNdO+y+IVHkAlKif3yQ1tJzo8YlGWkRaJXuf387J9hLh2dvhw+0ZBtv4L/B+pTE=;
X-UUID: 57f54413a2e74625b881579fa3447eab-20200106
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 359625338; Mon, 06 Jan 2020 11:22:09 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 6 Jan 2020 11:22:09 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by mtkcas08.mediatek.inc
 (172.21.101.126) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Mon, 6 Jan 2020 11:20:16 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 6 Jan 2020 11:19:00 +0800
Message-ID: <1578280829.5196.4.camel@mtksdaap41>
Subject: Re: [PATCH 2/2] iommu/mediatek: add support for MT8167
From: CK Hu <ck.hu@mediatek.com>
To: Fabien Parent <fparent@baylibre.com>
Date: Mon, 6 Jan 2020 11:20:29 +0800
In-Reply-To: <20200103162632.109553-2-fparent@baylibre.com>
References: <20200103162632.109553-1-fparent@baylibre.com>
 <20200103162632.109553-2-fparent@baylibre.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
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

Hi, Fabien:

On Fri, 2020-01-03 at 17:26 +0100, Fabien Parent wrote:
> Add support for the IOMMU on MT8167
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  drivers/iommu/mtk_iommu.c | 11 ++++++++++-
>  drivers/iommu/mtk_iommu.h |  1 +
>  2 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index 6fc1f5ecf91e..5fc6178a82dc 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -569,7 +569,8 @@ static int mtk_iommu_hw_init(const struct mtk_iommu_data *data)
>  		F_INT_PRETETCH_TRANSATION_FIFO_FAULT;
>  	writel_relaxed(regval, data->base + REG_MMU_INT_MAIN_CONTROL);
>  
> -	if (data->plat_data->m4u_plat == M4U_MT8173)
> +	if (data->plat_data->m4u_plat == M4U_MT8173 ||
> +	    data->plat_data->m4u_plat == M4U_MT8167)

I do not like to use m4u_plat for the variant of each SoC. If you use
m4u_plat, you could drop has_4gb_mode, reset_axi, larbid_remap because
you could use m4u_plat to decide the behavior of these variable but the
code would be so dirty. So I think you should drop m4u_plat and use a
variable to identify this behavior.

Regards,
CK

>  		regval = (data->protect_base >> 1) | (data->enable_4GB << 31);
>  	else
>  		regval = lower_32_bits(data->protect_base) |
> @@ -782,6 +783,13 @@ static const struct mtk_iommu_plat_data mt2712_data = {
>  	.larbid_remap = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9},
>  };
>  
> +static const struct mtk_iommu_plat_data mt8167_data = {
> +	.m4u_plat     = M4U_MT8167,
> +	.has_4gb_mode = true,
> +	.reset_axi    = true,
> +	.larbid_remap = {0, 1, 2, 3, 4, 5}, /* Linear mapping. */
> +};
> +
>  static const struct mtk_iommu_plat_data mt8173_data = {
>  	.m4u_plat     = M4U_MT8173,
>  	.has_4gb_mode = true,
> @@ -798,6 +806,7 @@ static const struct mtk_iommu_plat_data mt8183_data = {
>  
>  static const struct of_device_id mtk_iommu_of_ids[] = {
>  	{ .compatible = "mediatek,mt2712-m4u", .data = &mt2712_data},
> +	{ .compatible = "mediatek,mt8167-m4u", .data = &mt8167_data},
>  	{ .compatible = "mediatek,mt8173-m4u", .data = &mt8173_data},
>  	{ .compatible = "mediatek,mt8183-m4u", .data = &mt8183_data},
>  	{}
> diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
> index ea949a324e33..cb8fd5970cd4 100644
> --- a/drivers/iommu/mtk_iommu.h
> +++ b/drivers/iommu/mtk_iommu.h
> @@ -30,6 +30,7 @@ struct mtk_iommu_suspend_reg {
>  enum mtk_iommu_plat {
>  	M4U_MT2701,
>  	M4U_MT2712,
> +	M4U_MT8167,
>  	M4U_MT8173,
>  	M4U_MT8183,
>  };

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
