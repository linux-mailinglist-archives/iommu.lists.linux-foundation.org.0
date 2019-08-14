Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB608D4F1
	for <lists.iommu@lfdr.de>; Wed, 14 Aug 2019 15:38:51 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 624B4FEC;
	Wed, 14 Aug 2019 13:38:47 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 0D150101B
	for <iommu@lists.linux-foundation.org>;
	Wed, 14 Aug 2019 13:38:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 6CBCB8A8
	for <iommu@lists.linux-foundation.org>;
	Wed, 14 Aug 2019 13:38:45 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
	id 56BCB476; Wed, 14 Aug 2019 15:38:43 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH 04/10] x86/dma: Get rid of iommu_pass_through
Date: Wed, 14 Aug 2019 15:38:35 +0200
Message-Id: <20190814133841.7095-5-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190814133841.7095-1-joro@8bytes.org>
References: <20190814133841.7095-1-joro@8bytes.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: fenghua.yu@intel.com, tony.luck@intel.com, linux-ia64@vger.kernel.org,
	corbet@lwn.net, Joerg Roedel <jroedel@suse.de>, x86@kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux-foundation.org, mingo@redhat.com, bp@alien8.de,
	Thomas.Lendacky@amd.com, hpa@zytor.com, tglx@linutronix.de
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

From: Joerg Roedel <jroedel@suse.de>

This variable has no users anymore. Remove it and tell the
IOMMU code via its new functions about requested DMA modes.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 arch/x86/include/asm/iommu.h |  1 -
 arch/x86/kernel/pci-dma.c    | 11 +++--------
 2 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/arch/x86/include/asm/iommu.h b/arch/x86/include/asm/iommu.h
index baedab8ac538..b91623d521d9 100644
--- a/arch/x86/include/asm/iommu.h
+++ b/arch/x86/include/asm/iommu.h
@@ -4,7 +4,6 @@
 
 extern int force_iommu, no_iommu;
 extern int iommu_detected;
-extern int iommu_pass_through;
 
 /* 10 seconds */
 #define DMAR_OPERATION_TIMEOUT ((cycles_t) tsc_khz*10*1000)
diff --git a/arch/x86/kernel/pci-dma.c b/arch/x86/kernel/pci-dma.c
index f62b498b18fb..a6fd479d4a71 100644
--- a/arch/x86/kernel/pci-dma.c
+++ b/arch/x86/kernel/pci-dma.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <linux/dma-direct.h>
 #include <linux/dma-debug.h>
+#include <linux/iommu.h>
 #include <linux/dmar.h>
 #include <linux/export.h>
 #include <linux/memblock.h>
@@ -43,12 +44,6 @@ int iommu_detected __read_mostly = 0;
  * It is also possible to disable by default in kernel config, and enable with
  * iommu=nopt at boot time.
  */
-#ifdef CONFIG_IOMMU_DEFAULT_PASSTHROUGH
-int iommu_pass_through __read_mostly = 1;
-#else
-int iommu_pass_through __read_mostly;
-#endif
-
 extern struct iommu_table_entry __iommu_table[], __iommu_table_end[];
 
 void __init pci_iommu_alloc(void)
@@ -120,9 +115,9 @@ static __init int iommu_setup(char *p)
 			swiotlb = 1;
 #endif
 		if (!strncmp(p, "pt", 2))
-			iommu_pass_through = 1;
+			iommu_set_default_passthrough();
 		if (!strncmp(p, "nopt", 4))
-			iommu_pass_through = 0;
+			iommu_set_default_translated();
 
 		gart_parse_options(p);
 
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
