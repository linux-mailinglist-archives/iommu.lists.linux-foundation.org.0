Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 607963C459A
	for <lists.iommu@lfdr.de>; Mon, 12 Jul 2021 08:26:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E4AA740101;
	Mon, 12 Jul 2021 06:26:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ukD_mVEFGttu; Mon, 12 Jul 2021 06:26:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id EB346400CB;
	Mon, 12 Jul 2021 06:26:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D2F22C001D;
	Mon, 12 Jul 2021 06:26:12 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A700EC000E
 for <iommu@lists.linux-foundation.org>; Mon, 12 Jul 2021 06:26:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8862083560
 for <iommu@lists.linux-foundation.org>; Mon, 12 Jul 2021 06:26:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vh4mmfcODncA for <iommu@lists.linux-foundation.org>;
 Mon, 12 Jul 2021 06:26:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D1C518355F
 for <iommu@lists.linux-foundation.org>; Mon, 12 Jul 2021 06:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=O5uvaUdSp6FqM7+gNK9rRhzVPwV15QaVwrDrGAsNxTE=; b=MPGmLxDmFoDvPr/4xVjyljFCs6
 PDpD7Wh/Kz3P1srVFgaLrTGJFNPSNDy5RwoYZmGin1LSUarfbaXpHeoi0PlOQasi/bNJEi/FGBxdY
 J0s+qJzBJgLR2eWdUTlq5NcTRoUgqMDtMB2vGqg28SBuMQc/Pbf/df7DTTN5UE0QVVXB3ms1rsyQG
 alV6Bd37KPiIk9iWHzeF7V8vWN5OimVFPnperLg0u9w9XiIpy0DC6zrZi1qsfOYbhXjBWLD5MBOHn
 S4db/57uJgbhhrh1a28hv2/7X9dLOgYWBZvg4rFITMtbIAPpW//hur9uDqM+hvIhj96jqsJt3Qeio
 eK3oWRwg==;
Received: from [2001:4bb8:184:8b7c:bd9:61b8:39ba:d78a] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m2pNR-00Gxne-2Z; Mon, 12 Jul 2021 06:25:36 +0000
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org, Russell King <linux@armlinux.org.uk>,
 Brian Cain <bcain@codeaurora.org>
Subject: [PATCH 7/7] hexagon: use the generic global coherent pool
Date: Mon, 12 Jul 2021 08:17:04 +0200
Message-Id: <20210712061704.4162464-8-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210712061704.4162464-1-hch@lst.de>
References: <20210712061704.4162464-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: linux-hexagon@vger.kernel.org, Vladimir Murzin <vladimir.murzin@arm.com>,
 Dillon Min <dillon.minfei@gmail.com>, linux-kernel@vger.kernel.org,
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

Switch hexagon to use the generic code for dma_alloc_coherent from
a global pre-filled pool.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/hexagon/Kconfig      |  1 +
 arch/hexagon/kernel/dma.c | 57 ++++++++-------------------------------
 2 files changed, 12 insertions(+), 46 deletions(-)

diff --git a/arch/hexagon/Kconfig b/arch/hexagon/Kconfig
index e5a852080730..aab1a40eb653 100644
--- a/arch/hexagon/Kconfig
+++ b/arch/hexagon/Kconfig
@@ -7,6 +7,7 @@ config HEXAGON
 	select ARCH_32BIT_OFF_T
 	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
 	select ARCH_NO_PREEMPT
+	select DMA_GLOBAL_POOL
 	# Other pending projects/to-do items.
 	# select HAVE_REGS_AND_STACK_ACCESS_API
 	# select HAVE_HW_BREAKPOINT if PERF_EVENTS
diff --git a/arch/hexagon/kernel/dma.c b/arch/hexagon/kernel/dma.c
index 00b9a81075dd..882680e81a30 100644
--- a/arch/hexagon/kernel/dma.c
+++ b/arch/hexagon/kernel/dma.c
@@ -7,54 +7,8 @@
 
 #include <linux/dma-map-ops.h>
 #include <linux/memblock.h>
-#include <linux/genalloc.h>
-#include <linux/module.h>
 #include <asm/page.h>
 
-static struct gen_pool *coherent_pool;
-
-
-/* Allocates from a pool of uncached memory that was reserved at boot time */
-
-void *arch_dma_alloc(struct device *dev, size_t size, dma_addr_t *dma_addr,
-		gfp_t flag, unsigned long attrs)
-{
-	void *ret;
-
-	/*
-	 * Our max_low_pfn should have been backed off by 16MB in
-	 * mm/init.c to create DMA coherent space.  Use that as the VA
-	 * for the pool.
-	 */
-
-	if (coherent_pool == NULL) {
-		coherent_pool = gen_pool_create(PAGE_SHIFT, -1);
-
-		if (coherent_pool == NULL)
-			panic("Can't create %s() memory pool!", __func__);
-		else
-			gen_pool_add(coherent_pool,
-				(unsigned long)pfn_to_virt(max_low_pfn),
-				hexagon_coherent_pool_size, -1);
-	}
-
-	ret = (void *) gen_pool_alloc(coherent_pool, size);
-
-	if (ret) {
-		memset(ret, 0, size);
-		*dma_addr = (dma_addr_t) virt_to_phys(ret);
-	} else
-		*dma_addr = ~0;
-
-	return ret;
-}
-
-void arch_dma_free(struct device *dev, size_t size, void *vaddr,
-		dma_addr_t dma_addr, unsigned long attrs)
-{
-	gen_pool_free(coherent_pool, (unsigned long) vaddr, size);
-}
-
 void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
 		enum dma_data_direction dir)
 {
@@ -77,3 +31,14 @@ void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
 		BUG();
 	}
 }
+
+/*
+ * Our max_low_pfn should have been backed off by 16MB in mm/init.c to create
+ * DMA coherent space.  Use that for the pool.
+ */
+static int __init hexagon_dma_init(void)
+{
+	return dma_init_global_coherent(PFN_PHYS(max_low_pfn),
+					hexagon_coherent_pool_size);
+}
+core_initcall(hexagon_dma_init);
-- 
2.30.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
