Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id C938926A9D7
	for <lists.iommu@lfdr.de>; Tue, 15 Sep 2020 18:33:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3846C87075;
	Tue, 15 Sep 2020 16:33:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SyITWNJOQkPJ; Tue, 15 Sep 2020 16:33:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6FE9387019;
	Tue, 15 Sep 2020 16:33:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5A9D5C089E;
	Tue, 15 Sep 2020 16:33:19 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 617B0C0051
 for <iommu@lists.linux-foundation.org>; Tue, 15 Sep 2020 16:33:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 4FFAB86857
 for <iommu@lists.linux-foundation.org>; Tue, 15 Sep 2020 16:33:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jlnggu3P5kar for <iommu@lists.linux-foundation.org>;
 Tue, 15 Sep 2020 16:33:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 7883586855
 for <iommu@lists.linux-foundation.org>; Tue, 15 Sep 2020 16:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=3uuWATlux5CLwoYUg+NN5gOtHb6T7EXPohKT/lTJKJI=; b=n3p/yVJZRK+wbxyYEp8pkVnF7d
 hOOHcYTdFzo7akNyeet0DZXxccLdgZIoOr6taxspBy/6Nw2HzuudIL5cO3cux/0Ps1kPOPpCaDuiZ
 71xYegixSYfkkcrW3QjKCgmzELBA6x8wDtzWuiR4saDycE2AC35+V5oi4+daZIEjq2ToSWnv4R9cJ
 boT1A66ZJ9G2igo0eQXvpTU9Ka7B0HiUCVukCMermJx4dV3Bpp33w8WLP0t3lZ8ajE4VQW97wGslQ
 7cj3CUwUESH+xL2nh4b2897z9ZoRIetEyG0yjYlRcvvUAz2cF1ga1smN8Gnx/99jq8B/YKpwQ7hY/
 2LJFzrkw==;
Received: from 089144214092.atnat0023.highway.a1.net ([89.144.214.92]
 helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIDt1-0006DO-8d; Tue, 15 Sep 2020 16:32:55 +0000
From: Christoph Hellwig <hch@lst.de>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Ben Skeggs <bskeggs@redhat.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Tomasz Figa <tfiga@chromium.org>,
 Matt Porter <mporter@kernel.crashing.org>, iommu@lists.linux-foundation.org
Subject: [PATCH 18/18] firewire-ohci: use dma_alloc_pages
Date: Tue, 15 Sep 2020 17:51:22 +0200
Message-Id: <20200915155122.1768241-19-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200915155122.1768241-1-hch@lst.de>
References: <20200915155122.1768241-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-mm@kvack.org,
 Stefan Richter <stefanr@s5r6.in-berlin.de>, netdev@vger.kernel.org,
 linux1394-devel@lists.sourceforge.net, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
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

Use dma_alloc_pages to allocate DMAable pages instead of hoping that
the architecture either has GFP_DMA32 or not more than 4G of memory.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/firewire/ohci.c | 26 +++++++++++---------------
 1 file changed, 11 insertions(+), 15 deletions(-)

diff --git a/drivers/firewire/ohci.c b/drivers/firewire/ohci.c
index 020cb15a4d8fcc..9811c40956e54d 100644
--- a/drivers/firewire/ohci.c
+++ b/drivers/firewire/ohci.c
@@ -674,17 +674,16 @@ static void ar_context_link_page(struct ar_context *ctx, unsigned int index)
 
 static void ar_context_release(struct ar_context *ctx)
 {
+	struct device *dev = ctx->ohci->card.device;
 	unsigned int i;
 
 	vunmap(ctx->buffer);
 
-	for (i = 0; i < AR_BUFFERS; i++)
-		if (ctx->pages[i]) {
-			dma_unmap_page(ctx->ohci->card.device,
-				       ar_buffer_bus(ctx, i),
-				       PAGE_SIZE, DMA_FROM_DEVICE);
-			__free_page(ctx->pages[i]);
-		}
+	for (i = 0; i < AR_BUFFERS; i++) {
+		if (ctx->pages[i])
+			dma_free_pages(dev, PAGE_SIZE, ctx->pages[i],
+				       ar_buffer_bus(ctx, i), DMA_FROM_DEVICE);
+	}
 }
 
 static void ar_context_abort(struct ar_context *ctx, const char *error_msg)
@@ -970,6 +969,7 @@ static void ar_context_tasklet(unsigned long data)
 static int ar_context_init(struct ar_context *ctx, struct fw_ohci *ohci,
 			   unsigned int descriptors_offset, u32 regs)
 {
+	struct device *dev = ohci->card.device;
 	unsigned int i;
 	dma_addr_t dma_addr;
 	struct page *pages[AR_BUFFERS + AR_WRAPAROUND_PAGES];
@@ -980,17 +980,13 @@ static int ar_context_init(struct ar_context *ctx, struct fw_ohci *ohci,
 	tasklet_init(&ctx->tasklet, ar_context_tasklet, (unsigned long)ctx);
 
 	for (i = 0; i < AR_BUFFERS; i++) {
-		ctx->pages[i] = alloc_page(GFP_KERNEL | GFP_DMA32);
+		ctx->pages[i] = dma_alloc_pages(dev, PAGE_SIZE, &dma_addr,
+						DMA_FROM_DEVICE, GFP_KERNEL);
 		if (!ctx->pages[i])
 			goto out_of_memory;
-		dma_addr = dma_map_page(ohci->card.device, ctx->pages[i],
-					0, PAGE_SIZE, DMA_FROM_DEVICE);
-		if (dma_mapping_error(ohci->card.device, dma_addr)) {
-			__free_page(ctx->pages[i]);
-			ctx->pages[i] = NULL;
-			goto out_of_memory;
-		}
 		set_page_private(ctx->pages[i], dma_addr);
+		dma_sync_single_for_device(dev, dma_addr, PAGE_SIZE,
+					   DMA_FROM_DEVICE);
 	}
 
 	for (i = 0; i < AR_BUFFERS; i++)
-- 
2.28.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
