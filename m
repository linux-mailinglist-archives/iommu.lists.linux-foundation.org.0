Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3322E2C4DD9
	for <lists.iommu@lfdr.de>; Thu, 26 Nov 2020 04:43:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id BCBD38778F;
	Thu, 26 Nov 2020 03:43:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t5rxgCKKe2aQ; Thu, 26 Nov 2020 03:43:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9103B87769;
	Thu, 26 Nov 2020 03:43:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 69CC8C0052;
	Thu, 26 Nov 2020 03:43:06 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7C590C0052
 for <iommu@lists.linux-foundation.org>; Thu, 26 Nov 2020 03:43:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 73C638761C
 for <iommu@lists.linux-foundation.org>; Thu, 26 Nov 2020 03:43:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XrUPFtnCj2mM for <iommu@lists.linux-foundation.org>;
 Thu, 26 Nov 2020 03:43:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 823B487620
 for <iommu@lists.linux-foundation.org>; Thu, 26 Nov 2020 03:43:02 +0000 (UTC)
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4ChNqp6jSHzkgHQ;
 Thu, 26 Nov 2020 11:42:30 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.178.208) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.487.0; Thu, 26 Nov 2020 11:42:50 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 "Joerg Roedel" <joro@8bytes.org>, Jean-Philippe Brucker
 <jean-philippe@linaro.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, iommu
 <iommu@lists.linux-foundation.org>, linux-kernel
 <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/1] iommu/arm-smmu-v3: add support for BBML
Date: Thu, 26 Nov 2020 11:42:30 +0800
Message-ID: <20201126034230.777-1-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.174.178.208]
X-CFilter-Loop: Reflected
Cc: Yang Yingliang <yangyingliang@huawei.com>
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

When changing from a set of pages/smaller blocks to a larger block for an
address, the software should follow the sequence of BBML processing.

When changing from a block to a set of pages/smaller blocks for an
address, there's no need to use nT bit. If an address in the large block
is accessed before page table switching, the TLB caches the large block
mapping. After the page table is switched and before TLB invalidation
finished, new access requests are still based on large block mapping.
After the block or page is invalidated, the system reads the small block
or page mapping from the memory; If the address in the large block is not
accessed before page table switching, the TLB has no cache. After the
page table is switched, a new access is initiated to read the small block
or page mapping from the memory.

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c |  2 +
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |  2 +
 drivers/iommu/io-pgtable-arm.c              | 46 ++++++++++++++++-----
 include/linux/io-pgtable.h                  |  1 +
 4 files changed, 40 insertions(+), 11 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index e634bbe60573..14a1a11565fb 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -1977,6 +1977,7 @@ static int arm_smmu_domain_finalise(struct iommu_domain *domain,
 		.coherent_walk	= smmu->features & ARM_SMMU_FEAT_COHERENCY,
 		.tlb		= &arm_smmu_flush_ops,
 		.iommu_dev	= smmu->dev,
+		.bbml		= smmu->bbml,
 	};
 
 	if (smmu_domain->non_strict)
@@ -3291,6 +3292,7 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
 
 	/* IDR3 */
 	reg = readl_relaxed(smmu->base + ARM_SMMU_IDR3);
+	smmu->bbml = FIELD_GET(IDR3_BBML, reg);
 	if (FIELD_GET(IDR3_RIL, reg))
 		smmu->features |= ARM_SMMU_FEAT_RANGE_INV;
 
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index d4b7f40ccb02..aa7eb460fa09 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -51,6 +51,7 @@
 #define IDR1_SIDSIZE			GENMASK(5, 0)
 
 #define ARM_SMMU_IDR3			0xc
+#define IDR3_BBML			GENMASK(12, 11)
 #define IDR3_RIL			(1 << 10)
 
 #define ARM_SMMU_IDR5			0x14
@@ -617,6 +618,7 @@ struct arm_smmu_device {
 
 	int				gerr_irq;
 	int				combined_irq;
+	int				bbml;
 
 	unsigned long			ias; /* IPA */
 	unsigned long			oas; /* PA */
diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index a7a9bc08dcd1..341581337ad0 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -72,6 +72,7 @@
 
 #define ARM_LPAE_PTE_NSTABLE		(((arm_lpae_iopte)1) << 63)
 #define ARM_LPAE_PTE_XN			(((arm_lpae_iopte)3) << 53)
+#define ARM_LPAE_PTE_nT			(((arm_lpae_iopte)1) << 16)
 #define ARM_LPAE_PTE_AF			(((arm_lpae_iopte)1) << 10)
 #define ARM_LPAE_PTE_SH_NS		(((arm_lpae_iopte)0) << 8)
 #define ARM_LPAE_PTE_SH_OS		(((arm_lpae_iopte)2) << 8)
@@ -255,7 +256,7 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
 
 static void __arm_lpae_init_pte(struct arm_lpae_io_pgtable *data,
 				phys_addr_t paddr, arm_lpae_iopte prot,
-				int lvl, arm_lpae_iopte *ptep)
+				int lvl, arm_lpae_iopte *ptep, arm_lpae_iopte nT)
 {
 	arm_lpae_iopte pte = prot;
 
@@ -265,37 +266,60 @@ static void __arm_lpae_init_pte(struct arm_lpae_io_pgtable *data,
 		pte |= ARM_LPAE_PTE_TYPE_BLOCK;
 
 	pte |= paddr_to_iopte(paddr, data);
+	pte |= nT;
 
 	__arm_lpae_set_pte(ptep, pte, &data->iop.cfg);
 }
 
+static void __arm_lpae_free_pgtable(struct arm_lpae_io_pgtable *data, int lvl,
+				    arm_lpae_iopte *ptep);
 static int arm_lpae_init_pte(struct arm_lpae_io_pgtable *data,
 			     unsigned long iova, phys_addr_t paddr,
 			     arm_lpae_iopte prot, int lvl,
 			     arm_lpae_iopte *ptep)
 {
 	arm_lpae_iopte pte = *ptep;
+	struct io_pgtable_cfg *cfg = &data->iop.cfg;
 
 	if (iopte_leaf(pte, lvl, data->iop.fmt)) {
 		/* We require an unmap first */
 		WARN_ON(!selftest_running);
 		return -EEXIST;
 	} else if (iopte_type(pte, lvl) == ARM_LPAE_PTE_TYPE_TABLE) {
-		/*
-		 * We need to unmap and free the old table before
-		 * overwriting it with a block entry.
-		 */
 		arm_lpae_iopte *tblp;
+		struct io_pgtable *iop = &data->iop;
 		size_t sz = ARM_LPAE_BLOCK_SIZE(lvl, data);
 
-		tblp = ptep - ARM_LPAE_LVL_IDX(iova, lvl, data);
-		if (__arm_lpae_unmap(data, NULL, iova, sz, lvl, tblp) != sz) {
-			WARN_ON(1);
-			return -EINVAL;
+		switch (cfg->bbml) {
+		case 0:
+			/*
+			 * We need to unmap and free the old table before
+			 * overwriting it with a block entry.
+			 */
+			tblp = ptep - ARM_LPAE_LVL_IDX(iova, lvl, data);
+			if (__arm_lpae_unmap(data, NULL, iova, sz, lvl, tblp) != sz) {
+				WARN_ON(1);
+				return -EINVAL;
+			}
+			break;
+		case 1:
+			__arm_lpae_init_pte(data, paddr, prot, lvl, ptep, ARM_LPAE_PTE_nT);
+
+			io_pgtable_tlb_flush_walk(iop, iova, sz, ARM_LPAE_GRANULE(data));
+			tblp = iopte_deref(pte, data);
+			__arm_lpae_free_pgtable(data, lvl + 1, tblp);
+			break;
+		case 2:
+			__arm_lpae_init_pte(data, paddr, prot, lvl, ptep, 0);
+
+			io_pgtable_tlb_flush_walk(iop, iova, sz, ARM_LPAE_GRANULE(data));
+			tblp = iopte_deref(pte, data);
+			__arm_lpae_free_pgtable(data, lvl + 1, tblp);
+			return 0;
 		}
 	}
 
-	__arm_lpae_init_pte(data, paddr, prot, lvl, ptep);
+	__arm_lpae_init_pte(data, paddr, prot, lvl, ptep, 0);
 	return 0;
 }
 
@@ -537,7 +561,7 @@ static size_t arm_lpae_split_blk_unmap(struct arm_lpae_io_pgtable *data,
 		if (i == unmap_idx)
 			continue;
 
-		__arm_lpae_init_pte(data, blk_paddr, pte, lvl, &tablep[i]);
+		__arm_lpae_init_pte(data, blk_paddr, pte, lvl, &tablep[i], 0);
 	}
 
 	pte = arm_lpae_install_table(tablep, ptep, blk_pte, cfg);
diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
index 4cde111e425b..0a45c2818686 100644
--- a/include/linux/io-pgtable.h
+++ b/include/linux/io-pgtable.h
@@ -98,6 +98,7 @@ struct io_pgtable_cfg {
 	unsigned int			ias;
 	unsigned int			oas;
 	bool				coherent_walk;
+	int				bbml;
 	const struct iommu_flush_ops	*tlb;
 	struct device			*iommu_dev;
 
-- 
2.26.0.106.g9fadedd


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
