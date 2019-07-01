Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 8945110C02
	for <lists.iommu@lfdr.de>; Wed,  1 May 2019 19:30:17 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5D4472AF0;
	Wed,  1 May 2019 17:30:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A30CF2B35
	for <iommu@lists.linux-foundation.org>;
	Wed,  1 May 2019 17:29:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id D86D7711
	for <iommu@lists.linux-foundation.org>;
	Wed,  1 May 2019 17:29:31 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2407)
	id 09DA468AFE; Wed,  1 May 2019 19:29:12 +0200 (CEST)
Date: Wed, 1 May 2019 19:29:12 +0200
From: Christoph Hellwig <hch@lst.de>
To: Paul Burton <paul.burton@mips.com>
Subject: Re: [PATCH 4/7] dma-direct: provide generic support for uncached
	kernel segments
Message-ID: <20190501172912.GA19375@lst.de>
References: <20190430110032.25301-1-hch@lst.de>
	<20190430110032.25301-5-hch@lst.de>
	<20190501171857.chfxqntvm6r4xrr4@pburton-laptop>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="ew6BAiZeqk4r7MaW"
Content-Disposition: inline
In-Reply-To: <20190501171857.chfxqntvm6r4xrr4@pburton-laptop>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Michal Simek <monstr@monstr.eu>,
	Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
	James Hogan <jhogan@kernel.org>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	Ralf Baechle <ralf@linux-mips.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
	"linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
	Ley Foon Tan <lftan@altera.com>, Christoph Hellwig <hch@lst.de>
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org


--ew6BAiZeqk4r7MaW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 01, 2019 at 05:18:59PM +0000, Paul Burton wrote:
> I'm not so sure about this part though.
> 
> On MIPS we currently don't clear the allocated memory with memset. Is
> doing that really necessary?

We are clearling it on mips, it is inside dma_direct_alloc_pages.

> If it is necessary then as-is this code will clear the allocated memory
> using uncached writes which will be pretty slow. It would be much more
> efficient to perform the memset before arch_dma_prep_coherent() & before
> converting ret to an uncached address.

Yes, we could do that.

--ew6BAiZeqk4r7MaW
Content-Type: text/x-patch; charset=us-ascii
Content-Disposition: attachment; filename="0001-dma-direct-provide-generic-support-for-uncached-kern.patch"

From 247ca658ebeb7c8d04918747ec8a0da45c36bcb8 Mon Sep 17 00:00:00 2001
From: Christoph Hellwig <hch@lst.de>
Date: Sun, 28 Apr 2019 13:23:26 -0500
Subject: dma-direct: provide generic support for uncached kernel segments

A few architectures support uncached kernel segments.  In that case we get
an uncached mapping for a given physica address by using an offset in the
uncached segement.  Implement support for this scheme in the generic
dma-direct code instead of duplicating it in arch hooks.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/Kconfig                    |  8 ++++++++
 include/linux/dma-noncoherent.h |  3 +++
 kernel/dma/direct.c             | 17 +++++++++++++++--
 3 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 33687dddd86a..ea22a8c894ec 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -249,6 +249,14 @@ config ARCH_HAS_FORTIFY_SOURCE
 config ARCH_HAS_SET_MEMORY
 	bool
 
+#
+# Select if arch has an uncached kernel segment and provides the
+# uncached_kernel_address / cached_kernel_address symbols to use it
+#
+config ARCH_HAS_UNCACHED_SEGMENT
+	select ARCH_HAS_DMA_PREP_COHERENT
+	bool
+
 # Select if arch init_task must go in the __init_task_data section
 config ARCH_TASK_STRUCT_ON_STACK
        bool
diff --git a/include/linux/dma-noncoherent.h b/include/linux/dma-noncoherent.h
index 9741767e400f..7e0126a04e02 100644
--- a/include/linux/dma-noncoherent.h
+++ b/include/linux/dma-noncoherent.h
@@ -80,4 +80,7 @@ static inline void arch_dma_prep_coherent(struct page *page, size_t size)
 }
 #endif /* CONFIG_ARCH_HAS_DMA_PREP_COHERENT */
 
+void *uncached_kernel_address(void *addr);
+void *cached_kernel_address(void *addr);
+
 #endif /* _LINUX_DMA_NONCOHERENT_H */
diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index 2c2772e9702a..6688e1cee7d1 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -171,6 +171,13 @@ void *dma_direct_alloc_pages(struct device *dev, size_t size,
 		*dma_handle = phys_to_dma(dev, page_to_phys(page));
 	}
 	memset(ret, 0, size);
+
+	if (IS_ENABLED(CONFIG_ARCH_HAS_UNCACHED_SEGMENT) &&
+	    !dev_is_dma_coherent(dev) && !(attrs & DMA_ATTR_NON_CONSISTENT)) {
+		arch_dma_prep_coherent(page, size);
+		ret = uncached_kernel_address(ret);
+	}
+
 	return ret;
 }
 
@@ -189,13 +196,18 @@ void dma_direct_free_pages(struct device *dev, size_t size, void *cpu_addr,
 
 	if (force_dma_unencrypted())
 		set_memory_encrypted((unsigned long)cpu_addr, 1 << page_order);
+
+	if (IS_ENABLED(CONFIG_ARCH_HAS_UNCACHED_SEGMENT) &&
+	    !dev_is_dma_coherent(dev) && !(attrs & DMA_ATTR_NON_CONSISTENT))
+		cpu_addr = cached_kernel_address(cpu_addr);
 	__dma_direct_free_pages(dev, size, virt_to_page(cpu_addr));
 }
 
 void *dma_direct_alloc(struct device *dev, size_t size,
 		dma_addr_t *dma_handle, gfp_t gfp, unsigned long attrs)
 {
-	if (!dev_is_dma_coherent(dev))
+	if (!IS_ENABLED(CONFIG_ARCH_HAS_UNCACHED_SEGMENT) &&
+	    !dev_is_dma_coherent(dev))
 		return arch_dma_alloc(dev, size, dma_handle, gfp, attrs);
 	return dma_direct_alloc_pages(dev, size, dma_handle, gfp, attrs);
 }
@@ -203,7 +215,8 @@ void *dma_direct_alloc(struct device *dev, size_t size,
 void dma_direct_free(struct device *dev, size_t size,
 		void *cpu_addr, dma_addr_t dma_addr, unsigned long attrs)
 {
-	if (!dev_is_dma_coherent(dev))
+	if (!IS_ENABLED(CONFIG_ARCH_HAS_UNCACHED_SEGMENT) &&
+	    !dev_is_dma_coherent(dev))
 		arch_dma_free(dev, size, cpu_addr, dma_addr, attrs);
 	else
 		dma_direct_free_pages(dev, size, cpu_addr, dma_addr, attrs);
-- 
2.20.1


--ew6BAiZeqk4r7MaW
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
--ew6BAiZeqk4r7MaW--
