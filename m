Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E4BCFA2A2B
	for <lists.iommu@lfdr.de>; Fri, 30 Aug 2019 00:47:43 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5C4A359E0;
	Thu, 29 Aug 2019 22:47:19 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 6857659B7
	for <iommu@lists.linux-foundation.org>;
	Thu, 29 Aug 2019 22:45:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id BECF688E
	for <iommu@lists.linux-foundation.org>;
	Thu, 29 Aug 2019 22:45:43 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
	hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
	id <B5d6855990000>; Thu, 29 Aug 2019 15:45:45 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
	by hqpgpgate102.nvidia.com (PGP Universal service);
	Thu, 29 Aug 2019 15:45:43 -0700
X-PGP-Universal: processed;
	by hqpgpgate102.nvidia.com on Thu, 29 Aug 2019 15:45:43 -0700
Received: from HQMAIL110.nvidia.com (172.18.146.15) by HQMAIL111.nvidia.com
	(172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Thu, 29 Aug 2019 22:45:42 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by hqmail110.nvidia.com
	(172.18.146.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Thu, 29 Aug 2019 22:45:42 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL105.nvidia.com
	(172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
	Frontend Transport; Thu, 29 Aug 2019 22:45:42 +0000
Received: from vdumpa-ubuntu.nvidia.com (Not Verified[172.17.173.140]) by
	hqnvemgw02.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
	id <B5d6855960005>; Thu, 29 Aug 2019 15:45:42 -0700
From: Krishna Reddy <vdumpa@nvidia.com>
To: 
Subject: [PATCH 4/7] iommu/arm-smmu: Add global/context fault implementation
	hooks
Date: Thu, 29 Aug 2019 15:47:04 -0700
Message-ID: <1567118827-26358-5-git-send-email-vdumpa@nvidia.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1567118827-26358-1-git-send-email-vdumpa@nvidia.com>
References: <1567118827-26358-1-git-send-email-vdumpa@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
	t=1567118745; bh=n+8B2OjVrJ6R4E8DS58EmIcEZy/0SeuuRZC49Q4IDCk=;
	h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	In-Reply-To:References:X-NVConfidentiality:MIME-Version:
	Content-Type;
	b=erYlZ5eE3vYsEDbM79v5+3JWY9SMwZGJzhm/KO2NBfMXU6IGHY7dolvTbwssg3Ib3
	F9y7oRCKcMeqFBsqw6VZxTP0OO/1HmA/HKUYW6G4cFBb7ZGsxcebR2DAT7y138VyoZ
	t3MFH5WWEQd0kqBdJ9JMDHbvajF4PqxE318cABFaDtMAVvOuHBAF592fJGue1IQtAS
	s4tyC/RPeFR313msrdIImxlnIlRFyejxBcFz+coALEyWBnVV8H+rSAc5S5xG0ReAgX
	NaqZGzNyHfoMHbsva3/ujjVRRTlQ/Z4S7cnEoKrWeAhKwfakoNfuGm8recvRus2YDh
	JEJ+zBy/Cuemw==
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: snikam@nvidia.com, thomasz@nvidia.com, jtukkinen@nvidia.com,
	mperttunen@nvidia.com, praithatha@nvidia.com,
	iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
	talho@nvidia.com, yhsu@nvidia.com, linux-tegra@vger.kernel.org,
	treding@nvidia.com, avanbrunt@nvidia.com,
	linux-arm-kernel@lists.infradead.org
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

Add global/context fault hooks to allow Nvidia SMMU implementation
handle faults across multiple SMMUs.

Signed-off-by: Krishna Reddy <vdumpa@nvidia.com>
---
 drivers/iommu/arm-smmu-nvidia.c | 127 ++++++++++++++++++++++++++++++++++++++++
 drivers/iommu/arm-smmu.c        |   6 ++
 drivers/iommu/arm-smmu.h        |   4 ++
 3 files changed, 137 insertions(+)

diff --git a/drivers/iommu/arm-smmu-nvidia.c b/drivers/iommu/arm-smmu-nvidia.c
index a429b2c..b2a3c49 100644
--- a/drivers/iommu/arm-smmu-nvidia.c
+++ b/drivers/iommu/arm-smmu-nvidia.c
@@ -14,6 +14,10 @@
 
 #define NUM_SMMU_INSTANCES 3
 
+static irqreturn_t nsmmu_context_fault_inst(int irq,
+					    struct arm_smmu_device *smmu,
+					    int idx, int inst);
+
 struct nvidia_smmu {
 	struct arm_smmu_device	smmu;
 	int			num_inst;
@@ -87,12 +91,135 @@ static void nsmmu_tlb_sync(struct arm_smmu_device *smmu, int page,
 		nsmmu_tlb_sync_wait(smmu, page, sync, status, i);
 }
 
+static irqreturn_t nsmmu_global_fault_inst(int irq,
+					       struct arm_smmu_device *smmu,
+					       int inst)
+{
+	u32 gfsr, gfsynr0, gfsynr1, gfsynr2;
+
+	gfsr = readl_relaxed(nsmmu_page(smmu, inst, 0) + ARM_SMMU_GR0_sGFSR);
+	gfsynr0 = readl_relaxed(nsmmu_page(smmu, inst, 0) +
+				ARM_SMMU_GR0_sGFSYNR0);
+	gfsynr1 = readl_relaxed(nsmmu_page(smmu, inst, 0) +
+				ARM_SMMU_GR0_sGFSYNR1);
+	gfsynr2 = readl_relaxed(nsmmu_page(smmu, inst, 0) +
+				ARM_SMMU_GR0_sGFSYNR2);
+
+	if (!gfsr)
+		return IRQ_NONE;
+
+	dev_err_ratelimited(smmu->dev,
+		"Unexpected global fault, this could be serious\n");
+	dev_err_ratelimited(smmu->dev,
+		"\tGFSR 0x%08x, GFSYNR0 0x%08x, GFSYNR1 0x%08x, GFSYNR2 0x%08x\n",
+		gfsr, gfsynr0, gfsynr1, gfsynr2);
+
+	writel_relaxed(gfsr, nsmmu_page(smmu, inst, 0) + ARM_SMMU_GR0_sGFSR);
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t nsmmu_global_fault(int irq, struct arm_smmu_device *smmu)
+{
+	int i;
+	irqreturn_t irq_ret = IRQ_NONE;
+
+	/* Interrupt line is shared between global and context faults.
+	 * Check for both type of interrupts on either fault handlers.
+	 */
+	for (i = 0; i < to_nsmmu(smmu)->num_inst; i++) {
+		irq_ret = nsmmu_context_fault_inst(irq, smmu, 0, i);
+		if (irq_ret == IRQ_HANDLED)
+			return irq_ret;
+	}
+
+	for (i = 0; i < to_nsmmu(smmu)->num_inst; i++) {
+		irq_ret = nsmmu_global_fault_inst(irq, smmu, i);
+		if (irq_ret == IRQ_HANDLED)
+			return irq_ret;
+	}
+
+	return irq_ret;
+}
+
+static irqreturn_t nsmmu_context_fault_bank(int irq,
+					    struct arm_smmu_device *smmu,
+					    int idx, int inst)
+{
+	u32 fsr, fsynr, cbfrsynra;
+	unsigned long iova;
+
+	fsr = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSR);
+	if (!(fsr & FSR_FAULT))
+		return IRQ_NONE;
+
+	fsynr = readl_relaxed(nsmmu_page(smmu, inst, smmu->numpage + idx) +
+			      ARM_SMMU_CB_FSYNR0);
+	iova = readq_relaxed(nsmmu_page(smmu, inst, smmu->numpage + idx) +
+			     ARM_SMMU_CB_FAR);
+	cbfrsynra = readl_relaxed(nsmmu_page(smmu, inst, 1) +
+				  ARM_SMMU_GR1_CBFRSYNRA(idx));
+
+	dev_err_ratelimited(smmu->dev,
+	"Unhandled context fault: fsr=0x%x, iova=0x%08lx, fsynr=0x%x, cbfrsynra=0x%x, cb=%d\n",
+			    fsr, iova, fsynr, cbfrsynra, idx);
+
+	writel_relaxed(fsr, nsmmu_page(smmu, inst, smmu->numpage + idx) +
+			    ARM_SMMU_CB_FSR);
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t nsmmu_context_fault_inst(int irq,
+					    struct arm_smmu_device *smmu,
+					    int idx, int inst)
+{
+	irqreturn_t irq_ret = IRQ_NONE;
+
+	/* Interrupt line shared between global and all context faults.
+	 * Check for faults across all contexts.
+	 */
+	for (idx = 0; idx < smmu->num_context_banks; idx++) {
+		irq_ret = nsmmu_context_fault_bank(irq, smmu, idx, inst);
+
+		if (irq_ret == IRQ_HANDLED)
+			break;
+	}
+
+	return irq_ret;
+}
+
+static irqreturn_t nsmmu_context_fault(int irq,
+				       struct arm_smmu_device *smmu,
+				       int cbndx)
+{
+	int i;
+	irqreturn_t irq_ret = IRQ_NONE;
+
+	/* Interrupt line is shared between global and context faults.
+	 * Check for both type of interrupts on either fault handlers.
+	 */
+	for (i = 0; i < to_nsmmu(smmu)->num_inst; i++) {
+		irq_ret = nsmmu_global_fault_inst(irq, smmu, i);
+		if (irq_ret == IRQ_HANDLED)
+			return irq_ret;
+	}
+
+	for (i = 0; i < to_nsmmu(smmu)->num_inst; i++) {
+		irq_ret = nsmmu_context_fault_inst(irq, smmu, cbndx, i);
+		if (irq_ret == IRQ_HANDLED)
+			return irq_ret;
+	}
+
+	return irq_ret;
+}
+
 static const struct arm_smmu_impl nsmmu_impl = {
 	.read_reg = nsmmu_read_reg,
 	.write_reg = nsmmu_write_reg,
 	.read_reg64 = nsmmu_read_reg64,
 	.write_reg64 = nsmmu_write_reg64,
 	.tlb_sync = nsmmu_tlb_sync,
+	.global_fault = nsmmu_global_fault,
+	.context_fault = nsmmu_context_fault,
 };
 
 struct arm_smmu_device *nvidia_smmu_impl_init(struct arm_smmu_device *smmu)
diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
index f5454e71..9cc532d 100644
--- a/drivers/iommu/arm-smmu.c
+++ b/drivers/iommu/arm-smmu.c
@@ -454,6 +454,9 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
 	struct arm_smmu_device *smmu = smmu_domain->smmu;
 	int idx = smmu_domain->cfg.cbndx;
 
+	if (smmu->impl->context_fault)
+		return smmu->impl->context_fault(irq, smmu, idx);
+
 	fsr = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSR);
 	if (!(fsr & FSR_FAULT))
 		return IRQ_NONE;
@@ -475,6 +478,9 @@ static irqreturn_t arm_smmu_global_fault(int irq, void *dev)
 	u32 gfsr, gfsynr0, gfsynr1, gfsynr2;
 	struct arm_smmu_device *smmu = dev;
 
+	if (smmu->impl->global_fault)
+		return smmu->impl->global_fault(irq, smmu);
+
 	gfsr = arm_smmu_gr0_read(smmu, ARM_SMMU_GR0_sGFSR);
 	gfsynr0 = arm_smmu_gr0_read(smmu, ARM_SMMU_GR0_sGFSYNR0);
 	gfsynr1 = arm_smmu_gr0_read(smmu, ARM_SMMU_GR0_sGFSYNR1);
diff --git a/drivers/iommu/arm-smmu.h b/drivers/iommu/arm-smmu.h
index d3217f1..dec5e1a 100644
--- a/drivers/iommu/arm-smmu.h
+++ b/drivers/iommu/arm-smmu.h
@@ -17,6 +17,7 @@
 #include <linux/io-64-nonatomic-hi-lo.h>
 #include <linux/io-pgtable.h>
 #include <linux/iommu.h>
+#include <linux/irqreturn.h>
 #include <linux/mutex.h>
 #include <linux/spinlock.h>
 #include <linux/types.h>
@@ -340,6 +341,9 @@ struct arm_smmu_impl {
 	int (*init_context)(struct arm_smmu_domain *smmu_domain);
 	void (*tlb_sync)(struct arm_smmu_device *smmu, int page, int sync,
 			 int status);
+	irqreturn_t (*global_fault)(int irq, struct arm_smmu_device *smmu);
+	irqreturn_t (*context_fault)(int irq, struct arm_smmu_device *smmu,
+				     int cbndx);
 };
 
 static inline void __iomem *arm_smmu_page(struct arm_smmu_device *smmu, int n)
-- 
2.1.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
