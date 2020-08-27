Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD07254262
	for <lists.iommu@lfdr.de>; Thu, 27 Aug 2020 11:33:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 15A07851C0;
	Thu, 27 Aug 2020 09:33:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8VIE6nNxru69; Thu, 27 Aug 2020 09:33:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 90FCC85549;
	Thu, 27 Aug 2020 09:33:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7C39BC0051;
	Thu, 27 Aug 2020 09:33:06 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4E345C089E
 for <iommu@lists.linux-foundation.org>; Thu, 27 Aug 2020 09:33:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 0ACCF204F2
 for <iommu@lists.linux-foundation.org>; Thu, 27 Aug 2020 09:33:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q-FDOQpsulub for <iommu@lists.linux-foundation.org>;
 Thu, 27 Aug 2020 09:33:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by silver.osuosl.org (Postfix) with ESMTPS id 535732001A
 for <iommu@lists.linux-foundation.org>; Thu, 27 Aug 2020 09:33:01 +0000 (UTC)
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 85B7DE810C22EFFD019F;
 Thu, 27 Aug 2020 17:32:59 +0800 (CST)
Received: from SWX921481.china.huawei.com (10.126.200.71) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.487.0; Thu, 27 Aug 2020 17:32:53 +0800
From: Barry Song <song.bao.hua@hisilicon.com>
To: <iommu@lists.linux-foundation.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v5 3/3] iommu/arm-smmu-v3: permit users to disable msi polling
Date: Thu, 27 Aug 2020 21:29:57 +1200
Message-ID: <20200827092957.22500-4-song.bao.hua@hisilicon.com>
X-Mailer: git-send-email 2.21.0.windows.1
In-Reply-To: <20200827092957.22500-1-song.bao.hua@hisilicon.com>
References: <20200827092957.22500-1-song.bao.hua@hisilicon.com>
MIME-Version: 1.0
X-Originating-IP: [10.126.200.71]
X-CFilter-Loop: Reflected
Cc: robin.murphy@arm.com, will@kernel.org
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

Reviewed-by: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Barry Song <song.bao.hua@hisilicon.com>
---
 -v5: add Robin's reviewed-by

 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 5b40d535a7c8..7332251dd8cd 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -418,6 +418,11 @@ module_param(disable_bypass, bool, 0444);
 MODULE_PARM_DESC(disable_bypass,
 	"Disable bypass streams such that incoming transactions from devices that are not attached to an iommu domain will report an abort back to the device and will not be allowed to pass through the SMMU.");
 
+static bool disable_msipolling;
+module_param(disable_msipolling, bool, 0444);
+MODULE_PARM_DESC(disable_msipolling,
+	"Disable MSI-based polling for CMD_SYNC completion.");
+
 enum pri_resp {
 	PRI_RESP_DENY = 0,
 	PRI_RESP_FAIL = 1,
@@ -652,6 +657,7 @@ struct arm_smmu_device {
 
 #define ARM_SMMU_OPT_SKIP_PREFETCH	(1 << 0)
 #define ARM_SMMU_OPT_PAGE0_REGS_ONLY	(1 << 1)
+#define ARM_SMMU_OPT_MSIPOLL		(1 << 2)
 	u32				options;
 
 	struct arm_smmu_cmdq		cmdq;
@@ -992,8 +998,7 @@ static void arm_smmu_cmdq_build_sync_cmd(u64 *cmd, struct arm_smmu_device *smmu,
 	 * Beware that Hi16xx adds an extra 32 bits of goodness to its MSI
 	 * payload, so the write will zero the entire command on that platform.
 	 */
-	if (smmu->features & ARM_SMMU_FEAT_MSI &&
-	    smmu->features & ARM_SMMU_FEAT_COHERENCY) {
+	if (smmu->options & ARM_SMMU_OPT_MSIPOLL) {
 		ent.sync.msiaddr = q->base_dma + Q_IDX(&q->llq, prod) *
 				   q->ent_dwords * 8;
 	}
@@ -1332,8 +1337,7 @@ static int __arm_smmu_cmdq_poll_until_consumed(struct arm_smmu_device *smmu,
 static int arm_smmu_cmdq_poll_until_sync(struct arm_smmu_device *smmu,
 					 struct arm_smmu_ll_queue *llq)
 {
-	if (smmu->features & ARM_SMMU_FEAT_MSI &&
-	    smmu->features & ARM_SMMU_FEAT_COHERENCY)
+	if (smmu->options & ARM_SMMU_OPT_MSIPOLL)
 		return __arm_smmu_cmdq_poll_until_msi(smmu, llq);
 
 	return __arm_smmu_cmdq_poll_until_consumed(smmu, llq);
@@ -3741,8 +3745,11 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
 	if (reg & IDR0_SEV)
 		smmu->features |= ARM_SMMU_FEAT_SEV;
 
-	if (reg & IDR0_MSI)
+	if (reg & IDR0_MSI) {
 		smmu->features |= ARM_SMMU_FEAT_MSI;
+		if (coherent && !disable_msipolling)
+			smmu->options |= ARM_SMMU_OPT_MSIPOLL;
+	}
 
 	if (reg & IDR0_HYP)
 		smmu->features |= ARM_SMMU_FEAT_HYP;
-- 
2.27.0


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
