Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECE598EA7
	for <lists.iommu@lfdr.de>; Thu, 22 Aug 2019 11:04:27 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 96EE9D98;
	Thu, 22 Aug 2019 08:56:47 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C1EDFD80
	for <iommu@lists.linux-foundation.org>;
	Thu, 22 Aug 2019 08:56:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 58078735
	for <iommu@lists.linux-foundation.org>;
	Thu, 22 Aug 2019 08:56:44 +0000 (UTC)
X-UUID: 12062e92b4164c44998da9081270e292-20190822
X-UUID: 12062e92b4164c44998da9081270e292-20190822
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(mailgw01.mediatek.com ESMTP with TLS)
	with ESMTP id 515483021; Thu, 22 Aug 2019 16:56:30 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31DR.mediatek.inc
	(172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
	Thu, 22 Aug 2019 16:56:22 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS36.mediatek.inc
	(172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
	Transport; Thu, 22 Aug 2019 16:56:21 +0800
Message-ID: <1566464186.11621.7.camel@mhfsdcap03>
Subject: Re: [PATCH v10 09/23] iommu/io-pgtable-arm-v7s: Extend to support
	PA[33:32] for MediaTek
From: Yong Wu <yong.wu@mediatek.com>
To: Will Deacon <will@kernel.org>
Date: Thu, 22 Aug 2019 16:56:26 +0800
In-Reply-To: <20190821152448.qmoqjh5zznfpdi6n@willie-the-truck>
References: <1566395606-7975-1-git-send-email-yong.wu@mediatek.com>
	<1566395606-7975-10-git-send-email-yong.wu@mediatek.com>
	<20190821152448.qmoqjh5zznfpdi6n@willie-the-truck>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: A53204EC2B24E8ED10E65E7323376A240E74388A8016195038C20EBC411B98902000:8
X-MTK: N
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,UNPARSEABLE_RELAY
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
	Nicolas Boichat <drinkcat@chromium.org>, cui.zhang@mediatek.com,
	srv_heupstream@mediatek.com, Tomasz Figa <tfiga@google.com>,
	linux-kernel@vger.kernel.org, Evan Green <evgreen@chromium.org>,
	chao.hao@mediatek.com, iommu@lists.linux-foundation.org,
	Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	ming-fan.chen@mediatek.com, anan.sun@mediatek.com,
	Robin Murphy <robin.murphy@arm.com>, Matthias
	Kaehlcke <mka@chromium.org>, linux-arm-kernel@lists.infradead.org
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

On Wed, 2019-08-21 at 16:24 +0100, Will Deacon wrote:
> On Wed, Aug 21, 2019 at 09:53:12PM +0800, Yong Wu wrote:
> > MediaTek extend the arm v7s descriptor to support up to 34 bits PA where
> > the bit32 and bit33 are encoded in the bit9 and bit4 of the PTE
> > respectively. Meanwhile the iova still is 32bits.
> > 
> > Regarding whether the pagetable address could be over 4GB, the mt8183
> > support it while the previous mt8173 don't, thus keep it as is.
> > 
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > ---
> >  drivers/iommu/io-pgtable-arm-v7s.c | 32 +++++++++++++++++++++++++-------
> >  include/linux/io-pgtable.h         |  7 +++----
> >  2 files changed, 28 insertions(+), 11 deletions(-)
> 
> [...]
> 
> > @@ -731,7 +747,9 @@ static struct io_pgtable *arm_v7s_alloc_pgtable(struct io_pgtable_cfg *cfg,
> >  {
> >  	struct arm_v7s_io_pgtable *data;
> >  
> > -	if (cfg->ias > ARM_V7S_ADDR_BITS || cfg->oas > ARM_V7S_ADDR_BITS)
> > +	if (cfg->ias > ARM_V7S_ADDR_BITS ||
> > +	    (cfg->oas > ARM_V7S_ADDR_BITS &&
> > +	     !(cfg->quirks & IO_PGTABLE_QUIRK_ARM_MTK_EXT)))
> 
> Please can you instead change arm_v7s_alloc_pgtable() so that it allows an
> ias of up to 34 when the IO_PGTABLE_QUIRK_ARM_MTK_EXT is set?

Here I only simply skip the oas checking for our case. then which way do
your prefer?  something like you commented before:?


	if (cfg->ias > ARM_V7S_ADDR_BITS)
		return NULL;

	if (cfg->quirks & IO_PGTABLE_QUIRK_ARM_MTK_EXT) {
		if (!IS_ENABLED(CONFIG_PHYS_ADDR_T_64BIT))
			cfg->oas = min(cfg->oas, ARM_V7S_ADDR_BITS);
		else if (cfg->oas > 34)
			return NULL;
	} else if (cfg->oas > ARM_V7S_ADDR_BITS) {
		return NULL;
	}


> 
> With that change:
> 
> Acked-by: Will Deacon <will@kernel.org>
> 
> Will
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
