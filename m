Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 851092A69CF
	for <lists.iommu@lfdr.de>; Wed,  4 Nov 2020 17:31:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3408F866C3;
	Wed,  4 Nov 2020 16:31:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AnT+9jsTbilL; Wed,  4 Nov 2020 16:31:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id BAA23866C1;
	Wed,  4 Nov 2020 16:31:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A474AC0051;
	Wed,  4 Nov 2020 16:31:43 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 63C80C0051
 for <iommu@lists.linux-foundation.org>; Wed,  4 Nov 2020 16:31:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 3C6152036B
 for <iommu@lists.linux-foundation.org>; Wed,  4 Nov 2020 16:31:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6cPKVmcEiZu8 for <iommu@lists.linux-foundation.org>;
 Wed,  4 Nov 2020 16:31:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by silver.osuosl.org (Postfix) with ESMTPS id AC24D2035B
 for <iommu@lists.linux-foundation.org>; Wed,  4 Nov 2020 16:31:39 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 6C26768B02; Wed,  4 Nov 2020 17:31:35 +0100 (CET)
Date: Wed, 4 Nov 2020 17:31:35 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH 2/5] RDMA/core: remove use of dma_virt_ops
Message-ID: <20201104163135.GA15840@lst.de>
References: <20201104095052.1222754-1-hch@lst.de>
 <20201104095052.1222754-3-hch@lst.de> <20201104134241.GP36674@ziepe.ca>
 <20201104140108.GA5674@lst.de> <20201104155255.GR36674@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201104155255.GR36674@ziepe.ca>
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

On Wed, Nov 04, 2020 at 11:52:55AM -0400, Jason Gunthorpe wrote:
> It could work, I think a resonable ULP API would be to have some
> 
>  rdma_fill_ib_sge_from_sgl()
>  rdma_map_sge_single()
>  etc etc
> 
> ie instead of wrappering the DMA API as-is we have a new API that
> directly builds the ib_sge. It always fills the local_dma_lkey from
> the pd, so it knows it is doing DMA from local kernel memory.

Yeah.

> Logically SW devices then have a local_dma_lkey MR that has an IOVA of
> the CPU physical address space, not the DMA address space as HW
> devices have. The ib_sge builders can know this detail and fill in
> addr from either a cpu phyical or a dma map.

I don't think the builders are the right place to do it - it really
should to be in the low-level drivers for a bunch of reasons:

 1) this avoids doing the dma_map when no DMA is performed, e.g. for
    mlx5 when send data is in the extended WQE
 2) to deal with the fact that dma mapping reduces the number of SGEs.
    When the system uses a modern IOMMU we'll always end up with a
    single IOVA range no matter how many pages were mapped originally.
    This means any MR process can actually be consolidated to use
    a single SGE with the local lkey.

Note that 2 implies a somewhat more complicated API, where the ULP
attempts to create a MR, but the core/driver will tell it that it didn't
need a MR at all.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
