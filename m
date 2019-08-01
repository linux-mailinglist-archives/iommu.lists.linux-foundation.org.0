Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id C2EC77DB9A
	for <lists.iommu@lfdr.de>; Thu,  1 Aug 2019 14:35:59 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C98D739AF;
	Thu,  1 Aug 2019 12:35:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 7BCAB4401
	for <iommu@lists.linux-foundation.org>;
	Thu,  1 Aug 2019 12:21:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B49BC8A8
	for <iommu@lists.linux-foundation.org>;
	Thu,  1 Aug 2019 12:21:43 +0000 (UTC)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 5C0348E4323954FF7DE6;
	Thu,  1 Aug 2019 20:21:41 +0800 (CST)
Received: from HGHY4L002753561.china.huawei.com (10.133.215.186) by
	DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server
	id 14.3.439.0; Thu, 1 Aug 2019 20:21:31 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>, John Garry
	<john.garry@huawei.com>, Robin Murphy <robin.murphy@arm.com>, Will Deacon
	<will@kernel.org>, Joerg Roedel <joro@8bytes.org>, linux-arm-kernel
	<linux-arm-kernel@lists.infradead.org>, iommu
	<iommu@lists.linux-foundation.org>, linux-kernel
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] iommu/arm-smmu-v3: add nr_ats_masters to avoid unnecessary
	operations
Date: Thu, 1 Aug 2019 20:20:40 +0800
Message-ID: <20190801122040.26024-1-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.21.0.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.133.215.186]
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

When (smmu_domain->smmu->features & ARM_SMMU_FEAT_ATS) is true, even if a
smmu domain does not contain any ats master, the operations of
arm_smmu_atc_inv_to_cmd() and lock protection in arm_smmu_atc_inv_domain()
are always executed. This will impact performance, especially in
multi-core and stress scenarios. For my FIO test scenario, about 8%
performance reduced.

In fact, we can use a atomic member to record how many ats masters the
smmu contains. And check that without traverse the list and check all
masters one by one in the lock protection.

Fixes: 9ce27afc0830 ("iommu/arm-smmu-v3: Add support for PCI ATS")
Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/iommu/arm-smmu-v3.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm-smmu-v3.c b/drivers/iommu/arm-smmu-v3.c
index a9a9fabd396804a..1b370d9aca95f94 100644
--- a/drivers/iommu/arm-smmu-v3.c
+++ b/drivers/iommu/arm-smmu-v3.c
@@ -631,6 +631,7 @@ struct arm_smmu_domain {
 
 	struct io_pgtable_ops		*pgtbl_ops;
 	bool				non_strict;
+	atomic_t			nr_ats_masters;
 
 	enum arm_smmu_domain_stage	stage;
 	union {
@@ -1531,7 +1532,7 @@ static int arm_smmu_atc_inv_domain(struct arm_smmu_domain *smmu_domain,
 	struct arm_smmu_cmdq_ent cmd;
 	struct arm_smmu_master *master;
 
-	if (!(smmu_domain->smmu->features & ARM_SMMU_FEAT_ATS))
+	if (!atomic_read(&smmu_domain->nr_ats_masters))
 		return 0;
 
 	arm_smmu_atc_inv_to_cmd(ssid, iova, size, &cmd);
@@ -1869,6 +1870,7 @@ static int arm_smmu_enable_ats(struct arm_smmu_master *master)
 	size_t stu;
 	struct pci_dev *pdev;
 	struct arm_smmu_device *smmu = master->smmu;
+	struct arm_smmu_domain *smmu_domain = master->domain;
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(master->dev);
 
 	if (!(smmu->features & ARM_SMMU_FEAT_ATS) || !dev_is_pci(master->dev) ||
@@ -1887,12 +1889,15 @@ static int arm_smmu_enable_ats(struct arm_smmu_master *master)
 		return ret;
 
 	master->ats_enabled = true;
+	atomic_inc(&smmu_domain->nr_ats_masters);
+
 	return 0;
 }
 
 static void arm_smmu_disable_ats(struct arm_smmu_master *master)
 {
 	struct arm_smmu_cmdq_ent cmd;
+	struct arm_smmu_domain *smmu_domain = master->domain;
 
 	if (!master->ats_enabled || !dev_is_pci(master->dev))
 		return;
@@ -1901,6 +1906,7 @@ static void arm_smmu_disable_ats(struct arm_smmu_master *master)
 	arm_smmu_atc_inv_master(master, &cmd);
 	pci_disable_ats(to_pci_dev(master->dev));
 	master->ats_enabled = false;
+	atomic_dec(&smmu_domain->nr_ats_masters);
 }
 
 static void arm_smmu_detach_dev(struct arm_smmu_master *master)
@@ -1915,10 +1921,10 @@ static void arm_smmu_detach_dev(struct arm_smmu_master *master)
 	list_del(&master->domain_head);
 	spin_unlock_irqrestore(&smmu_domain->devices_lock, flags);
 
-	master->domain = NULL;
 	arm_smmu_install_ste_for_dev(master);
 
 	arm_smmu_disable_ats(master);
+	master->domain = NULL;
 }
 
 static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
-- 
1.8.3


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
