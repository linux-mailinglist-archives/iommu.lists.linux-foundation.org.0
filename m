Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id EC28E11BC6D
	for <lists.iommu@lfdr.de>; Wed, 11 Dec 2019 20:02:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9E64E2326C;
	Wed, 11 Dec 2019 19:02:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jj77Dpq356E3; Wed, 11 Dec 2019 19:02:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 9A0DE230F6;
	Wed, 11 Dec 2019 19:02:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8C7A7C0881;
	Wed, 11 Dec 2019 19:02:44 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D34E3C0881
 for <iommu@lists.linux-foundation.org>; Wed, 11 Dec 2019 19:02:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C1E1886D8C
 for <iommu@lists.linux-foundation.org>; Wed, 11 Dec 2019 19:02:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jbnJdtRLuSfj for <iommu@lists.linux-foundation.org>;
 Wed, 11 Dec 2019 19:02:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 70DCB86D8B
 for <iommu@lists.linux-foundation.org>; Wed, 11 Dec 2019 19:02:40 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id BD11668AFE; Wed, 11 Dec 2019 20:02:35 +0100 (CET)
Date: Wed, 11 Dec 2019 20:02:35 +0100
From: Christoph Hellwig <hch@lst.de>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v2] iommu/dma: Rationalise types for DMA masks
Message-ID: <20191211190235.GA17854@lst.de>
References: <00d1ddf9439a8c79fb561b0fc740bddf9e6fe6b1.1576089015.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <00d1ddf9439a8c79fb561b0fc740bddf9e6fe6b1.1576089015.git.robin.murphy@arm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: arnd@arndb.de, stephan@gerhold.net, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, natechancellor@gmail.com, hch@lst.de,
 nsaenzjulienne@suse.de
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

On Wed, Dec 11, 2019 at 06:33:26PM +0000, Robin Murphy wrote:
> Since iommu_dma_alloc_iova() combines incoming masks with the u64 bus
> limit, it makes more sense to pass them around in their native u64
> rather than converting to dma_addr_t early. Do that, and resolve the
> remaining type discrepancy against the domain geometry with a cheeky
> cast to keep things simple.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>

Looks good to me:

Reviewed-by: Christoph Hellwig <hch@lst.de>

Joerg, let me know if you want to pick this up through the iommu tree as
it touches the iommu code, or through the dma-mapping tree that
introduced the warning.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
