Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 646DD54DAF5
	for <lists.iommu@lfdr.de>; Thu, 16 Jun 2022 08:47:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13CB684007;
	Thu, 16 Jun 2022 06:47:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pe2B__EmkGPi; Thu, 16 Jun 2022 06:47:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 2C0C584002;
	Thu, 16 Jun 2022 06:47:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 00538C0081;
	Thu, 16 Jun 2022 06:47:23 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C388DC002D
 for <iommu@lists.linux-foundation.org>; Thu, 16 Jun 2022 06:47:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A4C5384003
 for <iommu@lists.linux-foundation.org>; Thu, 16 Jun 2022 06:47:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XzuzQlq6g2XT for <iommu@lists.linux-foundation.org>;
 Thu, 16 Jun 2022 06:47:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BA1E684002
 for <iommu@lists.linux-foundation.org>; Thu, 16 Jun 2022 06:47:20 +0000 (UTC)
X-UUID: 72cfa3363cb6482f891f5acbba363967-20220616
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6, REQID:f54830ad-cf65-4c36-b30c-35111088470e, OB:0,
 LO
 B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:5
X-CID-META: VersionHash:b14ad71, CLOUDID:378ab548-4c92-421c-ad91-b806c0f58b2a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:nil,BEC:nil,COL:0
X-UUID: 72cfa3363cb6482f891f5acbba363967-20220616
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <yf.wang@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 262145049; Thu, 16 Jun 2022 14:47:14 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Thu, 16 Jun 2022 14:47:13 +0800
Received: from mbjsdccf07.mediatek.inc (10.15.20.246) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Thu, 16 Jun 2022 14:47:13 +0800
To: <robin.murphy@arm.com>
Subject: Re: [PATCH v9 2/3] iommu/mediatek: Rename MTK_IOMMU_TLB_ADDR to
 MTK_IOMMU_ADDR
Date: Thu, 16 Jun 2022 14:40:24 +0800
Message-ID: <20220616064024.10683-1-yf.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <949c22c4-5f64-47cf-673c-14fcadcc1d27@arm.com>
References: <949c22c4-5f64-47cf-673c-14fcadcc1d27@arm.com>
MIME-Version: 1.0
X-MTK: N
Cc: miles.chen@mediatek.com, wsd_upstream@mediatek.com,
 linux-kernel@vger.kernel.org, Libo.Kang@mediatek.com, yf.wang@mediatek.com,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 ning.li@mediatek.com, matthias.bgg@gmail.com, will@kernel.org,
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
From: "yf.wang--- via iommu" <iommu@lists.linux-foundation.org>
Reply-To: yf.wang@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Wed, 2022-06-15 at 18:14 +0100, Robin Murphy wrote:
> On 2022-06-15 17:12, yf.wang--- via iommu wrote:
> > From: Yunfei Wang <yf.wang@mediatek.com>
> > 
> > Rename MTK_IOMMU_TLB_ADDR to MTK_IOMMU_ADDR, and update
> > MTK_IOMMU_ADDR
> > definition for better generality.
> > 
> > Signed-off-by: Ning Li <ning.li@mediatek.com>
> > Signed-off-by: Yunfei Wang <yf.wang@mediatek.com>
> > ---
> >   drivers/iommu/mtk_iommu.c | 8 ++++----
> >   1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> > index bb9dd92c9898..3d62399e8865 100644
> > --- a/drivers/iommu/mtk_iommu.c
> > +++ b/drivers/iommu/mtk_iommu.c
> > @@ -265,8 +265,8 @@ static const struct iommu_ops mtk_iommu_ops;
> >   
> >   static int mtk_iommu_hw_init(const struct mtk_iommu_data *data,
> > unsigned int bankid);
> >   
> > -#define MTK_IOMMU_TLB_ADDR(iova) ({				
> > 	\
> > -	dma_addr_t _addr = iova;					\
> > +#define MTK_IOMMU_ADDR(addr) ({					
> > 	\
> > +	unsigned long long _addr = addr;				\
> 
> If phys_addr_t is 64-bit, then dma_addr_t is also 64-bit, so there is
> no 
> loss of generality from using an appropriate type - IOVAs have to
> fit 
> into dma_addr_t for iommu-dma, after all. However, since IOVAs also
> have 
> to fit into unsigned long in the general IOMMU API, as "addr" is
> here, 
> then this is still just as broken for 32-bit LPAE as the existing
> code is.
> 
> Thanks,
> Robin.
> 

Hi Robin,
According to Path#1's suggestion, next version will keep ttbr to encoded 32 bits,
then will don't need to modify it.

Thanks,
Yunfei.


> >   	((lower_32_bits(_addr) & GENMASK(31, 12)) |
> > upper_32_bits(_addr));\
> >   })
> >   
> > @@ -381,8 +381,8 @@ static void
> > mtk_iommu_tlb_flush_range_sync(unsigned long iova, size_t size,
> >   		writel_relaxed(F_INVLD_EN1 | F_INVLD_EN0,
> >   			       base + data->plat_data->inv_sel_reg);
> >   
> > -		writel_relaxed(MTK_IOMMU_TLB_ADDR(iova), base +
> > REG_MMU_INVLD_START_A);
> > -		writel_relaxed(MTK_IOMMU_TLB_ADDR(iova + size - 1),
> > +		writel_relaxed(MTK_IOMMU_ADDR(iova), base +
> > REG_MMU_INVLD_START_A);
> > +		writel_relaxed(MTK_IOMMU_ADDR(iova + size - 1),
> >   			       base + REG_MMU_INVLD_END_A);
> >   		writel_relaxed(F_MMU_INV_RANGE, base +
> > REG_MMU_INVALIDATE);
> >
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
