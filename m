Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E54E3006D8
	for <lists.iommu@lfdr.de>; Fri, 22 Jan 2021 16:15:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3EF8A872F2;
	Fri, 22 Jan 2021 15:15:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tv3XN+Y48M7L; Fri, 22 Jan 2021 15:15:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id E12DD872FA;
	Fri, 22 Jan 2021 15:15:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BFEA8C0FA8;
	Fri, 22 Jan 2021 15:15:16 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CE736C013A
 for <iommu@lists.linux-foundation.org>; Fri, 22 Jan 2021 15:15:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C328086EA7
 for <iommu@lists.linux-foundation.org>; Fri, 22 Jan 2021 15:15:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EhPyzrhc+Zep for <iommu@lists.linux-foundation.org>;
 Fri, 22 Jan 2021 15:15:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by whitealder.osuosl.org (Postfix) with ESMTPS id AF3E486EA5
 for <iommu@lists.linux-foundation.org>; Fri, 22 Jan 2021 15:15:13 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id c127so4633379wmf.5
 for <iommu@lists.linux-foundation.org>; Fri, 22 Jan 2021 07:15:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ntk2/pbJ2AgVXpOqk4Ha4X6r0ZxNkhIQKPGaycDZiS4=;
 b=y3Bre9FMGcwWrKLpN5ULpOEm9ome9CrjE082UkjvfcKH18FQjsWCeJm58hLxh6pEt4
 iZVT/ixsjbZ+zVqUKGyOIGXkVBGy7Rsy1KBv82kYaWoLf8lxMYbsh/gthaIU0+j0Fraf
 5k7LDwtz16Wdlb92strSIkEhb9OrpZlKE8kezQUywd9t0ZLJtQ513zywP6aQtih/xWkJ
 H5+IM7jD2/5bMRjDBcGU90fDwShCZf6wMlhTDHadzKBV1q3W5tsDDzmC70wJ+ABxWKSF
 wVSp7qTlJlxvh/S8WHitAbvmAYDhvr1xMQZyCdg7YOyIiPmofhv/IcFoaQ6aUec0Yn9y
 M5kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ntk2/pbJ2AgVXpOqk4Ha4X6r0ZxNkhIQKPGaycDZiS4=;
 b=bVgXImI/X/EDn0gFhUKEEo7uXmi5oEUZuHsk2kwileFhAE4Izyj54qr3jw8KvKd8xi
 QM6BBnJ0MHinkSTmc0wI5MkXT+6aTKH84oBbmoWJ4uxCiGkS6jslQfG7QlQC55a49WvT
 BfQxuBSgs058YkrIFIt9t3tu+TPMA+fOToEqZlN4/0b80gNzgZQnJA8w+8QjvPFAIIqr
 HTp2l0bjsu3v7poyyvLqQvZPE9DSUZYdUOqiXf+a5YoOph/CqYIbQP+8Byk05NRB36Uh
 bJzoID3jQ6EqbwpvtQ1lEzujigVV1b0lX8zuophVpr1AJUsZVLcqqOLPeVx2W8wVHSPI
 sYhA==
X-Gm-Message-State: AOAM5330gNQkjfDLcnmHVjzGqA/H+cm+WJkcQO+4rSWPDIL4U2oIacoZ
 DB7UvmZyYCB0bFWznwF1mWL1Wg==
X-Google-Smtp-Source: ABdhPJz9P6xl/u/HnMbRtBQ9G5R8wD6NGj+dPcRnou3DTulpqA0805Krkk/y+fFlpgElo+506BdTlg==
X-Received: by 2002:a1c:2b46:: with SMTP id r67mr4403148wmr.162.1611328512046; 
 Fri, 22 Jan 2021 07:15:12 -0800 (PST)
Received: from localhost.localdomain
 ([2001:1715:4e26:a7e0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id h1sm9001945wrr.73.2021.01.22.07.15.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 07:15:11 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: will@kernel.org,
	robin.murphy@arm.com,
	joro@8bytes.org
Subject: [PATCH v2 2/3] iommu/arm-smmu-v3: Make BTM optional for SVA
Date: Fri, 22 Jan 2021 16:10:55 +0100
Message-Id: <20210122151054.2833521-3-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210122151054.2833521-1-jean-philippe@linaro.org>
References: <20210122151054.2833521-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, vivek.gautam@arm.com,
 iommu@lists.linux-foundation.org, zhangfei.gao@linaro.org,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

When BTM isn't supported by the SMMU, send invalidations on the
command queue.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h     |  3 +++
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c | 10 +++++++---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c     | 15 +++++++++++++++
 3 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index da525f46dab4..56bc0c3d4f4a 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -694,6 +694,9 @@ extern struct arm_smmu_ctx_desc quiet_cd;
 int arm_smmu_write_ctx_desc(struct arm_smmu_domain *smmu_domain, int ssid,
 			    struct arm_smmu_ctx_desc *cd);
 void arm_smmu_tlb_inv_asid(struct arm_smmu_device *smmu, u16 asid);
+void arm_smmu_tlb_inv_range_asid(unsigned long iova, size_t size, int asid,
+				 size_t granule, bool leaf,
+				 struct arm_smmu_domain *smmu_domain);
 bool arm_smmu_free_asid(struct arm_smmu_ctx_desc *cd);
 int arm_smmu_atc_inv_domain(struct arm_smmu_domain *smmu_domain, int ssid,
 			    unsigned long iova, size_t size);
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
index e13b092e6004..bb251cab61f3 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
@@ -182,9 +182,13 @@ static void arm_smmu_mm_invalidate_range(struct mmu_notifier *mn,
 					 unsigned long start, unsigned long end)
 {
 	struct arm_smmu_mmu_notifier *smmu_mn = mn_to_smmu(mn);
+	struct arm_smmu_domain *smmu_domain = smmu_mn->domain;
+	size_t size = end - start + 1;
 
-	arm_smmu_atc_inv_domain(smmu_mn->domain, mm->pasid, start,
-				end - start + 1);
+	if (!(smmu_domain->smmu->features & ARM_SMMU_FEAT_BTM))
+		arm_smmu_tlb_inv_range_asid(start, size, smmu_mn->cd->asid,
+					    PAGE_SIZE, false, smmu_domain);
+	arm_smmu_atc_inv_domain(smmu_domain, mm->pasid, start, size);
 }
 
 static void arm_smmu_mm_release(struct mmu_notifier *mn, struct mm_struct *mm)
@@ -391,7 +395,7 @@ bool arm_smmu_sva_supported(struct arm_smmu_device *smmu)
 	unsigned long reg, fld;
 	unsigned long oas;
 	unsigned long asid_bits;
-	u32 feat_mask = ARM_SMMU_FEAT_BTM | ARM_SMMU_FEAT_COHERENCY;
+	u32 feat_mask = ARM_SMMU_FEAT_COHERENCY;
 
 	if (vabits_actual == 52)
 		feat_mask |= ARM_SMMU_FEAT_VAX;
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 86cbac77c941..111467888e88 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -1743,6 +1743,21 @@ static void arm_smmu_tlb_inv_range_domain(unsigned long iova, size_t size,
 	arm_smmu_atc_inv_domain(smmu_domain, 0, iova, size);
 }
 
+void arm_smmu_tlb_inv_range_asid(unsigned long iova, size_t size, int asid,
+				 size_t granule, bool leaf,
+				 struct arm_smmu_domain *smmu_domain)
+{
+	struct arm_smmu_cmdq_ent cmd = {
+		.opcode	= CMDQ_OP_TLBI_NH_VA,
+		.tlbi = {
+			.asid	= asid,
+			.leaf	= leaf,
+		},
+	};
+
+	__arm_smmu_tlb_inv_range(&cmd, iova, size, granule, smmu_domain);
+}
+
 static void arm_smmu_tlb_inv_page_nosync(struct iommu_iotlb_gather *gather,
 					 unsigned long iova, size_t granule,
 					 void *cookie)
-- 
2.30.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
