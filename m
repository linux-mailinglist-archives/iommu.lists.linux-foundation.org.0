Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 542A4478FD3
	for <lists.iommu@lfdr.de>; Fri, 17 Dec 2021 16:31:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB71041F61;
	Fri, 17 Dec 2021 15:31:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xtTnybwfZifJ; Fri, 17 Dec 2021 15:31:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 00A9641F59;
	Fri, 17 Dec 2021 15:31:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CB882C0038;
	Fri, 17 Dec 2021 15:31:23 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6648FC006E
 for <iommu@lists.linux-foundation.org>; Fri, 17 Dec 2021 15:31:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5111741F43
 for <iommu@lists.linux-foundation.org>; Fri, 17 Dec 2021 15:31:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xIeYyf4TeCeM for <iommu@lists.linux-foundation.org>;
 Fri, 17 Dec 2021 15:31:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8DCB041F4A
 for <iommu@lists.linux-foundation.org>; Fri, 17 Dec 2021 15:31:20 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0FEDC153B;
 Fri, 17 Dec 2021 07:31:20 -0800 (PST)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com
 [10.1.196.40])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B52083F774;
 Fri, 17 Dec 2021 07:31:18 -0800 (PST)
From: Robin Murphy <robin.murphy@arm.com>
To: joro@8bytes.org,
	will@kernel.org
Subject: [PATCH v3 5/9] iommu/amd: Use put_pages_list
Date: Fri, 17 Dec 2021 15:30:59 +0000
Message-Id: <73af128f651aaa1f38f69e586c66765a88ad2de0.1639753638.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.28.0.dirty
In-Reply-To: <cover.1639753638.git.robin.murphy@arm.com>
References: <cover.1639753638.git.robin.murphy@arm.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, willy@infradead.org, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org, hch@lst.de
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

From: "Matthew Wilcox (Oracle)" <willy@infradead.org>

page->freelist is for the use of slab.  We already have the ability
to free a list of pages in the core mm, but it requires the use of a
list_head and for the pages to be chained together through page->lru.
Switch the AMD IOMMU code over to using free_pages_list().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
[rm: split from original patch, cosmetic tweaks]
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/amd/io_pgtable.c | 50 ++++++++++++----------------------
 1 file changed, 18 insertions(+), 32 deletions(-)

diff --git a/drivers/iommu/amd/io_pgtable.c b/drivers/iommu/amd/io_pgtable.c
index 4165e1372b6e..b1bf4125b0f7 100644
--- a/drivers/iommu/amd/io_pgtable.c
+++ b/drivers/iommu/amd/io_pgtable.c
@@ -74,26 +74,14 @@ static u64 *first_pte_l7(u64 *pte, unsigned long *page_size,
  *
  ****************************************************************************/
 
-static void free_page_list(struct page *freelist)
-{
-	while (freelist != NULL) {
-		unsigned long p = (unsigned long)page_address(freelist);
-
-		freelist = freelist->freelist;
-		free_page(p);
-	}
-}
-
-static struct page *free_pt_page(u64 *pt, struct page *freelist)
+static void free_pt_page(u64 *pt, struct list_head *freelist)
 {
 	struct page *p = virt_to_page(pt);
 
-	p->freelist = freelist;
-
-	return p;
+	list_add_tail(&p->lru, freelist);
 }
 
-static struct page *free_pt_lvl(u64 *pt, struct page *freelist, int lvl)
+static void free_pt_lvl(u64 *pt, struct list_head *freelist, int lvl)
 {
 	u64 *p;
 	int i;
@@ -114,22 +102,22 @@ static struct page *free_pt_lvl(u64 *pt, struct page *freelist, int lvl)
 		 */
 		p = IOMMU_PTE_PAGE(pt[i]);
 		if (lvl > 2)
-			freelist = free_pt_lvl(p, freelist, lvl - 1);
+			free_pt_lvl(p, freelist, lvl - 1);
 		else
-			freelist = free_pt_page(p, freelist);
+			free_pt_page(p, freelist);
 	}
 
-	return free_pt_page(pt, freelist);
+	free_pt_page(pt, freelist);
 }
 
-static struct page *free_sub_pt(u64 *root, int mode, struct page *freelist)
+static void free_sub_pt(u64 *root, int mode, struct list_head *freelist)
 {
 	switch (mode) {
 	case PAGE_MODE_NONE:
 	case PAGE_MODE_7_LEVEL:
 		break;
 	case PAGE_MODE_1_LEVEL:
-		freelist = free_pt_page(root, freelist);
+		free_pt_page(root, freelist);
 		break;
 	case PAGE_MODE_2_LEVEL:
 	case PAGE_MODE_3_LEVEL:
@@ -141,8 +129,6 @@ static struct page *free_sub_pt(u64 *root, int mode, struct page *freelist)
 	default:
 		BUG();
 	}
-
-	return freelist;
 }
 
 void amd_iommu_domain_set_pgtable(struct protection_domain *domain,
@@ -350,7 +336,7 @@ static u64 *fetch_pte(struct amd_io_pgtable *pgtable,
 	return pte;
 }
 
-static struct page *free_clear_pte(u64 *pte, u64 pteval, struct page *freelist)
+static void free_clear_pte(u64 *pte, u64 pteval, struct list_head *freelist)
 {
 	u64 *pt;
 	int mode;
@@ -361,12 +347,12 @@ static struct page *free_clear_pte(u64 *pte, u64 pteval, struct page *freelist)
 	}
 
 	if (!IOMMU_PTE_PRESENT(pteval))
-		return freelist;
+		return;
 
 	pt   = IOMMU_PTE_PAGE(pteval);
 	mode = IOMMU_PTE_MODE(pteval);
 
-	return free_sub_pt(pt, mode, freelist);
+	free_sub_pt(pt, mode, freelist);
 }
 
 /*
@@ -380,7 +366,7 @@ static int iommu_v1_map_page(struct io_pgtable_ops *ops, unsigned long iova,
 			  phys_addr_t paddr, size_t size, int prot, gfp_t gfp)
 {
 	struct protection_domain *dom = io_pgtable_ops_to_domain(ops);
-	struct page *freelist = NULL;
+	LIST_HEAD(freelist);
 	bool updated = false;
 	u64 __pte, *pte;
 	int ret, i, count;
@@ -400,9 +386,9 @@ static int iommu_v1_map_page(struct io_pgtable_ops *ops, unsigned long iova,
 		goto out;
 
 	for (i = 0; i < count; ++i)
-		freelist = free_clear_pte(&pte[i], pte[i], freelist);
+		free_clear_pte(&pte[i], pte[i], &freelist);
 
-	if (freelist != NULL)
+	if (!list_empty(&freelist))
 		updated = true;
 
 	if (count > 1) {
@@ -437,7 +423,7 @@ static int iommu_v1_map_page(struct io_pgtable_ops *ops, unsigned long iova,
 	}
 
 	/* Everything flushed out, free pages now */
-	free_page_list(freelist);
+	put_pages_list(&freelist);
 
 	return ret;
 }
@@ -499,7 +485,7 @@ static void v1_free_pgtable(struct io_pgtable *iop)
 {
 	struct amd_io_pgtable *pgtable = container_of(iop, struct amd_io_pgtable, iop);
 	struct protection_domain *dom;
-	struct page *freelist = NULL;
+	LIST_HEAD(freelist);
 
 	if (pgtable->mode == PAGE_MODE_NONE)
 		return;
@@ -516,9 +502,9 @@ static void v1_free_pgtable(struct io_pgtable *iop)
 	BUG_ON(pgtable->mode < PAGE_MODE_NONE ||
 	       pgtable->mode > PAGE_MODE_6_LEVEL);
 
-	freelist = free_sub_pt(pgtable->root, pgtable->mode, freelist);
+	free_sub_pt(pgtable->root, pgtable->mode, &freelist);
 
-	free_page_list(freelist);
+	put_pages_list(&freelist);
 }
 
 static struct io_pgtable *v1_alloc_pgtable(struct io_pgtable_cfg *cfg, void *cookie)
-- 
2.28.0.dirty

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
