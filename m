Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A85A269EA2
	for <lists.iommu@lfdr.de>; Tue, 15 Sep 2020 08:36:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id CC960865CF;
	Tue, 15 Sep 2020 06:36:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S4Kd2XmyvrZM; Tue, 15 Sep 2020 06:36:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 25259863E8;
	Tue, 15 Sep 2020 06:36:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0E8B2C0051;
	Tue, 15 Sep 2020 06:36:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 618CEC0051
 for <iommu@lists.linux-foundation.org>; Tue, 15 Sep 2020 06:36:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 4219D863E8
 for <iommu@lists.linux-foundation.org>; Tue, 15 Sep 2020 06:36:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6kpn4wxVM5ya for <iommu@lists.linux-foundation.org>;
 Tue, 15 Sep 2020 06:36:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 01792865CF
 for <iommu@lists.linux-foundation.org>; Tue, 15 Sep 2020 06:36:22 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id CFEFC6736F; Tue, 15 Sep 2020 08:36:18 +0200 (CEST)
Date: Tue, 15 Sep 2020 08:36:18 +0200
From: Christoph Hellwig <hch@lst.de>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: a saner API for allocating DMA addressable pages v2
Message-ID: <20200915063618.GD19113@lst.de>
References: <20200914144433.1622958-1-hch@lst.de>
 <20200914152617.GR6583@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200914152617.GR6583@casper.infradead.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: alsa-devel@alsa-project.org, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 linux-mm@kvack.org, linux1394-devel@lists.sourceforge.net,
 Christoph Hellwig <hch@lst.de>, linux-samsung-soc@vger.kernel.org,
 Joonyoung Shim <jy0922.shim@samsung.com>, linux-scsi@vger.kernel.org,
 Ben Skeggs <bskeggs@redhat.com>, Matt Porter <mporter@kernel.crashing.org>,
 linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 netdev@vger.kernel.org, Seung-Woo Kim <sw0312.kim@samsung.com>,
 linux-mips@vger.kernel.org, iommu@lists.linux-foundation.org,
 Stefan Richter <stefanr@s5r6.in-berlin.de>
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

On Mon, Sep 14, 2020 at 04:26:17PM +0100, Matthew Wilcox wrote:
> On Mon, Sep 14, 2020 at 04:44:16PM +0200, Christoph Hellwig wrote:
> > I'm still a little unsure about the API naming, as alloc_pages sort of
> > implies a struct page return value, but we return a kernel virtual
> > address.
> 
> Erm ... dma_alloc_pages() returns a struct page, so is this sentence
> stale?

Yes.

> You say that like it's a bad thing.  I think the problem is more that
> people don't understand what non-coherent means and think they're
> supporting it when they're not.
> 
> dma_alloc_manual_flushing()?

That sounds pretty awkward..

> 
> > As a follow up I plan to move the implementation of the
> > DMA_ATTR_NO_KERNEL_MAPPING flag over to this framework as well, given
> > that is also is a fundamentally non coherent allocation.  The replacement
> > for that flag would then return a struct page, as it is allowed to
> > actually return pages without a kernel mapping as the name suggested
> > (although most of the time they will actually have a kernel mapping..)
> 
> If the page doesn't have a kernel mapping, shouldn't it return a PFN
> or a phys_addr?

Most APIs we'll feed it into need a struct page.  The difference is just
that it can be a highmem page.  And if we want to get fancy we could
change the kernel mapping to PROT_NONE eventually.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
