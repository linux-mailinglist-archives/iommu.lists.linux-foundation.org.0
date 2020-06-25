Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id E462520A143
	for <lists.iommu@lfdr.de>; Thu, 25 Jun 2020 16:52:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6E8FF87D46;
	Thu, 25 Jun 2020 14:52:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MW6RbLavgy+1; Thu, 25 Jun 2020 14:52:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9D216875CD;
	Thu, 25 Jun 2020 14:52:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 92E7FC016F;
	Thu, 25 Jun 2020 14:52:36 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3E896C016F
 for <iommu@lists.linux-foundation.org>; Thu, 25 Jun 2020 14:52:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 2CAEC203B2
 for <iommu@lists.linux-foundation.org>; Thu, 25 Jun 2020 14:52:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cx5PovsDiyaK for <iommu@lists.linux-foundation.org>;
 Thu, 25 Jun 2020 14:52:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by silver.osuosl.org (Postfix) with ESMTPS id 255B0203C4
 for <iommu@lists.linux-foundation.org>; Thu, 25 Jun 2020 14:52:31 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 8FFB550C; Thu, 25 Jun 2020 16:52:28 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH 2/2] iommu/amd: Use 'unsigned long' for domain->pt_root
Date: Thu, 25 Jun 2020 16:52:27 +0200
Message-Id: <20200625145227.4159-3-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200625145227.4159-1-joro@8bytes.org>
References: <20200625145227.4159-1-joro@8bytes.org>
Cc: iommu@lists.linux-foundation.org, Joerg Roedel <jroedel@suse.de>,
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

Using atomic64_t can be quite expensive, so use unsigned long instead.
This is safe because the write becomes visible atomically.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 drivers/iommu/amd/amd_iommu_types.h |  2 +-
 drivers/iommu/amd/iommu.c           | 10 ++++++++--
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/amd/amd_iommu_types.h b/drivers/iommu/amd/amd_iommu_types.h
index 30a5d412255a..f6f102282dda 100644
--- a/drivers/iommu/amd/amd_iommu_types.h
+++ b/drivers/iommu/amd/amd_iommu_types.h
@@ -468,7 +468,7 @@ struct protection_domain {
 				       iommu core code */
 	spinlock_t lock;	/* mostly used to lock the page table*/
 	u16 id;			/* the domain id written to the device table */
-	atomic64_t pt_root;	/* pgtable root and pgtable mode */
+	unsigned long pt_root;	/* pgtable root and pgtable mode */
 	int glx;		/* Number of levels for GCR3 table */
 	u64 *gcr3_tbl;		/* Guest CR3 table */
 	unsigned long flags;	/* flags to find out type of domain */
diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
index 5286ddcfc2f9..b0e1dc58244e 100644
--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -156,7 +156,7 @@ static struct protection_domain *to_pdomain(struct iommu_domain *dom)
 static void amd_iommu_domain_get_pgtable(struct protection_domain *domain,
 					 struct domain_pgtable *pgtable)
 {
-	u64 pt_root = atomic64_read(&domain->pt_root);
+	unsigned long pt_root = domain->pt_root;
 
 	pgtable->root = (u64 *)(pt_root & PAGE_MASK);
 	pgtable->mode = pt_root & 7; /* lowest 3 bits encode pgtable mode */
@@ -164,7 +164,13 @@ static void amd_iommu_domain_get_pgtable(struct protection_domain *domain,
 
 static void amd_iommu_domain_set_pt_root(struct protection_domain *domain, u64 root)
 {
-	atomic64_set(&domain->pt_root, root);
+	domain->pt_root = root;
+
+	/*
+	 * The new value needs to be gobally visible in case pt_root gets
+	 * cleared, so that the page-table can be safely freed.
+	 */
+	smp_wmb();
 }
 
 static void amd_iommu_domain_clr_pt_root(struct protection_domain *domain)
-- 
2.27.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
