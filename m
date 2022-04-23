Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D9C50CC89
	for <lists.iommu@lfdr.de>; Sat, 23 Apr 2022 19:14:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C15EC400E3;
	Sat, 23 Apr 2022 17:14:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1RISQxguIzCD; Sat, 23 Apr 2022 17:14:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 7AA0D40195;
	Sat, 23 Apr 2022 17:14:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 59305C002D;
	Sat, 23 Apr 2022 17:14:39 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AE6D7C002D
 for <iommu@lists.linux-foundation.org>; Sat, 23 Apr 2022 17:14:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A4B3F81467
 for <iommu@lists.linux-foundation.org>; Sat, 23 Apr 2022 17:14:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TV7YREsj77cm for <iommu@lists.linux-foundation.org>;
 Sat, 23 Apr 2022 17:14:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BA7898145D
 for <iommu@lists.linux-foundation.org>; Sat, 23 Apr 2022 17:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=Nni+9zbbB8BgtGggAXNYH6yiRNel4M1xirsDWdfnzGw=; b=PgkMT/2nOy9iL9JNqXJpbcS7PZ
 AsyDGYun0Nd3X13GtAjqiaBbkqK+P7hBdCsR9gigqLv6SIDfFasuLeu4Asu6O1ceUqjsp549FszHs
 A9vyHug4wp5UsbwoltMDcOh26SGSjvlBnDFzBmBl8lfo+9LVIQqDQjOq6HpwGuxg7DjPwC0Eu/bSB
 lGfMJ2+KEzDryDUrCRfzJnhyjwsKIbupCTpM/Jdoee7lXBTr+s+cADDX0sLgBqQOnw3zbYU3sTvEt
 q7HBN1E/Nxt5ZaL1VF/BQalPlh6oM/9jjwrhuelDMPZCCJ50e1Et/Y0aNpHw65s93rjN4vJydcLCY
 JxNsmbWg==;
Received: from [2001:4bb8:18d:be1d:2a19:700d:8998:ac2a] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1niJL0-004iuc-6j; Sat, 23 Apr 2022 17:14:26 +0000
From: Christoph Hellwig <hch@lst.de>
To: sstabellini@kernel.org,
	jgross@suse.com
Subject: [PATCH] swiotlb-xen: fix DMA_ATTR_NO_KERNEL_MAPPING on arm
Date: Sat, 23 Apr 2022 19:14:22 +0200
Message-Id: <20220423171422.1831676-1-hch@lst.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: xen-devel@lists.xenproject.org, iommu@lists.linux-foundation.org,
 Rahul Singh <Rahul.Singh@arm.com>, linux-arm-kernel@lists.infradead.org
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

swiotlb-xen uses very different ways to allocate coherent memory on x86
vs arm.  On the former it allocates memory from the page allocator, while
on the later it reuses the dma-direct allocator the handles the
complexities of non-coherent DMA on arm platforms.

Unfortunately the complexities of trying to deal with the two cases in
the swiotlb-xen.c code lead to a bug in the handling of
DMA_ATTR_NO_KERNEL_MAPPING on arm.  With the DMA_ATTR_NO_KERNEL_MAPPING
flag the coherent memory allocator does not actually allocate coherent
memory, but just a DMA handle for some memory that is DMA addressable
by the device, but which does not have to have a kernel mapping.  Thus
dereferencing the return value will lead to kernel crashed and memory
corruption.

Fix this by using the dma-direct allocator directly for arm, which works
perfectly fine because on arm swiotlb-xen is only used when the domain is
1:1 mapped, and then simplifying the remaining code to only cater for the
x86 case with DMA coherent device.

Reported-by: Rahul Singh <Rahul.Singh@arm.com>
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/arm/include/asm/xen/page-coherent.h   |   2 -
 arch/arm/xen/mm.c                          |  17 ----
 arch/arm64/include/asm/xen/page-coherent.h |   2 -
 arch/x86/include/asm/xen/page-coherent.h   |  24 -----
 arch/x86/include/asm/xen/swiotlb-xen.h     |   5 +
 drivers/xen/swiotlb-xen.c                  | 106 ++++++++-------------
 include/xen/arm/page-coherent.h            |  20 ----
 include/xen/xen-ops.h                      |   7 --
 8 files changed, 45 insertions(+), 138 deletions(-)
 delete mode 100644 arch/arm/include/asm/xen/page-coherent.h
 delete mode 100644 arch/arm64/include/asm/xen/page-coherent.h
 delete mode 100644 arch/x86/include/asm/xen/page-coherent.h
 delete mode 100644 include/xen/arm/page-coherent.h

diff --git a/arch/arm/include/asm/xen/page-coherent.h b/arch/arm/include/asm/xen/page-coherent.h
deleted file mode 100644
index 27e984977402b..0000000000000
--- a/arch/arm/include/asm/xen/page-coherent.h
+++ /dev/null
@@ -1,2 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#include <xen/arm/page-coherent.h>
diff --git a/arch/arm/xen/mm.c b/arch/arm/xen/mm.c
index a7e54a087b802..6e603e5fdebb1 100644
--- a/arch/arm/xen/mm.c
+++ b/arch/arm/xen/mm.c
@@ -118,23 +118,6 @@ bool xen_arch_need_swiotlb(struct device *dev,
 		!dev_is_dma_coherent(dev));
 }
 
-int xen_create_contiguous_region(phys_addr_t pstart, unsigned int order,
-				 unsigned int address_bits,
-				 dma_addr_t *dma_handle)
-{
-	if (!xen_initial_domain())
-		return -EINVAL;
-
-	/* we assume that dom0 is mapped 1:1 for now */
-	*dma_handle = pstart;
-	return 0;
-}
-
-void xen_destroy_contiguous_region(phys_addr_t pstart, unsigned int order)
-{
-	return;
-}
-
 static int __init xen_mm_init(void)
 {
 	struct gnttab_cache_flush cflush;
diff --git a/arch/arm64/include/asm/xen/page-coherent.h b/arch/arm64/include/asm/xen/page-coherent.h
deleted file mode 100644
index 27e984977402b..0000000000000
--- a/arch/arm64/include/asm/xen/page-coherent.h
+++ /dev/null
@@ -1,2 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#include <xen/arm/page-coherent.h>
diff --git a/arch/x86/include/asm/xen/page-coherent.h b/arch/x86/include/asm/xen/page-coherent.h
deleted file mode 100644
index 63cd41b2e17ac..0000000000000
--- a/arch/x86/include/asm/xen/page-coherent.h
+++ /dev/null
@@ -1,24 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _ASM_X86_XEN_PAGE_COHERENT_H
-#define _ASM_X86_XEN_PAGE_COHERENT_H
-
-#include <asm/page.h>
-#include <linux/dma-mapping.h>
-
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
-#endif /* _ASM_X86_XEN_PAGE_COHERENT_H */
diff --git a/arch/x86/include/asm/xen/swiotlb-xen.h b/arch/x86/include/asm/xen/swiotlb-xen.h
index 66b4ddde77430..558821387808e 100644
--- a/arch/x86/include/asm/xen/swiotlb-xen.h
+++ b/arch/x86/include/asm/xen/swiotlb-xen.h
@@ -10,4 +10,9 @@ extern int pci_xen_swiotlb_init_late(void);
 static inline int pci_xen_swiotlb_init_late(void) { return -ENXIO; }
 #endif
 
+int xen_create_contiguous_region(phys_addr_t pstart, unsigned int order,
+				unsigned int address_bits,
+				dma_addr_t *dma_handle);
+void xen_destroy_contiguous_region(phys_addr_t pstart, unsigned int order);
+
 #endif /* _ASM_X86_SWIOTLB_XEN_H */
diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index 47aebd98f52f5..557edb9c54879 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -36,7 +36,6 @@
 #include <xen/hvc-console.h>
 
 #include <asm/dma-mapping.h>
-#include <asm/xen/page-coherent.h>
 
 #include <trace/events/swiotlb.h>
 #define MAX_DMA_BITS 32
@@ -104,6 +103,7 @@ static int is_xen_swiotlb_buffer(struct device *dev, dma_addr_t dma_addr)
 	return 0;
 }
 
+#ifdef CONFIG_X86
 static int xen_swiotlb_fixup(void *buf, unsigned long nslabs)
 {
 	int rc;
@@ -129,6 +129,12 @@ static int xen_swiotlb_fixup(void *buf, unsigned long nslabs)
 	} while (i < nslabs);
 	return 0;
 }
+#else
+static int xen_swiotlb_fixup(void *buf, unsigned long nslabs)
+{
+	return 0;
+}
+#endif
 
 enum xen_swiotlb_err {
 	XEN_SWIOTLB_UNKNOWN = 0,
@@ -256,97 +262,60 @@ void __init xen_swiotlb_init_early(void)
 		panic("Cannot allocate SWIOTLB buffer");
 	swiotlb_set_max_segment(PAGE_SIZE);
 }
-#endif /* CONFIG_X86 */
 
 static void *
-xen_swiotlb_alloc_coherent(struct device *hwdev, size_t size,
-			   dma_addr_t *dma_handle, gfp_t flags,
-			   unsigned long attrs)
+xen_swiotlb_alloc_coherent(struct device *dev, size_t size,
+		dma_addr_t *dma_handle, gfp_t flags, unsigned long attrs)
 {
-	void *ret;
+	u64 dma_mask = dev->coherent_dma_mask;
 	int order = get_order(size);
-	u64 dma_mask = DMA_BIT_MASK(32);
 	phys_addr_t phys;
-	dma_addr_t dev_addr;
-
-	/*
-	* Ignore region specifiers - the kernel's ideas of
-	* pseudo-phys memory layout has nothing to do with the
-	* machine physical layout.  We can't allocate highmem
-	* because we can't return a pointer to it.
-	*/
-	flags &= ~(__GFP_DMA | __GFP_HIGHMEM);
+	void *ret;
 
-	/* Convert the size to actually allocated. */
+	/* Align the allocation to the Xen page size */
 	size = 1UL << (order + XEN_PAGE_SHIFT);
 
-	/* On ARM this function returns an ioremap'ped virtual address for
-	 * which virt_to_phys doesn't return the corresponding physical
-	 * address. In fact on ARM virt_to_phys only works for kernel direct
-	 * mapped RAM memory. Also see comment below.
-	 */
-	ret = xen_alloc_coherent_pages(hwdev, size, dma_handle, flags, attrs);
-
+	ret = (void *)__get_free_pages(flags, get_order(size));
 	if (!ret)
 		return ret;
-
-	if (hwdev && hwdev->coherent_dma_mask)
-		dma_mask = hwdev->coherent_dma_mask;
-
-	/* At this point dma_handle is the dma address, next we are
-	 * going to set it to the machine address.
-	 * Do not use virt_to_phys(ret) because on ARM it doesn't correspond
-	 * to *dma_handle. */
-	phys = dma_to_phys(hwdev, *dma_handle);
-	dev_addr = xen_phys_to_dma(hwdev, phys);
-	if (((dev_addr + size - 1 <= dma_mask)) &&
-	    !range_straddles_page_boundary(phys, size))
-		*dma_handle = dev_addr;
-	else {
-		if (xen_create_contiguous_region(phys, order,
-						 fls64(dma_mask), dma_handle) != 0) {
-			xen_free_coherent_pages(hwdev, size, ret, (dma_addr_t)phys, attrs);
-			return NULL;
-		}
-		*dma_handle = phys_to_dma(hwdev, *dma_handle);
+	phys = virt_to_phys(ret);
+
+	*dma_handle = xen_phys_to_dma(dev, phys);
+	if (*dma_handle + size - 1 > dma_mask ||
+	    range_straddles_page_boundary(phys, size)) {
+		if (xen_create_contiguous_region(phys, order, fls64(dma_mask),
+				dma_handle) != 0)
+			goto out_free_pages;
 		SetPageXenRemapped(virt_to_page(ret));
 	}
+
 	memset(ret, 0, size);
 	return ret;
+
+out_free_pages:
+	free_pages((unsigned long)ret, get_order(size));
+	return NULL;
 }
 
 static void
-xen_swiotlb_free_coherent(struct device *hwdev, size_t size, void *vaddr,
-			  dma_addr_t dev_addr, unsigned long attrs)
+xen_swiotlb_free_coherent(struct device *dev, size_t size, void *vaddr,
+		dma_addr_t dma_handle, unsigned long attrs)
 {
+	phys_addr_t phys = virt_to_phys(vaddr);
 	int order = get_order(size);
-	phys_addr_t phys;
-	u64 dma_mask = DMA_BIT_MASK(32);
-	struct page *page;
-
-	if (hwdev && hwdev->coherent_dma_mask)
-		dma_mask = hwdev->coherent_dma_mask;
-
-	/* do not use virt_to_phys because on ARM it doesn't return you the
-	 * physical address */
-	phys = xen_dma_to_phys(hwdev, dev_addr);
 
 	/* Convert the size to actually allocated. */
 	size = 1UL << (order + XEN_PAGE_SHIFT);
 
-	if (is_vmalloc_addr(vaddr))
-		page = vmalloc_to_page(vaddr);
-	else
-		page = virt_to_page(vaddr);
+	if (WARN_ON_ONCE(dma_handle + size - 1 > dev->coherent_dma_mask) ||
+	    WARN_ON_ONCE(range_straddles_page_boundary(phys, size)))
+	    	return;
 
-	if (!WARN_ON((dev_addr + size - 1 > dma_mask) ||
-		     range_straddles_page_boundary(phys, size)) &&
-	    TestClearPageXenRemapped(page))
+	if (TestClearPageXenRemapped(virt_to_page(vaddr)))
 		xen_destroy_contiguous_region(phys, order);
-
-	xen_free_coherent_pages(hwdev, size, vaddr, phys_to_dma(hwdev, phys),
-				attrs);
+	free_pages((unsigned long)vaddr, get_order(size));
 }
+#endif /* CONFIG_X86 */
 
 /*
  * Map a single buffer of the indicated size for DMA in streaming mode.  The
@@ -549,8 +518,13 @@ xen_swiotlb_dma_supported(struct device *hwdev, u64 mask)
 }
 
 const struct dma_map_ops xen_swiotlb_dma_ops = {
+#ifdef CONFIG_X86
 	.alloc = xen_swiotlb_alloc_coherent,
 	.free = xen_swiotlb_free_coherent,
+#else
+	.alloc = dma_direct_alloc,
+	.free = dma_direct_free,
+#endif
 	.sync_single_for_cpu = xen_swiotlb_sync_single_for_cpu,
 	.sync_single_for_device = xen_swiotlb_sync_single_for_device,
 	.sync_sg_for_cpu = xen_swiotlb_sync_sg_for_cpu,
diff --git a/include/xen/arm/page-coherent.h b/include/xen/arm/page-coherent.h
deleted file mode 100644
index b9cc11e887ed5..0000000000000
--- a/include/xen/arm/page-coherent.h
+++ /dev/null
@@ -1,20 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _XEN_ARM_PAGE_COHERENT_H
-#define _XEN_ARM_PAGE_COHERENT_H
-
-#include <linux/dma-mapping.h>
-#include <asm/page.h>
-
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
-#endif /* _XEN_ARM_PAGE_COHERENT_H */
diff --git a/include/xen/xen-ops.h b/include/xen/xen-ops.h
index a3584a357f353..c7c1b46ff4cd4 100644
--- a/include/xen/xen-ops.h
+++ b/include/xen/xen-ops.h
@@ -42,13 +42,6 @@ int xen_setup_shutdown_event(void);
 
 extern unsigned long *xen_contiguous_bitmap;
 
-#if defined(CONFIG_XEN_PV) || defined(CONFIG_ARM) || defined(CONFIG_ARM64)
-int xen_create_contiguous_region(phys_addr_t pstart, unsigned int order,
-				unsigned int address_bits,
-				dma_addr_t *dma_handle);
-void xen_destroy_contiguous_region(phys_addr_t pstart, unsigned int order);
-#endif
-
 #if defined(CONFIG_XEN_PV)
 int xen_remap_pfn(struct vm_area_struct *vma, unsigned long addr,
 		  xen_pfn_t *pfn, int nr, int *err_ptr, pgprot_t prot,
-- 
2.30.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
