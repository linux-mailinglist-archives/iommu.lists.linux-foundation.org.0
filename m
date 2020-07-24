Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3EE22C6E0
	for <lists.iommu@lfdr.de>; Fri, 24 Jul 2020 15:41:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E694D884BC;
	Fri, 24 Jul 2020 13:41:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r-Xn1PdWgWN5; Fri, 24 Jul 2020 13:41:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 10CE987EA3;
	Fri, 24 Jul 2020 13:41:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EF8B3C004C;
	Fri, 24 Jul 2020 13:41:22 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5707DC004C
 for <iommu@lists.linux-foundation.org>; Fri, 24 Jul 2020 13:41:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 3F66620416
 for <iommu@lists.linux-foundation.org>; Fri, 24 Jul 2020 13:41:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id megwRuIpvbDP for <iommu@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 13:41:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by silver.osuosl.org (Postfix) with ESMTPS id 7449E20403
 for <iommu@lists.linux-foundation.org>; Fri, 24 Jul 2020 13:41:19 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id B8C5168AFE; Fri, 24 Jul 2020 15:41:14 +0200 (CEST)
Date: Fri, 24 Jul 2020 15:41:14 +0200
From: Christoph Hellwig <hch@lst.de>
To: Amit Pundir <amit.pundir@linaro.org>
Subject: Re: [PATCH] dma-pool: Do not allocate pool memory from CMA
Message-ID: <20200724134114.GA3152@lst.de>
References: <550b30a86c0785049d24c945e2c6628d491cee3a.camel@suse.de>
 <CAMi1Hd2V2pJjP=USS4r-Z3vK-aq7_aBy-jcVNk1GvbdEQAuzWg@mail.gmail.com>
 <011994f8a717a00dcd9ed7682a1ddeb421c2c43f.camel@suse.de>
 <CAMi1Hd0=ZsGhTkSy221EP9Vb3GMOcS0UMczX2u5X9qK37_ea1A@mail.gmail.com>
 <01831596e4a2a6c9c066138b23bd30435f8e5569.camel@suse.de>
 <CAMi1Hd3C6kh5E49EgytBAQ_2AE_jvnp+eSNsxBYaux+exSvdbg@mail.gmail.com>
 <6db722947546221ed99d3f473f78e1a6de65d7d6.camel@suse.de>
 <CAMi1Hd0Xz6kOJFpA5PEpi6RDDGOcz0RmQ7tTOkuXq4QneOO_vQ@mail.gmail.com>
 <0dc1e922bf87fa73790e7471b3974528dd261486.camel@suse.de>
 <CAMi1Hd3O2HHBsnt=sac7FdcW0-3=4S3g_F9f__2h5gTsudfirA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMi1Hd3O2HHBsnt=sac7FdcW0-3=4S3g_F9f__2h5gTsudfirA@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: lkml <linux-kernel@vger.kernel.org>, jeremy.linton@arm.com,
 Sumit Semwal <sumit.semwal@linaro.org>, iommu@lists.linux-foundation.org,
 John Stultz <john.stultz@linaro.org>, linux-rpi-kernel@lists.infradead.org,
 David Rientjes <rientjes@google.com>, Robin Murphy <robin.murphy@arm.com>,
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

Yes, the iommu is an interesting case, and the current code is
wrong for that.  Can you try the patch below?  It contains a modified
version of Nicolas' patch to try CMA again for the expansion and a new
(for now hackish) way to not apply the addressability check for dma-iommu
allocations.

diff --git a/kernel/dma/pool.c b/kernel/dma/pool.c
index 6bc74a2d51273e..ec5e525d2b9309 100644
--- a/kernel/dma/pool.c
+++ b/kernel/dma/pool.c
@@ -3,7 +3,9 @@
  * Copyright (C) 2012 ARM Ltd.
  * Copyright (C) 2020 Google LLC
  */
+#include <linux/cma.h>
 #include <linux/debugfs.h>
+#include <linux/dma-contiguous.h>
 #include <linux/dma-direct.h>
 #include <linux/dma-noncoherent.h>
 #include <linux/init.h>
@@ -55,6 +57,31 @@ static void dma_atomic_pool_size_add(gfp_t gfp, size_t size)
 		pool_size_kernel += size;
 }
 
+static bool cma_in_zone(gfp_t gfp)
+{
+	phys_addr_t end;
+	unsigned long size;
+	struct cma *cma;
+
+	cma = dev_get_cma_area(NULL);
+	if (!cma)
+		return false;
+
+	size = cma_get_size(cma);
+	if (!size)
+		return false;
+	end = cma_get_base(cma) - memblock_start_of_DRAM() + size - 1;
+
+	/* CMA can't cross zone boundaries, see cma_activate_area() */
+	if (IS_ENABLED(CONFIG_ZONE_DMA) && (gfp & GFP_DMA) &&
+	    end <= DMA_BIT_MASK(zone_dma_bits))
+		return true;
+	if (IS_ENABLED(CONFIG_ZONE_DMA32) && (gfp & GFP_DMA32) &&
+	    end <= DMA_BIT_MASK(32))
+		return true;
+	return true;
+}
+
 static int atomic_pool_expand(struct gen_pool *pool, size_t pool_size,
 			      gfp_t gfp)
 {
@@ -68,7 +95,11 @@ static int atomic_pool_expand(struct gen_pool *pool, size_t pool_size,
 
 	do {
 		pool_size = 1 << (PAGE_SHIFT + order);
-		page = alloc_pages(gfp, order);
+		if (cma_in_zone(gfp))
+ 			page = dma_alloc_from_contiguous(NULL, 1 << order,
+ 							 order, false);
+		if (!page)
+			page = alloc_pages(gfp, order);
 	} while (!page && order-- > 0);
 	if (!page)
 		goto out;
@@ -251,7 +282,11 @@ void *dma_alloc_from_pool(struct device *dev, size_t size,
 			continue;
 
 		phys = gen_pool_virt_to_phys(pool, val);
-		if (dma_coherent_ok(dev, phys, size))
+		/*
+		 * Only apply the addressability check for dma-direct.
+		 * This is a nasty hack and won't work e.g. for arm.
+		 */
+		if (get_dma_ops(dev) || dma_coherent_ok(dev, phys, size))
 			break;
 
 		gen_pool_free(pool, val, size);
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
