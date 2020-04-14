Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id D057A1A7C34
	for <lists.iommu@lfdr.de>; Tue, 14 Apr 2020 15:15:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 6CE6620762;
	Tue, 14 Apr 2020 13:15:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YpJ2Kv4q0yZu; Tue, 14 Apr 2020 13:15:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id EFBAF20535;
	Tue, 14 Apr 2020 13:15:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DC8FEC0172;
	Tue, 14 Apr 2020 13:15:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 25569C0172
 for <iommu@lists.linux-foundation.org>; Tue, 14 Apr 2020 13:15:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 1F93B860FF
 for <iommu@lists.linux-foundation.org>; Tue, 14 Apr 2020 13:15:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rCIHMzum5cB9 for <iommu@lists.linux-foundation.org>;
 Tue, 14 Apr 2020 13:15:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 93DAC85B5D
 for <iommu@lists.linux-foundation.org>; Tue, 14 Apr 2020 13:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=4ea5vsXJHOIJ4irJzF3v/kw19HEG5lklgexzNgWZ/1E=; b=Ti3ffasGFdJfP7AhXGeAZ/PYTk
 43AUQ1PSFQAZ7WGZ/VBVgxH/nNZxJgXAZj/yyuu3G93ZCLztJ2CBv3xmZV79CqVGwV498jT02i9WW
 BGTGLelScsgzrM52iMp9MW4B23C+J/o8VApAuCOFOWUzwQLfAlrUCTz724PYhJPxI2emn+NQ4uqMi
 htQVEyeUDMlWfXZtUztV0oKj+Br/dY2zJOaS8Xfg/GZ337f8nx6Lrn6ZtJP2irUgteZJ1pUsRBadO
 b29OU9+KR/DsBLAr3LbRvma+3vCNDe2phUCJKZiZXL980yGD1UNRONHtagJGsws//MdDfhiowtE2z
 m3682ViQ==;
Received: from [2001:4bb8:180:384b:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOLOe-0006ns-BO; Tue, 14 Apr 2020 13:14:37 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 x86@kernel.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Laura Abbott <labbott@redhat.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Minchan Kim <minchan@kernel.org>, Nitin Gupta <ngupta@vflare.org>
Subject: [PATCH 13/29] mm: remove vmap_page_range_noflush and vunmap_page_range
Date: Tue, 14 Apr 2020 15:13:32 +0200
Message-Id: <20200414131348.444715-14-hch@lst.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200414131348.444715-1-hch@lst.de>
References: <20200414131348.444715-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, linux-arch@vger.kernel.org,
 linux-hyperv@vger.kernel.org, linux-s390@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org, bpf@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
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

These have non-static aliases called map_kernel_range_noflush and
unmap_kernel_range_noflush that just differ slightly in the calling
conventions that pass addr + size instead of an end.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 mm/vmalloc.c | 98 +++++++++++++++++++++-------------------------------
 1 file changed, 40 insertions(+), 58 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index aada9e9144bd..55df5dc6a9fc 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -127,10 +127,24 @@ static void vunmap_p4d_range(pgd_t *pgd, unsigned long addr, unsigned long end)
 	} while (p4d++, addr = next, addr != end);
 }
 
-static void vunmap_page_range(unsigned long addr, unsigned long end)
+/**
+ * unmap_kernel_range_noflush - unmap kernel VM area
+ * @addr: start of the VM area to unmap
+ * @size: size of the VM area to unmap
+ *
+ * Unmap PFN_UP(@size) pages at @addr.  The VM area @addr and @size specify
+ * should have been allocated using get_vm_area() and its friends.
+ *
+ * NOTE:
+ * This function does NOT do any cache flushing.  The caller is responsible
+ * for calling flush_cache_vunmap() on to-be-mapped areas before calling this
+ * function and flush_tlb_kernel_range() after.
+ */
+void unmap_kernel_range_noflush(unsigned long addr, unsigned long size)
 {
-	pgd_t *pgd;
+	unsigned long end = addr + size;
 	unsigned long next;
+	pgd_t *pgd;
 
 	BUG_ON(addr >= end);
 	pgd = pgd_offset_k(addr);
@@ -219,18 +233,30 @@ static int vmap_p4d_range(pgd_t *pgd, unsigned long addr,
 	return 0;
 }
 
-/*
- * Set up page tables in kva (addr, end). The ptes shall have prot "prot", and
- * will have pfns corresponding to the "pages" array.
+/**
+ * map_kernel_range_noflush - map kernel VM area with the specified pages
+ * @addr: start of the VM area to map
+ * @size: size of the VM area to map
+ * @prot: page protection flags to use
+ * @pages: pages to map
  *
- * Ie. pte at addr+N*PAGE_SIZE shall point to pfn corresponding to pages[N]
+ * Map PFN_UP(@size) pages at @addr.  The VM area @addr and @size specify should
+ * have been allocated using get_vm_area() and its friends.
+ *
+ * NOTE:
+ * This function does NOT do any cache flushing.  The caller is responsible for
+ * calling flush_cache_vmap() on to-be-mapped areas before calling this
+ * function.
+ *
+ * RETURNS:
+ * The number of pages mapped on success, -errno on failure.
  */
-static int vmap_page_range_noflush(unsigned long start, unsigned long end,
-				   pgprot_t prot, struct page **pages)
+int map_kernel_range_noflush(unsigned long addr, unsigned long size,
+			     pgprot_t prot, struct page **pages)
 {
-	pgd_t *pgd;
+	unsigned long end = addr + size;
 	unsigned long next;
-	unsigned long addr = start;
+	pgd_t *pgd;
 	int err = 0;
 	int nr = 0;
 
@@ -251,7 +277,7 @@ static int vmap_page_range(unsigned long start, unsigned long end,
 {
 	int ret;
 
-	ret = vmap_page_range_noflush(start, end, prot, pages);
+	ret = map_kernel_range_noflush(start, end - start, prot, pages);
 	flush_cache_vmap(start, end);
 	return ret;
 }
@@ -1226,7 +1252,7 @@ EXPORT_SYMBOL_GPL(unregister_vmap_purge_notifier);
  */
 static void unmap_vmap_area(struct vmap_area *va)
 {
-	vunmap_page_range(va->va_start, va->va_end);
+	unmap_kernel_range_noflush(va->va_start, va->va_end - va->va_start);
 }
 
 /*
@@ -1686,7 +1712,7 @@ static void vb_free(unsigned long addr, unsigned long size)
 	rcu_read_unlock();
 	BUG_ON(!vb);
 
-	vunmap_page_range(addr, addr + size);
+	unmap_kernel_range_noflush(addr, size);
 
 	if (debug_pagealloc_enabled_static())
 		flush_tlb_kernel_range(addr, addr + size);
@@ -1984,50 +2010,6 @@ void __init vmalloc_init(void)
 	vmap_initialized = true;
 }
 
-/**
- * map_kernel_range_noflush - map kernel VM area with the specified pages
- * @addr: start of the VM area to map
- * @size: size of the VM area to map
- * @prot: page protection flags to use
- * @pages: pages to map
- *
- * Map PFN_UP(@size) pages at @addr.  The VM area @addr and @size
- * specify should have been allocated using get_vm_area() and its
- * friends.
- *
- * NOTE:
- * This function does NOT do any cache flushing.  The caller is
- * responsible for calling flush_cache_vmap() on to-be-mapped areas
- * before calling this function.
- *
- * RETURNS:
- * The number of pages mapped on success, -errno on failure.
- */
-int map_kernel_range_noflush(unsigned long addr, unsigned long size,
-			     pgprot_t prot, struct page **pages)
-{
-	return vmap_page_range_noflush(addr, addr + size, prot, pages);
-}
-
-/**
- * unmap_kernel_range_noflush - unmap kernel VM area
- * @addr: start of the VM area to unmap
- * @size: size of the VM area to unmap
- *
- * Unmap PFN_UP(@size) pages at @addr.  The VM area @addr and @size
- * specify should have been allocated using get_vm_area() and its
- * friends.
- *
- * NOTE:
- * This function does NOT do any cache flushing.  The caller is
- * responsible for calling flush_cache_vunmap() on to-be-mapped areas
- * before calling this function and flush_tlb_kernel_range() after.
- */
-void unmap_kernel_range_noflush(unsigned long addr, unsigned long size)
-{
-	vunmap_page_range(addr, addr + size);
-}
-
 /**
  * unmap_kernel_range - unmap kernel VM area and flush cache and TLB
  * @addr: start of the VM area to unmap
@@ -2041,7 +2023,7 @@ void unmap_kernel_range(unsigned long addr, unsigned long size)
 	unsigned long end = addr + size;
 
 	flush_cache_vunmap(addr, end);
-	vunmap_page_range(addr, end);
+	unmap_kernel_range_noflush(addr, size);
 	flush_tlb_kernel_range(addr, end);
 }
 
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
