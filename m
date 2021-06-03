Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 856DA39A27C
	for <lists.iommu@lfdr.de>; Thu,  3 Jun 2021 15:48:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9B8A600B9;
	Thu,  3 Jun 2021 13:48:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TWSSTRNLjrNr; Thu,  3 Jun 2021 13:48:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84173607D0;
	Thu,  3 Jun 2021 13:48:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 69801C0001;
	Thu,  3 Jun 2021 13:48:47 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A1174C0001
 for <iommu@lists.linux-foundation.org>; Thu,  3 Jun 2021 13:48:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8EE334059B
 for <iommu@lists.linux-foundation.org>; Thu,  3 Jun 2021 13:48:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wekM4ghz0b8Z for <iommu@lists.linux-foundation.org>;
 Thu,  3 Jun 2021 13:48:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3B09B40596
 for <iommu@lists.linux-foundation.org>; Thu,  3 Jun 2021 13:48:41 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 571F912FC;
 Thu,  3 Jun 2021 06:48:40 -0700 (PDT)
Received: from e110467-lin.cambridge.arm.com (e110467-lin.cambridge.arm.com
 [10.1.196.41])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A2FC03F73D;
 Thu,  3 Jun 2021 06:48:39 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: joro@8bytes.org
Subject: [PATCH] iommu/amd: Tidy up DMA ops init
Date: Thu,  3 Jun 2021 14:48:21 +0100
Message-Id: <665db61e23ff8d54ac5eb391bef520b3a803fcb9.1622727974.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.21.0.dirty
MIME-Version: 1.0
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 Jussi Maki <joamaki@gmail.com>
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

Now that DMA ops are part of the core API via iommu-dma, fold the
vestigial remains of the IOMMU_DMA_OPS init state into the IOMMU API
phase, and clean up a few other leftovers. This should also close the
race window wherein bus_set_iommu() effectively makes the DMA ops state
visible before its nominal initialisation - it seems this was previously
fairly benign, but since commit a250c23f15c2 ("iommu: remove
DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE") it can now lead to the strict flush
queue policy inadvertently being picked for default domains allocated
during that window, with a corresponding unexpected perfomance impact.

Reported-by: Jussi Maki <joamaki@gmail.com>
Tested-by: Jussi Maki <joamaki@gmail.com>
Signed-off-by: Robin Murphy <robin.murphy@arm.com>

---

As discussed on the report thread, I think it makes most sense to merge
this as a fix for 5.13 and not worry about any backporting.

 drivers/iommu/amd/amd_iommu.h |  2 --
 drivers/iommu/amd/init.c      |  5 -----
 drivers/iommu/amd/iommu.c     | 31 +++++++++++++------------------
 3 files changed, 13 insertions(+), 25 deletions(-)

diff --git a/drivers/iommu/amd/amd_iommu.h b/drivers/iommu/amd/amd_iommu.h
index 55dd38d814d9..416815a525d6 100644
--- a/drivers/iommu/amd/amd_iommu.h
+++ b/drivers/iommu/amd/amd_iommu.h
@@ -11,8 +11,6 @@
 
 #include "amd_iommu_types.h"
 
-extern int amd_iommu_init_dma_ops(void);
-extern int amd_iommu_init_passthrough(void);
 extern irqreturn_t amd_iommu_int_thread(int irq, void *data);
 extern irqreturn_t amd_iommu_int_handler(int irq, void *data);
 extern void amd_iommu_apply_erratum_63(u16 devid);
diff --git a/drivers/iommu/amd/init.c b/drivers/iommu/amd/init.c
index d006724f4dc2..a418bf560a4b 100644
--- a/drivers/iommu/amd/init.c
+++ b/drivers/iommu/amd/init.c
@@ -231,7 +231,6 @@ enum iommu_init_state {
 	IOMMU_ENABLED,
 	IOMMU_PCI_INIT,
 	IOMMU_INTERRUPTS_EN,
-	IOMMU_DMA_OPS,
 	IOMMU_INITIALIZED,
 	IOMMU_NOT_FOUND,
 	IOMMU_INIT_ERROR,
@@ -2895,10 +2894,6 @@ static int __init state_next(void)
 		init_state = ret ? IOMMU_INIT_ERROR : IOMMU_INTERRUPTS_EN;
 		break;
 	case IOMMU_INTERRUPTS_EN:
-		ret = amd_iommu_init_dma_ops();
-		init_state = ret ? IOMMU_INIT_ERROR : IOMMU_DMA_OPS;
-		break;
-	case IOMMU_DMA_OPS:
 		init_state = IOMMU_INITIALIZED;
 		break;
 	case IOMMU_INITIALIZED:
diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
index 80e8e1916dd1..2efe6d17783c 100644
--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -30,7 +30,6 @@
 #include <linux/msi.h>
 #include <linux/irqdomain.h>
 #include <linux/percpu.h>
-#include <linux/iova.h>
 #include <linux/io-pgtable.h>
 #include <asm/irq_remapping.h>
 #include <asm/io_apic.h>
@@ -1771,13 +1770,22 @@ void amd_iommu_domain_update(struct protection_domain *domain)
 	amd_iommu_domain_flush_complete(domain);
 }
 
+static void __init amd_iommu_init_dma_ops(void)
+{
+	swiotlb = (iommu_default_passthrough() || sme_me_mask) ? 1 : 0;
+
+	if (amd_iommu_unmap_flush)
+		pr_info("IO/TLB flush on unmap enabled\n");
+	else
+		pr_info("Lazy IO/TLB flushing enabled\n");
+	iommu_set_dma_strict(amd_iommu_unmap_flush);
+}
+
 int __init amd_iommu_init_api(void)
 {
-	int ret, err = 0;
+	int err = 0;
 
-	ret = iova_cache_get();
-	if (ret)
-		return ret;
+	amd_iommu_init_dma_ops();
 
 	err = bus_set_iommu(&pci_bus_type, &amd_iommu_ops);
 	if (err)
@@ -1794,19 +1802,6 @@ int __init amd_iommu_init_api(void)
 	return 0;
 }
 
-int __init amd_iommu_init_dma_ops(void)
-{
-	swiotlb        = (iommu_default_passthrough() || sme_me_mask) ? 1 : 0;
-
-	if (amd_iommu_unmap_flush)
-		pr_info("IO/TLB flush on unmap enabled\n");
-	else
-		pr_info("Lazy IO/TLB flushing enabled\n");
-	iommu_set_dma_strict(amd_iommu_unmap_flush);
-	return 0;
-
-}
-
 /*****************************************************************************
  *
  * The following functions belong to the exported interface of AMD IOMMU
-- 
2.21.0.dirty

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
