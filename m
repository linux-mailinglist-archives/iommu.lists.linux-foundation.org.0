Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4A9297EDF
	for <lists.iommu@lfdr.de>; Sat, 24 Oct 2020 23:36:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7289086DE9;
	Sat, 24 Oct 2020 21:36:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q_geCyFqCGsi; Sat, 24 Oct 2020 21:36:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0494B86E14;
	Sat, 24 Oct 2020 21:36:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E239FC0051;
	Sat, 24 Oct 2020 21:36:06 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 773A3C0052
 for <iommu@lists.linux-foundation.org>; Sat, 24 Oct 2020 21:35:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 5995B86A62
 for <iommu@lists.linux-foundation.org>; Sat, 24 Oct 2020 21:35:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1BdSYBkjglkj for <iommu@lists.linux-foundation.org>;
 Sat, 24 Oct 2020 21:35:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 1FF9286A7C
 for <iommu@lists.linux-foundation.org>; Sat, 24 Oct 2020 21:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=bqgZykzwAPXMrTL6XB1bI9Gxco+0bYxPyO2LqSSlo5E=; b=Dkh17TxM3AUC42PghbBYxdE3Ju
 UVOYQmwEIWGw7aZi0y372jPSh2722BiY2HcmFoJpNFZSqloYP75HbFr57nyFZqT7EpOJuUnslAb0m
 kzUVuHA58ImsH/+NZqGaTC4qqEho/TEooA4PYwQ9tpTFoRirLKguS113JRPdKUkCRvd/pjmsxXPW7
 xUMpqqEwKe2hWLvL1i9TlCyGtN2qUZucYN+YFIhPfRuz1rD6mot0Y+QulytqyfQT8T9KxJrIJ3GWS
 feHiTIFCzz4pH5DSJ3lGvj33g1w0sfSNTMCrRfwmONdTQYy3pOdfP76xLPJQZc/ftc3P+ijpYIYB7
 CG2s2EbQ==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kWRCS-0006HE-GT; Sat, 24 Oct 2020 21:35:47 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.93 #3 (Red Hat
 Linux)) id 1kWRCN-001rOj-26; Sat, 24 Oct 2020 22:35:39 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: x86@kernel.org
Subject: [PATCH v3 18/35] x86/msi: Remove msidef.h
Date: Sat, 24 Oct 2020 22:35:18 +0100
Message-Id: <20201024213535.443185-19-dwmw2@infradead.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201024213535.443185-1-dwmw2@infradead.org>
References: <e6601ff691afb3266e365a91e8b221179daf22c2.camel@infradead.org>
 <20201024213535.443185-1-dwmw2@infradead.org>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: linux-hyperv@vger.kernel.org, kvm <kvm@vger.kernel.org>,
 Dexuan Cui <decui@microsoft.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 iommu@lists.linux-foundation.org, maz@misterjones.org,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>
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

From: Thomas Gleixner <tglx@linutronix.de>

Nothing uses the macro maze anymore.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 arch/x86/include/asm/msidef.h | 57 -----------------------------------
 1 file changed, 57 deletions(-)
 delete mode 100644 arch/x86/include/asm/msidef.h

diff --git a/arch/x86/include/asm/msidef.h b/arch/x86/include/asm/msidef.h
deleted file mode 100644
index ee2f8ccc32d0..000000000000
--- a/arch/x86/include/asm/msidef.h
+++ /dev/null
@@ -1,57 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _ASM_X86_MSIDEF_H
-#define _ASM_X86_MSIDEF_H
-
-/*
- * Constants for Intel APIC based MSI messages.
- */
-
-/*
- * Shifts for MSI data
- */
-
-#define MSI_DATA_VECTOR_SHIFT		0
-#define  MSI_DATA_VECTOR_MASK		0x000000ff
-#define	 MSI_DATA_VECTOR(v)		(((v) << MSI_DATA_VECTOR_SHIFT) & \
-					 MSI_DATA_VECTOR_MASK)
-
-#define MSI_DATA_DELIVERY_MODE_SHIFT	8
-#define  MSI_DATA_DELIVERY_FIXED	(0 << MSI_DATA_DELIVERY_MODE_SHIFT)
-#define  MSI_DATA_DELIVERY_LOWPRI	(1 << MSI_DATA_DELIVERY_MODE_SHIFT)
-
-#define MSI_DATA_LEVEL_SHIFT		14
-#define	 MSI_DATA_LEVEL_DEASSERT	(0 << MSI_DATA_LEVEL_SHIFT)
-#define	 MSI_DATA_LEVEL_ASSERT		(1 << MSI_DATA_LEVEL_SHIFT)
-
-#define MSI_DATA_TRIGGER_SHIFT		15
-#define  MSI_DATA_TRIGGER_EDGE		(0 << MSI_DATA_TRIGGER_SHIFT)
-#define  MSI_DATA_TRIGGER_LEVEL		(1 << MSI_DATA_TRIGGER_SHIFT)
-
-/*
- * Shift/mask fields for msi address
- */
-
-#define MSI_ADDR_BASE_HI		0
-#define MSI_ADDR_BASE_LO		0xfee00000
-
-#define MSI_ADDR_DEST_MODE_SHIFT	2
-#define  MSI_ADDR_DEST_MODE_PHYSICAL	(0 << MSI_ADDR_DEST_MODE_SHIFT)
-#define	 MSI_ADDR_DEST_MODE_LOGICAL	(1 << MSI_ADDR_DEST_MODE_SHIFT)
-
-#define MSI_ADDR_REDIRECTION_SHIFT	3
-#define  MSI_ADDR_REDIRECTION_CPU	(0 << MSI_ADDR_REDIRECTION_SHIFT)
-					/* dedicated cpu */
-#define  MSI_ADDR_REDIRECTION_LOWPRI	(1 << MSI_ADDR_REDIRECTION_SHIFT)
-					/* lowest priority */
-
-#define MSI_ADDR_DEST_ID_SHIFT		12
-#define	 MSI_ADDR_DEST_ID_MASK		0x00ffff0
-#define  MSI_ADDR_DEST_ID(dest)		(((dest) << MSI_ADDR_DEST_ID_SHIFT) & \
-					 MSI_ADDR_DEST_ID_MASK)
-#define MSI_ADDR_EXT_DEST_ID(dest)	((dest) & 0xffffff00)
-
-#define MSI_ADDR_IR_EXT_INT		(1 << 4)
-#define MSI_ADDR_IR_SHV			(1 << 3)
-#define MSI_ADDR_IR_INDEX1(index)	((index & 0x8000) >> 13)
-#define MSI_ADDR_IR_INDEX2(index)	((index & 0x7fff) << 5)
-#endif /* _ASM_X86_MSIDEF_H */
-- 
2.26.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
