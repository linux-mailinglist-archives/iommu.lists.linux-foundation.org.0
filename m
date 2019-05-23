Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A40827691
	for <lists.iommu@lfdr.de>; Thu, 23 May 2019 09:02:11 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 868DA2C;
	Thu, 23 May 2019 07:01:17 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp2.linuxfoundation.org (smtp2.linux-foundation.org
	[172.17.192.36])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E009ED3D
	for <iommu@lists.linux-foundation.org>;
	Thu, 23 May 2019 07:01:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp2.linuxfoundation.org (Postfix) with ESMTPS id 8410A1DD99
	for <iommu@lists.linux-foundation.org>;
	Thu, 23 May 2019 07:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=OHfZ5cfOpl9Q/OqK6hHLXkjiKxowRZ95KJJM/QXcI58=;
	b=sF+1+KoG8KgHg6wTqdrNDNTGvu
	C7MIq/1+bfXeFzcwl/8ZvQZb53ryJ21HNWXOp9lAa5b8DvDxUUgsuvTlK6Uv9cr9Y2HUuN9k0wANc
	8sA/GFvBqKkMvezekxmF4pfzmZrfwnyt4dHTVqL0Ra9EeZCX6XgTc/spVPPcSA23zvUM+W5ixvees
	JYiU007PQVSmbxu5yCTvBTKJR9s2mrt0ol4h6qgTKUJdda7ANagJQF8fZah0F7LliWaiwmzs2evMd
	AATbFP4xS1fKgbNDDj9zGtaNJqspyiPzPflniYlsY8nvgEKOMvpo+X3sI8P2fbcqjC8YR88lhDgCv
	HZE8dwJA==;
Received: from 213-225-10-46.nat.highway.a1.net ([213.225.10.46]
	helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hThiu-0005UL-7s; Thu, 23 May 2019 07:01:08 +0000
From: Christoph Hellwig <hch@lst.de>
To: Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH 13/23] iommu/dma: Don't remap CMA unnecessarily
Date: Thu, 23 May 2019 09:00:18 +0200
Message-Id: <20190523070028.7435-14-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190523070028.7435-1-hch@lst.de>
References: <20190523070028.7435-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp2.linux-foundation.org
Cc: Tom Murphy <tmurphy@arista.com>, Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org,
	iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

From: Robin Murphy <robin.murphy@arm.com>

Always remapping CMA allocations was largely a bodge to keep the freeing
logic manageable when it was split between here and an arch wrapper. Now
that it's all together and streamlined, we can relax that limitation.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/iommu/dma-iommu.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 41e87756c076..3629bc2f59ee 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -973,7 +973,6 @@ static void *iommu_dma_alloc(struct device *dev, size_t size,
 {
 	bool coherent = dev_is_dma_coherent(dev);
 	int ioprot = dma_info_to_prot(DMA_BIDIRECTIONAL, coherent, attrs);
-	pgprot_t prot = arch_dma_mmap_pgprot(dev, PAGE_KERNEL, attrs);
 	size_t iosize = size;
 	struct page *page;
 	void *addr;
@@ -1021,13 +1020,19 @@ static void *iommu_dma_alloc(struct device *dev, size_t size,
 	if (*handle == DMA_MAPPING_ERROR)
 		goto out_free_pages;
 
-	addr = dma_common_contiguous_remap(page, size, VM_USERMAP, prot,
-			__builtin_return_address(0));
-	if (!addr)
-		goto out_unmap;
+	if (!coherent || PageHighMem(page)) {
+		pgprot_t prot = arch_dma_mmap_pgprot(dev, PAGE_KERNEL, attrs);
 
-	if (!coherent)
-		arch_dma_prep_coherent(page, iosize);
+		addr = dma_common_contiguous_remap(page, size, VM_USERMAP, prot,
+				__builtin_return_address(0));
+		if (!addr)
+			goto out_unmap;
+
+		if (!coherent)
+			arch_dma_prep_coherent(page, iosize);
+	} else {
+		addr = page_address(page);
+	}
 	memset(addr, 0, size);
 	return addr;
 out_unmap:
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
