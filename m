Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A92B0AA1B3
	for <lists.iommu@lfdr.de>; Thu,  5 Sep 2019 13:41:17 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 83792176E;
	Thu,  5 Sep 2019 11:41:02 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 3DD19174E
	for <iommu@lists.linux-foundation.org>;
	Thu,  5 Sep 2019 11:41:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id D3943A9
	for <iommu@lists.linux-foundation.org>;
	Thu,  5 Sep 2019 11:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=d0S0r89/KU1c+xgF18IBbeKljG6PelXNtFabs09ex5Y=;
	b=pufavMrDsS2djSBrQkds3tR7jY
	79p2t5CK7q64rwkBXt2Tr6lX/MwSDrYW2j2RwN8CBkn9jQh5xyvKOEgPvRJ9vKeftkk7RxsvhNU9c
	wiNB1nkUBbXdv6MY/ly3Fli68/bdIh+tBFdWdci3UgkikH1m0mxM4i4KVdouXMZwh4gu457PW/oVy
	H8fctCgcOBno0gZ5t55647LrbteBYhmkt4RmZ8tfzL5hpRNe7835j0N7j/UBBlU6sgpfc6Gg1FikG
	RcgPPPfBzyXjaI9TTurxjLkGgUDpNtbqWiXEjxxuE3kP6K+mhLbX78oF+UQ/SDxQvTYoRRw5oq+RJ
	c4orDZ4A==;
Received: from [2001:4bb8:18c:1755:a4b2:9562:6bf1:4bb9] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
	id 1i5q8F-0004vY-MX; Thu, 05 Sep 2019 11:40:56 +0000
From: Christoph Hellwig <hch@lst.de>
To: Stefano Stabellini <sstabellini@kernel.org>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, gross@suse.com,
	boris.ostrovsky@oracle.com
Subject: [PATCH 05/11] xen/arm: remove xen_dma_ops
Date: Thu,  5 Sep 2019 13:34:02 +0200
Message-Id: <20190905113408.3104-6-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190905113408.3104-1-hch@lst.de>
References: <20190905113408.3104-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: x86@kernel.org, Julien Grall <julien.grall@arm.com>,
	linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
	xen-devel@lists.xenproject.org, linux-arm-kernel@lists.infradead.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

arm and arm64 can just use xen_swiotlb_dma_ops directly like x86, no
need for a pointer indirection.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Julien Grall <julien.grall@arm.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 arch/arm/mm/dma-mapping.c    | 3 ++-
 arch/arm/xen/mm.c            | 4 ----
 arch/arm64/mm/dma-mapping.c  | 3 ++-
 include/xen/arm/hypervisor.h | 2 --
 4 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
index 738097396445..2661cad36359 100644
--- a/arch/arm/mm/dma-mapping.c
+++ b/arch/arm/mm/dma-mapping.c
@@ -35,6 +35,7 @@
 #include <asm/mach/map.h>
 #include <asm/system_info.h>
 #include <asm/dma-contiguous.h>
+#include <xen/swiotlb-xen.h>
 
 #include "dma.h"
 #include "mm.h"
@@ -2360,7 +2361,7 @@ void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
 
 #ifdef CONFIG_XEN
 	if (xen_initial_domain())
-		dev->dma_ops = xen_dma_ops;
+		dev->dma_ops = &xen_swiotlb_dma_ops;
 #endif
 	dev->archdata.dma_ops_setup = true;
 }
diff --git a/arch/arm/xen/mm.c b/arch/arm/xen/mm.c
index 2fde161733b0..11d5ad26fcfe 100644
--- a/arch/arm/xen/mm.c
+++ b/arch/arm/xen/mm.c
@@ -162,16 +162,12 @@ void xen_destroy_contiguous_region(phys_addr_t pstart, unsigned int order)
 }
 EXPORT_SYMBOL_GPL(xen_destroy_contiguous_region);
 
-const struct dma_map_ops *xen_dma_ops;
-EXPORT_SYMBOL(xen_dma_ops);
-
 int __init xen_mm_init(void)
 {
 	struct gnttab_cache_flush cflush;
 	if (!xen_initial_domain())
 		return 0;
 	xen_swiotlb_init(1, false);
-	xen_dma_ops = &xen_swiotlb_dma_ops;
 
 	cflush.op = 0;
 	cflush.a.dev_bus_addr = 0;
diff --git a/arch/arm64/mm/dma-mapping.c b/arch/arm64/mm/dma-mapping.c
index bd2b039f43a6..4b244a037349 100644
--- a/arch/arm64/mm/dma-mapping.c
+++ b/arch/arm64/mm/dma-mapping.c
@@ -8,6 +8,7 @@
 #include <linux/cache.h>
 #include <linux/dma-noncoherent.h>
 #include <linux/dma-iommu.h>
+#include <xen/swiotlb-xen.h>
 
 #include <asm/cacheflush.h>
 
@@ -64,6 +65,6 @@ void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
 
 #ifdef CONFIG_XEN
 	if (xen_initial_domain())
-		dev->dma_ops = xen_dma_ops;
+		dev->dma_ops = &xen_swiotlb_dma_ops;
 #endif
 }
diff --git a/include/xen/arm/hypervisor.h b/include/xen/arm/hypervisor.h
index 2982571f7cc1..43ef24dd030e 100644
--- a/include/xen/arm/hypervisor.h
+++ b/include/xen/arm/hypervisor.h
@@ -19,8 +19,6 @@ static inline enum paravirt_lazy_mode paravirt_get_lazy_mode(void)
 	return PARAVIRT_LAZY_NONE;
 }
 
-extern const struct dma_map_ops *xen_dma_ops;
-
 #ifdef CONFIG_XEN
 void __init xen_early_init(void);
 #else
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
