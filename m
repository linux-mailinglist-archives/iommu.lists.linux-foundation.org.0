Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id B05002969BD
	for <lists.iommu@lfdr.de>; Fri, 23 Oct 2020 08:33:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3E2A186F96;
	Fri, 23 Oct 2020 06:33:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id axfCymJDIFCb; Fri, 23 Oct 2020 06:33:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1555F86F8D;
	Fri, 23 Oct 2020 06:33:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E9F31C1AD7;
	Fri, 23 Oct 2020 06:33:19 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A288CC0051
 for <iommu@lists.linux-foundation.org>; Fri, 23 Oct 2020 06:33:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7F02287716
 for <iommu@lists.linux-foundation.org>; Fri, 23 Oct 2020 06:33:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C-OpGxPKcqcC for <iommu@lists.linux-foundation.org>;
 Fri, 23 Oct 2020 06:33:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by hemlock.osuosl.org (Postfix) with ESMTPS id A4C73876E3
 for <iommu@lists.linux-foundation.org>; Fri, 23 Oct 2020 06:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=VgaUDy/MYBhcMGNLTA5dcYkNxjEeOYucsAXgukb+9OE=; b=F21OlX9RTzKj2RyK9S1jOONSVX
 fBGHNAfoEYPDghf73ahvw01VvwR8PBi1lgexR2AR9oXWJ8uVIwb97yh6lOectRl76KlmCZaRD7CZB
 Ne0xWy9GBkkZrB0i0jyH0wgEx7a71zWxL5vUy7EJQ0Y/eO9C5hS6Ecpx9DEFTJOx+t7KW8Cf+A9wz
 KjFNSkhJly6lhDd+duxQgCu1UbcPA+t2i5M9NdOsDKaAI4qr1LABguhWCwhXX8rdvsbJJE/VUbkbG
 mIkn/UOMzSrskutaE903B6fgNIIN4QFDY3iMmZhu6C/TArJvku+4c7lzLjoRYMzNsxXu8Tc01GkSV
 d+cOoHsQ==;
Received: from [2001:4bb8:18c:20bd:c70:4a89:bc61:3] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVqdU-0005Dv-O2; Fri, 23 Oct 2020 06:33:13 +0000
From: Christoph Hellwig <hch@lst.de>
To: konrad.wilk@oracle.com
Subject: [PATCH for-5.10] swiotlb: remove the tbl_dma_addr argument to
 swiotlb_tbl_map_single
Date: Fri, 23 Oct 2020 08:33:09 +0200
Message-Id: <20201023063309.3472987-1-hch@lst.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: xen-devel@lists.xenproject.org, iommu@lists.linux-foundation.org,
 Stefano Stabellini <sstabellini@kernel.org>
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

The tbl_dma_addr argument is used to check the DMA boundary for the
allocations, and thus needs to be a dma_addr_t.  swiotlb-xen instead
passed a physical address, which could lead to incorrect results for
strange offsets.  Fix this by removing the parameter entirely and hard
code the DMA address for io_tlb_start instead.

Fixes: 91ffe4ad534a ("swiotlb-xen: introduce phys_to_dma/dma_to_phys translations")
Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 drivers/iommu/intel/iommu.c |  5 ++---
 drivers/xen/swiotlb-xen.c   |  3 +--
 include/linux/swiotlb.h     | 10 +++-------
 kernel/dma/swiotlb.c        | 16 ++++++----------
 4 files changed, 12 insertions(+), 22 deletions(-)

diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index 8651f6d4dfa032..6b560e6f193096 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -3815,9 +3815,8 @@ bounce_map_single(struct device *dev, phys_addr_t paddr, size_t size,
 	 * page aligned, we don't need to use a bounce page.
 	 */
 	if (!IS_ALIGNED(paddr | size, VTD_PAGE_SIZE)) {
-		tlb_addr = swiotlb_tbl_map_single(dev,
-				phys_to_dma_unencrypted(dev, io_tlb_start),
-				paddr, size, aligned_size, dir, attrs);
+		tlb_addr = swiotlb_tbl_map_single(dev, paddr, size,
+				aligned_size, dir, attrs);
 		if (tlb_addr == DMA_MAPPING_ERROR) {
 			goto swiotlb_error;
 		} else {
diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index 71ce1b7a23d1cc..2b385c1b4a99cb 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -395,8 +395,7 @@ static dma_addr_t xen_swiotlb_map_page(struct device *dev, struct page *page,
 	 */
 	trace_swiotlb_bounced(dev, dev_addr, size, swiotlb_force);
 
-	map = swiotlb_tbl_map_single(dev, virt_to_phys(xen_io_tlb_start),
-				     phys, size, size, dir, attrs);
+	map = swiotlb_tbl_map_single(dev, phys, size, size, dir, attrs);
 	if (map == (phys_addr_t)DMA_MAPPING_ERROR)
 		return DMA_MAPPING_ERROR;
 
diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index 513913ff748626..3bb72266a75a1d 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -45,13 +45,9 @@ enum dma_sync_target {
 	SYNC_FOR_DEVICE = 1,
 };
 
-extern phys_addr_t swiotlb_tbl_map_single(struct device *hwdev,
-					  dma_addr_t tbl_dma_addr,
-					  phys_addr_t phys,
-					  size_t mapping_size,
-					  size_t alloc_size,
-					  enum dma_data_direction dir,
-					  unsigned long attrs);
+phys_addr_t swiotlb_tbl_map_single(struct device *hwdev, phys_addr_t phys,
+		size_t mapping_size, size_t alloc_size,
+		enum dma_data_direction dir, unsigned long attrs);
 
 extern void swiotlb_tbl_unmap_single(struct device *hwdev,
 				     phys_addr_t tlb_addr,
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index b4eea0abc3f002..92e2f54f24c01b 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -441,14 +441,11 @@ static void swiotlb_bounce(phys_addr_t orig_addr, phys_addr_t tlb_addr,
 	}
 }
 
-phys_addr_t swiotlb_tbl_map_single(struct device *hwdev,
-				   dma_addr_t tbl_dma_addr,
-				   phys_addr_t orig_addr,
-				   size_t mapping_size,
-				   size_t alloc_size,
-				   enum dma_data_direction dir,
-				   unsigned long attrs)
+phys_addr_t swiotlb_tbl_map_single(struct device *hwdev, phys_addr_t orig_addr,
+		size_t mapping_size, size_t alloc_size,
+		enum dma_data_direction dir, unsigned long attrs)
 {
+	dma_addr_t tbl_dma_addr = phys_to_dma_unencrypted(hwdev, io_tlb_start);
 	unsigned long flags;
 	phys_addr_t tlb_addr;
 	unsigned int nslots, stride, index, wrap;
@@ -667,9 +664,8 @@ dma_addr_t swiotlb_map(struct device *dev, phys_addr_t paddr, size_t size,
 	trace_swiotlb_bounced(dev, phys_to_dma(dev, paddr), size,
 			      swiotlb_force);
 
-	swiotlb_addr = swiotlb_tbl_map_single(dev,
-			phys_to_dma_unencrypted(dev, io_tlb_start),
-			paddr, size, size, dir, attrs);
+	swiotlb_addr = swiotlb_tbl_map_single(dev, paddr, size, size, dir,
+			attrs);
 	if (swiotlb_addr == (phys_addr_t)DMA_MAPPING_ERROR)
 		return DMA_MAPPING_ERROR;
 
-- 
2.28.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
