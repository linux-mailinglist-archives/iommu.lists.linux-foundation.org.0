Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D18BE8ECFC
	for <lists.iommu@lfdr.de>; Thu, 15 Aug 2019 15:36:02 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C75F6B7D;
	Thu, 15 Aug 2019 13:36:00 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 037893EE
	for <iommu@lists.linux-foundation.org>;
	Thu, 15 Aug 2019 13:35:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 958D087B
	for <iommu@lists.linux-foundation.org>;
	Thu, 15 Aug 2019 13:35:58 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id A750A68AFE; Thu, 15 Aug 2019 15:35:54 +0200 (CEST)
Date: Thu, 15 Aug 2019 15:35:54 +0200
From: Christoph Hellwig <hch@lst.de>
To: Corentin Labbe <clabbe.montjoie@gmail.com>, bskeggs@redhat.com,
	airlied@linux.ie, hch@lst.de, m.szyprowski@samsung.com,
	robin.murphy@arm.com, dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux-foundation.org
Subject: Re: DMA-API: cacheline tracking ENOMEM, dma-debug disabled due to
	nouveau ?
Message-ID: <20190815133554.GE12036@lst.de>
References: <20190814145033.GA11190@Red>
	<20190814174927.GT7444@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190814174927.GT7444@phenom.ffwll.local>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
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

On Wed, Aug 14, 2019 at 07:49:27PM +0200, Daniel Vetter wrote:
> On Wed, Aug 14, 2019 at 04:50:33PM +0200, Corentin Labbe wrote:
> > Hello
> > 
> > Since lot of release (at least since 4.19), I hit the following error message:
> > DMA-API: cacheline tracking ENOMEM, dma-debug disabled
> > 
> > After hitting that, I try to check who is creating so many DMA mapping and see:
> > cat /sys/kernel/debug/dma-api/dump | cut -d' ' -f2 | sort | uniq -c
> >       6 ahci
> >     257 e1000e
> >       6 ehci-pci
> >    5891 nouveau
> >      24 uhci_hcd
> > 
> > Does nouveau having this high number of DMA mapping is normal ?
> 
> Yeah seems perfectly fine for a gpu.

That is a lot and apparently overwhelm the dma-debug tracking.  Robin
rewrote this code in Linux 4.21 to work a little better, so I'm curious
why this might have changes in 4.19, as dma-debug did not change at
all there.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
