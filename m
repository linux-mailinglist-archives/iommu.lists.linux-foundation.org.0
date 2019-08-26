Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 243659CF93
	for <lists.iommu@lfdr.de>; Mon, 26 Aug 2019 14:22:20 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 6F94C1559;
	Mon, 26 Aug 2019 12:21:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 455CE154D
	for <iommu@lists.linux-foundation.org>;
	Mon, 26 Aug 2019 12:20:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 28AF88A3
	for <iommu@lists.linux-foundation.org>;
	Mon, 26 Aug 2019 12:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=S2Mh/koMqWE5/IDrMMarWfmM4ONE569Aw8dJZHBpwwk=;
	b=qMN6hF0/QJ+Z7/NAuEDgqW/pOm
	bXTgtZPO76Hv9+jKSxUr72HbDhOgNSPUuNASYeYwoh4x2J5iqiIyaZ0+95JWH0HJAtrpQgxQxr2Rb
	CRcZfWFqAj4B2RTAh9FgPErLXhMIXAFERQbJ9EQx+7/O73YOx8u6KNeJkXLwda0sQo/INTa3M43Px
	NjYYALKUaLhXmBytFn+Kzk1TaQoUga7fxkJzQwtPgBoSXOjQPtU8rgNQTlcrLT2grJjDfr9hNQq0t
	6yMeVF8Y8SfjoSoNxda03w7V3b2itFF7734b3nOOesaB8HHVFW0UPrJZUpTP/8wjJYE5XSdaCNx6u
	ad89Dbrw==;
Received: from clnet-p19-102.ikbnet.co.at ([83.175.77.102] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
	id 1i2Dyc-0002W3-CM; Mon, 26 Aug 2019 12:20:02 +0000
From: Christoph Hellwig <hch@lst.de>
To: Stefano Stabellini <sstabellini@kernel.org>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: [PATCH 06/11] swiotlb-xen: always use dma-direct helpers to alloc
	coherent pages
Date: Mon, 26 Aug 2019 14:19:39 +0200
Message-Id: <20190826121944.515-7-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190826121944.515-1-hch@lst.de>
References: <20190826121944.515-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: xen-devel@lists.xenproject.org, iommu@lists.linux-foundation.org,
	x86@kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
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

x86 currently calls alloc_pages, but using dma-direct works as well
there, with the added benefit of using the CMA pool if available.
The biggest advantage is of course to remove a pointless bit of
architecture specific code.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/x86/include/asm/xen/page-coherent.h | 16 ----------------
 drivers/xen/swiotlb-xen.c                |  7 +++----
 include/xen/arm/page-coherent.h          | 12 ------------
 3 files changed, 3 insertions(+), 32 deletions(-)

diff --git a/arch/x86/include/asm/xen/page-coherent.h b/arch/x86/include/asm/xen/page-coherent.h
index 116777e7f387..8ee33c5edded 100644
--- a/arch/x86/include/asm/xen/page-coherent.h
+++ b/arch/x86/include/asm/xen/page-coherent.h
@@ -5,22 +5,6 @@
 #include <asm/page.h>
 #include <linux/dma-mapping.h>
 
-static inline void *xen_alloc_coherent_pages(struct device *hwdev, size_t size,
-		dma_addr_t *dma_handle, gfp_t flags,
-		unsigned long attrs)
-{
-	void *vstart = (void*)__get_free_pages(flags, get_order(size));
-	*dma_handle = virt_to_phys(vstart);
-	return vstart;
-}
-
-static inline void xen_free_coherent_pages(struct device *hwdev, size_t size,
-		void *cpu_addr, dma_addr_t dma_handle,
-		unsigned long attrs)
-{
-	free_pages((unsigned long) cpu_addr, get_order(size));
-}
-
 static inline void xen_dma_map_page(struct device *hwdev, struct page *page,
 	     dma_addr_t dev_addr, unsigned long offset, size_t size,
 	     enum dma_data_direction dir, unsigned long attrs) { }
diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index b8808677ae1d..f9dd4cb6e4b3 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -299,8 +299,7 @@ xen_swiotlb_alloc_coherent(struct device *hwdev, size_t size,
 	 * address. In fact on ARM virt_to_phys only works for kernel direct
 	 * mapped RAM memory. Also see comment below.
 	 */
-	ret = xen_alloc_coherent_pages(hwdev, size, dma_handle, flags, attrs);
-
+	ret = dma_direct_alloc(hwdev, size, dma_handle, flags, attrs);
 	if (!ret)
 		return ret;
 
@@ -319,7 +318,7 @@ xen_swiotlb_alloc_coherent(struct device *hwdev, size_t size,
 	else {
 		if (xen_create_contiguous_region(phys, order,
 						 fls64(dma_mask), dma_handle) != 0) {
-			xen_free_coherent_pages(hwdev, size, ret, (dma_addr_t)phys, attrs);
+			dma_direct_free(hwdev, size, ret, (dma_addr_t)phys, attrs);
 			return NULL;
 		}
 		SetPageXenRemapped(virt_to_page(ret));
@@ -351,7 +350,7 @@ xen_swiotlb_free_coherent(struct device *hwdev, size_t size, void *vaddr,
 	    TestClearPageXenRemapped(virt_to_page(vaddr)))
 		xen_destroy_contiguous_region(phys, order);
 
-	xen_free_coherent_pages(hwdev, size, vaddr, (dma_addr_t)phys, attrs);
+	dma_direct_free(hwdev, size, vaddr, (dma_addr_t)phys, attrs);
 }
 
 /*
diff --git a/include/xen/arm/page-coherent.h b/include/xen/arm/page-coherent.h
index a840d6949a87..0e244f4fec1a 100644
--- a/include/xen/arm/page-coherent.h
+++ b/include/xen/arm/page-coherent.h
@@ -16,18 +16,6 @@ void __xen_dma_sync_single_for_cpu(struct device *hwdev,
 void __xen_dma_sync_single_for_device(struct device *hwdev,
 		dma_addr_t handle, size_t size, enum dma_data_direction dir);
 
-static inline void *xen_alloc_coherent_pages(struct device *hwdev, size_t size,
-		dma_addr_t *dma_handle, gfp_t flags, unsigned long attrs)
-{
-	return dma_direct_alloc(hwdev, size, dma_handle, flags, attrs);
-}
-
-static inline void xen_free_coherent_pages(struct device *hwdev, size_t size,
-		void *cpu_addr, dma_addr_t dma_handle, unsigned long attrs)
-{
-	dma_direct_free(hwdev, size, cpu_addr, dma_handle, attrs);
-}
-
 static inline void xen_dma_sync_single_for_cpu(struct device *hwdev,
 		dma_addr_t handle, size_t size, enum dma_data_direction dir)
 {
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
