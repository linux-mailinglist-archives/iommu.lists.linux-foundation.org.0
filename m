Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6171A7AAD
	for <lists.iommu@lfdr.de>; Tue, 14 Apr 2020 14:25:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 02FCB85478;
	Tue, 14 Apr 2020 12:25:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xj4vhY_ns1NX; Tue, 14 Apr 2020 12:25:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4B789853FD;
	Tue, 14 Apr 2020 12:25:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 38AB9C1D87;
	Tue, 14 Apr 2020 12:25:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D56B3C0172
 for <iommu@lists.linux-foundation.org>; Tue, 14 Apr 2020 12:25:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id CEA2E20506
 for <iommu@lists.linux-foundation.org>; Tue, 14 Apr 2020 12:25:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0Ro57zobMpws for <iommu@lists.linux-foundation.org>;
 Tue, 14 Apr 2020 12:25:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by silver.osuosl.org (Postfix) with ESMTPS id 3684E20508
 for <iommu@lists.linux-foundation.org>; Tue, 14 Apr 2020 12:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=YrgVxrzmHYPrXyoeTJHbxP1u+oy6sSqDdJuYBqnOLUw=; b=QA77CHY8Y/S2RM9FdJoFYKpjrJ
 UBEm2lRELREp9roh2//R1n0n92cPnSRXOWAhZKBDqZ7UmuIVDp1gbtGTAV8VTCgJ3QygumqY0Qkmc
 0cbJb0v8RNKnxt4If2oYuOQJz0JxrLbv/SuggU059965ADLQ35dQveg2wQH+KwIF5gJZLgqGjjBzX
 VELj5QvI2Irtrq80kw5/W11ZadTF8BZ4VValaBHAMuUlg9x3xK3g74SpcroDJVqH27QGizwhh4znL
 +BGB+9OemYiMfrTOXkbejpRCBA5iQCeaD+tO6KSSHDfH4jBt/PEbMOsfpHil+0szR8C8BGGJ7LZYw
 7egkftWw==;
Received: from [2001:4bb8:180:384b:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOKd0-0005A1-FT; Tue, 14 Apr 2020 12:25:22 +0000
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org,
	Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: [PATCH 4/4] powerpc: use the generic dma_ops_bypass mode
Date: Tue, 14 Apr 2020 14:25:06 +0200
Message-Id: <20200414122506.438134-5-hch@lst.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200414122506.438134-1-hch@lst.de>
References: <20200414122506.438134-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
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

Use the DMA API bypass mechanism for direct window mappings.  This uses
common code and speed up the direct mapping case by avoiding indirect
calls just when not using dma ops at all.  It also fixes a problem where
the sync_* methods were using the bypass check for DMA allocations, but
those are part of the streaming ops.

Note that this patch loses the DMA_ATTR_WEAK_ORDERING override, which
has never been well defined, as is only used by a few drivers, which
IIRC never showed up in the typical Cell blade setups that are affected
by the ordering workaround.

Fixes: efd176a04bef ("powerpc/pseries/dma: Allow SWIOTLB")
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/powerpc/include/asm/device.h |  5 --
 arch/powerpc/kernel/dma-iommu.c   | 90 ++++---------------------------
 2 files changed, 9 insertions(+), 86 deletions(-)

diff --git a/arch/powerpc/include/asm/device.h b/arch/powerpc/include/asm/device.h
index 266542769e4b..452402215e12 100644
--- a/arch/powerpc/include/asm/device.h
+++ b/arch/powerpc/include/asm/device.h
@@ -18,11 +18,6 @@ struct iommu_table;
  * drivers/macintosh/macio_asic.c
  */
 struct dev_archdata {
-	/*
-	 * Set to %true if the dma_iommu_ops are requested to use a direct
-	 * window instead of dynamically mapping memory.
-	 */
-	bool			iommu_bypass : 1;
 	/*
 	 * These two used to be a union. However, with the hybrid ops we need
 	 * both so here we store both a DMA offset for direct mappings and
diff --git a/arch/powerpc/kernel/dma-iommu.c b/arch/powerpc/kernel/dma-iommu.c
index e486d1d78de2..569fecd7b5b2 100644
--- a/arch/powerpc/kernel/dma-iommu.c
+++ b/arch/powerpc/kernel/dma-iommu.c
@@ -14,23 +14,6 @@
  * Generic iommu implementation
  */
 
-/*
- * The coherent mask may be smaller than the real mask, check if we can
- * really use a direct window.
- */
-static inline bool dma_iommu_alloc_bypass(struct device *dev)
-{
-	return dev->archdata.iommu_bypass && !iommu_fixed_is_weak &&
-		dma_direct_supported(dev, dev->coherent_dma_mask);
-}
-
-static inline bool dma_iommu_map_bypass(struct device *dev,
-		unsigned long attrs)
-{
-	return dev->archdata.iommu_bypass &&
-		(!iommu_fixed_is_weak || (attrs & DMA_ATTR_WEAK_ORDERING));
-}
-
 /* Allocates a contiguous real buffer and creates mappings over it.
  * Returns the virtual address of the buffer and sets dma_handle
  * to the dma address (mapping) of the first page.
@@ -39,8 +22,6 @@ static void *dma_iommu_alloc_coherent(struct device *dev, size_t size,
 				      dma_addr_t *dma_handle, gfp_t flag,
 				      unsigned long attrs)
 {
-	if (dma_iommu_alloc_bypass(dev))
-		return dma_direct_alloc(dev, size, dma_handle, flag, attrs);
 	return iommu_alloc_coherent(dev, get_iommu_table_base(dev), size,
 				    dma_handle, dev->coherent_dma_mask, flag,
 				    dev_to_node(dev));
@@ -50,11 +31,7 @@ static void dma_iommu_free_coherent(struct device *dev, size_t size,
 				    void *vaddr, dma_addr_t dma_handle,
 				    unsigned long attrs)
 {
-	if (dma_iommu_alloc_bypass(dev))
-		dma_direct_free(dev, size, vaddr, dma_handle, attrs);
-	else
-		iommu_free_coherent(get_iommu_table_base(dev), size, vaddr,
-				dma_handle);
+	iommu_free_coherent(get_iommu_table_base(dev), size, vaddr, dma_handle);
 }
 
 /* Creates TCEs for a user provided buffer.  The user buffer must be
@@ -67,9 +44,6 @@ static dma_addr_t dma_iommu_map_page(struct device *dev, struct page *page,
 				     enum dma_data_direction direction,
 				     unsigned long attrs)
 {
-	if (dma_iommu_map_bypass(dev, attrs))
-		return dma_direct_map_page(dev, page, offset, size, direction,
-				attrs);
 	return iommu_map_page(dev, get_iommu_table_base(dev), page, offset,
 			      size, dma_get_mask(dev), direction, attrs);
 }
@@ -79,11 +53,8 @@ static void dma_iommu_unmap_page(struct device *dev, dma_addr_t dma_handle,
 				 size_t size, enum dma_data_direction direction,
 				 unsigned long attrs)
 {
-	if (!dma_iommu_map_bypass(dev, attrs))
-		iommu_unmap_page(get_iommu_table_base(dev), dma_handle, size,
-				direction,  attrs);
-	else
-		dma_direct_unmap_page(dev, dma_handle, size, direction, attrs);
+	iommu_unmap_page(get_iommu_table_base(dev), dma_handle, size, direction,
+			 attrs);
 }
 
 
@@ -91,8 +62,6 @@ static int dma_iommu_map_sg(struct device *dev, struct scatterlist *sglist,
 			    int nelems, enum dma_data_direction direction,
 			    unsigned long attrs)
 {
-	if (dma_iommu_map_bypass(dev, attrs))
-		return dma_direct_map_sg(dev, sglist, nelems, direction, attrs);
 	return ppc_iommu_map_sg(dev, get_iommu_table_base(dev), sglist, nelems,
 				dma_get_mask(dev), direction, attrs);
 }
@@ -101,11 +70,8 @@ static void dma_iommu_unmap_sg(struct device *dev, struct scatterlist *sglist,
 		int nelems, enum dma_data_direction direction,
 		unsigned long attrs)
 {
-	if (!dma_iommu_map_bypass(dev, attrs))
-		ppc_iommu_unmap_sg(get_iommu_table_base(dev), sglist, nelems,
+	ppc_iommu_unmap_sg(get_iommu_table_base(dev), sglist, nelems,
 			   direction, attrs);
-	else
-		dma_direct_unmap_sg(dev, sglist, nelems, direction, attrs);
 }
 
 static bool dma_iommu_bypass_supported(struct device *dev, u64 mask)
@@ -113,8 +79,9 @@ static bool dma_iommu_bypass_supported(struct device *dev, u64 mask)
 	struct pci_dev *pdev = to_pci_dev(dev);
 	struct pci_controller *phb = pci_bus_to_host(pdev->bus);
 
-	return phb->controller_ops.iommu_bypass_supported &&
-		phb->controller_ops.iommu_bypass_supported(pdev, mask);
+	if (iommu_fixed_is_weak || !phb->controller_ops.iommu_bypass_supported)
+		return false;
+	return phb->controller_ops.iommu_bypass_supported(pdev, mask);
 }
 
 /* We support DMA to/from any memory page via the iommu */
@@ -123,7 +90,7 @@ int dma_iommu_dma_supported(struct device *dev, u64 mask)
 	struct iommu_table *tbl = get_iommu_table_base(dev);
 
 	if (dev_is_pci(dev) && dma_iommu_bypass_supported(dev, mask)) {
-		dev->archdata.iommu_bypass = true;
+		dev->dma_ops_bypass = true;
 		dev_dbg(dev, "iommu: 64-bit OK, using fixed ops\n");
 		return 1;
 	}
@@ -141,7 +108,7 @@ int dma_iommu_dma_supported(struct device *dev, u64 mask)
 	}
 
 	dev_dbg(dev, "iommu: not 64-bit, using default ops\n");
-	dev->archdata.iommu_bypass = false;
+	dev->dma_ops_bypass = false;
 	return 1;
 }
 
@@ -153,47 +120,12 @@ u64 dma_iommu_get_required_mask(struct device *dev)
 	if (!tbl)
 		return 0;
 
-	if (dev_is_pci(dev)) {
-		u64 bypass_mask = dma_direct_get_required_mask(dev);
-
-		if (dma_iommu_bypass_supported(dev, bypass_mask))
-			return bypass_mask;
-	}
-
 	mask = 1ULL < (fls_long(tbl->it_offset + tbl->it_size) - 1);
 	mask += mask - 1;
 
 	return mask;
 }
 
-static void dma_iommu_sync_for_cpu(struct device *dev, dma_addr_t addr,
-		size_t size, enum dma_data_direction dir)
-{
-	if (dma_iommu_alloc_bypass(dev))
-		dma_direct_sync_single_for_cpu(dev, addr, size, dir);
-}
-
-static void dma_iommu_sync_for_device(struct device *dev, dma_addr_t addr,
-		size_t sz, enum dma_data_direction dir)
-{
-	if (dma_iommu_alloc_bypass(dev))
-		dma_direct_sync_single_for_device(dev, addr, sz, dir);
-}
-
-extern void dma_iommu_sync_sg_for_cpu(struct device *dev,
-		struct scatterlist *sgl, int nents, enum dma_data_direction dir)
-{
-	if (dma_iommu_alloc_bypass(dev))
-		dma_direct_sync_sg_for_cpu(dev, sgl, nents, dir);
-}
-
-extern void dma_iommu_sync_sg_for_device(struct device *dev,
-		struct scatterlist *sgl, int nents, enum dma_data_direction dir)
-{
-	if (dma_iommu_alloc_bypass(dev))
-		dma_direct_sync_sg_for_device(dev, sgl, nents, dir);
-}
-
 const struct dma_map_ops dma_iommu_ops = {
 	.alloc			= dma_iommu_alloc_coherent,
 	.free			= dma_iommu_free_coherent,
@@ -203,10 +135,6 @@ const struct dma_map_ops dma_iommu_ops = {
 	.map_page		= dma_iommu_map_page,
 	.unmap_page		= dma_iommu_unmap_page,
 	.get_required_mask	= dma_iommu_get_required_mask,
-	.sync_single_for_cpu	= dma_iommu_sync_for_cpu,
-	.sync_single_for_device	= dma_iommu_sync_for_device,
-	.sync_sg_for_cpu	= dma_iommu_sync_sg_for_cpu,
-	.sync_sg_for_device	= dma_iommu_sync_sg_for_device,
 	.mmap			= dma_common_mmap,
 	.get_sgtable		= dma_common_get_sgtable,
 };
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
