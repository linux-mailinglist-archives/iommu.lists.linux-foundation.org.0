Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB1E3516DE
	for <lists.iommu@lfdr.de>; Thu,  1 Apr 2021 18:48:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85DE160BDB;
	Thu,  1 Apr 2021 16:48:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id isaUjW0SHnCV; Thu,  1 Apr 2021 16:48:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9FC1560BE0;
	Thu,  1 Apr 2021 16:48:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8C9ADC000A;
	Thu,  1 Apr 2021 16:48:44 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3802AC000A
 for <iommu@lists.linux-foundation.org>; Thu,  1 Apr 2021 16:48:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2738960BDE
 for <iommu@lists.linux-foundation.org>; Thu,  1 Apr 2021 16:48:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0NyjjhvPK-DB for <iommu@lists.linux-foundation.org>;
 Thu,  1 Apr 2021 16:48:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4400E60BE3
 for <iommu@lists.linux-foundation.org>; Thu,  1 Apr 2021 16:48:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B05F961390;
 Thu,  1 Apr 2021 16:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617295721;
 bh=ixFflCA3kCijj1uJNIph6hG5Yjr6CXFdBFZADdeuL4c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HWnD6Wamspc9siukU7TVrJBt2v6ocZOyiorbLmeV44TQBx0DJ9wvkOP2F+MZwQgXP
 ukS2b6AR2BEqGVss/XPIWjC9jsIHeweXtxWi2E+423vyvItRyq3ILSrY2femLSLJ9H
 LWQ7SQnTOREQzL3GCFgb4VXtBcGPHp1zrvH1523V3kNSdRgDnwvQFELKKFEEALRIsh
 ZfGlgbfweLQGwEjVwdjm1+Cm3G9qYYUTSDM66r11VaX0fziBJ2qth7a8eml2AZ6OIN
 Iw9oIL0eDyGNUC+U5gexN885crYSDlYo9iRdctga7V0t5PddsDFhGE+YLoeqIf/ljL
 bWmVgaVRkoOGA==
From: Will Deacon <will@kernel.org>
To: iommu@lists.linux-foundation.org
Subject: [RFC PATCH 5/6] iommu: Hook up '->unmap_pages' driver callback
Date: Thu,  1 Apr 2021 17:47:37 +0100
Message-Id: <20210401164738.9513-6-will@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210401164738.9513-1-will@kernel.org>
References: <20210401164738.9513-1-will@kernel.org>
MIME-Version: 1.0
Cc: "Isaac J. Manjarres" <isaacm@codeaurora.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Pratik Patel <pratikp@codeaurora.org>,
 linux-arm-kernel@lists.infradead.org
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

Extend iommu_pgsize() to populate an optional 'count' paramater so that
we can direct unmapping operation to the ->unmap_pages callback if it
has been provided by the driver.

Signed-off-by: Will Deacon <will@kernel.org>
---
 drivers/iommu/iommu.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index ab689611a03b..fe186691fc21 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2358,7 +2358,7 @@ phys_addr_t iommu_iova_to_phys(struct iommu_domain *domain, dma_addr_t iova)
 EXPORT_SYMBOL_GPL(iommu_iova_to_phys);
 
 static size_t iommu_pgsize(struct iommu_domain *domain, unsigned long iova,
-			   phys_addr_t paddr, size_t size)
+			   phys_addr_t paddr, size_t size, size_t *count)
 {
 	unsigned int pgsize_idx;
 	unsigned long pgsizes;
@@ -2379,6 +2379,8 @@ static size_t iommu_pgsize(struct iommu_domain *domain, unsigned long iova,
 	pgsize_idx = __fls(pgsizes);
 	pgsize = BIT(pgsize_idx);
 
+	if (count)
+		*count = size >> pgsize_idx;
 	return pgsize;
 }
 
@@ -2416,7 +2418,7 @@ static int __iommu_map(struct iommu_domain *domain, unsigned long iova,
 	pr_debug("map: iova 0x%lx pa %pa size 0x%zx\n", iova, &paddr, size);
 
 	while (size) {
-		size_t pgsize = iommu_pgsize(domain, iova, paddr, size);
+		size_t pgsize = iommu_pgsize(domain, iova, paddr, size, NULL);
 
 		pr_debug("mapping: iova 0x%lx pa %pa pgsize 0x%zx\n",
 			 iova, &paddr, pgsize);
@@ -2467,6 +2469,19 @@ int iommu_map_atomic(struct iommu_domain *domain, unsigned long iova,
 }
 EXPORT_SYMBOL_GPL(iommu_map_atomic);
 
+static size_t __iommu_unmap_pages(struct iommu_domain *domain,
+				  unsigned long iova, size_t size,
+				  struct iommu_iotlb_gather *iotlb_gather)
+{
+	const struct iommu_ops *ops = domain->ops;
+	size_t pgsize, count;
+
+	pgsize = iommu_pgsize(domain, iova, iova, size, &count);
+	return ops->unmap_pages ?
+	       ops->unmap_pages(domain, iova, pgsize, count, iotlb_gather) :
+	       ops->unmap(domain, iova, pgsize, iotlb_gather);
+}
+
 static size_t __iommu_unmap(struct iommu_domain *domain,
 			    unsigned long iova, size_t size,
 			    struct iommu_iotlb_gather *iotlb_gather)
@@ -2504,10 +2519,9 @@ static size_t __iommu_unmap(struct iommu_domain *domain,
 	 * or we hit an area that isn't mapped.
 	 */
 	while (unmapped < size) {
-		size_t pgsize;
-
-		pgsize = iommu_pgsize(domain, iova, iova, size - unmapped);
-		unmapped_page = ops->unmap(domain, iova, pgsize, iotlb_gather);
+		unmapped_page = __iommu_unmap_pages(domain, iova,
+						    size - unmapped,
+						    iotlb_gather);
 		if (!unmapped_page)
 			break;
 
-- 
2.31.0.291.g576ba9dcdaf-goog

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
