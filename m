Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFD344D209
	for <lists.iommu@lfdr.de>; Thu, 11 Nov 2021 07:50:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72524404ED;
	Thu, 11 Nov 2021 06:50:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 40cJLRq8KFPR; Thu, 11 Nov 2021 06:50:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 8B4FC404FA;
	Thu, 11 Nov 2021 06:50:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 580BFC0039;
	Thu, 11 Nov 2021 06:50:40 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D4EF0C001E
 for <iommu@lists.linux-foundation.org>; Thu, 11 Nov 2021 06:50:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B249C81A46
 for <iommu@lists.linux-foundation.org>; Thu, 11 Nov 2021 06:50:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 89EMnef_G11a for <iommu@lists.linux-foundation.org>;
 Thu, 11 Nov 2021 06:50:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0730081A39
 for <iommu@lists.linux-foundation.org>; Thu, 11 Nov 2021 06:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=4sDN6wHzSUEux04HmtiK5T/S3GEIa4Sj2NyQ6fw1e/s=; b=I521zA5NP+hxP1nauFt2jHonnQ
 yZoS4Xq0//3f0EJwhcSIvzsvORZQpih1OAZ0HPmOfNUpBPu3WGRtXGX34NKwf0eyeYLikswBldVob
 4mnbdcRkQF93cd/e4bmJJSa2FKnc5qMvMxYB88D4U7QZKIUODpQKqeBIvSk9M6RwVEEkSU9F8Enll
 Df6dLdIsXf+KDKAG3SqTKJiaZ0T3zYk2hgosp29dHH6dL013RhMRfoyTPvh+lTFdCAmovmG7xvofd
 obRRP6WjmJ+3BXt0zKDnYXm3EQImG/t+g9q3lSiJRVAjN0kz69AGuDzfpVEgmpE1bmYPjs6iye4/O
 P6t6rWcQ==;
Received: from [2001:4bb8:19a:7ee7:dc25:8b64:278b:ff22] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ml3uu-002Vxj-3i; Thu, 11 Nov 2021 06:50:37 +0000
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org
Subject: [PATCH 06/11] dma-direct: refactor the !coherent checks in
 dma_direct_alloc
Date: Thu, 11 Nov 2021 07:50:22 +0100
Message-Id: <20211111065028.32761-7-hch@lst.de>
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

Add a big central !dev_is_dma_coherent(dev) block to deal with as much
as of the uncached allocation schemes and document the schemes a bit
better.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 kernel/dma/direct.c | 66 ++++++++++++++++++++++++++++-----------------
 1 file changed, 41 insertions(+), 25 deletions(-)

diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index 01104660ec439..f9658fe18498c 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -201,29 +201,49 @@ void *dma_direct_alloc(struct device *dev, size_t size,
 	    !force_dma_unencrypted(dev) && !is_swiotlb_for_alloc(dev))
 		return dma_direct_alloc_no_mapping(dev, size, dma_handle, gfp);
 
-	if (!IS_ENABLED(CONFIG_ARCH_HAS_DMA_SET_UNCACHED) &&
-	    !IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) &&
-	    !IS_ENABLED(CONFIG_DMA_GLOBAL_POOL) &&
-	    !dev_is_dma_coherent(dev) &&
-	    !is_swiotlb_for_alloc(dev))
-		return arch_dma_alloc(dev, size, dma_handle, gfp, attrs);
+	if (!dev_is_dma_coherent(dev)) {
+		/*
+		 * Fallback to the arch handler if it exists.  This should
+		 * eventually go away.
+		 */
+		if (!IS_ENABLED(CONFIG_ARCH_HAS_DMA_SET_UNCACHED) &&
+		    !IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) &&
+		    !IS_ENABLED(CONFIG_DMA_GLOBAL_POOL) &&
+		    !is_swiotlb_for_alloc(dev))
+			return arch_dma_alloc(dev, size, dma_handle, gfp,
+					      attrs);
 
-	if (IS_ENABLED(CONFIG_DMA_GLOBAL_POOL) &&
-	    !dev_is_dma_coherent(dev))
-		return dma_alloc_from_global_coherent(dev, size, dma_handle);
+		/*
+		 * If there is a global pool, always allocate from it for
+		 * non-coherent devices.
+		 */
+		if (IS_ENABLED(CONFIG_DMA_GLOBAL_POOL))
+			return dma_alloc_from_global_coherent(dev, size,
+					dma_handle);
+
+		/*
+		 * Otherwise remap if the architecture is asking for it.  But
+		 * given that remapping memory is a blocking operation we'll
+		 * instead have to dip into the atomic pools.
+		 */
+		remap = IS_ENABLED(CONFIG_DMA_DIRECT_REMAP);
+		if (remap) {
+			if (!gfpflags_allow_blocking(gfp) &&
+			    !is_swiotlb_for_alloc(dev))
+				return dma_direct_alloc_from_pool(dev, size,
+						dma_handle, gfp);
+		} else {
+			if (IS_ENABLED(CONFIG_ARCH_HAS_DMA_SET_UNCACHED))
+				set_uncached = true;
+		}
+	}
 
 	/*
-	 * Remapping or decrypting memory may block. If either is required and
-	 * we can't block, allocate the memory from the atomic pools.
-	 * If restricted DMA (i.e., is_swiotlb_for_alloc) is required, one must
-	 * set up another device coherent pool by shared-dma-pool and use
-	 * dma_alloc_from_dev_coherent instead.
+	 * Decrypting memory may block, so allocate the memory from the atomic
+	 * pools if we can't block.
 	 */
 	if (IS_ENABLED(CONFIG_DMA_COHERENT_POOL) &&
-	    !gfpflags_allow_blocking(gfp) &&
-	    (force_dma_unencrypted(dev) ||
-	     (IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) &&
-	      !dev_is_dma_coherent(dev))) &&
+	    force_dma_unencrypted(dev) && !gfpflags_allow_blocking(gfp) &&
 	    !is_swiotlb_for_alloc(dev))
 		return dma_direct_alloc_from_pool(dev, size, dma_handle, gfp);
 
@@ -231,10 +251,7 @@ void *dma_direct_alloc(struct device *dev, size_t size,
 	page = __dma_direct_alloc_pages(dev, size, gfp & ~__GFP_ZERO);
 	if (!page)
 		return NULL;
-
-	if (!dev_is_dma_coherent(dev) && IS_ENABLED(CONFIG_DMA_DIRECT_REMAP)) {
-		remap = true;
-	} else if (PageHighMem(page)) {
+	if (PageHighMem(page)) {
 		/*
 		 * Depending on the cma= arguments and per-arch setup,
 		 * dma_alloc_contiguous could return highmem pages.
@@ -246,9 +263,8 @@ void *dma_direct_alloc(struct device *dev, size_t size,
 			goto out_free_pages;
 		}
 		remap = true;
-	} else if (!dev_is_dma_coherent(dev) &&
-		   IS_ENABLED(CONFIG_ARCH_HAS_DMA_SET_UNCACHED))
-		set_uncached = true;
+		set_uncached = false;
+	}
 
 	if (remap) {
 		/* remove any dirty cache lines on the kernel alias */
-- 
2.30.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
