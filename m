Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F938DCAC
	for <lists.iommu@lfdr.de>; Wed, 14 Aug 2019 20:04:33 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 745B8DD1;
	Wed, 14 Aug 2019 18:04:09 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A1809DC6
	for <iommu@lists.linux-foundation.org>;
	Wed, 14 Aug 2019 18:04:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 513A589D
	for <iommu@lists.linux-foundation.org>;
	Wed, 14 Aug 2019 18:04:05 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 544FF169E;
	Wed, 14 Aug 2019 10:57:08 -0700 (PDT)
Received: from fuggles.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
	[10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 51E1F3F694; 
	Wed, 14 Aug 2019 10:57:06 -0700 (PDT)
From: Will Deacon <will@kernel.org>
To: iommu@lists.linux-foundation.org
Subject: [PATCH 12/13] iommu/io-pgtable: Pass struct iommu_iotlb_gather to
	->unmap()
Date: Wed, 14 Aug 2019 18:56:33 +0100
Message-Id: <20190814175634.21081-13-will@kernel.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190814175634.21081-1-will@kernel.org>
References: <20190814175634.21081-1-will@kernel.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Vijay Kilary <vkilari@codeaurora.org>, Robin Murphy <robin.murphy@arm.com>,
	Jan Glauber <jglauber@marvell.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Jayachandran Chandrasekharan Nair <jnair@marvell.com>,
	Jon Masters <jcm@redhat.com>, David Woodhouse <dwmw2@infradead.org>,
	Will Deacon <will@kernel.org>
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

Update the io-pgtable ->unmap() function to take an iommu_iotlb_gather
pointer as an argument, and update the callers as appropriate.

Signed-off-by: Will Deacon <will@kernel.org>
---
 drivers/gpu/drm/panfrost/panfrost_mmu.c | 2 +-
 drivers/iommu/arm-smmu-v3.c             | 2 +-
 drivers/iommu/arm-smmu.c                | 2 +-
 drivers/iommu/io-pgtable-arm-v7s.c      | 6 +++---
 drivers/iommu/io-pgtable-arm.c          | 7 +++----
 drivers/iommu/ipmmu-vmsa.c              | 2 +-
 drivers/iommu/msm_iommu.c               | 2 +-
 drivers/iommu/mtk_iommu.c               | 2 +-
 drivers/iommu/qcom_iommu.c              | 2 +-
 include/linux/io-pgtable.h              | 4 +++-
 10 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index de22a2276e00..6e8145c36e93 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -222,7 +222,7 @@ void panfrost_mmu_unmap(struct panfrost_gem_object *bo)
 		size_t unmapped_page;
 		size_t pgsize = get_pgsize(iova, len - unmapped_len);
 
-		unmapped_page = ops->unmap(ops, iova, pgsize);
+		unmapped_page = ops->unmap(ops, iova, pgsize, NULL);
 		if (!unmapped_page)
 			break;
 
diff --git a/drivers/iommu/arm-smmu-v3.c b/drivers/iommu/arm-smmu-v3.c
index 231093413ff9..8e2e53079f48 100644
--- a/drivers/iommu/arm-smmu-v3.c
+++ b/drivers/iommu/arm-smmu-v3.c
@@ -2015,7 +2015,7 @@ static size_t arm_smmu_unmap(struct iommu_domain *domain, unsigned long iova,
 	if (!ops)
 		return 0;
 
-	ret = ops->unmap(ops, iova, size);
+	ret = ops->unmap(ops, iova, size, gather);
 	if (ret && arm_smmu_atc_inv_domain(smmu_domain, 0, iova, size))
 		return 0;
 
diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
index 07a267c437d6..f6689956ab6e 100644
--- a/drivers/iommu/arm-smmu.c
+++ b/drivers/iommu/arm-smmu.c
@@ -1362,7 +1362,7 @@ static size_t arm_smmu_unmap(struct iommu_domain *domain, unsigned long iova,
 		return 0;
 
 	arm_smmu_rpm_get(smmu);
-	ret = ops->unmap(ops, iova, size);
+	ret = ops->unmap(ops, iova, size, gather);
 	arm_smmu_rpm_put(smmu);
 
 	return ret;
diff --git a/drivers/iommu/io-pgtable-arm-v7s.c b/drivers/iommu/io-pgtable-arm-v7s.c
index 203894fb6765..a7776e982b6c 100644
--- a/drivers/iommu/io-pgtable-arm-v7s.c
+++ b/drivers/iommu/io-pgtable-arm-v7s.c
@@ -666,7 +666,7 @@ static size_t __arm_v7s_unmap(struct arm_v7s_io_pgtable *data,
 }
 
 static size_t arm_v7s_unmap(struct io_pgtable_ops *ops, unsigned long iova,
-			    size_t size)
+			    size_t size, struct iommu_iotlb_gather *gather)
 {
 	struct arm_v7s_io_pgtable *data = io_pgtable_ops_to_data(ops);
 
@@ -892,7 +892,7 @@ static int __init arm_v7s_do_selftests(void)
 	size = 1UL << __ffs(cfg.pgsize_bitmap);
 	while (i < loopnr) {
 		iova_start = i * SZ_16M;
-		if (ops->unmap(ops, iova_start + size, size) != size)
+		if (ops->unmap(ops, iova_start + size, size, NULL) != size)
 			return __FAIL(ops);
 
 		/* Remap of partial unmap */
@@ -910,7 +910,7 @@ static int __init arm_v7s_do_selftests(void)
 	for_each_set_bit(i, &cfg.pgsize_bitmap, BITS_PER_LONG) {
 		size = 1UL << i;
 
-		if (ops->unmap(ops, iova, size) != size)
+		if (ops->unmap(ops, iova, size, NULL) != size)
 			return __FAIL(ops);
 
 		if (ops->iova_to_phys(ops, iova + 42))
diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index f35516744965..325430f8a0a1 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -12,7 +12,6 @@
 #include <linux/atomic.h>
 #include <linux/bitops.h>
 #include <linux/io-pgtable.h>
-#include <linux/iommu.h>
 #include <linux/kernel.h>
 #include <linux/sizes.h>
 #include <linux/slab.h>
@@ -642,7 +641,7 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
 }
 
 static size_t arm_lpae_unmap(struct io_pgtable_ops *ops, unsigned long iova,
-			     size_t size)
+			     size_t size, struct iommu_iotlb_gather *gather)
 {
 	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
 	arm_lpae_iopte *ptep = data->pgd;
@@ -1167,7 +1166,7 @@ static int __init arm_lpae_run_tests(struct io_pgtable_cfg *cfg)
 
 		/* Partial unmap */
 		size = 1UL << __ffs(cfg->pgsize_bitmap);
-		if (ops->unmap(ops, SZ_1G + size, size) != size)
+		if (ops->unmap(ops, SZ_1G + size, size, NULL) != size)
 			return __FAIL(ops, i);
 
 		/* Remap of partial unmap */
@@ -1182,7 +1181,7 @@ static int __init arm_lpae_run_tests(struct io_pgtable_cfg *cfg)
 		for_each_set_bit(j, &cfg->pgsize_bitmap, BITS_PER_LONG) {
 			size = 1UL << j;
 
-			if (ops->unmap(ops, iova, size) != size)
+			if (ops->unmap(ops, iova, size, NULL) != size)
 				return __FAIL(ops, i);
 
 			if (ops->iova_to_phys(ops, iova + 42))
diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
index a2b8eff4c1f7..76a8ec343d53 100644
--- a/drivers/iommu/ipmmu-vmsa.c
+++ b/drivers/iommu/ipmmu-vmsa.c
@@ -737,7 +737,7 @@ static size_t ipmmu_unmap(struct iommu_domain *io_domain, unsigned long iova,
 {
 	struct ipmmu_vmsa_domain *domain = to_vmsa_domain(io_domain);
 
-	return domain->iop->unmap(domain->iop, iova, size);
+	return domain->iop->unmap(domain->iop, iova, size, gather);
 }
 
 static void ipmmu_flush_iotlb_all(struct iommu_domain *io_domain)
diff --git a/drivers/iommu/msm_iommu.c b/drivers/iommu/msm_iommu.c
index ccfc7ed230ef..8a0dcaf0a9e9 100644
--- a/drivers/iommu/msm_iommu.c
+++ b/drivers/iommu/msm_iommu.c
@@ -523,7 +523,7 @@ static size_t msm_iommu_unmap(struct iommu_domain *domain, unsigned long iova,
 	unsigned long flags;
 
 	spin_lock_irqsave(&priv->pgtlock, flags);
-	len = priv->iop->unmap(priv->iop, iova, len);
+	len = priv->iop->unmap(priv->iop, iova, len, gather);
 	spin_unlock_irqrestore(&priv->pgtlock, flags);
 
 	return len;
diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 3785750bdb44..b73cffd63262 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -400,7 +400,7 @@ static size_t mtk_iommu_unmap(struct iommu_domain *domain,
 	size_t unmapsz;
 
 	spin_lock_irqsave(&dom->pgtlock, flags);
-	unmapsz = dom->iop->unmap(dom->iop, iova, size);
+	unmapsz = dom->iop->unmap(dom->iop, iova, size, gather);
 	spin_unlock_irqrestore(&dom->pgtlock, flags);
 
 	return unmapsz;
diff --git a/drivers/iommu/qcom_iommu.c b/drivers/iommu/qcom_iommu.c
index 0b8a6d6bb475..48b288ef74b4 100644
--- a/drivers/iommu/qcom_iommu.c
+++ b/drivers/iommu/qcom_iommu.c
@@ -455,7 +455,7 @@ static size_t qcom_iommu_unmap(struct iommu_domain *domain, unsigned long iova,
 	 */
 	pm_runtime_get_sync(qcom_domain->iommu->dev);
 	spin_lock_irqsave(&qcom_domain->pgtbl_lock, flags);
-	ret = ops->unmap(ops, iova, size);
+	ret = ops->unmap(ops, iova, size, gather);
 	spin_unlock_irqrestore(&qcom_domain->pgtbl_lock, flags);
 	pm_runtime_put_sync(qcom_domain->iommu->dev);
 
diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
index 843310484fe2..fe27d93c8ad9 100644
--- a/include/linux/io-pgtable.h
+++ b/include/linux/io-pgtable.h
@@ -1,7 +1,9 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 #ifndef __IO_PGTABLE_H
 #define __IO_PGTABLE_H
+
 #include <linux/bitops.h>
+#include <linux/iommu.h>
 
 /*
  * Public API for use by IOMMU drivers
@@ -136,7 +138,7 @@ struct io_pgtable_ops {
 	int (*map)(struct io_pgtable_ops *ops, unsigned long iova,
 		   phys_addr_t paddr, size_t size, int prot);
 	size_t (*unmap)(struct io_pgtable_ops *ops, unsigned long iova,
-			size_t size);
+			size_t size, struct iommu_iotlb_gather *gather);
 	phys_addr_t (*iova_to_phys)(struct io_pgtable_ops *ops,
 				    unsigned long iova);
 };
-- 
2.11.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
