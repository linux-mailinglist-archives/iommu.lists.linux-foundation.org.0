Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DF0234439
	for <lists.iommu@lfdr.de>; Fri, 31 Jul 2020 12:47:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6EF7F868CB;
	Fri, 31 Jul 2020 10:47:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xb0hFcJ64DRV; Fri, 31 Jul 2020 10:47:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B3547868C8;
	Fri, 31 Jul 2020 10:47:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 91D90C0864;
	Fri, 31 Jul 2020 10:47:18 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B49ACC004D
 for <iommu@lists.linux-foundation.org>; Fri, 31 Jul 2020 10:47:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A27A2886F4
 for <iommu@lists.linux-foundation.org>; Fri, 31 Jul 2020 10:47:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9VGbROJ7ZJTR for <iommu@lists.linux-foundation.org>;
 Fri, 31 Jul 2020 10:47:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by hemlock.osuosl.org (Postfix) with ESMTPS id B6BC6886F0
 for <iommu@lists.linux-foundation.org>; Fri, 31 Jul 2020 10:47:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 45601AC50;
 Fri, 31 Jul 2020 10:47:27 +0000 (UTC)
Message-ID: <a0c8eb70cedb05e310c2957a1c0f7968c1e39d53.camel@suse.de>
Subject: Re: dma-pool fixes
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Amit Pundir <amit.pundir@linaro.org>
Date: Fri, 31 Jul 2020 12:47:12 +0200
In-Reply-To: <CAMi1Hd3QNtZVEFUgDprT==wcVHKv6TsvpT3RurVJTDb1op2LnA@mail.gmail.com>
References: <20200728104742.422960-1-hch@lst.de>
 <CAMi1Hd3=6ZZykF1yx_CChqx71k6T-wj12TzJiz_uJZbwrEtTXw@mail.gmail.com>
 <20200728120716.GA2507@lst.de>
 <CAMi1Hd1c3cNMYg+S5Pwuv30QCdcWJw+QxkWmNP34s3nb+_yUuA@mail.gmail.com>
 <20200728124114.GA4865@lst.de>
 <CAMi1Hd0wpcLVJ41h6gs4H0WEDVpNEs7N=wx+KQ_yRKeSv0kQ9g@mail.gmail.com>
 <20200728153055.GA16701@lst.de>
 <18a3b93cc5ba3e0e39ae1b14759ce31121d54045.camel@suse.de>
 <CAMi1Hd3QNtZVEFUgDprT==wcVHKv6TsvpT3RurVJTDb1op2LnA@mail.gmail.com>
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Cc: jeremy.linton@arm.com, iommu@lists.linux-foundation.org,
 linux-rpi-kernel@lists.infradead.org, David Rientjes <rientjes@google.com>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>
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

Hi Amit,

On Wed, 2020-07-29 at 17:52 +0530, Amit Pundir wrote:
> On Wed, 29 Jul 2020 at 16:15, Nicolas Saenz Julienne
> <nsaenzjulienne@suse.de> wrote:
> > On Tue, 2020-07-28 at 17:30 +0200, Christoph Hellwig wrote:
> > > On Tue, Jul 28, 2020 at 06:18:41PM +0530, Amit Pundir wrote:
> > > > > Oh well, this leaves me confused again.  It looks like your setup
> > > > > really needs a CMA in zone normal for the dma or dma32 pool.
> > > > 
> > > > Anything I should look up in the downstream kernel/dts?
> > > 
> > > I don't have a good idea right now.  Nicolas, can you think of something
> > > else?
> > 
> > To summarise, the device is:
> >  - Using the dma-direct code path.
> >  - Requesting ZONE_DMA memory to then fail when provided memory falls in
> >    ZONE_DMA. Actually, the only acceptable memory comes from CMA, which is
> >    located topmost of the 4GB boundary.
> > 
> > My wild guess is that we may be abusing an iommu identity mapping setup by
> > firmware.
> > 
> > That said, what would be helpful to me is to find out the troublesome device.
> > Amit, could you try adding this patch along with Christoph's modified series
> > (so the board boots). Ultimately DMA atomic allocations are not that common, so
> > we should get only a few hits:
> 
> Hi, still not hitting dma_alloc_from_pool().

Sorry I insisted, but not hitting the atomic path makes the issue even harder
to understand.

> I hit the following direct alloc path only once, at starting:
> 
> dma_alloc_coherent ()
> -> dma_alloc_attrs()
>    -> dma_is_direct() -> dma_direct_alloc()
>       -> dma_direct_alloc_pages()
>          -> dma_should_alloc_from_pool() #returns FALSE from here
> 
> After that I'm hitting following iommu dma alloc path all the time:
> 
> dma_alloc_coherent()
> -> dma_alloc_attrs()
>    -> (ops->alloc) -> iommu_dma_alloc()
>       -> iommu_dma_alloc_remap() #always returns from here
> 
> So dma_alloc_from_pool() is not getting called at all in either of the
> above cases.

Ok, so lets see who's doing what and with what constraints:

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 4959f5df21bd..d28b3e4b91d3 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -594,6 +594,9 @@ static void *iommu_dma_alloc_remap(struct device *dev, size_t size,
        dma_addr_t iova;
        void *vaddr;
 
+       dev_info(dev, "%s, bus_dma_limit %llx, dma_mask %llx, coherent_dma_mask %llx, in irq %lu, size %lu, gfp %x, attrs %lx\n",
+                __func__, dev->bus_dma_limit, *dev->dma_mask, dev->coherent_dma_mask, in_interrupt(), size, gfp, attrs);
+
        *dma_handle = DMA_MAPPING_ERROR;
 
        if (unlikely(iommu_dma_deferred_attach(dev, domain)))
diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index bb0041e99659..e5474e709e7b 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -160,6 +160,9 @@ void *dma_direct_alloc_pages(struct device *dev, size_t size,
 
        size = PAGE_ALIGN(size);
 
+       dev_info(dev, "%s, bus_dma_limit %llx, dma_mask %llx, coherent_dma_mask %llx, in irq %lu, size %lu, gfp %x, attrs %lx\n",
+                __func__, dev->bus_dma_limit, *dev->dma_mask, dev->coherent_dma_mask, in_interrupt(), size, gfp, attrs);
+
        if (dma_should_alloc_from_pool(dev, gfp, attrs)) {
                ret = dma_alloc_from_pool(dev, size, &page, gfp);
                if (!ret)

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
