Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DA6354707
	for <lists.iommu@lfdr.de>; Mon,  5 Apr 2021 21:12:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DB5EA404E1;
	Mon,  5 Apr 2021 19:12:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xc9BgjBqxfp5; Mon,  5 Apr 2021 19:12:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id B6EC24026D;
	Mon,  5 Apr 2021 19:12:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A2DC5C000A;
	Mon,  5 Apr 2021 19:12:01 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2186AC000A
 for <iommu@lists.linux-foundation.org>; Mon,  5 Apr 2021 19:12:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with UTF8SMTP id D065241C77
 for <iommu@lists.linux-foundation.org>; Mon,  5 Apr 2021 19:12:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with UTF8SMTP id D3KMNwc-uD6C for <iommu@lists.linux-foundation.org>;
 Mon,  5 Apr 2021 19:12:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by smtp4.osuosl.org (Postfix) with UTF8SMTPS id 0305041C6C
 for <iommu@lists.linux-foundation.org>; Mon,  5 Apr 2021 19:11:56 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1617649919; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=flEXrQIKl5sHIHV4cNFSwdOjgfWCaF0BeQREDOai46Q=;
 b=EVOmLEo+BFpJbEu7ogM8BV/v+4KJyLGtyc8gq8PH3B/J+d0y5id3AaqmCGpyhn9J7SeFLAps
 gAHpzhP9wR6vlj1/hmDDcuzXe94f07S7Xl6StoVDaRYWDHbcqBrFdrHJQ4vz5QumspDmn3/h
 7B/GsfT7ZznoF58xzlGe82yjodA=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI3NDkwMCIsICJpb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 606b60e88807bcde1dd9884d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 05 Apr 2021 19:11:36
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 99121C43465; Mon,  5 Apr 2021 19:11:36 +0000 (UTC)
Received: from isaacm-linux.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: isaacm)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 02FBAC43462;
 Mon,  5 Apr 2021 19:11:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 02FBAC43462
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=isaacm@codeaurora.org
From: "Isaac J. Manjarres" <isaacm@codeaurora.org>
To: iommu@lists.linux-foundation.org,
	linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH v3 09/12] iommu/io-pgtable-arm: Implement
 arm_lpae_unmap_pages()
Date: Mon,  5 Apr 2021 12:11:09 -0700
Message-Id: <20210405191112.28192-10-isaacm@codeaurora.org>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210405191112.28192-1-isaacm@codeaurora.org>
References: <20210405191112.28192-1-isaacm@codeaurora.org>
MIME-Version: 1.0
Cc: "Isaac J. Manjarres" <isaacm@codeaurora.org>, robin.murphy@arm.com,
 will@kernel.org, pratikp@codeaurora.org
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

Implement the unmap_pages() callback for the ARM LPAE io-pgtable
format.

Signed-off-by: Isaac J. Manjarres <isaacm@codeaurora.org>
Suggested-by: Will Deacon <will@kernel.org>
---
 drivers/iommu/io-pgtable-arm.c | 124 +++++++++++++++++++++++++++------
 1 file changed, 104 insertions(+), 20 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index 87def58e79b5..fc63d57b8037 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -60,6 +60,14 @@
 /* Calculate the block/page mapping size at level l for pagetable in d. */
 #define ARM_LPAE_BLOCK_SIZE(l,d)	(1ULL << ARM_LPAE_LVL_SHIFT(l,d))
 
+/*
+ * Calculate the level that corresponds to the block/page mapping for pagetable
+ * in d.
+ */
+#define ARM_LPAE_BLOCK_SIZE_LVL(s, d)					\
+	((ARM_LPAE_MAX_LEVELS -						\
+	  ((ilog2((s)) - ilog2(sizeof(arm_lpae_iopte))) / (d)->bits_per_level)))
+
 /* Page table bits */
 #define ARM_LPAE_PTE_TYPE_SHIFT		0
 #define ARM_LPAE_PTE_TYPE_MASK		0x3
@@ -248,10 +256,26 @@ static void __arm_lpae_set_pte(arm_lpae_iopte *ptep, arm_lpae_iopte pte,
 		__arm_lpae_sync_pte(ptep, cfg);
 }
 
+static void __arm_lpae_sync_ptes(arm_lpae_iopte *ptep, size_t num_ptes,
+				 struct io_pgtable_cfg *cfg)
+{
+	dma_sync_single_for_device(cfg->iommu_dev, __arm_lpae_dma_addr(ptep),
+				   sizeof(*ptep) * num_ptes, DMA_TO_DEVICE);
+}
+
+static void __arm_lpae_clear_ptes(arm_lpae_iopte *ptep, size_t num_ptes,
+				  struct io_pgtable_cfg *cfg)
+{
+	memset(ptep, 0, sizeof(*ptep) * num_ptes);
+
+	if (!cfg->coherent_walk)
+		__arm_lpae_sync_ptes(ptep, num_ptes, cfg);
+}
+
 static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
 			       struct iommu_iotlb_gather *gather,
-			       unsigned long iova, size_t size, int lvl,
-			       arm_lpae_iopte *ptep);
+			       unsigned long iova, size_t size, size_t pgcount,
+			       int lvl, arm_lpae_iopte *ptep);
 
 static void __arm_lpae_init_pte(struct arm_lpae_io_pgtable *data,
 				phys_addr_t paddr, arm_lpae_iopte prot,
@@ -289,7 +313,7 @@ static int arm_lpae_init_pte(struct arm_lpae_io_pgtable *data,
 		size_t sz = ARM_LPAE_BLOCK_SIZE(lvl, data);
 
 		tblp = ptep - ARM_LPAE_LVL_IDX(iova, lvl, data);
-		if (__arm_lpae_unmap(data, NULL, iova, sz, lvl, tblp) != sz) {
+		if (__arm_lpae_unmap(data, NULL, iova, sz, 1, lvl, tblp) != sz) {
 			WARN_ON(1);
 			return -EINVAL;
 		}
@@ -516,14 +540,14 @@ static size_t arm_lpae_split_blk_unmap(struct arm_lpae_io_pgtable *data,
 				       struct iommu_iotlb_gather *gather,
 				       unsigned long iova, size_t size,
 				       arm_lpae_iopte blk_pte, int lvl,
-				       arm_lpae_iopte *ptep)
+				       arm_lpae_iopte *ptep, size_t pgcount)
 {
 	struct io_pgtable_cfg *cfg = &data->iop.cfg;
 	arm_lpae_iopte pte, *tablep;
 	phys_addr_t blk_paddr;
 	size_t tablesz = ARM_LPAE_GRANULE(data);
 	size_t split_sz = ARM_LPAE_BLOCK_SIZE(lvl, data);
-	int i, unmap_idx = -1;
+	int i, unmap_idx_start = -1;
 
 	if (WARN_ON(lvl == ARM_LPAE_MAX_LEVELS))
 		return 0;
@@ -533,14 +557,14 @@ static size_t arm_lpae_split_blk_unmap(struct arm_lpae_io_pgtable *data,
 		return 0; /* Bytes unmapped */
 
 	if (size == split_sz)
-		unmap_idx = ARM_LPAE_LVL_IDX(iova, lvl, data);
+		unmap_idx_start = ARM_LPAE_LVL_IDX(iova, lvl, data);
 
 	blk_paddr = iopte_to_paddr(blk_pte, data);
 	pte = iopte_prot(blk_pte);
 
 	for (i = 0; i < tablesz / sizeof(pte); i++, blk_paddr += split_sz) {
 		/* Unmap! */
-		if (i == unmap_idx)
+		if (i >= unmap_idx_start && i < (unmap_idx_start + pgcount))
 			continue;
 
 		__arm_lpae_init_pte(data, blk_paddr, pte, lvl, &tablep[i]);
@@ -558,20 +582,24 @@ static size_t arm_lpae_split_blk_unmap(struct arm_lpae_io_pgtable *data,
 			return 0;
 
 		tablep = iopte_deref(pte, data);
-	} else if (unmap_idx >= 0) {
-		io_pgtable_tlb_add_page(&data->iop, gather, iova, size);
-		return size;
+	} else if (unmap_idx_start >= 0) {
+		for (i = 0; i < pgcount; i++) {
+			io_pgtable_tlb_add_page(&data->iop, gather, iova, size);
+			iova += size;
+		}
+		return pgcount * size;
 	}
 
-	return __arm_lpae_unmap(data, gather, iova, size, lvl, tablep);
+	return __arm_lpae_unmap(data, gather, iova, size, pgcount, lvl, tablep);
 }
 
 static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
 			       struct iommu_iotlb_gather *gather,
-			       unsigned long iova, size_t size, int lvl,
-			       arm_lpae_iopte *ptep)
+			       unsigned long iova, size_t size, size_t pgcount,
+			       int lvl, arm_lpae_iopte *ptep)
 {
 	arm_lpae_iopte pte;
+	size_t i;
 	struct io_pgtable *iop = &data->iop;
 
 	/* Something went horribly wrong and we ran out of page table */
@@ -585,11 +613,11 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
 
 	/* If the size matches this level, we're in the right place */
 	if (size == ARM_LPAE_BLOCK_SIZE(lvl, data)) {
-		__arm_lpae_set_pte(ptep, 0, &iop->cfg);
+		__arm_lpae_clear_ptes(ptep, pgcount, &iop->cfg);
 
 		if (!iopte_leaf(pte, lvl, iop->fmt)) {
 			/* Also flush any partial walks */
-			io_pgtable_tlb_flush_walk(iop, iova, size,
+			io_pgtable_tlb_flush_walk(iop, iova, pgcount * size,
 						  ARM_LPAE_GRANULE(data));
 			ptep = iopte_deref(pte, data);
 			__arm_lpae_free_pgtable(data, lvl + 1, ptep);
@@ -601,22 +629,25 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
 			 */
 			smp_wmb();
 		} else {
-			io_pgtable_tlb_add_page(iop, gather, iova, size);
+			for (i = 0; i < pgcount; i++) {
+				io_pgtable_tlb_add_page(iop, gather, iova, size);
+				iova += size;
+			}
 		}
 
-		return size;
+		return pgcount * size;
 	} else if (iopte_leaf(pte, lvl, iop->fmt)) {
 		/*
 		 * Insert a table at the next level to map the old region,
 		 * minus the part we want to unmap
 		 */
 		return arm_lpae_split_blk_unmap(data, gather, iova, size, pte,
-						lvl + 1, ptep);
+						lvl + 1, ptep, pgcount);
 	}
 
 	/* Keep on walkin' */
 	ptep = iopte_deref(pte, data);
-	return __arm_lpae_unmap(data, gather, iova, size, lvl + 1, ptep);
+	return __arm_lpae_unmap(data, gather, iova, size, pgcount, lvl + 1, ptep);
 }
 
 static size_t arm_lpae_unmap(struct io_pgtable_ops *ops, unsigned long iova,
@@ -635,7 +666,59 @@ static size_t arm_lpae_unmap(struct io_pgtable_ops *ops, unsigned long iova,
 	if (WARN_ON(iaext))
 		return 0;
 
-	return __arm_lpae_unmap(data, gather, iova, size, data->start_level, ptep);
+	return __arm_lpae_unmap(data, gather, iova, size, 1, data->start_level, ptep);
+}
+
+static size_t arm_lpae_unmap_pages(struct io_pgtable_ops *ops, unsigned long iova,
+				   size_t pgsize, size_t pgcount,
+				   struct iommu_iotlb_gather *gather)
+{
+	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
+	struct io_pgtable_cfg *cfg = &data->iop.cfg;
+	arm_lpae_iopte *ptep = data->pgd;
+	long iaext = (s64)iova >> cfg->ias;
+	size_t unmapped = 0, unmapped_page;
+	int last_lvl;
+	size_t table_size, pages, tbl_offset, max_entries;
+
+	if (WARN_ON(!pgsize || (pgsize & cfg->pgsize_bitmap) != pgsize || !pgcount))
+		return 0;
+
+	if (cfg->quirks & IO_PGTABLE_QUIRK_ARM_TTBR1)
+		iaext = ~iaext;
+	if (WARN_ON(iaext))
+		return 0;
+
+	/*
+	 * Calculating the page table size here helps avoid situations where
+	 * a page range that is being unmapped may be mapped at the same level
+	 * but not mapped by the same tables. Allowing such a scenario to
+	 * occur can complicate the logic in arm_lpae_split_blk_unmap().
+	 */
+	last_lvl = ARM_LPAE_BLOCK_SIZE_LVL(pgsize, data);
+
+	if (last_lvl == data->start_level)
+		table_size = ARM_LPAE_PGD_SIZE(data);
+	else
+		table_size = ARM_LPAE_GRANULE(data);
+
+	max_entries = table_size / sizeof(*ptep);
+
+	while (pgcount) {
+		tbl_offset = ARM_LPAE_LVL_IDX(iova, last_lvl, data);
+		pages = min_t(size_t, pgcount, max_entries - tbl_offset);
+		unmapped_page = __arm_lpae_unmap(data, gather, iova, pgsize,
+						 pages, data->start_level,
+						 ptep);
+		if (!unmapped_page)
+			break;
+
+		unmapped += unmapped_page;
+		iova += unmapped_page;
+		pgcount -= pages;
+	}
+
+	return unmapped;
 }
 
 static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
@@ -751,6 +834,7 @@ arm_lpae_alloc_pgtable(struct io_pgtable_cfg *cfg)
 	data->iop.ops = (struct io_pgtable_ops) {
 		.map		= arm_lpae_map,
 		.unmap		= arm_lpae_unmap,
+		.unmap_pages	= arm_lpae_unmap_pages,
 		.iova_to_phys	= arm_lpae_iova_to_phys,
 	};
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
