Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 045FB2AF0E1
	for <lists.iommu@lfdr.de>; Wed, 11 Nov 2020 13:40:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id B2B2287528;
	Wed, 11 Nov 2020 12:40:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OMHXuDPgiAOe; Wed, 11 Nov 2020 12:40:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4D6BA8754B;
	Wed, 11 Nov 2020 12:40:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 46945C016F;
	Wed, 11 Nov 2020 12:40:24 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9AA4BC016F
 for <iommu@lists.linux-foundation.org>; Wed, 11 Nov 2020 12:40:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 8963187555
 for <iommu@lists.linux-foundation.org>; Wed, 11 Nov 2020 12:40:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vmzenjkcMzch for <iommu@lists.linux-foundation.org>;
 Wed, 11 Nov 2020 12:40:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by hemlock.osuosl.org (Postfix) with ESMTP id 75D358754B
 for <iommu@lists.linux-foundation.org>; Wed, 11 Nov 2020 12:40:22 +0000 (UTC)
X-UUID: 4cb41f8c15ef4c3d851b9c17e78fb23f-20201111
X-UUID: 4cb41f8c15ef4c3d851b9c17e78fb23f-20201111
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2142840957; Wed, 11 Nov 2020 20:40:18 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 11 Nov 2020 20:40:16 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 11 Nov 2020 20:40:15 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v4 10/24] iommu/io-pgtable-arm-v7s: Add cfg as a param in some
 macros
Date: Wed, 11 Nov 2020 20:38:24 +0800
Message-ID: <20201111123838.15682-11-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201111123838.15682-1-yong.wu@mediatek.com>
References: <20201111123838.15682-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 chao.hao@mediatek.com, kernel-team@android.com, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzk@kernel.org>, anan.sun@mediatek.com,
 Greg Kroah-Hartman <gregkh@google.com>, linux-arm-kernel@lists.infradead.org
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

Add "cfg" as a parameter for some macros. This is a preparing patch for
mediatek extend the lvl1 pgtable. No functional change.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
Acked-by: Will Deacon <will@kernel.org>
---
 drivers/iommu/io-pgtable-arm-v7s.c | 36 +++++++++++++++---------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm-v7s.c b/drivers/iommu/io-pgtable-arm-v7s.c
index 58cc201c10a3..0b3c5b904ddc 100644
--- a/drivers/iommu/io-pgtable-arm-v7s.c
+++ b/drivers/iommu/io-pgtable-arm-v7s.c
@@ -47,21 +47,21 @@
  * and 12 bits in a page.
  */
 #define ARM_V7S_ADDR_BITS		32
-#define _ARM_V7S_LVL_BITS(lvl)		((lvl) == 1 ? 12 : 8)
+#define _ARM_V7S_LVL_BITS(lvl, cfg)	((lvl) == 1 ? 12 : 8)
 #define ARM_V7S_LVL_SHIFT(lvl)		((lvl) == 1 ? 20 : 12)
 #define ARM_V7S_TABLE_SHIFT		10
 
-#define ARM_V7S_PTES_PER_LVL(lvl)	(1 << _ARM_V7S_LVL_BITS(lvl))
-#define ARM_V7S_TABLE_SIZE(lvl)						\
-	(ARM_V7S_PTES_PER_LVL(lvl) * sizeof(arm_v7s_iopte))
+#define ARM_V7S_PTES_PER_LVL(lvl, cfg)	(1 << _ARM_V7S_LVL_BITS(lvl, cfg))
+#define ARM_V7S_TABLE_SIZE(lvl, cfg)						\
+	(ARM_V7S_PTES_PER_LVL(lvl, cfg) * sizeof(arm_v7s_iopte))
 
 #define ARM_V7S_BLOCK_SIZE(lvl)		(1UL << ARM_V7S_LVL_SHIFT(lvl))
 #define ARM_V7S_LVL_MASK(lvl)		((u32)(~0U << ARM_V7S_LVL_SHIFT(lvl)))
 #define ARM_V7S_TABLE_MASK		((u32)(~0U << ARM_V7S_TABLE_SHIFT))
-#define _ARM_V7S_IDX_MASK(lvl)		(ARM_V7S_PTES_PER_LVL(lvl) - 1)
-#define ARM_V7S_LVL_IDX(addr, lvl)	({				\
+#define _ARM_V7S_IDX_MASK(lvl, cfg)	(ARM_V7S_PTES_PER_LVL(lvl, cfg) - 1)
+#define ARM_V7S_LVL_IDX(addr, lvl, cfg)	({				\
 	int _l = lvl;							\
-	((u32)(addr) >> ARM_V7S_LVL_SHIFT(_l)) & _ARM_V7S_IDX_MASK(_l); \
+	((u32)(addr) >> ARM_V7S_LVL_SHIFT(_l)) & _ARM_V7S_IDX_MASK(_l, cfg); \
 })
 
 /*
@@ -237,7 +237,7 @@ static void *__arm_v7s_alloc_table(int lvl, gfp_t gfp,
 	struct device *dev = cfg->iommu_dev;
 	phys_addr_t phys;
 	dma_addr_t dma;
-	size_t size = ARM_V7S_TABLE_SIZE(lvl);
+	size_t size = ARM_V7S_TABLE_SIZE(lvl, cfg);
 	void *table = NULL;
 
 	if (lvl == 1)
@@ -283,7 +283,7 @@ static void __arm_v7s_free_table(void *table, int lvl,
 {
 	struct io_pgtable_cfg *cfg = &data->iop.cfg;
 	struct device *dev = cfg->iommu_dev;
-	size_t size = ARM_V7S_TABLE_SIZE(lvl);
+	size_t size = ARM_V7S_TABLE_SIZE(lvl, cfg);
 
 	if (!cfg->coherent_walk)
 		dma_unmap_single(dev, __arm_v7s_dma_addr(table), size,
@@ -427,7 +427,7 @@ static int arm_v7s_init_pte(struct arm_v7s_io_pgtable *data,
 			arm_v7s_iopte *tblp;
 			size_t sz = ARM_V7S_BLOCK_SIZE(lvl);
 
-			tblp = ptep - ARM_V7S_LVL_IDX(iova, lvl);
+			tblp = ptep - ARM_V7S_LVL_IDX(iova, lvl, cfg);
 			if (WARN_ON(__arm_v7s_unmap(data, NULL, iova + i * sz,
 						    sz, lvl, tblp) != sz))
 				return -EINVAL;
@@ -480,7 +480,7 @@ static int __arm_v7s_map(struct arm_v7s_io_pgtable *data, unsigned long iova,
 	int num_entries = size >> ARM_V7S_LVL_SHIFT(lvl);
 
 	/* Find our entry at the current level */
-	ptep += ARM_V7S_LVL_IDX(iova, lvl);
+	ptep += ARM_V7S_LVL_IDX(iova, lvl, cfg);
 
 	/* If we can install a leaf entry at this level, then do so */
 	if (num_entries)
@@ -553,7 +553,7 @@ static void arm_v7s_free_pgtable(struct io_pgtable *iop)
 	struct arm_v7s_io_pgtable *data = io_pgtable_to_data(iop);
 	int i;
 
-	for (i = 0; i < ARM_V7S_PTES_PER_LVL(1); i++) {
+	for (i = 0; i < ARM_V7S_PTES_PER_LVL(1, &data->iop.cfg); i++) {
 		arm_v7s_iopte pte = data->pgd[i];
 
 		if (ARM_V7S_PTE_IS_TABLE(pte, 1))
@@ -605,9 +605,9 @@ static size_t arm_v7s_split_blk_unmap(struct arm_v7s_io_pgtable *data,
 	if (!tablep)
 		return 0; /* Bytes unmapped */
 
-	num_ptes = ARM_V7S_PTES_PER_LVL(2);
+	num_ptes = ARM_V7S_PTES_PER_LVL(2, cfg);
 	num_entries = size >> ARM_V7S_LVL_SHIFT(2);
-	unmap_idx = ARM_V7S_LVL_IDX(iova, 2);
+	unmap_idx = ARM_V7S_LVL_IDX(iova, 2, cfg);
 
 	pte = arm_v7s_prot_to_pte(arm_v7s_pte_to_prot(blk_pte, 1), 2, cfg);
 	if (num_entries > 1)
@@ -649,7 +649,7 @@ static size_t __arm_v7s_unmap(struct arm_v7s_io_pgtable *data,
 	if (WARN_ON(lvl > 2))
 		return 0;
 
-	idx = ARM_V7S_LVL_IDX(iova, lvl);
+	idx = ARM_V7S_LVL_IDX(iova, lvl, &iop->cfg);
 	ptep += idx;
 	do {
 		pte[i] = READ_ONCE(ptep[i]);
@@ -735,7 +735,7 @@ static phys_addr_t arm_v7s_iova_to_phys(struct io_pgtable_ops *ops,
 	u32 mask;
 
 	do {
-		ptep += ARM_V7S_LVL_IDX(iova, ++lvl);
+		ptep += ARM_V7S_LVL_IDX(iova, ++lvl, &data->iop.cfg);
 		pte = READ_ONCE(*ptep);
 		ptep = iopte_deref(pte, lvl, data);
 	} while (ARM_V7S_PTE_IS_TABLE(pte, lvl));
@@ -778,8 +778,8 @@ static struct io_pgtable *arm_v7s_alloc_pgtable(struct io_pgtable_cfg *cfg,
 
 	spin_lock_init(&data->split_lock);
 	data->l2_tables = kmem_cache_create("io-pgtable_armv7s_l2",
-					    ARM_V7S_TABLE_SIZE(2),
-					    ARM_V7S_TABLE_SIZE(2),
+					    ARM_V7S_TABLE_SIZE(2, cfg),
+					    ARM_V7S_TABLE_SIZE(2, cfg),
 					    ARM_V7S_TABLE_SLAB_FLAGS, NULL);
 	if (!data->l2_tables)
 		goto out_free_data;
-- 
2.18.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
