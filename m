Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 294EA2A7865
	for <lists.iommu@lfdr.de>; Thu,  5 Nov 2020 08:57:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id C10998708F;
	Thu,  5 Nov 2020 07:57:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GeI-CKilOmqe; Thu,  5 Nov 2020 07:57:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 33AC787085;
	Thu,  5 Nov 2020 07:57:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 18EA7C0889;
	Thu,  5 Nov 2020 07:57:39 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3979BC0889
 for <iommu@lists.linux-foundation.org>; Thu,  5 Nov 2020 07:57:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 312E687085
 for <iommu@lists.linux-foundation.org>; Thu,  5 Nov 2020 07:57:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pF+ZtMwUGhiZ for <iommu@lists.linux-foundation.org>;
 Thu,  5 Nov 2020 07:57:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7764287069
 for <iommu@lists.linux-foundation.org>; Thu,  5 Nov 2020 07:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=6i+ZQBC5XZcaf/YFDznwfiEdycwkjc1Y9jVRZuhej00=; b=RH683BS6pYnoIPIxpAcBWUqUpd
 gqmAHzd9FO2OScF+iPyFvAUGstxatab/1MyTa29VRPgKnarjTDlivC4qMlYxh0sNa/jwkl5WLbZ6m
 E4uJ410+U7P/vgKuuDQjXsYqdmdMQohqESMnUm2zsl0Zv1gamoJuyBwmXJ6u+qyCEnA3tWXN5s3ON
 4bvPeFh5nUOzMnhg1WarNiX07CbIvvzgyP7Wr5Ad0qAtmeBBVS9qVm/1xVb6lrm6dGNMIYU3yjXlE
 5U2k7NH2Ji/oaKI8+oFbU+fGS2MgH03GuTqe7mIA+EjZb4I4DDbUFS9REcRIEGbmO/bujSuGMmd5b
 i8OQCGKA==;
Received: from 089144208145.atnat0017.highway.a1.net ([89.144.208.145]
 helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaa9B-0005KN-RF; Thu, 05 Nov 2020 07:57:30 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: [PATCH 6/6] dma-mapping: remove dma_virt_ops
Date: Thu,  5 Nov 2020 08:42:05 +0100
Message-Id: <20201105074205.1690638-7-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201105074205.1690638-1-hch@lst.de>
References: <20201105074205.1690638-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: Zhu Yanjun <yanjunz@nvidia.com>,
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
 linux-rdma@vger.kernel.org, linux-pci@vger.kernel.org,
 Mike Marciniszyn <mike.marciniszyn@cornelisnetworks.com>,
 iommu@lists.linux-foundation.org, Bjorn Helgaas <bhelgaas@google.com>,
 Bernard Metzler <bmt@zurich.ibm.com>, Logan Gunthorpe <logang@deltatee.com>
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

Now that the RDMA core deals with devices that only do DMA mapping in
lower layers properly, there is no user for dma_virt_ops and it can
be removed.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/linux/dma-mapping.h |  2 --
 kernel/dma/Kconfig          |  5 ---
 kernel/dma/Makefile         |  1 -
 kernel/dma/virt.c           | 61 -------------------------------------
 4 files changed, 69 deletions(-)
 delete mode 100644 kernel/dma/virt.c

diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index 956151052d4542..2aaed35b556df4 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -565,6 +565,4 @@ static inline int dma_mmap_wc(struct device *dev,
 int dma_direct_set_offset(struct device *dev, phys_addr_t cpu_start,
 		dma_addr_t dma_start, u64 size);
 
-extern const struct dma_map_ops dma_virt_ops;
-
 #endif /* _LINUX_DMA_MAPPING_H */
diff --git a/kernel/dma/Kconfig b/kernel/dma/Kconfig
index c99de4a2145889..fd2db2665fc691 100644
--- a/kernel/dma/Kconfig
+++ b/kernel/dma/Kconfig
@@ -75,11 +75,6 @@ config ARCH_HAS_DMA_PREP_COHERENT
 config ARCH_HAS_FORCE_DMA_UNENCRYPTED
 	bool
 
-config DMA_VIRT_OPS
-	bool
-	depends on HAS_DMA
-	select DMA_OPS
-
 config SWIOTLB
 	bool
 	select NEED_DMA_MAP_STATE
diff --git a/kernel/dma/Makefile b/kernel/dma/Makefile
index dc755ab68aabf9..cd1d86358a7a62 100644
--- a/kernel/dma/Makefile
+++ b/kernel/dma/Makefile
@@ -5,7 +5,6 @@ obj-$(CONFIG_DMA_OPS)			+= ops_helpers.o
 obj-$(CONFIG_DMA_OPS)			+= dummy.o
 obj-$(CONFIG_DMA_CMA)			+= contiguous.o
 obj-$(CONFIG_DMA_DECLARE_COHERENT)	+= coherent.o
-obj-$(CONFIG_DMA_VIRT_OPS)		+= virt.o
 obj-$(CONFIG_DMA_API_DEBUG)		+= debug.o
 obj-$(CONFIG_SWIOTLB)			+= swiotlb.o
 obj-$(CONFIG_DMA_COHERENT_POOL)		+= pool.o
diff --git a/kernel/dma/virt.c b/kernel/dma/virt.c
deleted file mode 100644
index 59d32317dd574a..00000000000000
--- a/kernel/dma/virt.c
+++ /dev/null
@@ -1,61 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * DMA operations that map to virtual addresses without flushing memory.
- */
-#include <linux/export.h>
-#include <linux/mm.h>
-#include <linux/dma-map-ops.h>
-#include <linux/scatterlist.h>
-
-static void *dma_virt_alloc(struct device *dev, size_t size,
-			    dma_addr_t *dma_handle, gfp_t gfp,
-			    unsigned long attrs)
-{
-	void *ret;
-
-	ret = (void *)__get_free_pages(gfp | __GFP_ZERO, get_order(size));
-	if (ret)
-		*dma_handle = (uintptr_t)ret;
-	return ret;
-}
-
-static void dma_virt_free(struct device *dev, size_t size,
-			  void *cpu_addr, dma_addr_t dma_addr,
-			  unsigned long attrs)
-{
-	free_pages((unsigned long)cpu_addr, get_order(size));
-}
-
-static dma_addr_t dma_virt_map_page(struct device *dev, struct page *page,
-				    unsigned long offset, size_t size,
-				    enum dma_data_direction dir,
-				    unsigned long attrs)
-{
-	return (uintptr_t)(page_address(page) + offset);
-}
-
-static int dma_virt_map_sg(struct device *dev, struct scatterlist *sgl,
-			   int nents, enum dma_data_direction dir,
-			   unsigned long attrs)
-{
-	int i;
-	struct scatterlist *sg;
-
-	for_each_sg(sgl, sg, nents, i) {
-		BUG_ON(!sg_page(sg));
-		sg_dma_address(sg) = (uintptr_t)sg_virt(sg);
-		sg_dma_len(sg) = sg->length;
-	}
-
-	return nents;
-}
-
-const struct dma_map_ops dma_virt_ops = {
-	.alloc			= dma_virt_alloc,
-	.free			= dma_virt_free,
-	.map_page		= dma_virt_map_page,
-	.map_sg			= dma_virt_map_sg,
-	.alloc_pages		= dma_common_alloc_pages,
-	.free_pages		= dma_common_free_pages,
-};
-EXPORT_SYMBOL(dma_virt_ops);
-- 
2.28.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
