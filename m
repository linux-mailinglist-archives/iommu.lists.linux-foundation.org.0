Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3FEB67DE
	for <lists.iommu@lfdr.de>; Wed, 18 Sep 2019 18:18:13 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 2B510D39;
	Wed, 18 Sep 2019 16:18:06 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id CDDB1C86
	for <iommu@lists.linux-foundation.org>;
	Wed, 18 Sep 2019 16:18:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 2F644832
	for <iommu@lists.linux-foundation.org>;
	Wed, 18 Sep 2019 16:18:02 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BBCC71576;
	Wed, 18 Sep 2019 09:18:01 -0700 (PDT)
Received: from e110467-lin.cambridge.arm.com (e110467-lin.cambridge.arm.com
	[10.1.197.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E7C043F59C; 
	Wed, 18 Sep 2019 09:18:00 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org
Subject: [PATCH 2/4] iommu/arm-smmu: Remove "leaf" indirection
Date: Wed, 18 Sep 2019 17:17:49 +0100
Message-Id: <4d401834469adc87283a173143fa5c6ede2a960a.1568820087.git.robin.murphy@arm.com>
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

Now that the "leaf" flag is no longer part of an external interface,
there's no need to use it to infer a register offset at runtime when
we can just as easily encode the offset directly in its place.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/arm-smmu.c | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
index f2b81b1ce224..b5b4cd4cae19 100644
--- a/drivers/iommu/arm-smmu.c
+++ b/drivers/iommu/arm-smmu.c
@@ -312,18 +312,16 @@ static void arm_smmu_tlb_inv_context_s2(void *cookie)
 }
 
 static void arm_smmu_tlb_inv_range_s1(unsigned long iova, size_t size,
-				      size_t granule, void *cookie, bool leaf)
+				      size_t granule, void *cookie, int reg)
 {
 	struct arm_smmu_domain *smmu_domain = cookie;
 	struct arm_smmu_device *smmu = smmu_domain->smmu;
 	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
-	int reg, idx = cfg->cbndx;
+	int idx = cfg->cbndx;
 
 	if (smmu->features & ARM_SMMU_FEAT_COHERENT_WALK)
 		wmb();
 
-	reg = leaf ? ARM_SMMU_CB_S1_TLBIVAL : ARM_SMMU_CB_S1_TLBIVA;
-
 	if (cfg->fmt != ARM_SMMU_CTX_FMT_AARCH64) {
 		iova = (iova >> 12) << 12;
 		iova |= cfg->asid;
@@ -342,16 +340,15 @@ static void arm_smmu_tlb_inv_range_s1(unsigned long iova, size_t size,
 }
 
 static void arm_smmu_tlb_inv_range_s2(unsigned long iova, size_t size,
-				      size_t granule, void *cookie, bool leaf)
+				      size_t granule, void *cookie, int reg)
 {
 	struct arm_smmu_domain *smmu_domain = cookie;
 	struct arm_smmu_device *smmu = smmu_domain->smmu;
-	int reg, idx = smmu_domain->cfg.cbndx;
+	int idx = smmu_domain->cfg.cbndx;
 
 	if (smmu->features & ARM_SMMU_FEAT_COHERENT_WALK)
 		wmb();
 
-	reg = leaf ? ARM_SMMU_CB_S2_TLBIIPAS2L : ARM_SMMU_CB_S2_TLBIIPAS2;
 	iova >>= 12;
 	do {
 		if (smmu_domain->cfg.fmt == ARM_SMMU_CTX_FMT_AARCH64)
@@ -365,14 +362,16 @@ static void arm_smmu_tlb_inv_range_s2(unsigned long iova, size_t size,
 static void arm_smmu_tlb_inv_walk_s1(unsigned long iova, size_t size,
 				     size_t granule, void *cookie)
 {
-	arm_smmu_tlb_inv_range_s1(iova, size, granule, cookie, false);
+	arm_smmu_tlb_inv_range_s1(iova, size, granule, cookie,
+				  ARM_SMMU_CB_S1_TLBIVA);
 	arm_smmu_tlb_sync_context(cookie);
 }
 
 static void arm_smmu_tlb_inv_leaf_s1(unsigned long iova, size_t size,
 				     size_t granule, void *cookie)
 {
-	arm_smmu_tlb_inv_range_s1(iova, size, granule, cookie, true);
+	arm_smmu_tlb_inv_range_s1(iova, size, granule, cookie,
+				  ARM_SMMU_CB_S1_TLBIVAL);
 	arm_smmu_tlb_sync_context(cookie);
 }
 
@@ -380,20 +379,23 @@ static void arm_smmu_tlb_add_page_s1(struct iommu_iotlb_gather *gather,
 				     unsigned long iova, size_t granule,
 				     void *cookie)
 {
-	arm_smmu_tlb_inv_range_s1(iova, granule, granule, cookie, true);
+	arm_smmu_tlb_inv_range_s1(iova, granule, granule, cookie,
+				  ARM_SMMU_CB_S1_TLBIVAL);
 }
 
 static void arm_smmu_tlb_inv_walk_s2(unsigned long iova, size_t size,
 				     size_t granule, void *cookie)
 {
-	arm_smmu_tlb_inv_range_s2(iova, size, granule, cookie, false);
+	arm_smmu_tlb_inv_range_s2(iova, size, granule, cookie,
+				  ARM_SMMU_CB_S2_TLBIIPAS2);
 	arm_smmu_tlb_sync_context(cookie);
 }
 
 static void arm_smmu_tlb_inv_leaf_s2(unsigned long iova, size_t size,
 				     size_t granule, void *cookie)
 {
-	arm_smmu_tlb_inv_range_s2(iova, size, granule, cookie, true);
+	arm_smmu_tlb_inv_range_s2(iova, size, granule, cookie,
+				  ARM_SMMU_CB_S2_TLBIIPAS2L);
 	arm_smmu_tlb_sync_context(cookie);
 }
 
@@ -401,7 +403,8 @@ static void arm_smmu_tlb_add_page_s2(struct iommu_iotlb_gather *gather,
 				     unsigned long iova, size_t granule,
 				     void *cookie)
 {
-	arm_smmu_tlb_inv_range_s2(iova, granule, granule, cookie, true);
+	arm_smmu_tlb_inv_range_s2(iova, granule, granule, cookie,
+				  ARM_SMMU_CB_S2_TLBIIPAS2L);
 }
 
 static void arm_smmu_tlb_inv_any_s2_v1(unsigned long iova, size_t size,
-- 
2.21.0.dirty

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
