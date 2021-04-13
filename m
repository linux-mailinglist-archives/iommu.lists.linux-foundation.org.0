Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id BFAC035DA72
	for <lists.iommu@lfdr.de>; Tue, 13 Apr 2021 10:55:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D33384353;
	Tue, 13 Apr 2021 08:55:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Drq-G2jOlXOX; Tue, 13 Apr 2021 08:55:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A7D984348;
	Tue, 13 Apr 2021 08:55:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 25AC8C000A;
	Tue, 13 Apr 2021 08:55:29 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2E6B0C0012
 for <iommu@lists.linux-foundation.org>; Tue, 13 Apr 2021 08:55:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C2438434A
 for <iommu@lists.linux-foundation.org>; Tue, 13 Apr 2021 08:55:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u6x41RqlQqXH for <iommu@lists.linux-foundation.org>;
 Tue, 13 Apr 2021 08:55:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EC13484342
 for <iommu@lists.linux-foundation.org>; Tue, 13 Apr 2021 08:55:24 +0000 (UTC)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FKK9p6NCRzPqkV;
 Tue, 13 Apr 2021 16:52:30 +0800 (CST)
Received: from DESKTOP-5IS4806.china.huawei.com (10.174.187.224) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.498.0; Tue, 13 Apr 2021 16:55:15 +0800
From: Keqian Zhu <zhukeqian1@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <iommu@lists.linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>,
 "Will Deacon" <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, Yi Sun
 <yi.y.sun@linux.intel.com>, Jean-Philippe Brucker <jean-philippe@linaro.org>, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, Tian Kevin
 <kevin.tian@intel.com>, Lu Baolu <baolu.lu@linux.intel.com>
Subject: [PATCH v3 11/12] iommu/arm-smmu-v3: Realize clear_dirty_log iommu ops
Date: Tue, 13 Apr 2021 16:54:56 +0800
Message-ID: <20210413085457.25400-12-zhukeqian1@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210413085457.25400-1-zhukeqian1@huawei.com>
References: <20210413085457.25400-1-zhukeqian1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.174.187.224]
X-CFilter-Loop: Reflected
Cc: jiangkunkun@huawei.com, Cornelia Huck <cohuck@redhat.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, lushenming@huawei.com,
 Alex Williamson <alex.williamson@redhat.com>, wanghaibin.wang@huawei.com
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

From: Kunkun Jiang <jiangkunkun@huawei.com>

After dirty log is retrieved, user should clear dirty log to re-enable
dirty log tracking for these dirtied pages. This clears the dirty state
(As we just enable HTTU for stage1, so set the AP[2] bit) of these leaf
TTDs that are specified by the user provided bitmap.

Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 25 ++++++
 drivers/iommu/io-pgtable-arm.c              | 95 +++++++++++++++++++++
 include/linux/io-pgtable.h                  |  4 +
 3 files changed, 124 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 9eb209a07acc..59bb1d198631 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -2656,6 +2656,30 @@ static int arm_smmu_sync_dirty_log(struct iommu_domain *domain,
 				   bitmap_pgshift);
 }
 
+static int arm_smmu_clear_dirty_log(struct iommu_domain *domain,
+				    unsigned long iova, size_t size,
+				    unsigned long *bitmap,
+				    unsigned long base_iova,
+				    unsigned long bitmap_pgshift)
+{
+	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
+	struct io_pgtable_ops *ops = smmu_domain->pgtbl_ops;
+	struct arm_smmu_device *smmu = smmu_domain->smmu;
+
+	if (!(smmu->features & ARM_SMMU_FEAT_HD))
+		return -ENODEV;
+	if (smmu_domain->stage != ARM_SMMU_DOMAIN_S1)
+		return -EINVAL;
+
+	if (!ops || !ops->clear_dirty_log) {
+		pr_err("io-pgtable don't realize clear dirty log\n");
+		return -ENODEV;
+	}
+
+	return ops->clear_dirty_log(ops, iova, size, bitmap, base_iova,
+				    bitmap_pgshift);
+}
+
 static int arm_smmu_of_xlate(struct device *dev, struct of_phandle_args *args)
 {
 	return iommu_fwspec_add_ids(dev, args->args, 1);
@@ -2759,6 +2783,7 @@ static struct iommu_ops arm_smmu_ops = {
 	.merge_page		= arm_smmu_merge_page,
 	.switch_dirty_log	= arm_smmu_switch_dirty_log,
 	.sync_dirty_log		= arm_smmu_sync_dirty_log,
+	.clear_dirty_log	= arm_smmu_clear_dirty_log,
 	.of_xlate		= arm_smmu_of_xlate,
 	.get_resv_regions	= arm_smmu_get_resv_regions,
 	.put_resv_regions	= generic_iommu_put_resv_regions,
diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index 67a208a05ab2..e3ef0f50611c 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -966,6 +966,100 @@ static int arm_lpae_sync_dirty_log(struct io_pgtable_ops *ops,
 					 bitmap, base_iova, bitmap_pgshift);
 }
 
+static int __arm_lpae_clear_dirty_log(struct arm_lpae_io_pgtable *data,
+				      unsigned long iova, size_t size,
+				      int lvl, arm_lpae_iopte *ptep,
+				      unsigned long *bitmap,
+				      unsigned long base_iova,
+				      unsigned long bitmap_pgshift)
+{
+	arm_lpae_iopte pte;
+	struct io_pgtable *iop = &data->iop;
+	unsigned long offset;
+	size_t base, next_size;
+	int nbits, ret, i;
+
+	if (WARN_ON(lvl == ARM_LPAE_MAX_LEVELS))
+		return -EINVAL;
+
+	ptep += ARM_LPAE_LVL_IDX(iova, lvl, data);
+	pte = READ_ONCE(*ptep);
+	if (WARN_ON(!pte))
+		return -EINVAL;
+
+	if (size == ARM_LPAE_BLOCK_SIZE(lvl, data)) {
+		if (iopte_leaf(pte, lvl, iop->fmt)) {
+			if (pte & ARM_LPAE_PTE_AP_RDONLY)
+				return 0;
+
+			/* Ensure all corresponding bits are set */
+			nbits = size >> bitmap_pgshift;
+			offset = (iova - base_iova) >> bitmap_pgshift;
+			for (i = offset; i < offset + nbits; i++) {
+				if (!test_bit(i, bitmap))
+					return 0;
+			}
+
+			/* Race does not exist */
+			pte |= ARM_LPAE_PTE_AP_RDONLY;
+			__arm_lpae_set_pte(ptep, pte, &iop->cfg);
+			return 0;
+		} else {
+			/* To traverse next level */
+			next_size = ARM_LPAE_BLOCK_SIZE(lvl + 1, data);
+			ptep = iopte_deref(pte, data);
+			for (base = 0; base < size; base += next_size) {
+				ret = __arm_lpae_clear_dirty_log(data,
+						iova + base, next_size, lvl + 1,
+						ptep, bitmap, base_iova,
+						bitmap_pgshift);
+				if (ret)
+					return ret;
+			}
+			return 0;
+		}
+	} else if (iopte_leaf(pte, lvl, iop->fmt)) {
+		/* Though the size is too small, it is already clean */
+		if (pte & ARM_LPAE_PTE_AP_RDONLY)
+			return 0;
+
+		return -EINVAL;
+	}
+
+	/* Keep on walkin */
+	ptep = iopte_deref(pte, data);
+	return __arm_lpae_clear_dirty_log(data, iova, size, lvl + 1, ptep,
+			bitmap, base_iova, bitmap_pgshift);
+}
+
+static int arm_lpae_clear_dirty_log(struct io_pgtable_ops *ops,
+				    unsigned long iova, size_t size,
+				    unsigned long *bitmap,
+				    unsigned long base_iova,
+				    unsigned long bitmap_pgshift)
+{
+	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
+	arm_lpae_iopte *ptep = data->pgd;
+	int lvl = data->start_level;
+	struct io_pgtable_cfg *cfg = &data->iop.cfg;
+	long iaext = (s64)iova >> cfg->ias;
+
+	if (WARN_ON(!size || (size & cfg->pgsize_bitmap) != size))
+		return -EINVAL;
+
+	if (cfg->quirks & IO_PGTABLE_QUIRK_ARM_TTBR1)
+		iaext = ~iaext;
+	if (WARN_ON(iaext))
+		return -EINVAL;
+
+	if (data->iop.fmt != ARM_64_LPAE_S1 &&
+	    data->iop.fmt != ARM_32_LPAE_S1)
+		return -EINVAL;
+
+	return __arm_lpae_clear_dirty_log(data, iova, size, lvl, ptep,
+			bitmap, base_iova, bitmap_pgshift);
+}
+
 static void arm_lpae_restrict_pgsizes(struct io_pgtable_cfg *cfg)
 {
 	unsigned long granule, page_sizes;
@@ -1047,6 +1141,7 @@ arm_lpae_alloc_pgtable(struct io_pgtable_cfg *cfg)
 		.split_block	= arm_lpae_split_block,
 		.merge_page	= arm_lpae_merge_page,
 		.sync_dirty_log	= arm_lpae_sync_dirty_log,
+		.clear_dirty_log = arm_lpae_clear_dirty_log,
 	};
 
 	return data;
diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
index 9e2757d12066..ad65b9099be6 100644
--- a/include/linux/io-pgtable.h
+++ b/include/linux/io-pgtable.h
@@ -175,6 +175,10 @@ struct io_pgtable_ops {
 			      unsigned long iova, size_t size,
 			      unsigned long *bitmap, unsigned long base_iova,
 			      unsigned long bitmap_pgshift);
+	int (*clear_dirty_log)(struct io_pgtable_ops *ops,
+			       unsigned long iova, size_t size,
+			       unsigned long *bitmap, unsigned long base_iova,
+			       unsigned long bitmap_pgshift);
 };
 
 /**
-- 
2.19.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
