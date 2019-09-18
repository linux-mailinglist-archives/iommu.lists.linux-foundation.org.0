Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 927D1B67E0
	for <lists.iommu@lfdr.de>; Wed, 18 Sep 2019 18:18:22 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 8D552D56;
	Wed, 18 Sep 2019 16:18:06 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B6FF8C84
	for <iommu@lists.linux-foundation.org>;
	Wed, 18 Sep 2019 16:18:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 42D8E832
	for <iommu@lists.linux-foundation.org>;
	Wed, 18 Sep 2019 16:18:04 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BD13B15BF;
	Wed, 18 Sep 2019 09:18:03 -0700 (PDT)
Received: from e110467-lin.cambridge.arm.com (e110467-lin.cambridge.arm.com
	[10.1.197.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F102C3F59C; 
	Wed, 18 Sep 2019 09:18:02 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org
Subject: [PATCH 4/4] iommu/arm-smmu: Remove arm_smmu_flush_ops
Date: Wed, 18 Sep 2019 17:17:51 +0100
Message-Id: <ca7d7a393d3926b63e40dd2750478cf467887c31.1568820087.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.21.0.dirty
In-Reply-To: <cover.1568820087.git.robin.murphy@arm.com>
References: <cover.1568820087.git.robin.murphy@arm.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org
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

Now it's just an empty wrapper.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/arm-smmu.c | 40 +++++++++++++++++-----------------------
 drivers/iommu/arm-smmu.h |  6 +-----
 2 files changed, 18 insertions(+), 28 deletions(-)

diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
index cc3b7517458d..68e8d9d1902b 100644
--- a/drivers/iommu/arm-smmu.c
+++ b/drivers/iommu/arm-smmu.c
@@ -427,31 +427,25 @@ static void arm_smmu_tlb_add_page_s2_v1(struct iommu_iotlb_gather *gather,
 	arm_smmu_gr0_write(smmu, ARM_SMMU_GR0_TLBIVMID, smmu_domain->cfg.vmid);
 }
 
-static const struct arm_smmu_flush_ops arm_smmu_s1_tlb_ops = {
-	.tlb = {
-		.tlb_flush_all	= arm_smmu_tlb_inv_context_s1,
-		.tlb_flush_walk	= arm_smmu_tlb_inv_walk_s1,
-		.tlb_flush_leaf	= arm_smmu_tlb_inv_leaf_s1,
-		.tlb_add_page	= arm_smmu_tlb_add_page_s1,
-	},
+static const struct iommu_flush_ops arm_smmu_s1_tlb_ops = {
+	.tlb_flush_all	= arm_smmu_tlb_inv_context_s1,
+	.tlb_flush_walk	= arm_smmu_tlb_inv_walk_s1,
+	.tlb_flush_leaf	= arm_smmu_tlb_inv_leaf_s1,
+	.tlb_add_page	= arm_smmu_tlb_add_page_s1,
 };
 
-static const struct arm_smmu_flush_ops arm_smmu_s2_tlb_ops_v2 = {
-	.tlb = {
-		.tlb_flush_all	= arm_smmu_tlb_inv_context_s2,
-		.tlb_flush_walk	= arm_smmu_tlb_inv_walk_s2,
-		.tlb_flush_leaf	= arm_smmu_tlb_inv_leaf_s2,
-		.tlb_add_page	= arm_smmu_tlb_add_page_s2,
-	},
+static const struct iommu_flush_ops arm_smmu_s2_tlb_ops_v2 = {
+	.tlb_flush_all	= arm_smmu_tlb_inv_context_s2,
+	.tlb_flush_walk	= arm_smmu_tlb_inv_walk_s2,
+	.tlb_flush_leaf	= arm_smmu_tlb_inv_leaf_s2,
+	.tlb_add_page	= arm_smmu_tlb_add_page_s2,
 };
 
-static const struct arm_smmu_flush_ops arm_smmu_s2_tlb_ops_v1 = {
-	.tlb = {
-		.tlb_flush_all	= arm_smmu_tlb_inv_context_s2,
-		.tlb_flush_walk	= arm_smmu_tlb_inv_any_s2_v1,
-		.tlb_flush_leaf	= arm_smmu_tlb_inv_any_s2_v1,
-		.tlb_add_page	= arm_smmu_tlb_add_page_s2_v1,
-	},
+static const struct iommu_flush_ops arm_smmu_s2_tlb_ops_v1 = {
+	.tlb_flush_all	= arm_smmu_tlb_inv_context_s2,
+	.tlb_flush_walk	= arm_smmu_tlb_inv_any_s2_v1,
+	.tlb_flush_leaf	= arm_smmu_tlb_inv_any_s2_v1,
+	.tlb_add_page	= arm_smmu_tlb_add_page_s2_v1,
 };
 
 static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
@@ -781,7 +775,7 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
 		.ias		= ias,
 		.oas		= oas,
 		.coherent_walk	= smmu->features & ARM_SMMU_FEAT_COHERENT_WALK,
-		.tlb		= &smmu_domain->flush_ops->tlb,
+		.tlb		= smmu_domain->flush_ops,
 		.iommu_dev	= smmu->dev,
 	};
 
@@ -1210,7 +1204,7 @@ static void arm_smmu_flush_iotlb_all(struct iommu_domain *domain)
 
 	if (smmu_domain->flush_ops) {
 		arm_smmu_rpm_get(smmu);
-		smmu_domain->flush_ops->tlb.tlb_flush_all(smmu_domain);
+		smmu_domain->flush_ops->tlb_flush_all(smmu_domain);
 		arm_smmu_rpm_put(smmu);
 	}
 }
diff --git a/drivers/iommu/arm-smmu.h b/drivers/iommu/arm-smmu.h
index 5032102f05b7..ba0f05952dd9 100644
--- a/drivers/iommu/arm-smmu.h
+++ b/drivers/iommu/arm-smmu.h
@@ -304,14 +304,10 @@ enum arm_smmu_domain_stage {
 	ARM_SMMU_DOMAIN_BYPASS,
 };
 
-struct arm_smmu_flush_ops {
-	struct iommu_flush_ops		tlb;
-};
-
 struct arm_smmu_domain {
 	struct arm_smmu_device		*smmu;
 	struct io_pgtable_ops		*pgtbl_ops;
-	const struct arm_smmu_flush_ops	*flush_ops;
+	const struct iommu_flush_ops	*flush_ops;
 	struct arm_smmu_cfg		cfg;
 	enum arm_smmu_domain_stage	stage;
 	bool				non_strict;
-- 
2.21.0.dirty

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
