Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C673A2A30
	for <lists.iommu@lfdr.de>; Fri, 30 Aug 2019 00:47:54 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id DA13459E6;
	Thu, 29 Aug 2019 22:47:19 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id EAF5659B7
	for <iommu@lists.linux-foundation.org>;
	Thu, 29 Aug 2019 22:45:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 5CC418A2
	for <iommu@lists.linux-foundation.org>;
	Thu, 29 Aug 2019 22:45:43 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
	hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
	id <B5d6855970001>; Thu, 29 Aug 2019 15:45:43 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
	by hqpgpgate102.nvidia.com (PGP Universal service);
	Thu, 29 Aug 2019 15:45:43 -0700
X-PGP-Universal: processed;
	by hqpgpgate102.nvidia.com on Thu, 29 Aug 2019 15:45:43 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL105.nvidia.com
	(172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Thu, 29 Aug 2019 22:45:42 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL107.nvidia.com
	(172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
	Frontend Transport; Thu, 29 Aug 2019 22:45:42 +0000
Received: from vdumpa-ubuntu.nvidia.com (Not Verified[172.17.173.140]) by
	hqnvemgw02.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
	id <B5d6855960006>; Thu, 29 Aug 2019 15:45:42 -0700
From: Krishna Reddy <vdumpa@nvidia.com>
To: 
Subject: [PATCH 5/7] arm64: tegra: Add Memory controller DT node on T194
Date: Thu, 29 Aug 2019 15:47:05 -0700
Message-ID: <1567118827-26358-6-git-send-email-vdumpa@nvidia.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1567118827-26358-1-git-send-email-vdumpa@nvidia.com>
References: <1567118827-26358-1-git-send-email-vdumpa@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
	t=1567118743; bh=eBq8+pmSZ4GEOeaq+B+bPoC14S2kYmqdfA9PyT31IhY=;
	h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	In-Reply-To:References:X-NVConfidentiality:MIME-Version:
	Content-Type;
	b=ChPGfFaDq2kV5w2ayQQp9zljYQ5CcUlIYDR+iUDDoU72wHFTKpYJwD4ojEzKEiGfG
	Zu3qdafuGFdosA6xh6PO+nWaU4uBXcOtO/KzJGNkdaEDoUr3bFevEXiOIarEZl4R0w
	VCKmsbSPJr8jEdDcnLqd9tsQtEPwn78nTedzPekDYhcrGc83TO32MfSDoqdXhNfcef
	SW3QnC2NYZHLFt1xAVENOQlbKrTjHfmPyf2n41wGUzGsJZgHfYKgQCr7m0Ulfcgbjo
	Gr8isIZC2Dct1ZhYS4/UfwDdpHrEWhgepsJCgXuq671/tsTpxzOCHi4m5jPwjiycGU
	a4GMYV3i4vbIw==
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: snikam@nvidia.com, thomasz@nvidia.com, jtukkinen@nvidia.com,
	mperttunen@nvidia.com, praithatha@nvidia.com,
	iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
	talho@nvidia.com, yhsu@nvidia.com, linux-tegra@vger.kernel.org,
	treding@nvidia.com, avanbrunt@nvidia.com,
	linux-arm-kernel@lists.infradead.org
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

Add Memory controller DT node on T194 and enable it.
This patch is a prerequisite for SMMU enable on T194.

Signed-off-by: Krishna Reddy <vdumpa@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi | 4 ++++
 arch/arm64/boot/dts/nvidia/tegra194.dtsi       | 7 +++++++
 2 files changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
index 62e07e11..4b3441b 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
@@ -47,6 +47,10 @@
 			};
 		};
 
+		memory-controller@2c00000 {
+			status = "okay";
+		};
+
 		serial@3110000 {
 			status = "okay";
 		};
diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index adebbbf..d906958 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/reset/tegra194-reset.h>
 #include <dt-bindings/power/tegra194-powergate.h>
 #include <dt-bindings/thermal/tegra194-bpmp-thermal.h>
+#include <dt-bindings/memory/tegra186-mc.h>
 
 / {
 	compatible = "nvidia,tegra194";
@@ -130,6 +131,12 @@
 			};
 		};
 
+		memory-controller@2c00000 {
+			compatible = "nvidia,tegra186-mc";
+			reg = <0x02c00000 0xb0000>;
+			status = "disabled";
+		};
+
 		uarta: serial@3100000 {
 			compatible = "nvidia,tegra194-uart", "nvidia,tegra20-uart";
 			reg = <0x03100000 0x40>;
-- 
2.1.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
