Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C10523510B
	for <lists.iommu@lfdr.de>; Sat,  1 Aug 2020 09:49:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id B27E7887C1;
	Sat,  1 Aug 2020 07:49:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w+Jy5IKemFMZ; Sat,  1 Aug 2020 07:49:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id A659F888DF;
	Sat,  1 Aug 2020 07:49:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8BC16C004D;
	Sat,  1 Aug 2020 07:49:40 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C55F7C004D
 for <iommu@lists.linux-foundation.org>; Sat,  1 Aug 2020 07:49:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C216088B7B
 for <iommu@lists.linux-foundation.org>; Sat,  1 Aug 2020 07:49:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pHenqK5MZRTr for <iommu@lists.linux-foundation.org>;
 Sat,  1 Aug 2020 07:49:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 2FFF688B11
 for <iommu@lists.linux-foundation.org>; Sat,  1 Aug 2020 07:49:38 +0000 (UTC)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 333A09CFD358CB65929F;
 Sat,  1 Aug 2020 15:49:33 +0800 (CST)
Received: from SWX921481.china.huawei.com (10.126.203.235) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.487.0; Sat, 1 Aug 2020 15:49:23 +0800
From: Barry Song <song.bao.hua@hisilicon.com>
To: <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
 <iommu@lists.linux-foundation.org>
Subject: [PATCH v3] iommu/arm-smmu-v3: permit users to disable MSI polling
Date: Sat, 1 Aug 2020 19:47:03 +1200
Message-ID: <20200801074703.17108-1-song.bao.hua@hisilicon.com>
X-Mailer: git-send-email 2.21.0.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.126.203.235]
X-CFilter-Loop: Reflected
Cc: prime.zeng@hisilicon.com, linux-arm-kernel@lists.infradead.org
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
UDP packets in size 32KB.
This patch provides a command line option so that users can decide to
use MSI polling or not based on their tests.

Signed-off-by: Barry Song <song.bao.hua@hisilicon.com>
---
 -v3:
  * rebase on top of linux-next as arm-smmu-v3.c has moved;
  * provide a command line option

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
