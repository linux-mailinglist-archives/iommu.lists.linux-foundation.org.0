Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C81EA2FF4
	for <lists.iommu@lfdr.de>; Fri, 30 Aug 2019 08:31:29 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1FDC15BFB;
	Fri, 30 Aug 2019 06:31:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 6F3865BDD
	for <iommu@lists.linux-foundation.org>;
	Fri, 30 Aug 2019 06:29:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id EA3D0F1
	for <iommu@lists.linux-foundation.org>;
	Fri, 30 Aug 2019 06:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6jAaX0ieW9MeYxDW2dKKumY+12F0P2cEPjb+jbaeszE=;
	b=S4wbMxok2D8k4ZFzpm9aUIl5c/
	jgwwzPbSLdJgX8cRz41Y7ZQnuqZSwAQRGqDHZnxg5XEYRKLtsxPd8zmgp3TcyG5GH1onLI5FFum3P
	hzh25CiCsqTk9CYibwrquJNd0MC/wJxQu0nCiwAKM9Njy0aus0zKACd7aOMhmp0O24hB0fhncq047
	BoUaLLB29lTXHWd0e3T5TLWCPE+hMJrzhoGxJZkjLqtBPx2NPp1cfrc15Ws/P6s+sxZLKrikd/9ow
	Hdd7JegC0ismFSSRgcRZqopjx1TzT/zBaPsi5Q1gXiVvMxdPKz0tQSZvDC/UwNL1WPBQnn1j42I2W
	Bz4iWtlg==;
Received: from [93.83.86.253] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
	id 1i3aPg-0002tB-7G; Fri, 30 Aug 2019 06:29:36 +0000
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org
Subject: [PATCH 3/4] dma-mapping: introduce a dma_common_find_pages helper
Date: Fri, 30 Aug 2019 08:29:23 +0200
Message-Id: <20190830062924.21714-4-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190830062924.21714-1-hch@lst.de>
References: <20190830062924.21714-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_MED,
	SUSPICIOUS_RECIPS autolearn=no version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-xtensa@linux-xtensa.org, linux-kernel@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>, linux-mm@kvack.org,
	Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

A helper to find the backing page array based on a virtual address.
This also ensures we do the same vm_flags check everywhere instead
of slightly different or missing ones in a few places.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/arm/mm/dma-mapping.c   |  7 +------
 drivers/iommu/dma-iommu.c   | 15 +++------------
 include/linux/dma-mapping.h |  1 +
 kernel/dma/remap.c          | 13 +++++++++++--
 4 files changed, 16 insertions(+), 20 deletions(-)

diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
index 054a66f725b3..d07e5c865557 100644
--- a/arch/arm/mm/dma-mapping.c
+++ b/arch/arm/mm/dma-mapping.c
@@ -1447,18 +1447,13 @@ static struct page **__atomic_get_pages(void *addr)
 
 static struct page **__iommu_get_pages(void *cpu_addr, unsigned long attrs)
 {
-	struct vm_struct *area;
-
 	if (__in_atomic_pool(cpu_addr, PAGE_SIZE))
 		return __atomic_get_pages(cpu_addr);
 
 	if (attrs & DMA_ATTR_NO_KERNEL_MAPPING)
 		return cpu_addr;
 
-	area = find_vm_area(cpu_addr);
-	if (area && (area->flags & VM_DMA_COHERENT))
-		return area->pages;
-	return NULL;
+	return dma_common_find_pages(cpu_addr);
 }
 
 static void *__iommu_alloc_simple(struct device *dev, size_t size, gfp_t gfp,
diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 013416f5ad38..eafc378da448 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -541,15 +541,6 @@ static struct page **__iommu_dma_alloc_pages(struct device *dev,
 	return pages;
 }
 
-static struct page **__iommu_dma_get_pages(void *cpu_addr)
-{
-	struct vm_struct *area = find_vm_area(cpu_addr);
-
-	if (!area || !area->pages)
-		return NULL;
-	return area->pages;
-}
-
 /**
  * iommu_dma_alloc_remap - Allocate and map a buffer contiguous in IOVA space
  * @dev: Device to allocate memory for. Must be a real device
@@ -938,7 +929,7 @@ static void __iommu_dma_free(struct device *dev, size_t size, void *cpu_addr)
 		 * If it the address is remapped, then it's either non-coherent
 		 * or highmem CMA, or an iommu_dma_alloc_remap() construction.
 		 */
-		pages = __iommu_dma_get_pages(cpu_addr);
+		pages = dma_common_find_pages(cpu_addr);
 		if (!pages)
 			page = vmalloc_to_page(cpu_addr);
 		dma_common_free_remap(cpu_addr, alloc_size);
@@ -1045,7 +1036,7 @@ static int iommu_dma_mmap(struct device *dev, struct vm_area_struct *vma,
 		return -ENXIO;
 
 	if (IS_ENABLED(CONFIG_DMA_REMAP) && is_vmalloc_addr(cpu_addr)) {
-		struct page **pages = __iommu_dma_get_pages(cpu_addr);
+		struct page **pages = dma_common_find_pages(cpu_addr);
 
 		if (pages)
 			return __iommu_dma_mmap(pages, size, vma);
@@ -1067,7 +1058,7 @@ static int iommu_dma_get_sgtable(struct device *dev, struct sg_table *sgt,
 	int ret;
 
 	if (IS_ENABLED(CONFIG_DMA_REMAP) && is_vmalloc_addr(cpu_addr)) {
-		struct page **pages = __iommu_dma_get_pages(cpu_addr);
+		struct page **pages = dma_common_find_pages(cpu_addr);
 
 		if (pages) {
 			return sg_alloc_table_from_pages(sgt, pages,
diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index c9725390fbbc..e4840f40ae69 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -615,6 +615,7 @@ extern int dma_common_mmap(struct device *dev, struct vm_area_struct *vma,
 		void *cpu_addr, dma_addr_t dma_addr, size_t size,
 		unsigned long attrs);
 
+struct page **dma_common_find_pages(void *cpu_addr);
 void *dma_common_contiguous_remap(struct page *page, size_t size,
 			pgprot_t prot, const void *caller);
 
diff --git a/kernel/dma/remap.c b/kernel/dma/remap.c
index 01d4ef5685a4..3482fc585c59 100644
--- a/kernel/dma/remap.c
+++ b/kernel/dma/remap.c
@@ -11,6 +11,15 @@
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
 
+struct page **dma_common_find_pages(void *cpu_addr)
+{
+	struct vm_struct *area = find_vm_area(cpu_addr);
+
+	if (!area || area->flags != VM_DMA_COHERENT)
+		return NULL;
+	return area->pages;
+}
+
 static struct vm_struct *__dma_common_pages_remap(struct page **pages,
 			size_t size, pgprot_t prot, const void *caller)
 {
@@ -78,9 +87,9 @@ void *dma_common_contiguous_remap(struct page *page, size_t size,
  */
 void dma_common_free_remap(void *cpu_addr, size_t size)
 {
-	struct vm_struct *area = find_vm_area(cpu_addr);
+	struct page **pages = dma_common_find_pages(cpu_addr);
 
-	if (!area || area->flags != VM_DMA_COHERENT) {
+	if (!pages) {
 		WARN(1, "trying to free invalid coherent area: %p\n", cpu_addr);
 		return;
 	}
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
