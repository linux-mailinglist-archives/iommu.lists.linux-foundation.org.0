Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 50ECE2938F1
	for <lists.iommu@lfdr.de>; Tue, 20 Oct 2020 12:13:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 140DE86D34;
	Tue, 20 Oct 2020 10:13:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vsY4fLe5dzWn; Tue, 20 Oct 2020 10:13:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id BC3C886D25;
	Tue, 20 Oct 2020 10:13:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A69D7C1AD4;
	Tue, 20 Oct 2020 10:13:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D4597C0052
 for <iommu@lists.linux-foundation.org>; Tue, 20 Oct 2020 10:13:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id D08AF87259
 for <iommu@lists.linux-foundation.org>; Tue, 20 Oct 2020 10:13:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZY1LncLEGwNt for <iommu@lists.linux-foundation.org>;
 Tue, 20 Oct 2020 10:13:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 2213987258
 for <iommu@lists.linux-foundation.org>; Tue, 20 Oct 2020 10:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=D/RvI4LWbrZwsiSjJJo2DHUUz1oHhAH4Mpvl8+a6/bk=; b=BiZaYQYBgG6saj6Vf5ZvkKcfTr
 +ylxFFHRzJW7d3Cyb/orGh+ndqpFsWWsVLhmcDMHabdHoH+x1HoQUInDSnlQOkTqax45XvBIYs39u
 CAUnU4eqV7qS6TE6vL77oYXZbhJoyDs3cAE4v33Rt3jzipV/sldMXwsNBoTLbf9AdjG1hZQ+7jiio
 a3DTVclh7ZnHjhG89jKuHaiWs1M/zJWZ0roQzvfdtj/U1qeueyRgH213fmVQLN3DdDFI6AbWF1Ogl
 QfrV4QCSfVKSd3e2GMj7GkIaduAMz9wuUPWr/PhD/vVGQP71RpsJoRi3UeTODuzxpPgfZN73bTm3y
 WS/YGdIA==;
Received: from [2001:4bb8:18c:20bd:6f0d:ddd6:25e1:36fe] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUodi-0005am-Pz
 for iommu@lists.linux-foundation.org; Tue, 20 Oct 2020 10:13:11 +0000
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org
Subject: [PATCH] dma-mapping: move more functions to dma-map-ops.h
Date: Tue, 20 Oct 2020 12:13:09 +0200
Message-Id: <20201020101309.3338444-1-hch@lst.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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

Due to a mismerge a bunch of prototypes that should have moved to
dma-map-ops.h are still in dma-mapping.h, fix that up.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/linux/dma-map-ops.h | 23 +++++++++++++++++++++++
 include/linux/dma-mapping.h | 24 ------------------------
 kernel/dma/remap.c          |  2 +-
 3 files changed, 24 insertions(+), 25 deletions(-)

diff --git a/include/linux/dma-map-ops.h b/include/linux/dma-map-ops.h
index 8029f7e0414521..a5f89fc4d6df16 100644
--- a/include/linux/dma-map-ops.h
+++ b/include/linux/dma-map-ops.h
@@ -203,6 +203,29 @@ static inline int dma_mmap_from_global_coherent(struct vm_area_struct *vma,
 }
 #endif /* CONFIG_DMA_DECLARE_COHERENT */
 
+int dma_common_get_sgtable(struct device *dev, struct sg_table *sgt,
+		void *cpu_addr, dma_addr_t dma_addr, size_t size,
+		unsigned long attrs);
+int dma_common_mmap(struct device *dev, struct vm_area_struct *vma,
+		void *cpu_addr, dma_addr_t dma_addr, size_t size,
+		unsigned long attrs);
+struct page *dma_common_alloc_pages(struct device *dev, size_t size,
+		dma_addr_t *dma_handle, enum dma_data_direction dir, gfp_t gfp);
+void dma_common_free_pages(struct device *dev, size_t size, struct page *vaddr,
+		dma_addr_t dma_handle, enum dma_data_direction dir);
+
+struct page **dma_common_find_pages(void *cpu_addr);
+void *dma_common_contiguous_remap(struct page *page, size_t size, pgprot_t prot,
+		const void *caller);
+void *dma_common_pages_remap(struct page **pages, size_t size, pgprot_t prot,
+		const void *caller);
+void dma_common_free_remap(void *cpu_addr, size_t size);
+
+struct page *dma_alloc_from_pool(struct device *dev, size_t size,
+		void **cpu_addr, gfp_t flags,
+		bool (*phys_addr_ok)(struct device *, phys_addr_t, size_t));
+bool dma_free_from_pool(struct device *dev, void *start, size_t size);
+
 #ifdef CONFIG_ARCH_HAS_DMA_COHERENCE_H
 #include <asm/dma-coherence.h>
 #elif defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_DEVICE) || \
diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index 3f029afdc9dc6a..956151052d4542 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -389,30 +389,6 @@ static inline void dma_sync_sgtable_for_device(struct device *dev,
 #define dma_get_sgtable(d, t, v, h, s) dma_get_sgtable_attrs(d, t, v, h, s, 0)
 #define dma_mmap_coherent(d, v, c, h, s) dma_mmap_attrs(d, v, c, h, s, 0)
 
-extern int dma_common_mmap(struct device *dev, struct vm_area_struct *vma,
-		void *cpu_addr, dma_addr_t dma_addr, size_t size,
-		unsigned long attrs);
-struct page *dma_common_alloc_pages(struct device *dev, size_t size,
-		dma_addr_t *dma_handle, enum dma_data_direction dir, gfp_t gfp);
-void dma_common_free_pages(struct device *dev, size_t size, struct page *vaddr,
-		dma_addr_t dma_handle, enum dma_data_direction dir);
-struct page **dma_common_find_pages(void *cpu_addr);
-void *dma_common_contiguous_remap(struct page *page, size_t size,
-			pgprot_t prot, const void *caller);
-
-void *dma_common_pages_remap(struct page **pages, size_t size,
-			pgprot_t prot, const void *caller);
-void dma_common_free_remap(void *cpu_addr, size_t size);
-
-struct page *dma_alloc_from_pool(struct device *dev, size_t size,
-		void **cpu_addr, gfp_t flags,
-		bool (*phys_addr_ok)(struct device *, phys_addr_t, size_t));
-bool dma_free_from_pool(struct device *dev, void *start, size_t size);
-
-int
-dma_common_get_sgtable(struct device *dev, struct sg_table *sgt, void *cpu_addr,
-		dma_addr_t dma_addr, size_t size, unsigned long attrs);
-
 static inline void *dma_alloc_coherent(struct device *dev, size_t size,
 		dma_addr_t *dma_handle, gfp_t gfp)
 {
diff --git a/kernel/dma/remap.c b/kernel/dma/remap.c
index 78b23f089cf1c2..905c3fa005f107 100644
--- a/kernel/dma/remap.c
+++ b/kernel/dma/remap.c
@@ -2,7 +2,7 @@
 /*
  * Copyright (c) 2014 The Linux Foundation
  */
-#include <linux/dma-mapping.h>
+#include <linux/dma-map-ops.h>
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
 
-- 
2.28.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
