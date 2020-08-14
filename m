Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 8124924479B
	for <lists.iommu@lfdr.de>; Fri, 14 Aug 2020 12:03:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id BC51025D29;
	Fri, 14 Aug 2020 10:03:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nMEXzbHf9cyQ; Fri, 14 Aug 2020 10:03:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 1175925CE1;
	Fri, 14 Aug 2020 10:03:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EBB23C004D;
	Fri, 14 Aug 2020 10:03:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 373CDC004D
 for <iommu@lists.linux-foundation.org>; Fri, 14 Aug 2020 10:03:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 25B4C87361
 for <iommu@lists.linux-foundation.org>; Fri, 14 Aug 2020 10:03:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FR2rY2hdHxnG for <iommu@lists.linux-foundation.org>;
 Fri, 14 Aug 2020 10:03:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 410D186D7D
 for <iommu@lists.linux-foundation.org>; Fri, 14 Aug 2020 10:03:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0E37FAD1B;
 Fri, 14 Aug 2020 10:03:34 +0000 (UTC)
Message-ID: <ae794be3426776d5977fdb12e42807c0d82ce203.camel@suse.de>
Subject: Re: [PATCH v3 2/2] dma-pool: Only allocate from CMA when in same
 memory zone
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Christoph Hellwig <hch@lst.de>
Date: Fri, 14 Aug 2020 12:03:09 +0200
In-Reply-To: <20200814060642.GA1338@lst.de>
References: <20200806184756.32075-1-nsaenzjulienne@suse.de>
 <20200806184756.32075-3-nsaenzjulienne@suse.de>
 <20200807052116.GA584@lst.de>
 <aae9250e660339142e9390427a603c4cf4e282af.camel@suse.de>
 <20200808063354.GA17329@lst.de> <20200814060642.GA1338@lst.de>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Cc: amit.pundir@linaro.org, linux-kernel@vger.kernel.org, jeremy.linton@arm.com,
 iommu@lists.linux-foundation.org, linux-rpi-kernel@lists.infradead.org,
 rientjes@google.com, Robin Murphy <robin.murphy@arm.com>
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

On Fri, 2020-08-14 at 08:06 +0200, Christoph Hellwig wrote:
> On Sat, Aug 08, 2020 at 08:33:54AM +0200, Christoph Hellwig wrote:
> > On Fri, Aug 07, 2020 at 10:50:19AM +0200, Nicolas Saenz Julienne wrote:
> > > On Fri, 2020-08-07 at 07:21 +0200, Christoph Hellwig wrote:
> > > > On Thu, Aug 06, 2020 at 08:47:55PM +0200, Nicolas Saenz Julienne wrote:
> > > > > There is no guarantee to CMA's placement, so allocating a zone specific
> > > > > atomic pool from CMA might return memory from a completely different
> > > > > memory zone. To get around this double check CMA's placement before
> > > > > allocating from it.
> > > > 
> > > > As the builtbot pointed out, memblock_start_of_DRAM can't be used from
> > > > non-__init code.  But lookig at it I think throwing that in
> > > > is bogus anyway, as cma_get_base returns a proper physical address
> > > > already.
> > > 
> > > It does indeed, but I'm comparing CMA's base with bitmasks that don't take into
> > > account where the memory starts. Say memory starts at 0x80000000, and CMA falls
> > > into ZONE_DMA [0x80000000 0xC0000000], if you want to compare it with
> > > DMA_BIT_MASK(zone_dma_bits) you're forced to unify the memory bases.
> > > 
> > > That said, I now realize that this doesn't work for ZONE_DMA32 which has a hard
> > > limit on 32bit addresses reglardless of the memory base.
> > > 
> > > That said I still need to call memblock_start_of_DRAM() any suggestions WRT
> > > that? I could save the value in dma_atomic_pool_init(), which is __init code.
> > 
> > The pool must be about a 32-bit physical address.  The offsets can be
> > different for every device..

I now see what you mean.

I was trying to blindly fit CMA with arm64's DMA zone setup, which, as it turns
out, doesn't really honor its purpose. arm64 introduced ZONE_DMA to provide a
30-bit address space, but we're creating it regardless of whether it exists or
not. This creates a mismatch between zone_dma_bits and ZONE_DMA's real
placement. I'll try to look at fixing that in arm64.

> Do you plan to resend this one without the memblock_start_of_DRAM
> thingy?

Yes, sorry for the wait, I've been on vacation and short on time, I'll send it
during the day.

Regards,
Nicolas

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
