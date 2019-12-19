Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 40341126199
	for <lists.iommu@lfdr.de>; Thu, 19 Dec 2019 13:04:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E9F9886F17;
	Thu, 19 Dec 2019 12:04:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lnh6hZ-qU1aq; Thu, 19 Dec 2019 12:04:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 88E8686BBC;
	Thu, 19 Dec 2019 12:04:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 74706C077D;
	Thu, 19 Dec 2019 12:04:34 +0000 (UTC)
X-Original-To: iommu@lists.linuxfoundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 32916C077D
 for <iommu@lists.linuxfoundation.org>; Thu, 19 Dec 2019 12:04:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 223FB86F38
 for <iommu@lists.linuxfoundation.org>; Thu, 19 Dec 2019 12:04:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BMWR9Wq71G1G for <iommu@lists.linuxfoundation.org>;
 Thu, 19 Dec 2019 12:04:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A6CC786BBC
 for <iommu@lists.linuxfoundation.org>; Thu, 19 Dec 2019 12:04:32 +0000 (UTC)
Received: from localhost.localdomain (236.31.169.217.in-addr.arpa
 [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2AEE224679;
 Thu, 19 Dec 2019 12:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576757072;
 bh=hr0j2ciKuJVzbWUymTBVFfm1s+/LxgMJpRZN60cwSuw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eNN7UrwM6z6VgCYQJmtp1gol6K5vWJCuBjE/bc4COHcvIrw9aWiZc7T2NLOHKW1Ci
 1Qk1Q4J8mOsJKtNxjpsTfmpl3PR0o69nPh6uOr7GojdaZ7dBngKIeSzkHkohjfcR4B
 c6NsAQzjX20C/z7I0EdM7QPmEneYXkv0pnEqsQP0=
From: Will Deacon <will@kernel.org>
To: linux-kernel@vger.kernel.org,
	iommu@lists.linuxfoundation.org
Subject: [PATCH v4 11/16] iommu/arm-smmu-v3: Unregister IOMMU and bus ops on
 device removal
Date: Thu, 19 Dec 2019 12:03:47 +0000
Message-Id: <20191219120352.382-12-will@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191219120352.382-1-will@kernel.org>
References: <20191219120352.382-1-will@kernel.org>
MIME-Version: 1.0
Cc: "Isaac J. Manjarres" <isaacm@codeaurora.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Saravana Kannan <saravanak@google.com>, kernel-team@android.com,
 Robin Murphy <robin.murphy@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>
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

When removing the SMMUv3 driver, we need to clear any state that we
registered during probe. This includes our bus ops, sysfs entries and
the IOMMU device registered for early firmware probing of masters.

Signed-off-by: Will Deacon <will@kernel.org>
---
 drivers/iommu/arm-smmu-v3.c | 64 +++++++++++++++++++++++++------------
 1 file changed, 43 insertions(+), 21 deletions(-)

diff --git a/drivers/iommu/arm-smmu-v3.c b/drivers/iommu/arm-smmu-v3.c
index 9d4c9de6172d..46160a2fec3e 100644
--- a/drivers/iommu/arm-smmu-v3.c
+++ b/drivers/iommu/arm-smmu-v3.c
@@ -3565,6 +3565,45 @@ static unsigned long arm_smmu_resource_size(struct arm_smmu_device *smmu)
 		return SZ_128K;
 }
 
+static int arm_smmu_set_bus_ops(struct iommu_ops *ops)
+{
+	int err;
+
+#ifdef CONFIG_PCI
+	if (pci_bus_type.iommu_ops != ops) {
+		if (ops)
+			pci_request_acs();
+		err = bus_set_iommu(&pci_bus_type, ops);
+		if (err)
+			return err;
+	}
+#endif
+#ifdef CONFIG_ARM_AMBA
+	if (amba_bustype.iommu_ops != ops) {
+		err = bus_set_iommu(&amba_bustype, ops);
+		if (err)
+			goto err_reset_pci_ops;
+	}
+#endif
+	if (platform_bus_type.iommu_ops != ops) {
+		err = bus_set_iommu(&platform_bus_type, ops);
+		if (err)
+			goto err_reset_amba_ops;
+	}
+
+	return 0;
+
+err_reset_amba_ops:
+#ifdef CONFIG_ARM_AMBA
+	bus_set_iommu(&amba_bustype, NULL);
+#endif
+err_reset_pci_ops: __maybe_unused;
+#ifdef CONFIG_PCI
+	bus_set_iommu(&pci_bus_type, NULL);
+#endif
+	return err;
+}
+
 static int arm_smmu_device_probe(struct platform_device *pdev)
 {
 	int irq, ret;
@@ -3655,33 +3694,16 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-#ifdef CONFIG_PCI
-	if (pci_bus_type.iommu_ops != &arm_smmu_ops) {
-		pci_request_acs();
-		ret = bus_set_iommu(&pci_bus_type, &arm_smmu_ops);
-		if (ret)
-			return ret;
-	}
-#endif
-#ifdef CONFIG_ARM_AMBA
-	if (amba_bustype.iommu_ops != &arm_smmu_ops) {
-		ret = bus_set_iommu(&amba_bustype, &arm_smmu_ops);
-		if (ret)
-			return ret;
-	}
-#endif
-	if (platform_bus_type.iommu_ops != &arm_smmu_ops) {
-		ret = bus_set_iommu(&platform_bus_type, &arm_smmu_ops);
-		if (ret)
-			return ret;
-	}
-	return 0;
+	return arm_smmu_set_bus_ops(&arm_smmu_ops);
 }
 
 static int arm_smmu_device_remove(struct platform_device *pdev)
 {
 	struct arm_smmu_device *smmu = platform_get_drvdata(pdev);
 
+	arm_smmu_set_bus_ops(NULL);
+	iommu_device_unregister(&smmu->iommu);
+	iommu_device_sysfs_remove(&smmu->iommu);
 	arm_smmu_device_disable(smmu);
 
 	return 0;
-- 
2.24.1.735.g03f4e72817-goog

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
