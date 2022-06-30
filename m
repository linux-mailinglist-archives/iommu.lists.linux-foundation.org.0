Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B7E561276
	for <lists.iommu@lfdr.de>; Thu, 30 Jun 2022 08:32:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5041241B99;
	Thu, 30 Jun 2022 06:32:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5041241B99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KNUp5appDQjD; Thu, 30 Jun 2022 06:32:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 5193041B3E;
	Thu, 30 Jun 2022 06:32:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5193041B3E
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2BF9AC0036;
	Thu, 30 Jun 2022 06:32:25 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F0107C0011
 for <iommu@lists.linux-foundation.org>; Thu, 30 Jun 2022 06:32:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BDC5E83F8F
 for <iommu@lists.linux-foundation.org>; Thu, 30 Jun 2022 06:32:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BDC5E83F8F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vHq9B2UAF3-1 for <iommu@lists.linux-foundation.org>;
 Thu, 30 Jun 2022 06:32:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B624683F6C
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B624683F6C
 for <iommu@lists.linux-foundation.org>; Thu, 30 Jun 2022 06:32:21 +0000 (UTC)
X-UUID: 5f4589e0671846519b5bfb62eae9cdcb-20220630
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.7, REQID:586acb0f-429a-43f2-880b-862604f9a34d, OB:0,
 LO
 B:10,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:100
X-CID-INFO: VERSION:1.1.7, REQID:586acb0f-429a-43f2-880b-862604f9a34d, OB:0,
 LOB:
 10,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,RULE:Spam_GS981B3D,AC
 TION:quarantine,TS:100
X-CID-META: VersionHash:87442a2, CLOUDID:22ea2a86-57f0-47ca-ba27-fe8c57fbf305,
 C
 OID:473c34e895f2,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,QS:nil,BEC:nil,COL:0
X-UUID: 5f4589e0671846519b5bfb62eae9cdcb-20220630
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <yf.wang@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1718522625; Thu, 30 Jun 2022 14:32:15 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 30 Jun 2022 14:32:14 +0800
Received: from mbjsdccf07.mediatek.inc (10.15.20.246) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Thu, 30 Jun 2022 14:32:13 +0800
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, "Joerg
 Roedel" <joro@8bytes.org>, Yong Wu <Yong.Wu@mediatek.com>, Miles Chen
 <miles.chen@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v11 1/2] iommu/io-pgtable-arm-v7s: Add a quirk to allow
 pgtable PA up to 35bit
Date: Thu, 30 Jun 2022 14:25:06 +0800
Message-ID: <20220630062508.23512-2-yf.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220630062508.23512-1-yf.wang@mediatek.com>
References: <20220630062508.23512-1-yf.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
Cc: "Isaac J. Manjarres" <isaacm@codeaurora.org>, wsd_upstream@mediatek.com,
 open list <linux-kernel@vger.kernel.org>, Libo Kang <Libo.Kang@mediatek.com>,
 Yunfei Wang <yf.wang@mediatek.com>, "open
 list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
 Ning Li <ning.li@mediatek.com>
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
From: "yf.wang--- via iommu" <iommu@lists.linux-foundation.org>
Reply-To: yf.wang@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

From: Yunfei Wang <yf.wang@mediatek.com>

Single memory zone feature will remove ZONE_DMA32 and ZONE_DMA and
cause pgtable PA size larger than 32bit.

Since Mediatek IOMMU hardware support at most 35bit PA in pgtable,
so add a quirk to allow the PA of pgtables support up to bit35.

Signed-off-by: Ning Li <ning.li@mediatek.com>
Signed-off-by: Yunfei Wang <yf.wang@mediatek.com>
---
 drivers/iommu/io-pgtable-arm-v7s.c | 75 ++++++++++++++++++++++--------
 include/linux/io-pgtable.h         | 15 ++++--
 2 files changed, 66 insertions(+), 24 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm-v7s.c b/drivers/iommu/io-pgtable-arm-v7s.c
index be066c1503d3..a4ed23f85d90 100644
--- a/drivers/iommu/io-pgtable-arm-v7s.c
+++ b/drivers/iommu/io-pgtable-arm-v7s.c
@@ -182,14 +182,8 @@ static bool arm_v7s_is_mtk_enabled(struct io_pgtable_cfg *cfg)
 		(cfg->quirks & IO_PGTABLE_QUIRK_ARM_MTK_EXT);
 }
 
-static arm_v7s_iopte paddr_to_iopte(phys_addr_t paddr, int lvl,
-				    struct io_pgtable_cfg *cfg)
+static arm_v7s_iopte to_mtk_iopte(phys_addr_t paddr, arm_v7s_iopte pte)
 {
-	arm_v7s_iopte pte = paddr & ARM_V7S_LVL_MASK(lvl);
-
-	if (!arm_v7s_is_mtk_enabled(cfg))
-		return pte;
-
 	if (paddr & BIT_ULL(32))
 		pte |= ARM_V7S_ATTR_MTK_PA_BIT32;
 	if (paddr & BIT_ULL(33))
@@ -199,6 +193,17 @@ static arm_v7s_iopte paddr_to_iopte(phys_addr_t paddr, int lvl,
 	return pte;
 }
 
+static arm_v7s_iopte paddr_to_iopte(phys_addr_t paddr, int lvl,
+				    struct io_pgtable_cfg *cfg)
+{
+	arm_v7s_iopte pte = paddr & ARM_V7S_LVL_MASK(lvl);
+
+	if (arm_v7s_is_mtk_enabled(cfg))
+		return to_mtk_iopte(paddr, pte);
+
+	return pte;
+}
+
 static phys_addr_t iopte_to_paddr(arm_v7s_iopte pte, int lvl,
 				  struct io_pgtable_cfg *cfg)
 {
@@ -240,10 +245,17 @@ static void *__arm_v7s_alloc_table(int lvl, gfp_t gfp,
 	dma_addr_t dma;
 	size_t size = ARM_V7S_TABLE_SIZE(lvl, cfg);
 	void *table = NULL;
+	gfp_t gfp_l1;
+
+	/*
+	 * ARM_MTK_TTBR_EXT extend the translation table base support larger
+	 * memory address.
+	 */
+	gfp_l1 = cfg->quirks & IO_PGTABLE_QUIRK_ARM_MTK_TTBR_EXT ?
+		 GFP_KERNEL : ARM_V7S_TABLE_GFP_DMA;
 
 	if (lvl == 1)
-		table = (void *)__get_free_pages(
-			__GFP_ZERO | ARM_V7S_TABLE_GFP_DMA, get_order(size));
+		table = (void *)__get_free_pages(gfp_l1 | __GFP_ZERO, get_order(size));
 	else if (lvl == 2)
 		table = kmem_cache_zalloc(data->l2_tables, gfp);
 
@@ -251,7 +263,8 @@ static void *__arm_v7s_alloc_table(int lvl, gfp_t gfp,
 		return NULL;
 
 	phys = virt_to_phys(table);
-	if (phys != (arm_v7s_iopte)phys) {
+	if (cfg->quirks & IO_PGTABLE_QUIRK_ARM_MTK_TTBR_EXT ?
+	    phys >= (1ULL << cfg->oas) : phys != (arm_v7s_iopte)phys) {
 		/* Doesn't fit in PTE */
 		dev_err(dev, "Page table does not fit in PTE: %pa", &phys);
 		goto out_free;
@@ -457,9 +470,14 @@ static arm_v7s_iopte arm_v7s_install_table(arm_v7s_iopte *table,
 					   arm_v7s_iopte curr,
 					   struct io_pgtable_cfg *cfg)
 {
+	phys_addr_t phys = virt_to_phys(table);
 	arm_v7s_iopte old, new;
 
-	new = virt_to_phys(table) | ARM_V7S_PTE_TYPE_TABLE;
+	new = phys | ARM_V7S_PTE_TYPE_TABLE;
+
+	if (cfg->quirks & IO_PGTABLE_QUIRK_ARM_MTK_TTBR_EXT)
+		new = to_mtk_iopte(phys, new);
+
 	if (cfg->quirks & IO_PGTABLE_QUIRK_ARM_NS)
 		new |= ARM_V7S_ATTR_NS_TABLE;
 
@@ -779,6 +797,8 @@ static struct io_pgtable *arm_v7s_alloc_pgtable(struct io_pgtable_cfg *cfg,
 						void *cookie)
 {
 	struct arm_v7s_io_pgtable *data;
+	slab_flags_t slab_flag;
+	phys_addr_t paddr;
 
 	if (cfg->ias > (arm_v7s_is_mtk_enabled(cfg) ? 34 : ARM_V7S_ADDR_BITS))
 		return NULL;
@@ -788,7 +808,8 @@ static struct io_pgtable *arm_v7s_alloc_pgtable(struct io_pgtable_cfg *cfg,
 
 	if (cfg->quirks & ~(IO_PGTABLE_QUIRK_ARM_NS |
 			    IO_PGTABLE_QUIRK_NO_PERMS |
-			    IO_PGTABLE_QUIRK_ARM_MTK_EXT))
+			    IO_PGTABLE_QUIRK_ARM_MTK_EXT |
+			    IO_PGTABLE_QUIRK_ARM_MTK_TTBR_EXT))
 		return NULL;
 
 	/* If ARM_MTK_4GB is enabled, the NO_PERMS is also expected. */
@@ -796,15 +817,27 @@ static struct io_pgtable *arm_v7s_alloc_pgtable(struct io_pgtable_cfg *cfg,
 	    !(cfg->quirks & IO_PGTABLE_QUIRK_NO_PERMS))
 			return NULL;
 
+	if ((cfg->quirks & IO_PGTABLE_QUIRK_ARM_MTK_TTBR_EXT) &&
+	    !arm_v7s_is_mtk_enabled(cfg))
+		return NULL;
+
 	data = kmalloc(sizeof(*data), GFP_KERNEL);
 	if (!data)
 		return NULL;
 
 	spin_lock_init(&data->split_lock);
+
+	/*
+	 * ARM_MTK_TTBR_EXT extend the translation table base support larger
+	 * memory address.
+	 */
+	slab_flag = cfg->quirks & IO_PGTABLE_QUIRK_ARM_MTK_TTBR_EXT ?
+		    0 : ARM_V7S_TABLE_SLAB_FLAGS;
+
 	data->l2_tables = kmem_cache_create("io-pgtable_armv7s_l2",
 					    ARM_V7S_TABLE_SIZE(2, cfg),
 					    ARM_V7S_TABLE_SIZE(2, cfg),
-					    ARM_V7S_TABLE_SLAB_FLAGS, NULL);
+					    slab_flag, NULL);
 	if (!data->l2_tables)
 		goto out_free_data;
 
@@ -850,12 +883,16 @@ static struct io_pgtable *arm_v7s_alloc_pgtable(struct io_pgtable_cfg *cfg,
 	wmb();
 
 	/* TTBR */
-	cfg->arm_v7s_cfg.ttbr = virt_to_phys(data->pgd) | ARM_V7S_TTBR_S |
-				(cfg->coherent_walk ? (ARM_V7S_TTBR_NOS |
-				 ARM_V7S_TTBR_IRGN_ATTR(ARM_V7S_RGN_WBWA) |
-				 ARM_V7S_TTBR_ORGN_ATTR(ARM_V7S_RGN_WBWA)) :
-				(ARM_V7S_TTBR_IRGN_ATTR(ARM_V7S_RGN_NC) |
-				 ARM_V7S_TTBR_ORGN_ATTR(ARM_V7S_RGN_NC)));
+	paddr = virt_to_phys(data->pgd);
+	if (arm_v7s_is_mtk_enabled(cfg))
+		cfg->arm_v7s_cfg.ttbr = (paddr & GENMASK(31, 7)) | upper_32_bits(paddr);
+	else
+		cfg->arm_v7s_cfg.ttbr = paddr | ARM_V7S_TTBR_S |
+					(cfg->coherent_walk ? (ARM_V7S_TTBR_NOS |
+					 ARM_V7S_TTBR_IRGN_ATTR(ARM_V7S_RGN_WBWA) |
+					 ARM_V7S_TTBR_ORGN_ATTR(ARM_V7S_RGN_WBWA)) :
+					(ARM_V7S_TTBR_IRGN_ATTR(ARM_V7S_RGN_NC) |
+					 ARM_V7S_TTBR_ORGN_ATTR(ARM_V7S_RGN_NC)));
 	return &data->iop;
 
 out_free_data:
diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
index 86af6f0a00a2..ca98aeadcc80 100644
--- a/include/linux/io-pgtable.h
+++ b/include/linux/io-pgtable.h
@@ -74,17 +74,22 @@ struct io_pgtable_cfg {
 	 *	to support up to 35 bits PA where the bit32, bit33 and bit34 are
 	 *	encoded in the bit9, bit4 and bit5 of the PTE respectively.
 	 *
+	 * IO_PGTABLE_QUIRK_ARM_MTK_TTBR_EXT: (ARM v7s format) MediaTek IOMMUs
+	 *	extend the translation table base support up to 35 bits PA, the
+	 *	encoding format is same with IO_PGTABLE_QUIRK_ARM_MTK_EXT.
+	 *
 	 * IO_PGTABLE_QUIRK_ARM_TTBR1: (ARM LPAE format) Configure the table
 	 *	for use in the upper half of a split address space.
 	 *
 	 * IO_PGTABLE_QUIRK_ARM_OUTER_WBWA: Override the outer-cacheability
 	 *	attributes set in the TCR for a non-coherent page-table walker.
 	 */
-	#define IO_PGTABLE_QUIRK_ARM_NS		BIT(0)
-	#define IO_PGTABLE_QUIRK_NO_PERMS	BIT(1)
-	#define IO_PGTABLE_QUIRK_ARM_MTK_EXT	BIT(3)
-	#define IO_PGTABLE_QUIRK_ARM_TTBR1	BIT(5)
-	#define IO_PGTABLE_QUIRK_ARM_OUTER_WBWA	BIT(6)
+	#define IO_PGTABLE_QUIRK_ARM_NS			BIT(0)
+	#define IO_PGTABLE_QUIRK_NO_PERMS		BIT(1)
+	#define IO_PGTABLE_QUIRK_ARM_MTK_EXT		BIT(3)
+	#define IO_PGTABLE_QUIRK_ARM_MTK_TTBR_EXT	BIT(4)
+	#define IO_PGTABLE_QUIRK_ARM_TTBR1		BIT(5)
+	#define IO_PGTABLE_QUIRK_ARM_OUTER_WBWA		BIT(6)
 	unsigned long			quirks;
 	unsigned long			pgsize_bitmap;
 	unsigned int			ias;
-- 
2.18.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
