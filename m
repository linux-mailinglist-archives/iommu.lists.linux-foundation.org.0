Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F43218C93
	for <lists.iommu@lfdr.de>; Wed,  8 Jul 2020 18:10:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 220C98867F;
	Wed,  8 Jul 2020 16:10:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RNIHUh7RU-Ou; Wed,  8 Jul 2020 16:10:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 38E92888EF;
	Wed,  8 Jul 2020 16:10:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2707CC0895;
	Wed,  8 Jul 2020 16:10:17 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CD906C016F
 for <iommu@lists.linux-foundation.org>; Wed,  8 Jul 2020 16:10:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B503D87542
 for <iommu@lists.linux-foundation.org>; Wed,  8 Jul 2020 16:10:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m8FfgnHPbhL8 for <iommu@lists.linux-foundation.org>;
 Wed,  8 Jul 2020 16:10:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 2488C87D24
 for <iommu@lists.linux-foundation.org>; Wed,  8 Jul 2020 16:10:15 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 3407068B05; Wed,  8 Jul 2020 18:10:11 +0200 (CEST)
Date: Wed, 8 Jul 2020 18:10:10 +0200
From: Christoph Hellwig <hch@lst.de>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: Re: [PATCH] dma-pool: use single atomic pool for both DMA zones
Message-ID: <20200708161010.GA30184@lst.de>
References: <20200707122804.21262-1-nsaenzjulienne@suse.de>
 <20200708153509.GA26743@lst.de>
 <e81db35628a22a0d1635699d1e87bacde706ad25.camel@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e81db35628a22a0d1635699d1e87bacde706ad25.camel@suse.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: linux-kernel@vger.kernel.org, jeremy.linton@arm.com,
 iommu@lists.linux-foundation.org, linux-rpi-kernel@lists.infradead.org,
 David Rientjes <rientjes@google.com>, Robin Murphy <robin.murphy@arm.com>,
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

On Wed, Jul 08, 2020 at 06:00:35PM +0200, Nicolas Saenz Julienne wrote:
> On Wed, 2020-07-08 at 17:35 +0200, Christoph Hellwig wrote:
> > On Tue, Jul 07, 2020 at 02:28:04PM +0200, Nicolas Saenz Julienne wrote:
> > > When allocating atomic DMA memory for a device, the dma-pool core
> > > queries __dma_direct_optimal_gfp_mask() to check which atomic pool to
> > > use. It turns out the GFP flag returned is only an optimistic guess.
> > > The pool selected might sometimes live in a zone higher than the
> > > device's view of memory.
> > > 
> > > As there isn't a way to grantee a mapping between a device's DMA
> > > constraints and correct GFP flags this unifies both DMA atomic pools.
> > > The resulting pool is allocated in the lower DMA zone available, if any,
> > > so as for devices to always get accessible memory while having the
> > > flexibility of using dma_pool_kernel for the non constrained ones.
> > > 
> > > Fixes: c84dc6e68a1d ("dma-pool: add additional coherent pools to map to gfp
> > > mask")
> > > Reported-by: Jeremy Linton <jeremy.linton@arm.com>
> > > Suggested-by: Robin Murphy <robin.murphy@arm.com>
> > > Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> > 
> > Hmm, this is not what I expected from the previous thread.  I thought
> > we'd just use one dma pool based on runtime available of the zones..
> 
> I may be misunderstanding you, but isn't that going back to how things used to
> be before pulling in David Rientjes' work? The benefit of having a GFP_KERNEL
> pool is that non-address-constrained devices can get their atomic memory there,
> instead of consuming somewhat scarcer low memory.

Yes, I think we are misunderstanding each other.  I don't want to remove
any pool, just make better runtime decisions when to use them.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
