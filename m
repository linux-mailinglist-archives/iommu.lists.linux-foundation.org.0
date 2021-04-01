Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B413516DD
	for <lists.iommu@lfdr.de>; Thu,  1 Apr 2021 18:48:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1CCB4184E;
	Thu,  1 Apr 2021 16:48:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E6ujEOw9Iy_v; Thu,  1 Apr 2021 16:48:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7EBE941844;
	Thu,  1 Apr 2021 16:48:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5F91FC000A;
	Thu,  1 Apr 2021 16:48:42 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4D286C000E
 for <iommu@lists.linux-foundation.org>; Thu,  1 Apr 2021 16:48:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 300674017C
 for <iommu@lists.linux-foundation.org>; Thu,  1 Apr 2021 16:48:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dqa70MS7-jYs for <iommu@lists.linux-foundation.org>;
 Thu,  1 Apr 2021 16:48:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A75F740015
 for <iommu@lists.linux-foundation.org>; Thu,  1 Apr 2021 16:48:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 095EC61382;
 Thu,  1 Apr 2021 16:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617295719;
 bh=U+eQcrRlMdYPEEIk+UyCEfZu0TkCUUl69Fe662VNo/g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=L0l+kRwkYGUy1DE5enMdmDL48W0/3m0sxt9BJefph5sb0+BtyjsYU9e1nP8l8OgnE
 Cn7VggTIAiH7PLBBA15n8Rc7WsglI17WFqQfWCZvg8jjVwddHtw6LJrsU9/Ikv6mpo
 jkqclznt+kFIAtXGq+R34otxYYGcbZKucmx/1Ankg2XUIB9XCYtZfCZbT64g7emC+p
 pLZZqgHvcUSR8n5kFcTE9L+1QhnfU1r82rdBVvHV2LVMw9KIPAZqdg5/qINZACnR1G
 FiFzbs3V2naTnE/6nf7ftp8HjfXPBBpjDXsBhLJtjlTT9w6suSgReCBaMNN9GKw9VV
 S/WLl3oAwDtTQ==
From: Will Deacon <will@kernel.org>
To: iommu@lists.linux-foundation.org
Subject: [RFC PATCH 4/6] iommu: Split 'addr_merge' argument to iommu_pgsize()
 into separate parts
Date: Thu,  1 Apr 2021 17:47:36 +0100
Message-Id: <20210401164738.9513-5-will@kernel.org>
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

The 'addr_merge' parameter to iommu_pgsize() is a fabricated address
intended to describe the alignment requirements to consider when
choosing an appropriate page size. On the iommu_map() path, this address
is the logical OR of the virtual and physical addresses.

Subsequent improvements to iommu_pgsize() will need to check the
alignment of the virtual and physical components of 'addr_merge'
independently, so pass them in as separate parameters and reconstruct
'addr_merge' locally.

No functional change.

Signed-off-by: Will Deacon <will@kernel.org>
---
 drivers/iommu/iommu.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index bcd623862bf9..ab689611a03b 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2357,12 +2357,13 @@ phys_addr_t iommu_iova_to_phys(struct iommu_domain *domain, dma_addr_t iova)
 }
 EXPORT_SYMBOL_GPL(iommu_iova_to_phys);
 
-static size_t iommu_pgsize(struct iommu_domain *domain,
-			   unsigned long addr_merge, size_t size)
+static size_t iommu_pgsize(struct iommu_domain *domain, unsigned long iova,
+			   phys_addr_t paddr, size_t size)
 {
 	unsigned int pgsize_idx;
 	unsigned long pgsizes;
 	size_t pgsize;
+	phys_addr_t addr_merge = paddr | iova;
 
 	/* Page sizes supported by the hardware and small enough for @size */
 	pgsizes = domain->pgsize_bitmap & GENMASK(__fls(size), 0);
@@ -2415,7 +2416,7 @@ static int __iommu_map(struct iommu_domain *domain, unsigned long iova,
 	pr_debug("map: iova 0x%lx pa %pa size 0x%zx\n", iova, &paddr, size);
 
 	while (size) {
-		size_t pgsize = iommu_pgsize(domain, iova | paddr, size);
+		size_t pgsize = iommu_pgsize(domain, iova, paddr, size);
 
 		pr_debug("mapping: iova 0x%lx pa %pa pgsize 0x%zx\n",
 			 iova, &paddr, pgsize);
@@ -2503,8 +2504,9 @@ static size_t __iommu_unmap(struct iommu_domain *domain,
 	 * or we hit an area that isn't mapped.
 	 */
 	while (unmapped < size) {
-		size_t pgsize = iommu_pgsize(domain, iova, size - unmapped);
+		size_t pgsize;
 
+		pgsize = iommu_pgsize(domain, iova, iova, size - unmapped);
 		unmapped_page = ops->unmap(domain, iova, pgsize, iotlb_gather);
 		if (!unmapped_page)
 			break;
-- 
2.31.0.291.g576ba9dcdaf-goog

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
