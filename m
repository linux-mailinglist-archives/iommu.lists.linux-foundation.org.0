Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1522166A9
	for <lists.iommu@lfdr.de>; Tue,  7 Jul 2020 08:47:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0B429869B8;
	Tue,  7 Jul 2020 06:47:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fdTV4S_hBjh3; Tue,  7 Jul 2020 06:47:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 99C058698F;
	Tue,  7 Jul 2020 06:47:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7F8F8C016F;
	Tue,  7 Jul 2020 06:47:37 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 76B6CC016F
 for <iommu@lists.linux-foundation.org>; Tue,  7 Jul 2020 06:47:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 65C85893AF
 for <iommu@lists.linux-foundation.org>; Tue,  7 Jul 2020 06:47:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YfvGM5YWprPM for <iommu@lists.linux-foundation.org>;
 Tue,  7 Jul 2020 06:47:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 39BDD88F41
 for <iommu@lists.linux-foundation.org>; Tue,  7 Jul 2020 06:47:34 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id AD38268AFE; Tue,  7 Jul 2020 08:47:30 +0200 (CEST)
Date: Tue, 7 Jul 2020 08:47:30 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jonathan Lemon <jonathan.lemon@gmail.com>
Subject: Re: [PATCH 1/4] dma-mapping: add a new dma_need_sync API
Message-ID: <20200707064730.GA23602@lst.de>
References: <20200629130359.2690853-1-hch@lst.de>
 <20200629130359.2690853-2-hch@lst.de>
 <20200706194227.vfhv5o4lporxjxmq@bsd-mbp.dhcp.thefacebook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200706194227.vfhv5o4lporxjxmq@bsd-mbp.dhcp.thefacebook.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, bpf@vger.kernel.org,
 =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@intel.com>,
 Christoph Hellwig <hch@lst.de>, Magnus Karlsson <magnus.karlsson@intel.com>
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

On Mon, Jul 06, 2020 at 12:42:27PM -0700, Jonathan Lemon wrote:
> On Mon, Jun 29, 2020 at 03:03:56PM +0200, Christoph Hellwig wrote:
> > Add a new API to check if calls to dma_sync_single_for_{device,cpu} are
> > required for a given DMA streaming mapping.
> > 
> > +::
> > +
> > +	bool
> > +	dma_need_sync(struct device *dev, dma_addr_t dma_addr);
> > +
> > +Returns %true if dma_sync_single_for_{device,cpu} calls are required to
> > +transfer memory ownership.  Returns %false if those calls can be skipped.
> 
> Hi Christoph -
> 
> Thie call above is for a specific dma_addr.  For correctness, would I
> need to check every addr, or can I assume that for a specific memory
> type (pages returned from malloc), that the answer would be identical?

You need to check every mapping.  E.g. this API pairs with a
dma_map_single/page call.  For S/G mappings you'd need to call it for
each entry, although if you have a use case for that we really should
add a dma_sg_need_sync helper instea of open coding the scatterlist walk.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
