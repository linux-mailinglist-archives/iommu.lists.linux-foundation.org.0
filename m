Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A63E31359B
	for <lists.iommu@lfdr.de>; Mon,  8 Feb 2021 15:50:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0608785C06;
	Mon,  8 Feb 2021 14:50:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m1LGVYfg9KOz; Mon,  8 Feb 2021 14:50:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BC96A85C05;
	Mon,  8 Feb 2021 14:50:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A1A12C1E6F;
	Mon,  8 Feb 2021 14:50:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 88534C013A
 for <iommu@lists.linux-foundation.org>; Mon,  8 Feb 2021 14:50:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 774F587060
 for <iommu@lists.linux-foundation.org>; Mon,  8 Feb 2021 14:50:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YhynBMKF+Dv1 for <iommu@lists.linux-foundation.org>;
 Mon,  8 Feb 2021 14:50:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by hemlock.osuosl.org (Postfix) with ESMTPS id DB68B86FAB
 for <iommu@lists.linux-foundation.org>; Mon,  8 Feb 2021 14:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=EPoiozZS6/Cvp+l1A8bZazJRGXrcXgormcPYzPOKxGQ=; b=BDunB0gBYgJ2R+w+QAi2mR/CSA
 0PbAGk5flA4O6lJxRN6sKdMbQ0SoudMZd/funMFRlZj9WA9c9zubNKRW3GM22pC1fdKI6i8mlVBaD
 nyEBbXTylPOk7uX/Vi7O8Xv78vIgIrlrZvE0yAAvy5DJIpAMxqaVIQfxBFxeaXLq8SLVRewRjjNxk
 Bpoq6dzsNkcVnv8zxmWC3/QeHpW90CtIsfKdLQv//ujL3aU8gU//DRrZLHLxZ/VaFeihcGcwpAS2t
 qsBUwl3Bfdm6/+LyXiz6sJSdnYTaUzDRz5Cxv/rZKEHpWZtIxUv/T6VQhFdEuiBbZkeAZOXlzJN98
 jswI31Tw==;
Received: from [2001:4bb8:184:7d04:e3ed:f9d6:78e2:6f0f] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1l97sA-0066eF-KK; Mon, 08 Feb 2021 14:50:43 +0000
From: Christoph Hellwig <hch@lst.de>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 6/6] MIPS: remove CONFIG_DMA_PERDEV_COHERENT
Date: Mon,  8 Feb 2021 15:50:24 +0100
Message-Id: <20210208145024.3320420-7-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210208145024.3320420-1-hch@lst.de>
References: <20210208145024.3320420-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: iommu@lists.linux-foundation.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org
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

Just select DMA_NONCOHERENT and ARCH_HAS_SETUP_DMA_OPS from the
MIPS_GENERIC platform instead.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/mips/Kconfig              | 8 ++------
 arch/mips/mm/dma-noncoherent.c | 2 +-
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 1f1603a08a6d2d..fae02b0b9c599a 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -123,6 +123,7 @@ choice
 
 config MIPS_GENERIC_KERNEL
 	bool "Generic board-agnostic MIPS kernel"
+	select ARCH_HAS_SETUP_DMA_OPS
 	select MIPS_GENERIC
 	select BOOT_RAW
 	select BUILTIN_DTB
@@ -132,7 +133,7 @@ config MIPS_GENERIC_KERNEL
 	select CPU_MIPSR2_IRQ_EI
 	select CPU_MIPSR2_IRQ_VI
 	select CSRC_R4K
-	select DMA_PERDEV_COHERENT
+	select DMA_NONCOHERENT
 	select HAVE_PCI
 	select IRQ_MIPS_CPU
 	select MIPS_AUTO_PFN_OFFSET
@@ -1127,11 +1128,6 @@ config FW_CFE
 config ARCH_SUPPORTS_UPROBES
 	bool
 
-config DMA_PERDEV_COHERENT
-	bool
-	select ARCH_HAS_SETUP_DMA_OPS
-	select DMA_NONCOHERENT
-
 config DMA_NONCOHERENT
 	bool
 	#
diff --git a/arch/mips/mm/dma-noncoherent.c b/arch/mips/mm/dma-noncoherent.c
index 90b562753eb892..212f3ce75a6bd3 100644
--- a/arch/mips/mm/dma-noncoherent.c
+++ b/arch/mips/mm/dma-noncoherent.c
@@ -135,7 +135,7 @@ void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
 }
 #endif
 
-#ifdef CONFIG_DMA_PERDEV_COHERENT
+#ifdef CONFIG_ARCH_HAS_SETUP_DMA_OPS
 void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
 		const struct iommu_ops *iommu, bool coherent)
 {
-- 
2.29.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
