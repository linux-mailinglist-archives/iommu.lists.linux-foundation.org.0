Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2C4327861
	for <lists.iommu@lfdr.de>; Mon,  1 Mar 2021 08:45:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9162A43023;
	Mon,  1 Mar 2021 07:45:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OIOTALG1AWtE; Mon,  1 Mar 2021 07:45:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 79B0242D19;
	Mon,  1 Mar 2021 07:45:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5752EC0001;
	Mon,  1 Mar 2021 07:45:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EADCCC0001
 for <iommu@lists.linux-foundation.org>; Mon,  1 Mar 2021 07:45:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DABAD842DC
 for <iommu@lists.linux-foundation.org>; Mon,  1 Mar 2021 07:45:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t_2TNXCWXBBR for <iommu@lists.linux-foundation.org>;
 Mon,  1 Mar 2021 07:45:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D4B5C842D1
 for <iommu@lists.linux-foundation.org>; Mon,  1 Mar 2021 07:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=tKaBu0f6sdjk6bNW9s6/VvP1+ZEbLxuaNFQMHAfVp5Q=; b=tKh68XQqoLQiyHvT+9s1iAuWb2
 A5FHu4Y6qdjG086l6/NN4x9mA8n+M0pOWZfnYJ9MIs+c2dF9phYH13gQTwrBdGbDygjmQEB5aQ6gF
 FxLIE7L6N3XRkmMcDsP2rOd3gZFrjhkzFt0/gUTcIe6o8Nn5gFpgG+aEcKvT8pMEh9FFy0RrINRpi
 8+9SrARqXNgIkfp0fvZ72NB6BSU7FRO1tCOwwexDYXjY0p6pS0BBHifNAGlXCOHfbfTbfW1o2k9wz
 VNO74OsM9eHlp+EhF0Og7xcINd/5VkklKfsO0g9ny3Vj4yGHzy0GJpxvy3jmjQapduX5elWVYyn8j
 TBscHQNg==;
Received: from [2001:4bb8:19b:e4b7:cdf9:733f:4874:8eb4] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lGdEi-00FR5G-79; Mon, 01 Mar 2021 07:45:01 +0000
From: Christoph Hellwig <hch@lst.de>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: [PATCH 02/14] swiotlb: remove the alloc_size parameter to
 swiotlb_tbl_unmap_single
Date: Mon,  1 Mar 2021 08:44:24 +0100
Message-Id: <20210301074436.919889-3-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210301074436.919889-1-hch@lst.de>
References: <20210301074436.919889-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: Michael Ellerman <mpe@ellerman.id.au>, iommu@lists.linux-foundation.org,
 xen-devel@lists.xenproject.org, Claire Chang <tientzu@chromium.org>,
 linuxppc-dev@lists.ozlabs.org, Dongli Zhang <dongli.zhang@oracle.com>
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

Now that swiotlb remembers the allocation size there is no need to pass
it back to swiotlb_tbl_unmap_single.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/iommu/dma-iommu.c | 11 +++-------
 drivers/xen/swiotlb-xen.c |  4 ++--
 include/linux/swiotlb.h   |  1 -
 kernel/dma/direct.h       |  2 +-
 kernel/dma/swiotlb.c      | 45 ++++++++++++++++++++-------------------
 5 files changed, 29 insertions(+), 34 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 9ab6ee22c11088..da2bd8f0885e6e 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -493,8 +493,6 @@ static void __iommu_dma_unmap_swiotlb(struct device *dev, dma_addr_t dma_addr,
 		unsigned long attrs)
 {
 	struct iommu_domain *domain = iommu_get_dma_domain(dev);
-	struct iommu_dma_cookie *cookie = domain->iova_cookie;
-	struct iova_domain *iovad = &cookie->iovad;
 	phys_addr_t phys;
 
 	phys = iommu_iova_to_phys(domain, dma_addr);
@@ -504,8 +502,7 @@ static void __iommu_dma_unmap_swiotlb(struct device *dev, dma_addr_t dma_addr,
 	__iommu_dma_unmap(dev, dma_addr, size);
 
 	if (unlikely(is_swiotlb_buffer(phys)))
-		swiotlb_tbl_unmap_single(dev, phys, size,
-				iova_align(iovad, size), dir, attrs);
+		swiotlb_tbl_unmap_single(dev, phys, size, dir, attrs);
 }
 
 static bool dev_is_untrusted(struct device *dev)
@@ -580,10 +577,8 @@ static dma_addr_t __iommu_dma_map_swiotlb(struct device *dev, phys_addr_t phys,
 	}
 
 	iova = __iommu_dma_map(dev, phys, aligned_size, prot, dma_mask);
-	if ((iova == DMA_MAPPING_ERROR) && is_swiotlb_buffer(phys))
-		swiotlb_tbl_unmap_single(dev, phys, org_size,
-				aligned_size, dir, attrs);
-
+	if (iova == DMA_MAPPING_ERROR && is_swiotlb_buffer(phys))
+		swiotlb_tbl_unmap_single(dev, phys, org_size, dir, attrs);
 	return iova;
 }
 
diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index 2b385c1b4a99cb..d47f1b311caac0 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -406,7 +406,7 @@ static dma_addr_t xen_swiotlb_map_page(struct device *dev, struct page *page,
 	 * Ensure that the address returned is DMA'ble
 	 */
 	if (unlikely(!dma_capable(dev, dev_addr, size, true))) {
-		swiotlb_tbl_unmap_single(dev, map, size, size, dir,
+		swiotlb_tbl_unmap_single(dev, map, size, dir,
 				attrs | DMA_ATTR_SKIP_CPU_SYNC);
 		return DMA_MAPPING_ERROR;
 	}
@@ -445,7 +445,7 @@ static void xen_swiotlb_unmap_page(struct device *hwdev, dma_addr_t dev_addr,
 
 	/* NOTE: We use dev_addr here, not paddr! */
 	if (is_xen_swiotlb_buffer(hwdev, dev_addr))
-		swiotlb_tbl_unmap_single(hwdev, paddr, size, size, dir, attrs);
+		swiotlb_tbl_unmap_single(hwdev, paddr, size, dir, attrs);
 }
 
 static void
diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index 5857a937c63722..59f421d041ed9e 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -57,7 +57,6 @@ phys_addr_t swiotlb_tbl_map_single(struct device *hwdev, phys_addr_t phys,
 extern void swiotlb_tbl_unmap_single(struct device *hwdev,
 				     phys_addr_t tlb_addr,
 				     size_t mapping_size,
-				     size_t alloc_size,
 				     enum dma_data_direction dir,
 				     unsigned long attrs);
 
diff --git a/kernel/dma/direct.h b/kernel/dma/direct.h
index b9861557873768..e1bf721591c0cf 100644
--- a/kernel/dma/direct.h
+++ b/kernel/dma/direct.h
@@ -114,6 +114,6 @@ static inline void dma_direct_unmap_page(struct device *dev, dma_addr_t addr,
 		dma_direct_sync_single_for_cpu(dev, addr, size, dir);
 
 	if (unlikely(is_swiotlb_buffer(phys)))
-		swiotlb_tbl_unmap_single(dev, phys, size, size, dir, attrs);
+		swiotlb_tbl_unmap_single(dev, phys, size, dir, attrs);
 }
 #endif /* _KERNEL_DMA_DIRECT_H */
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index c10e855a03bc16..03aa614565e417 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -102,7 +102,7 @@ static phys_addr_t *io_tlb_orig_addr;
 /*
  * The mapped buffer's size should be validated during a sync operation.
  */
-static size_t *io_tlb_orig_size;
+static size_t *io_tlb_alloc_size;
 
 /*
  * Protect the above data structures in the map and unmap calls
@@ -253,15 +253,15 @@ int __init swiotlb_init_with_tbl(char *tlb, unsigned long nslabs, int verbose)
 		      __func__, alloc_size, PAGE_SIZE);
 
 	alloc_size = PAGE_ALIGN(io_tlb_nslabs * sizeof(size_t));
-	io_tlb_orig_size = memblock_alloc(alloc_size, PAGE_SIZE);
-	if (!io_tlb_orig_size)
+	io_tlb_alloc_size = memblock_alloc(alloc_size, PAGE_SIZE);
+	if (!io_tlb_alloc_size)
 		panic("%s: Failed to allocate %zu bytes align=0x%lx\n",
 		      __func__, alloc_size, PAGE_SIZE);
 
 	for (i = 0; i < io_tlb_nslabs; i++) {
 		io_tlb_list[i] = IO_TLB_SEGSIZE - io_tlb_offset(i);
 		io_tlb_orig_addr[i] = INVALID_PHYS_ADDR;
-		io_tlb_orig_size[i] = 0;
+		io_tlb_alloc_size[i] = 0;
 	}
 	io_tlb_index = 0;
 	no_iotlb_memory = false;
@@ -393,18 +393,18 @@ swiotlb_late_init_with_tbl(char *tlb, unsigned long nslabs)
 	if (!io_tlb_orig_addr)
 		goto cleanup4;
 
-	io_tlb_orig_size = (size_t *)
+	io_tlb_alloc_size = (size_t *)
 		__get_free_pages(GFP_KERNEL,
 				 get_order(io_tlb_nslabs *
 					   sizeof(size_t)));
-	if (!io_tlb_orig_size)
+	if (!io_tlb_alloc_size)
 		goto cleanup5;
 
 
 	for (i = 0; i < io_tlb_nslabs; i++) {
 		io_tlb_list[i] = IO_TLB_SEGSIZE - io_tlb_offset(i);
 		io_tlb_orig_addr[i] = INVALID_PHYS_ADDR;
-		io_tlb_orig_size[i] = 0;
+		io_tlb_alloc_size[i] = 0;
 	}
 	io_tlb_index = 0;
 	no_iotlb_memory = false;
@@ -436,7 +436,7 @@ void __init swiotlb_exit(void)
 		return;
 
 	if (late_alloc) {
-		free_pages((unsigned long)io_tlb_orig_size,
+		free_pages((unsigned long)io_tlb_alloc_size,
 			   get_order(io_tlb_nslabs * sizeof(size_t)));
 		free_pages((unsigned long)io_tlb_orig_addr,
 			   get_order(io_tlb_nslabs * sizeof(phys_addr_t)));
@@ -447,7 +447,7 @@ void __init swiotlb_exit(void)
 	} else {
 		memblock_free_late(__pa(io_tlb_orig_addr),
 				   PAGE_ALIGN(io_tlb_nslabs * sizeof(phys_addr_t)));
-		memblock_free_late(__pa(io_tlb_orig_size),
+		memblock_free_late(__pa(io_tlb_alloc_size),
 				   PAGE_ALIGN(io_tlb_nslabs * sizeof(size_t)));
 		memblock_free_late(__pa(io_tlb_list),
 				   PAGE_ALIGN(io_tlb_nslabs * sizeof(int)));
@@ -639,7 +639,7 @@ phys_addr_t swiotlb_tbl_map_single(struct device *dev, phys_addr_t orig_addr,
 	 */
 	for (i = 0; i < nr_slots(alloc_size + offset); i++) {
 		io_tlb_orig_addr[index + i] = slot_addr(orig_addr, i);
-		io_tlb_orig_size[index+i] = alloc_size - (i << IO_TLB_SHIFT);
+		io_tlb_alloc_size[index+i] = alloc_size - (i << IO_TLB_SHIFT);
 	}
 	tlb_addr = slot_addr(io_tlb_start, index) + offset;
 	if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC) &&
@@ -648,14 +648,14 @@ phys_addr_t swiotlb_tbl_map_single(struct device *dev, phys_addr_t orig_addr,
 	return tlb_addr;
 }
 
-static void validate_sync_size_and_truncate(struct device *hwdev, size_t orig_size, size_t *size)
+static void validate_sync_size_and_truncate(struct device *hwdev, size_t alloc_size, size_t *size)
 {
-	if (*size > orig_size) {
+	if (*size > alloc_size) {
 		/* Warn and truncate mapping_size */
 		dev_WARN_ONCE(hwdev, 1,
 			"Attempt for buffer overflow. Original size: %zu. Mapping size: %zu.\n",
-			orig_size, *size);
-		*size = orig_size;
+			alloc_size, *size);
+		*size = alloc_size;
 	}
 }
 
@@ -663,16 +663,17 @@ static void validate_sync_size_and_truncate(struct device *hwdev, size_t orig_si
  * tlb_addr is the physical address of the bounce buffer to unmap.
  */
 void swiotlb_tbl_unmap_single(struct device *hwdev, phys_addr_t tlb_addr,
-			      size_t mapping_size, size_t alloc_size,
-			      enum dma_data_direction dir, unsigned long attrs)
+			      size_t mapping_size, enum dma_data_direction dir,
+			      unsigned long attrs)
 {
 	unsigned long flags;
 	unsigned int offset = swiotlb_align_offset(hwdev, tlb_addr);
-	int i, count, nslots = nr_slots(alloc_size + offset);
 	int index = (tlb_addr - offset - io_tlb_start) >> IO_TLB_SHIFT;
 	phys_addr_t orig_addr = io_tlb_orig_addr[index];
+	size_t alloc_size = io_tlb_alloc_size[index];
+	int i, count, nslots = nr_slots(alloc_size + offset);
 
-	validate_sync_size_and_truncate(hwdev, io_tlb_orig_size[index], &mapping_size);
+	validate_sync_size_and_truncate(hwdev, alloc_size, &mapping_size);
 
 	/*
 	 * First, sync the memory before unmapping the entry
@@ -701,7 +702,7 @@ void swiotlb_tbl_unmap_single(struct device *hwdev, phys_addr_t tlb_addr,
 	for (i = index + nslots - 1; i >= index; i--) {
 		io_tlb_list[i] = ++count;
 		io_tlb_orig_addr[i] = INVALID_PHYS_ADDR;
-		io_tlb_orig_size[i] = 0;
+		io_tlb_alloc_size[i] = 0;
 	}
 
 	/*
@@ -721,13 +722,13 @@ void swiotlb_tbl_sync_single(struct device *hwdev, phys_addr_t tlb_addr,
 			     enum dma_sync_target target)
 {
 	int index = (tlb_addr - io_tlb_start) >> IO_TLB_SHIFT;
-	size_t orig_size = io_tlb_orig_size[index];
+	size_t alloc_size = io_tlb_alloc_size[index];
 	phys_addr_t orig_addr = io_tlb_orig_addr[index];
 
 	if (orig_addr == INVALID_PHYS_ADDR)
 		return;
 
-	validate_sync_size_and_truncate(hwdev, orig_size, &size);
+	validate_sync_size_and_truncate(hwdev, alloc_size, &size);
 
 	switch (target) {
 	case SYNC_FOR_CPU:
@@ -770,7 +771,7 @@ dma_addr_t swiotlb_map(struct device *dev, phys_addr_t paddr, size_t size,
 	/* Ensure that the address returned is DMA'ble */
 	dma_addr = phys_to_dma_unencrypted(dev, swiotlb_addr);
 	if (unlikely(!dma_capable(dev, dma_addr, size, true))) {
-		swiotlb_tbl_unmap_single(dev, swiotlb_addr, size, size, dir,
+		swiotlb_tbl_unmap_single(dev, swiotlb_addr, size, dir,
 			attrs | DMA_ATTR_SKIP_CPU_SYNC);
 		dev_WARN_ONCE(dev, 1,
 			"swiotlb addr %pad+%zu overflow (mask %llx, bus limit %llx).\n",
-- 
2.29.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
