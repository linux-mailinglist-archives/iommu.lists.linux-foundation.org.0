Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8CF269E87
	for <lists.iommu@lfdr.de>; Tue, 15 Sep 2020 08:32:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 94BCC20497;
	Tue, 15 Sep 2020 06:32:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6b+Ocixv9FVT; Tue, 15 Sep 2020 06:32:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 5DF6520491;
	Tue, 15 Sep 2020 06:32:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 416F3C0051;
	Tue, 15 Sep 2020 06:32:31 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 81167C0051
 for <iommu@lists.linux-foundation.org>; Tue, 15 Sep 2020 06:32:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 6937720491
 for <iommu@lists.linux-foundation.org>; Tue, 15 Sep 2020 06:32:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZttmAZ2b4xdg for <iommu@lists.linux-foundation.org>;
 Tue, 15 Sep 2020 06:32:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by silver.osuosl.org (Postfix) with ESMTPS id 8132720477
 for <iommu@lists.linux-foundation.org>; Tue, 15 Sep 2020 06:32:29 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 10D806736F; Tue, 15 Sep 2020 08:32:25 +0200 (CEST)
Date: Tue, 15 Sep 2020 08:32:24 +0200
From: Christoph Hellwig <hch@lst.de>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH 11/17] sgiseeq: convert to dma_alloc_noncoherent
Message-ID: <20200915063224.GB19113@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200914151358.GQ6583@casper.infradead.org>
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

On Mon, Sep 14, 2020 at 04:13:58PM +0100, Matthew Wilcox wrote:
> On Mon, Sep 14, 2020 at 04:44:27PM +0200, Christoph Hellwig wrote:
> >  drivers/net/ethernet/i825xx/lasi_82596.c |  25 ++---
> >  drivers/net/ethernet/i825xx/lib82596.c   | 114 ++++++++++++++---------
> >  drivers/net/ethernet/i825xx/sni_82596.c  |   4 -
> >  drivers/net/ethernet/seeq/sgiseeq.c      |  28 ++++--
> >  drivers/scsi/53c700.c                    |   9 +-
> >  5 files changed, 103 insertions(+), 77 deletions(-)
> 
> I think your patch slicing-and-dicing went wrong here ;-(

Pretty much..  Fixed up for the next version.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
