Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 4839C22CFC
	for <lists.iommu@lfdr.de>; Mon, 20 May 2019 09:31:56 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 63B48B6C;
	Mon, 20 May 2019 07:31:13 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 278C0A70
	for <iommu@lists.linux-foundation.org>;
	Mon, 20 May 2019 07:31:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id C16917ED
	for <iommu@lists.linux-foundation.org>;
	Mon, 20 May 2019 07:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=3CnF0iIDb7oqE4diwy/VUBuunHutTDVCxO3IZ+FSTTc=;
	b=oxc3vNYm3jKoNiPnZeFWIl+vj8
	FeUOi7OgFpImyVinf9UjUWTNftfoZu6aPmKXqdlYnNabml1T9cSvdpqRJShv5xzoaElqHEREOig6P
	i5wnC0QCNPymvEWPGeGTfyIe80vLEUBV2Sa8OICrZAgTh9qGJRcEpD/r5H4gHoDm68chfeXMS5pxA
	mcwMhu/p1ZKongiz0VmfKW5JOGP0t7mJmYJBTiiwK0e5HhQuYf9n9BXkAcR0aUShvM+SNS1TvivwL
	5CcPmChHzyM0O0TWw9es7z8OhHpAapa/KrSUXcFG88IPmPoJ9J22aiIJ9nEH98N/qI9wgCOnjLijk
	PNpFz0qw==;
Received: from 089144206147.atnat0015.highway.bob.at ([89.144.206.147]
	helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSclI-0004HO-Ov; Mon, 20 May 2019 07:31:09 +0000
From: Christoph Hellwig <hch@lst.de>
To: Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH 11/24] iommu/dma: Remove __iommu_dma_free
Date: Mon, 20 May 2019 09:29:35 +0200
Message-Id: <20190520072948.11412-12-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190520072948.11412-1-hch@lst.de>
References: <20190520072948.11412-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
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

We only have a single caller of this function left, so open code it there.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/dma-iommu.c | 21 ++-------------------
 1 file changed, 2 insertions(+), 19 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 0ffb7805de77..5e0c8450fa0b 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -563,24 +563,6 @@ static struct page **__iommu_dma_get_pages(void *cpu_addr)
 	return area->pages;
 }
 
-/**
- * iommu_dma_free - Free a buffer allocated by iommu_dma_alloc_remap()
- * @dev: Device which owns this buffer
- * @pages: Array of buffer pages as returned by __iommu_dma_alloc_remap()
- * @size: Size of buffer in bytes
- * @handle: DMA address of buffer
- *
- * Frees both the pages associated with the buffer, and the array
- * describing them
- */
-static void __iommu_dma_free(struct device *dev, struct page **pages,
-		size_t size, dma_addr_t *handle)
-{
-	__iommu_dma_unmap(dev, *handle, size);
-	__iommu_dma_free_pages(pages, PAGE_ALIGN(size) >> PAGE_SHIFT);
-	*handle = DMA_MAPPING_ERROR;
-}
-
 /**
  * iommu_dma_alloc_remap - Allocate and map a buffer contiguous in IOVA space
  * @dev: Device to allocate memory for. Must be a real device
@@ -1053,7 +1035,8 @@ static void iommu_dma_free(struct device *dev, size_t size, void *cpu_addr,
 
 		if (!pages)
 			return;
-		__iommu_dma_free(dev, pages, iosize, &handle);
+		__iommu_dma_unmap(dev, handle, iosize);
+		__iommu_dma_free_pages(pages, size >> PAGE_SHIFT);
 		dma_common_free_remap(cpu_addr, size, VM_USERMAP);
 	} else {
 		__iommu_dma_unmap(dev, handle, iosize);
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
