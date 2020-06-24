Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 68DCF206CB9
	for <lists.iommu@lfdr.de>; Wed, 24 Jun 2020 08:40:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 12EAF20400;
	Wed, 24 Jun 2020 06:40:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XFRjbOtPqpZQ; Wed, 24 Jun 2020 06:40:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 30D1C20445;
	Wed, 24 Jun 2020 06:40:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1C663C016F;
	Wed, 24 Jun 2020 06:40:44 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0A6C8C016F
 for <iommu@lists.linux-foundation.org>; Wed, 24 Jun 2020 06:40:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id E4E9988305
 for <iommu@lists.linux-foundation.org>; Wed, 24 Jun 2020 06:40:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mBoy1GzxQ0RY for <iommu@lists.linux-foundation.org>;
 Wed, 24 Jun 2020 06:40:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by whitealder.osuosl.org (Postfix) with ESMTP id 0F2C0882CB
 for <iommu@lists.linux-foundation.org>; Wed, 24 Jun 2020 06:40:41 +0000 (UTC)
X-UUID: 4480b2ca7b054f65b6670c72e877b5e1-20200624
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=C01wP7O41EMQ3vJzTY+vMBOf3dw7xo6jocNHUFkcK60=; 
 b=pYOAFoAuAPMKJOUpuxG+ASLryj8g+nVmFgn2Rg/9Mfvm7FwXtiScWEMX4Aeh062CDT4daPemOheV2tCJ7IcreiAbc3WpayoYeQxw+r3sFQ5318KBye2ride6ZpeZLVvqYTpP2lQcoXZ98ZiwioXD01Rx7/K13LjTrsZVOfp4o3w=;
X-UUID: 4480b2ca7b054f65b6670c72e877b5e1-20200624
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by
 mailgw01.mediatek.com (envelope-from <chao.hao@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 32306068; Wed, 24 Jun 2020 14:40:39 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 24 Jun 2020 14:40:35 +0800
Received: from [10.15.20.246] (10.15.20.246) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 24 Jun 2020 14:40:34 +0800
Message-ID: <1592980794.24677.4.camel@mbjsdccf07>
Subject: Re: [PATCH v4 3/7] iommu/mediatek: Set MISC_CTRL register
From: chao hao <Chao.Hao@mediatek.com>
To: Yong Wu <yong.wu@mediatek.com>
Date: Wed, 24 Jun 2020 14:39:54 +0800
In-Reply-To: <1592618616.3951.12.camel@mhfsdcap03>
References: <20200617030029.4082-1-chao.hao@mediatek.com>
 <20200617030029.4082-4-chao.hao@mediatek.com>
 <aaf422f5-2ac8-252d-a064-0c1246e09acc@gmail.com>
 <1592480963.12647.5.camel@mbjsdccf07> <1592618616.3951.12.camel@mhfsdcap03>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: F70B4854FFD7F8C1D58622D9F607A9A3ED68DABFF7765DD65D58A3DE4CB487062000:8
X-MTK: N
Cc: devicetree@vger.kernel.org, FY Yang <fy.yang@mediatek.com>,
 wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 Chao Hao <chao.hao@mediatek.com>, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
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

On Sat, 2020-06-20 at 10:03 +0800, Yong Wu wrote:
> Hi Chao,
> 
> On Thu, 2020-06-18 at 19:49 +0800, chao hao wrote: 
> > On Wed, 2020-06-17 at 11:34 +0200, Matthias Brugger wrote:
> 
> [snip]
> 
> > > >  
> > > >  #define REG_MMU_MISC_CTRL			0x048
> > > > +#define F_MMU_IN_ORDER_WR_EN			(BIT(1) | BIT(17))
> > > > +#define F_MMU_STANDARD_AXI_MODE_BIT		(BIT(3) | BIT(19))
> > > > +
> > > >  #define REG_MMU_DCM_DIS				0x050
> > > >  
> > > >  #define REG_MMU_CTRL_REG			0x110
> > > > @@ -578,6 +581,14 @@ static int mtk_iommu_hw_init(const struct mtk_iommu_data *data)
> > > >  		writel_relaxed(0, data->base + REG_MMU_MISC_CTRL);
> > > >  	}
> > > >  
> > > > +	if (data->plat_data->has_misc_ctrl) {
> > > 
> > > That's confusing. We renamed the register to misc_ctrl, but it's present in all
> > > SoCs. We should find a better name for this flag to describe what the hardware
> > > supports.
> > > 
> > 
> > ok, thanks for you advice, I will rename it in next version.
> > ex:has_perf_req(has performance requirement)
> > 
> > 
> > > Regards,
> > > Matthias
> > > 
> > > > +		/* For mm_iommu, it can improve performance by the setting */
> > > > +		regval = readl_relaxed(data->base + REG_MMU_MISC_CTRL);
> > > > +		regval &= ~F_MMU_STANDARD_AXI_MODE_BIT;
> > > > +		regval &= ~F_MMU_IN_ORDER_WR_EN;
> 
> Note: mt2712 also is MISC_CTRL register, but it don't use this
> in_order setting.
> 
> As commented in v3. 0x48 is either STANDARD_AXI_MODE or MISC_CTRL
> register. No need two flags(reset_axi/has_xx) for it.
> 
> something like:
> 
> regval = readl_relaxed(data->base + REG_MMU_MISC_CTRL);
> if (reset_axi) {
> regval = 0;
> } else {   /* MISC_CTRL */
> if (!apu[1])
> regval &= ~F_MMU_STANDARD_AXI_MODE_BIT;
> if (out_order_en)
> regval &= ~F_MMU_IN_ORDER_WR_EN;
> }
> writel_relaxed(regval, data->base + REG_MMU_MISC_CTRL);
> 
> 
> [1] Your current patch doesn't support apu-iommu, thus, add it when
> necessary.

ok, the patchset don't need to "if (!apu[1])", I will fix it in next
version. thanks


> > > > +		writel_relaxed(regval, data->base + REG_MMU_MISC_CTRL);
> > > > +	}
> > > > +
> > > >  	if (devm_request_irq(data->dev, data->irq, mtk_iommu_isr, 0,
> > > >  			     dev_name(data->dev), (void *)data)) {
> > > >  		writel_relaxed(0, data->base + REG_MMU_PT_BASE_ADDR);
> > > > diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
> > > > index 1b6ea839b92c..d711ac630037 100644
> > > > --- a/drivers/iommu/mtk_iommu.h
> > > > +++ b/drivers/iommu/mtk_iommu.h
> > > > @@ -40,6 +40,7 @@ struct mtk_iommu_plat_data {
> > > >  
> > > >  	/* HW will use the EMI clock if there isn't the "bclk". */
> > > >  	bool                has_bclk;
> > > > +	bool		    has_misc_ctrl;
> > > >  	bool                has_vld_pa_rng;
> > > >  	bool                reset_axi;
> > > >  	unsigned char       larbid_remap[MTK_LARB_NR_MAX];
> > > > 
> > 
> > 
> 

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
