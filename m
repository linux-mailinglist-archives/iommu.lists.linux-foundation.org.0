Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 21EEC19F523
	for <lists.iommu@lfdr.de>; Mon,  6 Apr 2020 13:50:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id BB48623265;
	Mon,  6 Apr 2020 11:50:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qd3UItoZuG4Z; Mon,  6 Apr 2020 11:50:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id A2B1F231A1;
	Mon,  6 Apr 2020 11:50:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8B040C1AE2;
	Mon,  6 Apr 2020 11:50:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8933AC0177
 for <iommu@lists.linux-foundation.org>; Mon,  6 Apr 2020 11:50:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 70E4D88098
 for <iommu@lists.linux-foundation.org>; Mon,  6 Apr 2020 11:50:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f2zONW27q2rv for <iommu@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 11:50:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 6AFEE87F84
 for <iommu@lists.linux-foundation.org>; Mon,  6 Apr 2020 11:50:23 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 35D0268C4E; Mon,  6 Apr 2020 13:50:17 +0200 (CEST)
Date: Mon, 6 Apr 2020 13:50:16 +0200
From: Christoph Hellwig <hch@lst.de>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH 1/2] dma-mapping: add a dma_ops_bypass flag to struct
 device
Message-ID: <20200406115016.GA10941@lst.de>
References: <20200323083705.GA31245@lst.de> <20200323085059.GA32528@lst.de>
 <87sghz2ibh.fsf@linux.ibm.com> <20200323172256.GB31269@lst.de>
 <ffce1af6-a215-dee8-7b5c-2111f43accfd@ozlabs.ru>
 <20200324075402.GJ23447@lst.de>
 <41975da3-3a4a-fc3c-2b90-8d607cf220e6@ozlabs.ru>
 <20200325083740.GC21605@lst.de>
 <a705afc5-779d-baf4-e5d2-e2da04c82743@ozlabs.ru>
 <213b0c7d-f908-b4f4-466d-6240c3622cd6@ozlabs.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <213b0c7d-f908-b4f4-466d-6240c3622cd6@ozlabs.ru>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Michael Ellerman <mpe@ellerman.id.au>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
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

On Fri, Apr 03, 2020 at 07:38:11PM +1100, Alexey Kardashevskiy wrote:
> 
> 
> On 26/03/2020 12:26, Alexey Kardashevskiy wrote:
> > 
> > 
> > On 25/03/2020 19:37, Christoph Hellwig wrote:
> >> On Wed, Mar 25, 2020 at 03:51:36PM +1100, Alexey Kardashevskiy wrote:
> >>>>> This is for persistent memory which you can DMA to/from but yet it does
> >>>>> not appear in the system as a normal memory and therefore requires
> >>>>> special handling anyway (O_DIRECT or DAX, I do not know the exact
> >>>>> mechanics). All other devices in the system should just run as usual,
> >>>>> i.e. use 1:1 mapping if possible.
> >>>>
> >>>> On other systems (x86 and arm) pmem as long as it is page backed does
> >>>> not require any special handling.  This must be some weird way powerpc
> >>>> fucked up again, and I suspect you'll have to suffer from it.
> >>>
> >>>
> >>> It does not matter if it is backed by pages or not, the problem may also
> >>> appear if we wanted for example p2p PCI via IOMMU (between PHBs) and
> >>> MMIO might be mapped way too high in the system address space and make
> >>> 1:1 impossible.
> >>
> >> How can it be mapped too high for a direct mapping with a 64-bit DMA
> >> mask?
> > 
> > The window size is limited and often it is not even sparse. It requires
> > an 8 byte entry per an IOMMU page (which is most commonly is 64k max) so
> > 1TB limit (a guest RAM size) is a quite real thing. MMIO is mapped to
> > guest physical address space outside of this 1TB (on PPC).
> > 
> > 
> 
> I am trying now this approach on top of yours "dma-bypass.3" (it is
> "wip", needs an upper boundary check):
> 
> https://github.com/aik/linux/commit/49d73c7771e3f6054804f6cfa80b4e320111662d
> 
> Do you see any serious problem with this approach? Thanks!

Do you have a link to the whole branch?  The github UI is unfortunately
unusable for that (or I'm missing something).
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
