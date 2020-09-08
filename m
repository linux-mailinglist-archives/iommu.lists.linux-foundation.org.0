Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F208261551
	for <lists.iommu@lfdr.de>; Tue,  8 Sep 2020 18:48:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 8552D2DFF8;
	Tue,  8 Sep 2020 16:48:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cnaS6J+UWJHu; Tue,  8 Sep 2020 16:48:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 1A1F720352;
	Tue,  8 Sep 2020 16:48:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F103FC0052;
	Tue,  8 Sep 2020 16:48:13 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 44CA0C0051
 for <iommu@lists.linux-foundation.org>; Tue,  8 Sep 2020 16:48:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 2E09487363
 for <iommu@lists.linux-foundation.org>; Tue,  8 Sep 2020 16:48:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qo3KN6Q4zvmD for <iommu@lists.linux-foundation.org>;
 Tue,  8 Sep 2020 16:48:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 0D1F387339
 for <iommu@lists.linux-foundation.org>; Tue,  8 Sep 2020 16:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=xNroi2fQ2LnRFAI12wN1KKLZSTotzY0SXtfdnZTTIos=; b=AA0Kf5qukyJJF7MkOCwypgkS33
 /9uIf0pDUw9yHvqC8KJ1rywDjlURJjhFQKoJ5JLEnFSCjR4lC0bVxVPWBCQIc3CZzRERQKS3UQ+gw
 I22xMPZVHOqtiK3IKTJi3f71iLFBqthMUIqDwuFBFFLFHmbReJebzh1Md5+FiUr8rVxmLVj4AM8Vx
 mkh33CNH4hAubysdiaORRdFMmgpAvoDD1fXuzfCnhRC6L+Y7XDat3qyKJ5vkTfl2p72O1LGSzegRO
 7uEQw+vCoS9eQ0docorHu0qGOg3N2ahqMS6rY+HGJz5W+bTr6fZZzcNHW8pHGftCXfPJDRdVl1Bsn
 kLknVUEQ==;
Received: from [2001:4bb8:184:af1:3dc3:9c83:fc6c:e0f] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFgms-0001SI-KI; Tue, 08 Sep 2020 16:48:06 +0000
From: Christoph Hellwig <hch@lst.de>
To: Tony Luck <tony.luck@intel.com>, Fenghua Yu <fenghua.yu@intel.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 iommu@lists.linux-foundation.org
Subject: [PATCH 06/12] dma-direct: remove dma_direct_{alloc,free}_pages
Date: Tue,  8 Sep 2020 18:47:52 +0200
Message-Id: <20200908164758.3177341-7-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200908164758.3177341-1-hch@lst.de>
References: <20200908164758.3177341-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: linux-ia64@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>
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

Just merge these helpers into the main dma_direct_{alloc,free} routines,
as the additional checks are always false for the two callers.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/x86/kernel/amd_gart_64.c |  6 +++---
 include/linux/dma-direct.h    |  4 ----
 kernel/dma/direct.c           | 39 ++++++++++++++---------------------
 kernel/dma/pool.c             |  2 +-
 4 files changed, 19 insertions(+), 32 deletions(-)

diff --git a/arch/x86/kernel/amd_gart_64.c b/arch/x86/kernel/amd_gart_64.c
index bccc5357bffd6c..153374b996a279 100644
--- a/arch/x86/kernel/amd_gart_64.c
+++ b/arch/x86/kernel/amd_gart_64.c
@@ -467,7 +467,7 @@ gart_alloc_coherent(struct device *dev, size_t size, dma_addr_t *dma_addr,
 {
 	void *vaddr;
 
-	vaddr = dma_direct_alloc_pages(dev, size, dma_addr, flag, attrs);
+	vaddr = dma_direct_alloc(dev, size, dma_addr, flag, attrs);
 	if (!vaddr ||
 	    !force_iommu || dev->coherent_dma_mask <= DMA_BIT_MASK(24))
 		return vaddr;
@@ -479,7 +479,7 @@ gart_alloc_coherent(struct device *dev, size_t size, dma_addr_t *dma_addr,
 		goto out_free;
 	return vaddr;
 out_free:
-	dma_direct_free_pages(dev, size, vaddr, *dma_addr, attrs);
+	dma_direct_free(dev, size, vaddr, *dma_addr, attrs);
 	return NULL;
 }
 
@@ -489,7 +489,7 @@ gart_free_coherent(struct device *dev, size_t size, void *vaddr,
 		   dma_addr_t dma_addr, unsigned long attrs)
 {
 	gart_unmap_page(dev, dma_addr, size, DMA_BIDIRECTIONAL, 0);
-	dma_direct_free_pages(dev, size, vaddr, dma_addr, attrs);
+	dma_direct_free(dev, size, vaddr, dma_addr, attrs);
 }
 
 static int no_agp;
diff --git a/include/linux/dma-direct.h b/include/linux/dma-direct.h
index 95e3e28bd93f47..20eceb2e4f91f8 100644
--- a/include/linux/dma-direct.h
+++ b/include/linux/dma-direct.h
@@ -77,10 +77,6 @@ void *dma_direct_alloc(struct device *dev, size_t size, dma_addr_t *dma_handle,
 		gfp_t gfp, unsigned long attrs);
 void dma_direct_free(struct device *dev, size_t size, void *cpu_addr,
 		dma_addr_t dma_addr, unsigned long attrs);
-void *dma_direct_alloc_pages(struct device *dev, size_t size,
-		dma_addr_t *dma_handle, gfp_t gfp, unsigned long attrs);
-void dma_direct_free_pages(struct device *dev, size_t size, void *cpu_addr,
-		dma_addr_t dma_addr, unsigned long attrs);
 int dma_direct_get_sgtable(struct device *dev, struct sg_table *sgt,
 		void *cpu_addr, dma_addr_t dma_addr, size_t size,
 		unsigned long attrs);
diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index 949c1cbf08b2d5..1d564bea58571b 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -151,13 +151,18 @@ static struct page *__dma_direct_alloc_pages(struct device *dev, size_t size,
 	return page;
 }
 
-void *dma_direct_alloc_pages(struct device *dev, size_t size,
+void *dma_direct_alloc(struct device *dev, size_t size,
 		dma_addr_t *dma_handle, gfp_t gfp, unsigned long attrs)
 {
 	struct page *page;
 	void *ret;
 	int err;
 
+	if (!IS_ENABLED(CONFIG_ARCH_HAS_DMA_SET_UNCACHED) &&
+	    !IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) &&
+	    dma_alloc_need_uncached(dev, attrs))
+		return arch_dma_alloc(dev, size, dma_handle, gfp, attrs);
+
 	size = PAGE_ALIGN(size);
 
 	if (dma_should_alloc_from_pool(dev, gfp, attrs)) {
@@ -256,11 +261,18 @@ void *dma_direct_alloc_pages(struct device *dev, size_t size,
 	return NULL;
 }
 
-void dma_direct_free_pages(struct device *dev, size_t size, void *cpu_addr,
-		dma_addr_t dma_addr, unsigned long attrs)
+void dma_direct_free(struct device *dev, size_t size,
+		void *cpu_addr, dma_addr_t dma_addr, unsigned long attrs)
 {
 	unsigned int page_order = get_order(size);
 
+	if (!IS_ENABLED(CONFIG_ARCH_HAS_DMA_SET_UNCACHED) &&
+	    !IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) &&
+	    dma_alloc_need_uncached(dev, attrs)) {
+		arch_dma_free(dev, size, cpu_addr, dma_addr, attrs);
+		return;
+	}
+
 	/* If cpu_addr is not from an atomic pool, dma_free_from_pool() fails */
 	if (dma_should_free_from_pool(dev, attrs) &&
 	    dma_free_from_pool(dev, cpu_addr, PAGE_ALIGN(size)))
@@ -284,27 +296,6 @@ void dma_direct_free_pages(struct device *dev, size_t size, void *cpu_addr,
 	dma_free_contiguous(dev, dma_direct_to_page(dev, dma_addr), size);
 }
 
-void *dma_direct_alloc(struct device *dev, size_t size,
-		dma_addr_t *dma_handle, gfp_t gfp, unsigned long attrs)
-{
-	if (!IS_ENABLED(CONFIG_ARCH_HAS_DMA_SET_UNCACHED) &&
-	    !IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) &&
-	    dma_alloc_need_uncached(dev, attrs))
-		return arch_dma_alloc(dev, size, dma_handle, gfp, attrs);
-	return dma_direct_alloc_pages(dev, size, dma_handle, gfp, attrs);
-}
-
-void dma_direct_free(struct device *dev, size_t size,
-		void *cpu_addr, dma_addr_t dma_addr, unsigned long attrs)
-{
-	if (!IS_ENABLED(CONFIG_ARCH_HAS_DMA_SET_UNCACHED) &&
-	    !IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) &&
-	    dma_alloc_need_uncached(dev, attrs))
-		arch_dma_free(dev, size, cpu_addr, dma_addr, attrs);
-	else
-		dma_direct_free_pages(dev, size, cpu_addr, dma_addr, attrs);
-}
-
 #if defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_DEVICE) || \
     defined(CONFIG_SWIOTLB)
 void dma_direct_sync_sg_for_device(struct device *dev,
diff --git a/kernel/dma/pool.c b/kernel/dma/pool.c
index 1281c0f0442bc5..fe11643ff9cc7b 100644
--- a/kernel/dma/pool.c
+++ b/kernel/dma/pool.c
@@ -115,7 +115,7 @@ static int atomic_pool_expand(struct gen_pool *pool, size_t pool_size,
 #endif
 	/*
 	 * Memory in the atomic DMA pools must be unencrypted, the pools do not
-	 * shrink so no re-encryption occurs in dma_direct_free_pages().
+	 * shrink so no re-encryption occurs in dma_direct_free().
 	 */
 	ret = set_memory_decrypted((unsigned long)page_to_virt(page),
 				   1 << order);
-- 
2.28.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
