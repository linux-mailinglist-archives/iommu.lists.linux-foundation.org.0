Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EEA927EE72
	for <lists.iommu@lfdr.de>; Wed, 30 Sep 2020 18:09:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id BE53C859EA;
	Wed, 30 Sep 2020 16:09:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xu430btCh30g; Wed, 30 Sep 2020 16:09:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 32D23855D8;
	Wed, 30 Sep 2020 16:09:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1B28BC0051;
	Wed, 30 Sep 2020 16:09:37 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 81735C0051
 for <iommu@lists.linux-foundation.org>; Wed, 30 Sep 2020 16:09:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 6652F2151E
 for <iommu@lists.linux-foundation.org>; Wed, 30 Sep 2020 16:09:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hBZT7TSCFq6s for <iommu@lists.linux-foundation.org>;
 Wed, 30 Sep 2020 16:09:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by silver.osuosl.org (Postfix) with ESMTPS id B57B52107D
 for <iommu@lists.linux-foundation.org>; Wed, 30 Sep 2020 16:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=TmfaCnUd+7mEz2YuYjVCYbtQ0kXcXuqBuz2CDTaW1SU=; b=vTUKxlHvoBZU8oPuhfyrBvMush
 R8HWo77aaA/LJrPmDuWZoiiDEH5yrCNR3FWG2OnLJ7+urDV58UGL9mWxIRaiQu0dullqNzBTf5wAU
 pKdhVu2W/dOFVAwdroM1B55Rhhws/gIKMi8HWTMWuFeAQvOc9bLTw23c9Uy9fAhoGpi7fgBmWeQ4k
 quQOt/+R406V/VviQHvuyRe3bFdwJQlDenY5GHU7VuR+9Hhv/brb8OJVzK8YlqfnvDS0Pog73xU2r
 GVbYqmzOXj8rj/iA0Sit4Ms7NjLAmayqY7L5ime3YuIlMssIibDUhdvSI8nL5TlzWtCmOTpFUWy/O
 6Rr9StWw==;
Received: from [2001:4bb8:180:7b62:c70:4a89:bc61:4] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNefW-0003DH-6X; Wed, 30 Sep 2020 16:09:26 +0000
From: Christoph Hellwig <hch@lst.de>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Tomasz Figa <tfiga@chromium.org>, iommu@lists.linux-foundation.org
Subject: [PATCH 4/8] dma-direct: use __GFP_ZERO in dma_direct_alloc_pages
Date: Wed, 30 Sep 2020 18:09:13 +0200
Message-Id: <20200930160917.1234225-5-hch@lst.de>
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

Prepare for supporting the DMA_ATTR_NO_KERNEL_MAPPING flag in
dma_alloc_pages.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 kernel/dma/direct.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index b5f20781d3a96f..b5d56810130b22 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -296,9 +296,10 @@ struct page *dma_direct_alloc_pages(struct device *dev, size_t size,
 		dma_addr_t *dma_handle, enum dma_data_direction dir, gfp_t gfp)
 {
 	struct page *page;
-	void *ret;
 
 	if (dma_should_alloc_from_pool(dev, gfp, 0)) {
+		void *ret;
+
 		page = dma_alloc_from_pool(dev, size, &ret, gfp,
 				dma_coherent_ok);
 		if (!page)
@@ -306,7 +307,7 @@ struct page *dma_direct_alloc_pages(struct device *dev, size_t size,
 		goto done;
 	}
 
-	page = __dma_direct_alloc_pages(dev, size, gfp);
+	page = __dma_direct_alloc_pages(dev, size, gfp | __GFP_ZERO);
 	if (!page)
 		return NULL;
 	if (PageHighMem(page)) {
@@ -320,13 +321,11 @@ struct page *dma_direct_alloc_pages(struct device *dev, size_t size,
 		goto out_free_pages;
 	}
 
-	ret = page_address(page);
 	if (force_dma_unencrypted(dev)) {
-		if (set_memory_decrypted((unsigned long)ret,
+		if (set_memory_decrypted((unsigned long)page_address(page),
 				1 << get_order(size)))
 			goto out_free_pages;
 	}
-	memset(ret, 0, size);
 done:
 	*dma_handle = phys_to_dma_direct(dev, page_to_phys(page));
 	return page;
-- 
2.28.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
