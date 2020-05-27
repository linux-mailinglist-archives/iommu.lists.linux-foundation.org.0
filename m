Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0051E407D
	for <lists.iommu@lfdr.de>; Wed, 27 May 2020 13:53:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 73D9A88767;
	Wed, 27 May 2020 11:53:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DDWTw7skrmno; Wed, 27 May 2020 11:53:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id BE12888770;
	Wed, 27 May 2020 11:53:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 97BD1C088D;
	Wed, 27 May 2020 11:53:30 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 42E5BC016F
 for <iommu@lists.linux-foundation.org>; Wed, 27 May 2020 11:53:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 2BF4286D15
 for <iommu@lists.linux-foundation.org>; Wed, 27 May 2020 11:53:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5ssopwNGQDcy for <iommu@lists.linux-foundation.org>;
 Wed, 27 May 2020 11:53:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 964EB86D04
 for <iommu@lists.linux-foundation.org>; Wed, 27 May 2020 11:53:27 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id A2F9E3D0; Wed, 27 May 2020 13:53:23 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH 03/10] iommu/amd: Let free_pagetable() not rely on
 domain->pt_root
Date: Wed, 27 May 2020 13:53:06 +0200
Message-Id: <20200527115313.7426-4-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200527115313.7426-1-joro@8bytes.org>
References: <20200527115313.7426-1-joro@8bytes.org>
Cc: iommu@lists.linux-foundation.org, jroedel@suse.de,
 linux-kernel@vger.kernel.org
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

From: Joerg Roedel <jroedel@suse.de>

Use 'struct domain_pgtable' instead to free_pagetable(). This solves
the problem that amd_iommu_domain_direct_map() needs to restore
domain->pt_root after the device table has been updated just to make
free_pagetable release the domain page-table.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 drivers/iommu/amd/iommu.c | 36 ++++++++++++++++--------------------
 1 file changed, 16 insertions(+), 20 deletions(-)

diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
index 8368f6b9c17f..c7e47a7f0d45 100644
--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -1391,20 +1391,19 @@ static struct page *free_sub_pt(unsigned long root, int mode,
 	return freelist;
 }
 
-static void free_pagetable(struct protection_domain *domain)
+static void free_pagetable(struct domain_pgtable *pgtable)
 {
-	struct domain_pgtable pgtable;
 	struct page *freelist = NULL;
 	unsigned long root;
 
-	amd_iommu_domain_get_pgtable(domain, &pgtable);
-	atomic64_set(&domain->pt_root, 0);
+	if (pgtable->mode == PAGE_MODE_NONE)
+		return;
 
-	BUG_ON(pgtable.mode < PAGE_MODE_NONE ||
-	       pgtable.mode > PAGE_MODE_6_LEVEL);
+	BUG_ON(pgtable->mode < PAGE_MODE_NONE ||
+	       pgtable->mode > PAGE_MODE_6_LEVEL);
 
-	root = (unsigned long)pgtable.root;
-	freelist = free_sub_pt(root, pgtable.mode, freelist);
+	root = (unsigned long)pgtable->root;
+	freelist = free_sub_pt(root, pgtable->mode, freelist);
 
 	free_page_list(freelist);
 }
@@ -1823,12 +1822,16 @@ static void free_gcr3_table(struct protection_domain *domain)
  */
 static void dma_ops_domain_free(struct protection_domain *domain)
 {
+	struct domain_pgtable pgtable;
+
 	if (!domain)
 		return;
 
 	iommu_put_dma_cookie(&domain->domain);
 
-	free_pagetable(domain);
+	amd_iommu_domain_get_pgtable(domain, &pgtable);
+	atomic64_set(&domain->pt_root, 0);
+	free_pagetable(&pgtable);
 
 	if (domain->id)
 		domain_id_free(domain->id);
@@ -2496,9 +2499,8 @@ static void amd_iommu_domain_free(struct iommu_domain *dom)
 		break;
 	default:
 		amd_iommu_domain_get_pgtable(domain, &pgtable);
-
-		if (pgtable.mode != PAGE_MODE_NONE)
-			free_pagetable(domain);
+		atomic64_set(&domain->pt_root, 0);
+		free_pagetable(&pgtable);
 
 		if (domain->flags & PD_IOMMUV2_MASK)
 			free_gcr3_table(domain);
@@ -2796,7 +2798,6 @@ void amd_iommu_domain_direct_map(struct iommu_domain *dom)
 	struct protection_domain *domain = to_pdomain(dom);
 	struct domain_pgtable pgtable;
 	unsigned long flags;
-	u64 pt_root;
 
 	spin_lock_irqsave(&domain->lock, flags);
 
@@ -2804,18 +2805,13 @@ void amd_iommu_domain_direct_map(struct iommu_domain *dom)
 	amd_iommu_domain_get_pgtable(domain, &pgtable);
 
 	/* Update data structure */
-	pt_root = amd_iommu_domain_encode_pgtable(NULL, PAGE_MODE_NONE);
-	atomic64_set(&domain->pt_root, pt_root);
+	atomic64_set(&domain->pt_root, 0);
 
 	/* Make changes visible to IOMMUs */
 	update_domain(domain);
 
-	/* Restore old pgtable in domain->ptroot to free page-table */
-	pt_root = amd_iommu_domain_encode_pgtable(pgtable.root, pgtable.mode);
-	atomic64_set(&domain->pt_root, pt_root);
-
 	/* Page-table is not visible to IOMMU anymore, so free it */
-	free_pagetable(domain);
+	free_pagetable(&pgtable);
 
 	spin_unlock_irqrestore(&domain->lock, flags);
 }
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
