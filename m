Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E622117C6
	for <lists.iommu@lfdr.de>; Thu,  2 Jul 2020 03:26:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id D0DE08B23A;
	Thu,  2 Jul 2020 01:25:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OIlSGSEJNVLe; Thu,  2 Jul 2020 01:25:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 031DF8B244;
	Thu,  2 Jul 2020 01:25:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DD997C0733;
	Thu,  2 Jul 2020 01:25:58 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 23EDEC0733
 for <iommu@lists.linux-foundation.org>; Thu,  2 Jul 2020 01:25:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 0D5AA89319
 for <iommu@lists.linux-foundation.org>; Thu,  2 Jul 2020 01:25:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TvWikI1L_wzD for <iommu@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 01:25:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 7112289317
 for <iommu@lists.linux-foundation.org>; Thu,  2 Jul 2020 01:25:56 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 48CF820748;
 Thu,  2 Jul 2020 01:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593653156;
 bh=b44jm7P6vI+Zkeiv9QWrWNQ5os3dfh9gfK08ciXU9CA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=0KBGq8gq4fvW3te89WnQ0EaVBENOu6njvSWT8isUV85MuQQd+tnsM8aQM7KdrrE/+
 TFMONJjxDCZZMNdqP0kaChJytxeDgKIa8LGKc9OVlmAZKAau+FbSKmiry/TX0y9V7Q
 j0greQhXU5nNe5wJnr37k5GxGUfJI5kwzm4YT1aU=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 25/40] iommu/vt-d: Don't apply gfx quirks to
 untrusted devices
Date: Wed,  1 Jul 2020 21:23:46 -0400
Message-Id: <20200702012402.2701121-25-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200702012402.2701121-1-sashal@kernel.org>
References: <20200702012402.2701121-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, Joerg Roedel <jroedel@suse.de>,
 Ashok Raj <ashok.raj@intel.com>, iommu@lists.linux-foundation.org,
 Rajat Jain <rajatja@google.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
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

From: Rajat Jain <rajatja@google.com>

[ Upstream commit 67e8a5b18d41af9298db5c17193f671f235cce01 ]

Currently, an external malicious PCI device can masquerade the VID:PID
of faulty gfx devices, and thus apply iommu quirks to effectively
disable the IOMMU restrictions for itself.

Thus we need to ensure that the device we are applying quirks to, is
indeed an internal trusted device.

Signed-off-by: Rajat Jain <rajatja@google.com>
Reviewed-by: Ashok Raj <ashok.raj@intel.com>
Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Acked-by: Lu Baolu <baolu.lu@linux.intel.com>
Link: https://lore.kernel.org/r/20200622231345.29722-4-baolu.lu@linux.intel.com
Signed-off-by: Joerg Roedel <jroedel@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/iommu/intel-iommu.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
index 773ac2b0d6068..4e91036cf5636 100644
--- a/drivers/iommu/intel-iommu.c
+++ b/drivers/iommu/intel-iommu.c
@@ -5955,6 +5955,23 @@ static bool intel_iommu_is_attach_deferred(struct iommu_domain *domain,
 	return dev->archdata.iommu == DEFER_DEVICE_DOMAIN_INFO;
 }
 
+/*
+ * Check that the device does not live on an external facing PCI port that is
+ * marked as untrusted. Such devices should not be able to apply quirks and
+ * thus not be able to bypass the IOMMU restrictions.
+ */
+static bool risky_device(struct pci_dev *pdev)
+{
+	if (pdev->untrusted) {
+		pci_info(pdev,
+			 "Skipping IOMMU quirk for dev [%04X:%04X] on untrusted PCI link\n",
+			 pdev->vendor, pdev->device);
+		pci_info(pdev, "Please check with your BIOS/Platform vendor about this\n");
+		return true;
+	}
+	return false;
+}
+
 const struct iommu_ops intel_iommu_ops = {
 	.capable		= intel_iommu_capable,
 	.domain_alloc		= intel_iommu_domain_alloc,
@@ -5983,6 +6000,9 @@ const struct iommu_ops intel_iommu_ops = {
 
 static void quirk_iommu_igfx(struct pci_dev *dev)
 {
+	if (risky_device(dev))
+		return;
+
 	pci_info(dev, "Disabling IOMMU for graphics on this chipset\n");
 	dmar_map_gfx = 0;
 }
@@ -6024,6 +6044,9 @@ DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0x163D, quirk_iommu_igfx);
 
 static void quirk_iommu_rwbf(struct pci_dev *dev)
 {
+	if (risky_device(dev))
+		return;
+
 	/*
 	 * Mobile 4 Series Chipset neglects to set RWBF capability,
 	 * but needs it. Same seems to hold for the desktop versions.
@@ -6054,6 +6077,9 @@ static void quirk_calpella_no_shadow_gtt(struct pci_dev *dev)
 {
 	unsigned short ggc;
 
+	if (risky_device(dev))
+		return;
+
 	if (pci_read_config_word(dev, GGC, &ggc))
 		return;
 
@@ -6087,6 +6113,12 @@ static void __init check_tylersburg_isoch(void)
 	pdev = pci_get_device(PCI_VENDOR_ID_INTEL, 0x3a3e, NULL);
 	if (!pdev)
 		return;
+
+	if (risky_device(pdev)) {
+		pci_dev_put(pdev);
+		return;
+	}
+
 	pci_dev_put(pdev);
 
 	/* System Management Registers. Might be hidden, in which case
@@ -6096,6 +6128,11 @@ static void __init check_tylersburg_isoch(void)
 	if (!pdev)
 		return;
 
+	if (risky_device(pdev)) {
+		pci_dev_put(pdev);
+		return;
+	}
+
 	if (pci_read_config_dword(pdev, 0x188, &vtisochctrl)) {
 		pci_dev_put(pdev);
 		return;
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
