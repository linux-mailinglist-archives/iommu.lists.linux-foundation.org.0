Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 89690230990
	for <lists.iommu@lfdr.de>; Tue, 28 Jul 2020 14:07:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3B78D86CD7;
	Tue, 28 Jul 2020 12:07:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id liMqtaRh6byu; Tue, 28 Jul 2020 12:07:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B2DD986CC7;
	Tue, 28 Jul 2020 12:07:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 90731C004D;
	Tue, 28 Jul 2020 12:07:24 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 150B1C004D
 for <iommu@lists.linux-foundation.org>; Tue, 28 Jul 2020 12:07:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 10CAF86CC7
 for <iommu@lists.linux-foundation.org>; Tue, 28 Jul 2020 12:07:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tlD7ga7lKM6p for <iommu@lists.linux-foundation.org>;
 Tue, 28 Jul 2020 12:07:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 718EE86CC5
 for <iommu@lists.linux-foundation.org>; Tue, 28 Jul 2020 12:07:22 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 422D468B05; Tue, 28 Jul 2020 14:07:17 +0200 (CEST)
Date: Tue, 28 Jul 2020 14:07:16 +0200
From: Christoph Hellwig <hch@lst.de>
To: Amit Pundir <amit.pundir@linaro.org>
Subject: Re: dma-pool fixes
Message-ID: <20200728120716.GA2507@lst.de>
References: <20200728104742.422960-1-hch@lst.de>
 <CAMi1Hd3=6ZZykF1yx_CChqx71k6T-wj12TzJiz_uJZbwrEtTXw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMi1Hd3=6ZZykF1yx_CChqx71k6T-wj12TzJiz_uJZbwrEtTXw@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: jeremy.linton@arm.com, iommu@lists.linux-foundation.org,
 linux-rpi-kernel@lists.infradead.org, David Rientjes <rientjes@google.com>,
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

On Tue, Jul 28, 2020 at 05:32:56PM +0530, Amit Pundir wrote:
> > can you try these two patches?  The first one makes sure we don't apply
> > physical address based checks for IOMMU allocations, and the second one
> > is a slightly tweaked version of the patch from Nicolas to allow dipping
> > into the CMA areas for allocations to expand the atomic pools.
> 
> Sorry, verified a couple of times but these two patches are not working
> for me. I'm stuck at the bootloader splash screen on my phone.

Thanks for testing.  The only intended functional change compared to
Fridays patch was the issue Nicolas pointed out.  Can you try this hack
on top?


diff --git a/kernel/dma/pool.c b/kernel/dma/pool.c
index 83fda10394937b..88e40a022b6bfd 100644
--- a/kernel/dma/pool.c
+++ b/kernel/dma/pool.c
@@ -70,13 +70,14 @@ static bool cma_in_zone(gfp_t gfp)
 	size = cma_get_size(cma);
 	if (!size)
 		return false;
-
+#if 0
 	/* CMA can't cross zone boundaries, see cma_activate_area() */
 	end = cma_get_base(cma) - memblock_start_of_DRAM() + size - 1;
 	if (IS_ENABLED(CONFIG_ZONE_DMA) && (gfp & GFP_DMA))
 		return end <= DMA_BIT_MASK(zone_dma_bits);
 	if (IS_ENABLED(CONFIG_ZONE_DMA32) && (gfp & GFP_DMA32))
 		return end <= DMA_BIT_MASK(32);
+#endif
 	return true;
 }
 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
