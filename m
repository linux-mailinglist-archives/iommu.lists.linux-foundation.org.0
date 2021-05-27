Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA55392F9B
	for <lists.iommu@lfdr.de>; Thu, 27 May 2021 15:27:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DAE660AE7;
	Thu, 27 May 2021 13:27:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GIfWeAaPszAE; Thu, 27 May 2021 13:27:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A4B460ADD;
	Thu, 27 May 2021 13:27:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F1199C0001;
	Thu, 27 May 2021 13:27:29 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1758DC0001
 for <iommu@lists.linux-foundation.org>; Thu, 27 May 2021 13:27:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB992402A1
 for <iommu@lists.linux-foundation.org>; Thu, 27 May 2021 13:27:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4BFk1WmrZcMc for <iommu@lists.linux-foundation.org>;
 Thu, 27 May 2021 13:27:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 03D74402A0
 for <iommu@lists.linux-foundation.org>; Thu, 27 May 2021 13:27:26 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id BAAFB68AFE; Thu, 27 May 2021 15:27:23 +0200 (CEST)
Date: Thu, 27 May 2021 15:27:23 +0200
From: Christoph Hellwig <hch@lst.de>
To: Claire Chang <tientzu@chromium.org>
Subject: Re: [PATCH v7 04/15] swiotlb: Add restricted DMA pool initialization
Message-ID: <20210527132723.GD26160@lst.de>
References: <20210518064215.2856977-1-tientzu@chromium.org>
 <20210518064215.2856977-5-tientzu@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210518064215.2856977-5-tientzu@chromium.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: heikki.krogerus@linux.intel.com, thomas.hellstrom@linux.intel.com,
 peterz@infradead.org, benh@kernel.crashing.org,
 joonas.lahtinen@linux.intel.com, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, grant.likely@arm.com, paulus@samba.org,
 Frank Rowand <frowand.list@gmail.com>, mingo@kernel.org,
 sstabellini@kernel.org, Saravana Kannan <saravanak@google.com>,
 mpe@ellerman.id.au, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Christoph Hellwig <hch@lst.de>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Thierry Reding <treding@nvidia.com>, intel-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, linux-devicetree <devicetree@vger.kernel.org>,
 jxgao@google.com, daniel@ffwll.ch, Will Deacon <will@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 maarten.lankhorst@linux.intel.com, airlied@linux.ie,
 Dan Williams <dan.j.williams@intel.com>, linuxppc-dev@lists.ozlabs.org,
 jani.nikula@linux.intel.com, Rob Herring <robh+dt@kernel.org>,
 rodrigo.vivi@intel.com, bhelgaas@google.com, boris.ostrovsky@oracle.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, jgross@suse.com,
 Nicolas Boichat <drinkcat@chromium.org>, Greg KH <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, lkml <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, xypron.glpk@gmx.de,
 Robin Murphy <robin.murphy@arm.com>, bauerman@linux.ibm.com
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

I'd still much prefer to always have the pointer in struct device.
Especially as we're also looking into things like a global 64-bit bounce
buffer.  Something like this untested patch ontop of your series:


diff --git a/drivers/base/core.c b/drivers/base/core.c
index 628e33939aca..3cb95fa29f70 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -29,6 +29,7 @@
 #include <linux/sched/mm.h>
 #include <linux/sysfs.h>
 #include <linux/dma-map-ops.h> /* for dma_default_coherent */
+#include <linux/swiotlb.h>
 
 #include "base.h"
 #include "power/power.h"
@@ -2814,6 +2815,9 @@ void device_initialize(struct device *dev)
     defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU_ALL)
 	dev->dma_coherent = dma_default_coherent;
 #endif
+#ifdef CONFIG_SWIOTLB
+	dev->dma_io_tlb_mem = &io_tlb_default_mem;
+#endif
 }
 EXPORT_SYMBOL_GPL(device_initialize);
 
diff --git a/include/linux/device.h b/include/linux/device.h
index 4987608ea4ff..6aca6fa0facc 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -416,7 +416,7 @@ struct dev_links_info {
  * @dma_pools:	Dma pools (if dma'ble device).
  * @dma_mem:	Internal for coherent mem override.
  * @cma_area:	Contiguous memory area for dma allocations
- * @dma_io_tlb_mem: Internal for swiotlb io_tlb_mem override.
+ * @dma_io_tlb_mem: Pointer to the swiotlb pool used.  Not for driver use.
  * @archdata:	For arch-specific additions.
  * @of_node:	Associated device tree node.
  * @fwnode:	Associated device node supplied by platform firmware.
@@ -523,7 +523,7 @@ struct device {
 	struct cma *cma_area;		/* contiguous memory area for dma
 					   allocations */
 #endif
-#ifdef CONFIG_DMA_RESTRICTED_POOL
+#ifdef CONFIG_SWIOTLB
 	struct io_tlb_mem *dma_io_tlb_mem;
 #endif
 	/* arch specific additions */
diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index e8cf49bd90c5..c153cd0c469c 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -95,6 +95,7 @@ struct io_tlb_mem {
 	spinlock_t lock;
 	struct dentry *debugfs;
 	bool late_alloc;
+	bool force_swiotlb;
 	struct io_tlb_slot {
 		phys_addr_t orig_addr;
 		size_t alloc_size;
@@ -103,30 +104,16 @@ struct io_tlb_mem {
 };
 extern struct io_tlb_mem *io_tlb_default_mem;
 
-static inline struct io_tlb_mem *get_io_tlb_mem(struct device *dev)
-{
-#ifdef CONFIG_DMA_RESTRICTED_POOL
-	if (dev && dev->dma_io_tlb_mem)
-		return dev->dma_io_tlb_mem;
-#endif /* CONFIG_DMA_RESTRICTED_POOL */
-
-	return io_tlb_default_mem;
-}
-
 static inline bool is_swiotlb_buffer(struct device *dev, phys_addr_t paddr)
 {
-	struct io_tlb_mem *mem = get_io_tlb_mem(dev);
+	struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
 
 	return mem && paddr >= mem->start && paddr < mem->end;
 }
 
 static inline bool is_dev_swiotlb_force(struct device *dev)
 {
-#ifdef CONFIG_DMA_RESTRICTED_POOL
-	if (dev->dma_io_tlb_mem)
-		return true;
-#endif /* CONFIG_DMA_RESTRICTED_POOL */
-	return false;
+	return dev->dma_io_tlb_mem->force_swiotlb;
 }
 
 void __init swiotlb_exit(void);
@@ -134,10 +121,8 @@ unsigned int swiotlb_max_segment(void);
 size_t swiotlb_max_mapping_size(struct device *dev);
 bool is_swiotlb_active(struct device *dev);
 void __init swiotlb_adjust_size(unsigned long size);
-#ifdef CONFIG_DMA_RESTRICTED_POOL
 struct page *swiotlb_alloc(struct device *dev, size_t size);
 bool swiotlb_free(struct device *dev, struct page *page, size_t size);
-#endif /* CONFIG_DMA_RESTRICTED_POOL */
 #else
 #define swiotlb_force SWIOTLB_NO_FORCE
 static inline bool is_swiotlb_buffer(struct device *dev, phys_addr_t paddr)
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index d3fa4669229b..69d62e18f493 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -347,7 +347,7 @@ void __init swiotlb_exit(void)
 static void swiotlb_bounce(struct device *dev, phys_addr_t tlb_addr, size_t size,
 			   enum dma_data_direction dir)
 {
-	struct io_tlb_mem *mem = get_io_tlb_mem(dev);
+	struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
 	int index = (tlb_addr - mem->start) >> IO_TLB_SHIFT;
 	phys_addr_t orig_addr = mem->slots[index].orig_addr;
 	size_t alloc_size = mem->slots[index].alloc_size;
@@ -429,7 +429,7 @@ static unsigned int wrap_index(struct io_tlb_mem *mem, unsigned int index)
 static int find_slots(struct device *dev, phys_addr_t orig_addr,
 		size_t alloc_size)
 {
-	struct io_tlb_mem *mem = get_io_tlb_mem(dev);
+	struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
 	unsigned long boundary_mask = dma_get_seg_boundary(dev);
 	dma_addr_t tbl_dma_addr =
 		phys_to_dma_unencrypted(dev, mem->start) & boundary_mask;
@@ -510,7 +510,7 @@ phys_addr_t swiotlb_tbl_map_single(struct device *dev, phys_addr_t orig_addr,
 		size_t mapping_size, size_t alloc_size,
 		enum dma_data_direction dir, unsigned long attrs)
 {
-	struct io_tlb_mem *mem = get_io_tlb_mem(dev);
+	struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
 	unsigned int offset = swiotlb_align_offset(dev, orig_addr);
 	unsigned int i;
 	int index;
@@ -553,7 +553,7 @@ phys_addr_t swiotlb_tbl_map_single(struct device *dev, phys_addr_t orig_addr,
 
 static void release_slots(struct device *dev, phys_addr_t tlb_addr)
 {
-	struct io_tlb_mem *mem = get_io_tlb_mem(dev);
+	struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
 	unsigned long flags;
 	unsigned int offset = swiotlb_align_offset(dev, tlb_addr);
 	int index = (tlb_addr - offset - mem->start) >> IO_TLB_SHIFT;
@@ -670,7 +670,7 @@ size_t swiotlb_max_mapping_size(struct device *dev)
 
 bool is_swiotlb_active(struct device *dev)
 {
-	return get_io_tlb_mem(dev) != NULL;
+	return dev->dma_io_tlb_mem;
 }
 EXPORT_SYMBOL_GPL(is_swiotlb_active);
 
@@ -741,7 +741,7 @@ static int rmem_swiotlb_device_init(struct reserved_mem *rmem,
 	struct io_tlb_mem *mem = rmem->priv;
 	unsigned long nslabs = rmem->size >> IO_TLB_SHIFT;
 
-	if (dev->dma_io_tlb_mem)
+	if (dev->dma_io_tlb_mem != io_tlb_default_mem)
 		return 0;
 
 	/*
@@ -760,6 +760,7 @@ static int rmem_swiotlb_device_init(struct reserved_mem *rmem,
 		}
 
 		swiotlb_init_io_tlb_mem(mem, rmem->base, nslabs, false);
+		mem->force_swiotlb = true;
 
 		rmem->priv = mem;
 
@@ -768,15 +769,13 @@ static int rmem_swiotlb_device_init(struct reserved_mem *rmem,
 	}
 
 	dev->dma_io_tlb_mem = mem;
-
 	return 0;
 }
 
 static void rmem_swiotlb_device_release(struct reserved_mem *rmem,
 					struct device *dev)
 {
-	if (dev)
-		dev->dma_io_tlb_mem = NULL;
+	dev->dma_io_tlb_mem = io_tlb_default_mem;
 }
 
 static const struct reserved_mem_ops rmem_swiotlb_ops = {
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
