Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 621DC18FB49
	for <lists.iommu@lfdr.de>; Mon, 23 Mar 2020 18:20:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 17E5A88287;
	Mon, 23 Mar 2020 17:20:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id puHVJHzuH7A1; Mon, 23 Mar 2020 17:20:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 711DE88263;
	Mon, 23 Mar 2020 17:20:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 57ECEC0177;
	Mon, 23 Mar 2020 17:20:22 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 970A5C0177
 for <iommu@lists.linux-foundation.org>; Mon, 23 Mar 2020 17:20:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 865B386084
 for <iommu@lists.linux-foundation.org>; Mon, 23 Mar 2020 17:20:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z03cIdnAgoRE for <iommu@lists.linux-foundation.org>;
 Mon, 23 Mar 2020 17:20:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 1E3C0860AE
 for <iommu@lists.linux-foundation.org>; Mon, 23 Mar 2020 17:20:19 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id C11FA68BEB; Mon, 23 Mar 2020 18:20:14 +0100 (CET)
Date: Mon, 23 Mar 2020 18:20:14 +0100
From: Christoph Hellwig <hch@lst.de>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH 1/2] dma-mapping: add a dma_ops_bypass flag to struct
 device
Message-ID: <20200323172014.GA31269@lst.de>
References: <20200320141640.366360-1-hch@lst.de>
 <20200320141640.366360-2-hch@lst.de>
 <2f31d0dd-aa7e-8b76-c8a1-5759fda5afc9@ozlabs.ru>
 <20200323083705.GA31245@lst.de>
 <37ce1b7e-264d-292d-32b1-093b24b3525c@ozlabs.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <37ce1b7e-264d-292d-32b1-093b24b3525c@ozlabs.ru>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org,
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

On Mon, Mar 23, 2020 at 07:58:01PM +1100, Alexey Kardashevskiy wrote:
> >> 0x100.0000.0000 .. 0x101.0000.0000
> >>
> >> 2x4G, each is 1TB aligned. And we can map directly only the first 4GB
> >> (because of the maximum IOMMU table size) but not the other. And 1:1 on
> >> that "pseries" is done with offset=0x0800.0000.0000.0000.
> >>
> >> So we want to check every bus address against dev->bus_dma_limit, not
> >> dev->coherent_dma_mask. In the example above I'd set bus_dma_limit to
> >> 0x0800.0001.0000.0000 and 1:1 mapping for the second 4GB would not be
> >> tried. Does this sound reasonable? Thanks,
> > 
> > bus_dma_limit is just another limiting factor applied on top of
> > coherent_dma_mask or dma_mask respectively.
> 
> This is not enough for the task: in my example, I'd set bus limit to
> 0x0800.0001.0000.0000 but this would disable bypass for all RAM
> addresses - the first and the second 4GB blocks.

So what about something like the version here:

http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/dma-bypass.3
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
