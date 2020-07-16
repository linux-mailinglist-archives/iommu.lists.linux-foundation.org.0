Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id B5012222EA5
	for <lists.iommu@lfdr.de>; Fri, 17 Jul 2020 01:09:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 17FF020396;
	Thu, 16 Jul 2020 23:09:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NEOxkErA-mVK; Thu, 16 Jul 2020 23:09:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 9A4D82039E;
	Thu, 16 Jul 2020 23:09:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 841C3C08A9;
	Thu, 16 Jul 2020 23:09:27 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E7383C0733
 for <iommu@lists.linux-foundation.org>; Thu, 16 Jul 2020 23:09:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D619286949
 for <iommu@lists.linux-foundation.org>; Thu, 16 Jul 2020 23:09:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ce3X-A5HN0oT for <iommu@lists.linux-foundation.org>;
 Thu, 16 Jul 2020 23:09:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 408BD86948
 for <iommu@lists.linux-foundation.org>; Thu, 16 Jul 2020 23:09:23 +0000 (UTC)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 554288012DFCE76CF193;
 Fri, 17 Jul 2020 07:09:19 +0800 (CST)
Received: from SWX921481.china.huawei.com (10.126.203.111) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.487.0; Fri, 17 Jul 2020 07:09:12 +0800
From: Barry Song <song.bao.hua@hisilicon.com>
To: <robin.murphy@arm.com>, <will@kernel.org>, <joro@8bytes.org>
Subject: [PATCH] iommu/arm-smmu-v3: remove the approach of MSI polling for CMD
 SYNC
Date: Fri, 17 Jul 2020 11:07:09 +1200
Message-ID: <20200716230709.32820-1-song.bao.hua@hisilicon.com>
X-Mailer: git-send-email 2.21.0.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.126.203.111]
X-CFilter-Loop: Reflected
Cc: linux-kernel@vger.kernel.org, linuxarm@huawei.com,
 iommu@lists.linux-foundation.org, Prime Zeng <prime.zeng@hisilicon.com>,
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

Before commit 587e6c10a7ce ("iommu/arm-smmu-v3: Reduce contention during
command-queue insertion"), msi polling perhaps performed better since
it could run outside the spin_lock_irqsave() while the code polling cons
reg was running in the lock.

But after the great reorganization of smmu queue, neither of these two
polling methods are running in a spinlock. And real tests show polling
cons reg via sev means smaller latency. It is probably because polling
by msi will ask hardware to write memory but sev polling depends on the
update of register only.

Using 16 threads to run netperf on hns3 100G NIC with UDP packet size
in 32768bytes and set iommu to strict, TX throughput can improve from
25227.74Mbps to 27145.59Mbps by this patch. In this case, SMMU is super
busy as hns3 sends map/unmap requests extremely frequently.

Cc: Prime Zeng <prime.zeng@hisilicon.com>
Signed-off-by: Barry Song <song.bao.hua@hisilicon.com>
---
 drivers/iommu/arm-smmu-v3.c | 46 +------------------------------------
 1 file changed, 1 insertion(+), 45 deletions(-)

diff --git a/drivers/iommu/arm-smmu-v3.c b/drivers/iommu/arm-smmu-v3.c
index f578677a5c41..e55282a636c8 100644
--- a/drivers/iommu/arm-smmu-v3.c
+++ b/drivers/iommu/arm-smmu-v3.c
@@ -964,12 +964,7 @@ static int arm_smmu_cmdq_build_cmd(u64 *cmd, struct arm_smmu_cmdq_ent *ent)
 		cmd[1] |= FIELD_PREP(CMDQ_PRI_1_RESP, ent->pri.resp);
 		break;
 	case CMDQ_OP_CMD_SYNC:
-		if (ent->sync.msiaddr) {
-			cmd[0] |= FIELD_PREP(CMDQ_SYNC_0_CS, CMDQ_SYNC_0_CS_IRQ);
-			cmd[1] |= ent->sync.msiaddr & CMDQ_SYNC_1_MSIADDR_MASK;
-		} else {
-			cmd[0] |= FIELD_PREP(CMDQ_SYNC_0_CS, CMDQ_SYNC_0_CS_SEV);
-		}
+		cmd[0] |= FIELD_PREP(CMDQ_SYNC_0_CS, CMDQ_SYNC_0_CS_SEV);
 		cmd[0] |= FIELD_PREP(CMDQ_SYNC_0_MSH, ARM_SMMU_SH_ISH);
 		cmd[0] |= FIELD_PREP(CMDQ_SYNC_0_MSIATTR, ARM_SMMU_MEMATTR_OIWB);
 		break;
@@ -983,21 +978,10 @@ static int arm_smmu_cmdq_build_cmd(u64 *cmd, struct arm_smmu_cmdq_ent *ent)
 static void arm_smmu_cmdq_build_sync_cmd(u64 *cmd, struct arm_smmu_device *smmu,
 					 u32 prod)
 {
-	struct arm_smmu_queue *q = &smmu->cmdq.q;
 	struct arm_smmu_cmdq_ent ent = {
 		.opcode = CMDQ_OP_CMD_SYNC,
 	};
 
-	/*
-	 * Beware that Hi16xx adds an extra 32 bits of goodness to its MSI
-	 * payload, so the write will zero the entire command on that platform.
-	 */
-	if (smmu->features & ARM_SMMU_FEAT_MSI &&
-	    smmu->features & ARM_SMMU_FEAT_COHERENCY) {
-		ent.sync.msiaddr = q->base_dma + Q_IDX(&q->llq, prod) *
-				   q->ent_dwords * 8;
-	}
-
 	arm_smmu_cmdq_build_cmd(cmd, &ent);
 }
 
@@ -1251,30 +1235,6 @@ static int arm_smmu_cmdq_poll_until_not_full(struct arm_smmu_device *smmu,
 	return ret;
 }
 
-/*
- * Wait until the SMMU signals a CMD_SYNC completion MSI.
- * Must be called with the cmdq lock held in some capacity.
- */
-static int __arm_smmu_cmdq_poll_until_msi(struct arm_smmu_device *smmu,
-					  struct arm_smmu_ll_queue *llq)
-{
-	int ret = 0;
-	struct arm_smmu_queue_poll qp;
-	struct arm_smmu_cmdq *cmdq = &smmu->cmdq;
-	u32 *cmd = (u32 *)(Q_ENT(&cmdq->q, llq->prod));
-
-	queue_poll_init(smmu, &qp);
-
-	/*
-	 * The MSI won't generate an event, since it's being written back
-	 * into the command queue.
-	 */
-	qp.wfe = false;
-	smp_cond_load_relaxed(cmd, !VAL || (ret = queue_poll(&qp)));
-	llq->cons = ret ? llq->prod : queue_inc_prod_n(llq, 1);
-	return ret;
-}
-
 /*
  * Wait until the SMMU cons index passes llq->prod.
  * Must be called with the cmdq lock held in some capacity.
@@ -1332,10 +1292,6 @@ static int __arm_smmu_cmdq_poll_until_consumed(struct arm_smmu_device *smmu,
 static int arm_smmu_cmdq_poll_until_sync(struct arm_smmu_device *smmu,
 					 struct arm_smmu_ll_queue *llq)
 {
-	if (smmu->features & ARM_SMMU_FEAT_MSI &&
-	    smmu->features & ARM_SMMU_FEAT_COHERENCY)
-		return __arm_smmu_cmdq_poll_until_msi(smmu, llq);
-
 	return __arm_smmu_cmdq_poll_until_consumed(smmu, llq);
 }
 
-- 
2.27.0


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
