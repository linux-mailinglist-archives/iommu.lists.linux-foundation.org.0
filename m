Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB0422AE8B
	for <lists.iommu@lfdr.de>; Thu, 23 Jul 2020 14:01:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id B8EB52A422;
	Thu, 23 Jul 2020 12:01:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dZc-DXy4U0Dw; Thu, 23 Jul 2020 12:01:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 01C692C342;
	Thu, 23 Jul 2020 12:01:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EBC0FC004E;
	Thu, 23 Jul 2020 12:01:41 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 28C42C004C
 for <iommu@lists.linux-foundation.org>; Thu, 23 Jul 2020 12:01:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 0AEB82C342
 for <iommu@lists.linux-foundation.org>; Thu, 23 Jul 2020 12:01:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bfz-VfHyqBLi for <iommu@lists.linux-foundation.org>;
 Thu, 23 Jul 2020 12:01:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by silver.osuosl.org (Postfix) with ESMTPS id 9A6F02A422
 for <iommu@lists.linux-foundation.org>; Thu, 23 Jul 2020 12:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=O0Nict5nBZqsTZgw/3V5Ax3QMrkZt+Ctbaze3VxgHms=; b=hgdseIwzotFi7dGgf8FAONpIlS
 2hlHTro2cWQUdgb7GJ5fdjIT5I01a1U3Z/xoIu/vQH/BC2JDMNLy40RIyMvGOXt3HIo8FwthOly0L
 rVWH1rkVw43/4gmpAesOHQiQ5zM0akITjPu0v9uhnJKKFNzOM9JGXPNiG7dtxgQ5yr3lb7lQbf7Zm
 /TfyEFgWYCfbxqS4fwIggLolcl1Nld63/2U46A8ONUvXXcpoc4iWI0ODKxjAlCmoT10eKTP2Ijp3S
 kYjsDGaR9vd+wD112NHVmdJ64FYdYKtfWGNxMkILNenkCMaPE1D09ubtSCNLpIG4LnhuWU9r7vrBP
 Uh2H8okA==;
Received: from [2001:4bb8:18c:2acc:91df:aae8:fa3b:de9c] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyZup-0006Q1-MK; Thu, 23 Jul 2020 12:01:36 +0000
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org
Subject: [PATCH v2] dma-contiguous: cleanup dma_alloc_contiguous
Date: Thu, 23 Jul 2020 14:01:33 +0200
Message-Id: <20200723120133.94105-1-hch@lst.de>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: robin.murphy@arm.com
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

Split out a cma_alloc_aligned helper to deal with the "interesting"
calling conventions for cma_alloc, which then allows to the main
function to be written straight forward.  This also takes advantage
of the fact that NULL dev arguments have been gone from the DMA API
for a while.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---

Changes since v1:
 - actually pass on the select struct cma
 - clean up cma_alloc_aligned a bit

 kernel/dma/contiguous.c | 31 ++++++++++++++-----------------
 1 file changed, 14 insertions(+), 17 deletions(-)

diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
index 15bc5026c485f2..cff7e60968b9e1 100644
--- a/kernel/dma/contiguous.c
+++ b/kernel/dma/contiguous.c
@@ -215,6 +215,13 @@ bool dma_release_from_contiguous(struct device *dev, struct page *pages,
 	return cma_release(dev_get_cma_area(dev), pages, count);
 }
 
+static struct page *cma_alloc_aligned(struct cma *cma, size_t size, gfp_t gfp)
+{
+	unsigned int align = min(get_order(size), CONFIG_CMA_ALIGNMENT);
+
+	return cma_alloc(cma, size >> PAGE_SHIFT, align, gfp & __GFP_NOWARN);
+}
+
 /**
  * dma_alloc_contiguous() - allocate contiguous pages
  * @dev:   Pointer to device for which the allocation is performed.
@@ -231,24 +238,14 @@ bool dma_release_from_contiguous(struct device *dev, struct page *pages,
  */
 struct page *dma_alloc_contiguous(struct device *dev, size_t size, gfp_t gfp)
 {
-	size_t count = size >> PAGE_SHIFT;
-	struct page *page = NULL;
-	struct cma *cma = NULL;
-
-	if (dev && dev->cma_area)
-		cma = dev->cma_area;
-	else if (count > 1)
-		cma = dma_contiguous_default_area;
-
 	/* CMA can be used only in the context which permits sleeping */
-	if (cma && gfpflags_allow_blocking(gfp)) {
-		size_t align = get_order(size);
-		size_t cma_align = min_t(size_t, align, CONFIG_CMA_ALIGNMENT);
-
-		page = cma_alloc(cma, count, cma_align, gfp & __GFP_NOWARN);
-	}
-
-	return page;
+	if (!gfpflags_allow_blocking(gfp))
+		return NULL;
+	if (dev->cma_area)
+		return cma_alloc_aligned(dev->cma_area, size, gfp);
+	if (size <= PAGE_SIZE || !dma_contiguous_default_area)
+		return NULL;
+	return cma_alloc_aligned(dma_contiguous_default_area, size, gfp);
 }
 
 /**
-- 
2.27.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
