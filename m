Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F2D529C9F
	for <lists.iommu@lfdr.de>; Tue, 17 May 2022 10:37:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7EA3383466;
	Tue, 17 May 2022 08:37:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dGCHC0yvIVpe; Tue, 17 May 2022 08:37:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 7A01B83380;
	Tue, 17 May 2022 08:37:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 26269C0081;
	Tue, 17 May 2022 08:37:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 36BF2C002D
 for <iommu@lists.linux-foundation.org>; Tue, 17 May 2022 08:37:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1478C4017C
 for <iommu@lists.linux-foundation.org>; Tue, 17 May 2022 08:37:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yAFED2449_Qw for <iommu@lists.linux-foundation.org>;
 Tue, 17 May 2022 08:37:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C5575400B8
 for <iommu@lists.linux-foundation.org>; Tue, 17 May 2022 08:37:03 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id C2D2667373; Tue, 17 May 2022 10:36:57 +0200 (CEST)
Date: Tue, 17 May 2022 10:36:57 +0200
From: Christoph Hellwig <hch@lst.de>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Subject: Re: [PATCH] iommu/dma: Fix check for error return from
 iommu_map_sg_atomic()
Message-ID: <20220517083657.GA16377@lst.de>
References: <20220513153948.310119-1-schnelle@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220513153948.310119-1-schnelle@linux.ibm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Jason Gunthorpe <jgg@nvidia.com>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>
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

On Fri, May 13, 2022 at 05:39:48PM +0200, Niklas Schnelle wrote:
> In __iommu_dma_alloc_noncontiguous() the value returned by
> iommu_map_sg_atomic() is checked for being smaller than size. Before
> commit ad8f36e4b6b1 ("iommu: return full error code from
> iommu_map_sg[_atomic]()") this simply checked if the requested size was
> successfully mapped.
> 
> After that commit iommu_map_sg_atomic() may also return a negative
> error value. In principle this too would be covered by the existing
> check. There is one problem however, as size is of type size_t while the
> return type of iommu_map_sg_atomic() is now of type ssize_t the latter gets
> converted to size_t and negative error values end up as very large
> positive values making the check succeed. Fix this by making the return
> type visible with a local variable and add an explicit cast to ssize_t.
> 
> Fixes: ad8f36e4b6b1 ("iommu: return full error code from iommu_map_sg[_atomic]()")
> Cc: stable@vger.kernel.org
> Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>

I don't see what the point of the newly added local variable is here.
Just casting size should be all that is needed as far as I can tell.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
