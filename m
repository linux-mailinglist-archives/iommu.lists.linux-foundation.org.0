Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 522DE2483BE
	for <lists.iommu@lfdr.de>; Tue, 18 Aug 2020 13:20:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id EEAB02012D;
	Tue, 18 Aug 2020 11:20:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id urEcjzIGimh1; Tue, 18 Aug 2020 11:20:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 5E13D203A6;
	Tue, 18 Aug 2020 11:20:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 54569C0051;
	Tue, 18 Aug 2020 11:20:43 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 955DBC0051
 for <iommu@lists.linux-foundation.org>; Tue, 18 Aug 2020 11:20:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7FEFB855D1
 for <iommu@lists.linux-foundation.org>; Tue, 18 Aug 2020 11:20:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bO8xMF-DTcS9 for <iommu@lists.linux-foundation.org>;
 Tue, 18 Aug 2020 11:20:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 5DBDF855CE
 for <iommu@lists.linux-foundation.org>; Tue, 18 Aug 2020 11:20:40 +0000 (UTC)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 4B54B79B132AA6F462B8;
 Tue, 18 Aug 2020 19:20:36 +0800 (CST)
Received: from SWX921481.china.huawei.com (10.126.202.241) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Tue, 18 Aug 2020 19:20:29 +0800
From: Barry Song <song.bao.hua@hisilicon.com>
To: <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>
Subject: [PATCH v4] iommu/arm-smmu-v3: permit users to disable msi polling
Date: Tue, 18 Aug 2020 23:17:52 +1200
Message-ID: <20200818111752.18624-1-song.bao.hua@hisilicon.com>
X-Mailer: git-send-email 2.21.0.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.126.202.241]
X-CFilter-Loop: Reflected
Cc: iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org,
 prime.zeng@hisilicon.com, linuxarm@huawei.com
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

Polling by MSI isn't necessarily faster than polling by SEV. Tests on
hi1620 show hns3 100G NIC network throughput can improve from 25G to
27G if we disable MSI polling while running 16 netperf threads sending
UDP packets in size 32KB. TX throughput can improve from 7G to 7.7G for
single thread.
The reason for the throughput improvement is that the latency to poll
the completion of CMD_SYNC becomes smaller. After sending a CMD_SYNC
in an empty cmd queue, typically we need to wait for 280ns using MSI
polling. But we only need around 190ns after disabling MSI polling.
This patch provides a command line option so that users can decide to
use MSI polling or not based on their tests.

Signed-off-by: Barry Song <song.bao.hua@hisilicon.com>
---
 -v4: rebase on top of 5.9-rc1
 refine changelog

 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 7196207be7ea..89d3cb391fef 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -418,6 +418,11 @@ module_param_named(disable_bypass, disable_bypass, bool, S_IRUGO);
 MODULE_PARM_DESC(disable_bypass,
 	"Disable bypass streams such that incoming transactions from devices that are not attached to an iommu domain will report an abort back to the device and will not be allowed to pass through the SMMU.");
 
+static bool disable_msipolling;
+module_param_named(disable_msipolling, disable_msipolling, bool, S_IRUGO);
+MODULE_PARM_DESC(disable_msipolling,
+	"Disable MSI-based polling for CMD_SYNC completion.");
+
 enum pri_resp {
 	PRI_RESP_DENY = 0,
 	PRI_RESP_FAIL = 1,
@@ -980,6 +985,13 @@ static int arm_smmu_cmdq_build_cmd(u64 *cmd, struct arm_smmu_cmdq_ent *ent)
 	return 0;
 }
 
+static bool arm_smmu_use_msipolling(struct arm_smmu_device *smmu)
+{
+	return !disable_msipolling &&
+	       smmu->features & ARM_SMMU_FEAT_COHERENCY &&
+	       smmu->features & ARM_SMMU_FEAT_MSI;
+}
+
 static void arm_smmu_cmdq_build_sync_cmd(u64 *cmd, struct arm_smmu_device *smmu,
 					 u32 prod)
 {
@@ -992,8 +1004,7 @@ static void arm_smmu_cmdq_build_sync_cmd(u64 *cmd, struct arm_smmu_device *smmu,
 	 * Beware that Hi16xx adds an extra 32 bits of goodness to its MSI
 	 * payload, so the write will zero the entire command on that platform.
 	 */
-	if (smmu->features & ARM_SMMU_FEAT_MSI &&
-	    smmu->features & ARM_SMMU_FEAT_COHERENCY) {
+	if (arm_smmu_use_msipolling(smmu)) {
 		ent.sync.msiaddr = q->base_dma + Q_IDX(&q->llq, prod) *
 				   q->ent_dwords * 8;
 	}
@@ -1332,8 +1343,7 @@ static int __arm_smmu_cmdq_poll_until_consumed(struct arm_smmu_device *smmu,
 static int arm_smmu_cmdq_poll_until_sync(struct arm_smmu_device *smmu,
 					 struct arm_smmu_ll_queue *llq)
 {
-	if (smmu->features & ARM_SMMU_FEAT_MSI &&
-	    smmu->features & ARM_SMMU_FEAT_COHERENCY)
+	if (arm_smmu_use_msipolling(smmu))
 		return __arm_smmu_cmdq_poll_until_msi(smmu, llq);
 
 	return __arm_smmu_cmdq_poll_until_consumed(smmu, llq);
-- 
2.27.0


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
