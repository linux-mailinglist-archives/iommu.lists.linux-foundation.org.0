Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B9A122885
	for <lists.iommu@lfdr.de>; Tue, 17 Dec 2019 11:18:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 15B4A20458;
	Tue, 17 Dec 2019 10:18:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nNnzdSfCoozN; Tue, 17 Dec 2019 10:18:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 30C8A2001C;
	Tue, 17 Dec 2019 10:18:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 19D25C077D;
	Tue, 17 Dec 2019 10:18:08 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 58284C077D
 for <iommu@lists.linux-foundation.org>; Tue, 17 Dec 2019 10:18:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 4C5B6203F1
 for <iommu@lists.linux-foundation.org>; Tue, 17 Dec 2019 10:18:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ORlsIkoCPawF for <iommu@lists.linux-foundation.org>;
 Tue, 17 Dec 2019 10:18:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by silver.osuosl.org (Postfix) with ESMTPS id F3C412001C
 for <iommu@lists.linux-foundation.org>; Tue, 17 Dec 2019 10:18:04 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 1B698286; Tue, 17 Dec 2019 11:18:02 +0100 (CET)
Date: Tue, 17 Dec 2019 11:18:00 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v2] iommu/dma: Rationalise types for DMA masks
Message-ID: <20191217101800.GL8689@8bytes.org>
References: <00d1ddf9439a8c79fb561b0fc740bddf9e6fe6b1.1576089015.git.robin.murphy@arm.com>
 <20191211190235.GA17854@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191211190235.GA17854@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: arnd@arndb.de, stephan@gerhold.net, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, natechancellor@gmail.com,
 Robin Murphy <robin.murphy@arm.com>, nsaenzjulienne@suse.de
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

On Wed, Dec 11, 2019 at 08:02:35PM +0100, Christoph Hellwig wrote:
> On Wed, Dec 11, 2019 at 06:33:26PM +0000, Robin Murphy wrote:
> > Since iommu_dma_alloc_iova() combines incoming masks with the u64 bus
> > limit, it makes more sense to pass them around in their native u64
> > rather than converting to dma_addr_t early. Do that, and resolve the
> > remaining type discrepancy against the domain geometry with a cheeky
> > cast to keep things simple.
> > 
> > Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> 
> Looks good to me:
> 
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> 
> Joerg, let me know if you want to pick this up through the iommu tree as
> it touches the iommu code, or through the dma-mapping tree that
> introduced the warning.

I'll take it through my tree, as I am about to collect fixes anyway.

Patch is now applied, thanks everyone.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
