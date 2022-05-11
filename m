Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8696752337F
	for <lists.iommu@lfdr.de>; Wed, 11 May 2022 14:58:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A2454049D;
	Wed, 11 May 2022 12:58:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yz5IAafW4Z-n; Wed, 11 May 2022 12:58:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 3D2EF404F6;
	Wed, 11 May 2022 12:58:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 21AECC0081;
	Wed, 11 May 2022 12:58:20 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D5AECC002D
 for <iommu@lists.linux-foundation.org>; Wed, 11 May 2022 12:58:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C4C9841615
 for <iommu@lists.linux-foundation.org>; Wed, 11 May 2022 12:58:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QPuMurF0zals for <iommu@lists.linux-foundation.org>;
 Wed, 11 May 2022 12:58:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ED0A8418FE
 for <iommu@lists.linux-foundation.org>; Wed, 11 May 2022 12:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=toUCmk68b0VIqulfilEOK3I3y91LJ0y0OH/f7d0EES0=; b=GGIU1i8lkayqDGAplfrTSrhaor
 BLksm6LWRMLoDZZbshdWfl1zTZJw7+5EApQCx/OIN5M0EU1RtOm2OP3lgcCxN0zEnNoGvF+GODe3G
 ofQic3DC0LKOfP7Fkx2AeGIxyEVZb/kbjHRCDleY4wfI1k9Lp2EjpIw2epikU2kUn3o/FWk+ND78J
 W6sXXNB9s8fIRSBTPGBi4SnVmC8afXImzQtCfps0xo0YrB6WG5ivAudedbhd+z0axlhNGkH7zCTqI
 iY5Bf3S8J4EU/B25UhLHUqveOZLR1f11oopGMGBSmVNXdElnUxTs231jO3i0K+ajnFFfdiXi2/Hf5
 siB5FhhA==;
Received: from [2001:4bb8:184:7881:740a:25f7:2c13:ef7a] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noluy-006red-V1; Wed, 11 May 2022 12:58:17 +0000
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org
Subject: [PATCH 3/3] swiotlb: use the right nslabs-derived sizes in
 swiotlb_init_late
Date: Wed, 11 May 2022 14:58:05 +0200
Message-Id: <20220511125805.1377025-4-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220511125805.1377025-1-hch@lst.de>
References: <20220511125805.1377025-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Conor.Dooley@microchip.com
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

nslabs can shrink when allocations or the remap don't succeed, so make
sure to use it for all sizing.  For that remove the bytes value that
can get stale and replace it with local calculations and a boolean to
indicate if the originally requested size could not be allocated.

Fixes: 6424e31b1c05 ("swiotlb: remove swiotlb_init_with_tbl and swiotlb_init_late_with_tbl")
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 kernel/dma/swiotlb.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 113e1e8aaca37..d6e62a6a42ceb 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -297,9 +297,9 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask,
 {
 	struct io_tlb_mem *mem = &io_tlb_default_mem;
 	unsigned long nslabs = ALIGN(size >> IO_TLB_SHIFT, IO_TLB_SEGSIZE);
-	unsigned long bytes;
 	unsigned char *vstart = NULL;
 	unsigned int order;
+	bool retried = false;
 	int rc = 0;
 
 	if (swiotlb_force_disable)
@@ -308,7 +308,6 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask,
 retry:
 	order = get_order(nslabs << IO_TLB_SHIFT);
 	nslabs = SLABS_PER_PAGE << order;
-	bytes = nslabs << IO_TLB_SHIFT;
 
 	while ((SLABS_PER_PAGE << order) > IO_TLB_MIN_SLABS) {
 		vstart = (void *)__get_free_pages(gfp_mask | __GFP_NOWARN,
@@ -316,16 +315,13 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask,
 		if (vstart)
 			break;
 		order--;
+		nslabs = SLABS_PER_PAGE << order;
+		retried = true;
 	}
 
 	if (!vstart)
 		return -ENOMEM;
 
-	if (order != get_order(bytes)) {
-		pr_warn("only able to allocate %ld MB\n",
-			(PAGE_SIZE << order) >> 20);
-		nslabs = SLABS_PER_PAGE << order;
-	}
 	if (remap)
 		rc = remap(vstart, nslabs);
 	if (rc) {
@@ -334,9 +330,15 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask,
 		nslabs = ALIGN(nslabs >> 1, IO_TLB_SEGSIZE);
 		if (nslabs < IO_TLB_MIN_SLABS)
 			return rc;
+		retried = true;
 		goto retry;
 	}
 
+	if (retried) {
+		pr_warn("only able to allocate %ld MB\n",
+			(PAGE_SIZE << order) >> 20);
+	}
+
 	mem->slots = (void *)__get_free_pages(GFP_KERNEL | __GFP_ZERO,
 		get_order(array_size(sizeof(*mem->slots), nslabs)));
 	if (!mem->slots) {
@@ -344,7 +346,8 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask,
 		return -ENOMEM;
 	}
 
-	set_memory_decrypted((unsigned long)vstart, bytes >> PAGE_SHIFT);
+	set_memory_decrypted((unsigned long)vstart,
+			     (nslabs << IO_TLB_SHIFT) >> PAGE_SHIFT);
 	swiotlb_init_io_tlb_mem(mem, virt_to_phys(vstart), nslabs, true);
 
 	swiotlb_print_info();
-- 
2.30.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
