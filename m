Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F40B94C7D
	for <lists.iommu@lfdr.de>; Mon, 19 Aug 2019 20:20:04 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C7825EC2;
	Mon, 19 Aug 2019 18:19:44 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 5ED01EBD
	for <iommu@lists.linux-foundation.org>;
	Mon, 19 Aug 2019 18:19:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 3C76F8A0
	for <iommu@lists.linux-foundation.org>;
	Mon, 19 Aug 2019 18:19:37 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D87F71576;
	Mon, 19 Aug 2019 11:19:36 -0700 (PDT)
Received: from e110467-lin.cambridge.arm.com (e110467-lin.cambridge.arm.com
	[10.1.197.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F16C63F246; 
	Mon, 19 Aug 2019 11:19:35 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org
Subject: [PATCH 1/4] iommu/io-pgtable-arm: Rationalise MAIR handling
Date: Mon, 19 Aug 2019 19:19:28 +0100
Message-Id: <2aada213eb24e56a1ac74e6e2b0b9e99f664edd1.1566238530.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.21.0.dirty
In-Reply-To: <cover.1566238530.git.robin.murphy@arm.com>
References: <cover.1566238530.git.robin.murphy@arm.com>
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

Between VMSAv8-64 and the various 32-bit formats, there is either one
64-bit MAIR or a pair of 32-bit MAIR0/MAIR1 or NMRR/PMRR registers.
As such, keeping two 64-bit values in io_pgtable_cfg has always been
overkill.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/arm-smmu-v3.c    | 2 +-
 drivers/iommu/arm-smmu.c       | 4 ++--
 drivers/iommu/io-pgtable-arm.c | 5 ++---
 drivers/iommu/ipmmu-vmsa.c     | 2 +-
 drivers/iommu/qcom_iommu.c     | 4 ++--
 include/linux/io-pgtable.h     | 2 +-
 6 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/iommu/arm-smmu-v3.c b/drivers/iommu/arm-smmu-v3.c
index a9a9fabd3968..2a8db896d698 100644
--- a/drivers/iommu/arm-smmu-v3.c
+++ b/drivers/iommu/arm-smmu-v3.c
@@ -1724,7 +1724,7 @@ static int arm_smmu_domain_finalise_s1(struct arm_smmu_domain *smmu_domain,
 	cfg->cd.asid	= (u16)asid;
 	cfg->cd.ttbr	= pgtbl_cfg->arm_lpae_s1_cfg.ttbr[0];
 	cfg->cd.tcr	= pgtbl_cfg->arm_lpae_s1_cfg.tcr;
-	cfg->cd.mair	= pgtbl_cfg->arm_lpae_s1_cfg.mair[0];
+	cfg->cd.mair	= pgtbl_cfg->arm_lpae_s1_cfg.mair;
 	return 0;
 
 out_free_asid:
diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
index 523a88842e7f..184ca41e9de7 100644
--- a/drivers/iommu/arm-smmu.c
+++ b/drivers/iommu/arm-smmu.c
@@ -491,8 +491,8 @@ static void arm_smmu_init_context_bank(struct arm_smmu_domain *smmu_domain,
 			cb->mair[0] = pgtbl_cfg->arm_v7s_cfg.prrr;
 			cb->mair[1] = pgtbl_cfg->arm_v7s_cfg.nmrr;
 		} else {
-			cb->mair[0] = pgtbl_cfg->arm_lpae_s1_cfg.mair[0];
-			cb->mair[1] = pgtbl_cfg->arm_lpae_s1_cfg.mair[1];
+			cb->mair[0] = pgtbl_cfg->arm_lpae_s1_cfg.mair;
+			cb->mair[1] = pgtbl_cfg->arm_lpae_s1_cfg.mair >> 32;
 		}
 	}
 }
diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index 161a7d56264d..c588ba0dd4d1 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -859,8 +859,7 @@ arm_64_lpae_alloc_pgtable_s1(struct io_pgtable_cfg *cfg, void *cookie)
 	      (ARM_LPAE_MAIR_ATTR_INC_OWBRWA
 	       << ARM_LPAE_MAIR_ATTR_SHIFT(ARM_LPAE_MAIR_ATTR_IDX_INC_OCACHE));
 
-	cfg->arm_lpae_s1_cfg.mair[0] = reg;
-	cfg->arm_lpae_s1_cfg.mair[1] = 0;
+	cfg->arm_lpae_s1_cfg.mair = reg;
 
 	/* Looking good; allocate a pgd */
 	data->pgd = __arm_lpae_alloc_pages(data->pgd_size, GFP_KERNEL, cfg);
@@ -1024,7 +1023,7 @@ arm_mali_lpae_alloc_pgtable(struct io_pgtable_cfg *cfg, void *cookie)
 		u64 mair, ttbr;
 
 		/* Copy values as union fields overlap */
-		mair = cfg->arm_lpae_s1_cfg.mair[0];
+		mair = cfg->arm_lpae_s1_cfg.mair;
 		ttbr = cfg->arm_lpae_s1_cfg.ttbr[0];
 
 		cfg->arm_mali_lpae_cfg.memattr = mair;
diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
index ad0098c0c87c..9075e53a748b 100644
--- a/drivers/iommu/ipmmu-vmsa.c
+++ b/drivers/iommu/ipmmu-vmsa.c
@@ -436,7 +436,7 @@ static void ipmmu_domain_setup_context(struct ipmmu_vmsa_domain *domain)
 
 	/* MAIR0 */
 	ipmmu_ctx_write_root(domain, IMMAIR0,
-			     domain->cfg.arm_lpae_s1_cfg.mair[0]);
+			     domain->cfg.arm_lpae_s1_cfg.mair);
 
 	/* IMBUSCR */
 	if (domain->mmu->features->setup_imbuscr)
diff --git a/drivers/iommu/qcom_iommu.c b/drivers/iommu/qcom_iommu.c
index a2062d13584f..34bb357b3cfa 100644
--- a/drivers/iommu/qcom_iommu.c
+++ b/drivers/iommu/qcom_iommu.c
@@ -262,9 +262,9 @@ static int qcom_iommu_init_domain(struct iommu_domain *domain,
 
 		/* MAIRs (stage-1 only) */
 		iommu_writel(ctx, ARM_SMMU_CB_S1_MAIR0,
-				pgtbl_cfg.arm_lpae_s1_cfg.mair[0]);
+				pgtbl_cfg.arm_lpae_s1_cfg.mair);
 		iommu_writel(ctx, ARM_SMMU_CB_S1_MAIR1,
-				pgtbl_cfg.arm_lpae_s1_cfg.mair[1]);
+				pgtbl_cfg.arm_lpae_s1_cfg.mair >> 32);
 
 		/* SCTLR */
 		reg = SCTLR_CFIE | SCTLR_CFRE | SCTLR_AFE | SCTLR_TRE |
diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
index b5a450a3bb47..a6c8aa204733 100644
--- a/include/linux/io-pgtable.h
+++ b/include/linux/io-pgtable.h
@@ -92,7 +92,7 @@ struct io_pgtable_cfg {
 		struct {
 			u64	ttbr[2];
 			u64	tcr;
-			u64	mair[2];
+			u64	mair;
 		} arm_lpae_s1_cfg;
 
 		struct {
-- 
2.21.0.dirty

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
