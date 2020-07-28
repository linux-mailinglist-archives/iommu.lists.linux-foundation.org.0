Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B945230758
	for <lists.iommu@lfdr.de>; Tue, 28 Jul 2020 12:09:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id CE2D1230F6;
	Tue, 28 Jul 2020 10:09:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S+qbqWyVM4ww; Tue, 28 Jul 2020 10:09:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id EF1AB230F3;
	Tue, 28 Jul 2020 10:09:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D2453C004D;
	Tue, 28 Jul 2020 10:09:25 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E2C20C004D
 for <iommu@lists.linux-foundation.org>; Tue, 28 Jul 2020 10:09:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id D877E86995
 for <iommu@lists.linux-foundation.org>; Tue, 28 Jul 2020 10:09:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8gDmkVoPeZb9 for <iommu@lists.linux-foundation.org>;
 Tue, 28 Jul 2020 10:09:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 719518632F
 for <iommu@lists.linux-foundation.org>; Tue, 28 Jul 2020 10:09:23 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 1FA8868B05; Tue, 28 Jul 2020 12:09:19 +0200 (CEST)
Date: Tue, 28 Jul 2020 12:09:18 +0200
From: Christoph Hellwig <hch@lst.de>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: Re: [PATCH] dma-pool: Do not allocate pool memory from CMA
Message-ID: <20200728100918.GA26364@lst.de>
References: <01831596e4a2a6c9c066138b23bd30435f8e5569.camel@suse.de>
 <CAMi1Hd3C6kh5E49EgytBAQ_2AE_jvnp+eSNsxBYaux+exSvdbg@mail.gmail.com>
 <6db722947546221ed99d3f473f78e1a6de65d7d6.camel@suse.de>
 <CAMi1Hd0Xz6kOJFpA5PEpi6RDDGOcz0RmQ7tTOkuXq4QneOO_vQ@mail.gmail.com>
 <0dc1e922bf87fa73790e7471b3974528dd261486.camel@suse.de>
 <CAMi1Hd3O2HHBsnt=sac7FdcW0-3=4S3g_F9f__2h5gTsudfirA@mail.gmail.com>
 <20200724134114.GA3152@lst.de>
 <a9b811a84ac21c13693e6ffefd2914b911542e18.camel@suse.de>
 <20200728091335.GA23744@lst.de>
 <e39e8f87ed5b4e9da2f08a0651801954e61f4b4e.camel@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e39e8f87ed5b4e9da2f08a0651801954e61f4b4e.camel@suse.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Amit Pundir <amit.pundir@linaro.org>, lkml <linux-kernel@vger.kernel.org>,
 jeremy.linton@arm.com, Sumit Semwal <sumit.semwal@linaro.org>,
 iommu@lists.linux-foundation.org, John Stultz <john.stultz@linaro.org>,
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

On Tue, Jul 28, 2020 at 11:30:32AM +0200, Nicolas Saenz Julienne wrote:
> On Tue, 2020-07-28 at 11:13 +0200, Christoph Hellwig wrote:
> > On Mon, Jul 27, 2020 at 07:56:56PM +0200, Nicolas Saenz Julienne wrote:
> > > Hi Christoph,
> > > thanks for having a look at this!
> > > 
> > > On Fri, 2020-07-24 at 15:41 +0200, Christoph Hellwig wrote:
> > > > Yes, the iommu is an interesting case, and the current code is
> > > > wrong for that.
> > > 
> > > Care to expand on this? I do get that checking dma_coherent_ok() on memory
> > > that'll later on be mapped into an iommu is kind of silly, although I think
> > > harmless in Amir's specific case, since devices have wide enough dma-
> ranges. 
> > > Is
> > > there more to it?
> > 
> > I think the problem is that it can lead to not finding suitable memory.
> > 
> > > > Can you try the patch below?  It contains a modified version of Nicolas'
> > > > patch to try CMA again for the expansion and a new (for now hackish) way
> > > > to
> > > > not apply the addressability check for dma-iommu allocations.
> > > > 
> > > > diff --git a/kernel/dma/pool.c b/kernel/dma/pool.c
> > > > index 6bc74a2d51273e..ec5e525d2b9309 100644
> > > > --- a/kernel/dma/pool.c
> > > > +++ b/kernel/dma/pool.c
> > > > @@ -3,7 +3,9 @@
> > > >   * Copyright (C) 2012 ARM Ltd.
> > > >   * Copyright (C) 2020 Google LLC
> > > >   */
> > > > +#include <linux/cma.h>
> > > >  #include <linux/debugfs.h>
> > > > +#include <linux/dma-contiguous.h>
> > > >  #include <linux/dma-direct.h>
> > > >  #include <linux/dma-noncoherent.h>
> > > >  #include <linux/init.h>
> > > > @@ -55,6 +57,31 @@ static void dma_atomic_pool_size_add(gfp_t gfp, size_t
> > > > size)
> > > >  		pool_size_kernel += size;
> > > >  }
> > > >  
> > > > +static bool cma_in_zone(gfp_t gfp)
> > > > +{
> > > > +	phys_addr_t end;
> > > > +	unsigned long size;
> > > > +	struct cma *cma;
> > > > +
> > > > +	cma = dev_get_cma_area(NULL);
> > > > +	if (!cma)
> > > > +		return false;
> > > > +
> > > > +	size = cma_get_size(cma);
> > > > +	if (!size)
> > > > +		return false;
> > > > +	end = cma_get_base(cma) - memblock_start_of_DRAM() + size - 1;
> > > > +
> > > > +	/* CMA can't cross zone boundaries, see cma_activate_area() */
> > > > +	if (IS_ENABLED(CONFIG_ZONE_DMA) && (gfp & GFP_DMA) &&
> > > > +	    end <= DMA_BIT_MASK(zone_dma_bits))
> > > > +		return true;
> > > > +	if (IS_ENABLED(CONFIG_ZONE_DMA32) && (gfp & GFP_DMA32) &&
> > > > +	    end <= DMA_BIT_MASK(32))
> > > > +		return true;
> > > > +	return true;
> > > 
> > > IIUC this will always return true given a CMA is present. Which reverts to
> > > the
> > > previous behaviour (previous as in breaking some rpi4 setups), isn't it?
> > 
> > Was that really what broke the PI?  I'll try to get the split out series
> > today, which might have a few more tweaks, and then we'll need to test it
> > both on these rpi4 setups and Amits phone.
> 
> There was two issues with RPi:
>  - Not validating that pool allocated memory was OK for the device
>  - Locating all atomic pools in CMA, which doesn't work for all RPi4 devices*,
>    and IMO misses the point of having multiple pools.
> 
> * With ACPI RPi4 we have CMA located in ZONE_DMA32, yet have an atomic pool
> consumer, PCIe, that only wants memory in the [0 3GB] area, effectively needing
> ZONE_DMA memory.

Ok, I found a slight bug that wasn't intended.  I wanted to make sure
we can always fall back to a lower pool, but got that wrong.  Should be
fixed in the next version.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
