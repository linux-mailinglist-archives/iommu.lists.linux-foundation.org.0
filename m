Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id A5809179058
	for <lists.iommu@lfdr.de>; Wed,  4 Mar 2020 13:27:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 56BBA85E9B;
	Wed,  4 Mar 2020 12:27:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t9kP7YA-j6Km; Wed,  4 Mar 2020 12:27:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DF71C85E7D;
	Wed,  4 Mar 2020 12:27:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C71EEC013E;
	Wed,  4 Mar 2020 12:27:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C0CFBC013E
 for <iommu@lists.linux-foundation.org>; Wed,  4 Mar 2020 12:27:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id AAEDD86462
 for <iommu@lists.linux-foundation.org>; Wed,  4 Mar 2020 12:27:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2tHmLTD2Nx-h for <iommu@lists.linux-foundation.org>;
 Wed,  4 Mar 2020 12:27:31 +0000 (UTC)
X-Greylist: delayed 00:05:01 by SQLgrey-1.7.6
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2D9118642E
 for <iommu@lists.linux-foundation.org>; Wed,  4 Mar 2020 12:27:31 +0000 (UTC)
X-UUID: 5c917b8437d84f08acf4f479c26a34f2-20200304
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=G3qywGgyJLG5zIB5C4MO427fFnJC0uUmsvwjBMR84aU=; 
 b=eRQ3etiQz0k00Y/O4qrGp5zeoDLOhNrZ4ojvFAtAXDxEWXpBTGh2IbBnX8KxMd8L10IaGPxFFfIjlbeptdFy6PQDpT8JfRr8HpWGIJbL+DZBcwGLdlquXaR4qGYBsRIoB38xriDIObO3TM/fDCY1AvvcMepSfYlQQN/2cp+NYM0=;
X-UUID: 5c917b8437d84f08acf4f479c26a34f2-20200304
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <yong.wu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1720254188; Wed, 04 Mar 2020 20:22:27 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs05n1.mediatek.inc
 (172.21.101.15) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Wed, 4 Mar 2020 20:21:18 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 4 Mar 2020 20:21:25 +0800
Message-ID: <1583324538.4784.22.camel@mhfsdcap03>
Subject: Re: [PATCH v2 3/3] iommu/mediatek: add support for MT8167
From: Yong Wu <yong.wu@mediatek.com>
To: Fabien Parent <fparent@baylibre.com>
Date: Wed, 4 Mar 2020 20:22:18 +0800
In-Reply-To: <20200302112152.2887131-3-fparent@baylibre.com>
References: <20200302112152.2887131-1-fparent@baylibre.com>
 <20200302112152.2887131-3-fparent@baylibre.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 ck.hu@mediatek.com, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
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
> Add support for the IOMMU on MT8167
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
> 
> V2:
> 	* removed if based on m4u_plat, and using instead the new
> 	has_legacy_ivrp_paddr member that was introduced in patch 2.
> 
> ---
>  drivers/iommu/mtk_iommu.c | 9 +++++++++
>  drivers/iommu/mtk_iommu.h | 1 +
>  2 files changed, 10 insertions(+)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index 78cb14ab7dd0..25b7ad1647ba 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -782,6 +782,14 @@ static const struct mtk_iommu_plat_data mt2712_data = {
>  	.larbid_remap = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9},
>  };
>  
> +static const struct mtk_iommu_plat_data mt8167_data = {
> +	.m4u_plat     = M4U_MT8167,
> +	.has_4gb_mode = true,
> +	.has_legacy_ivrp_paddr = true;
> +	.reset_axi    = true,
> +	.larbid_remap = {0, 1, 2, 3, 4, 5}, /* Linear mapping. */

Normally we put the file include/dt-bindings/memory/mt8167-larb-port.h
into the first binding patch. 

If we have that file, we will know there is only 3 larbs in mt8167.
thus, here should be: larbid_remap = {0, 1, 2}

Other than this,

Reviewed-by: Yong Wu <yong.wu@mediatek.com>

> +};
> +
>  static const struct mtk_iommu_plat_data mt8173_data = {
>  	.m4u_plat     = M4U_MT8173,
>  	.has_4gb_mode = true,
> @@ -799,6 +807,7 @@ static const struct mtk_iommu_plat_data mt8183_data = {
>  
>  static const struct of_device_id mtk_iommu_of_ids[] = {
>  	{ .compatible = "mediatek,mt2712-m4u", .data = &mt2712_data},
> +	{ .compatible = "mediatek,mt8167-m4u", .data = &mt8167_data},
>  	{ .compatible = "mediatek,mt8173-m4u", .data = &mt8173_data},
>  	{ .compatible = "mediatek,mt8183-m4u", .data = &mt8183_data},
>  	{}
> diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
> index 4696ba027a71..72f874ec9e9c 100644
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
