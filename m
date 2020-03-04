Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3323D17907A
	for <lists.iommu@lfdr.de>; Wed,  4 Mar 2020 13:34:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A72F9879DA;
	Wed,  4 Mar 2020 12:34:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CCxpU5eQ5IRI; Wed,  4 Mar 2020 12:34:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D65A4879CF;
	Wed,  4 Mar 2020 12:34:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BAA62C013E;
	Wed,  4 Mar 2020 12:34:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5F78DC013E
 for <iommu@lists.linux-foundation.org>; Wed,  4 Mar 2020 12:34:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 52C6285C20
 for <iommu@lists.linux-foundation.org>; Wed,  4 Mar 2020 12:34:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MJdtMc0s35jB for <iommu@lists.linux-foundation.org>;
 Wed,  4 Mar 2020 12:34:47 +0000 (UTC)
X-Greylist: delayed 00:05:01 by SQLgrey-1.7.6
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by whitealder.osuosl.org (Postfix) with ESMTP id 0C2D0855D8
 for <iommu@lists.linux-foundation.org>; Wed,  4 Mar 2020 12:34:46 +0000 (UTC)
X-UUID: af168a97b4af4bd6ba21e7758aa64d8c-20200304
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=hUGYRcp79nujMp8CJYYSA+RvajWD2N45GZbZUHTBZnU=; 
 b=IddU/DlZSXXFw1EUrAP469n+GZNlpN+nzgGE3K3en+IF0e5ppljZWJBXdOWt90V79AdR3w2R4Zv2eS9Wqa6cF51PJjKo+VFNvSh9vjd5zmrlyvHNZ1ZDIWNU9s/p65phrgcSU3h6ExdSJuA0xEZ+2tVQeB1Hpp8i2gmHqJj8Umc=;
X-UUID: af168a97b4af4bd6ba21e7758aa64d8c-20200304
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 723530932; Wed, 04 Mar 2020 20:29:41 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Wed, 4 Mar 2020 20:28:17 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 4 Mar 2020 20:28:39 +0800
Message-ID: <1583324972.4784.24.camel@mhfsdcap03>
Subject: Re: [PATCH v2 2/3] iommu/mediatek: add pdata member for legacy ivrp
 paddr
From: Yong Wu <yong.wu@mediatek.com>
To: Fabien Parent <fparent@baylibre.com>
Date: Wed, 4 Mar 2020 20:29:32 +0800
In-Reply-To: <1583324597.4784.23.camel@mhfsdcap03>
References: <20200302112152.2887131-1-fparent@baylibre.com>
 <20200302112152.2887131-2-fparent@baylibre.com>
 <1583324597.4784.23.camel@mhfsdcap03>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 031010B90B15B5E0A03BD5360C9733A8E74D3311E1BEF4AF91EC3A67C5B8F8BA2000:8
X-MTK: N
Cc: anan.sun@mediatek.com, devicetree@vger.kernel.org, youlin.pei@mediatek.com,
 linux-kernel@vger.kernel.org, matthias.bgg@gmail.com,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 ck.hu@mediatek.com, scott.wang@mediatek.com,
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

On Wed, 2020-03-04 at 20:23 +0800, Yong Wu wrote:
> On Mon, 2020-03-02 at 12:21 +0100, Fabien Parent wrote:
> > Add a new platform data member in order to select which IVRP_PADDR
> > format is used by an SoC.
> > 
> > Signed-off-by: Fabien Parent <fparent@baylibre.com>
> > ---
> > 
> > v2: new patch
> > 
> > ---
> >  drivers/iommu/mtk_iommu.c | 3 ++-
> >  drivers/iommu/mtk_iommu.h | 1 +
> >  2 files changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> > index 95945f467c03..78cb14ab7dd0 100644
> > --- a/drivers/iommu/mtk_iommu.c
> > +++ b/drivers/iommu/mtk_iommu.c
> > @@ -569,7 +569,7 @@ static int mtk_iommu_hw_init(const struct mtk_iommu_data *data)
> >  		F_INT_PRETETCH_TRANSATION_FIFO_FAULT;
> >  	writel_relaxed(regval, data->base + REG_MMU_INT_MAIN_CONTROL);
> >  
> > -	if (data->plat_data->m4u_plat == M4U_MT8173)
> > +	if (data->plat_data->has_legacy_ivrp_paddr)
> >  		regval = (data->protect_base >> 1) | (data->enable_4GB << 31);
> >  	else
> >  		regval = lower_32_bits(data->protect_base) |
> > @@ -786,6 +786,7 @@ static const struct mtk_iommu_plat_data mt8173_data = {
> >  	.m4u_plat     = M4U_MT8173,
> >  	.has_4gb_mode = true,
> >  	.has_bclk     = true,
> > +	.has_legacy_ivrp_paddr = true;

,

> >  	.reset_axi    = true,
> >  	.larbid_remap = {0, 1, 2, 3, 4, 5}, /* Linear mapping. */
> >  };
> > diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
> > index ea949a324e33..4696ba027a71 100644
> > --- a/drivers/iommu/mtk_iommu.h
> > +++ b/drivers/iommu/mtk_iommu.h
> > @@ -42,6 +42,7 @@ struct mtk_iommu_plat_data {
> >  	bool                has_bclk;
> >  	bool                has_vld_pa_rng;
> >  	bool                reset_axi;
> > +	bool                has_legacy_ivrp_paddr;
> 
> I'd like to put this before "has_vld_pa_rng" alphabetically.
> 
> Other than this,
> 
> Reviewed-by: Yong Wu <yong.wu@mediatek.com>
> 
> >  	unsigned char       larbid_remap[MTK_LARB_NR_MAX];
> >  };
> >  
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
