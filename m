Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD2D654BE
	for <lists.iommu@lfdr.de>; Thu, 11 Jul 2019 12:53:18 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 502A04EAA;
	Thu, 11 Jul 2019 10:53:16 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 4287F4EA3
	for <iommu@lists.linux-foundation.org>;
	Thu, 11 Jul 2019 10:44:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 518DBCF
	for <iommu@lists.linux-foundation.org>;
	Thu, 11 Jul 2019 10:44:25 +0000 (UTC)
X-UUID: f1369d86e92741d4a99963416bfb7caf-20190711
X-UUID: f1369d86e92741d4a99963416bfb7caf-20190711
Received: from mtkcas09.mediatek.inc [(172.21.101.178)] by
	mailgw02.mediatek.com (envelope-from <miles.chen@mediatek.com>)
	(mhqrelay.mediatek.com ESMTP with TLS)
	with ESMTP id 366328366; Thu, 11 Jul 2019 18:44:22 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
	mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server
	(TLS) id 15.0.1395.4; Thu, 11 Jul 2019 18:44:21 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
	(172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
	Transport; Thu, 11 Jul 2019 18:44:21 +0800
Message-ID: <1562841861.9534.2.camel@mtkswgap22>
Subject: Re: [PATCH] kernel/dma: export dma_alloc_from_contiguous to modules
From: Miles Chen <miles.chen@mediatek.com>
To: Robin Murphy <robin.murphy@arm.com>
Date: Thu, 11 Jul 2019 18:44:21 +0800
In-Reply-To: <7d14b94f-454f-d512-bc8f-589f71bc07ea@arm.com>
References: <20190711053343.28873-1-miles.chen@mediatek.com>
	<7d14b94f-454f-d512-bc8f-589f71bc07ea@arm.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,UNPARSEABLE_RELAY
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
	iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
	Christoph Hellwig <hch@lst.de>
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

On Thu, 2019-07-11 at 09:50 +0100, Robin Murphy wrote:
> On 11/07/2019 06:33, miles.chen@mediatek.com wrote:
> > From: Miles Chen <miles.chen@mediatek.com>
> > 
> > This change exports dma_alloc_from_contiguous and
> > dma_release_from_contiguous to modules.
> > 
> > Currently, we can add a reserve a memory node in dts files, make
> > it a CMA memory by setting compatible = "shared-dma-pool",
> > and setup the dev->cma_area by using of_reserved_mem_device_init_by_idx().
> > 
> > Export dma_alloc_from_contiguous and dma_release_from_contiguous, so we
> > can allocate/free from/to dev->cma_area in kernel modules.
> 
> As far as I understand, this was never intended for drivers to call 
> directly. If a device has its own private CMA area, then regular 
> dma_alloc_attrs() should allocate from that automatically; if that's not 
> happening already, then there's a bug somewhere.
> 
> Robin.

Thanks for your comment. 
After using dma_direct_ops, dma_alloc_attrs() works fine now.

Miles

> 
> > Signed-off-by: Miles Chen <miles.chen@mediatek.com>
> > ---
> >   kernel/dma/contiguous.c | 2 ++
> >   1 file changed, 2 insertions(+)
> > 
> > diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
> > index b2a87905846d..d5920bdedc77 100644
> > --- a/kernel/dma/contiguous.c
> > +++ b/kernel/dma/contiguous.c
> > @@ -197,6 +197,7 @@ struct page *dma_alloc_from_contiguous(struct device *dev, size_t count,
> >   
> >   	return cma_alloc(dev_get_cma_area(dev), count, align, no_warn);
> >   }
> > +EXPORT_SYMBOL_GPL(dma_alloc_from_contiguous);
> >   
> >   /**
> >    * dma_release_from_contiguous() - release allocated pages
> > @@ -213,6 +214,7 @@ bool dma_release_from_contiguous(struct device *dev, struct page *pages,
> >   {
> >   	return cma_release(dev_get_cma_area(dev), pages, count);
> >   }
> > +EXPORT_SYMBOL_GPL(dma_release_from_contiguous);
> >   
> >   /*
> >    * Support for reserved memory regions defined in device tree
> > 


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
