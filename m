Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E3522B227
	for <lists.iommu@lfdr.de>; Thu, 23 Jul 2020 17:06:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 59DDA86C7C;
	Thu, 23 Jul 2020 15:06:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VZZLEU09LviE; Thu, 23 Jul 2020 15:06:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 22EAF86FEC;
	Thu, 23 Jul 2020 15:06:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 104F0C004E;
	Thu, 23 Jul 2020 15:06:08 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B91CAC004E
 for <iommu@lists.linux-foundation.org>; Thu, 23 Jul 2020 15:06:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A6747883AD
 for <iommu@lists.linux-foundation.org>; Thu, 23 Jul 2020 15:06:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KI63M0cukMFt for <iommu@lists.linux-foundation.org>;
 Thu, 23 Jul 2020 15:06:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
 [209.85.218.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 89C2788378
 for <iommu@lists.linux-foundation.org>; Thu, 23 Jul 2020 15:06:03 +0000 (UTC)
Received: by mail-ej1-f65.google.com with SMTP id ga4so6721678ejb.11
 for <iommu@lists.linux-foundation.org>; Thu, 23 Jul 2020 08:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S5AED+AmLuc340wZRBghHkZgD6fSHnG17Dhcvbb6LG8=;
 b=mvhLrEgwzR3iZucDURuIlZgKpouE3ax9X6RmoyEIoxJtpfKwhaFUyz1wyceDW/uD4V
 ANI1CA/B02+gizy2dXsrDVev6D5HIUj73+3SLV9QeevQaqnerDuNqQzp/o/4fKW4zUTw
 6nOyVRFVtYTPloI13JUmCUVWK2zJ3GDyV078QkI9Uf2lU1Iiw9whqcq4eVhL2AZXOzoS
 9sBcohXUxueKQP4XYT7gWYF1aHJCH/xhl9MwDkvrM44w1J4EGC11LxYWc8Jf7Ix+HsDX
 47FqCavQPLPdjBxiiBP4Hq3P9zEB7rkZ7Z8T6vW3Oc5Oi61+iu8pM3ezm8msx0Mp/eWw
 EDRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S5AED+AmLuc340wZRBghHkZgD6fSHnG17Dhcvbb6LG8=;
 b=Ciyh3xjTx0McQdK1Pd+E9+jwc0r2lYitMJZvRSSFxNzFCIdNsatR8SMWDDHwIl0aTv
 FqAC2qzFQ7MehS22TtGK/tFtW3oRwckY99QFeeVy4e34jU6cXrX6lEbldxnaQkg+WdvE
 SN4ArQFiJcXGJadouVkxVOsJCdnGFohDIZrUyAFmJsbi14hKnvlgTcnOiA+AXv1v+mFj
 mnd9p3XbVa+ELjvLyOnqS+JZQADc1gZe5w4zF4M/5++38r8FMj+CJZescub1pa+c+cOu
 xywl6l8P6eBCePnUUGWu97eRSp22Il7NJKAPoH0flaKvwMwhhtqSQabdGxlIZX7vKcbI
 aUug==
X-Gm-Message-State: AOAM530yB5RO2KQeZSo6UlI80Kij1S/Q9cUSzWEP29d2iIcXTgygIL3n
 ZfM2WLxW7AbS2SnYiVCCH95MGawA4x4=
X-Google-Smtp-Source: ABdhPJyrN8twrBRM3dxZpKdtlRVWMv5PMVBDdBZ78Mz4WMqAp4xvT88XtwgShlREF2NsMPW+hYUiWg==
X-Received: by 2002:a17:906:8608:: with SMTP id
 o8mr2836958ejx.156.1595516761662; 
 Thu, 23 Jul 2020 08:06:01 -0700 (PDT)
Received: from localhost.localdomain
 ([2001:1715:4e26:a7e0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id k15sm2145952eji.49.2020.07.23.08.06.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2020 08:06:00 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org,
 linux-mm@kvack.org
Subject: [PATCH v9 13/13] iommu/arm-smmu-v3: Hook up ATC invalidation to mm ops
Date: Thu, 23 Jul 2020 16:57:25 +0200
Message-Id: <20200723145724.3014766-14-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200723145724.3014766-1-jean-philippe@linaro.org>
References: <20200723145724.3014766-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Cc: fenghua.yu@intel.com, Jean-Philippe Brucker <jean-philippe@linaro.org>,
 catalin.marinas@arm.com, robin.murphy@arm.com, hch@infradead.org,
 zhengxiang9@huawei.com, zhangfei.gao@linaro.org, will@kernel.org
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

The invalidate_range() notifier is called for any change to the address
space. Perform the required ATC invalidations.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 drivers/iommu/arm-smmu-v3.h     |  2 ++
 drivers/iommu/arm-smmu-v3-sva.c | 16 +++++++++++++++-
 drivers/iommu/arm-smmu-v3.c     | 18 ++++++++++++++++--
 3 files changed, 33 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm-smmu-v3.h b/drivers/iommu/arm-smmu-v3.h
index 6365c81a4614..baa80498ad9f 100644
--- a/drivers/iommu/arm-smmu-v3.h
+++ b/drivers/iommu/arm-smmu-v3.h
@@ -694,6 +694,8 @@ int arm_smmu_write_ctx_desc(struct arm_smmu_domain *smmu_domain, int ssid,
 			    struct arm_smmu_ctx_desc *cd);
 void arm_smmu_tlb_inv_asid(struct arm_smmu_device *smmu, u16 asid);
 bool arm_smmu_free_asid(struct arm_smmu_ctx_desc *cd);
+int arm_smmu_atc_inv_domain(struct arm_smmu_domain *smmu_domain, int ssid,
+			    unsigned long iova, size_t size);
 
 #ifdef CONFIG_ARM_SMMU_V3_SVA
 bool arm_smmu_sva_supported(struct arm_smmu_device *smmu);
diff --git a/drivers/iommu/arm-smmu-v3-sva.c b/drivers/iommu/arm-smmu-v3-sva.c
index a77abbb7a9d7..1ed6b92b2c72 100644
--- a/drivers/iommu/arm-smmu-v3-sva.c
+++ b/drivers/iommu/arm-smmu-v3-sva.c
@@ -178,6 +178,16 @@ static void arm_smmu_free_shared_cd(struct arm_smmu_ctx_desc *cd)
 	}
 }
 
+static void arm_smmu_mm_invalidate_range(struct mmu_notifier *mn,
+					 struct mm_struct *mm,
+					 unsigned long start, unsigned long end)
+{
+	struct arm_smmu_mmu_notifier *smmu_mn = mn_to_smmu(mn);
+
+	arm_smmu_atc_inv_domain(smmu_mn->domain, mm->pasid, start,
+				end - start + 1);
+}
+
 static void arm_smmu_mm_release(struct mmu_notifier *mn, struct mm_struct *mm)
 {
 	struct arm_smmu_mmu_notifier *smmu_mn = mn_to_smmu(mn);
@@ -196,6 +206,7 @@ static void arm_smmu_mm_release(struct mmu_notifier *mn, struct mm_struct *mm)
 	arm_smmu_write_ctx_desc(smmu_domain, mm->pasid, &quiet_cd);
 
 	arm_smmu_tlb_inv_asid(smmu_domain->smmu, smmu_mn->cd->asid);
+	arm_smmu_atc_inv_domain(smmu_domain, mm->pasid, 0, 0);
 
 	smmu_mn->cleared = true;
 	mutex_unlock(&sva_lock);
@@ -207,6 +218,7 @@ static void arm_smmu_mmu_notifier_free(struct mmu_notifier *mn)
 }
 
 static struct mmu_notifier_ops arm_smmu_mmu_notifier_ops = {
+	.invalidate_range	= arm_smmu_mm_invalidate_range,
 	.release		= arm_smmu_mm_release,
 	.free_notifier		= arm_smmu_mmu_notifier_free,
 };
@@ -279,8 +291,10 @@ static void arm_smmu_mmu_notifier_put(struct arm_smmu_mmu_notifier *smmu_mn)
 	 * If we went through clear(), we've already invalidated, and no
 	 * new TLB entry can have been formed.
 	 */
-	if (!smmu_mn->cleared)
+	if (!smmu_mn->cleared) {
 		arm_smmu_tlb_inv_asid(smmu_domain->smmu, cd->asid);
+		arm_smmu_atc_inv_domain(smmu_domain, mm->pasid, 0, 0);
+	}
 
 	/* Frees smmu_mn */
 	mmu_notifier_put(&smmu_mn->mn);
diff --git a/drivers/iommu/arm-smmu-v3.c b/drivers/iommu/arm-smmu-v3.c
index ad71c07e783f..89efa9db7869 100644
--- a/drivers/iommu/arm-smmu-v3.c
+++ b/drivers/iommu/arm-smmu-v3.c
@@ -1515,6 +1515,20 @@ arm_smmu_atc_inv_to_cmd(int ssid, unsigned long iova, size_t size,
 	size_t inval_grain_shift = 12;
 	unsigned long page_start, page_end;
 
+	/*
+	 * ATS and PASID:
+	 *
+	 * If substream_valid is clear, the PCIe TLP is sent without a PASID
+	 * prefix. In that case all ATC entries within the address range are
+	 * invalidated, including those that were requested with a PASID! There
+	 * is no way to invalidate only entries without PASID.
+	 *
+	 * When using STRTAB_STE_1_S1DSS_SSID0 (reserving CD 0 for non-PASID
+	 * traffic), translation requests without PASID create ATC entries
+	 * without PASID, which must be invalidated with substream_valid clear.
+	 * This has the unpleasant side-effect of invalidating all PASID-tagged
+	 * ATC entries within the address range.
+	 */
 	*cmd = (struct arm_smmu_cmdq_ent) {
 		.opcode			= CMDQ_OP_ATC_INV,
 		.substream_valid	= !!ssid,
@@ -1573,8 +1587,8 @@ static int arm_smmu_atc_inv_master(struct arm_smmu_master *master)
 	return arm_smmu_cmdq_issue_sync(master->smmu);
 }
 
-static int arm_smmu_atc_inv_domain(struct arm_smmu_domain *smmu_domain,
-				   int ssid, unsigned long iova, size_t size)
+int arm_smmu_atc_inv_domain(struct arm_smmu_domain *smmu_domain, int ssid,
+			    unsigned long iova, size_t size)
 {
 	int i;
 	unsigned long flags;
-- 
2.27.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
