Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 21EA5224DA5
	for <lists.iommu@lfdr.de>; Sat, 18 Jul 2020 21:35:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A9A5986166;
	Sat, 18 Jul 2020 19:35:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id COywMai_xFZh; Sat, 18 Jul 2020 19:35:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DD7C28612E;
	Sat, 18 Jul 2020 19:35:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C1081C0733;
	Sat, 18 Jul 2020 19:35:19 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D39A0C0733
 for <iommu@lists.linux-foundation.org>; Sat, 18 Jul 2020 19:35:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id BF7B788026
 for <iommu@lists.linux-foundation.org>; Sat, 18 Jul 2020 19:35:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XtFcdMLUcNwT for <iommu@lists.linux-foundation.org>;
 Sat, 18 Jul 2020 19:35:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by hemlock.osuosl.org (Postfix) with ESMTPS id DB6E088002
 for <iommu@lists.linux-foundation.org>; Sat, 18 Jul 2020 19:35:16 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f134eb80000>; Sat, 18 Jul 2020 12:34:16 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Sat, 18 Jul 2020 12:35:16 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Sat, 18 Jul 2020 12:35:16 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 18 Jul
 2020 19:35:12 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Sat, 18 Jul 2020 19:35:11 +0000
Received: from vdumpa-ubuntu.nvidia.com (Not Verified[172.17.173.140]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5f134eee0000>; Sat, 18 Jul 2020 12:35:11 -0700
From: Krishna Reddy <vdumpa@nvidia.com>
To: <joro@8bytes.org>, <will@kernel.org>, <robin.murphy@arm.com>,
 <robh+dt@kernel.org>, <treding@nvidia.com>, <jonathanh@nvidia.com>
Subject: [PATCH v11 5/5] iommu/arm-smmu: Add global/context fault
 implementation hooks
Date: Sat, 18 Jul 2020 12:34:57 -0700
Message-ID: <20200718193457.30046-6-vdumpa@nvidia.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200718193457.30046-1-vdumpa@nvidia.com>
References: <20200718193457.30046-1-vdumpa@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1595100856; bh=ONwZoXQE5AMEO16Cm8KQlZocmAK53VddF2Cq/qlwpNU=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=ohhRbvQ0i3/JtheNy6WolRv2G0VqTqZ0h8kSk0nS5jqWYgaqFKAROCmv2S2pSJ5h7
 KCpqJ6dQa+EY+mU3Lo3EBoBSBP9iZa0+5MACHHP/i2TCg5OBpvtbEwRF/zaMdDL7zy
 TJ4ozaI+7R3CeqSwoUi6Gpad+AQC5K4B8kp7bYm1UAXKbGjz3YMo3Ri7mEr4XyoAub
 dVH+x6Upg55cuYIxV5+kC5I8bRsmsTlefC5yCHixUIsJGa4cplQA+s0XFwUBdxV8jg
 463jWnDqXK9XsW+7HAI/4Rs0jXvqZtC/SgG2dQIODQDhW0Se9PAQdvYRqvyGW+N0Pv
 mCZOheXTRdZDg==
Cc: snikam@nvidia.com, devicetree@vger.kernel.org, mperttunen@nvidia.com,
 bhuntsman@nvidia.com, yhsu@nvidia.com, linux-kernel@vger.kernel.org,
 talho@nvidia.com, iommu@lists.linux-foundation.org,
 Thierry Reding <thierry.reding@gmail.com>, nicolinc@nvidia.com,
 linux-tegra@vger.kernel.org, praithatha@nvidia.com,
 linux-arm-kernel@lists.infradead.org, bbiswas@nvidia.com
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

Add global/context fault hooks to allow vendor specific implementations
override default fault interrupt handlers.

Update NVIDIA implementation to override the default global/context fault
interrupt handlers and handle interrupts across the two ARM MMU-500s that
are programmed identically.

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
Reviewed-by: Nicolin Chen <nicoleotsuka@gmail.com>
Reviewed-by: Pritesh Raithatha <praithatha@nvidia.com>
Reviewed-by: Robin Murphy <robin.murphy@arm.com>
Reviewed-by: Thierry Reding <thierry.reding@gmail.com>
Signed-off-by: Krishna Reddy <vdumpa@nvidia.com>
---
 drivers/iommu/arm-smmu-nvidia.c | 99 +++++++++++++++++++++++++++++++++
 drivers/iommu/arm-smmu.c        | 17 +++++-
 drivers/iommu/arm-smmu.h        |  3 +
 3 files changed, 117 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm-smmu-nvidia.c b/drivers/iommu/arm-smmu-nvidia.c
index 2f55e5793d34..31368057e9be 100644
--- a/drivers/iommu/arm-smmu-nvidia.c
+++ b/drivers/iommu/arm-smmu-nvidia.c
@@ -127,6 +127,103 @@ static int nvidia_smmu_reset(struct arm_smmu_device *smmu)
 	return 0;
 }
 
+static irqreturn_t nvidia_smmu_global_fault_inst(int irq,
+						 struct arm_smmu_device *smmu,
+						 int inst)
+{
+	u32 gfsr, gfsynr0, gfsynr1, gfsynr2;
+	void __iomem *gr0_base = nvidia_smmu_page(smmu, inst, 0);
+
+	gfsr = readl_relaxed(gr0_base + ARM_SMMU_GR0_sGFSR);
+	if (!gfsr)
+		return IRQ_NONE;
+
+	gfsynr0 = readl_relaxed(gr0_base + ARM_SMMU_GR0_sGFSYNR0);
+	gfsynr1 = readl_relaxed(gr0_base + ARM_SMMU_GR0_sGFSYNR1);
+	gfsynr2 = readl_relaxed(gr0_base + ARM_SMMU_GR0_sGFSYNR2);
+
+	dev_err_ratelimited(smmu->dev,
+			    "Unexpected global fault, this could be serious\n");
+	dev_err_ratelimited(smmu->dev,
+			    "\tGFSR 0x%08x, GFSYNR0 0x%08x, GFSYNR1 0x%08x, GFSYNR2 0x%08x\n",
+			    gfsr, gfsynr0, gfsynr1, gfsynr2);
+
+	writel_relaxed(gfsr, gr0_base + ARM_SMMU_GR0_sGFSR);
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t nvidia_smmu_global_fault(int irq, void *dev)
+{
+	unsigned int inst;
+	irqreturn_t ret = IRQ_NONE;
+	struct arm_smmu_device *smmu = dev;
+
+	for (inst = 0; inst < NUM_SMMU_INSTANCES; inst++) {
+		irqreturn_t irq_ret;
+
+		irq_ret = nvidia_smmu_global_fault_inst(irq, smmu, inst);
+		if (irq_ret == IRQ_HANDLED)
+			ret = IRQ_HANDLED;
+	}
+
+	return ret;
+}
+
+static irqreturn_t nvidia_smmu_context_fault_bank(int irq,
+						  struct arm_smmu_device *smmu,
+						  int idx, int inst)
+{
+	u32 fsr, fsynr, cbfrsynra;
+	unsigned long iova;
+	void __iomem *gr1_base = nvidia_smmu_page(smmu, inst, 1);
+	void __iomem *cb_base = nvidia_smmu_page(smmu, inst, smmu->numpage + idx);
+
+	fsr = readl_relaxed(cb_base + ARM_SMMU_CB_FSR);
+	if (!(fsr & ARM_SMMU_FSR_FAULT))
+		return IRQ_NONE;
+
+	fsynr = readl_relaxed(cb_base + ARM_SMMU_CB_FSYNR0);
+	iova = readq_relaxed(cb_base + ARM_SMMU_CB_FAR);
+	cbfrsynra = readl_relaxed(gr1_base + ARM_SMMU_GR1_CBFRSYNRA(idx));
+
+	dev_err_ratelimited(smmu->dev,
+			    "Unhandled context fault: fsr=0x%x, iova=0x%08lx, fsynr=0x%x, cbfrsynra=0x%x, cb=%d\n",
+			    fsr, iova, fsynr, cbfrsynra, idx);
+
+	writel_relaxed(fsr, cb_base + ARM_SMMU_CB_FSR);
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t nvidia_smmu_context_fault(int irq, void *dev)
+{
+	int idx;
+	unsigned int inst;
+	irqreturn_t ret = IRQ_NONE;
+	struct arm_smmu_device *smmu;
+	struct iommu_domain *domain = dev;
+	struct arm_smmu_domain *smmu_domain;
+
+	smmu_domain = container_of(domain, struct arm_smmu_domain, domain);
+	smmu = smmu_domain->smmu;
+
+	for (inst = 0; inst < NUM_SMMU_INSTANCES; inst++) {
+		irqreturn_t irq_ret;
+
+		/*
+		 * Interrupt line is shared between all contexts.
+		 * Check for faults across all contexts.
+		 */
+		for (idx = 0; idx < smmu->num_context_banks; idx++) {
+			irq_ret = nvidia_smmu_context_fault_bank(irq, smmu,
+								 idx, inst);
+			if (irq_ret == IRQ_HANDLED)
+				ret = IRQ_HANDLED;
+		}
+	}
+
+	return ret;
+}
+
 static const struct arm_smmu_impl nvidia_smmu_impl = {
 	.read_reg = nvidia_smmu_read_reg,
 	.write_reg = nvidia_smmu_write_reg,
@@ -134,6 +231,8 @@ static const struct arm_smmu_impl nvidia_smmu_impl = {
 	.write_reg64 = nvidia_smmu_write_reg64,
 	.reset = nvidia_smmu_reset,
 	.tlb_sync = nvidia_smmu_tlb_sync,
+	.global_fault = nvidia_smmu_global_fault,
+	.context_fault = nvidia_smmu_context_fault,
 };
 
 struct arm_smmu_device *nvidia_smmu_impl_init(struct arm_smmu_device *smmu)
diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
index 35422a17f610..56b7103e1368 100644
--- a/drivers/iommu/arm-smmu.c
+++ b/drivers/iommu/arm-smmu.c
@@ -670,6 +670,7 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
 	enum io_pgtable_fmt fmt;
 	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
 	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
+	irqreturn_t (*context_fault)(int irq, void *dev);
 
 	mutex_lock(&smmu_domain->init_mutex);
 	if (smmu_domain->smmu)
@@ -832,7 +833,13 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
 	 * handler seeing a half-initialised domain state.
 	 */
 	irq = smmu->irqs[smmu->num_global_irqs + cfg->irptndx];
-	ret = devm_request_irq(smmu->dev, irq, arm_smmu_context_fault,
+
+	if (smmu->impl && smmu->impl->context_fault)
+		context_fault = smmu->impl->context_fault;
+	else
+		context_fault = arm_smmu_context_fault;
+
+	ret = devm_request_irq(smmu->dev, irq, context_fault,
 			       IRQF_SHARED, "arm-smmu-context-fault", domain);
 	if (ret < 0) {
 		dev_err(smmu->dev, "failed to request context IRQ %d (%u)\n",
@@ -2108,6 +2115,7 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
 	struct arm_smmu_device *smmu;
 	struct device *dev = &pdev->dev;
 	int num_irqs, i, err;
+	irqreturn_t (*global_fault)(int irq, void *dev);
 
 	smmu = devm_kzalloc(dev, sizeof(*smmu), GFP_KERNEL);
 	if (!smmu) {
@@ -2194,9 +2202,14 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
 		smmu->num_context_irqs = smmu->num_context_banks;
 	}
 
+	if (smmu->impl && smmu->impl->global_fault)
+		global_fault = smmu->impl->global_fault;
+	else
+		global_fault = arm_smmu_global_fault;
+
 	for (i = 0; i < smmu->num_global_irqs; ++i) {
 		err = devm_request_irq(smmu->dev, smmu->irqs[i],
-				       arm_smmu_global_fault,
+				       global_fault,
 				       IRQF_SHARED,
 				       "arm-smmu global fault",
 				       smmu);
diff --git a/drivers/iommu/arm-smmu.h b/drivers/iommu/arm-smmu.h
index fad63efa1a72..d890a4a968e8 100644
--- a/drivers/iommu/arm-smmu.h
+++ b/drivers/iommu/arm-smmu.h
@@ -18,6 +18,7 @@
 #include <linux/io-64-nonatomic-hi-lo.h>
 #include <linux/io-pgtable.h>
 #include <linux/iommu.h>
+#include <linux/irqreturn.h>
 #include <linux/mutex.h>
 #include <linux/spinlock.h>
 #include <linux/types.h>
@@ -389,6 +390,8 @@ struct arm_smmu_impl {
 	void (*tlb_sync)(struct arm_smmu_device *smmu, int page, int sync,
 			 int status);
 	int (*def_domain_type)(struct device *dev);
+	irqreturn_t (*global_fault)(int irq, void *dev);
+	irqreturn_t (*context_fault)(int irq, void *dev);
 };
 
 static inline void __iomem *arm_smmu_page(struct arm_smmu_device *smmu, int n)
-- 
2.26.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
