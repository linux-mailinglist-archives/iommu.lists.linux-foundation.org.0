Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id E16333546FF
	for <lists.iommu@lfdr.de>; Mon,  5 Apr 2021 21:11:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 88AAF404EA;
	Mon,  5 Apr 2021 19:11:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wU2QDABELOqg; Mon,  5 Apr 2021 19:11:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 80945404EC;
	Mon,  5 Apr 2021 19:11:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DFB1DC0017;
	Mon,  5 Apr 2021 19:11:37 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 38902C000A
 for <iommu@lists.linux-foundation.org>; Mon,  5 Apr 2021 19:11:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with UTF8SMTP id 2492041C74
 for <iommu@lists.linux-foundation.org>; Mon,  5 Apr 2021 19:11:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with UTF8SMTP id qiTJi5Gueu2K for <iommu@lists.linux-foundation.org>;
 Mon,  5 Apr 2021 19:11:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by smtp4.osuosl.org (Postfix) with UTF8SMTPS id 0CDA741C6C
 for <iommu@lists.linux-foundation.org>; Mon,  5 Apr 2021 19:11:34 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1617649895; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=CtMalWWx328jDMjAYKW11wQUObNLeokZwIQ/OKjTW20=;
 b=qILB+KIqLNYESYlrdq+hWTVmHI4iZeVCu7fBPgU53176kyPOKrP3sTHoUTGmIQuQKLBcUfjB
 O95ZAxYV2pNjlN4TeyBLuYniWGlRX4hDnzQF7a8xbr0Oe5B+AD8Bx/YxEiHb/36xgM7JDYHT
 g4WeIFNasSY7v5YN7UtrHMPGyuY=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI3NDkwMCIsICJpb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 606b60e5febcffa80f8457f8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 05 Apr 2021 19:11:33
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id B9C4FC43461; Mon,  5 Apr 2021 19:11:33 +0000 (UTC)
Received: from isaacm-linux.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: isaacm)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id DDD53C43466;
 Mon,  5 Apr 2021 19:11:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DDD53C43466
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=isaacm@codeaurora.org
From: "Isaac J. Manjarres" <isaacm@codeaurora.org>
To: iommu@lists.linux-foundation.org,
	linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH v3 07/12] iommu: Hook up '->unmap_pages' driver callback
Date: Mon,  5 Apr 2021 12:11:07 -0700
Message-Id: <20210405191112.28192-8-isaacm@codeaurora.org>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210405191112.28192-1-isaacm@codeaurora.org>
References: <20210405191112.28192-1-isaacm@codeaurora.org>
MIME-Version: 1.0
Cc: "Isaac J . Manjarres" <isaacm@codeaurora.org>, robin.murphy@arm.com,
 Will Deacon <will@kernel.org>, pratikp@codeaurora.org
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

From: Will Deacon <will@kernel.org>

Extend iommu_pgsize() to populate an optional 'count' paramater so that
we can direct unmapping operation to the ->unmap_pages callback if it
has been provided by the driver.

Signed-off-by: Will Deacon <will@kernel.org>
Signed-off-by: Isaac J. Manjarres <isaacm@codeaurora.org>
---
 drivers/iommu/iommu.c | 60 ++++++++++++++++++++++++++++++++++++-------
 1 file changed, 51 insertions(+), 9 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index a3bbf7e310b0..b3aa9548a38e 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2358,11 +2358,11 @@ phys_addr_t iommu_iova_to_phys(struct iommu_domain *domain, dma_addr_t iova)
 EXPORT_SYMBOL_GPL(iommu_iova_to_phys);
 
 static size_t iommu_pgsize(struct iommu_domain *domain, unsigned long iova,
-			   phys_addr_t paddr, size_t size)
+			   phys_addr_t paddr, size_t size, size_t *count)
 {
-	unsigned int pgsize_idx;
+	unsigned int pgsize_idx, pgsize_idx_next;
 	unsigned long pgsizes;
-	size_t pgsize;
+	size_t offset, pgsize, pgsize_next;
 	phys_addr_t addr_merge = paddr | iova;
 
 	/* Page sizes supported by the hardware and small enough for @size */
@@ -2378,7 +2378,37 @@ static size_t iommu_pgsize(struct iommu_domain *domain, unsigned long iova,
 	/* Pick the biggest page size remaining */
 	pgsize_idx = __fls(pgsizes);
 	pgsize = BIT_ULL(pgsize_idx);
+	if (!count)
+		return pgsize;
 
+
+	/* Find the next biggest support page size, if it exists */
+	pgsizes = domain->pgsize_bitmap & ~GENMASK(pgsize_idx, 0);
+	if (!pgsizes)
+		goto out_set_count;
+
+	pgsize_idx_next = __ffs(pgsizes);
+	pgsize_next = BIT(pgsize_idx_next);
+
+	/*
+	 * There's no point trying a bigger page size unless the virtual
+	 * and physical addresses are similarly offset within the larger page.
+	 */
+	if ((iova ^ paddr) & (pgsize_next - 1))
+		goto out_set_count;
+
+	/* Calculate the offset to the next page size alignment boundary */
+	offset = pgsize_next - (addr_merge & (pgsize_next - 1));
+
+	/*
+	 * If size is big enough to accomodate the larger page, reduce
+	 * the number of smaller pages.
+	 */
+	if (offset + pgsize_next <= size)
+		size = offset;
+
+out_set_count:
+	*count = size >> pgsize_idx;
 	return pgsize;
 }
 
@@ -2416,7 +2446,7 @@ static int __iommu_map(struct iommu_domain *domain, unsigned long iova,
 	pr_debug("map: iova 0x%lx pa %pa size 0x%zx\n", iova, &paddr, size);
 
 	while (size) {
-		size_t pgsize = iommu_pgsize(domain, iova, paddr, size);
+		size_t pgsize = iommu_pgsize(domain, iova, paddr, size, NULL);
 
 		pr_debug("mapping: iova 0x%lx pa %pa pgsize 0x%zx\n",
 			 iova, &paddr, pgsize);
@@ -2467,6 +2497,19 @@ int iommu_map_atomic(struct iommu_domain *domain, unsigned long iova,
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
@@ -2476,7 +2519,7 @@ static size_t __iommu_unmap(struct iommu_domain *domain,
 	unsigned long orig_iova = iova;
 	unsigned int min_pagesz;
 
-	if (unlikely(ops->unmap == NULL ||
+	if (unlikely(!(ops->unmap || ops->unmap_pages) ||
 		     domain->pgsize_bitmap == 0UL))
 		return 0;
 
@@ -2504,10 +2547,9 @@ static size_t __iommu_unmap(struct iommu_domain *domain,
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
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
