Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A544F0E9E
	for <lists.iommu@lfdr.de>; Mon,  4 Apr 2022 07:07:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 477C460FA4;
	Mon,  4 Apr 2022 05:07:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bWGHwiwgN1-t; Mon,  4 Apr 2022 05:07:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 1F2E460F82;
	Mon,  4 Apr 2022 05:07:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EDDA4C0082;
	Mon,  4 Apr 2022 05:07:04 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AF29CC0012
 for <iommu@lists.linux-foundation.org>; Mon,  4 Apr 2022 05:07:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8F35E41583
 for <iommu@lists.linux-foundation.org>; Mon,  4 Apr 2022 05:07:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zPo1Lmz6zjEM for <iommu@lists.linux-foundation.org>;
 Mon,  4 Apr 2022 05:07:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 39914415BF
 for <iommu@lists.linux-foundation.org>; Mon,  4 Apr 2022 05:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=vyC3o/8FOMoNs5PhOSLpMqWVlr8Ccnt9Kkscfc4Zyug=; b=ArsNOMOLXYFyJeTBkicZmZyYZF
 nqnXKp8lN6TwwruT1N+rxy/my+Acx8XRzcrrZukE5OuKC3OihTlAdjBwKhLM0hjaMBaWYdtkb8ESm
 Sg2R8btxcfYoAHJmgyRUWmfV/V3TiQMmdxgb1Qa2qhxFp+1+r0i1S6N/a8Wg1ZVY+re/34/aflvbL
 XpkSk1p4yE37C0oNMmhM2GB3WBOyb7w5HbKbzItUduHUcN0nVFMYXVHVE/vwaVlhB6v+8KY2t2RIU
 QhIimcOMjWPrv38RM0o3s/Ka/lVbXCbXdB6XP2g4K4GxdRbv8Z45vc9ao+h7xbO3d5Tx3XXo/BFBj
 p65wEQ2Q==;
Received: from 089144211060.atnat0020.highway.a1.net ([89.144.211.60]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbEvZ-00D9Og-RL; Mon, 04 Apr 2022 05:06:58 +0000
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org
Subject: [PATCH 13/15] swiotlb: merge swiotlb-xen initialization into swiotlb
Date: Mon,  4 Apr 2022 07:05:57 +0200
Message-Id: <20220404050559.132378-14-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220404050559.132378-1-hch@lst.de>
References: <20220404050559.132378-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 linux-s390@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>,
 linux-ia64@vger.kernel.org, Anshuman Khandual <anshuman.khandual@arm.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Robin Murphy <robin.murphy@arm.com>, x86@kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 tboot-devel@lists.sourceforge.net, linux-hyperv@vger.kernel.org,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
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

Reuse the generic swiotlb initialization for xen-swiotlb.  For ARM/ARM64
this works trivially, while for x86 xen_swiotlb_fixup needs to be passed
as the remap argument to swiotlb_init_remap/swiotlb_init_late.

Note that the lower bound of the swiotlb size is changed to the smaller
IO_TLB_MIN_SLABS based value with this patch, but that is fine as the
2MB value used in Xen before was just an optimization and is not the
hard lower bound.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 arch/arm/xen/mm.c               |  21 +++---
 arch/x86/include/asm/xen/page.h |   5 --
 arch/x86/kernel/pci-dma.c       |  20 ++---
 drivers/xen/swiotlb-xen.c       | 128 +-------------------------------
 include/xen/arm/page.h          |   1 -
 include/xen/swiotlb-xen.h       |   8 +-
 6 files changed, 28 insertions(+), 155 deletions(-)

diff --git a/arch/arm/xen/mm.c b/arch/arm/xen/mm.c
index 28c2070602535..ff05a7899cb86 100644
--- a/arch/arm/xen/mm.c
+++ b/arch/arm/xen/mm.c
@@ -23,22 +23,20 @@
 #include <asm/xen/hypercall.h>
 #include <asm/xen/interface.h>
 
-unsigned long xen_get_swiotlb_free_pages(unsigned int order)
+static gfp_t xen_swiotlb_gfp(void)
 {
 	phys_addr_t base;
-	gfp_t flags = __GFP_NOWARN|__GFP_KSWAPD_RECLAIM;
 	u64 i;
 
 	for_each_mem_range(i, &base, NULL) {
 		if (base < (phys_addr_t)0xffffffff) {
 			if (IS_ENABLED(CONFIG_ZONE_DMA32))
-				flags |= __GFP_DMA32;
-			else
-				flags |= __GFP_DMA;
-			break;
+				return __GFP_DMA32;
+			return __GFP_DMA;
 		}
 	}
-	return __get_free_pages(flags, order);
+
+	return GFP_KERNEL;
 }
 
 static bool hypercall_cflush = false;
@@ -140,10 +138,13 @@ static int __init xen_mm_init(void)
 	if (!xen_swiotlb_detect())
 		return 0;
 
-	rc = xen_swiotlb_init();
 	/* we can work with the default swiotlb */
-	if (rc < 0 && rc != -EEXIST)
-		return rc;
+	if (!io_tlb_default_mem.nslabs) {
+		rc = swiotlb_init_late(swiotlb_size_or_default(),
+				       xen_swiotlb_gfp(), NULL);
+		if (rc < 0)
+			return rc;
+	}
 
 	cflush.op = 0;
 	cflush.a.dev_bus_addr = 0;
diff --git a/arch/x86/include/asm/xen/page.h b/arch/x86/include/asm/xen/page.h
index e989bc2269f54..1fc67df500145 100644
--- a/arch/x86/include/asm/xen/page.h
+++ b/arch/x86/include/asm/xen/page.h
@@ -357,9 +357,4 @@ static inline bool xen_arch_need_swiotlb(struct device *dev,
 	return false;
 }
 
-static inline unsigned long xen_get_swiotlb_free_pages(unsigned int order)
-{
-	return __get_free_pages(__GFP_NOWARN, order);
-}
-
 #endif /* _ASM_X86_XEN_PAGE_H */
diff --git a/arch/x86/kernel/pci-dma.c b/arch/x86/kernel/pci-dma.c
index a705a199bf8a3..30bbe4abb5d61 100644
--- a/arch/x86/kernel/pci-dma.c
+++ b/arch/x86/kernel/pci-dma.c
@@ -72,15 +72,13 @@ static inline void __init pci_swiotlb_detect(void)
 #endif /* CONFIG_SWIOTLB */
 
 #ifdef CONFIG_SWIOTLB_XEN
-static bool xen_swiotlb;
-
 static void __init pci_xen_swiotlb_init(void)
 {
 	if (!xen_initial_domain() && !x86_swiotlb_enable)
 		return;
 	x86_swiotlb_enable = true;
-	xen_swiotlb = true;
-	xen_swiotlb_init_early();
+	x86_swiotlb_flags |= SWIOTLB_ANY;
+	swiotlb_init_remap(true, x86_swiotlb_flags, xen_swiotlb_fixup);
 	dma_ops = &xen_swiotlb_dma_ops;
 	if (IS_ENABLED(CONFIG_PCI))
 		pci_request_acs();
@@ -88,14 +86,16 @@ static void __init pci_xen_swiotlb_init(void)
 
 int pci_xen_swiotlb_init_late(void)
 {
-	int rc;
-
-	if (xen_swiotlb)
+	if (dma_ops == &xen_swiotlb_dma_ops)
 		return 0;
 
-	rc = xen_swiotlb_init();
-	if (rc)
-		return rc;
+	/* we can work with the default swiotlb */
+	if (!io_tlb_default_mem.nslabs) {
+		int rc = swiotlb_init_late(swiotlb_size_or_default(),
+					   GFP_KERNEL, xen_swiotlb_fixup);
+		if (rc < 0)
+			return rc;
+	}
 
 	/* XXX: this switches the dma ops under live devices! */
 	dma_ops = &xen_swiotlb_dma_ops;
diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index c2da3eb4826e8..df8085b50df10 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -104,7 +104,7 @@ static int is_xen_swiotlb_buffer(struct device *dev, dma_addr_t dma_addr)
 	return 0;
 }
 
-static int xen_swiotlb_fixup(void *buf, unsigned long nslabs)
+int xen_swiotlb_fixup(void *buf, unsigned long nslabs)
 {
 	int rc;
 	unsigned int order = get_order(IO_TLB_SEGSIZE << IO_TLB_SHIFT);
@@ -130,132 +130,6 @@ static int xen_swiotlb_fixup(void *buf, unsigned long nslabs)
 	return 0;
 }
 
-enum xen_swiotlb_err {
-	XEN_SWIOTLB_UNKNOWN = 0,
-	XEN_SWIOTLB_ENOMEM,
-	XEN_SWIOTLB_EFIXUP
-};
-
-static const char *xen_swiotlb_error(enum xen_swiotlb_err err)
-{
-	switch (err) {
-	case XEN_SWIOTLB_ENOMEM:
-		return "Cannot allocate Xen-SWIOTLB buffer\n";
-	case XEN_SWIOTLB_EFIXUP:
-		return "Failed to get contiguous memory for DMA from Xen!\n"\
-		    "You either: don't have the permissions, do not have"\
-		    " enough free memory under 4GB, or the hypervisor memory"\
-		    " is too fragmented!";
-	default:
-		break;
-	}
-	return "";
-}
-
-int xen_swiotlb_init(void)
-{
-	enum xen_swiotlb_err m_ret = XEN_SWIOTLB_UNKNOWN;
-	unsigned long bytes = swiotlb_size_or_default();
-	unsigned long nslabs = bytes >> IO_TLB_SHIFT;
-	unsigned int order, repeat = 3;
-	int rc = -ENOMEM;
-	char *start;
-
-	if (io_tlb_default_mem.nslabs) {
-		pr_warn("swiotlb buffer already initialized\n");
-		return -EEXIST;
-	}
-
-retry:
-	m_ret = XEN_SWIOTLB_ENOMEM;
-	order = get_order(bytes);
-
-	/*
-	 * Get IO TLB memory from any location.
-	 */
-#define SLABS_PER_PAGE (1 << (PAGE_SHIFT - IO_TLB_SHIFT))
-#define IO_TLB_MIN_SLABS ((1<<20) >> IO_TLB_SHIFT)
-	while ((SLABS_PER_PAGE << order) > IO_TLB_MIN_SLABS) {
-		start = (void *)xen_get_swiotlb_free_pages(order);
-		if (start)
-			break;
-		order--;
-	}
-	if (!start)
-		goto exit;
-	if (order != get_order(bytes)) {
-		pr_warn("Warning: only able to allocate %ld MB for software IO TLB\n",
-			(PAGE_SIZE << order) >> 20);
-		nslabs = SLABS_PER_PAGE << order;
-		bytes = nslabs << IO_TLB_SHIFT;
-	}
-
-	/*
-	 * And replace that memory with pages under 4GB.
-	 */
-	rc = xen_swiotlb_fixup(start, nslabs);
-	if (rc) {
-		free_pages((unsigned long)start, order);
-		m_ret = XEN_SWIOTLB_EFIXUP;
-		goto error;
-	}
-	rc = swiotlb_late_init_with_tbl(start, nslabs);
-	if (rc)
-		return rc;
-	return 0;
-error:
-	if (nslabs > 1024 && repeat--) {
-		/* Min is 2MB */
-		nslabs = max(1024UL, ALIGN(nslabs >> 1, IO_TLB_SEGSIZE));
-		bytes = nslabs << IO_TLB_SHIFT;
-		pr_info("Lowering to %luMB\n", bytes >> 20);
-		goto retry;
-	}
-exit:
-	pr_err("%s (rc:%d)\n", xen_swiotlb_error(m_ret), rc);
-	return rc;
-}
-
-#ifdef CONFIG_X86
-void __init xen_swiotlb_init_early(void)
-{
-	unsigned long bytes = swiotlb_size_or_default();
-	unsigned long nslabs = bytes >> IO_TLB_SHIFT;
-	unsigned int repeat = 3;
-	char *start;
-	int rc;
-
-retry:
-	/*
-	 * Get IO TLB memory from any location.
-	 */
-	start = memblock_alloc(PAGE_ALIGN(bytes),
-			       IO_TLB_SEGSIZE << IO_TLB_SHIFT);
-	if (!start)
-		panic("%s: Failed to allocate %lu bytes\n",
-		      __func__, PAGE_ALIGN(bytes));
-
-	/*
-	 * And replace that memory with pages under 4GB.
-	 */
-	rc = xen_swiotlb_fixup(start, nslabs);
-	if (rc) {
-		memblock_free(start, PAGE_ALIGN(bytes));
-		if (nslabs > 1024 && repeat--) {
-			/* Min is 2MB */
-			nslabs = max(1024UL, ALIGN(nslabs >> 1, IO_TLB_SEGSIZE));
-			bytes = nslabs << IO_TLB_SHIFT;
-			pr_info("Lowering to %luMB\n", bytes >> 20);
-			goto retry;
-		}
-		panic("%s (rc:%d)", xen_swiotlb_error(XEN_SWIOTLB_EFIXUP), rc);
-	}
-
-	if (swiotlb_init_with_tbl(start, nslabs, SWIOTLB_VERBOSE))
-		panic("Cannot allocate SWIOTLB buffer");
-}
-#endif /* CONFIG_X86 */
-
 static void *
 xen_swiotlb_alloc_coherent(struct device *hwdev, size_t size,
 			   dma_addr_t *dma_handle, gfp_t flags,
diff --git a/include/xen/arm/page.h b/include/xen/arm/page.h
index ac1b654705631..7e199c6656b90 100644
--- a/include/xen/arm/page.h
+++ b/include/xen/arm/page.h
@@ -115,6 +115,5 @@ static inline bool set_phys_to_machine(unsigned long pfn, unsigned long mfn)
 bool xen_arch_need_swiotlb(struct device *dev,
 			   phys_addr_t phys,
 			   dma_addr_t dev_addr);
-unsigned long xen_get_swiotlb_free_pages(unsigned int order);
 
 #endif /* _ASM_ARM_XEN_PAGE_H */
diff --git a/include/xen/swiotlb-xen.h b/include/xen/swiotlb-xen.h
index b3e647f86e3e2..590ceb923f0c8 100644
--- a/include/xen/swiotlb-xen.h
+++ b/include/xen/swiotlb-xen.h
@@ -10,8 +10,12 @@ void xen_dma_sync_for_cpu(struct device *dev, dma_addr_t handle,
 void xen_dma_sync_for_device(struct device *dev, dma_addr_t handle,
 			     size_t size, enum dma_data_direction dir);
 
-int xen_swiotlb_init(void);
-void __init xen_swiotlb_init_early(void);
+#ifdef CONFIG_SWIOTLB_XEN
+int xen_swiotlb_fixup(void *buf, unsigned long nslabs);
+#else
+#define xen_swiotlb_fixup NULL
+#endif
+
 extern const struct dma_map_ops xen_swiotlb_dma_ops;
 
 #endif /* __LINUX_SWIOTLB_XEN_H */
-- 
2.30.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
