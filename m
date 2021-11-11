Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6968A44D20B
	for <lists.iommu@lfdr.de>; Thu, 11 Nov 2021 07:50:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB6D7404EA;
	Thu, 11 Nov 2021 06:50:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UgNgQd4y1rca; Thu, 11 Nov 2021 06:50:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id EA571404F8;
	Thu, 11 Nov 2021 06:50:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D393FC001E;
	Thu, 11 Nov 2021 06:50:43 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 663EBC0036
 for <iommu@lists.linux-foundation.org>; Thu, 11 Nov 2021 06:50:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 55D9F404F6
 for <iommu@lists.linux-foundation.org>; Thu, 11 Nov 2021 06:50:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dZ0dxl_3KGGh for <iommu@lists.linux-foundation.org>;
 Thu, 11 Nov 2021 06:50:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AE510404F7
 for <iommu@lists.linux-foundation.org>; Thu, 11 Nov 2021 06:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=3oKWvDpSxLCaZlzbOGECmhJWG6CkfO8Mhx431fBIDUY=; b=LjtE2e5pxsWNjL1qGu5mPjrmFS
 EdNVnAIJVl+T6VyT8A0CdPTpm1BjkPc90FhaMERbOlic1oloTSs45+JVqESE8QQwygnUpn61b+GXf
 wAPLaJmkk4XZq1e0NAcwvog4dw9QaX9GpDrdQ6UoYQScqZa21TSo8/Pj17+/brBaT20FS6RrtgFiy
 fq50UqyBdTkKkNjTvXyoTwr9LehrR2Pst/h1ennOr+PNdNR0aCJh/RickH748vii1dndyXpqk68bn
 TAElvJTS7+ESWq/GD4s2UnX9j5bmQngeUeK80QakEVz0qX73/iBaK18Bb5BEof8xv5uQzg8yMorFJ
 daqNnKFg==;
Received: from [2001:4bb8:19a:7ee7:dc25:8b64:278b:ff22] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ml3uw-002Vy3-Pf; Thu, 11 Nov 2021 06:50:39 +0000
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org
Subject: [PATCH 08/11] dma-direct: warn if there is no pool for force
 unencrypted allocations
Date: Thu, 11 Nov 2021 07:50:24 +0100
Message-Id: <20211111065028.32761-9-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211111065028.32761-1-hch@lst.de>
References: <20211111065028.32761-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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

Instead of blindly running into a blocking operation for a non-blocking gfp,
return NULL and spew an error.  Note that Kconfig prevents this for all
currently relevant platforms, and this is just a debug check.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Robin Murphy <robin.murphy@arm.com>
---
 kernel/dma/direct.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index a13017656ecae..84226a764471b 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -159,6 +159,9 @@ static void *dma_direct_alloc_from_pool(struct device *dev, size_t size,
 	u64 phys_mask;
 	void *ret;
 
+	if (WARN_ON_ONCE(!IS_ENABLED(CONFIG_DMA_COHERENT_POOL)))
+		return NULL;
+
 	gfp |= dma_direct_optimal_gfp_mask(dev, dev->coherent_dma_mask,
 					   &phys_mask);
 	page = dma_alloc_from_pool(dev, size, &ret, gfp, dma_coherent_ok);
@@ -243,8 +246,7 @@ void *dma_direct_alloc(struct device *dev, size_t size,
 	 * Decrypting memory may block, so allocate the memory from the atomic
 	 * pools if we can't block.
 	 */
-	if (IS_ENABLED(CONFIG_DMA_COHERENT_POOL) &&
-	    force_dma_unencrypted(dev) && !gfpflags_allow_blocking(gfp) &&
+	if (force_dma_unencrypted(dev) && !gfpflags_allow_blocking(gfp) &&
 	    !is_swiotlb_for_alloc(dev))
 		return dma_direct_alloc_from_pool(dev, size, dma_handle, gfp);
 
@@ -354,8 +356,7 @@ struct page *dma_direct_alloc_pages(struct device *dev, size_t size,
 	struct page *page;
 	void *ret;
 
-	if (IS_ENABLED(CONFIG_DMA_COHERENT_POOL) &&
-	    force_dma_unencrypted(dev) && !gfpflags_allow_blocking(gfp) &&
+	if (force_dma_unencrypted(dev) && !gfpflags_allow_blocking(gfp) &&
 	    !is_swiotlb_for_alloc(dev))
 		return dma_direct_alloc_from_pool(dev, size, dma_handle, gfp);
 
-- 
2.30.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
