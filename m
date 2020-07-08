Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id F1538218B57
	for <lists.iommu@lfdr.de>; Wed,  8 Jul 2020 17:34:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 32565896BF;
	Wed,  8 Jul 2020 15:34:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ART-KaIplIoD; Wed,  8 Jul 2020 15:34:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id F2E5F896B8;
	Wed,  8 Jul 2020 15:34:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E3FA4C0893;
	Wed,  8 Jul 2020 15:34:56 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4D87CC016F
 for <iommu@lists.linux-foundation.org>; Wed,  8 Jul 2020 15:34:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 3BCE787675
 for <iommu@lists.linux-foundation.org>; Wed,  8 Jul 2020 15:34:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z6h4N75c9MG5 for <iommu@lists.linux-foundation.org>;
 Wed,  8 Jul 2020 15:34:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 7AB72875A2
 for <iommu@lists.linux-foundation.org>; Wed,  8 Jul 2020 15:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=XforiWlDYLqCZsvALIcTqMySwFsvzYffNCOI6b8L4vw=; b=PbYQX1bnMlKSLnv89nYy/I0v9n
 slCqevJyz6wvsr78vSPL4fC4q58LrUHwZlSVoxlc4YodMktYs6YEYfELsjhtvqoSrayaClyGCoDBu
 OOSQlCmJdOvLNMEZOYus2iEnyulqMbWG8nPUC04jeRMEMurIF12eqTz0910uxHajxNJSA6LFjIsZS
 yDj4sS9xk2yRuSWeIOhy1s4n8AEz7DFxQQTKIR66ZkrC2A3CouV8YkOLapcbzj0vQAFZNpqZNMOKA
 D5KS2DKfRCgvO57gbvJrVbfeBirooSLt/Btw92/G594CS0R5dDFi6IsT6bipEogpmKkbeqyUXYWrq
 yyAFTxfg==;
Received: from 213-225-32-40.nat.highway.a1.net ([213.225.32.40]
 helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtC5Z-0002PE-Mh; Wed, 08 Jul 2020 15:34:28 +0000
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org,
	Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: [PATCH 3/5] dma-mapping: make support for dma ops optional
Date: Wed,  8 Jul 2020 17:24:47 +0200
Message-Id: <20200708152449.316476-4-hch@lst.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200708152449.316476-1-hch@lst.de>
References: <20200708152449.316476-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: Daniel Borkmann <daniel@iogearbox.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 Jesper Dangaard Brouer <brouer@redhat.com>, linuxppc-dev@lists.ozlabs.org
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

Avoid the overhead of the dma ops support for tiny builds that only
use the direct mapping.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/alpha/Kconfig          |  1 +
 arch/arm/Kconfig            |  1 +
 arch/ia64/Kconfig           |  1 +
 arch/mips/Kconfig           |  1 +
 arch/parisc/Kconfig         |  1 +
 arch/powerpc/Kconfig        |  1 +
 arch/s390/Kconfig           |  1 +
 arch/sparc/Kconfig          |  1 +
 arch/x86/Kconfig            |  1 +
 drivers/iommu/Kconfig       |  2 ++
 drivers/misc/mic/Kconfig    |  1 +
 drivers/vdpa/Kconfig        |  1 +
 drivers/xen/Kconfig         |  1 +
 include/linux/device.h      |  3 ++-
 include/linux/dma-mapping.h | 12 +++++++++++-
 kernel/dma/Kconfig          |  4 ++++
 kernel/dma/Makefile         |  3 ++-
 17 files changed, 33 insertions(+), 3 deletions(-)

diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index 10862c5a8c7682..9c5f06e8eb9bc0 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -7,6 +7,7 @@ config ALPHA
 	select ARCH_NO_PREEMPT
 	select ARCH_NO_SG_CHAIN
 	select ARCH_USE_CMPXCHG_LOCKREF
+	select DMA_OPS if PCI
 	select FORCE_PCI if !ALPHA_JENSEN
 	select PCI_DOMAINS if PCI
 	select PCI_SYSCALL if PCI
diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 2ac74904a3ce58..bee35b0187e452 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -41,6 +41,7 @@ config ARM
 	select CPU_PM if SUSPEND || CPU_IDLE
 	select DCACHE_WORD_ACCESS if HAVE_EFFICIENT_UNALIGNED_ACCESS
 	select DMA_DECLARE_COHERENT
+	select DMA_OPS
 	select DMA_REMAP if MMU
 	select EDAC_SUPPORT
 	select EDAC_ATOMIC_SCRUB
diff --git a/arch/ia64/Kconfig b/arch/ia64/Kconfig
index 1fa2fe2ef053f8..5b4ec80bf5863a 100644
--- a/arch/ia64/Kconfig
+++ b/arch/ia64/Kconfig
@@ -192,6 +192,7 @@ config IA64_SGI_UV
 
 config IA64_HP_SBA_IOMMU
 	bool "HP SBA IOMMU support"
+	select DMA_OPS
 	default y
 	help
 	  Say Y here to add support for the SBA IOMMU found on HP zx1 and
diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 6fee1a133e9d6a..8a458105e445b6 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -367,6 +367,7 @@ config MACH_JAZZ
 	select ARC_PROMLIB
 	select ARCH_MIGHT_HAVE_PC_PARPORT
 	select ARCH_MIGHT_HAVE_PC_SERIO
+	select DMA_OPS
 	select FW_ARC
 	select FW_ARC32
 	select ARCH_MAY_HAVE_PC_FDC
diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index 8e4c3708773d08..38c1eafc1f1ae9 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -14,6 +14,7 @@ config PARISC
 	select ARCH_HAS_UBSAN_SANITIZE_ALL
 	select ARCH_NO_SG_CHAIN
 	select ARCH_SUPPORTS_MEMORY_FAILURE
+	select DMA_OPS
 	select RTC_CLASS
 	select RTC_DRV_GENERIC
 	select INIT_ALL_POSSIBLE
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 9fa23eb320ff5a..e9b091d3587222 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -151,6 +151,7 @@ config PPC
 	select BUILDTIME_TABLE_SORT
 	select CLONE_BACKWARDS
 	select DCACHE_WORD_ACCESS		if PPC64 && CPU_LITTLE_ENDIAN
+	select DMA_OPS				if PPC64
 	select DYNAMIC_FTRACE			if FUNCTION_TRACER
 	select EDAC_ATOMIC_SCRUB
 	select EDAC_SUPPORT
diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index c7d7ede6300c59..687fe23f61cc8d 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -113,6 +113,7 @@ config S390
 	select ARCH_WANT_IPC_PARSE_VERSION
 	select BUILDTIME_TABLE_SORT
 	select CLONE_BACKWARDS2
+	select DMA_OPS if PCI
 	select DYNAMIC_FTRACE if FUNCTION_TRACER
 	select GENERIC_CLOCKEVENTS
 	select GENERIC_CPU_AUTOPROBE
diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
index 5bf2dc163540fc..5db1faaaee31c8 100644
--- a/arch/sparc/Kconfig
+++ b/arch/sparc/Kconfig
@@ -15,6 +15,7 @@ config SPARC
 	default y
 	select ARCH_MIGHT_HAVE_PC_PARPORT if SPARC64 && PCI
 	select ARCH_MIGHT_HAVE_PC_SERIO
+	select DMA_OPS
 	select OF
 	select OF_PROMTREE
 	select HAVE_ASM_MODVERSIONS
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 883da0abf7790c..96ab92754158dd 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -909,6 +909,7 @@ config DMI
 
 config GART_IOMMU
 	bool "Old AMD GART IOMMU support"
+	select DMA_OPS
 	select IOMMU_HELPER
 	select SWIOTLB
 	depends on X86_64 && PCI && AMD_NB
diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index 6dc49ed8377a5c..d6ce878a7e8684 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -97,6 +97,7 @@ config OF_IOMMU
 # IOMMU-agnostic DMA-mapping layer
 config IOMMU_DMA
 	bool
+	select DMA_OPS
 	select IOMMU_API
 	select IOMMU_IOVA
 	select IRQ_MSI_IOMMU
@@ -183,6 +184,7 @@ config DMAR_TABLE
 config INTEL_IOMMU
 	bool "Support for Intel IOMMU using DMA Remapping Devices"
 	depends on PCI_MSI && ACPI && (X86 || IA64)
+	select DMA_OPS
 	select IOMMU_API
 	select IOMMU_IOVA
 	select NEED_DMA_MAP_STATE
diff --git a/drivers/misc/mic/Kconfig b/drivers/misc/mic/Kconfig
index 8f201d019f5a4d..a9ec0b25ac40c9 100644
--- a/drivers/misc/mic/Kconfig
+++ b/drivers/misc/mic/Kconfig
@@ -49,6 +49,7 @@ config INTEL_MIC_HOST
 	tristate "Intel MIC Host Driver"
 	depends on 64BIT && PCI && X86
 	depends on INTEL_MIC_BUS && SCIF_BUS && MIC_COSM && VOP_BUS
+	select DMA_OPS
 	help
 	  This enables Host Driver support for the Intel Many Integrated
 	  Core (MIC) family of PCIe form factor coprocessor devices that
diff --git a/drivers/vdpa/Kconfig b/drivers/vdpa/Kconfig
index 3e1ceb8e9f2b52..d93a69b12f81e3 100644
--- a/drivers/vdpa/Kconfig
+++ b/drivers/vdpa/Kconfig
@@ -11,6 +11,7 @@ if VDPA
 config VDPA_SIM
 	tristate "vDPA device simulator"
 	depends on RUNTIME_TESTING_MENU && HAS_DMA
+	select DMA_OPS
 	select VHOST_RING
 	default n
 	help
diff --git a/drivers/xen/Kconfig b/drivers/xen/Kconfig
index 727f11eb46b2bf..1d339ef924228c 100644
--- a/drivers/xen/Kconfig
+++ b/drivers/xen/Kconfig
@@ -179,6 +179,7 @@ config XEN_GRANT_DMA_ALLOC
 
 config SWIOTLB_XEN
 	def_bool y
+	select DMA_OPS
 	select SWIOTLB
 
 config XEN_PCIDEV_BACKEND
diff --git a/include/linux/device.h b/include/linux/device.h
index 15460a5ac024a1..4c4af98321ebd6 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -568,8 +568,9 @@ struct device {
 #ifdef CONFIG_GENERIC_MSI_IRQ
 	struct list_head	msi_list;
 #endif
-
+#ifdef CONFIG_DMA_OPS
 	const struct dma_map_ops *dma_ops;
+#endif
 	u64		*dma_mask;	/* dma mask (if dma'able device) */
 	u64		coherent_dma_mask;/* Like dma_mask, but for
 					     alloc_coherent mappings as
diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index bd0a6f5ee44581..39da883c861954 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -191,6 +191,7 @@ static inline int dma_mmap_from_global_coherent(struct vm_area_struct *vma,
 #ifdef CONFIG_HAS_DMA
 #include <asm/dma-mapping.h>
 
+#ifdef CONFIG_DMA_OPS
 static inline const struct dma_map_ops *get_dma_ops(struct device *dev)
 {
 	if (dev->dma_ops)
@@ -203,7 +204,16 @@ static inline void set_dma_ops(struct device *dev,
 {
 	dev->dma_ops = dma_ops;
 }
-
+#else /* CONFIG_DMA_OPS */
+static inline const struct dma_map_ops *get_dma_ops(struct device *dev)
+{
+	return NULL;
+}
+static inline void set_dma_ops(struct device *dev,
+			       const struct dma_map_ops *dma_ops)
+{
+}
+#endif /* CONFIG_DMA_OPS */
 
 static inline int dma_mapping_error(struct device *dev, dma_addr_t dma_addr)
 {
diff --git a/kernel/dma/Kconfig b/kernel/dma/Kconfig
index 1da3f44f2565b4..5cfb2428593ac7 100644
--- a/kernel/dma/Kconfig
+++ b/kernel/dma/Kconfig
@@ -5,6 +5,9 @@ config HAS_DMA
 	depends on !NO_DMA
 	default y
 
+config DMA_OPS
+	bool
+
 config NEED_SG_DMA_LENGTH
 	bool
 
@@ -60,6 +63,7 @@ config DMA_NONCOHERENT_CACHE_SYNC
 config DMA_VIRT_OPS
 	bool
 	depends on HAS_DMA
+	select DMA_OPS
 
 config SWIOTLB
 	bool
diff --git a/kernel/dma/Makefile b/kernel/dma/Makefile
index 370f63344e9cd9..32c7c1942bbd6c 100644
--- a/kernel/dma/Makefile
+++ b/kernel/dma/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
-obj-$(CONFIG_HAS_DMA)			+= mapping.o direct.o dummy.o
+obj-$(CONFIG_HAS_DMA)			+= mapping.o direct.o
+obj-$(CONFIG_DMA_OPS)			+= dummy.o
 obj-$(CONFIG_DMA_CMA)			+= contiguous.o
 obj-$(CONFIG_DMA_DECLARE_COHERENT)	+= coherent.o
 obj-$(CONFIG_DMA_VIRT_OPS)		+= virt.o
-- 
2.26.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
