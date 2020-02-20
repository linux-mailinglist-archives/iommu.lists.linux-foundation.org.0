Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 750301663B8
	for <lists.iommu@lfdr.de>; Thu, 20 Feb 2020 18:02:06 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 28E9721539;
	Thu, 20 Feb 2020 17:02:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qeM0QP4bX9pN; Thu, 20 Feb 2020 17:02:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 1336921537;
	Thu, 20 Feb 2020 17:02:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0DA7EC013E;
	Thu, 20 Feb 2020 17:02:04 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 95D58C013E
 for <iommu@lists.linux-foundation.org>; Thu, 20 Feb 2020 17:02:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 8E11887A3A
 for <iommu@lists.linux-foundation.org>; Thu, 20 Feb 2020 17:02:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2KxRFnDz+7xE for <iommu@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 17:02:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by hemlock.osuosl.org (Postfix) with ESMTPS id ABF74878A4
 for <iommu@lists.linux-foundation.org>; Thu, 20 Feb 2020 17:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=Alm0sIO2cKq9nLqFFwjI+EFY1p/t5dmqc+YGFpAjkJQ=; b=mb93pfnK476BqDYmOmly6vw245
 IOzZrn5qT0PEib/xfQgornOINIhoFuEi3yJ9doUw6MTajyu9nFKnRQTaM6DSdzmlCzMck4Bt/FgQ5
 B8Rgk0oUEQ7fHvJGO5d5GNGKKK+Pr+fmNrKPu/R9pyrGSsTL5GL0b/LXjz+ypAP47TJ0U75oMVzr+
 pIf9xFQk0c1mrLP1gsSeQRgPRgMHvz9nmB+gxgM3zX73EncGtdl7ssA8ICfYk0fiKFZ3r3kxHLUG6
 KDnETM2QNUa6dpEUvYCzV7B2Po65exI4yiLurokI3WJdnGxo7PsLfdcqQsRao6vqTZUnwkf5froGu
 gu0gpn6w==;
Received: from [38.126.112.138] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4pCl-0000Dm-Gx; Thu, 20 Feb 2020 17:01:39 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>
Subject: [PATCH 1/2] dma-mapping: support setting memory uncached in place
Date: Thu, 20 Feb 2020 09:01:38 -0800
Message-Id: <20200220170139.387354-2-hch@lst.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200220170139.387354-1-hch@lst.de>
References: <20200220170139.387354-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: Mark Rutland <mark.rutland@arm.com>, linux-arch@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, openrisc@lists.librecores.org,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
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

We currently only support remapping memory as uncached through vmap
or a magic uncached segment provided by some architectures.  But there
is a simpler and much better way available on some architectures where
we can just remap the memory in place.  The advantages are:

 1) no aliasing is possible, which prevents speculating into the
    cached alias
 2) there is no need to allocate new ptes and thus no need for a special
    pre-allocated pool of memory that can be used with GFP_ATOMIC DMA
    allocations

The downside is that architectures must provide a way to set arbitrary
pages uncached in the kernel mapping, which might not be possible on
architecture that have a special implicit kernel mapping, and requires
splitting of huge page kernel mappings where they exist.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/linux/dma-noncoherent.h |  3 +++
 kernel/dma/Kconfig              |  8 ++++++++
 kernel/dma/direct.c             | 28 ++++++++++++++++++----------
 3 files changed, 29 insertions(+), 10 deletions(-)

diff --git a/include/linux/dma-noncoherent.h b/include/linux/dma-noncoherent.h
index ca9b5770caee..0820ec58f119 100644
--- a/include/linux/dma-noncoherent.h
+++ b/include/linux/dma-noncoherent.h
@@ -111,4 +111,7 @@ static inline void arch_dma_prep_coherent(struct page *page, size_t size)
 void *uncached_kernel_address(void *addr);
 void *cached_kernel_address(void *addr);
 
+int arch_dma_set_uncached(void *cpu_addr, size_t size);
+void arch_dma_clear_uncached(void *cpu_addr, size_t size);
+
 #endif /* _LINUX_DMA_NONCOHERENT_H */
diff --git a/kernel/dma/Kconfig b/kernel/dma/Kconfig
index 4c103a24e380..7bc0b77f1243 100644
--- a/kernel/dma/Kconfig
+++ b/kernel/dma/Kconfig
@@ -83,6 +83,14 @@ config DMA_DIRECT_REMAP
 	bool
 	select DMA_REMAP
 
+#
+# Should be selected if the architecture can remap memory from the page
+# allocator and CMA as uncached and provides the arch_dma_set_uncached and
+# arch_dma_clear_uncached helpers
+#
+config ARCH_HAS_DMA_SET_UNCACHED
+	bool
+
 config DMA_CMA
 	bool "DMA Contiguous Memory Allocator"
 	depends on HAVE_DMA_CONTIGUOUS && CMA
diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index 6af7ae83c4ad..73fe65a4cbc0 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -169,11 +169,8 @@ void *dma_direct_alloc_pages(struct device *dev, size_t size,
 		ret = dma_common_contiguous_remap(page, PAGE_ALIGN(size),
 				dma_pgprot(dev, PAGE_KERNEL, attrs),
 				__builtin_return_address(0));
-		if (!ret) {
-			dma_free_contiguous(dev, page, size);
-			return ret;
-		}
-
+		if (!ret)
+			goto out_free_pages;
 		memset(ret, 0, size);
 		goto done;
 	}
@@ -186,8 +183,7 @@ void *dma_direct_alloc_pages(struct device *dev, size_t size,
 		 * so log an error and fail.
 		 */
 		dev_info(dev, "Rejecting highmem page from CMA.\n");
-		dma_free_contiguous(dev, page, size);
-		return NULL;
+		goto out_free_pages;
 	}
 
 	ret = page_address(page);
@@ -196,10 +192,15 @@ void *dma_direct_alloc_pages(struct device *dev, size_t size,
 
 	memset(ret, 0, size);
 
-	if (IS_ENABLED(CONFIG_ARCH_HAS_UNCACHED_SEGMENT) &&
-	    dma_alloc_need_uncached(dev, attrs)) {
+	if (dma_alloc_need_uncached(dev, attrs)) {
 		arch_dma_prep_coherent(page, size);
-		ret = uncached_kernel_address(ret);
+
+		if (IS_ENABLED(CONFIG_ARCH_HAS_DMA_SET_UNCACHED)) {
+			if (!arch_dma_set_uncached(ret, size))
+				goto out_free_pages;
+		} else if (IS_ENABLED(CONFIG_ARCH_HAS_UNCACHED_SEGMENT)) {
+			ret = uncached_kernel_address(ret);
+		}
 	}
 done:
 	if (force_dma_unencrypted(dev))
@@ -207,6 +208,9 @@ void *dma_direct_alloc_pages(struct device *dev, size_t size,
 	else
 		*dma_handle = phys_to_dma(dev, page_to_phys(page));
 	return ret;
+out_free_pages:
+	dma_free_contiguous(dev, page, size);
+	return NULL;
 }
 
 void dma_direct_free_pages(struct device *dev, size_t size, void *cpu_addr,
@@ -230,6 +234,8 @@ void dma_direct_free_pages(struct device *dev, size_t size, void *cpu_addr,
 
 	if (IS_ENABLED(CONFIG_DMA_REMAP) && is_vmalloc_addr(cpu_addr))
 		vunmap(cpu_addr);
+	else if (IS_ENABLED(CONFIG_ARCH_HAS_DMA_SET_UNCACHED))
+		arch_dma_clear_uncached(cpu_addr, size);
 
 	dma_free_contiguous(dev, dma_direct_to_page(dev, dma_addr), size);
 }
@@ -238,6 +244,7 @@ void *dma_direct_alloc(struct device *dev, size_t size,
 		dma_addr_t *dma_handle, gfp_t gfp, unsigned long attrs)
 {
 	if (!IS_ENABLED(CONFIG_ARCH_HAS_UNCACHED_SEGMENT) &&
+	    !IS_ENABLED(CONFIG_ARCH_HAS_DMA_SET_UNCACHED) &&
 	    !IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) &&
 	    dma_alloc_need_uncached(dev, attrs))
 		return arch_dma_alloc(dev, size, dma_handle, gfp, attrs);
@@ -248,6 +255,7 @@ void dma_direct_free(struct device *dev, size_t size,
 		void *cpu_addr, dma_addr_t dma_addr, unsigned long attrs)
 {
 	if (!IS_ENABLED(CONFIG_ARCH_HAS_UNCACHED_SEGMENT) &&
+	    !IS_ENABLED(CONFIG_ARCH_HAS_DMA_SET_UNCACHED) &&
 	    !IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) &&
 	    dma_alloc_need_uncached(dev, attrs))
 		arch_dma_free(dev, size, cpu_addr, dma_addr, attrs);
-- 
2.24.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
