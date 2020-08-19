Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5A124958A
	for <lists.iommu@lfdr.de>; Wed, 19 Aug 2020 08:57:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 19FD720468;
	Wed, 19 Aug 2020 06:57:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UI9a8bIxGxKY; Wed, 19 Aug 2020 06:57:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 1F55B207A4;
	Wed, 19 Aug 2020 06:57:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E9BD2C0051;
	Wed, 19 Aug 2020 06:57:18 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F0D07C0051
 for <iommu@lists.linux-foundation.org>; Wed, 19 Aug 2020 06:57:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id D8F9F20797
 for <iommu@lists.linux-foundation.org>; Wed, 19 Aug 2020 06:57:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4P35ddLj0cWS for <iommu@lists.linux-foundation.org>;
 Wed, 19 Aug 2020 06:57:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by silver.osuosl.org (Postfix) with ESMTPS id 8436820468
 for <iommu@lists.linux-foundation.org>; Wed, 19 Aug 2020 06:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=gJaI6Esuqevc5n1odFS47MOCP+KM34I3vDSv3XnZjAI=; b=Tv1CWbnLynvwmWs1Jhy5zKi3md
 uudL4RJWWKY0HA+Skk8RjLPLJTh5m/CPiLgGyyco4MXv4NU9RtzxB6zAQFr16KcUPXrcLcOOhIvEN
 jJr4XvBcs5GY24zClkR+J/+cJPPc+ftEYA+yf9U9PCVauRmjbZpqGKFEWmNjRmgA5OM38RiW7jJIx
 3R9Tg8QbODpTLKDYSQQbRhIOvxDaEip+asJYYyOr1erjSfyFKIaDyZHzGQMmLigFfGFV53Q+268So
 6R1k9V4Ymav8GkQQ6bHSD2xeHktpWRG/qBapr3eHyF2P7npqGMhZh6Wb9r08l2HiSbt7nThXkUmIe
 Ipaa1CEQ==;
Received: from [2001:4bb8:198:f3b2:86b6:2277:f429:37a1] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8I1L-0008Pq-VK; Wed, 19 Aug 2020 06:56:28 +0000
From: Christoph Hellwig <hch@lst.de>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Ben Skeggs <bskeggs@redhat.com>,
 Pawel Osciak <pawel@osciak.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Matt Porter <mporter@kernel.crashing.org>, iommu@lists.linux-foundation.org
Subject: [PATCH 15/28] dma-direct: remove __dma_to_phys
Date: Wed, 19 Aug 2020 08:55:42 +0200
Message-Id: <20200819065555.1802761-16-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200819065555.1802761-1-hch@lst.de>
References: <20200819065555.1802761-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: Tom Lendacky <thomas.lendacky@amd.com>, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
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

There is no harm in just always clearing the SME encryption bit, while
significantly simplifying the interface.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/arm/include/asm/dma-direct.h      |  2 +-
 arch/mips/bmips/dma.c                  |  2 +-
 arch/mips/cavium-octeon/dma-octeon.c   |  2 +-
 arch/mips/include/asm/dma-direct.h     |  2 +-
 arch/mips/loongson2ef/fuloong-2e/dma.c |  2 +-
 arch/mips/loongson2ef/lemote-2f/dma.c  |  2 +-
 arch/mips/loongson64/dma.c             |  2 +-
 arch/mips/pci/pci-ar2315.c             |  2 +-
 arch/mips/pci/pci-xtalk-bridge.c       |  2 +-
 arch/mips/sgi-ip32/ip32-dma.c          |  2 +-
 arch/powerpc/include/asm/dma-direct.h  |  2 +-
 include/linux/dma-direct.h             | 21 +++++++++++----------
 kernel/dma/direct.c                    |  6 +-----
 13 files changed, 23 insertions(+), 26 deletions(-)

diff --git a/arch/arm/include/asm/dma-direct.h b/arch/arm/include/asm/dma-direct.h
index 7c3001a6a775bf..a8cee87a93e8ab 100644
--- a/arch/arm/include/asm/dma-direct.h
+++ b/arch/arm/include/asm/dma-direct.h
@@ -8,7 +8,7 @@ static inline dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t paddr)
 	return pfn_to_dma(dev, __phys_to_pfn(paddr)) + offset;
 }
 
-static inline phys_addr_t __dma_to_phys(struct device *dev, dma_addr_t dev_addr)
+static inline phys_addr_t dma_to_phys(struct device *dev, dma_addr_t dev_addr)
 {
 	unsigned int offset = dev_addr & ~PAGE_MASK;
 	return __pfn_to_phys(dma_to_pfn(dev, dev_addr)) + offset;
diff --git a/arch/mips/bmips/dma.c b/arch/mips/bmips/dma.c
index df56bf4179e347..ba2a5d33dfd3fa 100644
--- a/arch/mips/bmips/dma.c
+++ b/arch/mips/bmips/dma.c
@@ -52,7 +52,7 @@ dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t pa)
 	return pa;
 }
 
-phys_addr_t __dma_to_phys(struct device *dev, dma_addr_t dma_addr)
+phys_addr_t dma_to_phys(struct device *dev, dma_addr_t dma_addr)
 {
 	struct bmips_dma_range *r;
 
diff --git a/arch/mips/cavium-octeon/dma-octeon.c b/arch/mips/cavium-octeon/dma-octeon.c
index 14ea680d180e07..388b13ba2558c2 100644
--- a/arch/mips/cavium-octeon/dma-octeon.c
+++ b/arch/mips/cavium-octeon/dma-octeon.c
@@ -177,7 +177,7 @@ dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t paddr)
 	return paddr;
 }
 
-phys_addr_t __dma_to_phys(struct device *dev, dma_addr_t daddr)
+phys_addr_t dma_to_phys(struct device *dev, dma_addr_t daddr)
 {
 #ifdef CONFIG_PCI
 	if (dev && dev_is_pci(dev))
diff --git a/arch/mips/include/asm/dma-direct.h b/arch/mips/include/asm/dma-direct.h
index 14e352651ce946..8e178651c638c2 100644
--- a/arch/mips/include/asm/dma-direct.h
+++ b/arch/mips/include/asm/dma-direct.h
@@ -3,6 +3,6 @@
 #define _MIPS_DMA_DIRECT_H 1
 
 dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t paddr);
-phys_addr_t __dma_to_phys(struct device *dev, dma_addr_t daddr);
+phys_addr_t dma_to_phys(struct device *dev, dma_addr_t daddr);
 
 #endif /* _MIPS_DMA_DIRECT_H */
diff --git a/arch/mips/loongson2ef/fuloong-2e/dma.c b/arch/mips/loongson2ef/fuloong-2e/dma.c
index e122292bf6660a..83fadeb3fd7d56 100644
--- a/arch/mips/loongson2ef/fuloong-2e/dma.c
+++ b/arch/mips/loongson2ef/fuloong-2e/dma.c
@@ -6,7 +6,7 @@ dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t paddr)
 	return paddr | 0x80000000;
 }
 
-phys_addr_t __dma_to_phys(struct device *dev, dma_addr_t dma_addr)
+phys_addr_t dma_to_phys(struct device *dev, dma_addr_t dma_addr)
 {
 	return dma_addr & 0x7fffffff;
 }
diff --git a/arch/mips/loongson2ef/lemote-2f/dma.c b/arch/mips/loongson2ef/lemote-2f/dma.c
index abf0e39d7e4696..302b43a14eee74 100644
--- a/arch/mips/loongson2ef/lemote-2f/dma.c
+++ b/arch/mips/loongson2ef/lemote-2f/dma.c
@@ -6,7 +6,7 @@ dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t paddr)
 	return paddr | 0x80000000;
 }
 
-phys_addr_t __dma_to_phys(struct device *dev, dma_addr_t dma_addr)
+phys_addr_t dma_to_phys(struct device *dev, dma_addr_t dma_addr)
 {
 	if (dma_addr > 0x8fffffff)
 		return dma_addr;
diff --git a/arch/mips/loongson64/dma.c b/arch/mips/loongson64/dma.c
index dbfe6e82fddd1c..b3dc5d0bd2b113 100644
--- a/arch/mips/loongson64/dma.c
+++ b/arch/mips/loongson64/dma.c
@@ -13,7 +13,7 @@ dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t paddr)
 	return ((nid << 44) ^ paddr) | (nid << node_id_offset);
 }
 
-phys_addr_t __dma_to_phys(struct device *dev, dma_addr_t daddr)
+phys_addr_t dma_to_phys(struct device *dev, dma_addr_t daddr)
 {
 	/* We extract 2bit node id (bit 44~47, only bit 44~45 used now) from
 	 * Loongson-3's 48bit address space and embed it into 40bit */
diff --git a/arch/mips/pci/pci-ar2315.c b/arch/mips/pci/pci-ar2315.c
index 490953f515282a..d88395684f487d 100644
--- a/arch/mips/pci/pci-ar2315.c
+++ b/arch/mips/pci/pci-ar2315.c
@@ -175,7 +175,7 @@ dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t paddr)
 	return paddr + ar2315_dev_offset(dev);
 }
 
-phys_addr_t __dma_to_phys(struct device *dev, dma_addr_t dma_addr)
+phys_addr_t dma_to_phys(struct device *dev, dma_addr_t dma_addr)
 {
 	return dma_addr - ar2315_dev_offset(dev);
 }
diff --git a/arch/mips/pci/pci-xtalk-bridge.c b/arch/mips/pci/pci-xtalk-bridge.c
index 9b3cc775c55e05..f1b37f32b55395 100644
--- a/arch/mips/pci/pci-xtalk-bridge.c
+++ b/arch/mips/pci/pci-xtalk-bridge.c
@@ -33,7 +33,7 @@ dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t paddr)
 	return bc->baddr + paddr;
 }
 
-phys_addr_t __dma_to_phys(struct device *dev, dma_addr_t dma_addr)
+phys_addr_t dma_to_phys(struct device *dev, dma_addr_t dma_addr)
 {
 	return dma_addr & ~(0xffUL << 56);
 }
diff --git a/arch/mips/sgi-ip32/ip32-dma.c b/arch/mips/sgi-ip32/ip32-dma.c
index fa7b17cb53853e..160317294d97a9 100644
--- a/arch/mips/sgi-ip32/ip32-dma.c
+++ b/arch/mips/sgi-ip32/ip32-dma.c
@@ -27,7 +27,7 @@ dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t paddr)
 	return dma_addr;
 }
 
-phys_addr_t __dma_to_phys(struct device *dev, dma_addr_t dma_addr)
+phys_addr_t dma_to_phys(struct device *dev, dma_addr_t dma_addr)
 {
 	phys_addr_t paddr = dma_addr & RAM_OFFSET_MASK;
 
diff --git a/arch/powerpc/include/asm/dma-direct.h b/arch/powerpc/include/asm/dma-direct.h
index abc154d784b078..95b09313d2a4cf 100644
--- a/arch/powerpc/include/asm/dma-direct.h
+++ b/arch/powerpc/include/asm/dma-direct.h
@@ -7,7 +7,7 @@ static inline dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t paddr)
 	return paddr + dev->archdata.dma_offset;
 }
 
-static inline phys_addr_t __dma_to_phys(struct device *dev, dma_addr_t daddr)
+static inline phys_addr_t dma_to_phys(struct device *dev, dma_addr_t daddr)
 {
 	return daddr - dev->archdata.dma_offset;
 }
diff --git a/include/linux/dma-direct.h b/include/linux/dma-direct.h
index 6a96a8ecac7cbc..811582a39e291f 100644
--- a/include/linux/dma-direct.h
+++ b/include/linux/dma-direct.h
@@ -24,11 +24,17 @@ static inline dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t paddr)
 	return dev_addr - ((dma_addr_t)dev->dma_pfn_offset << PAGE_SHIFT);
 }
 
-static inline phys_addr_t __dma_to_phys(struct device *dev, dma_addr_t dev_addr)
+static inline phys_addr_t dma_to_phys(struct device *dev, dma_addr_t dev_addr)
 {
-	phys_addr_t paddr = (phys_addr_t)dev_addr;
-
-	return paddr + ((phys_addr_t)dev->dma_pfn_offset << PAGE_SHIFT);
+	phys_addr_t paddr = (phys_addr_t)dev_addr +
+		((phys_addr_t)dev->dma_pfn_offset << PAGE_SHIFT);
+
+	/*
+	 * Clear the Memory encryption mask if support by the architecture.  We
+	 * do this unconditionally so that we don't have to track if someone
+	 * fed us an encrypted or unencryped DMA address.
+	 */
+	return __sme_clr(paddr);
 }
 #endif /* !CONFIG_ARCH_HAS_PHYS_TO_DMA */
 
@@ -44,7 +50,7 @@ static inline bool force_dma_unencrypted(struct device *dev)
 /*
  * If memory encryption is supported, phys_to_dma will set the memory encryption
  * bit in the DMA address, and dma_to_phys will clear it.  The raw __phys_to_dma
- * and __dma_to_phys versions should only be used on non-encrypted memory for
+ * version should only be used on non-encrypted memory for
  * special occasions like DMA coherent buffers.
  */
 static inline dma_addr_t phys_to_dma(struct device *dev, phys_addr_t paddr)
@@ -52,11 +58,6 @@ static inline dma_addr_t phys_to_dma(struct device *dev, phys_addr_t paddr)
 	return __sme_set(__phys_to_dma(dev, paddr));
 }
 
-static inline phys_addr_t dma_to_phys(struct device *dev, dma_addr_t daddr)
-{
-	return __sme_clr(__dma_to_phys(dev, daddr));
-}
-
 static inline bool dma_capable(struct device *dev, dma_addr_t addr, size_t size,
 		bool is_ram)
 {
diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index 2e280b9c063449..a97835983a34f7 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -48,11 +48,6 @@ gfp_t dma_direct_optimal_gfp_mask(struct device *dev, u64 dma_mask,
 {
 	u64 dma_limit = min_not_zero(dma_mask, dev->bus_dma_limit);
 
-	if (force_dma_unencrypted(dev))
-		*phys_limit = __dma_to_phys(dev, dma_limit);
-	else
-		*phys_limit = dma_to_phys(dev, dma_limit);
-
 	/*
 	 * Optimistically try the zone that the physical address mask falls
 	 * into first.  If that returns memory that isn't actually addressable
@@ -61,6 +56,7 @@ gfp_t dma_direct_optimal_gfp_mask(struct device *dev, u64 dma_mask,
 	 * Note that GFP_DMA32 and GFP_DMA are no ops without the corresponding
 	 * zones.
 	 */
+	*phys_limit = dma_to_phys(dev, dma_limit);
 	if (*phys_limit <= DMA_BIT_MASK(zone_dma_bits))
 		return GFP_DMA;
 	if (*phys_limit <= DMA_BIT_MASK(32))
-- 
2.28.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
