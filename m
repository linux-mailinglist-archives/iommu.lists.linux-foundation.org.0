Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E47107B58
	for <lists.iommu@lfdr.de>; Sat, 23 Nov 2019 00:31:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 7113526393;
	Fri, 22 Nov 2019 23:31:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8H6bJNFYUcyu; Fri, 22 Nov 2019 23:31:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 1C2A8203FE;
	Fri, 22 Nov 2019 23:31:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 08BFDC18DA;
	Fri, 22 Nov 2019 23:31:57 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 47EFDC18DA
 for <iommu@lists.linux-foundation.org>; Fri, 22 Nov 2019 23:31:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 44490203FE
 for <iommu@lists.linux-foundation.org>; Fri, 22 Nov 2019 23:31:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NJ6YDofwnwsJ for <iommu@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 23:31:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from a27-56.smtp-out.us-west-2.amazonses.com
 (a27-56.smtp-out.us-west-2.amazonses.com [54.240.27.56])
 by silver.osuosl.org (Postfix) with ESMTPS id C73E6203FC
 for <iommu@lists.linux-foundation.org>; Fri, 22 Nov 2019 23:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1574465514;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
 bh=I+X6TUOM+if5qAyGJhvoW4dijbfNXbZbVRwK1j7KFjE=;
 b=Hfjub9LRMjldNK11ick2Jc9sZ400eo+ARXLAPMMK7giGduZgU4vLhki11LLoZyV9
 Lg2Hs9Xr5Ap3WJ9XIdcsY5nfzwVR1JRwEeUoDXnvY7jSo8mWpe+jTLdyEltnFZewovP
 zCXmYgUBvlJ4HCvLfNlh1Aj1DRZ3sEPzqBparJXQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1574465514;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:Feedback-ID;
 bh=I+X6TUOM+if5qAyGJhvoW4dijbfNXbZbVRwK1j7KFjE=;
 b=guRGhOw8hq9j12sZbCqjp+MTLr6+e3YndY9hn0ZjdmZzaLI+IQ00zE8YMmfZpyaF
 CRuVOJeoCNSlElaAU7zs31qvgKX+a2g+oe5YZT107d5Vrhkx59ZKAjFhIdMnhXza5Te
 gIjIgeVtZEUAFCjvr+KLKOXDLzOZvggv/HCpEFuA=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6907FC76F44
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
From: Jordan Crouse <jcrouse@codeaurora.org>
To: iommu@lists.linux-foundation.org
Subject: [PATCH v2 4/8] iommu/arm-smmu: Add split pagetables for Adreno IOMMU
 implementations
Date: Fri, 22 Nov 2019 23:31:54 +0000
Message-ID: <0101016e95752a6f-be2914d9-b8fa-4534-be98-4e9cf7e9fc5d-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574465484-7115-1-git-send-email-jcrouse@codeaurora.org>
References: <1574465484-7115-1-git-send-email-jcrouse@codeaurora.org>
X-SES-Outgoing: 2019.11.22-54.240.27.56
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Cc: robin.murphy@arm.com, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, will@kernel.org,
 linux-arm-kernel@lists.infradead.org
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Add implementation specific support to enable split pagetables for
SMMU implementations attached to Adreno GPUs on Qualcomm targets.

To enable split pagetables the driver will set an attribute on the domain.
if conditions are correct, set up the hardware to support equally sized
TTBR0 and TTBR1 regions and programs the domain pagetable to TTBR1 to make
it available for global buffers while allowing the GPU the chance to
switch the TTBR0 at runtime for per-context pagetables.

After programming the context, the value of the domain attribute can be
queried to see if split pagetables were successfully programmed. The
domain geometry will be updated so that the caller can determine the
start of the region to generate correct virtual addresses.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 drivers/iommu/arm-smmu-impl.c |  3 ++
 drivers/iommu/arm-smmu-qcom.c | 96 +++++++++++++++++++++++++++++++++++++++++++
 drivers/iommu/arm-smmu.c      | 41 ++++++++++++++----
 drivers/iommu/arm-smmu.h      | 11 +++++
 4 files changed, 143 insertions(+), 8 deletions(-)

diff --git a/drivers/iommu/arm-smmu-impl.c b/drivers/iommu/arm-smmu-impl.c
index 33ed682..1e91231 100644
--- a/drivers/iommu/arm-smmu-impl.c
+++ b/drivers/iommu/arm-smmu-impl.c
@@ -174,5 +174,8 @@ struct arm_smmu_device *arm_smmu_impl_init(struct arm_smmu_device *smmu)
 	if (of_device_is_compatible(smmu->dev->of_node, "qcom,sdm845-smmu-500"))
 		return qcom_smmu_impl_init(smmu);
 
+	if (of_device_is_compatible(smmu->dev->of_node, "qcom,adreno-smmu-v2"))
+		return adreno_smmu_impl_init(smmu);
+
 	return smmu;
 }
diff --git a/drivers/iommu/arm-smmu-qcom.c b/drivers/iommu/arm-smmu-qcom.c
index 24c071c..6591e49 100644
--- a/drivers/iommu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm-smmu-qcom.c
@@ -11,6 +11,102 @@ struct qcom_smmu {
 	struct arm_smmu_device smmu;
 };
 
+#define TG0_4K  0
+#define TG0_64K 1
+#define TG0_16K 2
+
+#define TG1_16K 1
+#define TG1_4K  2
+#define TG1_64K 3
+
+/*
+ * Set up split pagetables for Adreno SMMUs that will keep a static TTBR1 for
+ * global buffers and dynamically switch TTBR0 from the GPU for context specific
+ * pagetables.
+ */
+static int adreno_smmu_init_context_bank(struct arm_smmu_domain *smmu_domain,
+		struct io_pgtable_cfg *pgtbl_cfg)
+{
+	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
+	struct arm_smmu_cb *cb = &smmu_domain->smmu->cbs[cfg->cbndx];
+	u32 tcr, tg0;
+
+	/*
+	 * Return error if split pagetables are not enabled so that arm-smmu
+	 * do the default configuration
+	 */
+	if (!(pgtbl_cfg->quirks & IO_PGTABLE_QUIRK_ARM_TTBR1))
+		return -EINVAL;
+
+	/* Get the bank configuration from the pagetable config */
+	tcr = arm_smmu_lpae_tcr(pgtbl_cfg) & 0xffff;
+
+	/*
+	 * The TCR configuration for TTBR0 and TTBR1 is (almost) identical so
+	 * just duplicate the T0 configuration and shift it
+	 */
+	cb->tcr[0] = (tcr << 16) | tcr;
+
+	/*
+	 * The (almost) above refers to the granule size field which is
+	 * different for TTBR0 and TTBR1. With the TTBR1 quirk enabled,
+	 * io-pgtable-arm will write the T1 appropriate granule size for tg.
+	 * Translate the configuration from the T1 field to get the right value
+	 * for T0
+	 */
+	if (pgtbl_cfg->arm_lpae_s1_cfg.tcr.tg == TG1_4K)
+		tg0 = TG0_4K;
+	else if (pgtbl_cfg->arm_lpae_s1_cfg.tcr.tg == TG1_16K)
+		tg0 = TG0_16K;
+	else
+		tg0 = TG0_64K;
+
+	/* clear and set the correct value for TG0  */
+	cb->tcr[0] &= ~TCR_TG0;
+	cb->tcr[0] |= FIELD_PREP(TCR_TG0, tg0);
+
+	/*
+	 * arm_smmu_lape_tcr2 sets SEP_UPSTREAM which is always the appropriate
+	 * SEP for Adreno IOMMU
+	 */
+	cb->tcr[1] = arm_smmu_lpae_tcr2(pgtbl_cfg);
+	cb->tcr[1] |= TCR2_AS;
+
+	/* TTBRs */
+	cb->ttbr[0] = FIELD_PREP(TTBRn_ASID, cfg->asid);
+	cb->ttbr[1] = pgtbl_cfg->arm_lpae_s1_cfg.ttbr;
+	cb->ttbr[1] |= FIELD_PREP(TTBRn_ASID, cfg->asid);
+
+	/* MAIRs */
+	cb->mair[0] = pgtbl_cfg->arm_lpae_s1_cfg.mair;
+	cb->mair[1] = pgtbl_cfg->arm_lpae_s1_cfg.mair >> 32;
+
+	return 0;
+}
+
+static int adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
+		struct io_pgtable_cfg *pgtbl_cfg)
+{
+	/* Enable split pagetables if the flag is set and the format matches */
+	if (smmu_domain->split_pagetables)
+		if (smmu_domain->stage == ARM_SMMU_DOMAIN_S1 &&
+			smmu_domain->cfg.fmt == ARM_SMMU_CTX_FMT_AARCH64)
+			pgtbl_cfg->quirks |= IO_PGTABLE_QUIRK_ARM_TTBR1;
+
+	return 0;
+}
+
+static const struct arm_smmu_impl adreno_smmu_impl = {
+	.init_context = adreno_smmu_init_context,
+	.init_context_bank = adreno_smmu_init_context_bank,
+};
+
+struct arm_smmu_device *adreno_smmu_impl_init(struct arm_smmu_device *smmu)
+{
+	smmu->impl = &adreno_smmu_impl;
+	return smmu;
+}
+
 static int qcom_sdm845_smmu500_reset(struct arm_smmu_device *smmu)
 {
 	int ret;
diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
index 5c7c32b..f5dc950 100644
--- a/drivers/iommu/arm-smmu.c
+++ b/drivers/iommu/arm-smmu.c
@@ -91,13 +91,6 @@ struct arm_smmu_smr {
 	bool				valid;
 };
 
-struct arm_smmu_cb {
-	u64				ttbr[2];
-	u32				tcr[2];
-	u32				mair[2];
-	struct arm_smmu_cfg		*cfg;
-};
-
 struct arm_smmu_master_cfg {
 	struct arm_smmu_device		*smmu;
 	s16				smendx[];
@@ -512,10 +505,20 @@ static void arm_smmu_init_context_bank(struct arm_smmu_domain *smmu_domain,
 {
 	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
 	struct arm_smmu_cb *cb = &smmu_domain->smmu->cbs[cfg->cbndx];
+	struct arm_smmu_device *smmu = smmu_domain->smmu;
 	bool stage1 = cfg->cbar != CBAR_TYPE_S2_TRANS;
 
 	cb->cfg = cfg;
 
+	if (smmu->impl && smmu->impl->init_context_bank) {
+		/*
+		 * If the implementation specific function returns non-zero then
+		 * fall back to the default configuration
+		 */
+		if (!smmu->impl->init_context_bank(smmu_domain, pgtbl_cfg))
+			return;
+	}
+
 	/* TCR */
 	if (stage1) {
 		if (cfg->fmt == ARM_SMMU_CTX_FMT_AARCH32_S) {
@@ -802,7 +805,17 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
 
 	/* Update the domain's page sizes to reflect the page table format */
 	domain->pgsize_bitmap = pgtbl_cfg.pgsize_bitmap;
-	domain->geometry.aperture_end = (1UL << ias) - 1;
+
+	if (pgtbl_cfg.quirks & IO_PGTABLE_QUIRK_ARM_TTBR1) {
+		domain->geometry.aperture_start = ~((1UL << ias) - 1);
+		domain->geometry.aperture_end = ~0UL;
+	} else {
+		domain->geometry.aperture_start = 0;
+		domain->geometry.aperture_end = (1UL << ias) - 1;
+
+		smmu_domain->split_pagetables = false;
+	}
+
 	domain->geometry.force_aperture = true;
 
 	/* Initialise the context bank with our page table cfg */
@@ -1485,6 +1498,9 @@ static int arm_smmu_domain_get_attr(struct iommu_domain *domain,
 		case DOMAIN_ATTR_NESTING:
 			*(int *)data = (smmu_domain->stage == ARM_SMMU_DOMAIN_NESTED);
 			return 0;
+		case DOMAIN_ATTR_SPLIT_TABLES:
+			*(int *)data = smmu_domain->split_pagetables;
+			return 0;
 		default:
 			return -ENODEV;
 		}
@@ -1525,6 +1541,15 @@ static int arm_smmu_domain_set_attr(struct iommu_domain *domain,
 			else
 				smmu_domain->stage = ARM_SMMU_DOMAIN_S1;
 			break;
+		case DOMAIN_ATTR_SPLIT_TABLES:
+			if (smmu_domain->smmu) {
+				return -EPERM;
+				goto out_unlock;
+			}
+
+			if (*(int *) data)
+				smmu_domain->split_pagetables = true;
+			break;
 		default:
 			ret = -ENODEV;
 		}
diff --git a/drivers/iommu/arm-smmu.h b/drivers/iommu/arm-smmu.h
index 0eb498f..35158ee 100644
--- a/drivers/iommu/arm-smmu.h
+++ b/drivers/iommu/arm-smmu.h
@@ -329,6 +329,14 @@ struct arm_smmu_domain {
 	struct mutex			init_mutex; /* Protects smmu pointer */
 	spinlock_t			cb_lock; /* Serialises ATS1* ops and TLB syncs */
 	struct iommu_domain		domain;
+	bool				split_pagetables;
+};
+
+struct arm_smmu_cb {
+	u64				ttbr[2];
+	u32				tcr[2];
+	u32				mair[2];
+	struct arm_smmu_cfg		*cfg;
 };
 
 static inline u32 arm_smmu_lpae_tcr(struct io_pgtable_cfg *cfg)
@@ -359,6 +367,8 @@ struct arm_smmu_impl {
 	int (*reset)(struct arm_smmu_device *smmu);
 	int (*init_context)(struct arm_smmu_domain *smmu_domain,
 			struct io_pgtable_cfg *pgtbl_cfg);
+	int (*init_context_bank)(struct arm_smmu_domain *smmu_domain,
+			struct io_pgtable_cfg *pgtable_cfg);
 	void (*tlb_sync)(struct arm_smmu_device *smmu, int page, int sync,
 			 int status);
 };
@@ -425,6 +435,7 @@ static inline void arm_smmu_writeq(struct arm_smmu_device *smmu, int page,
 
 struct arm_smmu_device *arm_smmu_impl_init(struct arm_smmu_device *smmu);
 struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu);
+struct arm_smmu_device *adreno_smmu_impl_init(struct arm_smmu_device *smmu);
 
 int arm_mmu500_reset(struct arm_smmu_device *smmu);
 
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
