Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EEE1213D2D
	for <lists.iommu@lfdr.de>; Fri,  3 Jul 2020 18:03:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B917E88D95;
	Fri,  3 Jul 2020 16:03:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S8XPkw3hE1Ic; Fri,  3 Jul 2020 16:03:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9937188CBB;
	Fri,  3 Jul 2020 16:03:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7E468C08A8;
	Fri,  3 Jul 2020 16:03:29 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 35F8FC0733
 for <iommu@lists.linux-foundation.org>; Fri,  3 Jul 2020 16:03:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2246D88D7B
 for <iommu@lists.linux-foundation.org>; Fri,  3 Jul 2020 16:03:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5gimXYkrCwBk for <iommu@lists.linux-foundation.org>;
 Fri,  3 Jul 2020 16:03:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by whitealder.osuosl.org (Postfix) with ESMTP id 14EF588AE0
 for <iommu@lists.linux-foundation.org>; Fri,  3 Jul 2020 16:03:26 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 55DE731B;
 Fri,  3 Jul 2020 09:03:26 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com
 [10.1.196.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BB3123F73C;
 Fri,  3 Jul 2020 09:03:25 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: joro@8bytes.org
Subject: [PATCH 1/2] iommu: Tidy up Kconfig for SoC IOMMUs
Date: Fri,  3 Jul 2020 17:03:19 +0100
Message-Id: <7fb9c74dc6bd12a4619ca44c92408e91352f1be0.1593791968.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.23.0.dirty
MIME-Version: 1.0
Cc: iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org
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

Wacky COMPILE_TEST dependencies based on who used to define
dev_archdata.iommu can go.

Dependencies on ARM or ARM64 already implied by the ARCH_* platform
selection can go.

The entire IOMMU_SUPPORT menu already depends on MMU, so those can go.

IOMMU_DMA is for the architecture's DMA API implementation to choose,
and its interface to IOMMU drivers is properly stubbed out if disabled,
so dependencies on or selections of that can go (AMD_IOMMU is the
current exception since the x86 drivers have to provide their own entire
dma_map_ops implementation).

Since commit ed6ccf10f24b ("dma-mapping: properly stub out the DMA API
for !CONFIG_HAS_DMA"), drivers which simply use the dma-mapping API
should not need to depend on HAS_DMA, so those can go.

And a long-dead option for code removed from the MSM driver 4 years ago
can also go.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---

Based on the current iommu/next branch.

 drivers/iommu/Kconfig | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index b0f308cb7f7c..4dcd85bbff99 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -128,10 +128,6 @@ config MSM_IOMMU
 
 	  If unsure, say N here.
 
-config IOMMU_PGTABLES_L2
-	def_bool y
-	depends on MSM_IOMMU && MMU && SMP && CPU_DCACHE_DISABLE=n
-
 # AMD IOMMU support
 config AMD_IOMMU
 	bool "AMD IOMMU support"
@@ -274,7 +270,6 @@ config IRQ_REMAP
 # OMAP IOMMU support
 config OMAP_IOMMU
 	bool "OMAP IOMMU Support"
-	depends on ARM && MMU || (COMPILE_TEST && (ARM || ARM64 || IA64 || SPARC))
 	depends on ARCH_OMAP2PLUS || COMPILE_TEST
 	select IOMMU_API
 	help
@@ -292,7 +287,6 @@ config OMAP_IOMMU_DEBUG
 
 config ROCKCHIP_IOMMU
 	bool "Rockchip IOMMU Support"
-	depends on ARM || ARM64 || (COMPILE_TEST && (ARM64 || IA64 || SPARC))
 	depends on ARCH_ROCKCHIP || COMPILE_TEST
 	select IOMMU_API
 	select ARM_DMA_USE_IOMMU
@@ -305,11 +299,9 @@ config ROCKCHIP_IOMMU
 
 config SUN50I_IOMMU
 	bool "Allwinner H6 IOMMU Support"
-	depends on HAS_DMA
 	depends on ARCH_SUNXI || COMPILE_TEST
 	select ARM_DMA_USE_IOMMU
 	select IOMMU_API
-	select IOMMU_DMA
 	help
 	  Support for the IOMMU introduced in the Allwinner H6 SoCs.
 
@@ -336,7 +328,7 @@ config TEGRA_IOMMU_SMMU
 
 config EXYNOS_IOMMU
 	bool "Exynos IOMMU Support"
-	depends on ARCH_EXYNOS && MMU || (COMPILE_TEST && (ARM || ARM64 || IA64 || SPARC))
+	depends on ARCH_EXYNOS || COMPILE_TEST
 	depends on !CPU_BIG_ENDIAN # revisit driver if we can enable big-endian ptes
 	select IOMMU_API
 	select ARM_DMA_USE_IOMMU
@@ -359,7 +351,7 @@ config EXYNOS_IOMMU_DEBUG
 
 config IPMMU_VMSA
 	bool "Renesas VMSA-compatible IPMMU"
-	depends on ARM || IOMMU_DMA
+	depends on ARM || ARM64
 	depends on ARCH_RENESAS || (COMPILE_TEST && !GENERIC_ATOMIC64)
 	select IOMMU_API
 	select IOMMU_IO_PGTABLE_LPAE
@@ -381,7 +373,7 @@ config SPAPR_TCE_IOMMU
 # ARM IOMMU support
 config ARM_SMMU
 	tristate "ARM Ltd. System MMU (SMMU) Support"
-	depends on (ARM64 || ARM || (COMPILE_TEST && !GENERIC_ATOMIC64)) && MMU
+	depends on ARM64 || ARM || (COMPILE_TEST && !GENERIC_ATOMIC64)
 	select IOMMU_API
 	select IOMMU_IO_PGTABLE_LPAE
 	select ARM_DMA_USE_IOMMU if ARM
@@ -467,11 +459,9 @@ config S390_AP_IOMMU
 
 config MTK_IOMMU
 	bool "MTK IOMMU Support"
-	depends on HAS_DMA
 	depends on ARCH_MEDIATEK || COMPILE_TEST
 	select ARM_DMA_USE_IOMMU
 	select IOMMU_API
-	select IOMMU_DMA
 	select IOMMU_IO_PGTABLE_ARMV7S
 	select MEMORY
 	select MTK_SMI

base-commit: e5640f21b63d2a5d3e4e0c4111b2b38e99fe5164
-- 
2.23.0.dirty

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
