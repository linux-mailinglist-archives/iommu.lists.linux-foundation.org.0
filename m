Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id C12F62B9964
	for <lists.iommu@lfdr.de>; Thu, 19 Nov 2020 18:42:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 79B9F204E7;
	Thu, 19 Nov 2020 17:42:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fRLaUM0soFj6; Thu, 19 Nov 2020 17:42:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 33EC920479;
	Thu, 19 Nov 2020 17:42:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 20E85C0891;
	Thu, 19 Nov 2020 17:42:00 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 06817C0891
 for <iommu@lists.linux-foundation.org>; Thu, 19 Nov 2020 17:41:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id DBD0B204E7
 for <iommu@lists.linux-foundation.org>; Thu, 19 Nov 2020 17:41:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1ltBquye5Ob6 for <iommu@lists.linux-foundation.org>;
 Thu, 19 Nov 2020 17:41:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by silver.osuosl.org (Postfix) with ESMTPS id 0EC9F20479
 for <iommu@lists.linux-foundation.org>; Thu, 19 Nov 2020 17:41:57 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id w24so7526892wmi.0
 for <iommu@lists.linux-foundation.org>; Thu, 19 Nov 2020 09:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HQUWOoiI6bOe1ETVFAiJ1IEFbDftrIAgtdBtSTmelXk=;
 b=fIUybtb1nU6ankjCHjGK13flZBoSmWxeNcYR3umeGKa8rkF8WtCF3RUAUCEkpPUv6i
 5DMnG+emCAsYHKIRn18Ehg4OOf41Z1Vmwiou8UEQyqKiSXNYkwymJX8Vt0iu93s5E2p1
 BniebEK8dmA/DjvmvRLMelr1ru4ZV6vNZZZ32AkCrwZHOvRyDCiLH0KnXDf4TskzW9XX
 QEokgl6aEUjjfWtk/3JjwjecJgY6KusqD+T9lP+sQ4GL1/J6ggPCPn2kJeoFH8+Dm6Cr
 fohDVSFgPbJhzh7whI2l+/5Anijrg+20U+zEhVWb/JyCxAP5SdOQhjsJd+xksIEjvMw9
 iMSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HQUWOoiI6bOe1ETVFAiJ1IEFbDftrIAgtdBtSTmelXk=;
 b=VHZcMrO7ASWUtcGdavZBA3n+p4EZLfo3yqyi2McfXnu5Trlu6JLgWdrXljdkOyRETc
 IfJTPU+scI3EizFrFL8rShZLG3p9aWs2T6VHatwQ3YBbgSnauLjjMJiOSzrD91H0DANI
 NpYlkK2S7w7D4v9D3ZDsaM6mvotTca0w/MyzQ9a2qr7ivQ3NLLiWXFAXP4LbQDRldJLz
 kN5CmnmhF6JBDI+oo18q573btFX7LQLClYeAa90jtppiPs9ro/ulVHdo/6f6uqJspwiH
 h/c5sSnzZjlsihjSTMVP/bhN/5qerh4sUERZXjOmFK8Yh4qIYGIOlfn43S9G4xcU2d/Y
 eZKQ==
X-Gm-Message-State: AOAM533F8AGECBEyxzNtYzdCkqflIJgq5RPz+9DEMKaf80uH4C80FMUF
 VDzzy3xPFV3KfaL4luSm5EM=
X-Google-Smtp-Source: ABdhPJx+jRgKtyN8Y1m4R3VDH+IPYoG5JkZJ1TrKW9qYXOAStroq9C1EkBuNHT7gJs4mPv/UzKN8Cg==
X-Received: by 2002:a1c:328a:: with SMTP id y132mr5634984wmy.134.1605807715410; 
 Thu, 19 Nov 2020 09:41:55 -0800 (PST)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id v16sm998812wml.33.2020.11.19.09.41.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 09:41:54 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] Revert "firmware: QCOM_SCM: Allow qcom_scm driver to be
 loadable as a permenent module"
Date: Thu, 19 Nov 2020 18:41:49 +0100
Message-Id: <20201119174149.3860883-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Cc: Will Deacon <will@kernel.org>, iommu@lists.linux-foundation.org,
 John Stultz <john.stultz@linaro.org>, linux-gpio@vger.kernel.org,
 Jon Hunter <jonathanh@nvidia.com>
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

From: Thierry Reding <treding@nvidia.com>

Commit d0511b5496c0 ("firmware: QCOM_SCM: Allow qcom_scm driver to be
loadable as a permenent module") causes the ARM SMMU driver to be built
as a loadable module when using the Aarch64 default configuration. This
in turn causes problems because if the loadable module is not shipped
in an initial ramdisk, then the deferred probe timeout mechanism will
cause all SMMU masters to probe without SMMU support and fall back to
just plain DMA ops (not IOMMU-backed).

Once the system has mounted the rootfs, the ARM SMMU driver will then
be loaded, but since the ARM SMMU driver faults by default, this causes
a slew of SMMU faults for the SMMU masters that have already been set
up with plain DMA ops and cause these devices to malfunction.

Revert that commit to unbreak things while we look for an alternative
solution.

Reported-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/firmware/Kconfig                | 4 ++--
 drivers/firmware/Makefile               | 3 +--
 drivers/firmware/qcom_scm.c             | 4 ----
 drivers/iommu/Kconfig                   | 2 --
 drivers/net/wireless/ath/ath10k/Kconfig | 1 -
 5 files changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
index 5e369928bc56..3315e3c21586 100644
--- a/drivers/firmware/Kconfig
+++ b/drivers/firmware/Kconfig
@@ -235,8 +235,8 @@ config INTEL_STRATIX10_RSU
 	  Say Y here if you want Intel RSU support.
 
 config QCOM_SCM
-	tristate "Qcom SCM driver"
-	depends on (ARM && HAVE_ARM_SMCCC) || ARM64
+	bool
+	depends on ARM || ARM64
 	select RESET_CONTROLLER
 
 config QCOM_SCM_DOWNLOAD_MODE_DEFAULT
diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
index 523173cbff33..5e013b6a3692 100644
--- a/drivers/firmware/Makefile
+++ b/drivers/firmware/Makefile
@@ -17,8 +17,7 @@ obj-$(CONFIG_ISCSI_IBFT)	+= iscsi_ibft.o
 obj-$(CONFIG_FIRMWARE_MEMMAP)	+= memmap.o
 obj-$(CONFIG_RASPBERRYPI_FIRMWARE) += raspberrypi.o
 obj-$(CONFIG_FW_CFG_SYSFS)	+= qemu_fw_cfg.o
-obj-$(CONFIG_QCOM_SCM)		+= qcom-scm.o
-qcom-scm-objs += qcom_scm.o qcom_scm-smc.o qcom_scm-legacy.o
+obj-$(CONFIG_QCOM_SCM)		+= qcom_scm.o qcom_scm-smc.o qcom_scm-legacy.o
 obj-$(CONFIG_TI_SCI_PROTOCOL)	+= ti_sci.o
 obj-$(CONFIG_TRUSTED_FOUNDATIONS) += trusted_foundations.o
 obj-$(CONFIG_TURRIS_MOX_RWTM)	+= turris-mox-rwtm.o
diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
index 6f431b73e617..7be48c1bec96 100644
--- a/drivers/firmware/qcom_scm.c
+++ b/drivers/firmware/qcom_scm.c
@@ -1280,7 +1280,6 @@ static const struct of_device_id qcom_scm_dt_match[] = {
 	{ .compatible = "qcom,scm" },
 	{}
 };
-MODULE_DEVICE_TABLE(of, qcom_scm_dt_match);
 
 static struct platform_driver qcom_scm_driver = {
 	.driver = {
@@ -1296,6 +1295,3 @@ static int __init qcom_scm_init(void)
 	return platform_driver_register(&qcom_scm_driver);
 }
 subsys_initcall(qcom_scm_init);
-
-MODULE_DESCRIPTION("Qualcomm Technologies, Inc. SCM driver");
-MODULE_LICENSE("GPL v2");
diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index c64d7a2b6513..04878caf6da4 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -248,7 +248,6 @@ config SPAPR_TCE_IOMMU
 config ARM_SMMU
 	tristate "ARM Ltd. System MMU (SMMU) Support"
 	depends on ARM64 || ARM || (COMPILE_TEST && !GENERIC_ATOMIC64)
-	depends on QCOM_SCM || !QCOM_SCM #if QCOM_SCM=m this can't be =y
 	select IOMMU_API
 	select IOMMU_IO_PGTABLE_LPAE
 	select ARM_DMA_USE_IOMMU if ARM
@@ -376,7 +375,6 @@ config QCOM_IOMMU
 	# Note: iommu drivers cannot (yet?) be built as modules
 	bool "Qualcomm IOMMU Support"
 	depends on ARCH_QCOM || (COMPILE_TEST && !GENERIC_ATOMIC64)
-	depends on QCOM_SCM=y
 	select IOMMU_API
 	select IOMMU_IO_PGTABLE_LPAE
 	select ARM_DMA_USE_IOMMU
diff --git a/drivers/net/wireless/ath/ath10k/Kconfig b/drivers/net/wireless/ath/ath10k/Kconfig
index 741289e385d5..40f91bc8514d 100644
--- a/drivers/net/wireless/ath/ath10k/Kconfig
+++ b/drivers/net/wireless/ath/ath10k/Kconfig
@@ -44,7 +44,6 @@ config ATH10K_SNOC
 	tristate "Qualcomm ath10k SNOC support"
 	depends on ATH10K
 	depends on ARCH_QCOM || COMPILE_TEST
-	depends on QCOM_SCM || !QCOM_SCM #if QCOM_SCM=m this can't be =y
 	select QCOM_QMI_HELPERS
 	help
 	  This module adds support for integrated WCN3990 chip connected
-- 
2.29.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
