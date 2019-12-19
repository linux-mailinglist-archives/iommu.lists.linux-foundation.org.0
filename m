Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 138D112619B
	for <lists.iommu@lfdr.de>; Thu, 19 Dec 2019 13:04:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id BD8EB86BE1;
	Thu, 19 Dec 2019 12:04:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y4LeRbzgm8qB; Thu, 19 Dec 2019 12:04:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E8AA087F04;
	Thu, 19 Dec 2019 12:04:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D0E41C077D;
	Thu, 19 Dec 2019 12:04:40 +0000 (UTC)
X-Original-To: iommu@lists.linuxfoundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EA849C077D
 for <iommu@lists.linuxfoundation.org>; Thu, 19 Dec 2019 12:04:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D959D86F41
 for <iommu@lists.linuxfoundation.org>; Thu, 19 Dec 2019 12:04:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cp2FR7kKOwlM for <iommu@lists.linuxfoundation.org>;
 Thu, 19 Dec 2019 12:04:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 6C1EF81E4F
 for <iommu@lists.linuxfoundation.org>; Thu, 19 Dec 2019 12:04:38 +0000 (UTC)
Received: from localhost.localdomain (236.31.169.217.in-addr.arpa
 [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D0A56206D3;
 Thu, 19 Dec 2019 12:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576757078;
 bh=5RCz2TMZMRkkASXCp+AqxpJ05Mrpr53WCYjlykmdXF4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=1h0V17RF7vekeTkTWYpjgjz9Zszmn7oujavAur3jPEoV9CAkAOX6COvnqg+ZAQy+N
 XUK571oj+uXNTPSSYeExCGo+6ySFnnJdGNmg6cgB7eoWoMxjMp2pAxgNu0luj20VSN
 l4Tp4Yq1mxrSTM+UqFme3nSfOX3dh9nIhYMseM50=
From: Will Deacon <will@kernel.org>
To: linux-kernel@vger.kernel.org,
	iommu@lists.linuxfoundation.org
Subject: [PATCH v4 13/16] iommu/arm-smmu-v3: Allow building as a module
Date: Thu, 19 Dec 2019 12:03:49 +0000
Message-Id: <20191219120352.382-14-will@kernel.org>
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

By removing the redundant call to 'pci_request_acs()' we can allow the
ARM SMMUv3 driver to be built as a module.

Signed-off-by: Will Deacon <will@kernel.org>
---
 drivers/iommu/Kconfig       | 2 +-
 drivers/iommu/arm-smmu-v3.c | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index 0b9d78a0f3ac..31f0f376ad11 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -394,7 +394,7 @@ config ARM_SMMU_DISABLE_BYPASS_BY_DEFAULT
 	  config.
 
 config ARM_SMMU_V3
-	bool "ARM Ltd. System MMU Version 3 (SMMUv3) Support"
+	tristate "ARM Ltd. System MMU Version 3 (SMMUv3) Support"
 	depends on ARM64
 	select IOMMU_API
 	select IOMMU_IO_PGTABLE_LPAE
diff --git a/drivers/iommu/arm-smmu-v3.c b/drivers/iommu/arm-smmu-v3.c
index da9474a02668..2a65d9b87125 100644
--- a/drivers/iommu/arm-smmu-v3.c
+++ b/drivers/iommu/arm-smmu-v3.c
@@ -2733,6 +2733,7 @@ static struct iommu_ops arm_smmu_ops = {
 	.get_resv_regions	= arm_smmu_get_resv_regions,
 	.put_resv_regions	= arm_smmu_put_resv_regions,
 	.pgsize_bitmap		= -1UL, /* Restricted during device attach */
+	.owner			= THIS_MODULE,
 };
 
 /* Probing and initialisation functions */
@@ -3571,8 +3572,6 @@ static int arm_smmu_set_bus_ops(struct iommu_ops *ops)
 
 #ifdef CONFIG_PCI
 	if (pci_bus_type.iommu_ops != ops) {
-		if (ops)
-			pci_request_acs();
 		err = bus_set_iommu(&pci_bus_type, ops);
 		if (err)
 			return err;
-- 
2.24.1.735.g03f4e72817-goog

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
