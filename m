Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A9388966
	for <lists.iommu@lfdr.de>; Sat, 10 Aug 2019 09:59:53 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id BE555AB5;
	Sat, 10 Aug 2019 07:59:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id F040C9CA
	for <iommu@lists.linux-foundation.org>;
	Sat, 10 Aug 2019 07:59:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 1D3A66D6
	for <iommu@lists.linux-foundation.org>;
	Sat, 10 Aug 2019 07:59:46 +0000 (UTC)
X-UUID: 440542d5cb224042ad9621808b32ecc3-20190810
X-UUID: 440542d5cb224042ad9621808b32ecc3-20190810
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(Cellopoint E-mail Firewall v4.1.10 Build 0707 with TLS)
	with ESMTP id 45549525; Sat, 10 Aug 2019 15:59:42 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
	mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server
	(TLS) id 15.0.1395.4; Sat, 10 Aug 2019 15:59:42 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
	(172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
	Transport; Sat, 10 Aug 2019 15:59:41 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>
Subject: [PATCH v9 05/21] iommu/io-pgtable-arm-v7s: Add paddr_to_iopte and
	iopte_to_paddr helpers
Date: Sat, 10 Aug 2019 15:58:05 +0800
Message-ID: <1565423901-17008-6-git-send-email-yong.wu@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1565423901-17008-1-git-send-email-yong.wu@mediatek.com>
References: <1565423901-17008-1-git-send-email-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,UNPARSEABLE_RELAY
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
	Nicolas Boichat <drinkcat@chromium.org>, cui.zhang@mediatek.com,
	srv_heupstream@mediatek.com, chao.hao@mediatek.com,
	linux-kernel@vger.kernel.org, Evan Green <evgreen@chromium.org>,
	Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
	Rob Herring <robh+dt@kernel.org>,
	linux-mediatek@lists.infradead.org, ming-fan.chen@mediatek.com,
	anan.sun@mediatek.com, Matthias Kaehlcke <mka@chromium.org>,
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

Add two helper functions: paddr_to_iopte and iopte_to_paddr.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
Reviewed-by: Robin Murphy <robin.murphy@arm.com>
Reviewed-by: Evan Green <evgreen@chromium.org>
---
 drivers/iommu/io-pgtable-arm-v7s.c | 45 ++++++++++++++++++++++++++++----------
 1 file changed, 33 insertions(+), 12 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm-v7s.c b/drivers/iommu/io-pgtable-arm-v7s.c
index 0fc8dfa..72f1880 100644
--- a/drivers/iommu/io-pgtable-arm-v7s.c
+++ b/drivers/iommu/io-pgtable-arm-v7s.c
@@ -169,18 +169,38 @@ struct arm_v7s_io_pgtable {
 	spinlock_t		split_lock;
 };
 
+static bool arm_v7s_pte_is_cont(arm_v7s_iopte pte, int lvl);
+
 static dma_addr_t __arm_v7s_dma_addr(void *pages)
 {
 	return (dma_addr_t)virt_to_phys(pages);
 }
 
-static arm_v7s_iopte *iopte_deref(arm_v7s_iopte pte, int lvl)
+static arm_v7s_iopte paddr_to_iopte(phys_addr_t paddr, int lvl,
+				    struct io_pgtable_cfg *cfg)
 {
+	return paddr & ARM_V7S_LVL_MASK(lvl);
+}
+
+static phys_addr_t iopte_to_paddr(arm_v7s_iopte pte, int lvl,
+				  struct io_pgtable_cfg *cfg)
+{
+	arm_v7s_iopte mask;
+
 	if (ARM_V7S_PTE_IS_TABLE(pte, lvl))
-		pte &= ARM_V7S_TABLE_MASK;
+		mask = ARM_V7S_TABLE_MASK;
+	else if (arm_v7s_pte_is_cont(pte, lvl))
+		mask = ARM_V7S_LVL_MASK(lvl) * ARM_V7S_CONT_PAGES;
 	else
-		pte &= ARM_V7S_LVL_MASK(lvl);
-	return phys_to_virt(pte);
+		mask = ARM_V7S_LVL_MASK(lvl);
+
+	return pte & mask;
+}
+
+static arm_v7s_iopte *iopte_deref(arm_v7s_iopte pte, int lvl,
+				  struct arm_v7s_io_pgtable *data)
+{
+	return phys_to_virt(iopte_to_paddr(pte, lvl, &data->iop.cfg));
 }
 
 static void *__arm_v7s_alloc_table(int lvl, gfp_t gfp,
@@ -396,7 +416,7 @@ static int arm_v7s_init_pte(struct arm_v7s_io_pgtable *data,
 	if (num_entries > 1)
 		pte = arm_v7s_pte_to_cont(pte, lvl);
 
-	pte |= paddr & ARM_V7S_LVL_MASK(lvl);
+	pte |= paddr_to_iopte(paddr, lvl, cfg);
 
 	__arm_v7s_set_pte(ptep, pte, num_entries, cfg);
 	return 0;
@@ -462,7 +482,7 @@ static int __arm_v7s_map(struct arm_v7s_io_pgtable *data, unsigned long iova,
 	}
 
 	if (ARM_V7S_PTE_IS_TABLE(pte, lvl)) {
-		cptep = iopte_deref(pte, lvl);
+		cptep = iopte_deref(pte, lvl, data);
 	} else if (pte) {
 		/* We require an unmap first */
 		WARN_ON(!selftest_running);
@@ -512,7 +532,8 @@ static void arm_v7s_free_pgtable(struct io_pgtable *iop)
 		arm_v7s_iopte pte = data->pgd[i];
 
 		if (ARM_V7S_PTE_IS_TABLE(pte, 1))
-			__arm_v7s_free_table(iopte_deref(pte, 1), 2, data);
+			__arm_v7s_free_table(iopte_deref(pte, 1, data),
+					     2, data);
 	}
 	__arm_v7s_free_table(data->pgd, 1, data);
 	kmem_cache_destroy(data->l2_tables);
@@ -582,7 +603,7 @@ static size_t arm_v7s_split_blk_unmap(struct arm_v7s_io_pgtable *data,
 		if (!ARM_V7S_PTE_IS_TABLE(pte, 1))
 			return 0;
 
-		tablep = iopte_deref(pte, 1);
+		tablep = iopte_deref(pte, 1, data);
 		return __arm_v7s_unmap(data, iova, size, 2, tablep);
 	}
 
@@ -641,7 +662,7 @@ static size_t __arm_v7s_unmap(struct arm_v7s_io_pgtable *data,
 				io_pgtable_tlb_add_flush(iop, iova, blk_size,
 					ARM_V7S_BLOCK_SIZE(lvl + 1), false);
 				io_pgtable_tlb_sync(iop);
-				ptep = iopte_deref(pte[i], lvl);
+				ptep = iopte_deref(pte[i], lvl, data);
 				__arm_v7s_free_table(ptep, lvl + 1, data);
 			} else if (iop->cfg.quirks & IO_PGTABLE_QUIRK_NON_STRICT) {
 				/*
@@ -666,7 +687,7 @@ static size_t __arm_v7s_unmap(struct arm_v7s_io_pgtable *data,
 	}
 
 	/* Keep on walkin' */
-	ptep = iopte_deref(pte[0], lvl);
+	ptep = iopte_deref(pte[0], lvl, data);
 	return __arm_v7s_unmap(data, iova, size, lvl + 1, ptep);
 }
 
@@ -692,7 +713,7 @@ static phys_addr_t arm_v7s_iova_to_phys(struct io_pgtable_ops *ops,
 	do {
 		ptep += ARM_V7S_LVL_IDX(iova, ++lvl);
 		pte = READ_ONCE(*ptep);
-		ptep = iopte_deref(pte, lvl);
+		ptep = iopte_deref(pte, lvl, data);
 	} while (ARM_V7S_PTE_IS_TABLE(pte, lvl));
 
 	if (!ARM_V7S_PTE_IS_VALID(pte))
@@ -701,7 +722,7 @@ static phys_addr_t arm_v7s_iova_to_phys(struct io_pgtable_ops *ops,
 	mask = ARM_V7S_LVL_MASK(lvl);
 	if (arm_v7s_pte_is_cont(pte, lvl))
 		mask *= ARM_V7S_CONT_PAGES;
-	return (pte & mask) | (iova & ~mask);
+	return iopte_to_paddr(pte, lvl, &data->iop.cfg) | (iova & ~mask);
 }
 
 static struct io_pgtable *arm_v7s_alloc_pgtable(struct io_pgtable_cfg *cfg,
-- 
1.9.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
