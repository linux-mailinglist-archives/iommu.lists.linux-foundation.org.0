Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 193ECE9DF0
	for <lists.iommu@lfdr.de>; Wed, 30 Oct 2019 15:52:45 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 2D5ECC8F;
	Wed, 30 Oct 2019 14:51:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E0D2DCC3
	for <iommu@lists.linux-foundation.org>;
	Wed, 30 Oct 2019 14:51:31 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 3F14E87B
	for <iommu@lists.linux-foundation.org>;
	Wed, 30 Oct 2019 14:51:31 +0000 (UTC)
Received: from localhost.localdomain (236.31.169.217.in-addr.arpa
	[217.169.31.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id BEF9E20856;
	Wed, 30 Oct 2019 14:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1572447091;
	bh=urx7f4IlQ673TogJHP3tvk6isS4vbCocLoayy01FY80=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Zw9MuddC/OE9ze6pGGx+edFCBeJMO1sTbvSq/643T8IdJ+kKyQ1ZYzE5C0lobTwCQ
	gX56C+VLeePawwj6yvaca2GZBIQfuU78L76lG6SPpMWU692o7cQEtdzMptfRoCPG/p
	wcLyRXpg5br6uHMW5dyLvbxeqLxuvtDGcnnhRuVA=
From: Will Deacon <will@kernel.org>
To: iommu@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 7/7] iommu/arm-smmu: Allow building as a module
Date: Wed, 30 Oct 2019 14:51:12 +0000
Message-Id: <20191030145112.19738-8-will@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191030145112.19738-1-will@kernel.org>
References: <20191030145112.19738-1-will@kernel.org>
MIME-Version: 1.0
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Bjorn Helgaas <bhelgaas@google.com>, Robin Murphy <robin.murphy@arm.com>,
	Will Deacon <will@kernel.org>
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

By conditionally dropping support for the legacy binding and exporting
the newly introduced 'arm_smmu_impl_init()' function we can allow the
ARM SMMU driver to be built as a module.

Signed-off-by: Will Deacon <will@kernel.org>
---
 drivers/iommu/Kconfig         | 14 ++++++++-
 drivers/iommu/arm-smmu-impl.c |  6 ++++
 drivers/iommu/arm-smmu.c      | 54 +++++++++++++++++++++--------------
 3 files changed, 51 insertions(+), 23 deletions(-)

diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index 7583d47fc4d5..02703f51e533 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -350,7 +350,7 @@ config SPAPR_TCE_IOMMU
 
 # ARM IOMMU support
 config ARM_SMMU
-	bool "ARM Ltd. System MMU (SMMU) Support"
+	tristate "ARM Ltd. System MMU (SMMU) Support"
 	depends on (ARM64 || ARM) && MMU
 	select IOMMU_API
 	select IOMMU_IO_PGTABLE_LPAE
@@ -362,6 +362,18 @@ config ARM_SMMU
 	  Say Y here if your SoC includes an IOMMU device implementing
 	  the ARM SMMU architecture.
 
+config ARM_SMMU_LEGACY_DT_BINDINGS
+	bool "Support the legacy \"mmu-masters\" devicetree bindings"
+	depends on ARM_SMMU=y && OF
+	help
+	  Support for the badly designed and deprecated \"mmu-masters\"
+	  devicetree bindings. This allows some DMA masters to attach
+	  to the SMMU but does not provide any support via the DMA API.
+	  If you're lucky, you might be able to get VFIO up and running.
+
+	  If you say Y here then you'll make me very sad. Instead, say N
+	  and move your firmware to the utopian future that was 2016.
+
 config ARM_SMMU_DISABLE_BYPASS_BY_DEFAULT
 	bool "Default to disabling bypass on ARM SMMU v1 and v2"
 	depends on ARM_SMMU
diff --git a/drivers/iommu/arm-smmu-impl.c b/drivers/iommu/arm-smmu-impl.c
index 5c87a38620c4..2f82d40317d6 100644
--- a/drivers/iommu/arm-smmu-impl.c
+++ b/drivers/iommu/arm-smmu-impl.c
@@ -5,6 +5,7 @@
 #define pr_fmt(fmt) "arm-smmu: " fmt
 
 #include <linux/bitfield.h>
+#include <linux/module.h>
 #include <linux/of.h>
 
 #include "arm-smmu.h"
@@ -172,3 +173,8 @@ struct arm_smmu_device *arm_smmu_impl_init(struct arm_smmu_device *smmu)
 
 	return smmu;
 }
+EXPORT_SYMBOL_GPL(arm_smmu_impl_init);
+
+MODULE_DESCRIPTION("IOMMU quirks for ARM architected SMMU implementations");
+MODULE_AUTHOR("Robin Murphy <robin.murphy@arm.com>");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
index 53bbe0663b9e..9ef14830546d 100644
--- a/drivers/iommu/arm-smmu.c
+++ b/drivers/iommu/arm-smmu.c
@@ -125,6 +125,12 @@ static struct arm_smmu_domain *to_smmu_domain(struct iommu_domain *dom)
 	return container_of(dom, struct arm_smmu_domain, domain);
 }
 
+static struct platform_driver arm_smmu_driver;
+static struct iommu_ops arm_smmu_ops;
+
+#ifdef CONFIG_ARM_SMMU_LEGACY_DT_BINDINGS
+static void arm_smmu_bus_init(void);
+
 static struct device_node *dev_get_dev_node(struct device *dev)
 {
 	if (dev_is_pci(dev)) {
@@ -160,9 +166,6 @@ static int __find_legacy_master_phandle(struct device *dev, void *data)
 	return err == -ENOENT ? 0 : err;
 }
 
-static struct platform_driver arm_smmu_driver;
-static struct iommu_ops arm_smmu_ops;
-
 static int arm_smmu_register_legacy_master(struct device *dev,
 					   struct arm_smmu_device **smmu)
 {
@@ -214,6 +217,27 @@ static int arm_smmu_register_legacy_master(struct device *dev,
 	return err;
 }
 
+/*
+ * With the legacy DT binding in play, we have no guarantees about
+ * probe order, but then we're also not doing default domains, so we can
+ * delay setting bus ops until we're sure every possible SMMU is ready,
+ * and that way ensure that no add_device() calls get missed.
+ */
+static int arm_smmu_legacy_bus_init(void)
+{
+	if (using_legacy_binding)
+		arm_smmu_bus_init();
+	return 0;
+}
+device_initcall_sync(arm_smmu_legacy_bus_init);
+#else
+static int arm_smmu_register_legacy_master(struct device *dev,
+					   struct arm_smmu_device **smmu)
+{
+	return -ENODEV;
+}
+#endif /* CONFIG_ARM_SMMU_LEGACY_DT_BINDINGS */
+
 static int __arm_smmu_alloc_bitmap(unsigned long *map, int start, int end)
 {
 	int idx;
@@ -1960,8 +1984,10 @@ static int arm_smmu_device_dt_probe(struct platform_device *pdev,
 
 	legacy_binding = of_find_property(dev->of_node, "mmu-masters", NULL);
 	if (legacy_binding && !using_generic_binding) {
-		if (!using_legacy_binding)
-			pr_notice("deprecated \"mmu-masters\" DT property in use; DMA API support unavailable\n");
+		if (!using_legacy_binding) {
+			pr_notice("deprecated \"mmu-masters\" DT property in use; %s support unavailable\n",
+				  IS_ENABLED(CONFIG_ARM_SMMU_LEGACY_DT_BINDINGS) ? "DMA API" : "SMMU");
+		}
 		using_legacy_binding = true;
 	} else if (!legacy_binding && !using_legacy_binding) {
 		using_generic_binding = true;
@@ -1986,10 +2012,8 @@ static void arm_smmu_bus_init(void)
 		bus_set_iommu(&amba_bustype, &arm_smmu_ops);
 #endif
 #ifdef CONFIG_PCI
-	if (!iommu_present(&pci_bus_type)) {
-		pci_request_acs();
+	if (!iommu_present(&pci_bus_type))
 		bus_set_iommu(&pci_bus_type, &arm_smmu_ops);
-	}
 #endif
 #ifdef CONFIG_FSL_MC_BUS
 	if (!iommu_present(&fsl_mc_bus_type))
@@ -2147,20 +2171,6 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
 	return 0;
 }
 
-/*
- * With the legacy DT binding in play, though, we have no guarantees about
- * probe order, but then we're also not doing default domains, so we can
- * delay setting bus ops until we're sure every possible SMMU is ready,
- * and that way ensure that no add_device() calls get missed.
- */
-static int arm_smmu_legacy_bus_init(void)
-{
-	if (using_legacy_binding)
-		arm_smmu_bus_init();
-	return 0;
-}
-device_initcall_sync(arm_smmu_legacy_bus_init);
-
 static int arm_smmu_device_remove(struct platform_device *pdev)
 {
 	struct arm_smmu_device *smmu = platform_get_drvdata(pdev);
-- 
2.24.0.rc0.303.g954a862665-goog

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
