Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB113162E6
	for <lists.iommu@lfdr.de>; Wed, 10 Feb 2021 10:57:06 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 26B558723E;
	Wed, 10 Feb 2021 09:57:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6aB3k9omJmEj; Wed, 10 Feb 2021 09:57:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 63C3D8722F;
	Wed, 10 Feb 2021 09:57:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5DD4EC013A;
	Wed, 10 Feb 2021 09:57:04 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 60471C013A
 for <iommu@lists.linux-foundation.org>; Wed, 10 Feb 2021 09:57:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 4F6CD858B3
 for <iommu@lists.linux-foundation.org>; Wed, 10 Feb 2021 09:57:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XSr7eBMZsU66 for <iommu@lists.linux-foundation.org>;
 Wed, 10 Feb 2021 09:57:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 749DA84F61
 for <iommu@lists.linux-foundation.org>; Wed, 10 Feb 2021 09:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=rVgkFDixamRnCOSCAsgfO8tfAUmXnWJF/Ui56ZyGouE=; b=HYbn8RtbQ6joT1x/hpygqkoFx+
 ekV6ybIFIGxADb8+R9QObEty/Hh/u9ybMApWWlt7QIpcyxVhfCoXlzi7BL9YKTgzNiR2UMF95sety
 d1up5wXFRPAoGIdmv/vnaAqLuaoLaIQ/TBBIGTENcGkzQ8WkDXuiY4pjQ8ENAdjAraI+kx2I9IzE/
 VWe6QcSsVT3D9SDdR3fivO6uChq9tALw3gP3oFYVhSxZiiXEqX02Knk+6RegbvIlTiQvWV8pG8M4b
 Os7/6rn3RM23hPlfPl5gbOqVLbSyhosf9pjzfBhOcPZrDhDu/NtlgSkMWxyhTjw4XXq0kCCMQDMbd
 1dhu8mBQ==;
Received: from [2001:4bb8:184:7d04:5e70:671e:7b3:191] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1l9mEt-008g4W-R5; Wed, 10 Feb 2021 09:56:54 +0000
From: Christoph Hellwig <hch@lst.de>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 3/6] MIPS: refactor the runtime coherent vs noncoherent DMA
 indicators
Date: Wed, 10 Feb 2021 10:56:38 +0100
Message-Id: <20210210095641.23856-4-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210210095641.23856-1-hch@lst.de>
References: <20210210095641.23856-1-hch@lst.de>
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

Replace the global coherentio enum, and the hw_coherentio (fake) boolean
variables with a single boolean dma_default_coherent flag.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/mips/alchemy/common/setup.c      |  3 +--
 arch/mips/include/asm/dma-coherence.h | 24 ++++--------------------
 arch/mips/kernel/setup.c              | 10 ++++------
 arch/mips/mm/c-r4k.c                  |  8 ++------
 arch/mips/mti-malta/malta-setup.c     |  6 +++---
 arch/mips/pci/pci-alchemy.c           |  5 ++---
 6 files changed, 16 insertions(+), 40 deletions(-)

diff --git a/arch/mips/alchemy/common/setup.c b/arch/mips/alchemy/common/setup.c
index c2da68e7984450..39e5b9cd882b10 100644
--- a/arch/mips/alchemy/common/setup.c
+++ b/arch/mips/alchemy/common/setup.c
@@ -65,8 +65,7 @@ void __init plat_mem_setup(void)
 		/* Clear to obtain best system bus performance */
 		clear_c0_config(1 << 19); /* Clear Config[OD] */
 
-	coherentio = alchemy_dma_coherent() ?
-		IO_COHERENCE_ENABLED : IO_COHERENCE_DISABLED;
+	dma_default_coherent = alchemy_dma_coherent();
 
 	board_setup();	/* board specific setup */
 
diff --git a/arch/mips/include/asm/dma-coherence.h b/arch/mips/include/asm/dma-coherence.h
index 5eaa1fcc878a88..846c5ade30d12d 100644
--- a/arch/mips/include/asm/dma-coherence.h
+++ b/arch/mips/include/asm/dma-coherence.h
@@ -9,30 +9,14 @@
 #ifndef __ASM_DMA_COHERENCE_H
 #define __ASM_DMA_COHERENCE_H
 
-enum coherent_io_user_state {
-	IO_COHERENCE_DEFAULT,
-	IO_COHERENCE_ENABLED,
-	IO_COHERENCE_DISABLED,
-};
-
-#if defined(CONFIG_DMA_PERDEV_COHERENT)
-/* Don't provide (hw_)coherentio to avoid misuse */
-#elif defined(CONFIG_DMA_MAYBE_COHERENT)
-extern enum coherent_io_user_state coherentio;
-extern int hw_coherentio;
-
+#ifdef CONFIG_DMA_MAYBE_COHERENT
+extern bool dma_default_coherent;
 static inline bool dev_is_dma_coherent(struct device *dev)
 {
-	return coherentio == IO_COHERENCE_ENABLED ||
-		(coherentio == IO_COHERENCE_DEFAULT && hw_coherentio);
+	return dma_default_coherent;
 }
 #else
-#ifdef CONFIG_DMA_NONCOHERENT
-#define coherentio	IO_COHERENCE_DISABLED
-#else
-#define coherentio	IO_COHERENCE_ENABLED
+#define dma_default_coherent	(!IS_ENABLED(CONFIG_DMA_NONCOHERENT))
 #endif
-#define hw_coherentio	0
-#endif /* CONFIG_DMA_MAYBE_COHERENT */
 
 #endif
diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index 7e1f8e2774373d..aef418e6e65879 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -807,14 +807,12 @@ arch_initcall(debugfs_mips);
 #endif
 
 #ifdef CONFIG_DMA_MAYBE_COHERENT
-/* User defined DMA coherency from command line. */
-enum coherent_io_user_state coherentio = IO_COHERENCE_DEFAULT;
-EXPORT_SYMBOL_GPL(coherentio);
-int hw_coherentio;	/* Actual hardware supported DMA coherency setting. */
+bool dma_default_coherent;
+EXPORT_SYMBOL_GPL(dma_default_coherent);
 
 static int __init setcoherentio(char *str)
 {
-	coherentio = IO_COHERENCE_ENABLED;
+	dma_default_coherent = true;
 	pr_info("Hardware DMA cache coherency (command line)\n");
 	return 0;
 }
@@ -822,7 +820,7 @@ early_param("coherentio", setcoherentio);
 
 static int __init setnocoherentio(char *str)
 {
-	coherentio = IO_COHERENCE_DISABLED;
+	dma_default_coherent = true;
 	pr_info("Software DMA cache coherency (command line)\n");
 	return 0;
 }
diff --git a/arch/mips/mm/c-r4k.c b/arch/mips/mm/c-r4k.c
index 4f976d687ab007..58afbc3e4ada03 100644
--- a/arch/mips/mm/c-r4k.c
+++ b/arch/mips/mm/c-r4k.c
@@ -1913,15 +1913,11 @@ void r4k_cache_init(void)
 	__local_flush_icache_user_range	= local_r4k_flush_icache_user_range;
 
 #ifdef CONFIG_DMA_NONCOHERENT
-#ifdef CONFIG_DMA_MAYBE_COHERENT
-	if (coherentio == IO_COHERENCE_ENABLED ||
-	    (coherentio == IO_COHERENCE_DEFAULT && hw_coherentio)) {
+	if (dma_default_coherent) {
 		_dma_cache_wback_inv	= (void *)cache_noop;
 		_dma_cache_wback	= (void *)cache_noop;
 		_dma_cache_inv		= (void *)cache_noop;
-	} else
-#endif /* CONFIG_DMA_MAYBE_COHERENT */
-	{
+	} else {
 		_dma_cache_wback_inv	= r4k_dma_cache_wback_inv;
 		_dma_cache_wback	= r4k_dma_cache_wback_inv;
 		_dma_cache_inv		= r4k_dma_cache_inv;
diff --git a/arch/mips/mti-malta/malta-setup.c b/arch/mips/mti-malta/malta-setup.c
index 4caff9e3b45637..1cdcb76d393ed1 100644
--- a/arch/mips/mti-malta/malta-setup.c
+++ b/arch/mips/mti-malta/malta-setup.c
@@ -98,7 +98,7 @@ static void __init plat_setup_iocoherency(void)
 		if (BONITO_PCICACHECTRL & BONITO_PCICACHECTRL_CPUCOH_PRES) {
 			BONITO_PCICACHECTRL |= BONITO_PCICACHECTRL_CPUCOH_EN;
 			pr_info("Enabled Bonito CPU coherency\n");
-			hw_coherentio = 1;
+			dma_default_coherent = true;
 		}
 		if (strstr(fw_getcmdline(), "iobcuncached")) {
 			BONITO_PCICACHECTRL &= ~BONITO_PCICACHECTRL_IOBCCOH_EN;
@@ -118,12 +118,12 @@ static void __init plat_setup_iocoherency(void)
 		pr_info("CMP IOCU detected\n");
 		cfg = __raw_readl((u32 *)CKSEG1ADDR(ROCIT_CONFIG_GEN0));
 		if (cfg & ROCIT_CONFIG_GEN0_PCI_IOCU)
-			hw_coherentio = 1;
+			dma_default_coherent = true;
 		else
 			pr_crit("IOCU OPERATION DISABLED BY SWITCH - DEFAULTING TO SW IO COHERENCY\n");
 	}
 
-	if (hw_coherentio)
+	if (dma_default_coherent)
 		pr_info("Hardware DMA cache coherency enabled\n");
 	else
 		pr_info("Software DMA cache coherency enabled\n");
diff --git a/arch/mips/pci/pci-alchemy.c b/arch/mips/pci/pci-alchemy.c
index 7285b5667568ef..54c86b40d30498 100644
--- a/arch/mips/pci/pci-alchemy.c
+++ b/arch/mips/pci/pci-alchemy.c
@@ -429,9 +429,8 @@ static int alchemy_pci_probe(struct platform_device *pdev)
 	ctx->alchemy_pci_ctrl.io_map_base = (unsigned long)virt_io;
 
 	/* Au1500 revisions older than AD have borked coherent PCI */
-	if ((alchemy_get_cputype() == ALCHEMY_CPU_AU1500) &&
-	    (read_c0_prid() < 0x01030202) &&
-	    (coherentio == IO_COHERENCE_DISABLED)) {
+	if (alchemy_get_cputype() == ALCHEMY_CPU_AU1500 &&
+	    read_c0_prid() < 0x01030202 && !dma_default_coherent) {
 		val = __raw_readl(ctx->regs + PCI_REG_CONFIG);
 		val |= PCI_CONFIG_NC;
 		__raw_writel(val, ctx->regs + PCI_REG_CONFIG);
-- 
2.29.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
