Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id F09992AB345
	for <lists.iommu@lfdr.de>; Mon,  9 Nov 2020 10:12:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 391608604A;
	Mon,  9 Nov 2020 09:12:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dbQbGY3HYGS8; Mon,  9 Nov 2020 09:12:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 881F485FFD;
	Mon,  9 Nov 2020 09:12:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6CA44C016F;
	Mon,  9 Nov 2020 09:12:14 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C4F4DC016F
 for <iommu@lists.linux-foundation.org>; Mon,  9 Nov 2020 09:12:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B346A86F82
 for <iommu@lists.linux-foundation.org>; Mon,  9 Nov 2020 09:12:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UZaAgIxtcDdM for <iommu@lists.linux-foundation.org>;
 Mon,  9 Nov 2020 09:12:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 618FF87047
 for <iommu@lists.linux-foundation.org>; Mon,  9 Nov 2020 09:12:11 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 52E0D6736F; Mon,  9 Nov 2020 10:12:06 +0100 (CET)
Date: Mon, 9 Nov 2020 10:12:06 +0100
From: Christoph Hellwig <hch@lst.de>
To: Logan Gunthorpe <logang@deltatee.com>
Subject: Re: [RFC PATCH 01/15] PCI/P2PDMA: Don't sleep in
 upstream_bridge_distance_warn()
Message-ID: <20201109091206.GA28918@lst.de>
References: <20201106170036.18713-1-logang@deltatee.com>
 <20201106170036.18713-2-logang@deltatee.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201106170036.18713-2-logang@deltatee.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Matthew Wilcox <willy@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 linux-pci@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Ira Weiny <iweiny@intel.com>, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, Stephen Bates <sbates@raithlin.com>,
 linux-block@vger.kernel.org, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 John Hubbard <jhubbard@nvidia.com>, Dan Williams <dan.j.williams@intel.com>,
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

On Fri, Nov 06, 2020 at 10:00:22AM -0700, Logan Gunthorpe wrote:
> In order to call this function from a dma_map function, it must not sleep.
> The only reason it does sleep so to allocate the seqbuf to print
> which devices are within the ACS path.
> 
> Switch the kmalloc call to use GFP_NOWAIT and simply not print that
> message if the buffer fails to be allocated.

Please pass in the actual gfp_t.  Especially from an I/O path
GFP_NOWAIT is not the right gfp_t anyway, you probably want GFP_ATOMIC
there.  But also for the path where we can sleep we should allow that.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
