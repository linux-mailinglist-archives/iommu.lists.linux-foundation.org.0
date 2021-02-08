Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 2121A313594
	for <lists.iommu@lfdr.de>; Mon,  8 Feb 2021 15:50:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A039D20338;
	Mon,  8 Feb 2021 14:50:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EleA82d1wgXb; Mon,  8 Feb 2021 14:50:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 2BC1020797;
	Mon,  8 Feb 2021 14:50:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1612AC013A;
	Mon,  8 Feb 2021 14:50:39 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 92444C0FA7
 for <iommu@lists.linux-foundation.org>; Mon,  8 Feb 2021 14:50:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 8F15887060
 for <iommu@lists.linux-foundation.org>; Mon,  8 Feb 2021 14:50:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iWKANUDf3YxS for <iommu@lists.linux-foundation.org>;
 Mon,  8 Feb 2021 14:50:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 060BB86FAB
 for <iommu@lists.linux-foundation.org>; Mon,  8 Feb 2021 14:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=8LNOsPgjWIgMUBWaUxbVqhVEgDcpqshclRns6ZWbyUk=; b=Qb8R9RnTnBGAaAdTvl12nctJ39
 tXzywmEphpJD7vo6nTvFkqFNZzwxlDmePNXESt7AjgyQdN+RXDOCSSrUqpvvBtXaWH/E11cA6P2RY
 kVm02/mOIdDugw2hS6HRxZM7OBJEB58//EdBLiBRAcQ41nTlNNfjEC6mA6MzFexPS+Eap23rLW/Fa
 7Ek2CNDN4BEDs7g+Ki7PxkodhEg8YsYVzgLHTkNXHA9PAcT7bLqruZ8Salpyp/ijXNkfUguQP2fbi
 +qvSzRBSFhS9rJchRVjwMCwrKs3oGPE+A2beLGNPzribjLvHCwqwBGNJTIit1SlM6hPEfX2xFzfqm
 YOBHoXAA==;
Received: from [2001:4bb8:184:7d04:e3ed:f9d6:78e2:6f0f] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1l97rz-0066dk-Bd; Mon, 08 Feb 2021 14:50:32 +0000
From: Christoph Hellwig <hch@lst.de>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 2/6] MIPS/alchemy: factor out the DMA coherent setup
Date: Mon,  8 Feb 2021 15:50:20 +0100
Message-Id: <20210208145024.3320420-3-hch@lst.de>
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

Factor out a alchemy_dma_coherent helper that determines if the platform
is DMA coherent.  Also stop initializing the hw_coherentio variable, given
that is only ever set to a non-zero value by the malta setup code.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/mips/alchemy/common/setup.c | 33 ++++++++++++++++++--------------
 1 file changed, 19 insertions(+), 14 deletions(-)

diff --git a/arch/mips/alchemy/common/setup.c b/arch/mips/alchemy/common/setup.c
index 0f60efe0481ecc..c2da68e7984450 100644
--- a/arch/mips/alchemy/common/setup.c
+++ b/arch/mips/alchemy/common/setup.c
@@ -37,6 +37,23 @@
 extern void __init board_setup(void);
 extern void __init alchemy_set_lpj(void);
 
+static bool alchemy_dma_coherent(void)
+{
+	switch (alchemy_get_cputype()) {
+	case ALCHEMY_CPU_AU1000:
+	case ALCHEMY_CPU_AU1500:
+	case ALCHEMY_CPU_AU1100:
+		return false;
+	case ALCHEMY_CPU_AU1200:
+		/* Au1200 AB USB does not support coherent memory */
+		if ((read_c0_prid() & PRID_REV_MASK) == 0)
+			return false;
+		return true;
+	default:
+		return true;
+	}
+}
+
 void __init plat_mem_setup(void)
 {
 	alchemy_set_lpj();
@@ -48,20 +65,8 @@ void __init plat_mem_setup(void)
 		/* Clear to obtain best system bus performance */
 		clear_c0_config(1 << 19); /* Clear Config[OD] */
 
-	hw_coherentio = 0;
-	coherentio = IO_COHERENCE_ENABLED;
-	switch (alchemy_get_cputype()) {
-	case ALCHEMY_CPU_AU1000:
-	case ALCHEMY_CPU_AU1500:
-	case ALCHEMY_CPU_AU1100:
-		coherentio = IO_COHERENCE_DISABLED;
-		break;
-	case ALCHEMY_CPU_AU1200:
-		/* Au1200 AB USB does not support coherent memory */
-		if (0 == (read_c0_prid() & PRID_REV_MASK))
-			coherentio = IO_COHERENCE_DISABLED;
-		break;
-	}
+	coherentio = alchemy_dma_coherent() ?
+		IO_COHERENCE_ENABLED : IO_COHERENCE_DISABLED;
 
 	board_setup();	/* board specific setup */
 
-- 
2.29.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
