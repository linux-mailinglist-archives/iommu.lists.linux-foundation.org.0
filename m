Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 4191B3E29CE
	for <lists.iommu@lfdr.de>; Fri,  6 Aug 2021 13:38:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA058607D2;
	Fri,  6 Aug 2021 11:38:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UMG15uFEri03; Fri,  6 Aug 2021 11:38:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id ADE216078D;
	Fri,  6 Aug 2021 11:38:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 89C44C001F;
	Fri,  6 Aug 2021 11:38:10 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4C0BAC000E
 for <iommu@lists.linux-foundation.org>; Fri,  6 Aug 2021 11:38:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 24464400CA
 for <iommu@lists.linux-foundation.org>; Fri,  6 Aug 2021 11:38:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9Y-uvMUhHvmw for <iommu@lists.linux-foundation.org>;
 Fri,  6 Aug 2021 11:38:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E468A402F6
 for <iommu@lists.linux-foundation.org>; Fri,  6 Aug 2021 11:38:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1B7BA60FE7;
 Fri,  6 Aug 2021 11:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628249887;
 bh=gHwP7vxb5aRgHKwYrdHY0/RGdX7tYBYUp42oKa4+bYI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WoTDQAO0+/zi9/aizS09IIFliQeV+6tU9IobFZ+lG40KODR6cRZS1jk73SC9Yjrqi
 FDUIn189PKaOrWsjrPW3finDOIGYSq/U/tj6Kj5OXdXIKjCn8wexT1JWj+dln1xglZ
 AoDCUvUSM/hwSLtgJ0KbZKdtT8RPJfpaNE7KTbVLIQvPscJSDNiqRgcUe/kH641bKU
 qzwjXIy3Dfn4c+J99FH54/8OX4RUP3IUF3dfVEYVs6idNkSYySvJ3h3H/blmyK8mVo
 mym2OuwwaH2Glq8paHP3oDWi28eQCfrQJaxxOfBXnjgASlxVImC8X7C+5/MCyFFpkg
 q/KqDKZIXErAQ==
Date: Fri, 6 Aug 2021 12:38:02 +0100
From: Will Deacon <will@kernel.org>
To: David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH v2 3/4] dma-iommu: pass SKIP_CPU_SYNC to swiotlb unmap
Message-ID: <20210806113802.GB2531@willie-the-truck>
References: <20210709033502.3545820-1-stevensd@google.com>
 <20210709033502.3545820-4-stevensd@google.com>
 <20210802135446.GE28547@willie-the-truck>
 <CAD=HUj4+62dYZTWfbPjh8eLRY6FQak8nBS8OD85t0xk_+JvDpA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=HUj4+62dYZTWfbPjh8eLRY6FQak8nBS8OD85t0xk_+JvDpA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: open list <linux-kernel@vger.kernel.org>, Tom Murphy <murphyt7@tcd.ie>,
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>
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

On Thu, Aug 05, 2021 at 02:26:10PM +0900, David Stevens wrote:
> On Mon, Aug 2, 2021 at 10:54 PM Will Deacon <will@kernel.org> wrote:
> >
> > On Fri, Jul 09, 2021 at 12:35:01PM +0900, David Stevens wrote:
> > > From: David Stevens <stevensd@chromium.org>
> > >
> > > If SKIP_CPU_SYNC isn't already set, then iommu_dma_unmap_(page|sg) has
> > > already called iommu_dma_sync_(single|sg)_for_cpu, so there is no need
> > > to copy from the bounce buffer again.
> > >
> > > Signed-off-by: David Stevens <stevensd@chromium.org>
> > > ---
> > >  drivers/iommu/dma-iommu.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
> > > index e79e274d2dc5..0a9a9a343e64 100644
> > > --- a/drivers/iommu/dma-iommu.c
> > > +++ b/drivers/iommu/dma-iommu.c
> > > @@ -505,7 +505,8 @@ static void __iommu_dma_unmap_swiotlb(struct device *dev, dma_addr_t dma_addr,
> > >       __iommu_dma_unmap(dev, dma_addr, size);
> > >
> > >       if (unlikely(is_swiotlb_buffer(phys)))
> > > -             swiotlb_tbl_unmap_single(dev, phys, size, dir, attrs);
> > > +             swiotlb_tbl_unmap_single(dev, phys, size, dir,
> > > +                                      attrs | DMA_ATTR_SKIP_CPU_SYNC);
> > >  }
> >
> > I think it would be cleaner to drop DMA_ATTR_SKIP_CPU_SYNC in the callers
> > once they've called iommu_dma_sync_*_for_cpu().
> 
> Dropping that flag in iommu_dma_unmap_* would result in always copying
> from the swiotlb here, which is the opposite direction of what this
> patch is trying to do.

Sorry, probably poor wording on my part. What I mean is, rather than add
DMA_ATTR_SKIP_CPU_SYNC here, how about having the callers include it
in attrs instead, since they're the ones doing the initial sync?

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
