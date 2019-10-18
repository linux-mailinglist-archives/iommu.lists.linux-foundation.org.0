Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 594F6DD578
	for <lists.iommu@lfdr.de>; Sat, 19 Oct 2019 01:32:14 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id BA62ADD4;
	Fri, 18 Oct 2019 23:31:29 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D038EDB2
	for <iommu@lists.linux-foundation.org>;
	Fri, 18 Oct 2019 23:31:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 74EF75D3
	for <iommu@lists.linux-foundation.org>;
	Fri, 18 Oct 2019 23:31:24 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
	hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
	id <B5daa4b4e0003>; Fri, 18 Oct 2019 16:31:26 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
	by hqpgpgate101.nvidia.com (PGP Universal service);
	Fri, 18 Oct 2019 16:31:23 -0700
X-PGP-Universal: processed;
	by hqpgpgate101.nvidia.com on Fri, 18 Oct 2019 16:31:23 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL101.nvidia.com
	(172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Fri, 18 Oct 2019 23:31:23 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL109.nvidia.com
	(172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
	Frontend Transport; Fri, 18 Oct 2019 23:31:23 +0000
Received: from vdumpa-ubuntu.nvidia.com (Not Verified[172.17.173.140]) by
	hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
	id <B5daa4b4a000c>; Fri, 18 Oct 2019 16:31:23 -0700
From: Krishna Reddy <vdumpa@nvidia.com>
To: 
Subject: [PATCH v3 7/7] arm64: tegra: enable SMMU for SDHCI and EQOS on T194
Date: Fri, 18 Oct 2019 16:31:32 -0700
Message-ID: <1571441492-21919-8-git-send-email-vdumpa@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1571441492-21919-1-git-send-email-vdumpa@nvidia.com>
References: <1571441492-21919-1-git-send-email-vdumpa@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
	t=1571441486; bh=MK4nKTkYCuTB0cE4lZiJ4iSmYMFPWVXgkdIW4z/bGKU=;
	h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	In-Reply-To:References:X-NVConfidentiality:MIME-Version:
	Content-Type;
	b=HSkqgqO7zOqP3d9XwA9FV66OIwkU19u2JNMbyOZeFoFE87b8Hsxu4Hgcgy7PVZe3g
	7waCWNVQVegr+ruspdnysIrGafda1ZoXgBYIQVTN2rWvUp20CEUhQJ9M8V83+v8AwE
	+EyIyttojzNgww297qcj2LpVr+9sOgSUkmCgNviQmYUdwqPYEHW3Ek938yboLHcgA1
	GnrQbJ1SQ5o4cP/O3LJw1+SDHkTZGP3Hi8zk3trJ3pBg5wAbrt5HN6ddyMfSSR1ZvT
	3+bd5Woq4EaZNbdLYD6MPJFsmkkauaTGyaLCjFl0l07oyzz0nMLpklwTSe3jlCA5Sn
	WND5g4fMBNAPA==
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: snikam@nvidia.com, thomasz@nvidia.com, jtukkinen@nvidia.com,
	mperttunen@nvidia.com, will@kernel.org,
	linux-kernel@vger.kernel.org, praithatha@nvidia.com,
	talho@nvidia.com, iommu@lists.linux-foundation.org,
	nicolinc@nvidia.com, linux-tegra@vger.kernel.org,
	yhsu@nvidia.com, treding@nvidia.com, robin.murphy@arm.com,
	avanbrunt@nvidia.com, linux-arm-kernel@lists.infradead.org
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

Enable SMMU translations for SDHCI and EQOS transactions on T194.

Signed-off-by: Krishna Reddy <vdumpa@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 6f81e90..bf8ed7a 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -3,6 +3,7 @@
 #include <dt-bindings/gpio/tegra194-gpio.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/mailbox/tegra186-hsp.h>
+#include <dt-bindings/memory/tegra186-mc.h>
 #include <dt-bindings/pinctrl/pinctrl-tegra.h>
 #include <dt-bindings/power/tegra194-powergate.h>
 #include <dt-bindings/reset/tegra194-reset.h>
@@ -51,6 +52,7 @@
 			clock-names = "master_bus", "slave_bus", "rx", "tx", "ptp_ref";
 			resets = <&bpmp TEGRA194_RESET_EQOS>;
 			reset-names = "eqos";
+			iommus = <&smmu TEGRA186_SID_EQOS>;
 			status = "disabled";
 
 			snps,write-requests = <1>;
@@ -413,6 +415,7 @@
 			clock-names = "sdhci";
 			resets = <&bpmp TEGRA194_RESET_SDMMC1>;
 			reset-names = "sdhci";
+			iommus = <&smmu TEGRA186_SID_SDMMC1>;
 			nvidia,pad-autocal-pull-up-offset-3v3-timeout =
 									<0x07>;
 			nvidia,pad-autocal-pull-down-offset-3v3-timeout =
@@ -435,6 +438,7 @@
 			clock-names = "sdhci";
 			resets = <&bpmp TEGRA194_RESET_SDMMC3>;
 			reset-names = "sdhci";
+			iommus = <&smmu TEGRA186_SID_SDMMC3>;
 			nvidia,pad-autocal-pull-up-offset-1v8 = <0x00>;
 			nvidia,pad-autocal-pull-down-offset-1v8 = <0x7a>;
 			nvidia,pad-autocal-pull-up-offset-3v3-timeout = <0x07>;
@@ -462,6 +466,7 @@
 					  <&bpmp TEGRA194_CLK_PLLC4>;
 			resets = <&bpmp TEGRA194_RESET_SDMMC4>;
 			reset-names = "sdhci";
+			iommus = <&smmu TEGRA186_SID_SDMMC4>;
 			nvidia,pad-autocal-pull-up-offset-hs400 = <0x00>;
 			nvidia,pad-autocal-pull-down-offset-hs400 = <0x00>;
 			nvidia,pad-autocal-pull-up-offset-1v8-timeout = <0x0a>;
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
