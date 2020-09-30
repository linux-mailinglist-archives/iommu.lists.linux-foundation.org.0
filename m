Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 979E927EE70
	for <lists.iommu@lfdr.de>; Wed, 30 Sep 2020 18:09:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4D2DF87228;
	Wed, 30 Sep 2020 16:09:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2rAHQEr2EbwJ; Wed, 30 Sep 2020 16:09:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id E37D487222;
	Wed, 30 Sep 2020 16:09:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DDF22C0051;
	Wed, 30 Sep 2020 16:09:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1443AC0051
 for <iommu@lists.linux-foundation.org>; Wed, 30 Sep 2020 16:09:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id F3E0185567
 for <iommu@lists.linux-foundation.org>; Wed, 30 Sep 2020 16:09:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9MU6AqxnSgtB for <iommu@lists.linux-foundation.org>;
 Wed, 30 Sep 2020 16:09:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 5EC4B8553C
 for <iommu@lists.linux-foundation.org>; Wed, 30 Sep 2020 16:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=fcJxwoQ+kZKNx/nryCD7ZbkgjtXm1YK3I5cf/tzI15g=; b=K7EO9cRvqiyOHHAuOj+yInRw9e
 aJTZbNY6h8qg6La0bk5dj+xM/PU5+VeOuJ9YhhDCqKy1IV6JfVpsa3QNZRUxOxNDVyZubSBafYpw/
 8B9KbiiBu8HF6qFaWoZ9Nc1tvZfosiixYgC0KZ5+3cBXrJfVVvacmmaHlgPaa24vT44E19Bi/Pw5F
 rLE3znMdkvvyCdJJAy8KkMJaJNP4aoskq1wfuDz0gHU+pCLAIPQTTeEJowpQDT53HF24P5Rhuj3xs
 +qv4bBP1a4NuwrtJnJLhYVWbWli41HX7YLlCWv7SmF4pi/giKNBMZ768eYdOWjDVKv0Iy3bedlGyc
 l+0H6jqQ==;
Received: from [2001:4bb8:180:7b62:c70:4a89:bc61:4] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNefU-0003D8-Uo; Wed, 30 Sep 2020 16:09:25 +0000
From: Christoph Hellwig <hch@lst.de>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Tomasz Figa <tfiga@chromium.org>, iommu@lists.linux-foundation.org
Subject: [PATCH 3/8] dma-direct check for highmem pages in
 dma_direct_alloc_pages
Date: Wed, 30 Sep 2020 18:09:12 +0200
Message-Id: <20200930160917.1234225-4-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200930160917.1234225-1-hch@lst.de>
References: <20200930160917.1234225-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: linux-media@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
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

Check for highmem pages from CMA, just like in the dma_direct_alloc path.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 kernel/dma/direct.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index 121a9c1969dd3a..b5f20781d3a96f 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -309,6 +309,17 @@ struct page *dma_direct_alloc_pages(struct device *dev, size_t size,
 	page = __dma_direct_alloc_pages(dev, size, gfp);
 	if (!page)
 		return NULL;
+	if (PageHighMem(page)) {
+		/*
+		 * Depending on the cma= arguments and per-arch setup
+		 * dma_alloc_contiguous could return highmem pages.
+		 * Without remapping there is no way to return them here,
+		 * so log an error and fail.
+		 */
+		dev_info(dev, "Rejecting highmem page from CMA.\n");
+		goto out_free_pages;
+	}
+
 	ret = page_address(page);
 	if (force_dma_unencrypted(dev)) {
 		if (set_memory_decrypted((unsigned long)ret,
-- 
2.28.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
