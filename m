Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 316474B5C02
	for <lists.iommu@lfdr.de>; Mon, 14 Feb 2022 22:11:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1BE881763;
	Mon, 14 Feb 2022 21:11:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MjC1X3MjBoSu; Mon, 14 Feb 2022 21:11:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id AFF3981496;
	Mon, 14 Feb 2022 21:11:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 832C8C0073;
	Mon, 14 Feb 2022 21:11:40 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F041CC000B
 for <iommu@lists.linux-foundation.org>; Mon, 14 Feb 2022 21:11:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D718140936
 for <iommu@lists.linux-foundation.org>; Mon, 14 Feb 2022 21:11:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linux-foundation.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1Q009W3KIYxo for <iommu@lists.linux-foundation.org>;
 Mon, 14 Feb 2022 21:11:37 +0000 (UTC)
X-Greylist: delayed 00:05:22 by SQLgrey-1.8.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8272D40932
 for <iommu@lists.linux-foundation.org>; Mon, 14 Feb 2022 21:11:37 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 70EB2B8163A;
 Mon, 14 Feb 2022 21:06:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24E2EC340E9;
 Mon, 14 Feb 2022 21:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1644872772;
 bh=iXeebKdEO4+pKuprujYgUiFqguqHs+nhQjFOOvSkarU=;
 h=Date:To:From:Subject:From;
 b=ArCONfzHYA75I0CSuvo9A3JokHlIm089yimKEqvxxPC+SF5QlJ5r5wOaTMoovrx7Q
 yDNiSdMVt5LwM06RL/1WGJ0lFWH7A4gE8PvPfLPBDoV4G6rngARHBQ+YlZblaqmYf8
 7A5jqpzRqLE7h8++/QWuIbjfA96PrvZFyaU4PdU0=
Date: Mon, 14 Feb 2022 13:06:11 -0800
To: mm-commits@vger.kernel.org, ziy@nvidia.com, vbabka@suse.cz,
 robin.murphy@arm.com, robh+dt@kernel.org, paulus@samba.org,
 m.szyprowski@samsung.com, mst@redhat.com, mpe@ellerman.id.au,
 minchan@kernel.org, iommu@lists.linux-foundation.org, hch@lst.de,
 frowand.list@gmail.com, benh@kernel.crashing.org, aneesh.kumar@linux.ibm.com,
 david@redhat.com, akpm@linux-foundation.org
From: Andrew Morton <akpm@linux-foundation.org>
Subject: + cma-factor-out-minimum-alignment-requirement.patch added to -mm tree
Message-Id: <20220214210612.24E2EC340E9@smtp.kernel.org>
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


The patch titled
     Subject: cma: factor out minimum alignment requirement
has been added to the -mm tree.  Its filename is
     cma-factor-out-minimum-alignment-requirement.patch

This patch should soon appear at
    https://ozlabs.org/~akpm/mmots/broken-out/cma-factor-out-minimum-alignment-requirement.patch
and later at
    https://ozlabs.org/~akpm/mmotm/broken-out/cma-factor-out-minimum-alignment-requirement.patch

Before you just go and hit "reply", please:
   a) Consider who else should be cc'ed
   b) Prefer to cc a suitable mailing list as well
   c) Ideally: find the original patch on the mailing list and do a
      reply-to-all to that, adding suitable additional cc's

*** Remember to use Documentation/process/submit-checklist.rst when testing your code ***

The -mm tree is included into linux-next and is updated
there every 3-4 working days

------------------------------------------------------
From: David Hildenbrand <david@redhat.com>
Subject: cma: factor out minimum alignment requirement

Patch series "mm: enforce pageblock_order < MAX_ORDER".

Having pageblock_order >= MAX_ORDER seems to be able to happen in corner
cases and some parts of the kernel are not prepared for it.

For example, Aneesh has shown [1] that such kernels can be compiled on
ppc64 with 64k base pages by setting FORCE_MAX_ZONEORDER=8, which will run
into a WARN_ON_ONCE(order >= MAX_ORDER) in comapction code right during
boot.

We can get pageblock_order >= MAX_ORDER when the default hugetlb size is
bigger than the maximum allocation granularity of the buddy, in which case
we are no longer talking about huge pages but instead gigantic pages.

Having pageblock_order >= MAX_ORDER can only make alloc_contig_range() of
such gigantic pages more likely to succeed.

Reliable use of gigantic pages either requires boot time allcoation or
CMA, no need to overcomplicate some places in the kernel to optimize for
corner cases that are broken in other areas of the kernel.


This patch (of 2):

Let's enforce pageblock_order < MAX_ORDER and simplify.

Especially patch #1 can be regarded a cleanup before:
	[PATCH v5 0/6] Use pageblock_order for cma and alloc_contig_range
	alignment. [2]

[1] https://lkml.kernel.org/r/87r189a2ks.fsf@linux.ibm.com
[2] https://lkml.kernel.org/r/20220211164135.1803616-1-zi.yan@sent.com

Link: https://lkml.kernel.org/r/20220214174132.219303-2-david@redhat.com
Signed-off-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Zi Yan <ziy@nvidia.com>
Cc: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Minchan Kim <minchan@kernel.org>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: John Garry via iommu <iommu@lists.linux-foundation.org>

Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 arch/powerpc/include/asm/fadump-internal.h |    5 ----
 arch/powerpc/kernel/fadump.c               |    2 -
 drivers/of/of_reserved_mem.c               |    9 ++------
 include/linux/cma.h                        |    9 ++++++++
 kernel/dma/contiguous.c                    |    4 ---
 mm/cma.c                                   |   20 ++++---------------
 6 files changed, 19 insertions(+), 30 deletions(-)

--- a/arch/powerpc/include/asm/fadump-internal.h~cma-factor-out-minimum-alignment-requirement
+++ a/arch/powerpc/include/asm/fadump-internal.h
@@ -19,11 +19,6 @@
 
 #define memblock_num_regions(memblock_type)	(memblock.memblock_type.cnt)
 
-/* Alignment per CMA requirement. */
-#define FADUMP_CMA_ALIGNMENT	(PAGE_SIZE <<				\
-				 max_t(unsigned long, MAX_ORDER - 1,	\
-				 pageblock_order))
-
 /* FAD commands */
 #define FADUMP_REGISTER			1
 #define FADUMP_UNREGISTER		2
--- a/arch/powerpc/kernel/fadump.c~cma-factor-out-minimum-alignment-requirement
+++ a/arch/powerpc/kernel/fadump.c
@@ -544,7 +544,7 @@ int __init fadump_reserve_mem(void)
 		if (!fw_dump.nocma) {
 			fw_dump.boot_memory_size =
 				ALIGN(fw_dump.boot_memory_size,
-				      FADUMP_CMA_ALIGNMENT);
+				      CMA_MIN_ALIGNMENT_BYTES);
 		}
 #endif
 
--- a/drivers/of/of_reserved_mem.c~cma-factor-out-minimum-alignment-requirement
+++ a/drivers/of/of_reserved_mem.c
@@ -22,6 +22,7 @@
 #include <linux/slab.h>
 #include <linux/memblock.h>
 #include <linux/kmemleak.h>
+#include <linux/cma.h>
 
 #include "of_private.h"
 
@@ -116,12 +117,8 @@ static int __init __reserved_mem_alloc_s
 	if (IS_ENABLED(CONFIG_CMA)
 	    && of_flat_dt_is_compatible(node, "shared-dma-pool")
 	    && of_get_flat_dt_prop(node, "reusable", NULL)
-	    && !nomap) {
-		unsigned long order =
-			max_t(unsigned long, MAX_ORDER - 1, pageblock_order);
-
-		align = max(align, (phys_addr_t)PAGE_SIZE << order);
-	}
+	    && !nomap)
+		align = max_t(phys_addr_t, align, CMA_MIN_ALIGNMENT_BYTES);
 
 	prop = of_get_flat_dt_prop(node, "alloc-ranges", &len);
 	if (prop) {
--- a/include/linux/cma.h~cma-factor-out-minimum-alignment-requirement
+++ a/include/linux/cma.h
@@ -20,6 +20,15 @@
 
 #define CMA_MAX_NAME 64
 
+/*
+ * TODO: once the buddy -- especially pageblock merging and alloc_contig_range()
+ * -- can deal with only some pageblocks of a higher-order page being
+ *  MIGRATE_CMA, we can use pageblock_nr_pages.
+ */
+#define CMA_MIN_ALIGNMENT_PAGES max_t(phys_addr_t, MAX_ORDER_NR_PAGES, \
+				      pageblock_nr_pages)
+#define CMA_MIN_ALIGNMENT_BYTES (PAGE_SIZE * CMA_MIN_ALIGNMENT_PAGES)
+
 struct cma;
 
 extern unsigned long totalcma_pages;
--- a/kernel/dma/contiguous.c~cma-factor-out-minimum-alignment-requirement
+++ a/kernel/dma/contiguous.c
@@ -399,8 +399,6 @@ static const struct reserved_mem_ops rme
 
 static int __init rmem_cma_setup(struct reserved_mem *rmem)
 {
-	phys_addr_t align = PAGE_SIZE << max(MAX_ORDER - 1, pageblock_order);
-	phys_addr_t mask = align - 1;
 	unsigned long node = rmem->fdt_node;
 	bool default_cma = of_get_flat_dt_prop(node, "linux,cma-default", NULL);
 	struct cma *cma;
@@ -416,7 +414,7 @@ static int __init rmem_cma_setup(struct
 	    of_get_flat_dt_prop(node, "no-map", NULL))
 		return -EINVAL;
 
-	if ((rmem->base & mask) || (rmem->size & mask)) {
+	if (!IS_ALIGNED(rmem->base | rmem->size, CMA_MIN_ALIGNMENT_BYTES)) {
 		pr_err("Reserved memory: incorrect alignment of CMA region\n");
 		return -EINVAL;
 	}
--- a/mm/cma.c~cma-factor-out-minimum-alignment-requirement
+++ a/mm/cma.c
@@ -168,7 +168,6 @@ int __init cma_init_reserved_mem(phys_ad
 				 struct cma **res_cma)
 {
 	struct cma *cma;
-	phys_addr_t alignment;
 
 	/* Sanity checks */
 	if (cma_area_count == ARRAY_SIZE(cma_areas)) {
@@ -179,15 +178,12 @@ int __init cma_init_reserved_mem(phys_ad
 	if (!size || !memblock_is_region_reserved(base, size))
 		return -EINVAL;
 
-	/* ensure minimal alignment required by mm core */
-	alignment = PAGE_SIZE <<
-			max_t(unsigned long, MAX_ORDER - 1, pageblock_order);
-
 	/* alignment should be aligned with order_per_bit */
-	if (!IS_ALIGNED(alignment >> PAGE_SHIFT, 1 << order_per_bit))
+	if (!IS_ALIGNED(CMA_MIN_ALIGNMENT_PAGES, 1 << order_per_bit))
 		return -EINVAL;
 
-	if (ALIGN(base, alignment) != base || ALIGN(size, alignment) != size)
+	/* ensure minimal alignment required by mm core */
+	if (!IS_ALIGNED(base | size, CMA_MIN_ALIGNMENT_BYTES))
 		return -EINVAL;
 
 	/*
@@ -262,14 +258,8 @@ int __init cma_declare_contiguous_nid(ph
 	if (alignment && !is_power_of_2(alignment))
 		return -EINVAL;
 
-	/*
-	 * Sanitise input arguments.
-	 * Pages both ends in CMA area could be merged into adjacent unmovable
-	 * migratetype page by page allocator's buddy algorithm. In the case,
-	 * you couldn't get a contiguous memory, which is not what we want.
-	 */
-	alignment = max(alignment,  (phys_addr_t)PAGE_SIZE <<
-			  max_t(unsigned long, MAX_ORDER - 1, pageblock_order));
+	/* Sanitise input arguments. */
+	alignment = max_t(phys_addr_t, alignment, CMA_MIN_ALIGNMENT_BYTES);
 	if (fixed && base & (alignment - 1)) {
 		ret = -EINVAL;
 		pr_err("Region at %pa must be aligned to %pa bytes\n",
_

Patches currently in -mm which might be from david@redhat.com are

mm-optimize-do_wp_page-for-exclusive-pages-in-the-swapcache.patch
mm-optimize-do_wp_page-for-fresh-pages-in-local-lru-pagevecs.patch
mm-slightly-clarify-ksm-logic-in-do_swap_page.patch
mm-streamline-cow-logic-in-do_swap_page.patch
mm-huge_memory-streamline-cow-logic-in-do_huge_pmd_wp_page.patch
mm-khugepaged-remove-reuse_swap_page-usage.patch
mm-swapfile-remove-stale-reuse_swap_page.patch
mm-huge_memory-remove-stale-page_trans_huge_mapcount.patch
mm-huge_memory-remove-stale-locking-logic-from-__split_huge_pmd.patch
cma-factor-out-minimum-alignment-requirement.patch
mm-enforce-pageblock_order-max_order.patch
drivers-base-memory-add-memory-block-to-memory-group-after-registration-succeeded.patch
drivers-base-node-consolidate-node-device-subsystem-initialization-in-node_dev_init.patch
drivers-base-node-rename-link_mem_sections-to-register_memory_block_under_node.patch
drivers-base-memory-determine-and-store-zone-for-single-zone-memory-blocks.patch
proc-vmcore-fix-possible-deadlock-on-concurrent-mmap-and-read.patch

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
