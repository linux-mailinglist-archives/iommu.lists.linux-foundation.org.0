Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A599DA80
	for <lists.iommu@lfdr.de>; Tue, 27 Aug 2019 02:15:35 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id ADBFBB09;
	Tue, 27 Aug 2019 00:15:30 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C6E8B7F6
	for <iommu@lists.linux-foundation.org>;
	Tue, 27 Aug 2019 00:15:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 656C4887
	for <iommu@lists.linux-foundation.org>;
	Tue, 27 Aug 2019 00:15:28 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7R0FDbd125373;
	Mon, 26 Aug 2019 19:15:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1566864914;
	bh=mnHv973q0dOpbd7f75qTbhxIJ1t6I0awvec5sSakySk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=AUdAaUMNLb2enSgGlL1aHDDa98aWN1S1YSu41FGXNtFbw4JNNbSKABbfJWwZxDzTz
	O4ZwYaABz5ZEeO+EuP3fKM0gcNZpZgqa6C1qMl3UF9d09LmDn4X+YpG0RW2xedYtt5
	Gt4+DvjZlC2hMD9a9SSozZMAY8EMxIHkZgWVfca4=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7R0FDPx020478
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 26 Aug 2019 19:15:13 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 26 Aug 2019 19:15:13 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 26 Aug 2019 19:15:13 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7R0FDLX005041;
	Mon, 26 Aug 2019 19:15:13 -0500
Received: from localhost (irmo.dhcp.ti.com [128.247.58.153])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	x7R0FCZ19052; Mon, 26 Aug 2019 19:15:12 -0500 (CDT)
To: Tony Lindgren <tony@atomide.com>
Subject: [PATCH 1/2] ARM: OMAP2+: Plug in device_enable/idle ops for IOMMUs
Date: Mon, 26 Aug 2019 19:14:51 -0500
Message-ID: <20190827001452.31930-2-s-anna@ti.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190827001452.31930-1-s-anna@ti.com>
References: <20190827001452.31930-1-s-anna@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Tero Kristo <t-kristo@ti.com>, iommu@lists.linux-foundation.org,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-omap@vger.kernel.org
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
From: Suman Anna via iommu <iommu@lists.linux-foundation.org>
Reply-To: Suman Anna <s-anna@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

The OMAP IOMMU driver requires the device_enable/idle platform
data ops on all the IOMMU devices to be able to enable and disable
the clocks after commit db8918f61d51 ("iommu/omap: streamline
enable/disable through runtime pm callbacks"). Plug in these
pdata ops for all the existing IOMMUs through pdata quirks to
maintain functionality.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 arch/arm/mach-omap2/pdata-quirks.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/mach-omap2/pdata-quirks.c b/arch/arm/mach-omap2/pdata-quirks.c
index 6c6f8fce854e..dbe8d9718f70 100644
--- a/arch/arm/mach-omap2/pdata-quirks.c
+++ b/arch/arm/mach-omap2/pdata-quirks.c
@@ -89,6 +89,8 @@ static struct iommu_platform_data omap3_iommu_pdata = {
 	.reset_name = "mmu",
 	.assert_reset = omap_device_assert_hardreset,
 	.deassert_reset = omap_device_deassert_hardreset,
+	.device_enable = omap_device_enable,
+	.device_idle = omap_device_idle,
 };
 
 static int omap3_sbc_t3730_twl_callback(struct device *dev,
@@ -424,6 +426,8 @@ static struct iommu_platform_data omap4_iommu_pdata = {
 	.reset_name = "mmu_cache",
 	.assert_reset = omap_device_assert_hardreset,
 	.deassert_reset = omap_device_deassert_hardreset,
+	.device_enable = omap_device_enable,
+	.device_idle = omap_device_idle,
 };
 #endif
 
-- 
2.22.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
