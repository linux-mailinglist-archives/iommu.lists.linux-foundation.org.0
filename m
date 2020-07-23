Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D22122A744
	for <lists.iommu@lfdr.de>; Thu, 23 Jul 2020 08:09:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 77DC2265FF;
	Thu, 23 Jul 2020 06:09:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XSrrckYudNGO; Thu, 23 Jul 2020 06:09:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 3C99A265E0;
	Thu, 23 Jul 2020 06:09:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 31BABC004E;
	Thu, 23 Jul 2020 06:09:56 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 88366C004C
 for <iommu@lists.linux-foundation.org>; Thu, 23 Jul 2020 06:09:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 74D97848A9
 for <iommu@lists.linux-foundation.org>; Thu, 23 Jul 2020 06:09:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4MKF+wwHwegG for <iommu@lists.linux-foundation.org>;
 Thu, 23 Jul 2020 06:09:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by whitealder.osuosl.org (Postfix) with ESMTPS id BE0CD891EA
 for <iommu@lists.linux-foundation.org>; Thu, 23 Jul 2020 06:09:51 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id EF38C6736F; Thu, 23 Jul 2020 08:09:47 +0200 (CEST)
Date: Thu, 23 Jul 2020 08:09:47 +0200
From: Christoph Hellwig <hch@lst.de>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Subject: Re: [PATCH] dma-contiguous: cleanup dma_alloc_contiguous
Message-ID: <20200723060947.GA10381@lst.de>
References: <20200722144307.30318-1-hch@lst.de>
 <20200723060047.GE5476@Asurada-Nvidia>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200723060047.GE5476@Asurada-Nvidia>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: iommu@lists.linux-foundation.org, robin.murphy@arm.com,
 Christoph Hellwig <hch@lst.de>
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

On Wed, Jul 22, 2020 at 11:00:48PM -0700, Nicolin Chen wrote:
> On Wed, Jul 22, 2020 at 04:43:07PM +0200, Christoph Hellwig wrote:
> > Split out a cma_alloc_aligned helper to deal with the "interesting"
> > calling conventions for cma_alloc, which then allows to the main
> > function to be written straight forward.  This also takes advantage
> > of the fact that NULL dev arguments have been gone from the DMA API
> > for a while.
> > 
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > ---
> >  kernel/dma/contiguous.c | 31 ++++++++++++++-----------------
> >  1 file changed, 14 insertions(+), 17 deletions(-)
> > 
> > diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
> > index 15bc5026c485f2..f16b8d3f9932de 100644
> > --- a/kernel/dma/contiguous.c
> > +++ b/kernel/dma/contiguous.c
> > @@ -215,6 +215,13 @@ bool dma_release_from_contiguous(struct device *dev, struct page *pages,
> >  	return cma_release(dev_get_cma_area(dev), pages, count);
> >  }
> >  
> > +static struct page *cma_alloc_aligned(struct cma *cma, size_t size, gfp_t gfp)
> > +{
> > +	return cma_alloc(dma_contiguous_default_area, size >> PAGE_SHIFT,
> 
> Probably should be 'cma' here instead of 'dma_contiguous_default_area'?

Yes.  If only I could test the per-device CMAs on a normal x86 setup :)
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
