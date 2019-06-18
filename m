Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 318D74A07D
	for <lists.iommu@lfdr.de>; Tue, 18 Jun 2019 14:14:16 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 3DA40F24;
	Tue, 18 Jun 2019 12:14:14 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 18A5DD0A
	for <iommu@lists.linux-foundation.org>;
	Tue, 18 Jun 2019 12:14:13 +0000 (UTC)
X-Greylist: delayed 00:05:01 by SQLgrey-1.7.6
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 1AD65886
	for <iommu@lists.linux-foundation.org>;
	Tue, 18 Jun 2019 12:14:11 +0000 (UTC)
X-UUID: 869e132c44684e91b1a10166255098c0-20190618
X-UUID: 869e132c44684e91b1a10166255098c0-20190618
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(mailgw01.mediatek.com ESMTP with TLS)
	with ESMTP id 634461938; Tue, 18 Jun 2019 20:09:06 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
	(172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
	Tue, 18 Jun 2019 20:09:04 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS36.mediatek.inc
	(172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
	Transport; Tue, 18 Jun 2019 20:09:03 +0800
Message-ID: <1560859743.8082.23.camel@mhfsdcap03>
Subject: Re: [PATCH v7 14/21] iommu/mediatek: Add mmu1 support
From: Yong Wu <yong.wu@mediatek.com>
To: Tomasz Figa <tfiga@google.com>
Date: Tue, 18 Jun 2019 20:09:03 +0800
In-Reply-To: <CAAFQd5A5GUn1Zq1xF2_2V0MReNPd5bra2F=nquvodSAZUua5AQ@mail.gmail.com>
References: <1560169080-27134-1-git-send-email-yong.wu@mediatek.com>
	<1560169080-27134-15-git-send-email-yong.wu@mediatek.com>
	<CAAFQd5A5GUn1Zq1xF2_2V0MReNPd5bra2F=nquvodSAZUua5AQ@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,UNPARSEABLE_RELAY
	autolearn=unavailable version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
	Nicolas Boichat <drinkcat@chromium.org>,
	srv_heupstream <srv_heupstream@mediatek.com>,
	Will Deacon <will.deacon@arm.com>, Linux Kernel
	Mailing List <linux-kernel@vger.kernel.org>,
	Evan Green <evgreen@chromium.org>, "list@263.net:IOMMU DRIVERS
	<iommu@lists.linux-foundation.org>, Joerg  Roedel <joro@8bytes.org>,
	" <iommu@lists.linux-foundation.org>, Rob Herring <robh+dt@kernel.org>,
	"moderated list:ARM/Mediatek SoC support"
	<linux-mediatek@lists.infradead.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Yingjoe Chen =?UTF-8?Q?=28=E9=99=B3=E8=8B=B1=E6=B4=B2=29?=
	<yingjoe.chen@mediatek.com>, anan.sun@mediatek.com,
	Robin Murphy <robin.murphy@arm.com>, Matthias
	Kaehlcke <mka@chromium.org>, "list@263.net:IOMMU DRIVERS
	<iommu@lists.linux-foundation.org>, Joerg  Roedel <joro@8bytes.org>,
	" <linux-arm-kernel@lists.infradead.org>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On Tue, 2019-06-18 at 15:19 +0900, Tomasz Figa wrote:
> On Mon, Jun 10, 2019 at 9:21 PM Yong Wu <yong.wu@mediatek.com> wrote:
> >
> > Normally the M4U HW connect EMI with smi. the diagram is like below:
> >               EMI
> >                |
> >               M4U
> >                |
> >             smi-common
> >                |
> >        -----------------
> >        |    |    |     |    ...
> >     larb0 larb1  larb2 larb3
> >
> > Actually there are 2 mmu cells in the M4U HW, like this diagram:
> >
> >               EMI
> >            ---------
> >             |     |
> >            mmu0  mmu1     <- M4U
> >             |     |
> >            ---------
> >                |
> >             smi-common
> >                |
> >        -----------------
> >        |    |    |     |    ...
> >     larb0 larb1  larb2 larb3
> >
> > This patch add support for mmu1. In order to get better performance,
> > we could adjust some larbs go to mmu1 while the others still go to
> > mmu0. This is controlled by a SMI COMMON register SMI_BUS_SEL(0x220).
> >
> > mt2712, mt8173 and mt8183 M4U HW all have 2 mmu cells. the default
> > value of that register is 0 which means all the larbs go to mmu0
> > defaultly.
> >
> > This is a preparing patch for adjusting SMI_BUS_SEL for mt8183.
> >
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > Reviewed-by: Evan Green <evgreen@chromium.org>
> > ---
> >  drivers/iommu/mtk_iommu.c | 46 +++++++++++++++++++++++++++++-----------------
> >  1 file changed, 29 insertions(+), 17 deletions(-)
> >
> > diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> > index 3a14301..ec4ce74 100644
> > --- a/drivers/iommu/mtk_iommu.c
> > +++ b/drivers/iommu/mtk_iommu.c
> > @@ -72,26 +72,32 @@
> >  #define F_INT_CLR_BIT                          BIT(12)
> >
> >  #define REG_MMU_INT_MAIN_CONTROL               0x124
> > -#define F_INT_TRANSLATION_FAULT                        BIT(0)
> > -#define F_INT_MAIN_MULTI_HIT_FAULT             BIT(1)
> > -#define F_INT_INVALID_PA_FAULT                 BIT(2)
> > -#define F_INT_ENTRY_REPLACEMENT_FAULT          BIT(3)
> > -#define F_INT_TLB_MISS_FAULT                   BIT(4)
> > -#define F_INT_MISS_TRANSACTION_FIFO_FAULT      BIT(5)
> > -#define F_INT_PRETETCH_TRANSATION_FIFO_FAULT   BIT(6)
> > +                                               /* mmu0 | mmu1 */
> > +#define F_INT_TRANSLATION_FAULT                        (BIT(0) | BIT(7))
> > +#define F_INT_MAIN_MULTI_HIT_FAULT             (BIT(1) | BIT(8))
> > +#define F_INT_INVALID_PA_FAULT                 (BIT(2) | BIT(9))
> > +#define F_INT_ENTRY_REPLACEMENT_FAULT          (BIT(3) | BIT(10))
> > +#define F_INT_TLB_MISS_FAULT                   (BIT(4) | BIT(11))
> > +#define F_INT_MISS_TRANSACTION_FIFO_FAULT      (BIT(5) | BIT(12))
> > +#define F_INT_PRETETCH_TRANSATION_FIFO_FAULT   (BIT(6) | BIT(13))
> 
> If there are two IOMMUs, shouldn't we have two driver instances handle
> them, instead of making the driver combine them two internally?

Actually it means only one IOMMU(M4U) HW here. Each a M4U HW has two
small iommu cells which have independent MTLB. As the diagram above, M4U
contain mmu0 and mmu1.

MT8173 and MT8183 have only one M4U HW while MT2712 have 2 M4U HWs(two
driver instances).

> 
> And, what is even more important from security point of view actually,
> have two separate page tables (aka IOMMU groups) for them?

Each a IOMMU(M4U) have its own pagetable, thus, mt8183 have only one
pagetable while mt2712 have two.

> 
> Best regards,
> Tomasz
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
