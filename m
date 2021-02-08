Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id CB951313595
	for <lists.iommu@lfdr.de>; Mon,  8 Feb 2021 15:50:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 67B3A207A1;
	Mon,  8 Feb 2021 14:50:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6kttw2kLH5k4; Mon,  8 Feb 2021 14:50:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 87E6420794;
	Mon,  8 Feb 2021 14:50:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 671A5C013A;
	Mon,  8 Feb 2021 14:50:43 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4D401C013A
 for <iommu@lists.linux-foundation.org>; Mon,  8 Feb 2021 14:50:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 373582078B
 for <iommu@lists.linux-foundation.org>; Mon,  8 Feb 2021 14:50:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AIFK1yUbFGLu for <iommu@lists.linux-foundation.org>;
 Mon,  8 Feb 2021 14:50:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by silver.osuosl.org (Postfix) with ESMTPS id 8C31920788
 for <iommu@lists.linux-foundation.org>; Mon,  8 Feb 2021 14:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=aFhPYGLoYcGU6Ykd7tgOcPfeJpRv4i64UK7IzVFmOyw=; b=Wqn9F2nkW7EbNgVcEA0xn00cNJ
 hFeO35gRq902ZDyisNpxQ8AFhzSiiDH/qqV01qfYQWB1Q2Jte25pCcvxR434YjVVtD1agFVmfdymc
 AoWQKf5rVR/uToJTh634oN5kGvvyTyI7noVlej1gVzEECH/KS5Op/RrkhuTz2eAPv+PpMAsV9YY1L
 LnO6k3xvBNCfBqCltBPURv5KDWNbfz6LrxrZnmCNuwumtVzpBX/qHojQBvaVgGVoOEExwIxoUr3uc
 Hnj9DwW2nJLtOE+RLTp+TH4BVOaC2LllrA3evV8K34E5kPxtJjLsSHm2+sQepCAvAQLFvo06mBFO3
 YaM+kojQ==;
Received: from [2001:4bb8:184:7d04:e3ed:f9d6:78e2:6f0f] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1l97s1-0066ds-Nf; Mon, 08 Feb 2021 14:50:34 +0000
From: Christoph Hellwig <hch@lst.de>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 3/6] MIPS: move the {no,
 }nocoherentio options to the malta setup code
Date: Mon,  8 Feb 2021 15:50:21 +0100
Message-Id: <20210208145024.3320420-4-hch@lst.de>
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

There are only two MIPS platforms that are conditionally DMA coherent.
Of those alchemcy forces the coherentcy base on the platform, while
malta allows a mix of hardware defaults and manual overrides.  Move the
command line options for these overrides to the malta setup code, as
they can't have an effect for alchemy.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/mips/kernel/setup.c          | 16 ----------------
 arch/mips/mti-malta/malta-setup.c | 16 ++++++++++++++++
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index 7e1f8e2774373d..8e205a4e18c27b 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -811,20 +811,4 @@ arch_initcall(debugfs_mips);
 enum coherent_io_user_state coherentio = IO_COHERENCE_DEFAULT;
 EXPORT_SYMBOL_GPL(coherentio);
 int hw_coherentio;	/* Actual hardware supported DMA coherency setting. */
-
-static int __init setcoherentio(char *str)
-{
-	coherentio = IO_COHERENCE_ENABLED;
-	pr_info("Hardware DMA cache coherency (command line)\n");
-	return 0;
-}
-early_param("coherentio", setcoherentio);
-
-static int __init setnocoherentio(char *str)
-{
-	coherentio = IO_COHERENCE_DISABLED;
-	pr_info("Software DMA cache coherency (command line)\n");
-	return 0;
-}
-early_param("nocoherentio", setnocoherentio);
 #endif
diff --git a/arch/mips/mti-malta/malta-setup.c b/arch/mips/mti-malta/malta-setup.c
index f3fec5a5a07c76..33449a2692c3a3 100644
--- a/arch/mips/mti-malta/malta-setup.c
+++ b/arch/mips/mti-malta/malta-setup.c
@@ -90,6 +90,22 @@ static void __init fd_activate(void)
 }
 #endif
 
+static int __init setcoherentio(char *str)
+{
+	coherentio = IO_COHERENCE_ENABLED;
+	pr_info("Hardware DMA cache coherency (command line)\n");
+	return 0;
+}
+early_param("coherentio", setcoherentio);
+
+static int __init setnocoherentio(char *str)
+{
+	coherentio = IO_COHERENCE_DISABLED;
+	pr_info("Software DMA cache coherency (command line)\n");
+	return 0;
+}
+early_param("nocoherentio", setnocoherentio);
+
 static void __init plat_setup_iocoherency(void)
 {
 	int supported = 0;
-- 
2.29.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
