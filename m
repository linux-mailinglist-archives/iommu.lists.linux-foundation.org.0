Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5351A4FB586
	for <lists.iommu@lfdr.de>; Mon, 11 Apr 2022 10:01:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6CD484093B;
	Mon, 11 Apr 2022 08:01:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rQ-DrySrbJAA; Mon, 11 Apr 2022 08:01:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 3FE7A40931;
	Mon, 11 Apr 2022 08:01:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0279DC002C;
	Mon, 11 Apr 2022 08:01:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C40FEC002C
 for <iommu@lists.linux-foundation.org>; Mon, 11 Apr 2022 07:02:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BBB7341515
 for <iommu@lists.linux-foundation.org>; Mon, 11 Apr 2022 07:02:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=quicinc.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gtLO5HOfeNEJ for <iommu@lists.linux-foundation.org>;
 Mon, 11 Apr 2022 07:02:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 025264150F
 for <iommu@lists.linux-foundation.org>; Mon, 11 Apr 2022 07:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1649660539; x=1681196539;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=+KRMi56LVuC86kOFkBF4O8ESf02mAw9nnU+hNYWAH/Y=;
 b=t/WM7mNv3ilHX0yTB7vyfnEaDN92M0ZPhyNVTLSdsMAHWnd3G/5hp7BH
 3b9CIAm5Y0sQEnBED7Br3OKQBGuq0zSIEKHkd9C4+nUTK2yfmMQ6z7+UR
 H0E3+sz4GTni1XpGr2+Ww8Nkp65GtpyCj9WvtFn49imW5+aicbMCbhL8Q s=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 10 Apr 2022 23:56:16 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 10 Apr 2022 23:56:15 -0700
X-QCInternal: smtphost
Received: from hu-rohiagar-hyd.qualcomm.com (HELO
 hu-sgudaval-hyd.qualcomm.com) ([10.213.106.138])
 by ironmsg01-blr.qualcomm.com with ESMTP; 11 Apr 2022 12:25:53 +0530
Received: by hu-sgudaval-hyd.qualcomm.com (Postfix, from userid 3970568)
 id 3509B3AA2; Mon, 11 Apr 2022 12:25:52 +0530 (+0530)
From: Rohit Agarwal <quic_rohiagar@quicinc.com>
To: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, robh+dt@kernel.org,
 krzk+dt@kernel.org, ulf.hansson@linaro.org, agross@kernel.org,
 bjorn.andersson@linaro.org
Subject: [PATCH 3/7] ARM: dts: qcom: sdx65: Add support for SDHCI controller
Date: Mon, 11 Apr 2022 12:25:39 +0530
Message-Id: <1649660143-22400-4-git-send-email-quic_rohiagar@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1649660143-22400-1-git-send-email-quic_rohiagar@quicinc.com>
References: <1649660143-22400-1-git-send-email-quic_rohiagar@quicinc.com>
X-Mailman-Approved-At: Mon, 11 Apr 2022 08:01:02 +0000
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Rohit Agarwal <quic_rohiagar@quicinc.com>,
 linux-arm-kernel@lists.infradead.org
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

Add devicetree support for SDHCI controller found in Qualcomm SDX65
platform. The SDHCI controller is based on the MSM SDHCI v5 IP.

Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>
---
 arch/arm/boot/dts/qcom-sdx65.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-sdx65.dtsi b/arch/arm/boot/dts/qcom-sdx65.dtsi
index 365df74..632ac78 100644
--- a/arch/arm/boot/dts/qcom-sdx65.dtsi
+++ b/arch/arm/boot/dts/qcom-sdx65.dtsi
@@ -168,6 +168,19 @@
 			#interrupt-cells = <2>;
 		};
 
+		sdhc_1: sdhci@8804000 {
+			compatible = "qcom,sdx65-sdhci", "qcom,sdhci-msm-v5";
+			reg = <0x08804000 0x1000>;
+			reg-names = "hc_mem";
+			interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hc_irq", "pwr_irq";
+			clocks = <&gcc GCC_SDCC1_APPS_CLK>,
+				<&gcc GCC_SDCC1_AHB_CLK>;
+			clock-names = "core", "iface";
+			status = "disabled";
+		};
+
 		pdc: interrupt-controller@b210000 {
 			compatible = "qcom,sdx65-pdc", "qcom,pdc";
 			reg = <0xb210000 0x10000>;
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
