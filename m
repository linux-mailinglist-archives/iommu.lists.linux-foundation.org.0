Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F4D23E167
	for <lists.iommu@lfdr.de>; Thu,  6 Aug 2020 20:49:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5C7188846E;
	Thu,  6 Aug 2020 18:49:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T0Wdyz7DP6yr; Thu,  6 Aug 2020 18:49:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5A4BA8847F;
	Thu,  6 Aug 2020 18:49:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 46959C0051;
	Thu,  6 Aug 2020 18:49:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 00B5FC004C
 for <iommu@lists.linux-foundation.org>; Thu,  6 Aug 2020 18:49:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B4CAB24E91
 for <iommu@lists.linux-foundation.org>; Thu,  6 Aug 2020 18:49:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DoCOBPOw-xnB for <iommu@lists.linux-foundation.org>;
 Thu,  6 Aug 2020 18:49:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by silver.osuosl.org (Postfix) with ESMTPS id 6122F24ED5
 for <iommu@lists.linux-foundation.org>; Thu,  6 Aug 2020 18:49:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3B6D8AC83;
 Thu,  6 Aug 2020 18:49:25 +0000 (UTC)
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: amit.pundir@linaro.org, hch@lst.de, linux-kernel@vger.kernel.org,
 Joerg Roedel <joro@8bytes.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v3 1/2] dma-pool: fix coherent pool allocations for IOMMU
 mappings
Date: Thu,  6 Aug 2020 20:47:54 +0200
Message-Id: <20200806184756.32075-2-nsaenzjulienne@suse.de>
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

From: Christoph Hellwig <hch@lst.de>

When allocating coherent pool memory for an IOMMU mapping we don't care
about the DMA mask.  Move the guess for the initial GFP mask into the
dma_direct_alloc_pages and pass dma_coherent_ok as a function pointer
argument so that it doesn't get applied to the IOMMU case.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---

Changes since v1:
  - Check if phys_addr_ok() exists prior calling it

 drivers/iommu/dma-iommu.c   |   4 +-
 include/linux/dma-direct.h  |   3 -
 include/linux/dma-mapping.h |   5 +-
 kernel/dma/direct.c         |  13 ++--
 kernel/dma/pool.c           | 114 +++++++++++++++---------------------
 5 files changed, 62 insertions(+), 77 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 4959f5df21bd..5141d49a046b 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -1035,8 +1035,8 @@ static void *iommu_dma_alloc(struct device *dev, size_t size,
 
 	if (IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) &&
 	    !gfpflags_allow_blocking(gfp) && !coherent)
-		cpu_addr = dma_alloc_from_pool(dev, PAGE_ALIGN(size), &page,
-					       gfp);
+		page = dma_alloc_from_pool(dev, PAGE_ALIGN(size), &cpu_addr,
+					       gfp, NULL);
 	else
 		cpu_addr = iommu_dma_alloc_pages(dev, size, &page, gfp, attrs);
 	if (!cpu_addr)
diff --git a/include/linux/dma-direct.h b/include/linux/dma-direct.h
index 5a3ce2a24794..6e87225600ae 100644
--- a/include/linux/dma-direct.h
+++ b/include/linux/dma-direct.h
@@ -73,9 +73,6 @@ static inline bool dma_capable(struct device *dev, dma_addr_t addr, size_t size,
 }
 
 u64 dma_direct_get_required_mask(struct device *dev);
-gfp_t dma_direct_optimal_gfp_mask(struct device *dev, u64 dma_mask,
-				  u64 *phys_mask);
-bool dma_coherent_ok(struct device *dev, phys_addr_t phys, size_t size);
 void *dma_direct_alloc(struct device *dev, size_t size, dma_addr_t *dma_handle,
 		gfp_t gfp, unsigned long attrs);
 void dma_direct_free(struct device *dev, size_t size, void *cpu_addr,
diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index 016b96b384bd..52635e91143b 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -522,8 +522,9 @@ void *dma_common_pages_remap(struct page **pages, size_t size,
 			pgprot_t prot, const void *caller);
 void dma_common_free_remap(void *cpu_addr, size_t size);
 
-void *dma_alloc_from_pool(struct device *dev, size_t size,
-			  struct page **ret_page, gfp_t flags);
+struct page *dma_alloc_from_pool(struct device *dev, size_t size,
+		void **cpu_addr, gfp_t flags,
+		bool (*phys_addr_ok)(struct device *, phys_addr_t, size_t));
 bool dma_free_from_pool(struct device *dev, void *start, size_t size);
 
 int
diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index bb0041e99659..db6ef07aec3b 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -43,7 +43,7 @@ u64 dma_direct_get_required_mask(struct device *dev)
 	return (1ULL << (fls64(max_dma) - 1)) * 2 - 1;
 }
 
-gfp_t dma_direct_optimal_gfp_mask(struct device *dev, u64 dma_mask,
+static gfp_t dma_direct_optimal_gfp_mask(struct device *dev, u64 dma_mask,
 				  u64 *phys_limit)
 {
 	u64 dma_limit = min_not_zero(dma_mask, dev->bus_dma_limit);
@@ -68,7 +68,7 @@ gfp_t dma_direct_optimal_gfp_mask(struct device *dev, u64 dma_mask,
 	return 0;
 }
 
-bool dma_coherent_ok(struct device *dev, phys_addr_t phys, size_t size)
+static bool dma_coherent_ok(struct device *dev, phys_addr_t phys, size_t size)
 {
 	return phys_to_dma_direct(dev, phys) + size - 1 <=
 			min_not_zero(dev->coherent_dma_mask, dev->bus_dma_limit);
@@ -161,8 +161,13 @@ void *dma_direct_alloc_pages(struct device *dev, size_t size,
 	size = PAGE_ALIGN(size);
 
 	if (dma_should_alloc_from_pool(dev, gfp, attrs)) {
-		ret = dma_alloc_from_pool(dev, size, &page, gfp);
-		if (!ret)
+		u64 phys_mask;
+
+		gfp |= dma_direct_optimal_gfp_mask(dev, dev->coherent_dma_mask,
+				&phys_mask);
+		page = dma_alloc_from_pool(dev, size, &ret, gfp,
+				dma_coherent_ok);
+		if (!page)
 			return NULL;
 		goto done;
 	}
diff --git a/kernel/dma/pool.c b/kernel/dma/pool.c
index 6bc74a2d5127..5d071d4a3cba 100644
--- a/kernel/dma/pool.c
+++ b/kernel/dma/pool.c
@@ -196,93 +196,75 @@ static int __init dma_atomic_pool_init(void)
 }
 postcore_initcall(dma_atomic_pool_init);
 
-static inline struct gen_pool *dma_guess_pool_from_device(struct device *dev)
+static inline struct gen_pool *dma_guess_pool(struct gen_pool *prev, gfp_t gfp)
 {
-	u64 phys_mask;
-	gfp_t gfp;
-
-	gfp = dma_direct_optimal_gfp_mask(dev, dev->coherent_dma_mask,
-					  &phys_mask);
-	if (IS_ENABLED(CONFIG_ZONE_DMA) && gfp == GFP_DMA)
+	if (prev == NULL) {
+		if (IS_ENABLED(CONFIG_ZONE_DMA32) && (gfp & GFP_DMA32))
+			return atomic_pool_dma32;
+		if (IS_ENABLED(CONFIG_ZONE_DMA) && (gfp & GFP_DMA))
+			return atomic_pool_dma;
+		return atomic_pool_kernel;
+	}
+	if (prev == atomic_pool_kernel)
+		return atomic_pool_dma32 ? atomic_pool_dma32 : atomic_pool_dma;
+	if (prev == atomic_pool_dma32)
 		return atomic_pool_dma;
-	if (IS_ENABLED(CONFIG_ZONE_DMA32) && gfp == GFP_DMA32)
-		return atomic_pool_dma32;
-	return atomic_pool_kernel;
+	return NULL;
 }
 
-static inline struct gen_pool *dma_get_safer_pool(struct gen_pool *bad_pool)
+static struct page *__dma_alloc_from_pool(struct device *dev, size_t size,
+		struct gen_pool *pool, void **cpu_addr,
+		bool (*phys_addr_ok)(struct device *, phys_addr_t, size_t))
 {
-	if (bad_pool == atomic_pool_kernel)
-		return atomic_pool_dma32 ? : atomic_pool_dma;
+	unsigned long addr;
+	phys_addr_t phys;
 
-	if (bad_pool == atomic_pool_dma32)
-		return atomic_pool_dma;
+	addr = gen_pool_alloc(pool, size);
+	if (!addr)
+		return NULL;
 
-	return NULL;
-}
+	phys = gen_pool_virt_to_phys(pool, addr);
+	if (phys_addr_ok && !phys_addr_ok(dev, phys, size)) {
+		gen_pool_free(pool, addr, size);
+		return NULL;
+	}
 
-static inline struct gen_pool *dma_guess_pool(struct device *dev,
-					      struct gen_pool *bad_pool)
-{
-	if (bad_pool)
-		return dma_get_safer_pool(bad_pool);
+	if (gen_pool_avail(pool) < atomic_pool_size)
+		schedule_work(&atomic_pool_work);
 
-	return dma_guess_pool_from_device(dev);
+	*cpu_addr = (void *)addr;
+	memset(*cpu_addr, 0, size);
+	return pfn_to_page(__phys_to_pfn(phys));
 }
 
-void *dma_alloc_from_pool(struct device *dev, size_t size,
-			  struct page **ret_page, gfp_t flags)
+struct page *dma_alloc_from_pool(struct device *dev, size_t size,
+		void **cpu_addr, gfp_t gfp,
+		bool (*phys_addr_ok)(struct device *, phys_addr_t, size_t))
 {
 	struct gen_pool *pool = NULL;
-	unsigned long val = 0;
-	void *ptr = NULL;
-	phys_addr_t phys;
-
-	while (1) {
-		pool = dma_guess_pool(dev, pool);
-		if (!pool) {
-			WARN(1, "Failed to get suitable pool for %s\n",
-			     dev_name(dev));
-			break;
-		}
-
-		val = gen_pool_alloc(pool, size);
-		if (!val)
-			continue;
-
-		phys = gen_pool_virt_to_phys(pool, val);
-		if (dma_coherent_ok(dev, phys, size))
-			break;
-
-		gen_pool_free(pool, val, size);
-		val = 0;
-	}
-
-
-	if (val) {
-		*ret_page = pfn_to_page(__phys_to_pfn(phys));
-		ptr = (void *)val;
-		memset(ptr, 0, size);
+	struct page *page;
 
-		if (gen_pool_avail(pool) < atomic_pool_size)
-			schedule_work(&atomic_pool_work);
+	while ((pool = dma_guess_pool(pool, gfp))) {
+		page = __dma_alloc_from_pool(dev, size, pool, cpu_addr,
+					     phys_addr_ok);
+		if (page)
+			return page;
 	}
 
-	return ptr;
+	WARN(1, "Failed to get suitable pool for %s\n", dev_name(dev));
+	return NULL;
 }
 
 bool dma_free_from_pool(struct device *dev, void *start, size_t size)
 {
 	struct gen_pool *pool = NULL;
 
-	while (1) {
-		pool = dma_guess_pool(dev, pool);
-		if (!pool)
-			return false;
-
-		if (gen_pool_has_addr(pool, (unsigned long)start, size)) {
-			gen_pool_free(pool, (unsigned long)start, size);
-			return true;
-		}
+	while ((pool = dma_guess_pool(pool, 0))) {
+		if (!gen_pool_has_addr(pool, (unsigned long)start, size))
+			continue;
+		gen_pool_free(pool, (unsigned long)start, size);
+		return true;
 	}
+
+	return false;
 }
-- 
2.28.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
