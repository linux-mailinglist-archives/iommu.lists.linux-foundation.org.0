Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F5B1076B6
	for <lists.iommu@lfdr.de>; Fri, 22 Nov 2019 18:47:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 16268889C0;
	Fri, 22 Nov 2019 17:47:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ymu5wgLVxqlE; Fri, 22 Nov 2019 17:47:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 90880888DE;
	Fri, 22 Nov 2019 17:47:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 88FE6C18DA;
	Fri, 22 Nov 2019 17:47:33 +0000 (UTC)
X-Original-To: iommu@lists.linuxfoundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 028EDC18DA
 for <iommu@lists.linuxfoundation.org>; Fri, 22 Nov 2019 17:41:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E5879203FC
 for <iommu@lists.linuxfoundation.org>; Fri, 22 Nov 2019 17:41:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p+Y2bn+LsDmw for <iommu@lists.linuxfoundation.org>;
 Fri, 22 Nov 2019 17:41:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 755D2203B1
 for <iommu@lists.linuxfoundation.org>; Fri, 22 Nov 2019 17:41:52 +0000 (UTC)
Received: from localhost.localdomain (91-167-84-221.subs.proxad.net
 [91.167.84.221])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BFFFD205C9;
 Fri, 22 Nov 2019 17:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574444512;
 bh=HbtGDWVqT6RINptsr4QdRRG5JyZvL6Y5ZfA3QFTTrxk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=s4I7dBaZKmPNfgNkHj3p5SYZ580WTfFb41b4Ml6YiqL30G1arS1GgdKFq8YoW11WK
 XkbJBolt+sIkz/1aPda8+Rwf10Pnkghqqaj9hQy7S9JFj8oe1yf5zR0G6wocutN0eg
 EqMcwa0JUpbTsj7wqO+Bg3q9UWxKHvQtrkFCQ2EI=
From: Ard Biesheuvel <ardb@kernel.org>
To: will@kernel.org
Subject: [PATCH] iommu/arm-smmu: support SMMU module probing from the IORT
Date: Fri, 22 Nov 2019 18:41:25 +0100
Message-Id: <20191122174125.21030-1-ardb@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191121114918.2293-1-will@kernel.org>
References: <20191121114918.2293-1-will@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 22 Nov 2019 17:47:32 +0000
Cc: iommu@lists.linuxfoundation.org, isaacm@codeaurora.org,
 saravanak@google.com, jean-philippe@linaro.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, bhelgaas@google.com, robin.murphy@arm.com,
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

Add support for SMMU drivers built as modules to the ACPI/IORT device
probing path, by deferring the probe of the master if the SMMU driver is
known to exist but has not been loaded yet. Given that the IORT code
registers a platform device for each SMMU that it discovers, we can
easily trigger the udev based autoloading of the SMMU drivers by making
the platform device identifier part of the module alias.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/acpi/arm64/iort.c   | 4 ++--
 drivers/iommu/arm-smmu-v3.c | 1 +
 drivers/iommu/arm-smmu.c    | 1 +
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/acpi/arm64/iort.c b/drivers/acpi/arm64/iort.c
index 5a7551d060f2..a696457a9b11 100644
--- a/drivers/acpi/arm64/iort.c
+++ b/drivers/acpi/arm64/iort.c
@@ -850,9 +850,9 @@ static inline bool iort_iommu_driver_enabled(u8 type)
 {
 	switch (type) {
 	case ACPI_IORT_NODE_SMMU_V3:
-		return IS_BUILTIN(CONFIG_ARM_SMMU_V3);
+		return IS_ENABLED(CONFIG_ARM_SMMU_V3);
 	case ACPI_IORT_NODE_SMMU:
-		return IS_BUILTIN(CONFIG_ARM_SMMU);
+		return IS_ENABLED(CONFIG_ARM_SMMU);
 	default:
 		pr_warn("IORT node type %u does not describe an SMMU\n", type);
 		return false;
diff --git a/drivers/iommu/arm-smmu-v3.c b/drivers/iommu/arm-smmu-v3.c
index 7669beafc493..bf6a1e8eb9b0 100644
--- a/drivers/iommu/arm-smmu-v3.c
+++ b/drivers/iommu/arm-smmu-v3.c
@@ -3733,4 +3733,5 @@ module_platform_driver(arm_smmu_driver);
 
 MODULE_DESCRIPTION("IOMMU API for ARM architected SMMUv3 implementations");
 MODULE_AUTHOR("Will Deacon <will@kernel.org>");
+MODULE_ALIAS("platform:arm-smmu-v3");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
index d55acc48aee3..db5106b0955b 100644
--- a/drivers/iommu/arm-smmu.c
+++ b/drivers/iommu/arm-smmu.c
@@ -2292,4 +2292,5 @@ module_platform_driver(arm_smmu_driver);
 
 MODULE_DESCRIPTION("IOMMU API for ARM architected SMMU implementations");
 MODULE_AUTHOR("Will Deacon <will@kernel.org>");
+MODULE_ALIAS("platform:arm-smmu");
 MODULE_LICENSE("GPL v2");
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
