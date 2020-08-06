Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 1925C23E166
	for <lists.iommu@lfdr.de>; Thu,  6 Aug 2020 20:49:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A67A8203E7;
	Thu,  6 Aug 2020 18:49:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LUQaR6frP8qu; Thu,  6 Aug 2020 18:49:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 1C89824F92;
	Thu,  6 Aug 2020 18:49:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 14F7BC004C;
	Thu,  6 Aug 2020 18:49:16 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 21C21C004C
 for <iommu@lists.linux-foundation.org>; Thu,  6 Aug 2020 18:49:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 120078847F
 for <iommu@lists.linux-foundation.org>; Thu,  6 Aug 2020 18:49:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p1juZJbGc2oj for <iommu@lists.linux-foundation.org>;
 Thu,  6 Aug 2020 18:49:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by whitealder.osuosl.org (Postfix) with ESMTPS id A24F18849F
 for <iommu@lists.linux-foundation.org>; Thu,  6 Aug 2020 18:49:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BC128ACA7;
 Thu,  6 Aug 2020 18:49:25 +0000 (UTC)
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: amit.pundir@linaro.org, hch@lst.de, linux-kernel@vger.kernel.org,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v3 2/2] dma-pool: Only allocate from CMA when in same memory
 zone
Date: Thu,  6 Aug 2020 20:47:55 +0200
Message-Id: <20200806184756.32075-3-nsaenzjulienne@suse.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200806184756.32075-1-nsaenzjulienne@suse.de>
References: <20200806184756.32075-1-nsaenzjulienne@suse.de>
MIME-Version: 1.0
Cc: iommu@lists.linux-foundation.org, linux-rpi-kernel@lists.infradead.org,
 jeremy.linton@arm.com, rientjes@google.com
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

There is no guarantee to CMA's placement, so allocating a zone specific
atomic pool from CMA might return memory from a completely different
memory zone. To get around this double check CMA's placement before
allocating from it.

Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
[hch: rebased, added a fallback to the page allocator, allow dipping into
      lower CMA pools]
Signed-off-by: Christoph Hellwig <hch@lst.de>
---

Changes since v2:
 - Go back to v1 behavior

 kernel/dma/pool.c | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/kernel/dma/pool.c b/kernel/dma/pool.c
index 5d071d4a3cba..30d28d761490 100644
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
@@ -55,6 +57,29 @@ static void dma_atomic_pool_size_add(gfp_t gfp, size_t size)
 		pool_size_kernel += size;
 }
 
+static bool cma_in_zone(gfp_t gfp)
+{
+	unsigned long size;
+	phys_addr_t end;
+	struct cma *cma;
+
+	cma = dev_get_cma_area(NULL);
+	if (!cma)
+		return false;
+
+	size = cma_get_size(cma);
+	if (!size)
+		return false;
+
+	/* CMA can't cross zone boundaries, see cma_activate_area() */
+	end = cma_get_base(cma) - memblock_start_of_DRAM() + size - 1;
+	if (IS_ENABLED(CONFIG_ZONE_DMA) && (gfp & GFP_DMA))
+		return end <= DMA_BIT_MASK(zone_dma_bits);
+	if (IS_ENABLED(CONFIG_ZONE_DMA32) && (gfp & GFP_DMA32))
+		return end <= DMA_BIT_MASK(32);
+	return true;
+}
+
 static int atomic_pool_expand(struct gen_pool *pool, size_t pool_size,
 			      gfp_t gfp)
 {
@@ -68,7 +93,11 @@ static int atomic_pool_expand(struct gen_pool *pool, size_t pool_size,
 
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
-- 
2.28.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
