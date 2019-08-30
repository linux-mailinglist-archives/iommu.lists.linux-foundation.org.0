Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFF0A2FF6
	for <lists.iommu@lfdr.de>; Fri, 30 Aug 2019 08:31:34 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5EC205BE9;
	Fri, 30 Aug 2019 06:31:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id AB6AB5BDD
	for <iommu@lists.linux-foundation.org>;
	Fri, 30 Aug 2019 06:29:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 5832813A
	for <iommu@lists.linux-foundation.org>;
	Fri, 30 Aug 2019 06:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Sn/QnlX0rzEihI8HOssDpQ+pS1nF5+oT1o59+Mon2VE=;
	b=olmX6PFWaRCNDeJRTc5ka9YH2y
	XXCmdUKALA1NTuT0dtoXbnlJ9dNkn8+by+C49GsXU2agUVxgZTgTL5dBH5BUGJo4qfQO4B8Zk9XUs
	TWMm4gqIDq9p9UJBw15uS9ptf7dFIVbdr+4Pvt5Snzx+WsH6r63jHfo7i9baTeQewLbKKmq6hJOnh
	tX5bIp8RCcwLgTfStdgPphKMtoW8aHnE2ontZr3OHksEtjKVniMgTBrCIhLbmxz6/3+MEuduEv7AY
	dhsPK6CrhXLDXjEv3lEJ3GndzUttSUc5u3IV8AsMTI8tfuwFy0HZXHxKm/RTkO3j5fgqgDGrfxJqs
	iKZMjMuQ==;
Received: from [93.83.86.253] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
	id 1i3aPj-0002vk-8g; Fri, 30 Aug 2019 06:29:40 +0000
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org
Subject: [PATCH 4/4] arm: remove wrappers for the generic dma remap helpers
Date: Fri, 30 Aug 2019 08:29:24 +0200
Message-Id: <20190830062924.21714-5-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190830062924.21714-1-hch@lst.de>
References: <20190830062924.21714-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_MED,
	SUSPICIOUS_RECIPS autolearn=no version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-xtensa@linux-xtensa.org, linux-kernel@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>, linux-mm@kvack.org,
	Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
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

Remove a few tiny wrappers around the generic dma remap code.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/arm/mm/dma-mapping.c | 32 +++++---------------------------
 1 file changed, 5 insertions(+), 27 deletions(-)

diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
index d07e5c865557..8cb57f1664b2 100644
--- a/arch/arm/mm/dma-mapping.c
+++ b/arch/arm/mm/dma-mapping.c
@@ -336,18 +336,6 @@ static void *__alloc_remap_buffer(struct device *dev, size_t size, gfp_t gfp,
 				 pgprot_t prot, struct page **ret_page,
 				 const void *caller, bool want_vaddr);
 
-static void *
-__dma_alloc_remap(struct page *page, size_t size, gfp_t gfp, pgprot_t prot,
-	const void *caller)
-{
-	return dma_common_contiguous_remap(page, size, prot, caller);
-}
-
-static void __dma_free_remap(void *cpu_addr, size_t size)
-{
-	dma_common_free_remap(cpu_addr, size);
-}
-
 #define DEFAULT_DMA_COHERENT_POOL_SIZE	SZ_256K
 static struct gen_pool *atomic_pool __ro_after_init;
 
@@ -503,7 +491,7 @@ static void *__alloc_remap_buffer(struct device *dev, size_t size, gfp_t gfp,
 	if (!want_vaddr)
 		goto out;
 
-	ptr = __dma_alloc_remap(page, size, gfp, prot, caller);
+	ptr = dma_common_contiguous_remap(page, size, prot, caller);
 	if (!ptr) {
 		__dma_free_buffer(page, size);
 		return NULL;
@@ -570,7 +558,7 @@ static void *__alloc_from_contiguous(struct device *dev, size_t size,
 		goto out;
 
 	if (PageHighMem(page)) {
-		ptr = __dma_alloc_remap(page, size, GFP_KERNEL, prot, caller);
+		ptr = dma_common_contiguous_remap(page, size, prot, caller);
 		if (!ptr) {
 			dma_release_from_contiguous(dev, page, count);
 			return NULL;
@@ -590,7 +578,7 @@ static void __free_from_contiguous(struct device *dev, struct page *page,
 {
 	if (want_vaddr) {
 		if (PageHighMem(page))
-			__dma_free_remap(cpu_addr, size);
+			dma_common_free_remap(cpu_addr, size);
 		else
 			__dma_remap(page, size, PAGE_KERNEL);
 	}
@@ -682,7 +670,7 @@ static void *remap_allocator_alloc(struct arm_dma_alloc_args *args,
 static void remap_allocator_free(struct arm_dma_free_args *args)
 {
 	if (args->want_vaddr)
-		__dma_free_remap(args->cpu_addr, args->size);
+		dma_common_free_remap(args->cpu_addr, args->size);
 
 	__dma_free_buffer(args->page, args->size);
 }
@@ -1365,16 +1353,6 @@ static int __iommu_free_buffer(struct device *dev, struct page **pages,
 	return 0;
 }
 
-/*
- * Create a CPU mapping for a specified pages
- */
-static void *
-__iommu_alloc_remap(struct page **pages, size_t size, gfp_t gfp, pgprot_t prot,
-		    const void *caller)
-{
-	return dma_common_pages_remap(pages, size, prot, caller);
-}
-
 /*
  * Create a mapping in device IO address space for specified pages
  */
@@ -1526,7 +1504,7 @@ static void *__arm_iommu_alloc_attrs(struct device *dev, size_t size,
 	if (attrs & DMA_ATTR_NO_KERNEL_MAPPING)
 		return pages;
 
-	addr = __iommu_alloc_remap(pages, size, gfp, prot,
+	addr = dma_common_pages_remap(pages, size, prot,
 				   __builtin_return_address(0));
 	if (!addr)
 		goto err_mapping;
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
