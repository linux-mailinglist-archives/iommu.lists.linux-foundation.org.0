Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id B2426209765
	for <lists.iommu@lfdr.de>; Thu, 25 Jun 2020 02:10:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6D986879E9;
	Thu, 25 Jun 2020 00:10:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V2Or9KTvfj5m; Thu, 25 Jun 2020 00:10:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4864287AB6;
	Thu, 25 Jun 2020 00:10:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 41797C016F;
	Thu, 25 Jun 2020 00:10:54 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4172EC016F
 for <iommu@lists.linux-foundation.org>; Thu, 25 Jun 2020 00:10:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 04C6086B46
 for <iommu@lists.linux-foundation.org>; Thu, 25 Jun 2020 00:10:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OUXF4y1OpQQI for <iommu@lists.linux-foundation.org>;
 Thu, 25 Jun 2020 00:10:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 3746386277
 for <iommu@lists.linux-foundation.org>; Thu, 25 Jun 2020 00:10:49 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id bh7so1897718plb.11
 for <iommu@lists.linux-foundation.org>; Wed, 24 Jun 2020 17:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=wKxZHWXThmdwG5TzsbBZbCq86w+CMX62l9gqbYlj/xg=;
 b=Wq1vjX8Y/9dYjZiuQcJ/ZNMbmUtYy8AxZ80Pa21oizdUuFir8VgnsZkQ4JhrcyPmm0
 vpB1kJaBnDcSr4z+vVCDEi/xdpGSDfY2oN2Sv42lvFml0MA+hDu2koaaGs7CJjsGy05O
 neBXQAKmdtn7YajytCTGGIzlnEieKevNdZR7lyTIfVwfjoQo8EwqhYaWNbI8z7k2xU3O
 11GE2N7eZCz3Gv+Umj6kPnno9rxkCOzHbcEXglxNWsk1Zb5QqbFSn8tY+yphAYXKfZFb
 rnjZip4jEQSuKMBGp5rsP5lyHIV0HwVUtEIYX3s2bNb3jdPmAnzl4bE9rcAyyrjmqbdO
 nwqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=wKxZHWXThmdwG5TzsbBZbCq86w+CMX62l9gqbYlj/xg=;
 b=mRWDXRMY+1k3cpc5WHPa2iWoqsZgp1ebMf9yHmI/+moPrEA4l1Y8louktcgaJRPdrP
 l9RU3QnFrNYQNmJM2aHx/PP0cf8+Vtj7HWHQ1O0zynzjUSCaVF5VIf96/nwBMuMo53Xd
 ubAVI5+glybzsFfMhEkCaUlElszcdBjU6xDF+Ks+GPr7jW4AwU/5Ep+txUF8iJtA7IJx
 pZAgw2xp10hgtGGvicNzwr6XIFiFnpbAKygAew6SR90oClkyE/CYXYWn0udnFBBjOhIR
 c/8ZK9bEl91I+oqikWVN62LFjsv+0rxbEhW/4po22nfnT9RZkJcC+ZNayEhoPKQqlnGp
 tEqA==
X-Gm-Message-State: AOAM532qrJVhB6WCxbEqOok4j2vqubM53hJkM84cXmaoOehNwJz0Lr01
 i0b/Ww2WVEjrQrWy78VHyMjYWQ==
X-Google-Smtp-Source: ABdhPJymIBmCwAQtljjPiaUT73HauLgg3YsTyCkmm4i7eIzCr2/sbSrfulZFdAJs6Z5kNNgnbO6iQg==
X-Received: by 2002:a17:90a:f996:: with SMTP id
 cq22mr387159pjb.208.1593043848732; 
 Wed, 24 Jun 2020 17:10:48 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 n19sm17458671pgb.0.2020.06.24.17.10.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2020 17:10:48 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 4/5] pinctrl: qcom: Allow pinctrl-msm code to be loadable
 as a module
Date: Thu, 25 Jun 2020 00:10:38 +0000
Message-Id: <20200625001039.56174-5-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200625001039.56174-1-john.stultz@linaro.org>
References: <20200625001039.56174-1-john.stultz@linaro.org>
Cc: Maulik Shah <mkshah@codeaurora.org>, Jason Cooper <jason@lakedaemon.net>,
 Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>,
 Lina Iyer <ilina@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-gpio@vger.kernel.org, iommu@lists.linux-foundation.org,
 Andy Gross <agross@kernel.org>, John Stultz <john.stultz@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Linus Walleij <linus.walleij@linaro.org>,
 linux-arm-msm@vger.kernel.org, Todd Kjos <tkjos@google.com>
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

Tweaks to allow pinctrl-msm code to be loadable as a module.
This is needed in order to support having the qcom-scm driver,
which pinctrl-msm calls into, configured as a module.

This requires that we tweak Kconfigs selecting PINCTRL_MSM to
also depend on QCOM_SCM || QCOM_SCM=n so that we match the
module setting of QCOM_SCM.

Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Joerg Roedel <joro@8bytes.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Jason Cooper <jason@lakedaemon.net>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Maulik Shah <mkshah@codeaurora.org>
Cc: Lina Iyer <ilina@codeaurora.org>
Cc: Saravana Kannan <saravanak@google.com>
Cc: Todd Kjos <tkjos@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: iommu@lists.linux-foundation.org
Cc: linux-gpio@vger.kernel.org
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
v2:
* Module description and whitespace fixes suggested by Bjorn
* Added QCOM_SCM || QCOM_SCM=n bits on Kconfigs selecting
  PINCTRL_MSM. Reported by both Todd and Bjorn.
---
 drivers/pinctrl/qcom/Kconfig       | 24 +++++++++++++++++++++++-
 drivers/pinctrl/qcom/pinctrl-msm.c |  2 ++
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
index ff1ee159dca2..11228ae3d826 100644
--- a/drivers/pinctrl/qcom/Kconfig
+++ b/drivers/pinctrl/qcom/Kconfig
@@ -2,7 +2,7 @@
 if (ARCH_QCOM || COMPILE_TEST)
 
 config PINCTRL_MSM
-	bool
+	tristate
 	select PINMUX
 	select PINCONF
 	select GENERIC_PINCONF
@@ -11,6 +11,7 @@ config PINCTRL_MSM
 config PINCTRL_APQ8064
 	tristate "Qualcomm APQ8064 pin controller driver"
 	depends on GPIOLIB && OF
+	depends on QCOM_SCM || !QCOM_SCM
 	select PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -19,6 +20,7 @@ config PINCTRL_APQ8064
 config PINCTRL_APQ8084
 	tristate "Qualcomm APQ8084 pin controller driver"
 	depends on GPIOLIB && OF
+	depends on QCOM_SCM || !QCOM_SCM
 	select PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -27,6 +29,7 @@ config PINCTRL_APQ8084
 config PINCTRL_IPQ4019
 	tristate "Qualcomm IPQ4019 pin controller driver"
 	depends on GPIOLIB && OF
+	depends on QCOM_SCM || !QCOM_SCM
 	select PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -35,6 +38,7 @@ config PINCTRL_IPQ4019
 config PINCTRL_IPQ8064
 	tristate "Qualcomm IPQ8064 pin controller driver"
 	depends on GPIOLIB && OF
+	depends on QCOM_SCM || !QCOM_SCM
 	select PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -43,6 +47,7 @@ config PINCTRL_IPQ8064
 config PINCTRL_IPQ8074
 	tristate "Qualcomm Technologies, Inc. IPQ8074 pin controller driver"
 	depends on GPIOLIB && OF
+	depends on QCOM_SCM || !QCOM_SCM
 	select PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for
@@ -53,6 +58,7 @@ config PINCTRL_IPQ8074
 config PINCTRL_IPQ6018
 	tristate "Qualcomm Technologies, Inc. IPQ6018 pin controller driver"
 	depends on GPIOLIB && OF
+	depends on QCOM_SCM || !QCOM_SCM
 	select PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for
@@ -63,6 +69,7 @@ config PINCTRL_IPQ6018
 config PINCTRL_MSM8660
 	tristate "Qualcomm 8660 pin controller driver"
 	depends on GPIOLIB && OF
+	depends on QCOM_SCM || !QCOM_SCM
 	select PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -71,6 +78,7 @@ config PINCTRL_MSM8660
 config PINCTRL_MSM8960
 	tristate "Qualcomm 8960 pin controller driver"
 	depends on GPIOLIB && OF
+	depends on QCOM_SCM || !QCOM_SCM
 	select PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -79,6 +87,7 @@ config PINCTRL_MSM8960
 config PINCTRL_MDM9615
 	tristate "Qualcomm 9615 pin controller driver"
 	depends on GPIOLIB && OF
+	depends on QCOM_SCM || !QCOM_SCM
 	select PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -87,6 +96,7 @@ config PINCTRL_MDM9615
 config PINCTRL_MSM8X74
 	tristate "Qualcomm 8x74 pin controller driver"
 	depends on GPIOLIB && OF
+	depends on QCOM_SCM || !QCOM_SCM
 	select PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -95,6 +105,7 @@ config PINCTRL_MSM8X74
 config PINCTRL_MSM8916
 	tristate "Qualcomm 8916 pin controller driver"
 	depends on GPIOLIB && OF
+	depends on QCOM_SCM || !QCOM_SCM
 	select PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -103,6 +114,7 @@ config PINCTRL_MSM8916
 config PINCTRL_MSM8976
 	tristate "Qualcomm 8976 pin controller driver"
 	depends on GPIOLIB && OF
+	depends on QCOM_SCM || !QCOM_SCM
 	select PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -113,6 +125,7 @@ config PINCTRL_MSM8976
 config PINCTRL_MSM8994
 	tristate "Qualcomm 8994 pin controller driver"
 	depends on GPIOLIB && OF
+	depends on QCOM_SCM || !QCOM_SCM
 	select PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -122,6 +135,7 @@ config PINCTRL_MSM8994
 config PINCTRL_MSM8996
 	tristate "Qualcomm MSM8996 pin controller driver"
 	depends on GPIOLIB && OF
+	depends on QCOM_SCM || !QCOM_SCM
 	select PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -130,6 +144,7 @@ config PINCTRL_MSM8996
 config PINCTRL_MSM8998
 	tristate "Qualcomm MSM8998 pin controller driver"
 	depends on GPIOLIB && OF
+	depends on QCOM_SCM || !QCOM_SCM
 	select PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -138,6 +153,7 @@ config PINCTRL_MSM8998
 config PINCTRL_QCS404
 	tristate "Qualcomm QCS404 pin controller driver"
 	depends on GPIOLIB && OF
+	depends on QCOM_SCM || !QCOM_SCM
 	select PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -146,6 +162,7 @@ config PINCTRL_QCS404
 config PINCTRL_QDF2XXX
 	tristate "Qualcomm Technologies QDF2xxx pin controller driver"
 	depends on GPIOLIB && ACPI
+	depends on QCOM_SCM || !QCOM_SCM
 	select PINCTRL_MSM
 	help
 	  This is the GPIO driver for the TLMM block found on the
@@ -183,6 +200,7 @@ config PINCTRL_QCOM_SSBI_PMIC
 config PINCTRL_SC7180
 	tristate "Qualcomm Technologies Inc SC7180 pin controller driver"
 	depends on GPIOLIB && OF
+	depends on QCOM_SCM || !QCOM_SCM
 	select PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -192,6 +210,7 @@ config PINCTRL_SC7180
 config PINCTRL_SDM660
 	tristate "Qualcomm Technologies Inc SDM660 pin controller driver"
 	depends on GPIOLIB && OF
+	depends on QCOM_SCM || !QCOM_SCM
 	select PINCTRL_MSM
 	help
 	 This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -201,6 +220,7 @@ config PINCTRL_SDM660
 config PINCTRL_SDM845
 	tristate "Qualcomm Technologies Inc SDM845 pin controller driver"
 	depends on GPIOLIB && (OF || ACPI)
+	depends on QCOM_SCM || !QCOM_SCM
 	select PINCTRL_MSM
 	help
 	 This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -210,6 +230,7 @@ config PINCTRL_SDM845
 config PINCTRL_SM8150
 	tristate "Qualcomm Technologies Inc SM8150 pin controller driver"
 	depends on GPIOLIB && OF
+	depends on QCOM_SCM || !QCOM_SCM
 	select PINCTRL_MSM
 	help
 	 This is the pinctrl, pinmux, pinconf and gpiolib driver for the
@@ -219,6 +240,7 @@ config PINCTRL_SM8150
 config PINCTRL_SM8250
 	tristate "Qualcomm Technologies Inc SM8250 pin controller driver"
 	depends on GPIOLIB && OF
+	depends on QCOM_SCM || !QCOM_SCM
 	select PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 83b7d64bc4c1..e8e3ba8207af 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -1355,3 +1355,5 @@ int msm_pinctrl_remove(struct platform_device *pdev)
 }
 EXPORT_SYMBOL(msm_pinctrl_remove);
 
+MODULE_DESCRIPTION("Qualcomm Technologies, Inc. TLMM driver");
+MODULE_LICENSE("GPL v2");
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
