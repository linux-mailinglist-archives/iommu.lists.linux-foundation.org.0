Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 772414C8FF7
	for <lists.iommu@lfdr.de>; Tue,  1 Mar 2022 17:15:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 903024154F;
	Tue,  1 Mar 2022 16:15:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BQrrGz0D6a_t; Tue,  1 Mar 2022 16:15:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 7F8D14151F;
	Tue,  1 Mar 2022 16:15:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 616E0C007B;
	Tue,  1 Mar 2022 16:15:45 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 16650C007B
 for <iommu@lists.linux-foundation.org>; Tue,  1 Mar 2022 16:15:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DCE0860E56
 for <iommu@lists.linux-foundation.org>; Tue,  1 Mar 2022 16:15:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kapsi.fi
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WlJrQdcG0zia for <iommu@lists.linux-foundation.org>;
 Tue,  1 Mar 2022 16:15:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0376960E65
 for <iommu@lists.linux-foundation.org>; Tue,  1 Mar 2022 16:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SOhCWnsi2t3D4LR/n4Y2cxYT8gNTWo6B/sYLLWbarWo=; b=ry96fM4P0DbDps0nXx+7kN0lsK
 SEheXJV/7qe1CsqlvLm/jUgoVQJGHO7vA8zlkuWWyiBDeSovU9D8T2w8+SrkA8Ab38BuMg1vqpemv
 2U7BbJbP6j8x74bKmgZLtFegmFH54mdFL23HlVWAPyRuu5BuO+4scr+zhQa1EONWi9udf5TfAVlY+
 PVumDecXngxzXdaYhu8CGdKU2TqFDly2FA7b1TDaLxXgcW/c6wUNrA4fx0imolqVj617Z9tpEzacE
 FLEhVZ9V6Q/JwXk//mXgEEUgnrMyfcUi3NwdBrxTRaz+0fBSu8Grj4WWMjQIdwjqcGNu5bAqnfGWt
 dCqaEkKg==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70]
 helo=toshino.localdomain)
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <cyndis@kapsi.fi>)
 id 1nP59r-0003Z8-3Y; Tue, 01 Mar 2022 18:15:27 +0200
From: cyndis@kapsi.fi
To: thierry.reding@gmail.com, jonathanh@nvidia.com, joro@8bytes.org,
 will@kernel.org, robin.murphy@arm.com, robh+dt@kernel.org,
 krzysztof.kozlowski@canonical.com
Subject: [PATCH v4 6/9] arm64: tegra: Add Host1x context stream IDs on
 Tegra186+
Date: Tue,  1 Mar 2022 18:14:52 +0200
Message-Id: <20220301161455.4037062-7-cyndis@kapsi.fi>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220301161455.4037062-1-cyndis@kapsi.fi>
References: <20220301161455.4037062-1-cyndis@kapsi.fi>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 91.158.25.70
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>,
 iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

From: Mikko Perttunen <mperttunen@nvidia.com>

Add Host1x context stream IDs on systems that support Host1x context
isolation. Host1x and attached engines can use these stream IDs to
allow isolation between memory used by different processes.

The specified stream IDs must match those configured by the hypervisor,
if one is present.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
v2:
* Added context devices on T194.
* Use iommu-map instead of custom property.
v4:
* Remove memory-contexts subnode.
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 11 +++++++++++
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 11 +++++++++++
 2 files changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index c91afff1b757..1b71cba0df06 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -1406,6 +1406,17 @@ host1x@13e00000 {
 
 		iommus = <&smmu TEGRA186_SID_HOST1X>;
 
+		/* Context isolation domains */
+		iommu-map = <
+			0 &smmu TEGRA186_SID_HOST1X_CTX0 1
+			1 &smmu TEGRA186_SID_HOST1X_CTX1 1
+			2 &smmu TEGRA186_SID_HOST1X_CTX2 1
+			3 &smmu TEGRA186_SID_HOST1X_CTX3 1
+			4 &smmu TEGRA186_SID_HOST1X_CTX4 1
+			5 &smmu TEGRA186_SID_HOST1X_CTX5 1
+			6 &smmu TEGRA186_SID_HOST1X_CTX6 1
+			7 &smmu TEGRA186_SID_HOST1X_CTX7 1>;
+
 		dpaux1: dpaux@15040000 {
 			compatible = "nvidia,tegra186-dpaux";
 			reg = <0x15040000 0x10000>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 2d48c3715fc6..eb0d2ba89cb1 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -1686,6 +1686,17 @@ host1x@13e00000 {
 			interconnect-names = "dma-mem";
 			iommus = <&smmu TEGRA194_SID_HOST1X>;
 
+			/* Context isolation domains */
+			iommu-map = <
+				0 &smmu TEGRA194_SID_HOST1X_CTX0 1
+				1 &smmu TEGRA194_SID_HOST1X_CTX1 1
+				2 &smmu TEGRA194_SID_HOST1X_CTX2 1
+				3 &smmu TEGRA194_SID_HOST1X_CTX3 1
+				4 &smmu TEGRA194_SID_HOST1X_CTX4 1
+				5 &smmu TEGRA194_SID_HOST1X_CTX5 1
+				6 &smmu TEGRA194_SID_HOST1X_CTX6 1
+				7 &smmu TEGRA194_SID_HOST1X_CTX7 1>;
+
 			nvdec@15140000 {
 				compatible = "nvidia,tegra194-nvdec";
 				reg = <0x15140000 0x00040000>;
-- 
2.35.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
