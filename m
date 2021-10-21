Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 64600435D95
	for <lists.iommu@lfdr.de>; Thu, 21 Oct 2021 11:06:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C4FB60EAF;
	Thu, 21 Oct 2021 09:06:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HhK_Fe2BA6FK; Thu, 21 Oct 2021 09:06:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 32F8760EAC;
	Thu, 21 Oct 2021 09:06:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1E95FC0011;
	Thu, 21 Oct 2021 09:06:48 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5E7CBC0011
 for <iommu@lists.linux-foundation.org>; Thu, 21 Oct 2021 09:06:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 420B760EAF
 for <iommu@lists.linux-foundation.org>; Thu, 21 Oct 2021 09:06:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1YMHpewFgxSb for <iommu@lists.linux-foundation.org>;
 Thu, 21 Oct 2021 09:06:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C31E760EA6
 for <iommu@lists.linux-foundation.org>; Thu, 21 Oct 2021 09:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=geSHn+OKy9FQggkm2OH+aFo6fis8v5WVlLI2M5PRqq0=; b=c7K1J8MiDAsm3Y+oZ5xeQ798mV
 L//N5G4yja3Lc/OoJqfoF88M7GvolI0sS4+O//4Fsx9ZcTCAwTVf5+zbg4a7foEPj+xWFSHXRPAlZ
 rv967c7UeFCb+kvS9b3rpPUHsKXgGnrvCkIFHyHqUb2yp/WmJgSxGmIihjOpF1qZREnKnKr74PHk5
 9uuiFaqe+4GkGC1QlO7Y9qj83Tril3HvRQnT8Q596zLfC+trAcYFJxm8WXNez4aKOd4T72Kzv03tB
 QQFHhjFGN2XlNNMks8jkwcurAuItdwl+TCJfO22uibOGoBLY4Ap3VOlGWuV2mtkImTb8kwxdemTVM
 MTCApRQw==;
Received: from [2001:4bb8:180:8777:7df0:a8d8:40cc:3310] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdU28-006xze-GT; Thu, 21 Oct 2021 09:06:45 +0000
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org
Subject: [PATCH 09/10] dma-direct: factor the swiotlb code out of
 __dma_direct_alloc_pages
Date: Thu, 21 Oct 2021 11:06:10 +0200
Message-Id: <20211021090611.488281-10-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211021090611.488281-1-hch@lst.de>
References: <20211021090611.488281-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: Robin Murphy <robin.murphy@arm.com>, David Rientjes <rientjes@google.com>
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

Add a new helper to deal with the swiotlb case.  This keeps the code
nicely boundled and removes the not required call to
dma_direct_optimal_gfp_mask for the swiotlb case.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 kernel/dma/direct.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index f4ac2e1cdf469..f2ec40f5733fc 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -97,6 +97,18 @@ static void __dma_direct_free_pages(struct device *dev, struct page *page,
 	dma_free_contiguous(dev, page, size);
 }
 
+static struct page *dma_direct_alloc_swiotlb(struct device *dev, size_t size)
+{
+	struct page *page = swiotlb_alloc(dev, size);
+
+	if (page && !dma_coherent_ok(dev, page_to_phys(page), size)) {
+		swiotlb_free(dev, page, size);
+		return NULL;
+	}
+
+	return page;
+}
+
 static struct page *__dma_direct_alloc_pages(struct device *dev, size_t size,
 		gfp_t gfp)
 {
@@ -106,17 +118,11 @@ static struct page *__dma_direct_alloc_pages(struct device *dev, size_t size,
 
 	WARN_ON_ONCE(!PAGE_ALIGNED(size));
 
+	if (is_swiotlb_for_alloc(dev))
+		return dma_direct_alloc_swiotlb(dev, size);
+
 	gfp |= dma_direct_optimal_gfp_mask(dev, dev->coherent_dma_mask,
 					   &phys_limit);
-	if (is_swiotlb_for_alloc(dev)) {
-		page = swiotlb_alloc(dev, size);
-		if (page && !dma_coherent_ok(dev, page_to_phys(page), size)) {
-			__dma_direct_free_pages(dev, page, size);
-			return NULL;
-		}
-		return page;
-	}
-
 	page = dma_alloc_contiguous(dev, size, gfp);
 	if (page && !dma_coherent_ok(dev, page_to_phys(page), size)) {
 		dma_free_contiguous(dev, page, size);
-- 
2.30.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
