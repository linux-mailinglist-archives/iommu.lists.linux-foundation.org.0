Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 205F61783FB
	for <lists.iommu@lfdr.de>; Tue,  3 Mar 2020 21:28:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id CCD5286749;
	Tue,  3 Mar 2020 20:28:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rs-22bcqGi3P; Tue,  3 Mar 2020 20:28:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6315586788;
	Tue,  3 Mar 2020 20:28:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 50ADCC013E;
	Tue,  3 Mar 2020 20:28:05 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8C3A4C013E
 for <iommu@lists.linux-foundation.org>; Tue,  3 Mar 2020 20:28:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7BF2C8704A
 for <iommu@lists.linux-foundation.org>; Tue,  3 Mar 2020 20:28:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x7RdbC2EPxRo for <iommu@lists.linux-foundation.org>;
 Tue,  3 Mar 2020 20:28:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id DDE7D87541
 for <iommu@lists.linux-foundation.org>; Tue,  3 Mar 2020 20:28:02 +0000 (UTC)
Received: from localhost.localdomain (unknown [194.230.155.125])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5EC54214D8;
 Tue,  3 Mar 2020 20:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583267282;
 bh=oYZc5mRrLdXWissZPEz+IDkoB4nsZeRxMo6j9CXYSoc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=D6zNorFDnS/4lfRzfFnjBIimLJ0Pbe5haM/dorwLpuBv2bQL4ULQfHzXt4VdMx6Nb
 00qcyoISlDdlqqxkI4dqwIa7EySUoPkXlNXTPEP3QxNyfWE5tg8B7o1GB8mUGQtWCE
 jjzmL3PkaPxiUCAicWeivda8uRIliC+MBZG47vHY=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Joerg Roedel <joro@8bytes.org>, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org
Subject: [RESEND PATCH 4/4] iommu: Enable compile testing for some of drivers
Date: Tue,  3 Mar 2020 21:27:51 +0100
Message-Id: <20200303202751.5153-4-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200303202751.5153-1-krzk@kernel.org>
References: <20200303202751.5153-1-krzk@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Some of the IOMMU drivers can be compile tested to increase build
coverage.  The OMAP, Rockchip and Exynos drivers use
device.dev_archdata.iommu field which does not exist on all platforms.
The sPAPR TCE and ARM SMMU have also restrictions where they can be
built.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/iommu/Kconfig | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index c5df570ef84a..9eb9e16eb620 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -273,7 +273,7 @@ config IRQ_REMAP
 # OMAP IOMMU support
 config OMAP_IOMMU
 	bool "OMAP IOMMU Support"
-	depends on ARM && MMU
+	depends on ARM && MMU || (COMPILE_TEST && (ARM || ARM64 || IA64 || SPARC))
 	depends on ARCH_OMAP2PLUS || COMPILE_TEST
 	select IOMMU_API
 	---help---
@@ -291,7 +291,7 @@ config OMAP_IOMMU_DEBUG
 
 config ROCKCHIP_IOMMU
 	bool "Rockchip IOMMU Support"
-	depends on ARM || ARM64
+	depends on ARM || ARM64 || (COMPILE_TEST && (ARM64 || IA64 || SPARC))
 	depends on ARCH_ROCKCHIP || COMPILE_TEST
 	select IOMMU_API
 	select ARM_DMA_USE_IOMMU
@@ -325,7 +325,7 @@ config TEGRA_IOMMU_SMMU
 
 config EXYNOS_IOMMU
 	bool "Exynos IOMMU Support"
-	depends on ARCH_EXYNOS && MMU
+	depends on ARCH_EXYNOS && MMU || (COMPILE_TEST && (ARM || ARM64 || IA64 || SPARC))
 	depends on !CPU_BIG_ENDIAN # revisit driver if we can enable big-endian ptes
 	select IOMMU_API
 	select ARM_DMA_USE_IOMMU
@@ -361,7 +361,7 @@ config IPMMU_VMSA
 
 config SPAPR_TCE_IOMMU
 	bool "sPAPR TCE IOMMU Support"
-	depends on PPC_POWERNV || PPC_PSERIES
+	depends on PPC_POWERNV || PPC_PSERIES || (PPC && COMPILE_TEST)
 	select IOMMU_API
 	help
 	  Enables bits of IOMMU API required by VFIO. The iommu_ops
@@ -370,7 +370,7 @@ config SPAPR_TCE_IOMMU
 # ARM IOMMU support
 config ARM_SMMU
 	tristate "ARM Ltd. System MMU (SMMU) Support"
-	depends on (ARM64 || ARM) && MMU
+	depends on (ARM64 || ARM || (COMPILE_TEST && !GENERIC_ATOMIC64)) && MMU
 	select IOMMU_API
 	select IOMMU_IO_PGTABLE_LPAE
 	select ARM_DMA_USE_IOMMU if ARM
@@ -440,7 +440,7 @@ config S390_IOMMU
 
 config S390_CCW_IOMMU
 	bool "S390 CCW IOMMU Support"
-	depends on S390 && CCW
+	depends on S390 && CCW || COMPILE_TEST
 	select IOMMU_API
 	help
 	  Enables bits of IOMMU API required by VFIO. The iommu_ops
@@ -448,7 +448,7 @@ config S390_CCW_IOMMU
 
 config S390_AP_IOMMU
 	bool "S390 AP IOMMU Support"
-	depends on S390 && ZCRYPT
+	depends on S390 && ZCRYPT || COMPILE_TEST
 	select IOMMU_API
 	help
 	  Enables bits of IOMMU API required by VFIO. The iommu_ops
@@ -456,7 +456,7 @@ config S390_AP_IOMMU
 
 config MTK_IOMMU
 	bool "MTK IOMMU Support"
-	depends on ARM || ARM64
+	depends on ARM || ARM64 || COMPILE_TEST
 	depends on ARCH_MEDIATEK || COMPILE_TEST
 	select ARM_DMA_USE_IOMMU
 	select IOMMU_API
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
