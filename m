Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A559A27668
	for <lists.iommu@lfdr.de>; Thu, 23 May 2019 09:00:53 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 7E467ECD;
	Thu, 23 May 2019 07:00:45 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id BB82CE9E
	for <iommu@lists.linux-foundation.org>;
	Thu, 23 May 2019 07:00:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 492975D0
	for <iommu@lists.linux-foundation.org>;
	Thu, 23 May 2019 07:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=1A0CYmcWhvy+wKWSP4NfkY1WYeE32cXUa3720dOqw2s=;
	b=jcClLVd+W8AnzvC9552STCA5Gy
	xPr+5n2eELujEImMOHflIDrVnqgBVxvm9tJkcMmu5M4s0KWH9kEsslXpBFKs+MLMk1SsYGNsKPjeP
	pFBESBb2z6sNip9sGHkC5giNAbCY9ah/AyhDhb3y+QA6lGIkrdfpFcMK42zrcjogwvAr2diBRk2bp
	GhQCB8Xt1T+Qq0aHVX8QnZaStvg7Jf59KWoc4q6NwPk7fCHzTf2lcAMf2fJaKufMFlLdoKocXcqUQ
	Bi8Fv4wLxYkp77Ri2O8jF31GIydi7siS6Z/yz0S2qbciLNqPThLd11/yNn7blsPX1Oz8ssWW9dUPJ
	90WmnmPA==;
Received: from 213-225-10-46.nat.highway.a1.net ([213.225.10.46]
	helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hThiP-0004iC-6v; Thu, 23 May 2019 07:00:37 +0000
From: Christoph Hellwig <hch@lst.de>
To: Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH 02/23] iommu/dma: Remove the flush_page callback
Date: Thu, 23 May 2019 09:00:07 +0200
Message-Id: <20190523070028.7435-3-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190523070028.7435-1-hch@lst.de>
References: <20190523070028.7435-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Tom Murphy <tmurphy@arista.com>, Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org,
	iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org
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

We now have a arch_dma_prep_coherent architecture hook that is used
for the generic DMA remap allocator, and we should use the same
interface for the dma-iommu code.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Robin Murphy <robin.murphy@arm.com>
Acked-by: Catalin Marinas <catalin.marinas@arm.com>
---
 arch/arm64/mm/dma-mapping.c | 8 +-------
 drivers/iommu/dma-iommu.c   | 8 +++-----
 include/linux/dma-iommu.h   | 3 +--
 3 files changed, 5 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/mm/dma-mapping.c b/arch/arm64/mm/dma-mapping.c
index 674860e3e478..10a8852c8b6a 100644
--- a/arch/arm64/mm/dma-mapping.c
+++ b/arch/arm64/mm/dma-mapping.c
@@ -104,12 +104,6 @@ arch_initcall(arm64_dma_init);
 #include <linux/platform_device.h>
 #include <linux/amba/bus.h>
 
-/* Thankfully, all cache ops are by VA so we can ignore phys here */
-static void flush_page(struct device *dev, const void *virt, phys_addr_t phys)
-{
-	__dma_flush_area(virt, PAGE_SIZE);
-}
-
 static void *__iommu_alloc_attrs(struct device *dev, size_t size,
 				 dma_addr_t *handle, gfp_t gfp,
 				 unsigned long attrs)
@@ -186,7 +180,7 @@ static void *__iommu_alloc_attrs(struct device *dev, size_t size,
 		struct page **pages;
 
 		pages = iommu_dma_alloc(dev, iosize, gfp, attrs, ioprot,
-					handle, flush_page);
+					handle);
 		if (!pages)
 			return NULL;
 
diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 129c4badf9ae..aac12433ffef 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -22,6 +22,7 @@
 #include <linux/acpi_iort.h>
 #include <linux/device.h>
 #include <linux/dma-iommu.h>
+#include <linux/dma-noncoherent.h>
 #include <linux/gfp.h>
 #include <linux/huge_mm.h>
 #include <linux/iommu.h>
@@ -560,8 +561,6 @@ void iommu_dma_free(struct device *dev, struct page **pages, size_t size,
  * @attrs: DMA attributes for this allocation
  * @prot: IOMMU mapping flags
  * @handle: Out argument for allocated DMA handle
- * @flush_page: Arch callback which must ensure PAGE_SIZE bytes from the
- *		given VA/PA are visible to the given non-coherent device.
  *
  * If @size is less than PAGE_SIZE, then a full CPU page will be allocated,
  * but an IOMMU which supports smaller pages might not map the whole thing.
@@ -570,8 +569,7 @@ void iommu_dma_free(struct device *dev, struct page **pages, size_t size,
  *	   or NULL on failure.
  */
 struct page **iommu_dma_alloc(struct device *dev, size_t size, gfp_t gfp,
-		unsigned long attrs, int prot, dma_addr_t *handle,
-		void (*flush_page)(struct device *, const void *, phys_addr_t))
+		unsigned long attrs, int prot, dma_addr_t *handle)
 {
 	struct iommu_domain *domain = iommu_get_dma_domain(dev);
 	struct iommu_dma_cookie *cookie = domain->iova_cookie;
@@ -615,7 +613,7 @@ struct page **iommu_dma_alloc(struct device *dev, size_t size, gfp_t gfp,
 		 */
 		sg_miter_start(&miter, sgt.sgl, sgt.orig_nents, SG_MITER_FROM_SG);
 		while (sg_miter_next(&miter))
-			flush_page(dev, miter.addr, page_to_phys(miter.page));
+			arch_dma_prep_coherent(miter.page, PAGE_SIZE);
 		sg_miter_stop(&miter);
 	}
 
diff --git a/include/linux/dma-iommu.h b/include/linux/dma-iommu.h
index dfb83f9c24dc..e1ef265b578b 100644
--- a/include/linux/dma-iommu.h
+++ b/include/linux/dma-iommu.h
@@ -44,8 +44,7 @@ int dma_info_to_prot(enum dma_data_direction dir, bool coherent,
  * the arch code to take care of attributes and cache maintenance
  */
 struct page **iommu_dma_alloc(struct device *dev, size_t size, gfp_t gfp,
-		unsigned long attrs, int prot, dma_addr_t *handle,
-		void (*flush_page)(struct device *, const void *, phys_addr_t));
+		unsigned long attrs, int prot, dma_addr_t *handle);
 void iommu_dma_free(struct device *dev, struct page **pages, size_t size,
 		dma_addr_t *handle);
 
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
