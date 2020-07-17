Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 316E32236F3
	for <lists.iommu@lfdr.de>; Fri, 17 Jul 2020 10:26:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A0587880D5;
	Fri, 17 Jul 2020 08:26:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5gBioxiUVN+U; Fri, 17 Jul 2020 08:26:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4745988100;
	Fri, 17 Jul 2020 08:26:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2972AC0733;
	Fri, 17 Jul 2020 08:26:40 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 255A9C0733
 for <iommu@lists.linux-foundation.org>; Fri, 17 Jul 2020 08:26:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 0BE9D880D0
 for <iommu@lists.linux-foundation.org>; Fri, 17 Jul 2020 08:26:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4WVLFrwkQNJt for <iommu@lists.linux-foundation.org>;
 Fri, 17 Jul 2020 08:26:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by whitealder.osuosl.org (Postfix) with ESMTP id EC242880C4
 for <iommu@lists.linux-foundation.org>; Fri, 17 Jul 2020 08:26:36 +0000 (UTC)
X-UUID: 00c49b57fed94b27b76049b300df15c8-20200717
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=MrihObMU7n6YHGhXYYDfe7xLLhNpwqJjPTZD5pCRXi4=; 
 b=qSkg5pGZ7/GUqDa+KYmKpnSkiESL+hypmwvZ5i4IEGNH4WK6YywNGJCxL8h9/9NaHi0W9EMw68I+Bszeitn3N1dHLHw4cNF+I3U9TFPqE/uqPKcUNA6nlKJV0zYbBXVWTxPFkvamJ/Zr+VCei7kegzPh1id3EGAJuYoBXnY6V9c=;
X-UUID: 00c49b57fed94b27b76049b300df15c8-20200717
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 764249227; Fri, 17 Jul 2020 16:26:32 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 17 Jul 2020 16:26:29 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 17 Jul 2020 16:26:29 +0800
Message-ID: <1594974391.12796.25.camel@mtkswgap22>
Subject: Re: [PATCH 4/4] iommu/mediatek: check 4GB mode by reading infracfg
From: Miles Chen <miles.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Date: Fri, 17 Jul 2020 16:26:31 +0800
In-Reply-To: <84333997-735c-4a91-6d47-1dcb5c4a6078@gmail.com>
References: <20200702093721.6063-1-miles.chen@mediatek.com>
 <20200702093721.6063-4-miles.chen@mediatek.com>
 <84333997-735c-4a91-6d47-1dcb5c4a6078@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com, David
 Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>, Chao Hao <chao.hao@mediatek.com>,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Yingjoe Chen <yingjoe.chen@mediatek.com>,
 Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org
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

On Wed, 2020-07-15 at 23:05 +0200, Matthias Brugger wrote:
> 
> On 02/07/2020 11:37, Miles Chen wrote:
> > In previous disscusion [1] and [2], we found that it is risky to
> > use max_pfn or totalram_pages to tell if 4GB mode is enabled.
> > 
> > Check 4GB mode by reading infracfg register, remove the usage
> > of the unexported symbol max_pfn.
> > 
> > [1] https://urldefense.com/v3/__https://lkml.org/lkml/2020/6/3/733__;!!CTRNKA9wMg0ARbw!16gAfVnSY87W4t5kE4iw20QPxBgS_SHBvPKlePKU7CGIb18nUzuRUjHumcf4oYVhIQ$ 
> > [2] https://urldefense.com/v3/__https://lkml.org/lkml/2020/6/4/136__;!!CTRNKA9wMg0ARbw!16gAfVnSY87W4t5kE4iw20QPxBgS_SHBvPKlePKU7CGIb18nUzuRUjHumcfr4i9p5g$ 
> > 
> > Cc: Mike Rapoport <rppt@linux.ibm.com>
> > Cc: David Hildenbrand <david@redhat.com>
> > Cc: Yong Wu <yong.wu@mediatek.com>
> > Cc: Yingjoe Chen <yingjoe.chen@mediatek.com>
> > Cc: Christoph Hellwig <hch@lst.de>
> > Signed-off-by: Miles Chen <miles.chen@mediatek.com>
> > ---
> >   drivers/iommu/mtk_iommu.c | 22 ++++++++++++++++++----
> >   1 file changed, 18 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> > index 2be96f1cdbd2..09be57bd8d74 100644
> > --- a/drivers/iommu/mtk_iommu.c
> > +++ b/drivers/iommu/mtk_iommu.c
> > @@ -3,7 +3,6 @@
> >    * Copyright (c) 2015-2016 MediaTek Inc.
> >    * Author: Yong Wu <yong.wu@mediatek.com>
> >    */
> > -#include <linux/memblock.h>
> >   #include <linux/bug.h>
> >   #include <linux/clk.h>
> >   #include <linux/component.h>
> > @@ -15,11 +14,13 @@
> >   #include <linux/iommu.h>
> >   #include <linux/iopoll.h>
> >   #include <linux/list.h>
> > +#include <linux/mfd/syscon.h>
> >   #include <linux/of_address.h>
> >   #include <linux/of_iommu.h>
> >   #include <linux/of_irq.h>
> >   #include <linux/of_platform.h>
> >   #include <linux/platform_device.h>
> > +#include <linux/regmap.h>
> >   #include <linux/slab.h>
> >   #include <linux/spinlock.h>
> >   #include <asm/barrier.h>
> > @@ -91,6 +92,9 @@
> >   #define F_MMU_INT_ID_LARB_ID(a)			(((a) >> 7) & 0x7)
> >   #define F_MMU_INT_ID_PORT_ID(a)			(((a) >> 2) & 0x1f)
> >   
> > +#define REG_INFRA_MISC				0xf00
> > +#define F_DDR_4GB_SUPPORT_EN			BIT(13)
> > +
> 
> As this is used for infracfg, I think it would be good to add it to 
> include/linux/soc/mediatek/infracfg.h and include that file here.
Thanks for your comment.

ok. I'll do this in next version.
> 
> >   #define MTK_PROTECT_PA_ALIGN			128
> >   
> >   /*
> > @@ -599,8 +603,10 @@ static int mtk_iommu_probe(struct platform_device *pdev)
> >   	struct resource         *res;
> >   	resource_size_t		ioaddr;
> >   	struct component_match  *match = NULL;
> > +	struct regmap		*infracfg_regmap;
> 
> Maybe call it just infracfg.

ok. I'll do this in next version. 
> 
> >   	void                    *protect;
> >   	int                     i, larb_nr, ret;
> > +	u32			val;
> >   
> >   	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> >   	if (!data)
> > @@ -614,10 +620,18 @@ static int mtk_iommu_probe(struct platform_device *pdev)
> >   		return -ENOMEM;
> >   	data->protect_base = ALIGN(virt_to_phys(protect), MTK_PROTECT_PA_ALIGN);
> >   
> > -	/* Whether the current dram is over 4GB */
> > -	data->enable_4GB = !!(max_pfn > (BIT_ULL(32) >> PAGE_SHIFT));
> > -	if (!data->plat_data->has_4gb_mode)
> > +	if (data->plat_data->has_4gb_mode) {
> > +		infracfg_regmap = syscon_regmap_lookup_by_phandle(dev->of_node,
> > +				"mediatek,infracfg");
> > +		if (IS_ERR(infracfg_regmap))
> > +			return PTR_ERR(infracfg_regmap);
> 
> Do we need to error out, or could we be conservative and set endable_4GB = false?

We have to error out in this case because the 4gb_mode setting must be
consistent with the h/w setting.

> 
> > +		ret = regmap_read(infracfg_regmap, REG_INFRA_MISC, &val);
> > +		if (ret)
> > +			return ret;
> > +		data->enable_4GB = !!(val & F_DDR_4GB_SUPPORT_EN);
> > +	} else {
> >   		data->enable_4GB = false;
> 
> Move that before the if() and update enable_4GB only in case of has_4gb_mode.

ok. I'll do this in next version.

Miles
> 
> > +	}
> >   
> >   	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> >   	data->base = devm_ioremap_resource(dev, res);
> > 

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
