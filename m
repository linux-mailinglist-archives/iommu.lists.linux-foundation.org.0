Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A26B27E453
	for <lists.iommu@lfdr.de>; Wed, 30 Sep 2020 10:56:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id F1A2320400;
	Wed, 30 Sep 2020 08:56:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sEyPS+0iRJOl; Wed, 30 Sep 2020 08:56:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id A33902226B;
	Wed, 30 Sep 2020 08:56:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 91204C0890;
	Wed, 30 Sep 2020 08:56:09 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AC607C016F
 for <iommu@lists.linux-foundation.org>; Wed, 30 Sep 2020 08:56:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 9B7838684F
 for <iommu@lists.linux-foundation.org>; Wed, 30 Sep 2020 08:56:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3phtbzxGPIdb for <iommu@lists.linux-foundation.org>;
 Wed, 30 Sep 2020 08:56:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by whitealder.osuosl.org (Postfix) with ESMTPS id D2A6E86844
 for <iommu@lists.linux-foundation.org>; Wed, 30 Sep 2020 08:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=M/VB7RvUTqS7x6MU8faY6GolcBOVninwR3B54x3JU50=; b=JoVeTh8YB//F+evVVlupMsVdR/
 8lD0UcXPlZXeEGa30mLglM4b9PE5IWaFUvLbOJmbmICt7B/F/sRMpXMJ5i53QhV49/cMoysKiK0Ro
 yyqI6gsyosaoVkiI1bG4lCqNhf7HnwLzSBwBGyBaVvzhCP/Jr6OL4ehojSqROB+vWRxhLbFu6A2m4
 3oTFzZjaH1PPAUPCnWjLEflk2zVIyLyuV4irHTFbErKafNmN7h4kEzWVwm2irTScRNoRHC0bj/RS4
 OV4pM6s+NV4oRUPMwSBLdsjbrMUycUpExitGwd6l/hnDoHol5I1ol7avH+wWdMgoqrl3XiIhfAP7Z
 FFWV+NLg==;
Received: from [2001:4bb8:180:7b62:c70:4a89:bc61:4] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNXu5-0003tA-AQ; Wed, 30 Sep 2020 08:56:01 +0000
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org
Subject: [PATCH 6/9] dma-mapping: remove <asm/dma-contiguous.h>
Date: Wed, 30 Sep 2020 10:55:45 +0200
Message-Id: <20200930085548.920261-7-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200930085548.920261-1-hch@lst.de>
References: <20200930085548.920261-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: linux-arch@vger.kernel.org, Sekhar Nori <nsekhar@ti.com>,
 Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
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

Just provide a weak default definition of dma_contiguous_early_fixup and
let arm override it.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/arm/include/asm/dma-contiguous.h | 15 ---------------
 arch/arm/mm/dma-mapping.c             |  1 -
 include/asm-generic/Kbuild            |  1 -
 include/asm-generic/dma-contiguous.h  | 10 ----------
 include/linux/dma-map-ops.h           |  2 ++
 kernel/dma/contiguous.c               |  6 +++++-
 6 files changed, 7 insertions(+), 28 deletions(-)
 delete mode 100644 arch/arm/include/asm/dma-contiguous.h
 delete mode 100644 include/asm-generic/dma-contiguous.h

diff --git a/arch/arm/include/asm/dma-contiguous.h b/arch/arm/include/asm/dma-contiguous.h
deleted file mode 100644
index d785187a6f8ac1..00000000000000
--- a/arch/arm/include/asm/dma-contiguous.h
+++ /dev/null
@@ -1,15 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef ASMARM_DMA_CONTIGUOUS_H
-#define ASMARM_DMA_CONTIGUOUS_H
-
-#ifdef __KERNEL__
-#ifdef CONFIG_DMA_CMA
-
-#include <linux/types.h>
-
-void dma_contiguous_early_fixup(phys_addr_t base, unsigned long size);
-
-#endif
-#endif
-
-#endif
diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
index 154c24cec94c74..911fc6ea26071e 100644
--- a/arch/arm/mm/dma-mapping.c
+++ b/arch/arm/mm/dma-mapping.c
@@ -34,7 +34,6 @@
 #include <asm/dma-iommu.h>
 #include <asm/mach/map.h>
 #include <asm/system_info.h>
-#include <asm/dma-contiguous.h>
 #include <xen/swiotlb-xen.h>
 
 #include "dma.h"
diff --git a/include/asm-generic/Kbuild b/include/asm-generic/Kbuild
index 74b0612601dd1b..62ebdc731ee239 100644
--- a/include/asm-generic/Kbuild
+++ b/include/asm-generic/Kbuild
@@ -16,7 +16,6 @@ mandatory-y += current.h
 mandatory-y += delay.h
 mandatory-y += device.h
 mandatory-y += div64.h
-mandatory-y += dma-contiguous.h
 mandatory-y += dma-mapping.h
 mandatory-y += dma.h
 mandatory-y += emergency-restart.h
diff --git a/include/asm-generic/dma-contiguous.h b/include/asm-generic/dma-contiguous.h
deleted file mode 100644
index f24b0f9a4f05b6..00000000000000
--- a/include/asm-generic/dma-contiguous.h
+++ /dev/null
@@ -1,10 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _ASM_GENERIC_DMA_CONTIGUOUS_H
-#define _ASM_GENERIC_DMA_CONTIGUOUS_H
-
-#include <linux/types.h>
-
-static inline void
-dma_contiguous_early_fixup(phys_addr_t base, unsigned long size) { }
-
-#endif
diff --git a/include/linux/dma-map-ops.h b/include/linux/dma-map-ops.h
index 474fc81bd4921c..7912f5d00ed950 100644
--- a/include/linux/dma-map-ops.h
+++ b/include/linux/dma-map-ops.h
@@ -116,6 +116,8 @@ bool dma_release_from_contiguous(struct device *dev, struct page *pages,
 				 int count);
 struct page *dma_alloc_contiguous(struct device *dev, size_t size, gfp_t gfp);
 void dma_free_contiguous(struct device *dev, struct page *page, size_t size);
+
+void dma_contiguous_early_fixup(phys_addr_t base, unsigned long size);
 #else /* CONFIG_DMA_CMA */
 static inline struct cma *dev_get_cma_area(struct device *dev)
 {
diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
index 6bfb763fff6fca..a2ee330a3749ec 100644
--- a/kernel/dma/contiguous.c
+++ b/kernel/dma/contiguous.c
@@ -44,7 +44,6 @@
 #endif
 
 #include <asm/page.h>
-#include <asm/dma-contiguous.h>
 
 #include <linux/memblock.h>
 #include <linux/err.h>
@@ -212,6 +211,11 @@ void __init dma_contiguous_reserve(phys_addr_t limit)
 	}
 }
 
+void __weak
+dma_contiguous_early_fixup(phys_addr_t base, unsigned long size)
+{
+}
+
 /**
  * dma_contiguous_reserve_area() - reserve custom contiguous area
  * @size: Size of the reserved area (in bytes),
-- 
2.28.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
