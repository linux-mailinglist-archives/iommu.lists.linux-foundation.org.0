Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A56368247
	for <lists.iommu@lfdr.de>; Thu, 22 Apr 2021 16:16:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19AB140629;
	Thu, 22 Apr 2021 14:16:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NRK-Sh7r5QJr; Thu, 22 Apr 2021 14:16:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB88A406A6;
	Thu, 22 Apr 2021 14:16:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 44519C0028;
	Thu, 22 Apr 2021 14:16:18 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8791FC000B
 for <iommu@lists.linux-foundation.org>; Thu, 22 Apr 2021 14:16:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6165C405B0
 for <iommu@lists.linux-foundation.org>; Thu, 22 Apr 2021 14:16:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kC1vYt86KmDk for <iommu@lists.linux-foundation.org>;
 Thu, 22 Apr 2021 14:16:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9778B405E6
 for <iommu@lists.linux-foundation.org>; Thu, 22 Apr 2021 14:16:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: benjamin.gaignard)
 with ESMTPSA id C3E161F4326A
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: joro@8bytes.org, will@kernel.org, robh+dt@kernel.org, heiko@sntech.de,
 xxm@rock-chips.com
Subject: [PATCH v2 3/4] ARM: dts: rockchip: rk322x: Fix iommu-cells properties
 name
Date: Thu, 22 Apr 2021 16:16:01 +0200
Message-Id: <20210422141602.350746-4-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210422141602.350746-1-benjamin.gaignard@collabora.com>
References: <20210422141602.350746-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 iommu@lists.linux-foundation.org, kernel@collabora.com,
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

Add '#" to iommu-cells properties

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 arch/arm/boot/dts/rk322x.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/rk322x.dtsi b/arch/arm/boot/dts/rk322x.dtsi
index a4dd50aaf3fc..8af2e9288029 100644
--- a/arch/arm/boot/dts/rk322x.dtsi
+++ b/arch/arm/boot/dts/rk322x.dtsi
@@ -564,7 +564,7 @@ vpu_mmu: iommu@20020800 {
 		interrupt-names = "vpu_mmu";
 		clocks = <&cru ACLK_VPU>, <&cru HCLK_VPU>;
 		clock-names = "aclk", "iface";
-		iommu-cells = <0>;
+		#iommu-cells = <0>;
 		status = "disabled";
 	};
 
@@ -575,7 +575,7 @@ vdec_mmu: iommu@20030480 {
 		interrupt-names = "vdec_mmu";
 		clocks = <&cru ACLK_RKVDEC>, <&cru HCLK_RKVDEC>;
 		clock-names = "aclk", "iface";
-		iommu-cells = <0>;
+		#iommu-cells = <0>;
 		status = "disabled";
 	};
 
@@ -629,7 +629,7 @@ iep_mmu: iommu@20070800 {
 		interrupt-names = "iep_mmu";
 		clocks = <&cru ACLK_IEP>, <&cru HCLK_IEP>;
 		clock-names = "aclk", "iface";
-		iommu-cells = <0>;
+		#iommu-cells = <0>;
 		status = "disabled";
 	};
 
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
