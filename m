Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A4E26FA77
	for <lists.iommu@lfdr.de>; Fri, 18 Sep 2020 12:20:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 24C4687309;
	Fri, 18 Sep 2020 10:20:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I-1atAHvLesl; Fri, 18 Sep 2020 10:20:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0C8AD87322;
	Fri, 18 Sep 2020 10:20:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 071F2C0051;
	Fri, 18 Sep 2020 10:20:16 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3D5EDC0051
 for <iommu@lists.linux-foundation.org>; Fri, 18 Sep 2020 10:20:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 28C80876BB
 for <iommu@lists.linux-foundation.org>; Fri, 18 Sep 2020 10:20:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QQL3MV7iIGOe for <iommu@lists.linux-foundation.org>;
 Fri, 18 Sep 2020 10:20:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
 [209.85.208.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 324CC876D7
 for <iommu@lists.linux-foundation.org>; Fri, 18 Sep 2020 10:20:12 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id i1so5605799edv.2
 for <iommu@lists.linux-foundation.org>; Fri, 18 Sep 2020 03:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=muXn6WVG1C2ubiQA6mDNXJM2RPY+26gThmFuxC7YswM=;
 b=z6QhRtjReXVLvxBBg9l9a3K/WfeRHx+GtlK9oaYh4h9MVP1s+aoD8s6BPuhTtRHV87
 9MZNmo645ux7ODElEGTrA2r1rL+yj8uG3vxeJDEbG1G1agpULrlQS9KON9r6E8C2pEG1
 poYKwk2wUxDRVjzFT7bqbeLGm+vZ6slHSLsuMypAvT3PPN2kQjLY3RrC5YvsH7PoJCxo
 sV3wgQ+vEgUYuERMkMFbCWysZ+gWoxVUQOMQdlh5S8ZGHNeV/IyKWTxBu+xDNMqTh3De
 6/r8MoC4vqINBzt7epSP0+AOU2EKYrHWVvCbON8Q3rSKCTW9H7tB9JpUyFfvoAanR6GV
 ZZsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=muXn6WVG1C2ubiQA6mDNXJM2RPY+26gThmFuxC7YswM=;
 b=o3C1fijMeJfa+1Z4BB/blPrNNam1m8tpNrAk4YlayeCIzuIxV7SUlmiANFZNYSq3vN
 tUxJeA+ynkN9kz5rnriJQgnc2ygZZJYgDk6MxQip9ggOkaoQu/e5L5u5CdgpKiGZ88Lj
 w0TGsWur7GqMnoVdGVL6xlnMJgTFfFM9qMO58H0M6X9KdPwNWWIyclRxMNMDkI2gOmBt
 CZBs1ok8C6QSPCNVhaJcgRK8Mfw3WM8ZNw+RAnIddHhdNq9mSeUIsckRFfMoRlgy1EWL
 cpmeWWin/7+/ymK6le8WZtq6lNXRaaBBh4D4cYYSw5cdeBIMZGIdexjxttyVEJERVeBd
 4cMQ==
X-Gm-Message-State: AOAM532jcBAioRdcpquMBaECqP5Rh97MxwgIgJoeckdYhk368FBWmUM4
 Z14ebFcf2NQAbzaegfh2PpgfisfsGqfvzdg0
X-Google-Smtp-Source: ABdhPJylk7Fx5LG9639WZ6uPxJdz8dzVOx07ZdC6OfUdIQTu055fO/jnjIQef7vM1rIOHEtvW4dHbA==
X-Received: by 2002:a50:bb65:: with SMTP id y92mr37442553ede.53.1600424410236; 
 Fri, 18 Sep 2020 03:20:10 -0700 (PDT)
Received: from localhost.localdomain
 ([2001:1715:4e26:a7e0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id r16sm1940674edc.57.2020.09.18.03.20.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2020 03:20:09 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org,
 linux-mm@kvack.org
Subject: [PATCH v10 13/13] iommu/arm-smmu-v3: Hook up ATC invalidation to mm
 ops
Date: Fri, 18 Sep 2020 12:18:53 +0200
Message-Id: <20200918101852.582559-14-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200918101852.582559-1-jean-philippe@linaro.org>
References: <20200918101852.582559-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Cc: fenghua.yu@intel.com, Jean-Philippe Brucker <jean-philippe@linaro.org>,
 catalin.marinas@arm.com, robin.murphy@arm.com, zhangfei.gao@linaro.org,
 will@kernel.org
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
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h    |  2 ++
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c    | 16 +++++++++++++++-
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c    | 18 ++++++++++++++++--
 3 files changed, 33 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index 6365c81a4614..baa80498ad9f 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -694,6 +694,8 @@ int arm_smmu_write_ctx_desc(struct arm_smmu_domain *smmu_domain, int ssid,
 			    struct arm_smmu_ctx_desc *cd);
 void arm_smmu_tlb_inv_asid(struct arm_smmu_device *smmu, u16 asid);
 bool arm_smmu_free_asid(struct arm_smmu_ctx_desc *cd);
+int arm_smmu_atc_inv_domain(struct arm_smmu_domain *smmu_domain, int ssid,
+			    unsigned long iova, size_t size);
 
 #ifdef CONFIG_ARM_SMMU_V3_SVA
 bool arm_smmu_sva_supported(struct arm_smmu_device *smmu);
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
index f57c2bde68a4..7af980dbfd6d 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
@@ -177,6 +177,16 @@ static void arm_smmu_free_shared_cd(struct arm_smmu_ctx_desc *cd)
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
@@ -195,6 +205,7 @@ static void arm_smmu_mm_release(struct mmu_notifier *mn, struct mm_struct *mm)
 	arm_smmu_write_ctx_desc(smmu_domain, mm->pasid, &quiet_cd);
 
 	arm_smmu_tlb_inv_asid(smmu_domain->smmu, smmu_mn->cd->asid);
+	arm_smmu_atc_inv_domain(smmu_domain, mm->pasid, 0, 0);
 
 	smmu_mn->cleared = true;
 	mutex_unlock(&sva_lock);
@@ -206,6 +217,7 @@ static void arm_smmu_mmu_notifier_free(struct mmu_notifier *mn)
 }
 
 static struct mmu_notifier_ops arm_smmu_mmu_notifier_ops = {
+	.invalidate_range	= arm_smmu_mm_invalidate_range,
 	.release		= arm_smmu_mm_release,
 	.free_notifier		= arm_smmu_mmu_notifier_free,
 };
@@ -278,8 +290,10 @@ static void arm_smmu_mmu_notifier_put(struct arm_smmu_mmu_notifier *smmu_mn)
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
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index b43d874ab2e5..576a16a3e8aa 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -1514,6 +1514,20 @@ arm_smmu_atc_inv_to_cmd(int ssid, unsigned long iova, size_t size,
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
@@ -1572,8 +1586,8 @@ static int arm_smmu_atc_inv_master(struct arm_smmu_master *master)
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
2.28.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
