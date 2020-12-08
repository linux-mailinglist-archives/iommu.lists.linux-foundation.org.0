Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCC42D2A7B
	for <lists.iommu@lfdr.de>; Tue,  8 Dec 2020 13:15:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A00EC86EA6;
	Tue,  8 Dec 2020 12:15:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ENioE00Rga6S; Tue,  8 Dec 2020 12:15:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2D61A8701D;
	Tue,  8 Dec 2020 12:15:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0B685C013B;
	Tue,  8 Dec 2020 12:15:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8B81DC013B
 for <iommu@lists.linux-foundation.org>; Tue,  8 Dec 2020 12:15:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 86FFC86ECA
 for <iommu@lists.linux-foundation.org>; Tue,  8 Dec 2020 12:15:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6puePl+P7hUt for <iommu@lists.linux-foundation.org>;
 Tue,  8 Dec 2020 12:15:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 910E386EA6
 for <iommu@lists.linux-foundation.org>; Tue,  8 Dec 2020 12:15:22 +0000 (UTC)
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CqzdB54Vxzkn7t;
 Tue,  8 Dec 2020 20:14:38 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.487.0; Tue, 8 Dec 2020 20:15:08 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
 <jean-philippe@linaro.org>, <Jonathan.Cameron@huawei.com>,
 <song.bao.hua@hisilicon.com>
Subject: [PATCH v2] iommu/arm-smmu-v3: Fix not checking return value about
 devm_add_action
Date: Tue, 8 Dec 2020 20:15:22 +0800
Message-ID: <1607429722-54861-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Cc: iommu@lists.linux-foundation.org
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

Use devm_add_action_or_reset to avoid the situation where the release
function is not called when devm_add_action returns an error.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
v2:
repositioning devm_add_action_or_reset in the function
arm_smmu_setup_msis, and check the return value.
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 2ddf5ec..b4d3b7d 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -2680,7 +2680,8 @@ static int arm_smmu_cmdq_init(struct arm_smmu_device *smmu)
 		ret = -ENOMEM;
 	} else {
 		cmdq->valid_map = bitmap;
-		devm_add_action(smmu->dev, arm_smmu_cmdq_free_bitmap, bitmap);
+		ret = devm_add_action_or_reset(smmu->dev,
+					       arm_smmu_cmdq_free_bitmap, bitmap);
 	}
 
 	return ret;
@@ -2921,6 +2922,13 @@ static void arm_smmu_setup_msis(struct arm_smmu_device *smmu)
 		return;
 	}
 
+	/* Add callback to free MSIs on teardown */
+	ret = devm_add_action_or_reset(dev, arm_smmu_free_msis, dev);
+	if (ret) {
+		dev_warn(dev, "failed to add callback to free MSIs on teardown\n");
+		return;
+	}
+
 	for_each_msi_entry(desc, dev) {
 		switch (desc->platform.msi_index) {
 		case EVTQ_MSI_INDEX:
@@ -2936,9 +2944,6 @@ static void arm_smmu_setup_msis(struct arm_smmu_device *smmu)
 			continue;
 		}
 	}
-
-	/* Add callback to free MSIs on teardown */
-	devm_add_action(dev, arm_smmu_free_msis, dev);
 }
 
 static void arm_smmu_setup_unique_irqs(struct arm_smmu_device *smmu)
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
