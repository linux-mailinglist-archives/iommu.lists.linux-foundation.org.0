Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4928F39F
	for <lists.iommu@lfdr.de>; Thu, 15 Aug 2019 20:38:33 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 495E710CE;
	Thu, 15 Aug 2019 18:37:59 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 3F206107D
	for <iommu@lists.linux-foundation.org>;
	Thu, 15 Aug 2019 18:37:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id AEE99CF
	for <iommu@lists.linux-foundation.org>;
	Thu, 15 Aug 2019 18:37:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6552B344;
	Thu, 15 Aug 2019 11:37:56 -0700 (PDT)
Received: from e110467-lin.cambridge.arm.com (e110467-lin.cambridge.arm.com
	[10.1.197.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 11F6C3F694; 
	Thu, 15 Aug 2019 11:37:54 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org
Subject: [PATCH v2 09/17] iommu/arm-smmu: Abstract GR1 accesses
Date: Thu, 15 Aug 2019 19:37:29 +0100
Message-Id: <00d20b1757c8ab4206deefcc30fdce343383af52.1565892337.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.21.0.dirty
In-Reply-To: <cover.1565892337.git.robin.murphy@arm.com>
References: <cover.1565892337.git.robin.murphy@arm.com>
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

Introduce some register access abstractions which we will later use to
encapsulate various quirks. GR1 is the easiest page to start with.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/arm-smmu.c | 34 +++++++++++++++++++++++++++-------
 1 file changed, 27 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
index 24b4de1a4185..d612dda2889f 100644
--- a/drivers/iommu/arm-smmu.c
+++ b/drivers/iommu/arm-smmu.c
@@ -71,7 +71,6 @@
 
 /* SMMU global address space */
 #define ARM_SMMU_GR0(smmu)		((smmu)->base)
-#define ARM_SMMU_GR1(smmu)		((smmu)->base + (1 << (smmu)->pgshift))
 
 /*
  * SMMU global address space with conditional offset to access secure
@@ -250,6 +249,29 @@ struct arm_smmu_domain {
 	struct iommu_domain		domain;
 };
 
+static void __iomem *arm_smmu_page(struct arm_smmu_device *smmu, int n)
+{
+	return smmu->base + (n << smmu->pgshift);
+}
+
+static u32 arm_smmu_readl(struct arm_smmu_device *smmu, int page, int offset)
+{
+	return readl_relaxed(arm_smmu_page(smmu, page) + offset);
+}
+
+static void arm_smmu_writel(struct arm_smmu_device *smmu, int page, int offset,
+			    u32 val)
+{
+	writel_relaxed(val, arm_smmu_page(smmu, page) + offset);
+}
+
+#define ARM_SMMU_GR1		1
+
+#define arm_smmu_gr1_read(s, o)		\
+	arm_smmu_readl((s), ARM_SMMU_GR1, (o))
+#define arm_smmu_gr1_write(s, o, v)	\
+	arm_smmu_writel((s), ARM_SMMU_GR1, (o), (v))
+
 struct arm_smmu_option_prop {
 	u32 opt;
 	const char *prop;
@@ -574,7 +596,6 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
 	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
 	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
 	struct arm_smmu_device *smmu = smmu_domain->smmu;
-	void __iomem *gr1_base = ARM_SMMU_GR1(smmu);
 	void __iomem *cb_base;
 
 	cb_base = ARM_SMMU_CB(smmu, cfg->cbndx);
@@ -585,7 +606,7 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
 
 	fsynr = readl_relaxed(cb_base + ARM_SMMU_CB_FSYNR0);
 	iova = readq_relaxed(cb_base + ARM_SMMU_CB_FAR);
-	cbfrsynra = readl_relaxed(gr1_base + ARM_SMMU_GR1_CBFRSYNRA(cfg->cbndx));
+	cbfrsynra = arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CBFRSYNRA(cfg->cbndx));
 
 	dev_err_ratelimited(smmu->dev,
 	"Unhandled context fault: fsr=0x%x, iova=0x%08lx, fsynr=0x%x, cbfrsynra=0x%x, cb=%d\n",
@@ -676,7 +697,7 @@ static void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx)
 	bool stage1;
 	struct arm_smmu_cb *cb = &smmu->cbs[idx];
 	struct arm_smmu_cfg *cfg = cb->cfg;
-	void __iomem *cb_base, *gr1_base;
+	void __iomem *cb_base;
 
 	cb_base = ARM_SMMU_CB(smmu, idx);
 
@@ -686,7 +707,6 @@ static void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx)
 		return;
 	}
 
-	gr1_base = ARM_SMMU_GR1(smmu);
 	stage1 = cfg->cbar != CBAR_TYPE_S2_TRANS;
 
 	/* CBA2R */
@@ -699,7 +719,7 @@ static void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx)
 		if (smmu->features & ARM_SMMU_FEAT_VMID16)
 			reg |= FIELD_PREP(CBA2R_VMID16, cfg->vmid);
 
-		writel_relaxed(reg, gr1_base + ARM_SMMU_GR1_CBA2R(idx));
+		arm_smmu_gr1_write(smmu, ARM_SMMU_GR1_CBA2R(idx), reg);
 	}
 
 	/* CBAR */
@@ -718,7 +738,7 @@ static void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx)
 		/* 8-bit VMIDs live in CBAR */
 		reg |= FIELD_PREP(CBAR_VMID, cfg->vmid);
 	}
-	writel_relaxed(reg, gr1_base + ARM_SMMU_GR1_CBAR(idx));
+	arm_smmu_gr1_write(smmu, ARM_SMMU_GR1_CBAR(idx), reg);
 
 	/*
 	 * TCR
-- 
2.21.0.dirty

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
