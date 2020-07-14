Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 1937721EF55
	for <lists.iommu@lfdr.de>; Tue, 14 Jul 2020 13:33:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 7698725E42;
	Tue, 14 Jul 2020 11:33:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CNFEvEgXdjos; Tue, 14 Jul 2020 11:33:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id F3E1125B0B;
	Tue, 14 Jul 2020 11:33:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D82DDC0733;
	Tue, 14 Jul 2020 11:33:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E42F4C0733
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jul 2020 11:33:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id DA10D88E61
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jul 2020 11:33:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9Hwqe_IQi9i7 for <iommu@lists.linux-foundation.org>;
 Tue, 14 Jul 2020 11:33:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 3E02288E5D
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jul 2020 11:33:19 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 64DF830E;
 Tue, 14 Jul 2020 04:33:17 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com
 [10.1.196.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CC1C83F7BB;
 Tue, 14 Jul 2020 04:33:16 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: joro@8bytes.org
Subject: [PATCH] iommu/exynos: Rename update_pte()
Date: Tue, 14 Jul 2020 12:33:13 +0100
Message-Id: <615eb039388e399da86bd90fc61792b88e39adac.1594726393.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.26.2.dirty
MIME-Version: 1.0
Cc: iommu@lists.linux-foundation.org
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

The name "update_pte" is a little too generic, and can end up clashing
with architecture pagetable code leaked out of common mm headers. Rename
it to something mroe appropriately namespaced.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/exynos-iommu.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
index 60c8a56e4a3f..75cdd37fae38 100644
--- a/drivers/iommu/exynos-iommu.c
+++ b/drivers/iommu/exynos-iommu.c
@@ -721,7 +721,7 @@ static struct platform_driver exynos_sysmmu_driver __refdata = {
 	}
 };
 
-static inline void update_pte(sysmmu_pte_t *ent, sysmmu_pte_t val)
+static inline void exynos_iommu_set_pte(sysmmu_pte_t *ent, sysmmu_pte_t val)
 {
 	dma_sync_single_for_cpu(dma_dev, virt_to_phys(ent), sizeof(*ent),
 				DMA_TO_DEVICE);
@@ -933,7 +933,7 @@ static sysmmu_pte_t *alloc_lv2entry(struct exynos_iommu_domain *domain,
 		if (!pent)
 			return ERR_PTR(-ENOMEM);
 
-		update_pte(sent, mk_lv1ent_page(virt_to_phys(pent)));
+		exynos_iommu_set_pte(sent, mk_lv1ent_page(virt_to_phys(pent)));
 		kmemleak_ignore(pent);
 		*pgcounter = NUM_LV2ENTRIES;
 		handle = dma_map_single(dma_dev, pent, LV2TABLE_SIZE,
@@ -994,7 +994,7 @@ static int lv1set_section(struct exynos_iommu_domain *domain,
 		*pgcnt = 0;
 	}
 
-	update_pte(sent, mk_lv1ent_sect(paddr, prot));
+	exynos_iommu_set_pte(sent, mk_lv1ent_sect(paddr, prot));
 
 	spin_lock(&domain->lock);
 	if (lv1ent_page_zero(sent)) {
@@ -1018,7 +1018,7 @@ static int lv2set_page(sysmmu_pte_t *pent, phys_addr_t paddr, size_t size,
 		if (WARN_ON(!lv2ent_fault(pent)))
 			return -EADDRINUSE;
 
-		update_pte(pent, mk_lv2ent_spage(paddr, prot));
+		exynos_iommu_set_pte(pent, mk_lv2ent_spage(paddr, prot));
 		*pgcnt -= 1;
 	} else { /* size == LPAGE_SIZE */
 		int i;
@@ -1150,7 +1150,7 @@ static size_t exynos_iommu_unmap(struct iommu_domain *iommu_domain,
 		}
 
 		/* workaround for h/w bug in System MMU v3.3 */
-		update_pte(ent, ZERO_LV2LINK);
+		exynos_iommu_set_pte(ent, ZERO_LV2LINK);
 		size = SECT_SIZE;
 		goto done;
 	}
@@ -1171,7 +1171,7 @@ static size_t exynos_iommu_unmap(struct iommu_domain *iommu_domain,
 	}
 
 	if (lv2ent_small(ent)) {
-		update_pte(ent, 0);
+		exynos_iommu_set_pte(ent, 0);
 		size = SPAGE_SIZE;
 		domain->lv2entcnt[lv1ent_offset(iova)] += 1;
 		goto done;
-- 
2.26.2.dirty

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
