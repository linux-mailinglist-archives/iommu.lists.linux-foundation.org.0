Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id F3452F4CF
	for <lists.iommu@lfdr.de>; Tue, 30 Apr 2019 12:55:11 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 95B18FFC;
	Tue, 30 Apr 2019 10:53:58 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp2.linuxfoundation.org (smtp2.linux-foundation.org
	[172.17.192.36])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 4F167F22
	for <iommu@lists.linux-foundation.org>;
	Tue, 30 Apr 2019 10:53:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp2.linuxfoundation.org (Postfix) with ESMTPS id DA98F1DD99
	for <iommu@lists.linux-foundation.org>;
	Tue, 30 Apr 2019 10:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=X3o1n9Pzqxcrw9sMWRtr4ipYyj5gvNmIIWx7+MXIJOA=;
	b=YP501vMZBFiEPPAca77gMbczuo
	8yvBx0l4pQ5mB6cE7quhDeoKGfYBJqJpRwzvC2tYy9x8q8WQTBtd8F3wiG+wjiUgtl95u9XoVr5Ix
	LsYL3rLB+p6riT50CgJSYmw4ppJjglXDa+G9B5AQy8Lrmb6zMeWaDPyD4ili79AmwOT9KuYABC1vp
	HfAvZPZlSRENCp36sWjp5xqJk5PELHEX9D/98ujWNYz+EnnehBKUAa1jTtyMh2/afu2TsXgS7tj8O
	Kqg5U7UgVDv/0fUOVBCR//jwWnigD3uZ4pEgy3x5OuO/kJh7AHDlCEXUuYirFFI6976BK9hMBZH6A
	xUeOZsZg==;
Received: from adsl-173-228-226-134.prtc.net ([173.228.226.134] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hLQO6-00088u-22; Tue, 30 Apr 2019 10:53:26 +0000
From: Christoph Hellwig <hch@lst.de>
To: Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH 22/25] iommu/dma: Don't depend on CONFIG_DMA_DIRECT_REMAP
Date: Tue, 30 Apr 2019 06:52:11 -0400
Message-Id: <20190430105214.24628-23-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190430105214.24628-1-hch@lst.de>
References: <20190430105214.24628-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp2.linux-foundation.org
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
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

For entirely dma coherent architectures there is no requirement to ever
remap dma coherent allocation.  Move all the remap and pool code under
IS_ENABLED() checks and drop the Kconfig dependency.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/Kconfig     |  1 -
 drivers/iommu/dma-iommu.c | 16 +++++++++-------
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index bdc14baf2ee5..6f07f3b21816 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -95,7 +95,6 @@ config IOMMU_DMA
 	select IOMMU_API
 	select IOMMU_IOVA
 	select NEED_SG_DMA_LENGTH
-	depends on DMA_DIRECT_REMAP
 
 config FSL_PAMU
 	bool "Freescale IOMMU support"
diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 9ace9ad73e10..bbd475be567a 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -923,10 +923,11 @@ static void __iommu_dma_free(struct device *dev, size_t size, void *cpu_addr)
 	struct page *page = NULL, **pages = NULL;
 
 	/* Non-coherent atomic allocation? Easy */
-	if (dma_free_from_pool(cpu_addr, alloc_size))
+	if (IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) &&
+	    dma_free_from_pool(cpu_addr, alloc_size))
 		return;
 
-	if (is_vmalloc_addr(cpu_addr)) {
+	if (IS_ENABLED(CONFIG_DMA_REMAP) && is_vmalloc_addr(cpu_addr)) {
 		/*
 		 * If it the address is remapped, then it's either non-coherent
 		 * or highmem CMA, or an iommu_dma_alloc_remap() construction.
@@ -970,7 +971,7 @@ static void *iommu_dma_alloc_pages(struct device *dev, size_t size,
 	if (!page)
 		return NULL;
 
-	if (!coherent || PageHighMem(page)) {
+	if (IS_ENABLED(CONFIG_DMA_REMAP) && (!coherent || PageHighMem(page))) {
 		pgprot_t prot = arch_dma_mmap_pgprot(dev, PAGE_KERNEL, attrs);
 
 		cpu_addr = dma_common_contiguous_remap(page, alloc_size,
@@ -1003,11 +1004,12 @@ static void *iommu_dma_alloc(struct device *dev, size_t size,
 
 	gfp |= __GFP_ZERO;
 
-	if (gfpflags_allow_blocking(gfp) &&
+	if (IS_ENABLED(CONFIG_DMA_REMAP) && gfpflags_allow_blocking(gfp) &&
 	    !(attrs & DMA_ATTR_FORCE_CONTIGUOUS))
 		return iommu_dma_alloc_remap(dev, size, handle, gfp, attrs);
 
-	if (!gfpflags_allow_blocking(gfp) && !coherent)
+	if (IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) &&
+	    !gfpflags_allow_blocking(gfp) && !coherent)
 		cpu_addr = dma_alloc_from_pool(PAGE_ALIGN(size), &page, gfp);
 	else
 		cpu_addr = iommu_dma_alloc_pages(dev, size, &page, gfp, attrs);
@@ -1039,7 +1041,7 @@ static int iommu_dma_mmap(struct device *dev, struct vm_area_struct *vma,
 	if (off >= nr_pages || vma_pages(vma) > nr_pages - off)
 		return -ENXIO;
 
-	if (is_vmalloc_addr(cpu_addr)) {
+	if (IS_ENABLED(CONFIG_DMA_REMAP) && is_vmalloc_addr(cpu_addr)) {
 		struct page **pages = __iommu_dma_get_pages(cpu_addr);
 
 		if (pages)
@@ -1061,7 +1063,7 @@ static int iommu_dma_get_sgtable(struct device *dev, struct sg_table *sgt,
 	struct page *page;
 	int ret;
 
-	if (is_vmalloc_addr(cpu_addr)) {
+	if (IS_ENABLED(CONFIG_DMA_REMAP) && is_vmalloc_addr(cpu_addr)) {
 		struct page **pages = __iommu_dma_get_pages(cpu_addr);
 
 		if (pages) {
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
