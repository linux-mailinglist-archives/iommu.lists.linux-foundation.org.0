Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1D5880DC
	for <lists.iommu@lfdr.de>; Fri,  9 Aug 2019 19:08:58 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 8697CDE1;
	Fri,  9 Aug 2019 17:08:27 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E6029DE1
	for <iommu@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 17:08:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id E8ACE67F
	for <iommu@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 17:08:24 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9EC101684;
	Fri,  9 Aug 2019 10:08:24 -0700 (PDT)
Received: from e110467-lin.cambridge.arm.com (e110467-lin.cambridge.arm.com
	[10.1.197.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6651B3F575; 
	Fri,  9 Aug 2019 10:08:23 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org
Subject: [PATCH 08/15] iommu/arm-smmu: Abstract context bank accesses
Date: Fri,  9 Aug 2019 18:07:45 +0100
Message-Id: <1051d7568c96142ff90b004a2ec61e3b5dbe770e.1565369764.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.21.0.dirty
In-Reply-To: <cover.1565369764.git.robin.murphy@arm.com>
References: <cover.1565369764.git.robin.murphy@arm.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: bjorn.andersson@linaro.org, iommu@lists.linux-foundation.org,
	gregory.clement@bootlin.com, linux-arm-kernel@lists.infradead.org
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

Context bank accesses are fiddly enough to deserve a number of extra
helpers to keep the callsites looking sane, even though there are only
one or two of each.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/arm-smmu.c | 137 ++++++++++++++++++++-------------------
 1 file changed, 72 insertions(+), 65 deletions(-)

diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
index 72505647b77d..abdcc3f52e2e 100644
--- a/drivers/iommu/arm-smmu.c
+++ b/drivers/iommu/arm-smmu.c
@@ -82,9 +82,6 @@
 		((smmu->options & ARM_SMMU_OPT_SECURE_CFG_ACCESS)	\
 			? 0x400 : 0))
 
-/* Translation context bank */
-#define ARM_SMMU_CB(smmu, n)	((smmu)->base + (((smmu)->cb_base + (n)) << (smmu)->pgshift))
-
 #define MSI_IOVA_BASE			0x8000000
 #define MSI_IOVA_LENGTH			0x100000
 
@@ -265,9 +262,29 @@ static void arm_smmu_writel(struct arm_smmu_device *smmu, int page, int offset,
 	writel_relaxed(val, arm_smmu_page(smmu, page) + offset);
 }
 
+static u64 arm_smmu_readq(struct arm_smmu_device *smmu, int page, int offset)
+{
+	return readq_relaxed(arm_smmu_page(smmu, page) + offset);
+}
+
+static void arm_smmu_writeq(struct arm_smmu_device *smmu, int page, int offset,
+			    u64 val)
+{
+	writeq_relaxed(val, arm_smmu_page(smmu, page) + offset);
+}
+
 #define arm_smmu_read_gr1(s, r)		arm_smmu_readl((s), 1, (r))
 #define arm_smmu_write_gr1(s, r, v)	arm_smmu_writel((s), 1, (r), (v))
 
+#define arm_smmu_read_cb(s, n, r)				\
+	arm_smmu_readl((s), (s)->cb_base + (n), (r))
+#define arm_smmu_write_cb(s, n, r, v)				\
+	arm_smmu_writel((s), (s)->cb_base + (n), (r), (v))
+#define arm_smmu_read_cb_q(s, n, r)				\
+	arm_smmu_readq((s), (s)->cb_base + (n), (r))
+#define arm_smmu_write_cb_q(s, n, r, v)				\
+	arm_smmu_writeq((s), (s)->cb_base + (n), (r), (v))
+
 struct arm_smmu_option_prop {
 	u32 opt;
 	const char *prop;
@@ -423,15 +440,17 @@ static void __arm_smmu_free_bitmap(unsigned long *map, int idx)
 }
 
 /* Wait for any pending TLB invalidations to complete */
-static void __arm_smmu_tlb_sync(struct arm_smmu_device *smmu,
-				void __iomem *sync, void __iomem *status)
+static void __arm_smmu_tlb_sync(struct arm_smmu_device *smmu, int page,
+				int sync, int status)
 {
 	unsigned int spin_cnt, delay;
+	u32 reg;
 
-	writel_relaxed(QCOM_DUMMY_VAL, sync);
+	arm_smmu_writel(smmu, page, sync, QCOM_DUMMY_VAL);
 	for (delay = 1; delay < TLB_LOOP_TIMEOUT; delay *= 2) {
 		for (spin_cnt = TLB_SPIN_COUNT; spin_cnt > 0; spin_cnt--) {
-			if (!(readl_relaxed(status) & sTLBGSTATUS_GSACTIVE))
+			reg = arm_smmu_readl(smmu, page, status);
+			if (!(reg & sTLBGSTATUS_GSACTIVE))
 				return;
 			cpu_relax();
 		}
@@ -443,12 +462,11 @@ static void __arm_smmu_tlb_sync(struct arm_smmu_device *smmu,
 
 static void arm_smmu_tlb_sync_global(struct arm_smmu_device *smmu)
 {
-	void __iomem *base = ARM_SMMU_GR0(smmu);
 	unsigned long flags;
 
 	spin_lock_irqsave(&smmu->global_sync_lock, flags);
-	__arm_smmu_tlb_sync(smmu, base + ARM_SMMU_GR0_sTLBGSYNC,
-			    base + ARM_SMMU_GR0_sTLBGSTATUS);
+	__arm_smmu_tlb_sync(smmu, 0, ARM_SMMU_GR0_sTLBGSYNC,
+			    ARM_SMMU_GR0_sTLBGSTATUS);
 	spin_unlock_irqrestore(&smmu->global_sync_lock, flags);
 }
 
@@ -456,12 +474,11 @@ static void arm_smmu_tlb_sync_context(void *cookie)
 {
 	struct arm_smmu_domain *smmu_domain = cookie;
 	struct arm_smmu_device *smmu = smmu_domain->smmu;
-	void __iomem *base = ARM_SMMU_CB(smmu, smmu_domain->cfg.cbndx);
 	unsigned long flags;
 
 	spin_lock_irqsave(&smmu_domain->cb_lock, flags);
-	__arm_smmu_tlb_sync(smmu, base + ARM_SMMU_CB_TLBSYNC,
-			    base + ARM_SMMU_CB_TLBSTATUS);
+	__arm_smmu_tlb_sync(smmu, smmu->cb_base + smmu_domain->cfg.cbndx,
+			    ARM_SMMU_CB_TLBSYNC, ARM_SMMU_CB_TLBSTATUS);
 	spin_unlock_irqrestore(&smmu_domain->cb_lock, flags);
 }
 
@@ -475,14 +492,13 @@ static void arm_smmu_tlb_sync_vmid(void *cookie)
 static void arm_smmu_tlb_inv_context_s1(void *cookie)
 {
 	struct arm_smmu_domain *smmu_domain = cookie;
-	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
-	void __iomem *base = ARM_SMMU_CB(smmu_domain->smmu, cfg->cbndx);
-
 	/*
-	 * NOTE: this is not a relaxed write; it needs to guarantee that PTEs
-	 * cleared by the current CPU are visible to the SMMU before the TLBI.
+	 * The TLBI write may be relaxed, so ensure that PTEs cleared by the
+	 * current CPU are visible beforehand.
 	 */
-	writel(cfg->asid, base + ARM_SMMU_CB_S1_TLBIASID);
+	wmb();
+	arm_smmu_write_cb(smmu_domain->smmu, smmu_domain->cfg.cbndx,
+			  ARM_SMMU_CB_S1_TLBIASID, smmu_domain->cfg.asid);
 	arm_smmu_tlb_sync_context(cookie);
 }
 
@@ -503,25 +519,25 @@ static void arm_smmu_tlb_inv_range_s1(unsigned long iova, size_t size,
 	struct arm_smmu_domain *smmu_domain = cookie;
 	struct arm_smmu_device *smmu = smmu_domain->smmu;
 	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
-	void __iomem *reg = ARM_SMMU_CB(smmu, cfg->cbndx);
+	int reg, idx = cfg->cbndx;
 
 	if (smmu->features & ARM_SMMU_FEAT_COHERENT_WALK)
 		wmb();
 
-	reg += leaf ? ARM_SMMU_CB_S1_TLBIVAL : ARM_SMMU_CB_S1_TLBIVA;
+	reg = leaf ? ARM_SMMU_CB_S1_TLBIVAL : ARM_SMMU_CB_S1_TLBIVA;
 
 	if (cfg->fmt != ARM_SMMU_CTX_FMT_AARCH64) {
 		iova &= ~12UL;
 		iova |= cfg->asid;
 		do {
-			writel_relaxed(iova, reg);
+			arm_smmu_write_cb(smmu, idx, reg, iova);
 			iova += granule;
 		} while (size -= granule);
 	} else {
 		iova >>= 12;
 		iova |= (u64)cfg->asid << 48;
 		do {
-			writeq_relaxed(iova, reg);
+			arm_smmu_write_cb_q(smmu, idx, reg, iova);
 			iova += granule >> 12;
 		} while (size -= granule);
 	}
@@ -532,18 +548,18 @@ static void arm_smmu_tlb_inv_range_s2(unsigned long iova, size_t size,
 {
 	struct arm_smmu_domain *smmu_domain = cookie;
 	struct arm_smmu_device *smmu = smmu_domain->smmu;
-	void __iomem *reg = ARM_SMMU_CB(smmu, smmu_domain->cfg.cbndx);
+	int reg, idx = smmu_domain->cfg.cbndx;
 
 	if (smmu->features & ARM_SMMU_FEAT_COHERENT_WALK)
 		wmb();
 
-	reg += leaf ? ARM_SMMU_CB_S2_TLBIIPAS2L : ARM_SMMU_CB_S2_TLBIIPAS2;
+	reg = leaf ? ARM_SMMU_CB_S2_TLBIIPAS2L : ARM_SMMU_CB_S2_TLBIIPAS2;
 	iova >>= 12;
 	do {
 		if (smmu_domain->cfg.fmt == ARM_SMMU_CTX_FMT_AARCH64)
-			writeq_relaxed(iova, reg);
+			arm_smmu_write_cb_q(smmu, idx, reg, iova);
 		else
-			writel_relaxed(iova, reg);
+			arm_smmu_write_cb(smmu, idx, reg, iova);
 		iova += granule >> 12;
 	} while (size -= granule);
 }
@@ -590,25 +606,22 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
 	unsigned long iova;
 	struct iommu_domain *domain = dev;
 	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
-	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
 	struct arm_smmu_device *smmu = smmu_domain->smmu;
-	void __iomem *cb_base;
-
-	cb_base = ARM_SMMU_CB(smmu, cfg->cbndx);
-	fsr = readl_relaxed(cb_base + ARM_SMMU_CB_FSR);
+	int idx = smmu_domain->cfg.cbndx;
 
+	fsr = arm_smmu_read_cb(smmu, idx, ARM_SMMU_CB_FSR);
 	if (!(fsr & FSR_FAULT))
 		return IRQ_NONE;
 
-	fsynr = readl_relaxed(cb_base + ARM_SMMU_CB_FSYNR0);
-	iova = readq_relaxed(cb_base + ARM_SMMU_CB_FAR);
-	cbfrsynra = arm_smmu_read_gr1(smmu, ARM_SMMU_GR1_CBFRSYNRA(cfg->cbndx));
+	fsynr = arm_smmu_read_cb(smmu, idx, ARM_SMMU_CB_FSYNR0);
+	iova = arm_smmu_read_cb_q(smmu, idx, ARM_SMMU_CB_FAR);
+	cbfrsynra = arm_smmu_read_gr1(smmu, ARM_SMMU_GR1_CBFRSYNRA(idx));
 
 	dev_err_ratelimited(smmu->dev,
 	"Unhandled context fault: fsr=0x%x, iova=0x%08lx, fsynr=0x%x, cbfrsynra=0x%x, cb=%d\n",
-			    fsr, iova, fsynr, cbfrsynra, cfg->cbndx);
+			    fsr, iova, fsynr, cbfrsynra, idx);
 
-	writel(fsr, cb_base + ARM_SMMU_CB_FSR);
+	arm_smmu_write_cb(smmu, idx, ARM_SMMU_CB_FSR, fsr);
 	return IRQ_HANDLED;
 }
 
@@ -693,13 +706,10 @@ static void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx)
 	bool stage1;
 	struct arm_smmu_cb *cb = &smmu->cbs[idx];
 	struct arm_smmu_cfg *cfg = cb->cfg;
-	void __iomem *cb_base;
-
-	cb_base = ARM_SMMU_CB(smmu, idx);
 
 	/* Unassigned context banks only need disabling */
 	if (!cfg) {
-		writel_relaxed(0, cb_base + ARM_SMMU_CB_SCTLR);
+		arm_smmu_write_cb(smmu, idx, ARM_SMMU_CB_SCTLR, 0);
 		return;
 	}
 
@@ -742,24 +752,25 @@ static void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx)
 	 * access behaviour of some fields (in particular, ASID[15:8]).
 	 */
 	if (stage1 && smmu->version > ARM_SMMU_V1)
-		writel_relaxed(cb->tcr[1], cb_base + ARM_SMMU_CB_TCR2);
-	writel_relaxed(cb->tcr[0], cb_base + ARM_SMMU_CB_TCR);
+		arm_smmu_write_cb(smmu, idx, ARM_SMMU_CB_TCR2, cb->tcr[1]);
+	arm_smmu_write_cb(smmu, idx, ARM_SMMU_CB_TCR, cb->tcr[0]);
 
 	/* TTBRs */
 	if (cfg->fmt == ARM_SMMU_CTX_FMT_AARCH32_S) {
-		writel_relaxed(cfg->asid, cb_base + ARM_SMMU_CB_CONTEXTIDR);
-		writel_relaxed(cb->ttbr[0], cb_base + ARM_SMMU_CB_TTBR0);
-		writel_relaxed(cb->ttbr[1], cb_base + ARM_SMMU_CB_TTBR1);
+		arm_smmu_write_cb(smmu, idx, ARM_SMMU_CB_CONTEXTIDR, cfg->asid);
+		arm_smmu_write_cb(smmu, idx, ARM_SMMU_CB_TTBR0, cb->ttbr[0]);
+		arm_smmu_write_cb(smmu, idx, ARM_SMMU_CB_TTBR1, cb->ttbr[1]);
 	} else {
-		writeq_relaxed(cb->ttbr[0], cb_base + ARM_SMMU_CB_TTBR0);
+		arm_smmu_write_cb_q(smmu, idx, ARM_SMMU_CB_TTBR0, cb->ttbr[0]);
 		if (stage1)
-			writeq_relaxed(cb->ttbr[1], cb_base + ARM_SMMU_CB_TTBR1);
+			arm_smmu_write_cb_q(smmu, idx, ARM_SMMU_CB_TTBR1,
+					    cb->ttbr[1]);
 	}
 
 	/* MAIRs (stage-1 only) */
 	if (stage1) {
-		writel_relaxed(cb->mair[0], cb_base + ARM_SMMU_CB_S1_MAIR0);
-		writel_relaxed(cb->mair[1], cb_base + ARM_SMMU_CB_S1_MAIR1);
+		arm_smmu_write_cb(smmu, idx, ARM_SMMU_CB_S1_MAIR0, cb->mair[0]);
+		arm_smmu_write_cb(smmu, idx, ARM_SMMU_CB_S1_MAIR1, cb->mair[1]);
 	}
 
 	/* SCTLR */
@@ -769,7 +780,7 @@ static void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx)
 	if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN))
 		reg |= SCTLR_E;
 
-	writel_relaxed(reg, cb_base + ARM_SMMU_CB_SCTLR);
+	arm_smmu_write_cb(smmu, idx, ARM_SMMU_CB_SCTLR, reg);
 }
 
 static int arm_smmu_init_domain_context(struct iommu_domain *domain,
@@ -1366,27 +1377,25 @@ static phys_addr_t arm_smmu_iova_to_phys_hard(struct iommu_domain *domain,
 	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
 	struct io_pgtable_ops *ops= smmu_domain->pgtbl_ops;
 	struct device *dev = smmu->dev;
-	void __iomem *cb_base;
+	void __iomem *reg;
 	u32 tmp;
 	u64 phys;
 	unsigned long va, flags;
-	int ret;
+	int ret, idx = cfg->cbndx;
 
 	ret = arm_smmu_rpm_get(smmu);
 	if (ret < 0)
 		return 0;
 
-	cb_base = ARM_SMMU_CB(smmu, cfg->cbndx);
-
 	spin_lock_irqsave(&smmu_domain->cb_lock, flags);
 	va = iova & ~0xfffUL;
 	if (cfg->fmt == ARM_SMMU_CTX_FMT_AARCH64)
-		writeq_relaxed(va, cb_base + ARM_SMMU_CB_ATS1PR);
+		arm_smmu_write_cb_q(smmu, idx, ARM_SMMU_CB_ATS1PR, va);
 	else
-		writel_relaxed(va, cb_base + ARM_SMMU_CB_ATS1PR);
+		arm_smmu_write_cb(smmu, idx, ARM_SMMU_CB_ATS1PR, va);
 
-	if (readl_poll_timeout_atomic(cb_base + ARM_SMMU_CB_ATSR, tmp,
-				      !(tmp & ATSR_ACTIVE), 5, 50)) {
+	reg = arm_smmu_page(smmu, smmu->cb_base + idx) + ARM_SMMU_CB_ATSR;
+	if (readl_poll_timeout_atomic(reg, tmp, !(tmp & ATSR_ACTIVE), 5, 50)) {
 		spin_unlock_irqrestore(&smmu_domain->cb_lock, flags);
 		dev_err(dev,
 			"iova to phys timed out on %pad. Falling back to software table walk.\n",
@@ -1394,7 +1403,7 @@ static phys_addr_t arm_smmu_iova_to_phys_hard(struct iommu_domain *domain,
 		return ops->iova_to_phys(ops, iova);
 	}
 
-	phys = readq_relaxed(cb_base + ARM_SMMU_CB_PAR);
+	phys = arm_smmu_read_cb_q(smmu, idx, ARM_SMMU_CB_PAR);
 	spin_unlock_irqrestore(&smmu_domain->cb_lock, flags);
 	if (phys & CB_PAR_F) {
 		dev_err(dev, "translation fault!\n");
@@ -1758,18 +1767,16 @@ static void arm_smmu_device_reset(struct arm_smmu_device *smmu)
 
 	/* Make sure all context banks are disabled and clear CB_FSR  */
 	for (i = 0; i < smmu->num_context_banks; ++i) {
-		void __iomem *cb_base = ARM_SMMU_CB(smmu, i);
-
 		arm_smmu_write_context_bank(smmu, i);
-		writel_relaxed(FSR_FAULT, cb_base + ARM_SMMU_CB_FSR);
+		arm_smmu_write_cb(smmu, i, ARM_SMMU_CB_FSR, FSR_FAULT);
 		/*
 		 * Disable MMU-500's not-particularly-beneficial next-page
 		 * prefetcher for the sake of errata #841119 and #826419.
 		 */
 		if (smmu->model == ARM_MMU500) {
-			reg = readl_relaxed(cb_base + ARM_SMMU_CB_ACTLR);
+			reg = arm_smmu_read_cb(smmu, i, ARM_SMMU_CB_ACTLR);
 			reg &= ~ARM_MMU500_ACTLR_CPRE;
-			writel_relaxed(reg, cb_base + ARM_SMMU_CB_ACTLR);
+			arm_smmu_write_cb(smmu, i, ARM_SMMU_CB_ACTLR, reg);
 		}
 	}
 
-- 
2.21.0.dirty

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
