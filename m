Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B478216CD0
	for <lists.iommu@lfdr.de>; Tue,  7 Jul 2020 14:28:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2851E888AE;
	Tue,  7 Jul 2020 12:28:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4w0Xt-c60Fjv; Tue,  7 Jul 2020 12:28:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5BDD788853;
	Tue,  7 Jul 2020 12:28:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 387D7C016F;
	Tue,  7 Jul 2020 12:28:18 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2830BC016F
 for <iommu@lists.linux-foundation.org>; Tue,  7 Jul 2020 12:28:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 16B8C88AF0
 for <iommu@lists.linux-foundation.org>; Tue,  7 Jul 2020 12:28:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zsRB7nZVaor6 for <iommu@lists.linux-foundation.org>;
 Tue,  7 Jul 2020 12:28:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by whitealder.osuosl.org (Postfix) with ESMTPS id EC48C88A31
 for <iommu@lists.linux-foundation.org>; Tue,  7 Jul 2020 12:28:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 34EDBABF4;
 Tue,  7 Jul 2020 12:28:14 +0000 (UTC)
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, David Rientjes <rientjes@google.com>
Subject: [PATCH] dma-pool: use single atomic pool for both DMA zones
Date: Tue,  7 Jul 2020 14:28:04 +0200
Message-Id: <20200707122804.21262-1-nsaenzjulienne@suse.de>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: iommu@lists.linux-foundation.org, linux-rpi-kernel@lists.infradead.org,
 jeremy.linton@arm.com, linux-kernel@vger.kernel.org
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

When allocating atomic DMA memory for a device, the dma-pool core
queries __dma_direct_optimal_gfp_mask() to check which atomic pool to
use. It turns out the GFP flag returned is only an optimistic guess.
The pool selected might sometimes live in a zone higher than the
device's view of memory.

As there isn't a way to grantee a mapping between a device's DMA
constraints and correct GFP flags this unifies both DMA atomic pools.
The resulting pool is allocated in the lower DMA zone available, if any,
so as for devices to always get accessible memory while having the
flexibility of using dma_pool_kernel for the non constrained ones.

Fixes: c84dc6e68a1d ("dma-pool: add additional coherent pools to map to gfp mask")
Reported-by: Jeremy Linton <jeremy.linton@arm.com>
Suggested-by: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
---
 kernel/dma/pool.c | 47 +++++++++++++++++++----------------------------
 1 file changed, 19 insertions(+), 28 deletions(-)

diff --git a/kernel/dma/pool.c b/kernel/dma/pool.c
index 8cfa01243ed2..883f7a583969 100644
--- a/kernel/dma/pool.c
+++ b/kernel/dma/pool.c
@@ -13,10 +13,11 @@
 #include <linux/slab.h>
 #include <linux/workqueue.h>
 
+#define GFP_ATOMIC_POOL_DMA	(IS_ENABLED(CONFIG_ZONE_DMA) ? GFP_DMA : \
+				 IS_ENABLED(CONFIG_ZONE_DMA32) ? GFP_DMA32 : 0)
+
 static struct gen_pool *atomic_pool_dma __ro_after_init;
 static unsigned long pool_size_dma;
-static struct gen_pool *atomic_pool_dma32 __ro_after_init;
-static unsigned long pool_size_dma32;
 static struct gen_pool *atomic_pool_kernel __ro_after_init;
 static unsigned long pool_size_kernel;
 
@@ -42,16 +43,13 @@ static void __init dma_atomic_pool_debugfs_init(void)
 		return;
 
 	debugfs_create_ulong("pool_size_dma", 0400, root, &pool_size_dma);
-	debugfs_create_ulong("pool_size_dma32", 0400, root, &pool_size_dma32);
 	debugfs_create_ulong("pool_size_kernel", 0400, root, &pool_size_kernel);
 }
 
 static void dma_atomic_pool_size_add(gfp_t gfp, size_t size)
 {
-	if (gfp & __GFP_DMA)
+	if (gfp & GFP_ATOMIC_POOL_DMA)
 		pool_size_dma += size;
-	else if (gfp & __GFP_DMA32)
-		pool_size_dma32 += size;
 	else
 		pool_size_kernel += size;
 }
@@ -132,12 +130,11 @@ static void atomic_pool_resize(struct gen_pool *pool, gfp_t gfp)
 
 static void atomic_pool_work_fn(struct work_struct *work)
 {
-	if (IS_ENABLED(CONFIG_ZONE_DMA))
-		atomic_pool_resize(atomic_pool_dma,
-				   GFP_KERNEL | GFP_DMA);
-	if (IS_ENABLED(CONFIG_ZONE_DMA32))
-		atomic_pool_resize(atomic_pool_dma32,
-				   GFP_KERNEL | GFP_DMA32);
+	gfp_t dma_gfp = GFP_ATOMIC_POOL_DMA;
+
+	if (dma_gfp)
+		atomic_pool_resize(atomic_pool_dma, GFP_KERNEL | dma_gfp);
+
 	atomic_pool_resize(atomic_pool_kernel, GFP_KERNEL);
 }
 
@@ -168,6 +165,7 @@ static __init struct gen_pool *__dma_atomic_pool_init(size_t pool_size,
 
 static int __init dma_atomic_pool_init(void)
 {
+	gfp_t dma_gfp = GFP_ATOMIC_POOL_DMA;
 	int ret = 0;
 
 	/*
@@ -185,18 +183,13 @@ static int __init dma_atomic_pool_init(void)
 						    GFP_KERNEL);
 	if (!atomic_pool_kernel)
 		ret = -ENOMEM;
-	if (IS_ENABLED(CONFIG_ZONE_DMA)) {
+
+	if (dma_gfp) {
 		atomic_pool_dma = __dma_atomic_pool_init(atomic_pool_size,
-						GFP_KERNEL | GFP_DMA);
+							 GFP_KERNEL | dma_gfp);
 		if (!atomic_pool_dma)
 			ret = -ENOMEM;
 	}
-	if (IS_ENABLED(CONFIG_ZONE_DMA32)) {
-		atomic_pool_dma32 = __dma_atomic_pool_init(atomic_pool_size,
-						GFP_KERNEL | GFP_DMA32);
-		if (!atomic_pool_dma32)
-			ret = -ENOMEM;
-	}
 
 	dma_atomic_pool_debugfs_init();
 	return ret;
@@ -206,14 +199,12 @@ postcore_initcall(dma_atomic_pool_init);
 static inline struct gen_pool *dev_to_pool(struct device *dev)
 {
 	u64 phys_mask;
-	gfp_t gfp;
-
-	gfp = dma_direct_optimal_gfp_mask(dev, dev->coherent_dma_mask,
-					  &phys_mask);
-	if (IS_ENABLED(CONFIG_ZONE_DMA) && gfp == GFP_DMA)
-		return atomic_pool_dma;
-	if (IS_ENABLED(CONFIG_ZONE_DMA32) && gfp == GFP_DMA32)
-		return atomic_pool_dma32;
+
+	if (atomic_pool_dma &&
+	    dma_direct_optimal_gfp_mask(dev, dev->coherent_dma_mask,
+					&phys_mask))
+			return atomic_pool_dma;
+
 	return atomic_pool_kernel;
 }
 
-- 
2.27.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
