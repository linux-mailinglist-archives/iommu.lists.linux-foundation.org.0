Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D83C4E48A7
	for <lists.iommu@lfdr.de>; Tue, 22 Mar 2022 22:52:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB6F14188C;
	Tue, 22 Mar 2022 21:52:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mj4BYdjaos9B; Tue, 22 Mar 2022 21:52:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id A2FD54188B;
	Tue, 22 Mar 2022 21:52:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7FE01C0073;
	Tue, 22 Mar 2022 21:52:36 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 42FA8C000B
 for <iommu@lists.linux-foundation.org>; Tue, 22 Mar 2022 21:52:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2A9BE848A0
 for <iommu@lists.linux-foundation.org>; Tue, 22 Mar 2022 21:52:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linux-foundation.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cK4TP1O-v6_b for <iommu@lists.linux-foundation.org>;
 Tue, 22 Mar 2022 21:52:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C96918489A
 for <iommu@lists.linux-foundation.org>; Tue, 22 Mar 2022 21:52:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B6599B81DAC;
 Tue, 22 Mar 2022 21:43:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 737AFC340EC;
 Tue, 22 Mar 2022 21:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1647985401;
 bh=JbxjnACt75jLJ1na1EB5yAF54JD2P6L7KwOtRJMAY78=;
 h=Date:To:From:In-Reply-To:Subject:From;
 b=RAXwG0t4EXQ2J8tNHurQmNhTnwvRa2eh1l/H8FF8gY8m61cR0ukWzfVPRCfIyCTdk
 7Khhrc2gq//r072gYTT9NpqX3gvljKFSW/fpu0u2FMxAjwk/El2NRGkSxvaim4sISr
 xX8VyHfVt2JPw420GWj+TKww8ZPjli+2sX5xqwg8=
Date: Tue, 22 Mar 2022 14:43:20 -0700
To: ziy@nvidia.com, vbabka@suse.cz, robin.murphy@arm.com, robh+dt@kernel.org,
 paulus@samba.org, m.szyprowski@samsung.com, mst@redhat.com, mpe@ellerman.id.au,
 minchan@kernel.org, iommu@lists.linux-foundation.org, hch@lst.de,
 frowand.list@gmail.com, benh@kernel.crashing.org, aneesh.kumar@linux.ibm.com,
 david@redhat.com, akpm@linux-foundation.org, patches@lists.linux.dev,
 linux-mm@kvack.org, mm-commits@vger.kernel.org, torvalds@linux-foundation.org,
 akpm@linux-foundation.org
From: Andrew Morton <akpm@linux-foundation.org>
In-Reply-To: <20220322143803.04a5e59a07e48284f196a2f9@linux-foundation.org>
Subject: [patch 095/227] mm: enforce pageblock_order < MAX_ORDER
Message-Id: <20220322214321.737AFC340EC@smtp.kernel.org>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

From: David Hildenbrand <david@redhat.com>
Subject: mm: enforce pageblock_order < MAX_ORDER

Some places in the kernel don't really expect pageblock_order >=
MAX_ORDER, and it looks like this is only possible in corner cases:

1) CONFIG_DEFERRED_STRUCT_PAGE_INIT we'll end up freeing pageblock_order
   pages via __free_pages_core(), which cannot possibly work.

2) find_zone_movable_pfns_for_nodes() will roundup the ZONE_MOVABLE
   start PFN to MAX_ORDER_NR_PAGES. Consequently with a bigger
   pageblock_order, we could have a single pageblock partially managed by
   two zones.

3) compaction code runs into __fragmentation_index() with order
   >= MAX_ORDER, when checking WARN_ON_ONCE(order >= MAX_ORDER). [1]

4) mm/page_reporting.c won't be reporting any pages with default
   page_reporting_order == pageblock_order, as we'll be skipping the
   reporting loop inside page_reporting_process_zone().

5) __rmqueue_fallback() will never be able to steal with
   ALLOC_NOFRAGMENT.

pageblock_order >= MAX_ORDER is weird either way: it's a pure optimization
for making alloc_contig_range(), as used for allcoation of gigantic pages,
a little more reliable to succeed.  However, if there is demand for
somewhat reliable allocation of gigantic pages, affected setups should be
using CMA or boottime allocations instead.

So let's make sure that pageblock_order < MAX_ORDER and simplify.

[1] https://lkml.kernel.org/r/87r189a2ks.fsf@linux.ibm.com

Link: https://lkml.kernel.org/r/20220214174132.219303-3-david@redhat.com
Signed-off-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Zi Yan <ziy@nvidia.com>
Cc: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Frank Rowand <frowand.list@gmail.com>
Cc: John Garry via iommu <iommu@lists.linux-foundation.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Minchan Kim <minchan@kernel.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 drivers/virtio/virtio_mem.c     |    9 ++------
 include/linux/cma.h             |    3 --
 include/linux/pageblock-flags.h |    7 ++++--
 mm/Kconfig                      |    3 ++
 mm/page_alloc.c                 |   32 +++++++-----------------------
 5 files changed, 20 insertions(+), 34 deletions(-)

--- a/drivers/virtio/virtio_mem.c~mm-enforce-pageblock_order-max_order
+++ a/drivers/virtio/virtio_mem.c
@@ -2476,13 +2476,10 @@ static int virtio_mem_init_hotplug(struc
 				      VIRTIO_MEM_DEFAULT_OFFLINE_THRESHOLD);
 
 	/*
-	 * We want subblocks to span at least MAX_ORDER_NR_PAGES and
-	 * pageblock_nr_pages pages. This:
-	 * - Is required for now for alloc_contig_range() to work reliably -
-	 *   it doesn't properly handle smaller granularity on ZONE_NORMAL.
+	 * TODO: once alloc_contig_range() works reliably with pageblock
+	 * granularity on ZONE_NORMAL, use pageblock_nr_pages instead.
 	 */
-	sb_size = max_t(uint64_t, MAX_ORDER_NR_PAGES,
-			pageblock_nr_pages) * PAGE_SIZE;
+	sb_size = PAGE_SIZE * MAX_ORDER_NR_PAGES;
 	sb_size = max_t(uint64_t, vm->device_block_size, sb_size);
 
 	if (sb_size < memory_block_size_bytes() && !force_bbm) {
--- a/include/linux/cma.h~mm-enforce-pageblock_order-max_order
+++ a/include/linux/cma.h
@@ -25,8 +25,7 @@
  * -- can deal with only some pageblocks of a higher-order page being
  *  MIGRATE_CMA, we can use pageblock_nr_pages.
  */
-#define CMA_MIN_ALIGNMENT_PAGES max_t(phys_addr_t, MAX_ORDER_NR_PAGES, \
-				      pageblock_nr_pages)
+#define CMA_MIN_ALIGNMENT_PAGES MAX_ORDER_NR_PAGES
 #define CMA_MIN_ALIGNMENT_BYTES (PAGE_SIZE * CMA_MIN_ALIGNMENT_PAGES)
 
 struct cma;
--- a/include/linux/pageblock-flags.h~mm-enforce-pageblock_order-max_order
+++ a/include/linux/pageblock-flags.h
@@ -37,8 +37,11 @@ extern unsigned int pageblock_order;
 
 #else /* CONFIG_HUGETLB_PAGE_SIZE_VARIABLE */
 
-/* Huge pages are a constant size */
-#define pageblock_order		HUGETLB_PAGE_ORDER
+/*
+ * Huge pages are a constant size, but don't exceed the maximum allocation
+ * granularity.
+ */
+#define pageblock_order		min_t(unsigned int, HUGETLB_PAGE_ORDER, MAX_ORDER - 1)
 
 #endif /* CONFIG_HUGETLB_PAGE_SIZE_VARIABLE */
 
--- a/mm/Kconfig~mm-enforce-pageblock_order-max_order
+++ a/mm/Kconfig
@@ -262,6 +262,9 @@ config HUGETLB_PAGE_SIZE_VARIABLE
 	  HUGETLB_PAGE_ORDER when there are multiple HugeTLB page sizes available
 	  on a platform.
 
+	  Note that the pageblock_order cannot exceed MAX_ORDER - 1 and will be
+	  clamped down to MAX_ORDER - 1.
+
 config CONTIG_ALLOC
 	def_bool (MEMORY_ISOLATION && COMPACTION) || CMA
 
--- a/mm/page_alloc.c~mm-enforce-pageblock_order-max_order
+++ a/mm/page_alloc.c
@@ -1072,14 +1072,12 @@ static inline void __free_one_page(struc
 		int migratetype, fpi_t fpi_flags)
 {
 	struct capture_control *capc = task_capc(zone);
+	unsigned int max_order = pageblock_order;
 	unsigned long buddy_pfn;
 	unsigned long combined_pfn;
-	unsigned int max_order;
 	struct page *buddy;
 	bool to_tail;
 
-	max_order = min_t(unsigned int, MAX_ORDER - 1, pageblock_order);
-
 	VM_BUG_ON(!zone_is_initialized(zone));
 	VM_BUG_ON_PAGE(page->flags & PAGE_FLAGS_CHECK_AT_PREP, page);
 
@@ -2259,19 +2257,8 @@ void __init init_cma_reserved_pageblock(
 	} while (++p, --i);
 
 	set_pageblock_migratetype(page, MIGRATE_CMA);
-
-	if (pageblock_order >= MAX_ORDER) {
-		i = pageblock_nr_pages;
-		p = page;
-		do {
-			set_page_refcounted(p);
-			__free_pages(p, MAX_ORDER - 1);
-			p += MAX_ORDER_NR_PAGES;
-		} while (i -= MAX_ORDER_NR_PAGES);
-	} else {
-		set_page_refcounted(page);
-		__free_pages(page, pageblock_order);
-	}
+	set_page_refcounted(page);
+	__free_pages(page, pageblock_order);
 
 	adjust_managed_page_count(page, pageblock_nr_pages);
 	page_zone(page)->cma_pages += pageblock_nr_pages;
@@ -7382,16 +7369,15 @@ static inline void setup_usemap(struct z
 /* Initialise the number of pages represented by NR_PAGEBLOCK_BITS */
 void __init set_pageblock_order(void)
 {
-	unsigned int order;
+	unsigned int order = MAX_ORDER - 1;
 
 	/* Check that pageblock_nr_pages has not already been setup */
 	if (pageblock_order)
 		return;
 
-	if (HPAGE_SHIFT > PAGE_SHIFT)
+	/* Don't let pageblocks exceed the maximum allocation granularity. */
+	if (HPAGE_SHIFT > PAGE_SHIFT && HUGETLB_PAGE_ORDER < order)
 		order = HUGETLB_PAGE_ORDER;
-	else
-		order = MAX_ORDER - 1;
 
 	/*
 	 * Assume the largest contiguous order of interest is a huge page.
@@ -8979,14 +8965,12 @@ struct page *has_unmovable_pages(struct
 #ifdef CONFIG_CONTIG_ALLOC
 static unsigned long pfn_max_align_down(unsigned long pfn)
 {
-	return pfn & ~(max_t(unsigned long, MAX_ORDER_NR_PAGES,
-			     pageblock_nr_pages) - 1);
+	return ALIGN_DOWN(pfn, MAX_ORDER_NR_PAGES);
 }
 
 static unsigned long pfn_max_align_up(unsigned long pfn)
 {
-	return ALIGN(pfn, max_t(unsigned long, MAX_ORDER_NR_PAGES,
-				pageblock_nr_pages));
+	return ALIGN(pfn, MAX_ORDER_NR_PAGES);
 }
 
 #if defined(CONFIG_DYNAMIC_DEBUG) || \
_
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
