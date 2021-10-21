Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 408B8435D8D
	for <lists.iommu@lfdr.de>; Thu, 21 Oct 2021 11:06:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D840083B60;
	Thu, 21 Oct 2021 09:06:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fSGmz9VokSv4; Thu, 21 Oct 2021 09:06:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 1587E83B5C;
	Thu, 21 Oct 2021 09:06:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E3A3BC0036;
	Thu, 21 Oct 2021 09:06:27 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 551FFC0011
 for <iommu@lists.linux-foundation.org>; Thu, 21 Oct 2021 09:06:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 35E0D83B71
 for <iommu@lists.linux-foundation.org>; Thu, 21 Oct 2021 09:06:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FYp7j3mkSEc8 for <iommu@lists.linux-foundation.org>;
 Thu, 21 Oct 2021 09:06:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B3B4583B60
 for <iommu@lists.linux-foundation.org>; Thu, 21 Oct 2021 09:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=t7E1lVjNYhhqy121ZHEPCR+czvVV5IGr9lYgAxDVFCs=; b=NSbca3oNIL6MUXZuJuI3eU3tY4
 owTT7ISBcwONpYPoQlmE1nDa+JDJLRozWbdbl9B7Z/8xQZP2a+2RgpnYyLI/sdeb8ISiAQ6+y0AMn
 6qfGgjhOnqfTM0vNR6qcbSRruH0prYh6kaZFK1x24PhGMCdhDj7rub+aW2QKeCIy0dnMNoNinM6T8
 2I01vCYs0vvuuv/dIcSZ0JTqbWlCgokqxAOfCjxOi/QBvFESqMvnqErX1LpdiOpvxbzXecpVO23/R
 S4Kx5hXVpMYfrJ8D/xmAxPY3JcWqjccxz6kIAqcLICSmwu9Z8YydW9ueACfUlV9XFCVSMzuhpXzjb
 4L3VTTPQ==;
Received: from [2001:4bb8:180:8777:7df0:a8d8:40cc:3310] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdU1o-006xuk-Du; Thu, 21 Oct 2021 09:06:24 +0000
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org
Subject: [PATCH 03/10] dma-direct: leak memory that can't be re-encrypted
Date: Thu, 21 Oct 2021 11:06:04 +0200
Message-Id: <20211021090611.488281-4-hch@lst.de>
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

We must never unencryped memory go back into the general page pool.
So if we fail to set it back to encrypted when freeing DMA memory, leak
the memory insted and warn the user.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 kernel/dma/direct.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index 2fef8dd401fe9..60cb75aa6778e 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -263,9 +263,11 @@ void *dma_direct_alloc(struct device *dev, size_t size,
 	return ret;
 
 out_encrypt_pages:
-	/* If memory cannot be re-encrypted, it must be leaked */
-	if (dma_set_encrypted(dev, page_address(page), size))
+	if (dma_set_encrypted(dev, page_address(page), size)) {
+		pr_warn_ratelimited(
+			"leaking DMA memory that can't be re-encrypted\n");
 		return NULL;
+	}
 out_unmap_pages:
 	if (IS_ENABLED(CONFIG_DMA_REMAP) && is_vmalloc_addr(ret))
 		vunmap(ret);
@@ -307,7 +309,11 @@ void dma_direct_free(struct device *dev, size_t size,
 	    dma_free_from_pool(dev, cpu_addr, PAGE_ALIGN(size)))
 		return;
 
-	dma_set_encrypted(dev, cpu_addr, 1 << page_order);
+	if (dma_set_encrypted(dev, cpu_addr, 1 << page_order)) {
+		pr_warn_ratelimited(
+			"leaking DMA memory that can't be re-encrypted\n");
+		return;
+	}
 
 	if (IS_ENABLED(CONFIG_DMA_REMAP) && is_vmalloc_addr(cpu_addr))
 		vunmap(cpu_addr);
@@ -365,7 +371,11 @@ void dma_direct_free_pages(struct device *dev, size_t size,
 	    dma_free_from_pool(dev, vaddr, size))
 		return;
 
-	dma_set_encrypted(dev, vaddr, 1 << page_order);
+	if (dma_set_encrypted(dev, vaddr, 1 << page_order)) {
+		pr_warn_ratelimited(
+			"leaking DMA memory that can't be re-encrypted\n");
+		return;
+	}
 	__dma_direct_free_pages(dev, page, size);
 }
 
-- 
2.30.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
