Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF371051BF
	for <lists.iommu@lfdr.de>; Thu, 21 Nov 2019 12:50:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E12FC87CDA;
	Thu, 21 Nov 2019 11:50:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8vyasamt3OGc; Thu, 21 Nov 2019 11:50:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id D0EF787EEC;
	Thu, 21 Nov 2019 11:50:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BE982C18DA;
	Thu, 21 Nov 2019 11:50:01 +0000 (UTC)
X-Original-To: iommu@lists.linuxfoundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9C7D7C18DA
 for <iommu@lists.linuxfoundation.org>; Thu, 21 Nov 2019 11:50:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 8980887EB1
 for <iommu@lists.linuxfoundation.org>; Thu, 21 Nov 2019 11:50:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SYF2ST6ttRle for <iommu@lists.linuxfoundation.org>;
 Thu, 21 Nov 2019 11:49:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B3C9887EEC
 for <iommu@lists.linuxfoundation.org>; Thu, 21 Nov 2019 11:49:59 +0000 (UTC)
Received: from localhost.localdomain (236.31.169.217.in-addr.arpa
 [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 573CF21823;
 Thu, 21 Nov 2019 11:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574336999;
 bh=dLOVVjFzno7cFnOSO5c+WPpQftyhjspnD5IKHcSChmI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=h8ymlHM1T2ALoJoN6n4HMD56hsq2EACB7yb4AkkFjffHhmVxd4gBho2ofZC0//Ihw
 HUFZl/h4dUlRkRqCcT8IKWevmo0UMqLVHZQ3QA52yTeyQjY1IKo7MIDE8vBNEqubk8
 28X8Z85nAVMJ6hgqZiBQWvluVbqBohuj5XIDZe5k=
From: Will Deacon <will@kernel.org>
To: iommu@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 13/14] iommu/arm-smmu: Allow building as a module
Date: Thu, 21 Nov 2019 11:49:17 +0000
Message-Id: <20191121114918.2293-14-will@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191121114918.2293-1-will@kernel.org>
References: <20191121114918.2293-1-will@kernel.org>
MIME-Version: 1.0
Cc: "Isaac J. Manjarres" <isaacm@codeaurora.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Saravana Kannan <saravanak@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Robin Murphy <robin.murphy@arm.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Will Deacon <will@kernel.org>
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

By conditionally dropping support for the legacy binding and exporting
the newly introduced 'arm_smmu_impl_init()' function we can allow the
ARM SMMU driver to be built as a module.

Signed-off-by: Will Deacon <will@kernel.org>
---
 drivers/iommu/Kconfig    | 14 ++++++++++-
 drivers/iommu/Makefile   |  3 ++-
 drivers/iommu/arm-smmu.c | 52 ++++++++++++++++++++++++----------------
 3 files changed, 47 insertions(+), 22 deletions(-)

diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index 7583d47fc4d5..fc55f7ba0d18 100644
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
+	  Support for the badly designed and deprecated "mmu-masters"
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
diff --git a/drivers/iommu/Makefile b/drivers/iommu/Makefile
index 4f405f926e73..b52a03d87fc3 100644
--- a/drivers/iommu/Makefile
+++ b/drivers/iommu/Makefile
@@ -13,7 +13,8 @@ obj-$(CONFIG_MSM_IOMMU) += msm_iommu.o
 obj-$(CONFIG_AMD_IOMMU) += amd_iommu.o amd_iommu_init.o amd_iommu_quirks.o
 obj-$(CONFIG_AMD_IOMMU_DEBUGFS) += amd_iommu_debugfs.o
 obj-$(CONFIG_AMD_IOMMU_V2) += amd_iommu_v2.o
-obj-$(CONFIG_ARM_SMMU) += arm-smmu.o arm-smmu-impl.o
+obj-$(CONFIG_ARM_SMMU) += arm-smmu-mod.o
+arm-smmu-mod-objs += arm-smmu.o arm-smmu-impl.o
 obj-$(CONFIG_ARM_SMMU_V3) += arm-smmu-v3.o
 obj-$(CONFIG_DMAR_TABLE) += dmar.o
 obj-$(CONFIG_INTEL_IOMMU) += intel-iommu.o intel-pasid.o
diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
index 307026fb58b3..100ab5b9c255 100644
--- a/drivers/iommu/arm-smmu.c
+++ b/drivers/iommu/arm-smmu.c
@@ -125,6 +125,12 @@ static struct arm_smmu_domain *to_smmu_domain(struct iommu_domain *dom)
 	return container_of(dom, struct arm_smmu_domain, domain);
 }
 
+static struct platform_driver arm_smmu_driver;
+static struct iommu_ops arm_smmu_ops;
+
+#ifdef CONFIG_ARM_SMMU_LEGACY_DT_BINDINGS
+static int arm_smmu_bus_init(struct iommu_ops *ops);
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
+		return arm_smmu_bus_init(&arm_smmu_ops);
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
@@ -1566,6 +1590,7 @@ static struct iommu_ops arm_smmu_ops = {
 	.get_resv_regions	= arm_smmu_get_resv_regions,
 	.put_resv_regions	= arm_smmu_put_resv_regions,
 	.pgsize_bitmap		= -1UL, /* Restricted during device attach */
+	.owner			= THIS_MODULE,
 };
 
 static void arm_smmu_device_reset(struct arm_smmu_device *smmu)
@@ -1960,8 +1985,10 @@ static int arm_smmu_device_dt_probe(struct platform_device *pdev,
 
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
@@ -1995,7 +2022,6 @@ static int arm_smmu_bus_init(struct iommu_ops *ops)
 #endif
 #ifdef CONFIG_PCI
 	if (!iommu_present(&pci_bus_type)) {
-		pci_request_acs();
 		err = bus_set_iommu(&pci_bus_type, ops);
 		if (err)
 			goto err_reset_amba_ops;
@@ -2173,20 +2199,6 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
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
-		return arm_smmu_bus_init(&arm_smmu_ops);
-	return 0;
-}
-device_initcall_sync(arm_smmu_legacy_bus_init);
-
 static int arm_smmu_device_remove(struct platform_device *pdev)
 {
 	struct arm_smmu_device *smmu = platform_get_drvdata(pdev);
-- 
2.24.0.432.g9d3f5f5b63-goog

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
