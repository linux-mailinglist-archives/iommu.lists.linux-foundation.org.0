Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6A92C5FFF
	for <lists.iommu@lfdr.de>; Fri, 27 Nov 2020 07:21:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 66C78874C7;
	Fri, 27 Nov 2020 06:21:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QVPUbGQFDnNl; Fri, 27 Nov 2020 06:21:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id DF771874C2;
	Fri, 27 Nov 2020 06:21:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C3E35C1836;
	Fri, 27 Nov 2020 06:21:42 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E5620C0052
 for <iommu@lists.linux-foundation.org>; Fri, 27 Nov 2020 06:21:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id D396487BC8
 for <iommu@lists.linux-foundation.org>; Fri, 27 Nov 2020 06:21:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9qFsLxkte3xM for <iommu@lists.linux-foundation.org>;
 Fri, 27 Nov 2020 06:21:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by whitealder.osuosl.org (Postfix) with ESMTP id E19E087BC1
 for <iommu@lists.linux-foundation.org>; Fri, 27 Nov 2020 06:21:37 +0000 (UTC)
X-UUID: 0166de49f31e400fbe36e0a6b4f576b7-20201127
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=k6991k1USSeF9xBY2RrFpj24tWMV0+Y0E7njcNgEzrA=; 
 b=WSUb2JkeLbCR7ASWwSPHvXoBOxCiLeZxB9PcOr1TeSr4lXi1/1u8dxwYjPnsRqLRc9ae/lcfDKyHZYlsUW9C/kKoMhFYXx+CWkKFna25lN/pUYCX49lpgJ3l6b7OqwIkigCMS+MZYKhTgD/sWrK39L3l0L/TS6BPOlpLkEZaUgI=;
X-UUID: 0166de49f31e400fbe36e0a6b4f576b7-20201127
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2031242701; Fri, 27 Nov 2020 14:21:34 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 27 Nov 2020 14:21:32 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 27 Nov 2020 14:21:31 +0800
Message-ID: <1606458092.26323.192.camel@mhfsdcap03>
Subject: Re: [PATCH v4 17/24] iommu/mediatek: Add single domain
From: Yong Wu <yong.wu@mediatek.com>
To: Robin Murphy <robin.murphy@arm.com>
Date: Fri, 27 Nov 2020 14:21:32 +0800
In-Reply-To: <22e49f08-6d23-86cf-bb9c-79d54ce55beb@arm.com>
References: <20201111123838.15682-1-yong.wu@mediatek.com>
 <20201111123838.15682-18-yong.wu@mediatek.com>
 <22e49f08-6d23-86cf-bb9c-79d54ce55beb@arm.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: DFD6FF2D0FFC111E8E3A9221E6491E4E883A7AD97F964DC7A2DB8863C42809542000:8
X-MTK: N
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 chao.hao@mediatek.com, kernel-team@android.com,
 Greg Kroah-Hartman <gregkh@google.com>, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, anan.sun@mediatek.com,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
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

On Thu, 2020-11-26 at 17:11 +0000, Robin Murphy wrote:
> On 2020-11-11 12:38, Yong Wu wrote:
> > Defaultly the iova range is 0-4G. here we add a single-domain(0-4G)
> > for the previous SoC. this also is a preparing patch for supporting
> > multi-domains.
> > 
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > ---
> >   drivers/iommu/mtk_iommu.c | 12 ++++++++++++
> >   1 file changed, 12 insertions(+)
> > 
> > diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> > index bf3f4e0f4748..a7727a3899d1 100644
> > --- a/drivers/iommu/mtk_iommu.c
> > +++ b/drivers/iommu/mtk_iommu.c
> > @@ -161,6 +161,10 @@ struct mtk_iommu_iova_region {
> >   	unsigned long long	size;
> >   };
> >   
> > +static const struct mtk_iommu_iova_region single_domain[] = {
> > +	{.iova_base = 0,		.size = SZ_4G},
> > +};
> 
> Hang on, given how the previous patch works, surely this means you're 
> now going to *reserve* the entire address space? That doesn't seem 
> right... :/

Could you help share more? in which case it is not right?

In the code:
domain->geometry.aperture_end = iova_base + size - 1. 

this is same with DMA_BIT_MASK(32). It looks don't change anything.

> 
> Robin.
> 
> > +
> >   /*
> >    * There may be 1 or 2 M4U HWs, But we always expect they are in the same domain
> >    * for the performance.
> > @@ -922,6 +926,8 @@ static const struct mtk_iommu_plat_data mt2712_data = {
> >   	.m4u_plat     = M4U_MT2712,
> >   	.flags        = HAS_4GB_MODE | HAS_BCLK | HAS_VLD_PA_RNG,
> >   	.inv_sel_reg  = REG_MMU_INV_SEL_GEN1,
> > +	.iova_region  = single_domain,
> > +	.iova_region_nr = ARRAY_SIZE(single_domain),
> >   	.larbid_remap = {{0}, {1}, {2}, {3}, {4}, {5}, {6}, {7}},
> >   };
> >   
> > @@ -929,6 +935,8 @@ static const struct mtk_iommu_plat_data mt6779_data = {
> >   	.m4u_plat      = M4U_MT6779,
> >   	.flags         = HAS_SUB_COMM | OUT_ORDER_WR_EN | WR_THROT_EN,
> >   	.inv_sel_reg   = REG_MMU_INV_SEL_GEN2,
> > +	.iova_region   = single_domain,
> > +	.iova_region_nr = ARRAY_SIZE(single_domain),
> >   	.larbid_remap  = {{0}, {1}, {2}, {3}, {5}, {7, 8}, {10}, {9}},
> >   };
> >   
> > @@ -944,6 +952,8 @@ static const struct mtk_iommu_plat_data mt8173_data = {
> >   	.flags	      = HAS_4GB_MODE | HAS_BCLK | RESET_AXI |
> >   			HAS_LEGACY_IVRP_PADDR,
> >   	.inv_sel_reg  = REG_MMU_INV_SEL_GEN1,
> > +	.iova_region  = single_domain,
> > +	.iova_region_nr = ARRAY_SIZE(single_domain),
> >   	.larbid_remap = {{0}, {1}, {2}, {3}, {4}, {5}}, /* Linear mapping. */
> >   };
> >   
> > @@ -951,6 +961,8 @@ static const struct mtk_iommu_plat_data mt8183_data = {
> >   	.m4u_plat     = M4U_MT8183,
> >   	.flags        = RESET_AXI,
> >   	.inv_sel_reg  = REG_MMU_INV_SEL_GEN1,
> > +	.iova_region  = single_domain,
> > +	.iova_region_nr = ARRAY_SIZE(single_domain),
> >   	.larbid_remap = {{0}, {4}, {5}, {6}, {7}, {2}, {3}, {1}},
> >   };
> >   
> > 

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
