Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6AE1D9E85
	for <lists.iommu@lfdr.de>; Tue, 19 May 2020 20:02:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4655E86D6A;
	Tue, 19 May 2020 18:02:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0UR9lVErdfhL; Tue, 19 May 2020 18:02:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 77E7086D5B;
	Tue, 19 May 2020 18:02:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 62EC3C0881;
	Tue, 19 May 2020 18:02:00 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 73947C0176
 for <iommu@lists.linux-foundation.org>; Tue, 19 May 2020 18:01:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 599B7888A3
 for <iommu@lists.linux-foundation.org>; Tue, 19 May 2020 18:01:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7h2+Dd6geQ-z for <iommu@lists.linux-foundation.org>;
 Tue, 19 May 2020 18:01:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 481BD88898
 for <iommu@lists.linux-foundation.org>; Tue, 19 May 2020 18:01:55 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id u1so168798wmn.3
 for <iommu@lists.linux-foundation.org>; Tue, 19 May 2020 11:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rToHMZCxHAsIaF3IpyT00iryrcB7PnDCG9m/n578RQM=;
 b=zTxuflVpMPQnNC/jFlg6++WPMzeNjS3aQk6NBxzhWtubV/TmenjzSaBsG+HDZizGq2
 um71rJ5TS0ScDom7O6Td3fO231m/NG3K21poGFgv3g3dBSZDDuxCFPWX7XgWtlZ/iSAF
 6g/gKwz1Xr0T6jKI+iAlBAvbjUu1Lc18eEwts8HTnnModl5Ed+1HLi7osni2gnKTo35d
 sWNK3vZAifb3lllujOL+benPr4bthjFkATK0adfVwHpSBS9kdB/UkYb0Sa6DwGYPrOIJ
 SX/fZu8mtsPDlyr+IR6Vy/BdGqP6imd5IPEdJeAckJVv+rbiRNrtQ3g/b21YnuIOFu3j
 PLCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rToHMZCxHAsIaF3IpyT00iryrcB7PnDCG9m/n578RQM=;
 b=U+PJuaM5rn5htDXv5etxVIitaRFi71yVwwSC+aj34RRpFbiT4baIls8pRtY/NRcSst
 NVeTFXfBBe/AjchwCfUYiawTSLd5IavNnkN56c/jFBHFbMF3tYIjtcFeBpmYSWYLl/xp
 Zk/3B78H+dzFi3tQnQowF+iR/X3BlpN4DUQAQaPywi+UIIx7neYhFiWLWqnqpFE3kcNg
 yD6NFd1EKZdaNMiAkzVwmQU9BXXY5iJbN9Y5cq8JmS+JrPt1Cf9D7T/m9iA6WeRoFtos
 pkyojylWxj3TBqo9t8ZWsOQGVo8wEepxm/gdiTd75FHgO1i8CLQXqAKeJ/KZjR5dWk2p
 ps9A==
X-Gm-Message-State: AOAM530A6i7xgYhjRxilj0KkKSrug61gONDWpBA4RNj4wzB4hxzOZOAR
 YDKPq6029XNuBP/cGQkKrLdE9UpmKVz05A==
X-Google-Smtp-Source: ABdhPJxaHbwCBnqSEPAx3PIhJQpRfX/du0X1/nwEBmenH3249G1jv6W/LCezs+vXF4qDnOenTt76yw==
X-Received: by 2002:a1c:2bc2:: with SMTP id r185mr629773wmr.49.1589911313383; 
 Tue, 19 May 2020 11:01:53 -0700 (PDT)
Received: from localhost.localdomain
 ([2001:171b:226e:c200:c43b:ef78:d083:b355])
 by smtp.gmail.com with ESMTPSA id 1sm510496wmz.13.2020.05.19.11.01.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2020 11:01:52 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
 linux-mm@kvack.org
Subject: [PATCH v7 10/24] iommu/arm-smmu-v3: Share process page tables
Date: Tue, 19 May 2020 19:54:48 +0200
Message-Id: <20200519175502.2504091-11-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200519175502.2504091-1-jean-philippe@linaro.org>
References: <20200519175502.2504091-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Cc: fenghua.yu@intel.com, kevin.tian@intel.com, jgg@ziepe.ca,
 catalin.marinas@arm.com, Suzuki K Poulose <suzuki.poulose@arm.com>,
 robin.murphy@arm.com, hch@infradead.org, zhangfei.gao@linaro.org,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, felix.kuehling@amd.com,
 will@kernel.org, christian.koenig@amd.com
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

With Shared Virtual Addressing (SVA), we need to mirror CPU TTBR, TCR,
MAIR and ASIDs in SMMU contexts. Each SMMU has a single ASID space split
into two sets, shared and private. Shared ASIDs correspond to those
obtained from the arch ASID allocator, and private ASIDs are used for
"classic" map/unmap DMA.

Each mm_struct shared with the SMMU will have a single context
descriptor. Add a refcount to keep track of this. It will be protected
by the global SVA lock.

Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
v6->v7: Add lockdep annotations for sva_lock
---
 drivers/iommu/arm-smmu-v3.c | 153 +++++++++++++++++++++++++++++++++++-
 1 file changed, 149 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/arm-smmu-v3.c b/drivers/iommu/arm-smmu-v3.c
index 847c7de0a93f..52cbdf08f5e2 100644
--- a/drivers/iommu/arm-smmu-v3.c
+++ b/drivers/iommu/arm-smmu-v3.c
@@ -22,6 +22,7 @@
 #include <linux/iommu.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
+#include <linux/mmu_context.h>
 #include <linux/msi.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
@@ -33,6 +34,8 @@
 
 #include <linux/amba/bus.h>
 
+#include "io-pgtable-arm.h"
+
 /* MMIO registers */
 #define ARM_SMMU_IDR0			0x0
 #define IDR0_ST_LVL			GENMASK(28, 27)
@@ -589,6 +592,9 @@ struct arm_smmu_ctx_desc {
 	u64				ttbr;
 	u64				tcr;
 	u64				mair;
+
+	refcount_t			refs;
+	struct mm_struct		*mm;
 };
 
 struct arm_smmu_l1_ctx_desc {
@@ -727,6 +733,7 @@ struct arm_smmu_option_prop {
 };
 
 static DEFINE_XARRAY_ALLOC1(asid_xa);
+static DEFINE_MUTEX(sva_lock);
 
 static struct arm_smmu_option_prop arm_smmu_options[] = {
 	{ ARM_SMMU_OPT_SKIP_PREFETCH, "hisilicon,broken-prefetch-cmd" },
@@ -1662,7 +1669,8 @@ static int arm_smmu_write_ctx_desc(struct arm_smmu_domain *smmu_domain,
 #ifdef __BIG_ENDIAN
 			CTXDESC_CD_0_ENDI |
 #endif
-			CTXDESC_CD_0_R | CTXDESC_CD_0_A | CTXDESC_CD_0_ASET |
+			CTXDESC_CD_0_R | CTXDESC_CD_0_A |
+			(cd->mm ? 0 : CTXDESC_CD_0_ASET) |
 			CTXDESC_CD_0_AA64 |
 			FIELD_PREP(CTXDESC_CD_0_ASID, cd->asid) |
 			CTXDESC_CD_0_V;
@@ -1766,12 +1774,147 @@ static void arm_smmu_free_cd_tables(struct arm_smmu_domain *smmu_domain)
 	cdcfg->cdtab = NULL;
 }
 
-static void arm_smmu_free_asid(struct arm_smmu_ctx_desc *cd)
+static void arm_smmu_init_cd(struct arm_smmu_ctx_desc *cd)
 {
+	refcount_set(&cd->refs, 1);
+}
+
+static bool arm_smmu_free_asid(struct arm_smmu_ctx_desc *cd)
+{
+	bool free;
+	struct arm_smmu_ctx_desc *old_cd;
+
 	if (!cd->asid)
-		return;
+		return false;
+
+	free = refcount_dec_and_test(&cd->refs);
+	if (free) {
+		old_cd = xa_erase(&asid_xa, cd->asid);
+		WARN_ON(old_cd != cd);
+	}
+	return free;
+}
+
+static struct arm_smmu_ctx_desc *arm_smmu_share_asid(u16 asid)
+{
+	struct arm_smmu_ctx_desc *cd;
+
+	cd = xa_load(&asid_xa, asid);
+	if (!cd)
+		return NULL;
+
+	if (cd->mm) {
+		/* All devices bound to this mm use the same cd struct. */
+		refcount_inc(&cd->refs);
+		return cd;
+	}
+
+	/*
+	 * Ouch, ASID is already in use for a private cd.
+	 * TODO: seize it.
+	 */
+	return ERR_PTR(-EEXIST);
+}
+
+__maybe_unused
+static struct arm_smmu_ctx_desc *arm_smmu_alloc_shared_cd(struct mm_struct *mm)
+{
+	u16 asid;
+	int ret = 0;
+	u64 tcr, par, reg;
+	struct arm_smmu_ctx_desc *cd;
+	struct arm_smmu_ctx_desc *old_cd = NULL;
+
+	lockdep_assert_held(&sva_lock);
+
+	asid = mm_context_get(mm);
+	if (!asid)
+		return ERR_PTR(-ESRCH);
 
-	xa_erase(&asid_xa, cd->asid);
+	cd = kzalloc(sizeof(*cd), GFP_KERNEL);
+	if (!cd) {
+		ret = -ENOMEM;
+		goto err_put_context;
+	}
+
+	arm_smmu_init_cd(cd);
+
+	old_cd = arm_smmu_share_asid(asid);
+	if (IS_ERR(old_cd)) {
+		ret = PTR_ERR(old_cd);
+		goto err_free_cd;
+	} else if (old_cd) {
+		if (WARN_ON(old_cd->mm != mm)) {
+			ret = -EINVAL;
+			goto err_free_cd;
+		}
+		kfree(cd);
+		mm_context_put(mm);
+		return old_cd;
+	}
+
+	/* Fails if a private ASID has been allocated since we last checked */
+	ret = xa_insert(&asid_xa, asid, cd, GFP_KERNEL);
+	if (ret)
+		goto err_free_cd;
+
+	tcr = FIELD_PREP(CTXDESC_CD_0_TCR_T0SZ, 64ULL - VA_BITS) |
+	      FIELD_PREP(CTXDESC_CD_0_TCR_IRGN0, ARM_LPAE_TCR_RGN_WBWA) |
+	      FIELD_PREP(CTXDESC_CD_0_TCR_ORGN0, ARM_LPAE_TCR_RGN_WBWA) |
+	      FIELD_PREP(CTXDESC_CD_0_TCR_SH0, ARM_LPAE_TCR_SH_IS) |
+	      CTXDESC_CD_0_TCR_EPD1 | CTXDESC_CD_0_AA64;
+
+	switch (PAGE_SIZE) {
+	case SZ_4K:
+		tcr |= FIELD_PREP(CTXDESC_CD_0_TCR_TG0, ARM_LPAE_TCR_TG0_4K);
+		break;
+	case SZ_16K:
+		tcr |= FIELD_PREP(CTXDESC_CD_0_TCR_TG0, ARM_LPAE_TCR_TG0_16K);
+		break;
+	case SZ_64K:
+		tcr |= FIELD_PREP(CTXDESC_CD_0_TCR_TG0, ARM_LPAE_TCR_TG0_64K);
+		break;
+	default:
+		WARN_ON(1);
+		ret = -EINVAL;
+		goto err_free_asid;
+	}
+
+	reg = read_sanitised_ftr_reg(SYS_ID_AA64MMFR0_EL1);
+	par = cpuid_feature_extract_unsigned_field(reg, ID_AA64MMFR0_PARANGE_SHIFT);
+	tcr |= FIELD_PREP(CTXDESC_CD_0_TCR_IPS, par);
+
+	cd->ttbr = virt_to_phys(mm->pgd);
+	cd->tcr = tcr;
+	/*
+	 * MAIR value is pretty much constant and global, so we can just get it
+	 * from the current CPU register
+	 */
+	cd->mair = read_sysreg(mair_el1);
+	cd->asid = asid;
+	cd->mm = mm;
+
+	return cd;
+
+err_free_asid:
+	arm_smmu_free_asid(cd);
+err_free_cd:
+	kfree(cd);
+err_put_context:
+	mm_context_put(mm);
+	return ERR_PTR(ret);
+}
+
+__maybe_unused
+static void arm_smmu_free_shared_cd(struct arm_smmu_ctx_desc *cd)
+{
+	lockdep_assert_held(&sva_lock);
+
+	if (arm_smmu_free_asid(cd)) {
+		/* Unpin ASID */
+		mm_context_put(cd->mm);
+		kfree(cd);
+	}
 }
 
 /* Stream table manipulation functions */
@@ -2481,6 +2624,8 @@ static int arm_smmu_domain_finalise_s1(struct arm_smmu_domain *smmu_domain,
 	struct arm_smmu_s1_cfg *cfg = &smmu_domain->s1_cfg;
 	typeof(&pgtbl_cfg->arm_lpae_s1_cfg.tcr) tcr = &pgtbl_cfg->arm_lpae_s1_cfg.tcr;
 
+	arm_smmu_init_cd(&cfg->cd);
+
 	ret = xa_alloc(&asid_xa, &asid, &cfg->cd,
 		       XA_LIMIT(1, (1 << smmu->asid_bits) - 1), GFP_KERNEL);
 	if (ret)
-- 
2.26.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
