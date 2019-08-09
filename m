Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 64DEB880E6
	for <lists.iommu@lfdr.de>; Fri,  9 Aug 2019 19:09:30 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 4ABD1E24;
	Fri,  9 Aug 2019 17:08:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp2.linuxfoundation.org (smtp2.linux-foundation.org
	[172.17.192.36])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D897ECA5
	for <iommu@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 17:08:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp2.linuxfoundation.org (Postfix) with ESMTP id 498AF1DAA7
	for <iommu@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 17:08:32 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DF3BA15AB;
	Fri,  9 Aug 2019 10:08:31 -0700 (PDT)
Received: from e110467-lin.cambridge.arm.com (e110467-lin.cambridge.arm.com
	[10.1.197.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A659A3F575; 
	Fri,  9 Aug 2019 10:08:30 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org
Subject: [PATCH 13/15] iommu/arm-smmu: Add configuration implementation hook
Date: Fri,  9 Aug 2019 18:07:50 +0100
Message-Id: <326db31d096f24b3ce7d9b98f05a5a9ba620f5b0.1565369764.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.21.0.dirty
In-Reply-To: <cover.1565369764.git.robin.murphy@arm.com>
References: <cover.1565369764.git.robin.murphy@arm.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp2.linux-foundation.org
Cc: bjorn.andersson@linaro.org, iommu@lists.linux-foundation.org,
	gregory.clement@bootlin.com, linux-arm-kernel@lists.infradead.org
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

Probing the ID registers and setting up the SMMU configuration is an
area where overrides and workarounds may well be needed. Indeed, the
Cavium workaround detection lives there at the moment, so let's break
that out.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/arm-smmu-impl.c | 24 ++++++++++++++++++++++++
 drivers/iommu/arm-smmu.c      | 17 +++--------------
 drivers/iommu/arm-smmu.h      |  1 +
 3 files changed, 28 insertions(+), 14 deletions(-)

diff --git a/drivers/iommu/arm-smmu-impl.c b/drivers/iommu/arm-smmu-impl.c
index f8b8895e1bbe..0b444e476525 100644
--- a/drivers/iommu/arm-smmu-impl.c
+++ b/drivers/iommu/arm-smmu-impl.c
@@ -47,11 +47,35 @@ const struct arm_smmu_impl calxeda_impl = {
 };
 
 
+static int cavium_cfg_probe(struct arm_smmu_device *smmu)
+{
+	static atomic_t context_count = ATOMIC_INIT(0);
+	/*
+	 * Cavium CN88xx erratum #27704.
+	 * Ensure ASID and VMID allocation is unique across all SMMUs in
+	 * the system.
+	 */
+	smmu->cavium_id_base = atomic_fetch_add(smmu->num_context_banks,
+						   &context_count);
+	dev_notice(smmu->dev, "\tenabling workaround for Cavium erratum 27704\n");
+
+	return 0;
+}
+
+const struct arm_smmu_impl cavium_impl = {
+	.cfg_probe = cavium_cfg_probe,
+};
+
+
 struct arm_smmu_device *arm_smmu_impl_init(struct arm_smmu_device *smmu)
 {
+	/* The current quirks happen to be mutually-exclusive */
 	if (of_property_read_bool(smmu->dev->of_node,
 				  "calxeda,smmu-secure-config-access"))
 		smmu->impl = &calxeda_impl;
 
+	if (smmu->model == CAVIUM_SMMUV2)
+		smmu->impl = &cavium_impl;
+
 	return smmu;
 }
diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
index 03159a1da4c9..80822d48f6c7 100644
--- a/drivers/iommu/arm-smmu.c
+++ b/drivers/iommu/arm-smmu.c
@@ -155,8 +155,6 @@ struct arm_smmu_domain {
 	struct iommu_domain		domain;
 };
 
-static atomic_t cavium_smmu_context_count = ATOMIC_INIT(0);
-
 static bool using_legacy_binding, using_generic_binding;
 
 static inline int arm_smmu_rpm_get(struct arm_smmu_device *smmu)
@@ -1804,18 +1802,6 @@ static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
 	}
 	dev_notice(smmu->dev, "\t%u context banks (%u stage-2 only)\n",
 		   smmu->num_context_banks, smmu->num_s2_context_banks);
-	/*
-	 * Cavium CN88xx erratum #27704.
-	 * Ensure ASID and VMID allocation is unique across all SMMUs in
-	 * the system.
-	 */
-	if (smmu->model == CAVIUM_SMMUV2) {
-		smmu->cavium_id_base =
-			atomic_add_return(smmu->num_context_banks,
-					  &cavium_smmu_context_count);
-		smmu->cavium_id_base -= smmu->num_context_banks;
-		dev_notice(smmu->dev, "\tenabling workaround for Cavium erratum 27704\n");
-	}
 	smmu->cbs = devm_kcalloc(smmu->dev, smmu->num_context_banks,
 				 sizeof(*smmu->cbs), GFP_KERNEL);
 	if (!smmu->cbs)
@@ -1884,6 +1870,9 @@ static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
 		dev_notice(smmu->dev, "\tStage-2: %lu-bit IPA -> %lu-bit PA\n",
 			   smmu->ipa_size, smmu->pa_size);
 
+	if (smmu->impl && smmu->impl->cfg_probe)
+		return smmu->impl->cfg_probe(smmu);
+
 	return 0;
 }
 
diff --git a/drivers/iommu/arm-smmu.h b/drivers/iommu/arm-smmu.h
index 0485ee7fd4c1..e79cb32802e9 100644
--- a/drivers/iommu/arm-smmu.h
+++ b/drivers/iommu/arm-smmu.h
@@ -287,6 +287,7 @@ struct arm_smmu_impl {
 	u64 (*read_reg64)(struct arm_smmu_device *smmu, int page, int offset);
 	void (*write_reg64)(struct arm_smmu_device *smmu, int page, int offset,
 			    u64 val);
+	int (*cfg_probe)(struct arm_smmu_device *smmu);
 };
 
 static inline void __iomem *arm_smmu_page(struct arm_smmu_device *smmu, int n)
-- 
2.21.0.dirty

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
