Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9E729697F
	for <lists.iommu@lfdr.de>; Fri, 23 Oct 2020 08:04:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4B6C586AFD;
	Fri, 23 Oct 2020 06:04:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 43s718vwBFye; Fri, 23 Oct 2020 06:04:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B7F4686A3F;
	Fri, 23 Oct 2020 06:04:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 992C3C1AD7;
	Fri, 23 Oct 2020 06:04:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A8754C0052
 for <iommu@lists.linux-foundation.org>; Fri, 23 Oct 2020 06:04:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 72B4A203C7
 for <iommu@lists.linux-foundation.org>; Fri, 23 Oct 2020 06:04:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G5300I1A2g-b for <iommu@lists.linux-foundation.org>;
 Fri, 23 Oct 2020 06:04:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by silver.osuosl.org (Postfix) with ESMTP id 694502035C
 for <iommu@lists.linux-foundation.org>; Fri, 23 Oct 2020 06:04:44 +0000 (UTC)
X-UUID: 6385b793c21d44268cae03c3f5b11d68-20201023
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=lH/fAKl+nvEoU7Skw3vE5YheKD9t/B0oqKliE0vzg1A=; 
 b=Gwit8wZryELP+BwrT4Ik4ryyDWTgSvmO9HKnyGjmlgkquglCM42EJFcuUgCOscXbPng+5QtJca10V/v0U1QRmEV12kCgP1H9goRI53zc32xAB6BP5ciGJRXwzJLaQWOn4Oo72dMgIOe436ZngtUKsykkuItvz+pDi0M762lK9+Q=;
X-UUID: 6385b793c21d44268cae03c3f5b11d68-20201023
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
 (envelope-from <chao.hao@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 81261952; Fri, 23 Oct 2020 14:04:39 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 23 Oct 2020 14:04:31 +0800
Received: from [10.15.20.246] (10.15.20.246) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 23 Oct 2020 14:04:31 +0800
Message-ID: <1603432677.2024.3.camel@mbjsdccf07>
Subject: Re: [PATCH 2/4] iommu/mediatek: Add iotlb_sync_range() support
From: chao hao <Chao.Hao@mediatek.com>
To: Robin Murphy <robin.murphy@arm.com>
Date: Fri, 23 Oct 2020 13:57:57 +0800
In-Reply-To: <7fbe0305-91e4-949e-7d84-bf91e81d6b27@arm.com>
References: <20201019113100.23661-1-chao.hao@mediatek.com>
 <20201019113100.23661-3-chao.hao@mediatek.com>
 <7fbe0305-91e4-949e-7d84-bf91e81d6b27@arm.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: CC5627839FE2C07D6347EA6BEF454BC7E6659A3C76B307EF4A2A088B5303E3F32000:8
X-MTK: N
Cc: Jun Wen <jun.wen@mediatek.com>, FY Yang <fy.yang@mediatek.com>,
 wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 Chao Hao <chao.hao@mediatek.com>, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Mingyuan Ma <mingyuan.ma@mediatek.com>, linux-arm-kernel@lists.infradead.org
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

On Wed, 2020-10-21 at 17:55 +0100, Robin Murphy wrote:
> On 2020-10-19 12:30, Chao Hao wrote:
> > MTK_IOMMU driver writes one page entry and does tlb flush at a time
> > currently. More optimal would be to aggregate the writes and flush
> > BUS buffer in the end.
> 
> That's exactly what iommu_iotlb_gather_add_page() is meant to achieve. 
> Rather than jumping straight into hacking up a new API to go round the 
> back of the existing API design, it would be far better to ask the 
> question of why that's not behaving as expected.

Thanks for you review!

iommu_iotlb_gather_add_page is put in io_pgtable_tlb_add_page().
io_pgtable_tlb_add_page() only be called in
unmapping and mapping flow doesn't have it in linux iommu driver, but
mtk iommu needs to do tlb sync in mapping
and unmapping to avoid old data being in the iommu tlb.

In addtion, we hope to do tlb sync once when all the pages mapping done.
iommu_iotlb_gather_add_page maybe do
tlb sync more than once. because one whole buffer consists of different
page size(1MB/64K/4K).

Based on the previous considerations,  don't find more appropriate the
way of tlb sync for mtk iommu, so we add a new API.

> 
> > For 50MB buffer mapping, if mtk_iommu driver use iotlb_sync_range()
> > instead of tlb_add_range() and tlb_flush_walk/leaf(), it can increase
> > 50% performance or more(depending on size of every page size) in
> > comparison to flushing after each page entry update. So we prefer to
> > use iotlb_sync_range() to replace iotlb_sync(), tlb_add_range() and
> > tlb_flush_walk/leaf() for MTK platforms.
> 
> In the case of mapping, it sounds like what you actually want to do is 
> hook up .iotlb_sync_map and generally make IO_PGTABLE_QUIRK_TLBI_ON_MAP 
> cleverer, because the current implementation is as dumb as it could 
> possibly be. 

iotlb_sync_map only has one parameter(iommu_domain), but mtk
iommu_domain maybe include the whole iova space, if mtk_iommu to do tlb
sync based on iommu_domain, it is equivalent to do tlb flush all in
fact.
iommu driver will do tlb sync in every mapping page when mtk iommu sets
IO_PGTABLE_QUIRK_TLBI_ON_MAP(io_pgtable_tlb_flush_walk),
as is the commit message mentioned, it will drop mapping performance in
mtk platform.


> In fact if we simply passed an address range to 
> .iotlb_sync_map, io-pgtable probably wouldn't need to be involved at all 
> any more.

I know it is not a good idea probably by adding a new api, but I found
out that tlb sync only to be done after mapping one page, so if
mtk_iommu hope to do tlb sync once after all the pages map done, could
you give me some advices? thanks!

> 
> Robin.
> 
> > Signed-off-by: Chao Hao <chao.hao@mediatek.com>
> > ---
> >   drivers/iommu/mtk_iommu.c | 6 ++++++
> >   1 file changed, 6 insertions(+)
> > 
> > diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> > index 785b228d39a6..d3400c15ff7b 100644
> > --- a/drivers/iommu/mtk_iommu.c
> > +++ b/drivers/iommu/mtk_iommu.c
> > @@ -224,6 +224,11 @@ static void mtk_iommu_tlb_flush_range_sync(unsigned long iova, size_t size,
> >   	}
> >   }
> >   
> > +static void __mtk_iommu_tlb_flush_range_sync(unsigned long iova, size_t size)
> > +{
> > +	mtk_iommu_tlb_flush_range_sync(iova, size, 0, NULL)
> > +}
> > +
> >   static void mtk_iommu_tlb_flush_page_nosync(struct iommu_iotlb_gather *gather,
> >   					    unsigned long iova, size_t granule,
> >   					    void *cookie)
> > @@ -536,6 +541,7 @@ static const struct iommu_ops mtk_iommu_ops = {
> >   	.map		= mtk_iommu_map,
> >   	.unmap		= mtk_iommu_unmap,
> >   	.flush_iotlb_all = mtk_iommu_flush_iotlb_all,
> > +	.iotlb_sync_range = __mtk_iommu_tlb_flush_range_sync,
> >   	.iotlb_sync	= mtk_iommu_iotlb_sync,
> >   	.iova_to_phys	= mtk_iommu_iova_to_phys,
> >   	.probe_device	= mtk_iommu_probe_device,
> > 

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
