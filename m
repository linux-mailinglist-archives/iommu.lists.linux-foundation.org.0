Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A01F37F913
	for <lists.iommu@lfdr.de>; Thu, 13 May 2021 15:47:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95F2E40FB2;
	Thu, 13 May 2021 13:47:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a2UxLq-N_UZE; Thu, 13 May 2021 13:47:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5292740FA3;
	Thu, 13 May 2021 13:47:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3224BC0001;
	Thu, 13 May 2021 13:47:14 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BE15EC000E
 for <iommu@lists.linux-foundation.org>; Thu, 13 May 2021 13:47:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A06C140FA3
 for <iommu@lists.linux-foundation.org>; Thu, 13 May 2021 13:47:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 54_aviwGGOHM for <iommu@lists.linux-foundation.org>;
 Thu, 13 May 2021 13:47:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8219B40416
 for <iommu@lists.linux-foundation.org>; Thu, 13 May 2021 13:47:11 +0000 (UTC)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FgtDr3ZHYz16PgN;
 Thu, 13 May 2021 21:44:28 +0800 (CST)
Received: from A2006125610.china.huawei.com (10.47.81.63) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.498.0; Thu, 13 May 2021 21:47:00 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <linux-arm-kernel@lists.infradead.org>, <linux-acpi@vger.kernel.org>,
 <iommu@lists.linux-foundation.org>
Subject: [PATCH v4 7/8] iommu/arm-smmu: Get associated RMR info and install
 bypass SMR
Date: Thu, 13 May 2021 14:45:49 +0100
Message-ID: <20210513134550.2117-8-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20210513134550.2117-1-shameerali.kolothum.thodi@huawei.com>
References: <20210513134550.2117-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.47.81.63]
X-CFilter-Loop: Reflected
Cc: jon@solid-run.com, linuxarm@huawei.com, steven.price@arm.com,
 guohanjun@huawei.com, yangyicong@huawei.com, Sami.Mujawar@arm.com,
 robin.murphy@arm.com, wanghuiqiang@huawei.com
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

From: Jon Nettleton <jon@solid-run.com>

Check if there is any RMR info associated with the devices behind
the SMMU and if any, install bypass SMRs for them. This is to
keep any ongoing traffic associated with these devices alive
when we enable/reset SMMU during probe().

Signed-off-by: Jon Nettleton <jon@solid-run.com>
Signed-off-by: Steven Price <steven.price@arm.com>
Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu.c | 64 +++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 6f72c4d208ca..f67aeb30b5ef 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -2042,6 +2042,66 @@ err_reset_platform_ops: __maybe_unused;
 	return err;
 }
 
+static void arm_smmu_rmr_install_bypass_smr(struct arm_smmu_device *smmu)
+{
+	struct list_head rmr_list;
+	struct iommu_rmr *e;
+	int i, cnt = 0;
+	u32 smr;
+	u32 reg;
+
+	INIT_LIST_HEAD(&rmr_list);
+	if (iommu_dma_get_rmrs(dev_fwnode(smmu->dev), &rmr_list))
+		return;
+
+	reg = arm_smmu_gr0_read(smmu, ARM_SMMU_GR0_sCR0);
+
+	if ((reg & ARM_SMMU_sCR0_USFCFG) && !(reg & ARM_SMMU_sCR0_CLIENTPD)) {
+		/*
+		 * SMMU is already enabled and disallowing bypass, so preserve
+		 * the existing SMRs
+		 */
+		for (i = 0; i < smmu->num_mapping_groups; i++) {
+			smr = arm_smmu_gr0_read(smmu, ARM_SMMU_GR0_SMR(i));
+			if (!FIELD_GET(ARM_SMMU_SMR_VALID, smr))
+				continue;
+			smmu->smrs[i].id = FIELD_GET(ARM_SMMU_SMR_ID, smr);
+			smmu->smrs[i].mask = FIELD_GET(ARM_SMMU_SMR_MASK, smr);
+			smmu->smrs[i].valid = true;
+		}
+	}
+
+	list_for_each_entry(e, &rmr_list, list) {
+		u32 sid = e->sid;
+
+		i = arm_smmu_find_sme(smmu, sid, ~0);
+		if (i < 0)
+			continue;
+		if (smmu->s2crs[i].count == 0) {
+			smmu->smrs[i].id = sid;
+			smmu->smrs[i].mask = ~0;
+			smmu->smrs[i].valid = true;
+		}
+		smmu->s2crs[i].count++;
+		smmu->s2crs[i].type = S2CR_TYPE_BYPASS;
+		smmu->s2crs[i].privcfg = S2CR_PRIVCFG_DEFAULT;
+		smmu->s2crs[i].cbndx = 0xff;
+
+		cnt++;
+	}
+
+	if ((reg & ARM_SMMU_sCR0_USFCFG) && !(reg & ARM_SMMU_sCR0_CLIENTPD)) {
+		/* Remove the valid bit for unused SMRs */
+		for (i = 0; i < smmu->num_mapping_groups; i++) {
+			if (smmu->s2crs[i].count == 0)
+				smmu->smrs[i].valid = false;
+		}
+	}
+
+	dev_notice(smmu->dev, "\tpreserved %d boot mapping%s\n", cnt,
+		   cnt == 1 ? "" : "s");
+}
+
 static int arm_smmu_device_probe(struct platform_device *pdev)
 {
 	struct resource *res;
@@ -2168,6 +2228,10 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
 	}
 
 	platform_set_drvdata(pdev, smmu);
+
+	/* Check for RMRs and install bypass SMRs if any */
+	arm_smmu_rmr_install_bypass_smr(smmu);
+
 	arm_smmu_device_reset(smmu);
 	arm_smmu_test_smr_masks(smmu);
 
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
