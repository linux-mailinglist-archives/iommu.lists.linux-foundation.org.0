Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B80B268F62
	for <lists.iommu@lfdr.de>; Mon, 14 Sep 2020 17:15:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 20F841FEB7;
	Mon, 14 Sep 2020 15:15:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VFSjkn6-N5PG; Mon, 14 Sep 2020 15:15:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id F071D2153D;
	Mon, 14 Sep 2020 15:15:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C4A45C0859;
	Mon, 14 Sep 2020 15:15:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2CC33C0859
 for <iommu@lists.linux-foundation.org>; Mon, 14 Sep 2020 15:15:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 1AE678675A
 for <iommu@lists.linux-foundation.org>; Mon, 14 Sep 2020 15:15:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hg6KvUsaJMtj for <iommu@lists.linux-foundation.org>;
 Mon, 14 Sep 2020 15:15:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 2875086759
 for <iommu@lists.linux-foundation.org>; Mon, 14 Sep 2020 15:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=GqwANsIxdNVU+rEM6+A08fDlq+cFQ0fUVRg0T9QOa8A=; b=lSFqfGN6ov3lHJYOzoc/cSYiUW
 aBOJaO+Znak+R1VesU4Q+GCKpGIDoTjltJrKCfFKdaRzZ/X9JYpKLgoizBicuX7kwJ91rvKfj0PK1
 38sODEPAok2XtTBoI639BDLiKCTuNdZsAgPi6jKdZEPoukiFvC9KsjM48xmr9vMSsqbPWMTe8XU5y
 qGpwI8LLV18ogMIXavqlbQL+YJapq3/Y+TrfH5jPYVq9RO/6c+35asnDiSQNSFrvltDDGAorGkFZ1
 eBwor+s8cQJcVmRJxGRqXksS7QpvAR7bPYiZ4S1Euupa624vUKbZm8VAkgNIW/LX2GYQMhzvi8e2n
 Tyk14cPA==;
Received: from 089144214092.atnat0023.highway.a1.net ([89.144.214.92]
 helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHqCI-0003h2-7E; Mon, 14 Sep 2020 15:15:14 +0000
From: Christoph Hellwig <hch@lst.de>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Ben Skeggs <bskeggs@redhat.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Tomasz Figa <tfiga@chromium.org>,
 Matt Porter <mporter@kernel.crashing.org>, iommu@lists.linux-foundation.org
Subject: [PATCH 13/17] dma-mapping: remove dma_cache_sync
Date: Mon, 14 Sep 2020 16:44:29 +0200
Message-Id: <20200914144433.1622958-14-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200914144433.1622958-1-hch@lst.de>
References: <20200914144433.1622958-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-mm@kvack.org,
 Stefan Richter <stefanr@s5r6.in-berlin.de>, netdev@vger.kernel.org,
 linux1394-devel@lists.sourceforge.net, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
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

All users are gone now, remove the API.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/mips/Kconfig               |  1 -
 arch/mips/jazz/jazzdma.c        |  1 -
 arch/mips/mm/dma-noncoherent.c  |  6 ------
 arch/parisc/Kconfig             |  1 -
 arch/parisc/kernel/pci-dma.c    |  6 ------
 include/linux/dma-mapping.h     |  8 --------
 include/linux/dma-noncoherent.h | 10 ----------
 kernel/dma/Kconfig              |  3 ---
 kernel/dma/mapping.c            | 14 --------------
 9 files changed, 50 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index c95fa3a2484cf0..1be91c5d666e61 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1134,7 +1134,6 @@ config DMA_NONCOHERENT
 	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
 	select ARCH_HAS_DMA_SET_UNCACHED
 	select DMA_NONCOHERENT_MMAP
-	select DMA_NONCOHERENT_CACHE_SYNC
 	select NEED_DMA_MAP_STATE
 
 config SYS_HAS_EARLY_PRINTK
diff --git a/arch/mips/jazz/jazzdma.c b/arch/mips/jazz/jazzdma.c
index dab4d058cea9b1..2bf849caf507b1 100644
--- a/arch/mips/jazz/jazzdma.c
+++ b/arch/mips/jazz/jazzdma.c
@@ -620,7 +620,6 @@ const struct dma_map_ops jazz_dma_ops = {
 	.sync_single_for_device	= jazz_dma_sync_single_for_device,
 	.sync_sg_for_cpu	= jazz_dma_sync_sg_for_cpu,
 	.sync_sg_for_device	= jazz_dma_sync_sg_for_device,
-	.cache_sync		= arch_dma_cache_sync,
 	.mmap			= dma_common_mmap,
 	.get_sgtable		= dma_common_get_sgtable,
 };
diff --git a/arch/mips/mm/dma-noncoherent.c b/arch/mips/mm/dma-noncoherent.c
index 97a14adbafc99c..f34ad1f09799f1 100644
--- a/arch/mips/mm/dma-noncoherent.c
+++ b/arch/mips/mm/dma-noncoherent.c
@@ -137,12 +137,6 @@ void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
 }
 #endif
 
-void arch_dma_cache_sync(struct device *dev, void *vaddr, size_t size,
-		enum dma_data_direction direction)
-{
-	dma_sync_virt_for_device(vaddr, size, direction);
-}
-
 #ifdef CONFIG_DMA_PERDEV_COHERENT
 void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
 		const struct iommu_ops *iommu, bool coherent)
diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index 3b0f53dd70bc9b..ed15da1da174e0 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -195,7 +195,6 @@ config PA11
 	depends on PA7000 || PA7100LC || PA7200 || PA7300LC
 	select ARCH_HAS_SYNC_DMA_FOR_CPU
 	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
-	select DMA_NONCOHERENT_CACHE_SYNC
 
 config PREFETCH
 	def_bool y
diff --git a/arch/parisc/kernel/pci-dma.c b/arch/parisc/kernel/pci-dma.c
index 38c68e131bbe2a..ce38c0b9158125 100644
--- a/arch/parisc/kernel/pci-dma.c
+++ b/arch/parisc/kernel/pci-dma.c
@@ -454,9 +454,3 @@ void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
 {
 	flush_kernel_dcache_range((unsigned long)phys_to_virt(paddr), size);
 }
-
-void arch_dma_cache_sync(struct device *dev, void *vaddr, size_t size,
-	       enum dma_data_direction direction)
-{
-	flush_kernel_dcache_range((unsigned long)vaddr, size);
-}
diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index 4e1de194b45cbf..5b4e97b0846fd3 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -123,8 +123,6 @@ struct dma_map_ops {
 	void (*sync_sg_for_device)(struct device *dev,
 				   struct scatterlist *sg, int nents,
 				   enum dma_data_direction dir);
-	void (*cache_sync)(struct device *dev, void *vaddr, size_t size,
-			enum dma_data_direction direction);
 	int (*dma_supported)(struct device *dev, u64 mask);
 	u64 (*get_required_mask)(struct device *dev);
 	size_t (*max_mapping_size)(struct device *dev);
@@ -254,8 +252,6 @@ void *dmam_alloc_attrs(struct device *dev, size_t size, dma_addr_t *dma_handle,
 		gfp_t gfp, unsigned long attrs);
 void dmam_free_coherent(struct device *dev, size_t size, void *vaddr,
 		dma_addr_t dma_handle);
-void dma_cache_sync(struct device *dev, void *vaddr, size_t size,
-		enum dma_data_direction dir);
 int dma_get_sgtable_attrs(struct device *dev, struct sg_table *sgt,
 		void *cpu_addr, dma_addr_t dma_addr, size_t size,
 		unsigned long attrs);
@@ -339,10 +335,6 @@ static inline void dmam_free_coherent(struct device *dev, size_t size,
 		void *vaddr, dma_addr_t dma_handle)
 {
 }
-static inline void dma_cache_sync(struct device *dev, void *vaddr, size_t size,
-		enum dma_data_direction dir)
-{
-}
 static inline int dma_get_sgtable_attrs(struct device *dev,
 		struct sg_table *sgt, void *cpu_addr, dma_addr_t dma_addr,
 		size_t size, unsigned long attrs)
diff --git a/include/linux/dma-noncoherent.h b/include/linux/dma-noncoherent.h
index b9bc6c557ea46f..0888656369a45b 100644
--- a/include/linux/dma-noncoherent.h
+++ b/include/linux/dma-noncoherent.h
@@ -62,16 +62,6 @@ static inline pgprot_t dma_pgprot(struct device *dev, pgprot_t prot,
 }
 #endif /* CONFIG_MMU */
 
-#ifdef CONFIG_DMA_NONCOHERENT_CACHE_SYNC
-void arch_dma_cache_sync(struct device *dev, void *vaddr, size_t size,
-		enum dma_data_direction direction);
-#else
-static inline void arch_dma_cache_sync(struct device *dev, void *vaddr,
-		size_t size, enum dma_data_direction direction)
-{
-}
-#endif /* CONFIG_DMA_NONCOHERENT_CACHE_SYNC */
-
 #ifdef CONFIG_ARCH_HAS_SYNC_DMA_FOR_DEVICE
 void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
 		enum dma_data_direction dir);
diff --git a/kernel/dma/Kconfig b/kernel/dma/Kconfig
index 281785feb874db..c5f717021f5654 100644
--- a/kernel/dma/Kconfig
+++ b/kernel/dma/Kconfig
@@ -75,9 +75,6 @@ config ARCH_HAS_DMA_PREP_COHERENT
 config ARCH_HAS_FORCE_DMA_UNENCRYPTED
 	bool
 
-config DMA_NONCOHERENT_CACHE_SYNC
-	bool
-
 config DMA_VIRT_OPS
 	bool
 	depends on HAS_DMA
diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index 848c95c27d79ff..e71abcec8d3913 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -518,20 +518,6 @@ int dma_set_coherent_mask(struct device *dev, u64 mask)
 EXPORT_SYMBOL(dma_set_coherent_mask);
 #endif
 
-void dma_cache_sync(struct device *dev, void *vaddr, size_t size,
-		enum dma_data_direction dir)
-{
-	const struct dma_map_ops *ops = get_dma_ops(dev);
-
-	BUG_ON(!valid_dma_direction(dir));
-
-	if (dma_alloc_direct(dev, ops))
-		arch_dma_cache_sync(dev, vaddr, size, dir);
-	else if (ops->cache_sync)
-		ops->cache_sync(dev, vaddr, size, dir);
-}
-EXPORT_SYMBOL(dma_cache_sync);
-
 size_t dma_max_mapping_size(struct device *dev)
 {
 	const struct dma_map_ops *ops = get_dma_ops(dev);
-- 
2.28.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
