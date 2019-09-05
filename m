Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5276DAA1BB
	for <lists.iommu@lfdr.de>; Thu,  5 Sep 2019 13:41:54 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B302B1789;
	Thu,  5 Sep 2019 11:41:19 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 928631778
	for <iommu@lists.linux-foundation.org>;
	Thu,  5 Sep 2019 11:41:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 3AC86A9
	for <iommu@lists.linux-foundation.org>;
	Thu,  5 Sep 2019 11:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=NmR+a6Uj1v91V4iU31zXRZrXbA98s0lz9xVim531aU8=;
	b=hzZJnh4svokLvarfNgvrhm8m1S
	WTXuW7q5KyN2lrjLmjWBEY9ABREivG0K065Agk49VKYTTP+FyoW6woNAUq0QnYak+JJw3qi8LhcY/
	sp1rlzPnkjJ45RfFncTFf4vYND87XigrvGEspmrfheZCmxIKZUL2p2ZPW9j5IqifRDgBQ0IcjJ68p
	ZzEviqStmAYe9RKezZ3rHPP2Ko2kL53FUH0hYABafGrqBV8OoHzueepSS2Wb58WPYWrhgKKsgVSbI
	VcGwGnfNjnSVMvGhZZNVwGfhQ8qzxMLowb8hvIbVBQB4xWL3rKpzmRWIxsdrqALzA2RgJmdGEbbKe
	EKvyOIwA==;
Received: from [2001:4bb8:18c:1755:a4b2:9562:6bf1:4bb9] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
	id 1i5q8Y-0005Ds-Pr; Thu, 05 Sep 2019 11:41:15 +0000
From: Christoph Hellwig <hch@lst.de>
To: Stefano Stabellini <sstabellini@kernel.org>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, gross@suse.com,
	boris.ostrovsky@oracle.com
Subject: [PATCH 11/11] arm64: use asm-generic/dma-mapping.h
Date: Thu,  5 Sep 2019 13:34:08 +0200
Message-Id: <20190905113408.3104-12-hch@lst.de>
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
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux-foundation.org, xen-devel@lists.xenproject.org,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
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

Now that the Xen special cases are gone nothing worth mentioning is
left in the arm64 <asm/dma-mapping.h> file, so switch to use the
asm-generic version instead.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Will Deacon <will@kernel.org>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 arch/arm64/include/asm/Kbuild        |  1 +
 arch/arm64/include/asm/dma-mapping.h | 22 ----------------------
 arch/arm64/mm/dma-mapping.c          |  1 +
 3 files changed, 2 insertions(+), 22 deletions(-)
 delete mode 100644 arch/arm64/include/asm/dma-mapping.h

diff --git a/arch/arm64/include/asm/Kbuild b/arch/arm64/include/asm/Kbuild
index c52e151afab0..98a5405c8558 100644
--- a/arch/arm64/include/asm/Kbuild
+++ b/arch/arm64/include/asm/Kbuild
@@ -4,6 +4,7 @@ generic-y += delay.h
 generic-y += div64.h
 generic-y += dma.h
 generic-y += dma-contiguous.h
+generic-y += dma-mapping.h
 generic-y += early_ioremap.h
 generic-y += emergency-restart.h
 generic-y += hw_irq.h
diff --git a/arch/arm64/include/asm/dma-mapping.h b/arch/arm64/include/asm/dma-mapping.h
deleted file mode 100644
index 67243255a858..000000000000
--- a/arch/arm64/include/asm/dma-mapping.h
+++ /dev/null
@@ -1,22 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (C) 2012 ARM Ltd.
- */
-#ifndef __ASM_DMA_MAPPING_H
-#define __ASM_DMA_MAPPING_H
-
-#ifdef __KERNEL__
-
-#include <linux/types.h>
-#include <linux/vmalloc.h>
-
-#include <xen/xen.h>
-#include <asm/xen/hypervisor.h>
-
-static inline const struct dma_map_ops *get_arch_dma_ops(struct bus_type *bus)
-{
-	return NULL;
-}
-
-#endif	/* __KERNEL__ */
-#endif	/* __ASM_DMA_MAPPING_H */
diff --git a/arch/arm64/mm/dma-mapping.c b/arch/arm64/mm/dma-mapping.c
index 4b244a037349..6578abcfbbc7 100644
--- a/arch/arm64/mm/dma-mapping.c
+++ b/arch/arm64/mm/dma-mapping.c
@@ -8,6 +8,7 @@
 #include <linux/cache.h>
 #include <linux/dma-noncoherent.h>
 #include <linux/dma-iommu.h>
+#include <xen/xen.h>
 #include <xen/swiotlb-xen.h>
 
 #include <asm/cacheflush.h>
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
