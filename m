Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 958E11A7AAC
	for <lists.iommu@lfdr.de>; Tue, 14 Apr 2020 14:25:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id AC109204D8;
	Tue, 14 Apr 2020 12:25:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qbWQ5XWjnKCG; Tue, 14 Apr 2020 12:25:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 1D8A120507;
	Tue, 14 Apr 2020 12:25:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 17828C0172;
	Tue, 14 Apr 2020 12:25:23 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AFE38C0172
 for <iommu@lists.linux-foundation.org>; Tue, 14 Apr 2020 12:25:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 9E83885497
 for <iommu@lists.linux-foundation.org>; Tue, 14 Apr 2020 12:25:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id URIVDDUF+ejH for <iommu@lists.linux-foundation.org>;
 Tue, 14 Apr 2020 12:25:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 5E23D86645
 for <iommu@lists.linux-foundation.org>; Tue, 14 Apr 2020 12:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=DUYH27rmDVmKHdYGSam6X8lX9BGf6e6hWKaW8hC7MQk=; b=Dxc3oktLArcSj620dNQv7PyLbd
 6CVS9Vsa0ei/tkenYIv3Kb0jln6PEdjuo3rVQdD13NWqHIY8sHyEF9o/UDkpisD0HIuOjbGK14qHp
 wE7tRZoBoVcdaWRscBdr58B1xNhFKfrt4FQv1b5Tu+0VSclVegKoUC5+sfuxGoSArV1ONhVU6+bga
 L+h173fHgW5timB02Xxio/yovG2tMC8KgKOIAmoUZQQS6kRX3DssvimPDJXss9PCvK+3VUyKbAUjS
 kpmKpF5BtQ2yGCr6l5S0ldXTY/N4Gxbuvuz/W1F3qtvvedx42tjFJ0aoEI95obRPUVU0rDXhwxXp4
 5BTzKeNQ==;
Received: from [2001:4bb8:180:384b:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOKcx-00059H-GQ; Tue, 14 Apr 2020 12:25:19 +0000
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org,
	Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: [PATCH 3/4] dma-mapping: add a dma_ops_bypass flag to struct device
Date: Tue, 14 Apr 2020 14:25:05 +0200
Message-Id: <20200414122506.438134-4-hch@lst.de>
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

Several IOMMU drivers have a bypass mode where they can use a direct
mapping if the devices DMA mask is large enough.  Add generic support
to the core dma-mapping code to do that to switch those drivers to
a common solution.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/linux/device.h |  6 ++++
 kernel/dma/mapping.c   | 70 +++++++++++++++++++++++++++++-------------
 2 files changed, 55 insertions(+), 21 deletions(-)

diff --git a/include/linux/device.h b/include/linux/device.h
index ac8e37cd716a..143c2e0edb19 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -523,6 +523,11 @@ struct dev_links_info {
  *		  sync_state() callback.
  * @dma_coherent: this particular device is dma coherent, even if the
  *		architecture supports non-coherent devices.
+ * @dma_ops_bypass: If set to %true then the dma_ops are bypassed for the
+ *		streaming DMA operations (->map_* / ->unmap_* / ->sync_*),
+ *		and optionall (if the coherent mask is large enough) also
+ *		for dma allocations.  This flag is managed by the dma ops
+ *		instance from ->dma_supported.
  *
  * At the lowest level, every device in a Linux system is represented by an
  * instance of struct device. The device structure contains the information
@@ -622,6 +627,7 @@ struct device {
     defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU_ALL)
 	bool			dma_coherent:1;
 #endif
+	bool			dma_ops_bypass : 1;
 };
 
 static inline struct device *kobj_to_dev(struct kobject *kobj)
diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index 8e4155f9ee69..d776fb9f5adb 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -105,9 +105,33 @@ void *dmam_alloc_attrs(struct device *dev, size_t size, dma_addr_t *dma_handle,
 }
 EXPORT_SYMBOL(dmam_alloc_attrs);
 
-static inline bool dma_is_direct(const struct dma_map_ops *ops)
+/*
+ * Check if the devices uses a direct mapping for streaming DMA operations.
+ * This allows IOMMU drivers to set a bypass mode if the DMA mask is large
+ * enough.
+ */
+static inline bool dma_alloc_direct(struct device *dev,
+		const struct dma_map_ops *ops)
 {
-	return likely(!ops);
+	if (likely(!ops))
+		return true;
+	if (!dev->dma_ops_bypass)
+		return false;
+
+	return min_not_zero(dev->coherent_dma_mask, dev->bus_dma_limit) >=
+			    dma_direct_get_required_mask(dev);
+}
+
+static inline bool dma_map_direct(struct device *dev,
+		const struct dma_map_ops *ops)
+{
+	if (likely(!ops))
+		return true;
+	if (!dev->dma_ops_bypass)
+		return false;
+
+	return min_not_zero(*dev->dma_mask, dev->bus_dma_limit) >=
+			    dma_direct_get_required_mask(dev);
 }
 
 dma_addr_t dma_map_page_attrs(struct device *dev, struct page *page,
@@ -118,7 +142,7 @@ dma_addr_t dma_map_page_attrs(struct device *dev, struct page *page,
 	dma_addr_t addr;
 
 	BUG_ON(!valid_dma_direction(dir));
-	if (dma_is_direct(ops))
+	if (dma_map_direct(dev, ops))
 		addr = dma_direct_map_page(dev, page, offset, size, dir, attrs);
 	else
 		addr = ops->map_page(dev, page, offset, size, dir, attrs);
@@ -134,7 +158,7 @@ void dma_unmap_page_attrs(struct device *dev, dma_addr_t addr, size_t size,
 	const struct dma_map_ops *ops = get_dma_ops(dev);
 
 	BUG_ON(!valid_dma_direction(dir));
-	if (dma_is_direct(ops))
+	if (dma_map_direct(dev, ops))
 		dma_direct_unmap_page(dev, addr, size, dir, attrs);
 	else if (ops->unmap_page)
 		ops->unmap_page(dev, addr, size, dir, attrs);
@@ -153,7 +177,7 @@ int dma_map_sg_attrs(struct device *dev, struct scatterlist *sg, int nents,
 	int ents;
 
 	BUG_ON(!valid_dma_direction(dir));
-	if (dma_is_direct(ops))
+	if (dma_map_direct(dev, ops))
 		ents = dma_direct_map_sg(dev, sg, nents, dir, attrs);
 	else
 		ents = ops->map_sg(dev, sg, nents, dir, attrs);
@@ -172,7 +196,7 @@ void dma_unmap_sg_attrs(struct device *dev, struct scatterlist *sg,
 
 	BUG_ON(!valid_dma_direction(dir));
 	debug_dma_unmap_sg(dev, sg, nents, dir);
-	if (dma_is_direct(ops))
+	if (dma_map_direct(dev, ops))
 		dma_direct_unmap_sg(dev, sg, nents, dir, attrs);
 	else if (ops->unmap_sg)
 		ops->unmap_sg(dev, sg, nents, dir, attrs);
@@ -191,7 +215,7 @@ dma_addr_t dma_map_resource(struct device *dev, phys_addr_t phys_addr,
 	if (WARN_ON_ONCE(pfn_valid(PHYS_PFN(phys_addr))))
 		return DMA_MAPPING_ERROR;
 
-	if (dma_is_direct(ops))
+	if (dma_map_direct(dev, ops))
 		addr = dma_direct_map_resource(dev, phys_addr, size, dir, attrs);
 	else if (ops->map_resource)
 		addr = ops->map_resource(dev, phys_addr, size, dir, attrs);
@@ -207,7 +231,7 @@ void dma_unmap_resource(struct device *dev, dma_addr_t addr, size_t size,
 	const struct dma_map_ops *ops = get_dma_ops(dev);
 
 	BUG_ON(!valid_dma_direction(dir));
-	if (!dma_is_direct(ops) && ops->unmap_resource)
+	if (!dma_map_direct(dev, ops) && ops->unmap_resource)
 		ops->unmap_resource(dev, addr, size, dir, attrs);
 	debug_dma_unmap_resource(dev, addr, size, dir);
 }
@@ -219,7 +243,7 @@ void dma_sync_single_for_cpu(struct device *dev, dma_addr_t addr, size_t size,
 	const struct dma_map_ops *ops = get_dma_ops(dev);
 
 	BUG_ON(!valid_dma_direction(dir));
-	if (dma_is_direct(ops))
+	if (dma_map_direct(dev, ops))
 		dma_direct_sync_single_for_cpu(dev, addr, size, dir);
 	else if (ops->sync_single_for_cpu)
 		ops->sync_single_for_cpu(dev, addr, size, dir);
@@ -233,7 +257,7 @@ void dma_sync_single_for_device(struct device *dev, dma_addr_t addr,
 	const struct dma_map_ops *ops = get_dma_ops(dev);
 
 	BUG_ON(!valid_dma_direction(dir));
-	if (dma_is_direct(ops))
+	if (dma_map_direct(dev, ops))
 		dma_direct_sync_single_for_device(dev, addr, size, dir);
 	else if (ops->sync_single_for_device)
 		ops->sync_single_for_device(dev, addr, size, dir);
@@ -247,7 +271,7 @@ void dma_sync_sg_for_cpu(struct device *dev, struct scatterlist *sg,
 	const struct dma_map_ops *ops = get_dma_ops(dev);
 
 	BUG_ON(!valid_dma_direction(dir));
-	if (dma_is_direct(ops))
+	if (dma_map_direct(dev, ops))
 		dma_direct_sync_sg_for_cpu(dev, sg, nelems, dir);
 	else if (ops->sync_sg_for_cpu)
 		ops->sync_sg_for_cpu(dev, sg, nelems, dir);
@@ -261,7 +285,7 @@ void dma_sync_sg_for_device(struct device *dev, struct scatterlist *sg,
 	const struct dma_map_ops *ops = get_dma_ops(dev);
 
 	BUG_ON(!valid_dma_direction(dir));
-	if (dma_is_direct(ops))
+	if (dma_map_direct(dev, ops))
 		dma_direct_sync_sg_for_device(dev, sg, nelems, dir);
 	else if (ops->sync_sg_for_device)
 		ops->sync_sg_for_device(dev, sg, nelems, dir);
@@ -302,7 +326,7 @@ int dma_get_sgtable_attrs(struct device *dev, struct sg_table *sgt,
 {
 	const struct dma_map_ops *ops = get_dma_ops(dev);
 
-	if (dma_is_direct(ops))
+	if (dma_alloc_direct(dev, ops))
 		return dma_direct_get_sgtable(dev, sgt, cpu_addr, dma_addr,
 				size, attrs);
 	if (!ops->get_sgtable)
@@ -372,7 +396,7 @@ bool dma_can_mmap(struct device *dev)
 {
 	const struct dma_map_ops *ops = get_dma_ops(dev);
 
-	if (dma_is_direct(ops))
+	if (dma_alloc_direct(dev, ops))
 		return dma_direct_can_mmap(dev);
 	return ops->mmap != NULL;
 }
@@ -397,7 +421,7 @@ int dma_mmap_attrs(struct device *dev, struct vm_area_struct *vma,
 {
 	const struct dma_map_ops *ops = get_dma_ops(dev);
 
-	if (dma_is_direct(ops))
+	if (dma_alloc_direct(dev, ops))
 		return dma_direct_mmap(dev, vma, cpu_addr, dma_addr, size,
 				attrs);
 	if (!ops->mmap)
@@ -410,7 +434,7 @@ u64 dma_get_required_mask(struct device *dev)
 {
 	const struct dma_map_ops *ops = get_dma_ops(dev);
 
-	if (dma_is_direct(ops))
+	if (dma_alloc_direct(dev, ops))
 		return dma_direct_get_required_mask(dev);
 	if (ops->get_required_mask)
 		return ops->get_required_mask(dev);
@@ -441,7 +465,7 @@ void *dma_alloc_attrs(struct device *dev, size_t size, dma_addr_t *dma_handle,
 	/* let the implementation decide on the zone to allocate from: */
 	flag &= ~(__GFP_DMA | __GFP_DMA32 | __GFP_HIGHMEM);
 
-	if (dma_is_direct(ops))
+	if (dma_alloc_direct(dev, ops))
 		cpu_addr = dma_direct_alloc(dev, size, dma_handle, flag, attrs);
 	else if (ops->alloc)
 		cpu_addr = ops->alloc(dev, size, dma_handle, flag, attrs);
@@ -473,7 +497,7 @@ void dma_free_attrs(struct device *dev, size_t size, void *cpu_addr,
 		return;
 
 	debug_dma_free_coherent(dev, size, cpu_addr, dma_handle);
-	if (dma_is_direct(ops))
+	if (dma_alloc_direct(dev, ops))
 		dma_direct_free(dev, size, cpu_addr, dma_handle, attrs);
 	else if (ops->free)
 		ops->free(dev, size, cpu_addr, dma_handle, attrs);
@@ -484,7 +508,11 @@ int dma_supported(struct device *dev, u64 mask)
 {
 	const struct dma_map_ops *ops = get_dma_ops(dev);
 
-	if (dma_is_direct(ops))
+	/*
+	 * ->dma_supported sets the bypass flag, so we must always call
+	 * into the method here unless the device is truly direct mapped.
+	 */
+	if (!ops)
 		return dma_direct_supported(dev, mask);
 	if (!ops->dma_supported)
 		return 1;
@@ -540,7 +568,7 @@ void dma_cache_sync(struct device *dev, void *vaddr, size_t size,
 
 	BUG_ON(!valid_dma_direction(dir));
 
-	if (dma_is_direct(ops))
+	if (dma_alloc_direct(dev, ops))
 		arch_dma_cache_sync(dev, vaddr, size, dir);
 	else if (ops->cache_sync)
 		ops->cache_sync(dev, vaddr, size, dir);
@@ -552,7 +580,7 @@ size_t dma_max_mapping_size(struct device *dev)
 	const struct dma_map_ops *ops = get_dma_ops(dev);
 	size_t size = SIZE_MAX;
 
-	if (dma_is_direct(ops))
+	if (dma_map_direct(dev, ops))
 		size = dma_direct_max_mapping_size(dev);
 	else if (ops && ops->max_mapping_size)
 		size = ops->max_mapping_size(dev);
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
