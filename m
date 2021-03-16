Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD9533CF11
	for <lists.iommu@lfdr.de>; Tue, 16 Mar 2021 09:00:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 846926F631;
	Tue, 16 Mar 2021 08:00:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6ZOUCqRvD46j; Tue, 16 Mar 2021 08:00:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 538E46F61F;
	Tue, 16 Mar 2021 08:00:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4587AC000D;
	Tue, 16 Mar 2021 08:00:18 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EBE6CC000D
 for <iommu@lists.linux-foundation.org>; Tue, 16 Mar 2021 08:00:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D43624EC89
 for <iommu@lists.linux-foundation.org>; Tue, 16 Mar 2021 08:00:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bhE2R8GGfTo7 for <iommu@lists.linux-foundation.org>;
 Tue, 16 Mar 2021 08:00:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0CA804EC2F
 for <iommu@lists.linux-foundation.org>; Tue, 16 Mar 2021 08:00:15 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 75A4D68C4E; Tue, 16 Mar 2021 09:00:09 +0100 (CET)
Date: Tue, 16 Mar 2021 09:00:08 +0100
From: Christoph Hellwig <hch@lst.de>
To: Logan Gunthorpe <logang@deltatee.com>
Subject: Re: [RFC PATCH v2 07/11] dma-mapping: Add flags to dma_map_ops to
 indicate PCI P2PDMA support
Message-ID: <20210316080008.GC15949@lst.de>
References: <20210311233142.7900-1-logang@deltatee.com>
 <20210311233142.7900-8-logang@deltatee.com>
 <20210313023657.GC3402637@iweiny-DESK2.sc.intel.com>
 <e9a6689a-3cb7-aa30-33e7-b27015754b73@deltatee.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e9a6689a-3cb7-aa30-33e7-b27015754b73@deltatee.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: linux-pci@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
 Ira Weiny <iweiny@intel.com>, linux-nvme@lists.infradead.org,
 Stephen Bates <sbates@raithlin.com>, linux-mm@kvack.org,
 Jason Ekstrand <jason@jlekstrand.net>, Ira Weiny <ira.weiny@intel.com>,
 Christoph Hellwig <hch@lst.de>, Minturn Dave B <dave.b.minturn@intel.com>,
 Matthew Wilcox <willy@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, John Hubbard <jhubbard@nvidia.com>,
 linux-block@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>,
 Jakowski Andrzej <andrzej.jakowski@intel.com>,
 Xiong Jianxin <jianxin.xiong@intel.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
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

On Mon, Mar 15, 2021 at 10:33:13AM -0600, Logan Gunthorpe wrote:
> >> +	return !ops || ops->flags & DMA_F_PCI_P2PDMA_SUPPORTED;
> > 
> > Is this logic correct?  I would have expected.
> > 
> > 	return (ops && ops->flags & DMA_F_PCI_P2PDMA_SUPPORTED);
> 
> 
> If ops is NULL then the operations in kernel/dma/direct.c are used and
> support is added to those in patch 6. So it is correct as written.

It is not quite that easy. There also is the bypass flag and for the
specific case where that is ignored the code needs a really good
comment.  And to assist that formatted so that it makes sense.  The
above line is indeed highly confusing even if it ends up being correct.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
