Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 182EBA5FBB
	for <lists.iommu@lfdr.de>; Tue,  3 Sep 2019 05:31:13 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 83540CA6;
	Tue,  3 Sep 2019 03:30:39 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 89EF1C8B
	for <iommu@lists.linux-foundation.org>;
	Tue,  3 Sep 2019 03:30:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 569AD8A2
	for <iommu@lists.linux-foundation.org>;
	Tue,  3 Sep 2019 03:30:34 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
	hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
	id <B5d6dde5c0001>; Mon, 02 Sep 2019 20:30:36 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
	by hqpgpgate102.nvidia.com (PGP Universal service);
	Mon, 02 Sep 2019 20:30:33 -0700
X-PGP-Universal: processed;
	by hqpgpgate102.nvidia.com on Mon, 02 Sep 2019 20:30:33 -0700
Received: from HQMAIL110.nvidia.com (172.18.146.15) by HQMAIL105.nvidia.com
	(172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Tue, 3 Sep 2019 03:30:33 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by hqmail110.nvidia.com
	(172.18.146.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Tue, 3 Sep 2019 03:30:33 +0000
Received: from hqnvemgw01.nvidia.com (172.20.150.20) by HQMAIL107.nvidia.com
	(172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
	Frontend Transport; Tue, 3 Sep 2019 03:30:33 +0000
Received: from vdumpa-ubuntu.nvidia.com (Not Verified[172.17.173.140]) by
	hqnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
	id <B5d6dde590001>; Mon, 02 Sep 2019 20:30:33 -0700
From: Krishna Reddy <vdumpa@nvidia.com>
To: 
Subject: [PATCH v2 1/7] iommu/arm-smmu: prepare arm_smmu_flush_ops for override
Date: Mon, 2 Sep 2019 20:32:02 -0700
Message-ID: <1567481528-31163-2-git-send-email-vdumpa@nvidia.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1567481528-31163-1-git-send-email-vdumpa@nvidia.com>
References: <1567481528-31163-1-git-send-email-vdumpa@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
	t=1567481436; bh=6vXneL5w/dKxNs1agMGvEAj0te9++B7Cg1CX1uMLfPU=;
	h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	In-Reply-To:References:X-NVConfidentiality:MIME-Version:
	Content-Type;
	b=Pnscg8e/1hjbDigLSdzhiEKpdQ0dYhv0rFU1IjA8SEtWE1FCRWkrgbsrvbeoxNfM9
	t31dATyxHvH3CwedSkb073YdwHl0GrK1txBr5v9Fl4Kt709QGOMDS1kn7CUgpzG16a
	Wv65C4K+NmmfG/veIfsTDdBNGQN+Z/gxVtVqBJ95FPEWGWuHoDS1odXGJ7HCWmSWgI
	NajPgrPupw/mgcaCVxfegj+GnDK4tNwokOnWbGWaYx2xavWfUlT7ji8ufsEBvUEt/c
	7rKRnu3qcQlw0axBgGT7BOOVXX1x3Ly7nAIyovJWlAsCfTxJyi70QLW3ffScAo2Sk9
	6BDSNCbIs/MbA==
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: snikam@nvidia.com, thomasz@nvidia.com, jtukkinen@nvidia.com,
	mperttunen@nvidia.com, will@kernel.org,
	linux-kernel@vger.kernel.org, praithatha@nvidia.com,
	talho@nvidia.com, iommu@lists.linux-foundation.org,
	linux-tegra@vger.kernel.org, yhsu@nvidia.com, treding@nvidia.com,
	robin.murphy@arm.com, avanbrunt@nvidia.com,
	linux-arm-kernel@lists.infradead.org
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

Remove const keyword for arm_smmu_flush_ops in arm_smmu_domain
and replace direct references to arm_smmu_tlb_sync* functions with
arm_smmu_flush_ops->tlb_sync().
This is necessary for vendor specific implementations that
need to override arm_smmu_flush_ops in part or full.

Signed-off-by: Krishna Reddy <vdumpa@nvidia.com>
---
 drivers/iommu/arm-smmu.c | 16 ++++++++--------
 drivers/iommu/arm-smmu.h |  4 +++-
 2 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
index 5b93c79..16b5c54 100644
--- a/drivers/iommu/arm-smmu.c
+++ b/drivers/iommu/arm-smmu.c
@@ -52,9 +52,6 @@
  */
 #define QCOM_DUMMY_VAL -1
 
-#define TLB_LOOP_TIMEOUT		1000000	/* 1s! */
-#define TLB_SPIN_COUNT			10
-
 #define MSI_IOVA_BASE			0x8000000
 #define MSI_IOVA_LENGTH			0x100000
 
@@ -290,6 +287,8 @@ static void arm_smmu_tlb_sync_vmid(void *cookie)
 static void arm_smmu_tlb_inv_context_s1(void *cookie)
 {
 	struct arm_smmu_domain *smmu_domain = cookie;
+	const struct arm_smmu_flush_ops *ops = smmu_domain->flush_ops;
+
 	/*
 	 * The TLBI write may be relaxed, so ensure that PTEs cleared by the
 	 * current CPU are visible beforehand.
@@ -297,18 +296,19 @@ static void arm_smmu_tlb_inv_context_s1(void *cookie)
 	wmb();
 	arm_smmu_cb_write(smmu_domain->smmu, smmu_domain->cfg.cbndx,
 			  ARM_SMMU_CB_S1_TLBIASID, smmu_domain->cfg.asid);
-	arm_smmu_tlb_sync_context(cookie);
+	ops->tlb_sync(cookie);
 }
 
 static void arm_smmu_tlb_inv_context_s2(void *cookie)
 {
 	struct arm_smmu_domain *smmu_domain = cookie;
 	struct arm_smmu_device *smmu = smmu_domain->smmu;
+	const struct arm_smmu_flush_ops *ops = smmu_domain->flush_ops;
 
 	/* See above */
 	wmb();
 	arm_smmu_gr0_write(smmu, ARM_SMMU_GR0_TLBIVMID, smmu_domain->cfg.vmid);
-	arm_smmu_tlb_sync_global(smmu);
+	ops->tlb_sync(cookie);
 }
 
 static void arm_smmu_tlb_inv_range_s1(unsigned long iova, size_t size,
@@ -410,7 +410,7 @@ static void arm_smmu_tlb_add_page(struct iommu_iotlb_gather *gather,
 	ops->tlb_inv_range(iova, granule, granule, true, cookie);
 }
 
-static const struct arm_smmu_flush_ops arm_smmu_s1_tlb_ops = {
+static struct arm_smmu_flush_ops arm_smmu_s1_tlb_ops = {
 	.tlb = {
 		.tlb_flush_all	= arm_smmu_tlb_inv_context_s1,
 		.tlb_flush_walk	= arm_smmu_tlb_inv_walk,
@@ -421,7 +421,7 @@ static const struct arm_smmu_flush_ops arm_smmu_s1_tlb_ops = {
 	.tlb_sync		= arm_smmu_tlb_sync_context,
 };
 
-static const struct arm_smmu_flush_ops arm_smmu_s2_tlb_ops_v2 = {
+static struct arm_smmu_flush_ops arm_smmu_s2_tlb_ops_v2 = {
 	.tlb = {
 		.tlb_flush_all	= arm_smmu_tlb_inv_context_s2,
 		.tlb_flush_walk	= arm_smmu_tlb_inv_walk,
@@ -432,7 +432,7 @@ static const struct arm_smmu_flush_ops arm_smmu_s2_tlb_ops_v2 = {
 	.tlb_sync		= arm_smmu_tlb_sync_context,
 };
 
-static const struct arm_smmu_flush_ops arm_smmu_s2_tlb_ops_v1 = {
+static struct arm_smmu_flush_ops arm_smmu_s2_tlb_ops_v1 = {
 	.tlb = {
 		.tlb_flush_all	= arm_smmu_tlb_inv_context_s2,
 		.tlb_flush_walk	= arm_smmu_tlb_inv_walk,
diff --git a/drivers/iommu/arm-smmu.h b/drivers/iommu/arm-smmu.h
index b19b6ca..b2d6c7f 100644
--- a/drivers/iommu/arm-smmu.h
+++ b/drivers/iommu/arm-smmu.h
@@ -207,6 +207,8 @@ enum arm_smmu_cbar_type {
 /* Maximum number of context banks per SMMU */
 #define ARM_SMMU_MAX_CBS		128
 
+#define TLB_LOOP_TIMEOUT		1000000	/* 1s! */
+#define TLB_SPIN_COUNT			10
 
 /* Shared driver definitions */
 enum arm_smmu_arch_version {
@@ -314,7 +316,7 @@ struct arm_smmu_flush_ops {
 struct arm_smmu_domain {
 	struct arm_smmu_device		*smmu;
 	struct io_pgtable_ops		*pgtbl_ops;
-	const struct arm_smmu_flush_ops	*flush_ops;
+	struct arm_smmu_flush_ops	*flush_ops;
 	struct arm_smmu_cfg		cfg;
 	enum arm_smmu_domain_stage	stage;
 	bool				non_strict;
-- 
2.1.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
