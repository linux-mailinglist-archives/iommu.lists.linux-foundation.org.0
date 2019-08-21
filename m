Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 837D297E7A
	for <lists.iommu@lfdr.de>; Wed, 21 Aug 2019 17:20:12 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id AE850F00;
	Wed, 21 Aug 2019 15:19:30 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id BB778EF4
	for <iommu@lists.linux-foundation.org>;
	Wed, 21 Aug 2019 15:19:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 3908DE6
	for <iommu@lists.linux-foundation.org>;
	Wed, 21 Aug 2019 15:19:28 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ED3FD15AD;
	Wed, 21 Aug 2019 08:19:27 -0700 (PDT)
Received: from fuggles.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
	[10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 116563F718; 
	Wed, 21 Aug 2019 08:19:26 -0700 (PDT)
From: Will Deacon <will@kernel.org>
To: iommu@lists.linux-foundation.org
Subject: [PATCH v2 7/8] iommu/arm-smmu-v3: Avoid locking on invalidation path
	when not using ATS
Date: Wed, 21 Aug 2019 16:17:48 +0100
Message-Id: <20190821151749.23743-8-will@kernel.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190821151749.23743-1-will@kernel.org>
References: <20190821151749.23743-1-will@kernel.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

When ATS is not in use, we can avoid taking the 'devices_lock' for the
domain on the invalidation path by simply caching the number of ATS
masters currently attached. The fiddly part is handling a concurrent
->attach() of an ATS-enabled master to a domain that is being
invalidated, but we can handle this using an 'smp_mb()' to ensure that
our check of the count is ordered after completion of our prior TLB
invalidation.

This also makes our ->attach() and ->detach() flows symmetric wrt ATS
interactions.

Signed-off-by: Will Deacon <will@kernel.org>
---
 drivers/iommu/arm-smmu-v3.c | 37 ++++++++++++++++++++++++++++++++-----
 1 file changed, 32 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/arm-smmu-v3.c b/drivers/iommu/arm-smmu-v3.c
index ca504a60312d..0e43529d55fe 100644
--- a/drivers/iommu/arm-smmu-v3.c
+++ b/drivers/iommu/arm-smmu-v3.c
@@ -654,6 +654,7 @@ struct arm_smmu_domain {
 
 	struct io_pgtable_ops		*pgtbl_ops;
 	bool				non_strict;
+	atomic_t			nr_ats_masters;
 
 	enum arm_smmu_domain_stage	stage;
 	union {
@@ -1926,6 +1927,23 @@ static int arm_smmu_atc_inv_domain(struct arm_smmu_domain *smmu_domain,
 	if (!(smmu_domain->smmu->features & ARM_SMMU_FEAT_ATS))
 		return 0;
 
+	/*
+	 * Ensure that we've completed prior invalidation of the main TLBs
+	 * before we read 'nr_ats_masters' in case of a concurrent call to
+	 * arm_smmu_enable_ats():
+	 *
+	 *	// unmap()			// arm_smmu_enable_ats()
+	 *	TLBI+SYNC			atomic_inc(&nr_ats_masters);
+	 *	smp_mb();			[...]
+	 *	atomic_read(&nr_ats_masters);	pci_enable_ats() // writel()
+	 *
+	 * Ensures that we always see the incremented 'nr_ats_masters' count if
+	 * ATS was enabled at the PCI device before completion of the TLBI.
+	 */
+	smp_mb();
+	if (!atomic_read(&smmu_domain->nr_ats_masters))
+		return 0;
+
 	arm_smmu_atc_inv_to_cmd(ssid, iova, size, &cmd);
 
 	spin_lock_irqsave(&smmu_domain->devices_lock, flags);
@@ -2312,6 +2330,7 @@ static void arm_smmu_enable_ats(struct arm_smmu_master *master)
 	size_t stu;
 	struct pci_dev *pdev;
 	struct arm_smmu_device *smmu = master->smmu;
+	struct arm_smmu_domain *smmu_domain = master->domain;
 
 	/* Don't enable ATS at the endpoint if it's not enabled in the STE */
 	if (!master->ats_enabled)
@@ -2320,6 +2339,9 @@ static void arm_smmu_enable_ats(struct arm_smmu_master *master)
 	/* Smallest Translation Unit: log2 of the smallest supported granule */
 	stu = __ffs(smmu->pgsize_bitmap);
 	pdev = to_pci_dev(master->dev);
+
+	atomic_inc(&smmu_domain->nr_ats_masters);
+	arm_smmu_atc_inv_domain(smmu_domain, 0, 0, 0);
 	if (pci_enable_ats(pdev, stu))
 		dev_err(master->dev, "Failed to enable ATS (STU %zu)\n", stu);
 }
@@ -2327,6 +2349,7 @@ static void arm_smmu_enable_ats(struct arm_smmu_master *master)
 static void arm_smmu_disable_ats(struct arm_smmu_master *master)
 {
 	struct arm_smmu_cmdq_ent cmd;
+	struct arm_smmu_domain *smmu_domain = master->domain;
 
 	if (!master->ats_enabled)
 		return;
@@ -2339,6 +2362,7 @@ static void arm_smmu_disable_ats(struct arm_smmu_master *master)
 	wmb();
 	arm_smmu_atc_inv_to_cmd(0, 0, 0, &cmd);
 	arm_smmu_atc_inv_master(master, &cmd);
+	atomic_dec(&smmu_domain->nr_ats_masters);
 }
 
 static void arm_smmu_detach_dev(struct arm_smmu_master *master)
@@ -2349,11 +2373,12 @@ static void arm_smmu_detach_dev(struct arm_smmu_master *master)
 	if (!smmu_domain)
 		return;
 
+	arm_smmu_disable_ats(master);
+
 	spin_lock_irqsave(&smmu_domain->devices_lock, flags);
 	list_del(&master->domain_head);
 	spin_unlock_irqrestore(&smmu_domain->devices_lock, flags);
 
-	arm_smmu_disable_ats(master);
 	master->domain = NULL;
 	master->ats_enabled = false;
 	arm_smmu_install_ste_for_dev(master);
@@ -2396,10 +2421,6 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
 
 	master->domain = smmu_domain;
 
-	spin_lock_irqsave(&smmu_domain->devices_lock, flags);
-	list_add(&master->domain_head, &smmu_domain->devices);
-	spin_unlock_irqrestore(&smmu_domain->devices_lock, flags);
-
 	if (smmu_domain->stage != ARM_SMMU_DOMAIN_BYPASS)
 		master->ats_enabled = arm_smmu_ats_supported(master);
 
@@ -2407,7 +2428,13 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
 		arm_smmu_write_ctx_desc(smmu, &smmu_domain->s1_cfg);
 
 	arm_smmu_install_ste_for_dev(master);
+
+	spin_lock_irqsave(&smmu_domain->devices_lock, flags);
+	list_add(&master->domain_head, &smmu_domain->devices);
+	spin_unlock_irqrestore(&smmu_domain->devices_lock, flags);
+
 	arm_smmu_enable_ats(master);
+
 out_unlock:
 	mutex_unlock(&smmu_domain->init_mutex);
 	return ret;
-- 
2.11.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
