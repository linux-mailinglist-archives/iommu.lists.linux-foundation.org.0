Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id B428D2B922F
	for <lists.iommu@lfdr.de>; Thu, 19 Nov 2020 13:13:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7790286AE6;
	Thu, 19 Nov 2020 12:13:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bsgbSb_9crjX; Thu, 19 Nov 2020 12:13:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 06CE585F85;
	Thu, 19 Nov 2020 12:13:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 009CBC0891;
	Thu, 19 Nov 2020 12:13:08 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9F7AFC1825
 for <iommu@lists.linux-foundation.org>; Thu, 19 Nov 2020 12:13:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 8AB39873C8
 for <iommu@lists.linux-foundation.org>; Thu, 19 Nov 2020 12:13:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZYgvSAlji9QI for <iommu@lists.linux-foundation.org>;
 Thu, 19 Nov 2020 12:13:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9268F873FC
 for <iommu@lists.linux-foundation.org>; Thu, 19 Nov 2020 12:13:05 +0000 (UTC)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CcJTj099Vz709F;
 Thu, 19 Nov 2020 20:12:41 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.210.168.73) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.487.0; Thu, 19 Nov 2020 20:12:49 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <linux-arm-kernel@lists.infradead.org>, <linux-acpi@vger.kernel.org>,
 <iommu@lists.linux-foundation.org>, <devel@acpica.org>
Subject: [RFC PATCH v2 5/8] iommu/arm-smmu-v3: Introduce strtab init helper
Date: Thu, 19 Nov 2020 12:11:47 +0000
Message-ID: <20201119121150.3316-6-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20201119121150.3316-1-shameerali.kolothum.thodi@huawei.com>
References: <20201119121150.3316-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.210.168.73]
X-CFilter-Loop: Reflected
Cc: linuxarm@huawei.com, steven.price@arm.com, guohanjun@huawei.com,
 Sami.Mujawar@arm.com, robin.murphy@arm.com, wanghuiqiang@huawei.com
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

Introduce a helper to check the sid range and to init the l2 strtab
entries(bypass). This will be useful when we have to initialize the
l2 strtab for RMR SIDs.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 26 ++++++++++++---------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index e634bbe60573..1953b317d814 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -2308,6 +2308,19 @@ static bool arm_smmu_sid_in_range(struct arm_smmu_device *smmu, u32 sid)
 
 static struct iommu_ops arm_smmu_ops;
 
+static int arm_smmu_init_sid_strtab(struct arm_smmu_device *smmu, u32 sid)
+{
+	/* Check the SIDs are in range of the SMMU and our stream table */
+	if (!arm_smmu_sid_in_range(smmu, sid))
+		return -ERANGE;
+
+	/* Ensure l2 strtab is initialised */
+	if (smmu->features & ARM_SMMU_FEAT_2_LVL_STRTAB)
+		return arm_smmu_init_l2_strtab(smmu, sid);
+
+	return 0;
+}
+
 static struct iommu_device *arm_smmu_probe_device(struct device *dev)
 {
 	int i, ret;
@@ -2336,21 +2349,12 @@ static struct iommu_device *arm_smmu_probe_device(struct device *dev)
 	INIT_LIST_HEAD(&master->bonds);
 	dev_iommu_priv_set(dev, master);
 
-	/* Check the SIDs are in range of the SMMU and our stream table */
 	for (i = 0; i < master->num_sids; i++) {
 		u32 sid = master->sids[i];
 
-		if (!arm_smmu_sid_in_range(smmu, sid)) {
-			ret = -ERANGE;
+		ret = arm_smmu_init_sid_strtab(smmu, sid);
+		if (ret)
 			goto err_free_master;
-		}
-
-		/* Ensure l2 strtab is initialised */
-		if (smmu->features & ARM_SMMU_FEAT_2_LVL_STRTAB) {
-			ret = arm_smmu_init_l2_strtab(smmu, sid);
-			if (ret)
-				goto err_free_master;
-		}
 	}
 
 	master->ssid_bits = min(smmu->ssid_bits, fwspec->num_pasid_bits);
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
