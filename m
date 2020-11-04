Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 856512A65C5
	for <lists.iommu@lfdr.de>; Wed,  4 Nov 2020 15:01:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 1F02D20438;
	Wed,  4 Nov 2020 14:01:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d745GZ6HvzFw; Wed,  4 Nov 2020 14:01:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id C4FB920443;
	Wed,  4 Nov 2020 14:01:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B3B56C0051;
	Wed,  4 Nov 2020 14:01:16 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 235E6C0051
 for <iommu@lists.linux-foundation.org>; Wed,  4 Nov 2020 14:01:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 1F78786AEE
 for <iommu@lists.linux-foundation.org>; Wed,  4 Nov 2020 14:01:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sc7TJfb2BQ-J for <iommu@lists.linux-foundation.org>;
 Wed,  4 Nov 2020 14:01:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 8DFF186AED
 for <iommu@lists.linux-foundation.org>; Wed,  4 Nov 2020 14:01:13 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 265B767373; Wed,  4 Nov 2020 15:01:09 +0100 (CET)
Date: Wed, 4 Nov 2020 15:01:08 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH 2/5] RDMA/core: remove use of dma_virt_ops
Message-ID: <20201104140108.GA5674@lst.de>
References: <20201104095052.1222754-1-hch@lst.de>
 <20201104095052.1222754-3-hch@lst.de> <20201104134241.GP36674@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201104134241.GP36674@ziepe.ca>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: linux-rdma@vger.kernel.org, linux-pci@vger.kernel.org,
 iommu@lists.linux-foundation.org, Bjorn Helgaas <bhelgaas@google.com>,
 Logan Gunthorpe <logang@deltatee.com>, Christoph Hellwig <hch@lst.de>
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

On Wed, Nov 04, 2020 at 09:42:41AM -0400, Jason Gunthorpe wrote:
> On Wed, Nov 04, 2020 at 10:50:49AM +0100, Christoph Hellwig wrote:
> 
> > +int ib_dma_virt_map_sg(struct ib_device *dev, struct scatterlist *sg, int nents)
> > +{
> > +	struct scatterlist *s;
> > +	int i;
> > +
> > +	for_each_sg(sg, s, nents, i) {
> > +		sg_dma_address(s) = (uintptr_t)sg_virt(s);
> > +		sg_dma_len(s) = s->length;
> 
> Hmm.. There is nothing ensuring the page is mapped here for this
> sg_virt(). Before maybe some of the kconfig stuff prevented highmem
> systems indirectly, I wonder if we should add something more direct to
> exclude highmem for these drivers?

I had actually noticed this earlier as well and then completely forgot
about it..

rdmavt depends on X86_64, so it can't be used with highmem, but for
rxe and siw there weren't any such dependencies so I think we were just
lucky.  Let me send a fix to add explicit depencies and then respin this
series on top of that..

> Sigh. I think the proper fix is to replace addr/length with a
> scatterlist pointer in the struct ib_sge, then have SW drivers
> directly use the page pointer properly.

The proper fix is to move the DMA mapping into the RDMA core, yes.
And as you said it will be hard.  But I don't think scatterlists
are the right interface.  IMHO we can keep re-use the existing
struct ib_sge:

struct ib_ge {
	u64     addr;
	u32     length;
	u32     lkey;
};

with the difference that if lkey is not a MR, addr is the physical
address of the memory, not a dma_addr_t or virtual address.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
