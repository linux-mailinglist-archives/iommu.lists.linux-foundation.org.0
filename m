Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBAB3BE23E
	for <lists.iommu@lfdr.de>; Wed,  7 Jul 2021 06:53:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C173F401C4;
	Wed,  7 Jul 2021 04:53:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F36fPE5KqVp5; Wed,  7 Jul 2021 04:53:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 996DD40121;
	Wed,  7 Jul 2021 04:53:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6550AC001F;
	Wed,  7 Jul 2021 04:53:27 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B0897C000E
 for <iommu@lists.linux-foundation.org>; Wed,  7 Jul 2021 04:53:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9EE2B401C4
 for <iommu@lists.linux-foundation.org>; Wed,  7 Jul 2021 04:53:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IZsZLmnDMOeb for <iommu@lists.linux-foundation.org>;
 Wed,  7 Jul 2021 04:53:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A88A440121
 for <iommu@lists.linux-foundation.org>; Wed,  7 Jul 2021 04:53:24 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id a14so387381pls.4
 for <iommu@lists.linux-foundation.org>; Tue, 06 Jul 2021 21:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=b7KlGzb3TmhwFXRRdHyMSPZ+oFfClo2RvfzkKVOqRIE=;
 b=MR+Kh5re0say7uKj97Qo57vfgE0O45SK2VtGHoqBLcjZIoJBtIbISX5W5hIIx8H3lY
 dRn/Ne8zsaSC/gcCsbbERFe8wzQD84ABydKcNPOFSql3Wfutz7zQ85mpl8GvGTNBwSPf
 uHZL72RK2shnnvQo8K9MQ4qZuPG2WtZylcn8e7yPND67iLpwMUs2LXLeHjRq/2A9k/xv
 5nErrKmdNJsJUPZSR1DBJbsSRGzw1FkPNAuXMtPGP0fS5dseuE+wu6fif8M7QiBgb8J/
 S1D1B4piuUY3yvWjqnNhLTpGVsKZ1utJ7FhmlIhwcWHZIhwWDctcaEuH2CFcqLUBaNFF
 SnyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=b7KlGzb3TmhwFXRRdHyMSPZ+oFfClo2RvfzkKVOqRIE=;
 b=H31SAtx1Hq9+5yXAh9w7hHsfTGj/pl3z2wwb3iVpVWuJVHfnr54UlWlgyclmmgTYNu
 zD6SU/zVVoVUyHrRDgP+P5vztyRm/xFqekPrFcEPtJ2MzDi/I40ScV2w67EJP0Z+QsG5
 beZvkQQaVJfNUPuuRHZa+8QPSk9Aqt6LB5AjEvcIHQK/y2K4dMlnicbnlqdg+vBC9egz
 rvwbeuVSGidLubljzGpaPyGzl0fnEiVJCEHEKzedQQLQjKqhlaXfAOxF8QZitwmsH7f4
 zYAZeZQ52H6zDUsj3MWnUSL+l9tcD4FTso1oZfjhdTDBIM21qYROqsSrIZwdhPMA6XO8
 dkfw==
X-Gm-Message-State: AOAM532JiSBHFPi6QdQGDWo6TRc3s9y1vYJ+PSzhXwEKG9LE6hwn86eB
 TVk6mhkyjf9WAwLugnUBNH6kSw==
X-Google-Smtp-Source: ABdhPJxmfXN0Zq6/BLURJHxCQrZ6A0dwbe0zi7IiRX2YuJNASsDDixB+OSWdXdmuZwA0cc4XIX+mgQ==
X-Received: by 2002:a17:90b:1403:: with SMTP id
 jo3mr4164988pjb.160.1625633604031; 
 Tue, 06 Jul 2021 21:53:24 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 t185sm14007101pfc.1.2021.07.06.21.53.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 21:53:23 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH] firmware: QCOM_SCM: Allow qcom_scm driver to be loadable as a
 permenent module
Date: Wed,  7 Jul 2021 04:53:20 +0000
Message-Id: <20210707045320.529186-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Maulik Shah <mkshah@codeaurora.org>, Saravana Kannan <saravanak@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Catalin Marinas <catalin.marinas@arm.com>, iommu@lists.linux-foundation.org,
 linux-gpio@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Andy Gross <agross@kernel.org>, John Stultz <john.stultz@linaro.org>,
 Marc Zyngier <maz@kernel.org>, linux-arm-msm@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Kalle Valo <kvalo@codeaurora.org>,
 Todd Kjos <tkjos@google.com>
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

Allow the qcom_scm driver to be loadable as a permenent module.

This still uses the "depends on QCOM_SCM || !QCOM_SCM" bit to
ensure that drivers that call into the qcom_scm driver are
also built as modules. While not ideal in some cases its the
only safe way I can find to avoid build errors without having
those drivers select QCOM_SCM and have to force it on (as
QCOM_SCM=n can be valid for those drivers).

Reviving this now that Saravana's fw_devlink defaults to on,
which should avoid loading troubles seen before.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Joerg Roedel <joro@8bytes.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: Kalle Valo <kvalo@codeaurora.org>
Cc: Maulik Shah <mkshah@codeaurora.org>
Cc: Saravana Kannan <saravanak@google.com>
Cc: Todd Kjos <tkjos@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: iommu@lists.linux-foundation.org
Cc: linux-gpio@vger.kernel.org
Acked-by: Kalle Valo <kvalo@codeaurora.org>
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Acked-by: Will Deacon <will@kernel.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
v3:
* Fix __arm_smccc_smc build issue reported by
  kernel test robot <lkp@intel.com>
v4:
* Add "depends on QCOM_SCM || !QCOM_SCM" bit to ath10k
  config that requires it.
v5:
* Fix QCOM_QCM typo in Kconfig, it should be QCOM_SCM
---
 drivers/firmware/Kconfig                | 2 +-
 drivers/firmware/Makefile               | 3 ++-
 drivers/firmware/qcom_scm.c             | 4 ++++
 drivers/iommu/Kconfig                   | 2 ++
 drivers/net/wireless/ath/ath10k/Kconfig | 1 +
 5 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
index db0ea2d2d75a..af53778edc7e 100644
--- a/drivers/firmware/Kconfig
+++ b/drivers/firmware/Kconfig
@@ -235,7 +235,7 @@ config INTEL_STRATIX10_RSU
 	  Say Y here if you want Intel RSU support.
 
 config QCOM_SCM
-	bool
+	tristate "Qcom SCM driver"
 	depends on ARM || ARM64
 	depends on HAVE_ARM_SMCCC
 	select RESET_CONTROLLER
diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
index 5e013b6a3692..523173cbff33 100644
--- a/drivers/firmware/Makefile
+++ b/drivers/firmware/Makefile
@@ -17,7 +17,8 @@ obj-$(CONFIG_ISCSI_IBFT)	+= iscsi_ibft.o
 obj-$(CONFIG_FIRMWARE_MEMMAP)	+= memmap.o
 obj-$(CONFIG_RASPBERRYPI_FIRMWARE) += raspberrypi.o
 obj-$(CONFIG_FW_CFG_SYSFS)	+= qemu_fw_cfg.o
-obj-$(CONFIG_QCOM_SCM)		+= qcom_scm.o qcom_scm-smc.o qcom_scm-legacy.o
+obj-$(CONFIG_QCOM_SCM)		+= qcom-scm.o
+qcom-scm-objs += qcom_scm.o qcom_scm-smc.o qcom_scm-legacy.o
 obj-$(CONFIG_TI_SCI_PROTOCOL)	+= ti_sci.o
 obj-$(CONFIG_TRUSTED_FOUNDATIONS) += trusted_foundations.o
 obj-$(CONFIG_TURRIS_MOX_RWTM)	+= turris-mox-rwtm.o
diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
index ee9cb545e73b..bb9ce3f92931 100644
--- a/drivers/firmware/qcom_scm.c
+++ b/drivers/firmware/qcom_scm.c
@@ -1296,6 +1296,7 @@ static const struct of_device_id qcom_scm_dt_match[] = {
 	{ .compatible = "qcom,scm" },
 	{}
 };
+MODULE_DEVICE_TABLE(of, qcom_scm_dt_match);
 
 static struct platform_driver qcom_scm_driver = {
 	.driver = {
@@ -1312,3 +1313,6 @@ static int __init qcom_scm_init(void)
 	return platform_driver_register(&qcom_scm_driver);
 }
 subsys_initcall(qcom_scm_init);
+
+MODULE_DESCRIPTION("Qualcomm Technologies, Inc. SCM driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index 07b7c25cbed8..f61516c17589 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -253,6 +253,7 @@ config SPAPR_TCE_IOMMU
 config ARM_SMMU
 	tristate "ARM Ltd. System MMU (SMMU) Support"
 	depends on ARM64 || ARM || (COMPILE_TEST && !GENERIC_ATOMIC64)
+	depends on QCOM_SCM || !QCOM_SCM #if QCOM_SCM=m this can't be =y
 	select IOMMU_API
 	select IOMMU_IO_PGTABLE_LPAE
 	select ARM_DMA_USE_IOMMU if ARM
@@ -382,6 +383,7 @@ config QCOM_IOMMU
 	# Note: iommu drivers cannot (yet?) be built as modules
 	bool "Qualcomm IOMMU Support"
 	depends on ARCH_QCOM || (COMPILE_TEST && !GENERIC_ATOMIC64)
+	depends on QCOM_SCM=y
 	select IOMMU_API
 	select IOMMU_IO_PGTABLE_LPAE
 	select ARM_DMA_USE_IOMMU
diff --git a/drivers/net/wireless/ath/ath10k/Kconfig b/drivers/net/wireless/ath/ath10k/Kconfig
index 40f91bc8514d..741289e385d5 100644
--- a/drivers/net/wireless/ath/ath10k/Kconfig
+++ b/drivers/net/wireless/ath/ath10k/Kconfig
@@ -44,6 +44,7 @@ config ATH10K_SNOC
 	tristate "Qualcomm ath10k SNOC support"
 	depends on ATH10K
 	depends on ARCH_QCOM || COMPILE_TEST
+	depends on QCOM_SCM || !QCOM_SCM #if QCOM_SCM=m this can't be =y
 	select QCOM_QMI_HELPERS
 	help
 	  This module adds support for integrated WCN3990 chip connected
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
