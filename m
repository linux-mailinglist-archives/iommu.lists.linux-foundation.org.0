Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 8750A3CD4C6
	for <lists.iommu@lfdr.de>; Mon, 19 Jul 2021 14:32:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D63CC838E6;
	Mon, 19 Jul 2021 12:31:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jDMmiIGTcsII; Mon, 19 Jul 2021 12:31:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 0E045838FB;
	Mon, 19 Jul 2021 12:31:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4737DC0025;
	Mon, 19 Jul 2021 12:31:57 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DA5C6C000E
 for <iommu@lists.linux-foundation.org>; Mon, 19 Jul 2021 12:31:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CA215838E0
 for <iommu@lists.linux-foundation.org>; Mon, 19 Jul 2021 12:31:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m2AXtCqvHVt4 for <iommu@lists.linux-foundation.org>;
 Mon, 19 Jul 2021 12:31:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 50306838F7
 for <iommu@lists.linux-foundation.org>; Mon, 19 Jul 2021 12:31:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 81A5E6115B;
 Mon, 19 Jul 2021 12:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626697916;
 bh=vCpUosll3mRPKbzIGfrfbIiMPp8FsRjwLd4omMzxTK0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RRF74qG/2JxqaWKlodJ79rBfg/t782v7e7VYxc5S+tDqKbIqarvtwpEhZCF9KD4+H
 qUdXdyTKYRvRPG3WmJK+pPWNMWKDzDVigSH/F5mlKL8xmzFV/ZA3WZ7ZTG/+GWB4QY
 1auRvkArtMEreIyftYBDNKbr8FRKZT0Gf55B9gLk3tbuNQ9fQACGbKzSTsrh2mJurE
 5rRpdsWJ305tsAyQBzPeEqPDAqEpT7ehQUSBo8e0Z0As7KNKeeo47qNYmeDXCuzgSv
 i0Tq/h4YNjD4D1GxcIR8778Ar9btWxCoNmJ7v81fOor+NKCRan0ZeT3O/OOYxZHi1a
 rnBWrLYYnXy+Q==
From: Will Deacon <will@kernel.org>
To: iommu@lists.linux-foundation.org
Subject: [PATCH 5/5] swiotlb: Free tbl memory in swiotlb_exit()
Date: Mon, 19 Jul 2021 13:30:54 +0100
Message-Id: <20210719123054.6844-6-will@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210719123054.6844-1-will@kernel.org>
References: <20210719123054.6844-1-will@kernel.org>
MIME-Version: 1.0
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>, Claire Chang <tientzu@chromium.org>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 Guenter Roeck <linux@roeck-us.net>
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

Although swiotlb_exit() frees the 'slots' metadata array referenced by
'io_tlb_default_mem', it leaves the underlying buffer pages allocated
despite no longer being usable.

Extend swiotlb_exit() to free the buffer pages as well as the slots
array.

Cc: Claire Chang <tientzu@chromium.org>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Tested-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Will Deacon <will@kernel.org>
---
 kernel/dma/swiotlb.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index b3c793ed9e64..87c40517e822 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -328,18 +328,27 @@ swiotlb_late_init_with_tbl(char *tlb, unsigned long nslabs)
 
 void __init swiotlb_exit(void)
 {
-	size_t size;
 	struct io_tlb_mem *mem = &io_tlb_default_mem;
+	unsigned long tbl_vaddr;
+	size_t tbl_size, slots_size;
 
 	if (!mem->nslabs)
 		return;
 
 	pr_info("tearing down default memory pool\n");
-	size = array_size(sizeof(*mem->slots), mem->nslabs);
-	if (mem->late_alloc)
-		free_pages((unsigned long)mem->slots, get_order(size));
-	else
-		memblock_free_late(__pa(mem->slots), PAGE_ALIGN(size));
+	tbl_vaddr = (unsigned long)phys_to_virt(mem->start);
+	tbl_size = PAGE_ALIGN(mem->end - mem->start);
+	slots_size = PAGE_ALIGN(array_size(sizeof(*mem->slots), mem->nslabs));
+
+	set_memory_encrypted(tbl_vaddr, tbl_size >> PAGE_SHIFT);
+	if (mem->late_alloc) {
+		free_pages(tbl_vaddr, get_order(tbl_size));
+		free_pages((unsigned long)mem->slots, get_order(slots_size));
+	} else {
+		memblock_free_late(mem->start, tbl_size);
+		memblock_free_late(__pa(mem->slots), slots_size);
+	}
+
 	memset(mem, 0, sizeof(*mem));
 }
 
-- 
2.32.0.402.g57bb445576-goog

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
