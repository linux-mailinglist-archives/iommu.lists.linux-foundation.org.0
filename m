Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 938E5A5710
	for <lists.iommu@lfdr.de>; Mon,  2 Sep 2019 15:04:17 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 7633CE46;
	Mon,  2 Sep 2019 13:04:02 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 6878EE3A
	for <iommu@lists.linux-foundation.org>;
	Mon,  2 Sep 2019 13:04:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 0594E709
	for <iommu@lists.linux-foundation.org>;
	Mon,  2 Sep 2019 13:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=1EUMcSIJcoIdNfawPXZnVgY52ahSnbBC8m8PhYzXTXA=;
	b=k5utAYi5JMaI+tNLk+JqU3cYPq
	ES/RPpYKu/0+MJJyhyUWB8MZooMiKKk7ttAzi/Bx8+FnN5xNr6WrHUuxyHTm+PHnNHJBDdrRdn2LE
	Xuc8LfBBext3QGCwpodJeI/BenP/OttPTQcXH0v6PvYtkqOYHYYCvC87VA+LpVmhcIFrkalVBwmmB
	FprUemrYreEomdPDXYHH6hMFLyHHcQtLIlhhx40meDQrChenDBupbuM5wDzJiUVFrXGplxHpPWrtM
	ABldLkOsAWpYncGCV6qvjoFHERsKH/LWhZZi8FCs/Gf4qwlgBdn/CccHrVd5E/PGeoLKbZplwUU2e
	xQwZS2RA==;
Received: from [2001:4bb8:18c:1755:c70:4a89:bc61:2] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
	id 1i4lzv-0001NV-As; Mon, 02 Sep 2019 13:03:55 +0000
From: Christoph Hellwig <hch@lst.de>
To: Stefano Stabellini <sstabellini@kernel.org>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, gross@suse.com,
	boris.ostrovsky@oracle.com
Subject: [PATCH 04/13] xen/arm: simplify dma_cache_maint
Date: Mon,  2 Sep 2019 15:03:30 +0200
Message-Id: <20190902130339.23163-5-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190902130339.23163-1-hch@lst.de>
References: <20190902130339.23163-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: xen-devel@lists.xenproject.org, iommu@lists.linux-foundation.org,
	x86@kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
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

Calculate the required operation in the caller, and pass it directly
instead of recalculating it for each page, and use simple arithmetics
to get from the physical address to Xen page size aligned chunks.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 arch/arm/xen/mm.c | 61 ++++++++++++++++-------------------------------
 1 file changed, 21 insertions(+), 40 deletions(-)

diff --git a/arch/arm/xen/mm.c b/arch/arm/xen/mm.c
index 90574d89d0d4..2fde161733b0 100644
--- a/arch/arm/xen/mm.c
+++ b/arch/arm/xen/mm.c
@@ -35,64 +35,45 @@ unsigned long xen_get_swiotlb_free_pages(unsigned int order)
 	return __get_free_pages(flags, order);
 }
 
-enum dma_cache_op {
-       DMA_UNMAP,
-       DMA_MAP,
-};
 static bool hypercall_cflush = false;
 
-/* functions called by SWIOTLB */
-
-static void dma_cache_maint(dma_addr_t handle, unsigned long offset,
-	size_t size, enum dma_data_direction dir, enum dma_cache_op op)
+/* buffers in highmem or foreign pages cannot cross page boundaries */
+static void dma_cache_maint(dma_addr_t handle, size_t size, u32 op)
 {
 	struct gnttab_cache_flush cflush;
-	unsigned long xen_pfn;
-	size_t left = size;
 
-	xen_pfn = (handle >> XEN_PAGE_SHIFT) + offset / XEN_PAGE_SIZE;
-	offset %= XEN_PAGE_SIZE;
+	cflush.a.dev_bus_addr = handle & XEN_PAGE_MASK;
+	cflush.offset = xen_offset_in_page(handle);
+	cflush.op = op;
 
 	do {
-		size_t len = left;
-	
-		/* buffers in highmem or foreign pages cannot cross page
-		 * boundaries */
-		if (len + offset > XEN_PAGE_SIZE)
-			len = XEN_PAGE_SIZE - offset;
-
-		cflush.op = 0;
-		cflush.a.dev_bus_addr = xen_pfn << XEN_PAGE_SHIFT;
-		cflush.offset = offset;
-		cflush.length = len;
-
-		if (op == DMA_UNMAP && dir != DMA_TO_DEVICE)
-			cflush.op = GNTTAB_CACHE_INVAL;
-		if (op == DMA_MAP) {
-			if (dir == DMA_FROM_DEVICE)
-				cflush.op = GNTTAB_CACHE_INVAL;
-			else
-				cflush.op = GNTTAB_CACHE_CLEAN;
-		}
-		if (cflush.op)
-			HYPERVISOR_grant_table_op(GNTTABOP_cache_flush, &cflush, 1);
+		if (size + cflush.offset > XEN_PAGE_SIZE)
+			cflush.length = XEN_PAGE_SIZE - cflush.offset;
+		else
+			cflush.length = size;
+
+		HYPERVISOR_grant_table_op(GNTTABOP_cache_flush, &cflush, 1);
 
-		offset = 0;
-		xen_pfn++;
-		left -= len;
-	} while (left);
+		cflush.offset = 0;
+		cflush.a.dev_bus_addr += cflush.length;
+		size -= cflush.length;
+	} while (size);
 }
 
 static void __xen_dma_page_dev_to_cpu(struct device *hwdev, dma_addr_t handle,
 		size_t size, enum dma_data_direction dir)
 {
-	dma_cache_maint(handle & PAGE_MASK, handle & ~PAGE_MASK, size, dir, DMA_UNMAP);
+	if (dir != DMA_TO_DEVICE)
+		dma_cache_maint(handle, size, GNTTAB_CACHE_INVAL);
 }
 
 static void __xen_dma_page_cpu_to_dev(struct device *hwdev, dma_addr_t handle,
 		size_t size, enum dma_data_direction dir)
 {
-	dma_cache_maint(handle & PAGE_MASK, handle & ~PAGE_MASK, size, dir, DMA_MAP);
+	if (dir == DMA_FROM_DEVICE)
+		dma_cache_maint(handle, size, GNTTAB_CACHE_INVAL);
+	else
+		dma_cache_maint(handle, size, GNTTAB_CACHE_CLEAN);
 }
 
 void __xen_dma_map_page(struct device *hwdev, struct page *page,
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
