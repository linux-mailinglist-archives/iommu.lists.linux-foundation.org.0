Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 241AA6602B
	for <lists.iommu@lfdr.de>; Thu, 11 Jul 2019 21:48:01 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 25D4A54D2;
	Thu, 11 Jul 2019 19:47:54 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A2AF94C31
	for <iommu@lists.linux-foundation.org>;
	Thu, 11 Jul 2019 15:09:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
	[217.70.183.198])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 15DCB896
	for <iommu@lists.linux-foundation.org>;
	Thu, 11 Jul 2019 15:09:27 +0000 (UTC)
X-Originating-IP: 92.137.69.152
Received: from localhost (alyon-656-1-672-152.w92-137.abo.wanadoo.fr
	[92.137.69.152]) (Authenticated sender: gregory.clement@bootlin.com)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 6B866C000A;
	Thu, 11 Jul 2019 15:09:24 +0000 (UTC)
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org
Subject: [PATCH v2 4/4] arm64: dts: marvell: armada-ap806: add smmu support
Date: Thu, 11 Jul 2019 17:02:42 +0200
Message-Id: <20190711150242.25290-5-gregory.clement@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190711150242.25290-1-gregory.clement@bootlin.com>
References: <20190711150242.25290-1-gregory.clement@bootlin.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Mailman-Approved-At: Thu, 11 Jul 2019 19:37:36 +0000
Cc: devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>,
	Andrew Lunn <andrew@lunn.ch>, Antoine Tenart <antoine.tenart@bootlin.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Will Deacon <will.deacon@arm.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Nadav Haklai <nadavh@marvell.com>, Rob Herring <robh+dt@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	=?UTF-8?q?Miqu=C3=A8l=20Raynal?= <miquel.raynal@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
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

Add IOMMU node for Marvell AP806 based SoCs.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 arch/arm64/boot/dts/marvell/armada-ap806.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/marvell/armada-ap806.dtsi b/arch/arm64/boot/dts/marvell/armada-ap806.dtsi
index 91dad7e4ee59..8e29d593970a 100644
--- a/arch/arm64/boot/dts/marvell/armada-ap806.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-ap806.dtsi
@@ -115,6 +115,23 @@
 				interrupts = <17>;
 			};
 
+			smmu: iommu@5000000 {
+				compatible = "marvell,mmu-500";
+				reg = <0x100000 0x100000>;
+				dma-coherent;
+				#iommu-cells = <1>;
+				#global-interrupts = <1>;
+				interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
+					    <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
+					    <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
+					    <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
+					    <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
+					    <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
+					    <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
+					    <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
+					    <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
 			odmi: odmi@300000 {
 				compatible = "marvell,odmi-controller";
 				interrupt-controller;
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
