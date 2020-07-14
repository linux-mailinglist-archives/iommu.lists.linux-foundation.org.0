Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC8721F19D
	for <lists.iommu@lfdr.de>; Tue, 14 Jul 2020 14:40:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id F40742BE70;
	Tue, 14 Jul 2020 12:40:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KtXN6T-47Acu; Tue, 14 Jul 2020 12:40:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 94CA42674B;
	Tue, 14 Jul 2020 12:40:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 82893C0733;
	Tue, 14 Jul 2020 12:40:08 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D5AB7C1798
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jul 2020 12:40:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 8DC518A4F3
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jul 2020 12:40:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BIQjbBAIniUU for <iommu@lists.linux-foundation.org>;
 Tue, 14 Jul 2020 12:40:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 620088A3A2
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jul 2020 12:40:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6931AB036;
 Tue, 14 Jul 2020 12:40:03 +0000 (UTC)
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: hch@lst.de, linux-kernel@vger.kernel.org,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, David Rientjes <rientjes@google.com>
Subject: [PATCH v2 4/4] dma-pool: Make sure atomic pool suits device
Date: Tue, 14 Jul 2020 14:39:28 +0200
Message-Id: <20200714123928.8581-5-nsaenzjulienne@suse.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200714123928.8581-1-nsaenzjulienne@suse.de>
References: <20200714123928.8581-1-nsaenzjulienne@suse.de>
MIME-Version: 1.0
Cc: iommu@lists.linux-foundation.org, linux-rpi-kernel@lists.infradead.org,
 jeremy.linton@arm.com
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

When allocating DMA memory from a pool, the core can only guess which
atomic pool will fit a device's constraints. If it doesn't, get a safer
atomic pool and try again.

Fixes: c84dc6e68a1d ("dma-pool: add additional coherent pools to map to gfp mask")
Reported-by: Jeremy Linton <jeremy.linton@arm.com>
Suggested-by: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
---

Changes since v1:
 - Rebase to linus' master

 kernel/dma/pool.c | 57 ++++++++++++++++++++++++++++++-----------------
 1 file changed, 37 insertions(+), 20 deletions(-)

diff --git a/kernel/dma/pool.c b/kernel/dma/pool.c
index 5b9eaa2b498d..d48d9acb585f 100644
--- a/kernel/dma/pool.c
+++ b/kernel/dma/pool.c
@@ -240,39 +240,56 @@ static inline struct gen_pool *dma_guess_pool(struct device *dev,
 void *dma_alloc_from_pool(struct device *dev, size_t size,
 			  struct page **ret_page, gfp_t flags)
 {
-	struct gen_pool *pool = dma_guess_pool(dev, NULL);
-	unsigned long val;
+	struct gen_pool *pool = NULL;
+	unsigned long val = 0;
 	void *ptr = NULL;
-
-	if (!pool) {
-		WARN(1, "%pGg atomic pool not initialised!\n", &flags);
-		return NULL;
+	phys_addr_t phys;
+
+	while (1) {
+		pool = dma_guess_pool(dev, pool);
+		if (!pool) {
+			WARN(1, "Failed to get suitable pool for %s\n",
+			     dev_name(dev));
+			break;
+		}
+
+		val = gen_pool_alloc(pool, size);
+		if (!val)
+			continue;
+
+		phys = gen_pool_virt_to_phys(pool, val);
+		if (dma_coherent_ok(dev, phys, size))
+			break;
+
+		gen_pool_free(pool, val, size);
+		val = 0;
 	}
 
-	val = gen_pool_alloc(pool, size);
-	if (likely(val)) {
-		phys_addr_t phys = gen_pool_virt_to_phys(pool, val);
 
+	if (val) {
 		*ret_page = pfn_to_page(__phys_to_pfn(phys));
 		ptr = (void *)val;
 		memset(ptr, 0, size);
-	} else {
-		WARN_ONCE(1, "DMA coherent pool depleted, increase size "
-			     "(recommended min coherent_pool=%zuK)\n",
-			  gen_pool_size(pool) >> 9);
+
+		if (gen_pool_avail(pool) < atomic_pool_size)
+			schedule_work(&atomic_pool_work);
 	}
-	if (gen_pool_avail(pool) < atomic_pool_size)
-		schedule_work(&atomic_pool_work);
 
 	return ptr;
 }
 
 bool dma_free_from_pool(struct device *dev, void *start, size_t size)
 {
-	struct gen_pool *pool = dma_guess_pool(dev, NULL);
+	struct gen_pool *pool = NULL;
 
-	if (!pool || !gen_pool_has_addr(pool, (unsigned long)start, size))
-		return false;
-	gen_pool_free(pool, (unsigned long)start, size);
-	return true;
+	while (1) {
+		pool = dma_guess_pool(dev, pool);
+		if (!pool)
+			return false;
+
+		if (gen_pool_has_addr(pool, (unsigned long)start, size)) {
+			gen_pool_free(pool, (unsigned long)start, size);
+			return true;
+		}
+	}
 }
-- 
2.27.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
