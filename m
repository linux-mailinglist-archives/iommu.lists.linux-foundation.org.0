Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id DE65A206CA0
	for <lists.iommu@lfdr.de>; Wed, 24 Jun 2020 08:36:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9601E88528;
	Wed, 24 Jun 2020 06:36:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HGKoflTHQPn9; Wed, 24 Jun 2020 06:36:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8E4BE8851D;
	Wed, 24 Jun 2020 06:36:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7D0C4C016F;
	Wed, 24 Jun 2020 06:36:53 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8A084C016F
 for <iommu@lists.linux-foundation.org>; Wed, 24 Jun 2020 06:36:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 6F603882CB
 for <iommu@lists.linux-foundation.org>; Wed, 24 Jun 2020 06:36:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yUUslzcmyRy1 for <iommu@lists.linux-foundation.org>;
 Wed, 24 Jun 2020 06:36:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by whitealder.osuosl.org (Postfix) with ESMTP id 75E86882AE
 for <iommu@lists.linux-foundation.org>; Wed, 24 Jun 2020 06:36:50 +0000 (UTC)
X-UUID: aafbf51206634258a2df94bc1f5ba20b-20200624
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=dyrzMGwsnsiMhIacftJo7XUszB6l2wtiz1xwMW8R/c0=; 
 b=Am65U8lnm61YapKhelbvFNf2q1U1T6Vwon0jPy5pKhqj47mzQWEyR3AsvvbAnKTJrOYw8BfpvHeyIHsZNE2ESjCc8gODTA0UC9fTXF4vqmq4PiEFYF18TSc7wkAVOEv7eFT2KaT5GwKnz3Ko0YSeJyKcXa1Ov03hSSMeRyr2CTE=;
X-UUID: aafbf51206634258a2df94bc1f5ba20b-20200624
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
 (envelope-from <chao.hao@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1189343506; Wed, 24 Jun 2020 14:36:47 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 24 Jun 2020 14:36:41 +0800
Received: from [10.15.20.246] (10.15.20.246) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 24 Jun 2020 14:36:41 +0800
Message-ID: <1592980561.24677.1.camel@mbjsdccf07>
Subject: Re: [PATCH v4 6/7] iommu/mediatek: Add REG_MMU_WR_LEN definition
 preparing for mt6779
From: chao hao <Chao.Hao@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Date: Wed, 24 Jun 2020 14:36:01 +0800
In-Reply-To: <e9a62fd8-ed8c-05d6-1eaa-49d5a471cd3a@gmail.com>
References: <20200617030029.4082-1-chao.hao@mediatek.com>
 <20200617030029.4082-7-chao.hao@mediatek.com>
 <9e2c52d6-a887-1977-8877-fbcd30cb4261@gmail.com>
 <1592564184.5692.6.camel@mbjsdccf07>
 <e9a62fd8-ed8c-05d6-1eaa-49d5a471cd3a@gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
Cc: devicetree@vger.kernel.org, FY Yang <fy.yang@mediatek.com>,
 wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 Chao Hao <chao.hao@mediatek.com>, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
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

On Sun, 2020-06-21 at 13:01 +0200, Matthias Brugger wrote:
> 
> On 19/06/2020 12:56, chao hao wrote:
> > On Wed, 2020-06-17 at 11:22 +0200, Matthias Brugger wrote:
> >>
> >> On 17/06/2020 05:00, Chao Hao wrote:
> >>> Some platforms(ex: mt6779) have a new register called by REG_MMU_WR_LEN
> >>> to improve performance.
> >>> This patch add this register definition.
> >>
> >> Please be more specific what this register is about.
> >>
> > OK. thanks.
> > We can use "has_wr_len" flag to control whether we need to set the
> > register. If the register uses default value, iommu will send command to
> > EMI without restriction, when the number of commands become more and
> > more, it will drop the EMI performance. So when more than
> > ten_commands(default value) don't be handled for EMI, IOMMU will stop
> > send command to EMI for keeping EMI's performace by enabling write
> > throttling mechanism(bit[5][21]=0) in MMU_WR_LEN_CTRL register.
> > 
> > I will write description above to commit message in next version
> > 
> >>>
> >>> Signed-off-by: Chao Hao <chao.hao@mediatek.com>
> >>> ---
> >>>  drivers/iommu/mtk_iommu.c | 10 ++++++++++
> >>>  drivers/iommu/mtk_iommu.h |  2 ++
> >>>  2 files changed, 12 insertions(+)
> >>>
> >>> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> >>> index a687e8db0e51..c706bca6487e 100644
> >>> --- a/drivers/iommu/mtk_iommu.c
> >>> +++ b/drivers/iommu/mtk_iommu.c
> >>> @@ -46,6 +46,8 @@
> >>>  #define F_MMU_STANDARD_AXI_MODE_BIT		(BIT(3) | BIT(19))
> >>>  
> >>>  #define REG_MMU_DCM_DIS				0x050
> >>> +#define REG_MMU_WR_LEN				0x054
> >>> +#define F_MMU_WR_THROT_DIS_BIT			(BIT(5) |  BIT(21))
> >>>  
> >>>  #define REG_MMU_CTRL_REG			0x110
> >>>  #define F_MMU_TF_PROT_TO_PROGRAM_ADDR		(2 << 4)
> >>> @@ -581,6 +583,12 @@ static int mtk_iommu_hw_init(const struct mtk_iommu_data *data)
> >>>  		writel_relaxed(regval, data->base + REG_MMU_VLD_PA_RNG);
> >>>  	}
> >>>  	writel_relaxed(0, data->base + REG_MMU_DCM_DIS);
> >>> +	if (data->plat_data->has_wr_len) {
> >>> +		/* write command throttling mode */
> >>> +		regval = readl_relaxed(data->base + REG_MMU_WR_LEN);
> >>> +		regval &= ~F_MMU_WR_THROT_DIS_BIT;
> >>> +		writel_relaxed(regval, data->base + REG_MMU_WR_LEN);
> >>> +	}
> >>>  
> >>>  	if (data->plat_data->reset_axi) {
> >>>  		/* The register is called STANDARD_AXI_MODE in this case */
> >>> @@ -737,6 +745,7 @@ static int __maybe_unused mtk_iommu_suspend(struct device *dev)
> >>>  	struct mtk_iommu_suspend_reg *reg = &data->reg;
> >>>  	void __iomem *base = data->base;
> >>>  
> >>> +	reg->wr_len = readl_relaxed(base + REG_MMU_WR_LEN);
> >>
> >> Can we read/write the register without any side effect although hardware has not
> >> implemented it (!has_wr_len)?
> > 
> > It doesn't have side effect. Becasue all the MTK platform have the
> > register for iommu HW. If we need to have requirement for performance,
> > we can set it by has_wr_len.
> > But I'm Sorry, the name of flag(has_wr_len) is not exact, I will rename
> > it in next version, ex: "wr_throt_en"
> > 
> >>
> >>
> >>>  	reg->misc_ctrl = readl_relaxed(base + REG_MMU_MISC_CTRL);
> >>>  	reg->dcm_dis = readl_relaxed(base + REG_MMU_DCM_DIS);
> >>>  	reg->ctrl_reg = readl_relaxed(base + REG_MMU_CTRL_REG);
> >>> @@ -761,6 +770,7 @@ static int __maybe_unused mtk_iommu_resume(struct device *dev)
> >>>  		dev_err(data->dev, "Failed to enable clk(%d) in resume\n", ret);
> >>>  		return ret;
> >>>  	}
> >>> +	writel_relaxed(reg->wr_len, base + REG_MMU_WR_LEN);
> >>>  	writel_relaxed(reg->misc_ctrl, base + REG_MMU_MISC_CTRL);
> >>>  	writel_relaxed(reg->dcm_dis, base + REG_MMU_DCM_DIS);
> >>>  	writel_relaxed(reg->ctrl_reg, base + REG_MMU_CTRL_REG);
> >>> diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
> >>> index d51ff99c2c71..9971cedd72ea 100644
> >>> --- a/drivers/iommu/mtk_iommu.h
> >>> +++ b/drivers/iommu/mtk_iommu.h
> >>> @@ -25,6 +25,7 @@ struct mtk_iommu_suspend_reg {
> >>>  	u32				int_main_control;
> >>>  	u32				ivrp_paddr;
> >>>  	u32				vld_pa_rng;
> >>> +	u32				wr_len;
> >>>  };
> >>>  
> >>>  enum mtk_iommu_plat {
> >>> @@ -43,6 +44,7 @@ struct mtk_iommu_plat_data {
> >>>  	bool		    has_misc_ctrl;
> >>>  	bool		    has_sub_comm;
> >>>  	bool                has_vld_pa_rng;
> >>> +	bool                has_wr_len;
> >>
> >> Given the fact that we are adding more and more plat_data bool values, I think
> >> it would make sense to use a u32 flags register and add the appropriate macro
> >> definitions to set and check for a flag present.
> > 
> > Thanks for your advice.
> > do you mean like this:
> > struct plat_flag {
> > 
> >         #define  HAS_4GB_MODE   BIT(0)
> >         #define  HAS_BCLK       BIT(1)
> >         #define  REST_AXI       BIT(2)
> >         ... ...
> > 
> >         u32 flag;
> > };
> > 
> > struct mtk_iommu_plat_data {
> >         ......
> >         struct plat_flag flag;
> >         ......
> > };
> > 
> 
> Nearly, I mean something like this:
> 
> #define  HAS_4GB_MODE   BIT(0)
> #define  HAS_BCLK       BIT(1)
> #define  REST_AXI       BIT(2)
> 
> #define MTK_IOMMU_HAS_FLAG(pdata, _x)	\
> 		((((pdata)->flags) & (_x)) == (_x))
> 
> struct mtk_iommu_plat_data {
> 	...
> 	u32 flags;
> 	...
> }
> 
> if (MTK_IOMMU_HAS_FLAG(data->plat_data, HAS_BCLK)
> ...
> 

Ok, got it, thanks


> Regards,
> Matthias
> 
> > 
> >> Regards,
> >> Matthias
> >>
> >>>  	bool                reset_axi;
> >>>  	u32                 inv_sel_reg;
> >>>  	unsigned char       larbid_remap[8][4];
> >>>
> > 

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
