Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 7732D1CBEDB
	for <lists.iommu@lfdr.de>; Sat,  9 May 2020 10:19:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7FAE387886;
	Sat,  9 May 2020 08:19:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YMdbVi3zeEpQ; Sat,  9 May 2020 08:19:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 03B2E86DB2;
	Sat,  9 May 2020 08:19:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DBFA9C07FF;
	Sat,  9 May 2020 08:19:54 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7F322C07FF
 for <iommu@lists.linux-foundation.org>; Sat,  9 May 2020 08:19:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 6DF4B87886
 for <iommu@lists.linux-foundation.org>; Sat,  9 May 2020 08:19:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ho8P9sw+BQfB for <iommu@lists.linux-foundation.org>;
 Sat,  9 May 2020 08:19:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 07F3B86DB2
 for <iommu@lists.linux-foundation.org>; Sat,  9 May 2020 08:19:51 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 36D5968C7B; Sat,  9 May 2020 10:19:47 +0200 (CEST)
Date: Sat, 9 May 2020 10:19:46 +0200
From: Christoph Hellwig <hch@lst.de>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH 1/4] dma-mapping: move the remaining DMA API calls out
 of line
Message-ID: <20200509081946.GA21834@lst.de>
References: <20200414122506.438134-1-hch@lst.de>
 <20200414122506.438134-2-hch@lst.de>
 <c2572d30-f03c-450d-e257-3a8673b42d44@ozlabs.ru>
 <20200415061859.GA32392@lst.de>
 <5139e8e1-6389-3387-dc39-6983b08ff28d@ozlabs.ru>
 <20200417075852.GA20049@lst.de>
 <70296d53-3504-2645-4b16-0eb73b0cd0d9@ozlabs.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <70296d53-3504-2645-4b16-0eb73b0cd0d9@ozlabs.ru>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Michael Ellerman <mpe@ellerman.id.au>,
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>
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

On Tue, May 05, 2020 at 02:18:37PM +1000, Alexey Kardashevskiy wrote:
> 
> 
> On 17/04/2020 17:58, Christoph Hellwig wrote:
> > On Wed, Apr 15, 2020 at 09:21:37PM +1000, Alexey Kardashevskiy wrote:
> >> And the fact they were exported leaves possibility that there is a
> >> driver somewhere relying on these symbols or distro kernel won't build
> >> because the symbol disappeared from exports (I do not know what KABI
> >> guarantees or if mainline kernel cares).
> > 
> > We absolutely do not care.  In fact for abuses of APIs that drivers
> > should not use we almost care to make them private and break people
> > abusing them.
> 
> ok :)
> 
> >> I do not care in particular but
> >> some might, a line separated with empty lines in the commit log would do.
> > 
> > I'll add a blurb for the next version.
> 
> 
> Has it gone anywhere? Thanks,

I've been hoping for the sg_buf helpers to land first, as they need
backporting and would conflict.  Do you urgently need the series?
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
