Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B61F3C3B2A
	for <lists.iommu@lfdr.de>; Sun, 11 Jul 2021 10:30:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3E104043E;
	Sun, 11 Jul 2021 08:30:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kz7SM2zuKmg2; Sun, 11 Jul 2021 08:30:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id BEC5740498;
	Sun, 11 Jul 2021 08:30:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8576CC000E;
	Sun, 11 Jul 2021 08:30:11 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C7E29C000E
 for <iommu@lists.linux-foundation.org>; Sun, 11 Jul 2021 08:30:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9EDFB400F7
 for <iommu@lists.linux-foundation.org>; Sun, 11 Jul 2021 08:30:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=mediatek.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WCDHeBoakFaI for <iommu@lists.linux-foundation.org>;
 Sun, 11 Jul 2021 08:30:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by smtp2.osuosl.org (Postfix) with ESMTP id 66E17400C3
 for <iommu@lists.linux-foundation.org>; Sun, 11 Jul 2021 08:30:07 +0000 (UTC)
X-UUID: af929080615347d7addfaa6af8e1dd1c-20210711
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=t9mLnCFBNPQ+QFBApPB3w3g/T+cWtNxPL3HGdUb3WsA=; 
 b=iyijnGoDBCAKLaJbAoNDrkvq1J5QEqOoWQ401AkZkzyB8w4mmgc3XKcPgP9RYdgRj3/Ei5iVY8zXeDsvKVT5jPDagwKv9YV3ym4jg0i1S6mRM62hotVS5ovbsvGlv5YdSxVh8SmpL/iv6gXb7iPmkZaEUxx50oQhTADLPOJH8c4=;
X-UUID: af929080615347d7addfaa6af8e1dd1c-20210711
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1398523848; Sun, 11 Jul 2021 16:30:02 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sun, 11 Jul 2021 16:29:59 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 11 Jul 2021 16:29:59 +0800
Message-ID: <1625992199.22309.15.camel@mhfsdcap03>
Subject: Re: [PATCH 3/9] memory: mtk-smi: Use clk_bulk instead of the clk ops
From: Yong Wu <yong.wu@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Date: Sun, 11 Jul 2021 16:29:59 +0800
In-Reply-To: <4047dfaf-f2f8-b6b2-52fd-41821475b162@canonical.com>
References: <20210616114346.18812-1-yong.wu@mediatek.com>
 <20210616114346.18812-4-yong.wu@mediatek.com>
 <4047dfaf-f2f8-b6b2-52fd-41821475b162@canonical.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 755D024FD7727026C23CB3E6A5D8D9521A587CF4AB7DEEF2F8C0332526F861752000:8
X-MTK: N
Cc: youlin.pei@mediatek.com, anan.sun@mediatek.com, srv_heupstream@mediatek.com,
 Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, anthony.huang@mediatek.com,
 ming-fan.chen@mediatek.com, yi.kuo@mediatek.com,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
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

On Thu, 2021-07-08 at 11:32 +0200, Krzysztof Kozlowski wrote:
> On 16/06/2021 13:43, Yong Wu wrote:
> > smi have many clocks: apb/smi/gals.
> > This patch use clk_bulk interface instead of the orginal one to simply
> > the code.
> > 
> > gals is optional clk(some larbs may don't have gals). use clk_bulk_optional
> > instead. and then remove the has_gals flag.
> > 
> > Also remove clk fail logs since bulk interface already output fail log.
> > 
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > ---
> >  drivers/memory/mtk-smi.c | 124 +++++++++++----------------------------
> >  1 file changed, 34 insertions(+), 90 deletions(-)
> > 
> > diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
> > index c5fb51f73b34..bcd2bf130655 100644
> > --- a/drivers/memory/mtk-smi.c
> > +++ b/drivers/memory/mtk-smi.c
> > @@ -60,9 +60,18 @@ enum mtk_smi_gen {
> >  	MTK_SMI_GEN2
> >  };
> >  
> > +#define MTK_SMI_CLK_NR_MAX			4
> > +
> > +static const char * const mtk_smi_common_clocks[] = {
> > +	"apb", "smi", "gals0", "gals1", /* glas is optional */
> 
> Typo here - glas.

Will Fix. Thanks.

> 
> > +};
> > +

[snip]

> > @@ -493,7 +449,7 @@ static int mtk_smi_common_probe(struct platform_device *pdev)
> >  	struct device *dev = &pdev->dev;
> >  	struct mtk_smi *common;
> >  	struct resource *res;
> > -	int ret;
> > +	int i, ret;
> >  
> >  	common = devm_kzalloc(dev, sizeof(*common), GFP_KERNEL);
> >  	if (!common)
> > @@ -501,23 +457,13 @@ static int mtk_smi_common_probe(struct platform_device *pdev)
> >  	common->dev = dev;
> >  	common->plat = of_device_get_match_data(dev);
> >  
> > -	common->clk_apb = devm_clk_get(dev, "apb");
> > -	if (IS_ERR(common->clk_apb))
> > -		return PTR_ERR(common->clk_apb);
> > -
> > -	common->clk_smi = devm_clk_get(dev, "smi");
> > -	if (IS_ERR(common->clk_smi))
> > -		return PTR_ERR(common->clk_smi);
> > +	common->clk_num = ARRAY_SIZE(mtk_smi_common_clocks);
> > +	for (i = 0; i < common->clk_num; i++)
> > +		common->clks[i].id = mtk_smi_common_clocks[i];
> >  
> > -	if (common->plat->has_gals) {
> > -		common->clk_gals0 = devm_clk_get(dev, "gals0");
> > -		if (IS_ERR(common->clk_gals0))
> > -			return PTR_ERR(common->clk_gals0);
> > -
> > -		common->clk_gals1 = devm_clk_get(dev, "gals1");
> > -		if (IS_ERR(common->clk_gals1))
> > -			return PTR_ERR(common->clk_gals1);
> > -	}
> > +	ret = devm_clk_bulk_get_optional(dev, common->clk_num, common->clks);
> > +	if (ret)
> > +		return ret;
> 
> How do you handle now missing required clocks?

It looks this is a common issue for this function which supports all the
clocks could be optional. Is there common suggestion for this?

For our case, the apb/smi clocks are required while "gals" are optional.

thus, we should use devm_clk_bulk_get for the necessary clocks and
devm_clk_bulk_get_optional for the optional ones. right?

> 
> >  
> >  	/*
> >  	 * for mtk smi gen 1, we need to get the ao(always on) base to config
> > @@ -561,11 +507,9 @@ static int __maybe_unused mtk_smi_common_resume(struct device *dev)
> >  	u32 bus_sel = common->plat->bus_sel;
> >  	int ret;
> >  
> > -	ret = mtk_smi_clk_enable(common);
> > -	if (ret) {
> > -		dev_err(common->dev, "Failed to enable clock(%d).\n", ret);
> > +	ret = clk_bulk_prepare_enable(common->clk_num, common->clks);
> > +	if (ret)
> >  		return ret;
> > -	}
> >  
> >  	if (common->plat->gen == MTK_SMI_GEN2 && bus_sel)
> >  		writel(bus_sel, common->base + SMI_BUS_SEL);
> > @@ -576,7 +520,7 @@ static int __maybe_unused mtk_smi_common_suspend(struct device *dev)
> >  {
> >  	struct mtk_smi *common = dev_get_drvdata(dev);
> >  
> > -	mtk_smi_clk_disable(common);
> > +	clk_bulk_disable_unprepare(common->clk_num, common->clks);
> >  	return 0;
> >  }
> >  
> > 
> 
> 
> Best regards,
> Krzysztof

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
