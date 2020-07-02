Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id E4AAF212DF7
	for <lists.iommu@lfdr.de>; Thu,  2 Jul 2020 22:42:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9951F88180;
	Thu,  2 Jul 2020 20:42:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1HxhYZKvp5Bt; Thu,  2 Jul 2020 20:42:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 34C6488427;
	Thu,  2 Jul 2020 20:42:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 22772C0733;
	Thu,  2 Jul 2020 20:42:56 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AE2BBC0733
 for <iommu@lists.linux-foundation.org>; Thu,  2 Jul 2020 20:42:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 90A9B20496
 for <iommu@lists.linux-foundation.org>; Thu,  2 Jul 2020 20:42:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qyXBbzXvsKqY for <iommu@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 20:42:53 +0000 (UTC)
X-Greylist: delayed 00:25:54 by SQLgrey-1.7.6
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by silver.osuosl.org (Postfix) with ESMTPS id 3A3F920380
 for <iommu@lists.linux-foundation.org>; Thu,  2 Jul 2020 20:42:53 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id o4so17037237lfi.7
 for <iommu@lists.linux-foundation.org>; Thu, 02 Jul 2020 13:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=semihalf-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=gzH+omRURB7g5dnoNMP6PMHslLf/Y7F/kj6XzNA/QUw=;
 b=mGVQsM1OHmkNMuQKfEJYsFI5quyzsuJsFTAUZWJ/6KyBegagF4WknJv8hivqEbilbd
 0iqCOMqN0lqbLtp6iy0H6LpC2Me+ocoD+Q2lm7mfie7rwf/yhiPBDkl60nOiuIs9/1JV
 Q6l/zKH9YBlnHxcV2R6Bp/FhIh+Jimc5V+21skqNt29/8oNAgjYRHEGBxLqlUdG9NsiB
 842yg9EimH7LtQKfGIM2EptqxVipxSrbMkoYSSiRpUsZEUPtdud1fFvHZ6ex+csGIwai
 TaKVOpdNjWEhMuAaqmf+XoPlc45UO6X/u9lb8TRI3aUJgBeA2CGOhduk3EnpZsnB1vc2
 8/zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=gzH+omRURB7g5dnoNMP6PMHslLf/Y7F/kj6XzNA/QUw=;
 b=XVVZiv2vDoWoGydjWZV+GqxrVYJ93TleIozO669ai2FUkw/1FRaHIG8h8bJUNdx//J
 f3cZ9NQPAvCO55oGkv08lR2zxUMJMY9iZPdumY7r6pIUHbYzPdIpKOCR+o1RWx8DRTL2
 BQHiicLNNZLUvP3lS8GUR95b/JGjWc3JnpN4GGOS7ShX4nYpbDhrEDkqjHhxs8dZxedA
 ufJrJp1rg1RLIZ46aBjSj0RjkziOfnWYxVHHrKI4biseX6AqQVlUlpDj2AQBhRnnvxSC
 RBO0ZxpEGUwxn5+Kx4s/WT9QiIkQ7gb6ABQPWGIzZpy40xy/OymVPD7yHsUBoP7Sy43X
 vE1Q==
X-Gm-Message-State: AOAM533ERVI948AGyS6PgNaYRizGMH6aEJThkUG3+E46lWM0jl3qs6qN
 PGc/uyrSNnCEe7jAYQX2/1EmKkdATks=
X-Google-Smtp-Source: ABdhPJyAEBFVxmo+Nfl2SUUNGRJI1G7JcT5WyW5G2pp8pha1D7djhhHUEvpahtR9RO3iOMUzRApxJg==
X-Received: by 2002:a2e:98d0:: with SMTP id s16mr7703772ljj.457.1593721024303; 
 Thu, 02 Jul 2020 13:17:04 -0700 (PDT)
Received: from localhost.localdomain ([83.68.95.66])
 by smtp.gmail.com with ESMTPSA id y2sm3320372lji.8.2020.07.02.13.17.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 13:17:03 -0700 (PDT)
From: Tomasz Nowicki <tn@semihalf.com>
To: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
 gregory.clement@bootlin.com, robh+dt@kernel.org, hannah@marvell.com
Subject: [PATCH v3 4/4] arm64: dts: marvell: add SMMU support
Date: Thu,  2 Jul 2020 22:16:33 +0200
Message-Id: <20200702201633.22693-5-tn@semihalf.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200702201633.22693-1-tn@semihalf.com>
References: <20200702201633.22693-1-tn@semihalf.com>
Cc: devicetree@vger.kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, nadavh@marvell.com,
 iommu@lists.linux-foundation.org, mw@semihalf.com,
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

From: Marcin Wojtas <mw@semihalf.com>

Add IOMMU node for Marvell AP806 based SoCs together with platform
and PCI device Stream ID mapping.

Signed-off-by: Marcin Wojtas <mw@semihalf.com>
Signed-off-by: Tomasz Nowicki <tn@semihalf.com>
---
 arch/arm64/boot/dts/marvell/armada-8040.dtsi  | 36 +++++++++++++++++++
 arch/arm64/boot/dts/marvell/armada-ap80x.dtsi | 17 +++++++++
 2 files changed, 53 insertions(+)

diff --git a/arch/arm64/boot/dts/marvell/armada-8040.dtsi b/arch/arm64/boot/dts/marvell/armada-8040.dtsi
index 7699b19224c2..25c1df709f72 100644
--- a/arch/arm64/boot/dts/marvell/armada-8040.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-8040.dtsi
@@ -23,3 +23,39 @@
 &cp0_rtc {
 	status = "disabled";
 };
+
+&cp0_usb3_0 {
+	iommus = <&smmu 0x440>;
+};
+
+&cp0_usb3_1 {
+	iommus = <&smmu 0x441>;
+};
+
+&cp0_sata0 {
+	iommus = <&smmu 0x444>;
+};
+
+&cp0_sdhci0 {
+	iommus = <&smmu 0x445>;
+};
+
+&cp1_sata0 {
+	iommus = <&smmu 0x454>;
+};
+
+&cp1_usb3_0 {
+	iommus = <&smmu 0x450>;
+};
+
+&cp1_usb3_1 {
+	iommus = <&smmu 0x451>;
+};
+
+&cp0_pcie0 {
+	iommu-map =
+		<0x0   &smmu 0x480 0x20>,
+		<0x100 &smmu 0x4a0 0x20>,
+		<0x200 &smmu 0x4c0 0x20>;
+	iommu-map-mask = <0x031f>;
+};
diff --git a/arch/arm64/boot/dts/marvell/armada-ap80x.dtsi b/arch/arm64/boot/dts/marvell/armada-ap80x.dtsi
index 7f9b9a647717..ded8b8082d79 100644
--- a/arch/arm64/boot/dts/marvell/armada-ap80x.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-ap80x.dtsi
@@ -56,6 +56,23 @@
 			compatible = "simple-bus";
 			ranges = <0x0 0x0 0xf0000000 0x1000000>;
 
+			smmu: iommu@5000000 {
+				compatible = "marvell,ap806-smmu-500", "arm,mmu-500";
+				reg = <0x100000 0x100000>;
+				dma-coherent;
+				#iommu-cells = <1>;
+				#global-interrupts = <1>;
+				interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
 			gic: interrupt-controller@210000 {
 				compatible = "arm,gic-400";
 				#interrupt-cells = <3>;
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
