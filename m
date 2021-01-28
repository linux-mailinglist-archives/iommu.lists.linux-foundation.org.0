Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 7767630795E
	for <lists.iommu@lfdr.de>; Thu, 28 Jan 2021 16:18:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 285DD86BC5;
	Thu, 28 Jan 2021 15:18:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y5JXy1FJKVys; Thu, 28 Jan 2021 15:18:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id AA08786C39;
	Thu, 28 Jan 2021 15:18:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 96233C013A;
	Thu, 28 Jan 2021 15:18:16 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 380BFC013A
 for <iommu@lists.linux-foundation.org>; Thu, 28 Jan 2021 15:18:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 22594868A8
 for <iommu@lists.linux-foundation.org>; Thu, 28 Jan 2021 15:18:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mqBSxPPe4qGb for <iommu@lists.linux-foundation.org>;
 Thu, 28 Jan 2021 15:18:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 9E717868A6
 for <iommu@lists.linux-foundation.org>; Thu, 28 Jan 2021 15:18:10 +0000 (UTC)
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4DRPG943JhzjDT7;
 Thu, 28 Jan 2021 23:17:05 +0800 (CST)
Received: from DESKTOP-5IS4806.china.huawei.com (10.174.184.42) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.498.0; Thu, 28 Jan 2021 23:17:57 +0800
From: Keqian Zhu <zhukeqian1@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <kvm@vger.kernel.org>, <kvmarm@lists.cs.columbia.edu>,
 <iommu@lists.linux-foundation.org>, Will Deacon <will@kernel.org>, "Alex
 Williamson" <alex.williamson@redhat.com>, Marc Zyngier <maz@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>
Subject: [RFC PATCH 04/11] iommu/arm-smmu-v3: Split block descriptor to a span
 of page
Date: Thu, 28 Jan 2021 23:17:35 +0800
Message-ID: <20210128151742.18840-5-zhukeqian1@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210128151742.18840-1-zhukeqian1@huawei.com>
References: <20210128151742.18840-1-zhukeqian1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.174.184.42]
X-CFilter-Loop: Reflected
Cc: Mark Rutland <mark.rutland@arm.com>, jiangkunkun@huawei.com,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Cornelia Huck <cohuck@redhat.com>,
 lushenming@huawei.com, Kirti Wankhede <kwankhede@nvidia.com>,
 James Morse <james.morse@arm.com>, wanghaibin.wang@huawei.com,
 Robin Murphy <robin.murphy@arm.com>
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

From: jiangkunkun <jiangkunkun@huawei.com>

Block descriptor is not a proper granule for dirty log tracking. This
adds a new interface named split_block in iommu layer and arm smmuv3
implements it, which splits block descriptor to an equivalent span of
page descriptors.

During spliting block, other interfaces are not expected to be working,
so race condition does not exist. And we flush all iotlbs after the split
procedure is completed to ease the pressure of iommu, as we will split a
huge range of block mappings in general.

Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c |  20 ++++
 drivers/iommu/io-pgtable-arm.c              | 122 ++++++++++++++++++++
 drivers/iommu/iommu.c                       |  40 +++++++
 include/linux/io-pgtable.h                  |   2 +
 include/linux/iommu.h                       |  10 ++
 5 files changed, 194 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 9208881a571c..5469f4fca820 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -2510,6 +2510,25 @@ static int arm_smmu_domain_set_attr(struct iommu_domain *domain,
 	return ret;
 }
 
+static size_t arm_smmu_split_block(struct iommu_domain *domain,
+				   unsigned long iova, size_t size)
+{
+	struct arm_smmu_device *smmu = to_smmu_domain(domain)->smmu;
+	struct io_pgtable_ops *ops = to_smmu_domain(domain)->pgtbl_ops;
+
+	if (!(smmu->features & (ARM_SMMU_FEAT_BBML1 | ARM_SMMU_FEAT_BBML2))) {
+		dev_err(smmu->dev, "don't support BBML1/2 and split block\n");
+		return 0;
+	}
+
+	if (!ops || !ops->split_block) {
+		pr_err("don't support split block\n");
+		return 0;
+	}
+
+	return ops->split_block(ops, iova, size);
+}
+
 static int arm_smmu_of_xlate(struct device *dev, struct of_phandle_args *args)
 {
 	return iommu_fwspec_add_ids(dev, args->args, 1);
@@ -2609,6 +2628,7 @@ static struct iommu_ops arm_smmu_ops = {
 	.device_group		= arm_smmu_device_group,
 	.domain_get_attr	= arm_smmu_domain_get_attr,
 	.domain_set_attr	= arm_smmu_domain_set_attr,
+	.split_block		= arm_smmu_split_block,
 	.of_xlate		= arm_smmu_of_xlate,
 	.get_resv_regions	= arm_smmu_get_resv_regions,
 	.put_resv_regions	= generic_iommu_put_resv_regions,
diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index e299a44808ae..f3b7f7115e38 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -79,6 +79,8 @@
 #define ARM_LPAE_PTE_SH_IS		(((arm_lpae_iopte)3) << 8)
 #define ARM_LPAE_PTE_NS			(((arm_lpae_iopte)1) << 5)
 #define ARM_LPAE_PTE_VALID		(((arm_lpae_iopte)1) << 0)
+/* Block descriptor bits */
+#define ARM_LPAE_PTE_NT			(((arm_lpae_iopte)1) << 16)
 
 #define ARM_LPAE_PTE_ATTR_LO_MASK	(((arm_lpae_iopte)0x3ff) << 2)
 /* Ignore the contiguous bit for block splitting */
@@ -679,6 +681,125 @@ static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
 	return iopte_to_paddr(pte, data) | iova;
 }
 
+static size_t __arm_lpae_split_block(struct arm_lpae_io_pgtable *data,
+				     unsigned long iova, size_t size, int lvl,
+				     arm_lpae_iopte *ptep);
+
+static size_t arm_lpae_do_split_blk(struct arm_lpae_io_pgtable *data,
+				    unsigned long iova, size_t size,
+				    arm_lpae_iopte blk_pte, int lvl,
+				    arm_lpae_iopte *ptep)
+{
+	struct io_pgtable_cfg *cfg = &data->iop.cfg;
+	arm_lpae_iopte pte, *tablep;
+	phys_addr_t blk_paddr;
+	size_t tablesz = ARM_LPAE_GRANULE(data);
+	size_t split_sz = ARM_LPAE_BLOCK_SIZE(lvl, data);
+	int i;
+
+	if (WARN_ON(lvl == ARM_LPAE_MAX_LEVELS))
+		return 0;
+
+	tablep = __arm_lpae_alloc_pages(tablesz, GFP_ATOMIC, cfg);
+	if (!tablep)
+		return 0;
+
+	blk_paddr = iopte_to_paddr(blk_pte, data);
+	pte = iopte_prot(blk_pte);
+	for (i = 0; i < tablesz / sizeof(pte); i++, blk_paddr += split_sz)
+		__arm_lpae_init_pte(data, blk_paddr, pte, lvl, &tablep[i]);
+
+	if (cfg->bbml == 1) {
+		/* Race does not exist */
+		blk_pte |= ARM_LPAE_PTE_NT;
+		__arm_lpae_set_pte(ptep, blk_pte, cfg);
+		io_pgtable_tlb_flush_walk(&data->iop, iova, size, size);
+	}
+	/* Race does not exist */
+	pte = arm_lpae_install_table(tablep, ptep, blk_pte, cfg);
+
+	/* Have splited it into page? */
+	if (lvl == (ARM_LPAE_MAX_LEVELS - 1))
+		return size;
+
+	/* Go back to lvl - 1 */
+	ptep -= ARM_LPAE_LVL_IDX(iova, lvl - 1, data);
+	return __arm_lpae_split_block(data, iova, size, lvl - 1, ptep);
+}
+
+static size_t __arm_lpae_split_block(struct arm_lpae_io_pgtable *data,
+				     unsigned long iova, size_t size, int lvl,
+				     arm_lpae_iopte *ptep)
+{
+	arm_lpae_iopte pte;
+	struct io_pgtable *iop = &data->iop;
+	size_t base, next_size, total_size;
+
+	if (WARN_ON(lvl == ARM_LPAE_MAX_LEVELS))
+		return 0;
+
+	ptep += ARM_LPAE_LVL_IDX(iova, lvl, data);
+	pte = READ_ONCE(*ptep);
+	if (WARN_ON(!pte))
+		return 0;
+
+	if (size == ARM_LPAE_BLOCK_SIZE(lvl, data)) {
+		if (iopte_leaf(pte, lvl, iop->fmt)) {
+			if (lvl == (ARM_LPAE_MAX_LEVELS - 1) ||
+			    (pte & ARM_LPAE_PTE_AP_RDONLY))
+				return size;
+
+			/* We find a writable block, split it. */
+			return arm_lpae_do_split_blk(data, iova, size, pte,
+					lvl + 1, ptep);
+		} else {
+			/* If it is the last table level, then nothing to do */
+			if (lvl == (ARM_LPAE_MAX_LEVELS - 2))
+				return size;
+
+			total_size = 0;
+			next_size = ARM_LPAE_BLOCK_SIZE(lvl + 1, data);
+			ptep = iopte_deref(pte, data);
+			for (base = 0; base < size; base += next_size)
+				total_size += __arm_lpae_split_block(data,
+						iova + base, next_size, lvl + 1,
+						ptep);
+			return total_size;
+		}
+	} else if (iopte_leaf(pte, lvl, iop->fmt)) {
+		WARN(1, "Can't split behind a block.\n");
+		return 0;
+	}
+
+	/* Keep on walkin */
+	ptep = iopte_deref(pte, data);
+	return __arm_lpae_split_block(data, iova, size, lvl + 1, ptep);
+}
+
+static size_t arm_lpae_split_block(struct io_pgtable_ops *ops,
+				   unsigned long iova, size_t size)
+{
+	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
+	arm_lpae_iopte *ptep = data->pgd;
+	struct io_pgtable_cfg *cfg = &data->iop.cfg;
+	int lvl = data->start_level;
+	long iaext = (s64)iova >> cfg->ias;
+
+	if (WARN_ON(!size || (size & cfg->pgsize_bitmap) != size))
+		return 0;
+
+	if (cfg->quirks & IO_PGTABLE_QUIRK_ARM_TTBR1)
+		iaext = ~iaext;
+	if (WARN_ON(iaext))
+		return 0;
+
+	/* If it is smallest granule, then nothing to do */
+	if (size == ARM_LPAE_BLOCK_SIZE(ARM_LPAE_MAX_LEVELS - 1, data))
+		return size;
+
+	return __arm_lpae_split_block(data, iova, size, lvl, ptep);
+}
+
 static void arm_lpae_restrict_pgsizes(struct io_pgtable_cfg *cfg)
 {
 	unsigned long granule, page_sizes;
@@ -757,6 +878,7 @@ arm_lpae_alloc_pgtable(struct io_pgtable_cfg *cfg)
 		.map		= arm_lpae_map,
 		.unmap		= arm_lpae_unmap,
 		.iova_to_phys	= arm_lpae_iova_to_phys,
+		.split_block	= arm_lpae_split_block,
 	};
 
 	return data;
diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index ffeebda8d6de..7dc0850448c3 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2707,6 +2707,46 @@ int iommu_domain_set_attr(struct iommu_domain *domain,
 }
 EXPORT_SYMBOL_GPL(iommu_domain_set_attr);
 
+size_t iommu_split_block(struct iommu_domain *domain, unsigned long iova,
+			 size_t size)
+{
+	const struct iommu_ops *ops = domain->ops;
+	unsigned int min_pagesz;
+	size_t pgsize, splited_size;
+	size_t splited = 0;
+
+	min_pagesz = 1 << __ffs(domain->pgsize_bitmap);
+
+	if (!IS_ALIGNED(iova | size, min_pagesz)) {
+		pr_err("unaligned: iova 0x%lx size 0x%zx min_pagesz 0x%x\n",
+		       iova, size, min_pagesz);
+		return 0;
+	}
+
+	if (!ops || !ops->split_block) {
+		pr_err("don't support split block\n");
+		return 0;
+	}
+
+	while (size) {
+		pgsize = iommu_pgsize(domain, iova, size);
+
+		splited_size = ops->split_block(domain, iova, pgsize);
+
+		pr_debug("splited: iova 0x%lx size 0x%zx\n", iova, splited_size);
+		iova += splited_size;
+		size -= splited_size;
+		splited += splited_size;
+
+		if (splited_size != pgsize)
+			break;
+	}
+	iommu_flush_iotlb_all(domain);
+
+	return splited;
+}
+EXPORT_SYMBOL_GPL(iommu_split_block);
+
 void iommu_get_resv_regions(struct device *dev, struct list_head *list)
 {
 	const struct iommu_ops *ops = dev->bus->iommu_ops;
diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
index 26583beeb5d9..b87c6f4ecaa2 100644
--- a/include/linux/io-pgtable.h
+++ b/include/linux/io-pgtable.h
@@ -162,6 +162,8 @@ struct io_pgtable_ops {
 			size_t size, struct iommu_iotlb_gather *gather);
 	phys_addr_t (*iova_to_phys)(struct io_pgtable_ops *ops,
 				    unsigned long iova);
+	size_t (*split_block)(struct io_pgtable_ops *ops, unsigned long iova,
+			      size_t size);
 };
 
 /**
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index b3f0e2018c62..abeb811098a5 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -258,6 +258,8 @@ struct iommu_ops {
 			       enum iommu_attr attr, void *data);
 	int (*domain_set_attr)(struct iommu_domain *domain,
 			       enum iommu_attr attr, void *data);
+	size_t (*split_block)(struct iommu_domain *domain, unsigned long iova,
+			      size_t size);
 
 	/* Request/Free a list of reserved regions for a device */
 	void (*get_resv_regions)(struct device *dev, struct list_head *list);
@@ -509,6 +511,8 @@ extern int iommu_domain_get_attr(struct iommu_domain *domain, enum iommu_attr,
 				 void *data);
 extern int iommu_domain_set_attr(struct iommu_domain *domain, enum iommu_attr,
 				 void *data);
+extern size_t iommu_split_block(struct iommu_domain *domain, unsigned long iova,
+				size_t size);
 
 /* Window handling function prototypes */
 extern int iommu_domain_window_enable(struct iommu_domain *domain, u32 wnd_nr,
@@ -903,6 +907,12 @@ static inline int iommu_domain_set_attr(struct iommu_domain *domain,
 	return -EINVAL;
 }
 
+static inline size_t iommu_split_block(struct iommu_domain *domain,
+				       unsigned long iova, size_t size)
+{
+	return 0;
+}
+
 static inline int  iommu_device_register(struct iommu_device *iommu)
 {
 	return -ENODEV;
-- 
2.19.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
