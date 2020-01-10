Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C99F137122
	for <lists.iommu@lfdr.de>; Fri, 10 Jan 2020 16:26:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E11FC86B20;
	Fri, 10 Jan 2020 15:26:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6_r27t59Kc6B; Fri, 10 Jan 2020 15:26:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4444A86B39;
	Fri, 10 Jan 2020 15:26:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 38CE6C0881;
	Fri, 10 Jan 2020 15:26:11 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0EA46C0881
 for <iommu@lists.linux-foundation.org>; Fri, 10 Jan 2020 15:26:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id EFC0186B39
 for <iommu@lists.linux-foundation.org>; Fri, 10 Jan 2020 15:26:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mZGFL4qSHXZI for <iommu@lists.linux-foundation.org>;
 Fri, 10 Jan 2020 15:26:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 2197886B20
 for <iommu@lists.linux-foundation.org>; Fri, 10 Jan 2020 15:26:09 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 81E8D30E;
 Fri, 10 Jan 2020 07:26:08 -0800 (PST)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com
 [10.1.196.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E99363F6C4;
 Fri, 10 Jan 2020 07:26:07 -0800 (PST)
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org
Subject: [PATCH] iommu/arm-smmu: Improve SMR mask test
Date: Fri, 10 Jan 2020 15:25:02 +0000
Message-Id: <2e0f837b38671a322d33a18b7447b95ac2fba796.1578669732.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.23.0.dirty
MIME-Version: 1.0
Cc: iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org
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

Make the SMR mask test more robust against SMR0 being live
at probe time, which might happen once we start supporting
firmware reservations for framebuffers and suchlike.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/arm-smmu.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
index 4f1a350d9529..df6490bc7700 100644
--- a/drivers/iommu/arm-smmu.c
+++ b/drivers/iommu/arm-smmu.c
@@ -946,23 +946,36 @@ static void arm_smmu_write_sme(struct arm_smmu_device *smmu, int idx)
 static void arm_smmu_test_smr_masks(struct arm_smmu_device *smmu)
 {
 	u32 smr;
+	int i;
 
 	if (!smmu->smrs)
 		return;
-
+	/*
+	 * If we've had to accommodate firmware memory regions, we may
+	 * have live SMRs by now; tread carefully...
+	 *
+	 * Somewhat perversely, not having a free SMR for this test implies we
+	 * can get away without it anyway, as we'll only be able to 'allocate'
+	 * these SMRs for the ID/mask values we're already trusting to be OK.
+	 */
+	for (i = 0; i < smmu->num_mapping_groups; i++)
+		if (!smmu->smrs[i].valid)
+			goto smr_ok;
+	return;
+smr_ok:
 	/*
 	 * SMR.ID bits may not be preserved if the corresponding MASK
 	 * bits are set, so check each one separately. We can reject
 	 * masters later if they try to claim IDs outside these masks.
 	 */
 	smr = FIELD_PREP(SMR_ID, smmu->streamid_mask);
-	arm_smmu_gr0_write(smmu, ARM_SMMU_GR0_SMR(0), smr);
-	smr = arm_smmu_gr0_read(smmu, ARM_SMMU_GR0_SMR(0));
+	arm_smmu_gr0_write(smmu, ARM_SMMU_GR0_SMR(i), smr);
+	smr = arm_smmu_gr0_read(smmu, ARM_SMMU_GR0_SMR(i));
 	smmu->streamid_mask = FIELD_GET(SMR_ID, smr);
 
 	smr = FIELD_PREP(SMR_MASK, smmu->streamid_mask);
-	arm_smmu_gr0_write(smmu, ARM_SMMU_GR0_SMR(0), smr);
-	smr = arm_smmu_gr0_read(smmu, ARM_SMMU_GR0_SMR(0));
+	arm_smmu_gr0_write(smmu, ARM_SMMU_GR0_SMR(i), smr);
+	smr = arm_smmu_gr0_read(smmu, ARM_SMMU_GR0_SMR(i));
 	smmu->smr_mask_mask = FIELD_GET(SMR_MASK, smr);
 }
 
-- 
2.23.0.dirty

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
