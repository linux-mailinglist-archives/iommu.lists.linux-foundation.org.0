Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 799C25620BA
	for <lists.iommu@lfdr.de>; Thu, 30 Jun 2022 19:01:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 273E060F2C;
	Thu, 30 Jun 2022 17:01:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 273E060F2C
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=H3qXn7aG
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4ZP8rpE2-XNQ; Thu, 30 Jun 2022 17:01:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 89D2F60F3D;
	Thu, 30 Jun 2022 17:01:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89D2F60F3D
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5C9FDC0036;
	Thu, 30 Jun 2022 17:01:03 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9A00DC0011
 for <iommu@lists.linux-foundation.org>; Thu, 30 Jun 2022 17:01:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 744F542423
 for <iommu@lists.linux-foundation.org>; Thu, 30 Jun 2022 17:01:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 744F542423
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=H3qXn7aG
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jUpRDHOIF1rl for <iommu@lists.linux-foundation.org>;
 Thu, 30 Jun 2022 17:00:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7BDDC42454
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7BDDC42454
 for <iommu@lists.linux-foundation.org>; Thu, 30 Jun 2022 17:00:59 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id w24so23306pjg.5
 for <iommu@lists.linux-foundation.org>; Thu, 30 Jun 2022 10:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zL2/K/Mk5lP88ie9KcmzeSvijx+Z6qG8PxCfTkRCjAI=;
 b=H3qXn7aGTAea7UqPfeyjgXi83w8Aqud99nQZk1lUeUCKtpGdsz0XN42Cs46YKc2umX
 Jy1Cgf/BfA27W/mtzhjzNEwrO/ctph40upe9nPIAKfQzGBQtvp2SWEKo6EDbmmVu8ohc
 71ltphrengDeAlDntZEiPtuGLPSjtjFHnwmmiMe8YgKLFDBx/BlxOnPu1xZxYZVrZZQc
 hlYVn4wmYBNmbzxo1nRHSUlHZofhF6wi3nLPhF1JXicfN+2JH6ZW+Qg0ORmqWWJKYDDT
 TMrJ+LVGGEOBEvOpM9R9jnzFOyjeNU2y1NZux/ysF1vKfi5ZvQrxhqxnR+nnzRj5JwRe
 xElg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zL2/K/Mk5lP88ie9KcmzeSvijx+Z6qG8PxCfTkRCjAI=;
 b=TOmCCuCCfW0u3g2WG744ugRNvVeAJgJqOr+zVbH9sCIeIqO/O0q3nax2sDEnzd4Wdu
 rotZyCLGlZWKGrq+xMZJM2J44IDR5BJGgdlfUjUzF44OkaPrrKEGiTixu09HrMzmznte
 KlouZbTm3hZoxo2dYGPuo33lUIyfPdTsRGraovCpktFw813+jPDBq47NPlM3/d5FYQoe
 FRep8BFLiYC+018jWRwPoVtzt68RbBIjifrN42uQeSVx0WrLUgy5vFLQCq9n0mu3WrcU
 ukScFK77E3KcMEdxW9/SMDaBzxsBFLxtI5VrgXmJMS2q15f2KaRlKiOrUFbrqJsSLAbu
 wA2Q==
X-Gm-Message-State: AJIora9dlInev1MK7ysAY20l2Gkp6Lj5O3+v3UW+m/dse/g1w898TXgn
 EaRS018lW4r6Czy7kKlFj/w=
X-Google-Smtp-Source: AGRyM1sVU6kLvzgtrXgiv/OkGHduTDh1f8FSIPXTeZmL3OG78c2N+J5uE61HD5dZeSKbB2VjWT+OQQ==
X-Received: by 2002:a17:90b:19c8:b0:1ec:78f1:8379 with SMTP id
 nm8-20020a17090b19c800b001ec78f18379mr11019517pjb.83.1656608458658; 
 Thu, 30 Jun 2022 10:00:58 -0700 (PDT)
Received: from ubuntu-Virtual-Machine.corp.microsoft.com
 ([2001:4898:80e8:36:514f:82ef:5a18:6018])
 by smtp.gmail.com with ESMTPSA id
 bw11-20020a056a00408b00b00525184bad54sm13754980pfb.126.2022.06.30.10.00.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jun 2022 10:00:57 -0700 (PDT)
From: Tianyu Lan <ltykernel@gmail.com>
To: corbet@lwn.net, hch@infradead.org, m.szyprowski@samsung.com,
 robin.murphy@arm.com, paulmck@kernel.org, akpm@linux-foundation.org,
 bp@suse.de, songmuchun@bytedance.com, keescook@chromium.org,
 rdunlap@infradead.org, damien.lemoal@opensource.wdc.com,
 michael.h.kelley@microsoft.com, kys@microsoft.com
Subject: [PATCH V2 1/1] swiotlb: Split up single swiotlb lock
Date: Thu, 30 Jun 2022 13:00:55 -0400
Message-Id: <20220630170055.173139-1-ltykernel@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: parri.andrea@gmail.com, thomas.lendacky@amd.com, wei.liu@kernel.org,
 Andi Kleen <ak@linux.intel.com>, Tianyu Lan <Tianyu.Lan@microsoft.com>,
 linux-hyperv@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, kirill.shutemov@intel.com,
 iommu@lists.linux-foundation.org, andi.kleen@intel.com, vkuznets@redhat.com
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

From: Tianyu Lan <Tianyu.Lan@microsoft.com>

Traditionally swiotlb was not performance critical because it was only
used for slow devices. But in some setups, like TDX/SEV confidential
guests, all IO has to go through swiotlb. Currently swiotlb only has a
single lock. Under high IO load with multiple CPUs this can lead to
significat lock contention on the swiotlb lock.

This patch splits the swiotlb bounce buffer pool into individual areas
which have their own lock. Each CPU tries to allocate in its own area
first. Only if that fails does it search other areas. On freeing the
allocation is freed into the area where the memory was originally
allocated from.

Area number can be set via swiotlb_adjust_nareas() and swiotlb kernel
parameter.

This idea from Andi Kleen patch(https://github.com/intel/tdx/commit/
4529b5784c141782c72ec9bd9a92df2b68cb7d45).

Based-on-idea-by: Andi Kleen <ak@linux.intel.com>
Signed-off-by: Tianyu Lan <Tianyu.Lan@microsoft.com>
---
Change since v1:
       * Move struct io_tlb_area to swiotlb.c
       * Fix some coding style issue.
---
 .../admin-guide/kernel-parameters.txt         |   4 +-
 include/linux/swiotlb.h                       |   5 +
 kernel/dma/swiotlb.c                          | 218 ++++++++++++++----
 3 files changed, 187 insertions(+), 40 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 2522b11e593f..4a6ad177d4b8 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -5904,8 +5904,10 @@
 			it if 0 is given (See Documentation/admin-guide/cgroup-v1/memory.rst)
 
 	swiotlb=	[ARM,IA-64,PPC,MIPS,X86]
-			Format: { <int> | force | noforce }
+			Format: { <int> [,<int>] | force | noforce }
 			<int> -- Number of I/O TLB slabs
+			<int> -- Second integer after comma. Number of swiotlb
+				 areas with their own lock. Must be power of 2.
 			force -- force using of bounce buffers even if they
 			         wouldn't be automatically used by the kernel
 			noforce -- Never use bounce buffers (for debugging)
diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index 7ed35dd3de6e..5f898c5e9f19 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -89,6 +89,8 @@ extern enum swiotlb_force swiotlb_force;
  * @late_alloc:	%true if allocated using the page allocator
  * @force_bounce: %true if swiotlb bouncing is forced
  * @for_alloc:  %true if the pool is used for memory allocation
+ * @nareas:  The area number in the pool.
+ * @area_nslabs: The slot number in the area.
  */
 struct io_tlb_mem {
 	phys_addr_t start;
@@ -102,6 +104,9 @@ struct io_tlb_mem {
 	bool late_alloc;
 	bool force_bounce;
 	bool for_alloc;
+	unsigned int nareas;
+	unsigned int area_nslabs;
+	struct io_tlb_area *areas;
 	struct io_tlb_slot {
 		phys_addr_t orig_addr;
 		size_t alloc_size;
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index cb50f8d38360..421bba62d4f1 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -70,6 +70,45 @@ struct io_tlb_mem io_tlb_default_mem;
 phys_addr_t swiotlb_unencrypted_base;
 
 static unsigned long default_nslabs = IO_TLB_DEFAULT_SIZE >> IO_TLB_SHIFT;
+static unsigned long default_nareas = 1;
+
+/**
+ * struct io_tlb_area - IO TLB memory area descriptor
+ *
+ * This is a single area with a single lock.
+ *
+ * @used:	The number of used IO TLB block.
+ * @index:	The slot index to start searching in this area for next round.
+ * @lock:	The lock to protect the above data structures in the map and
+ *		unmap calls.
+ */
+struct io_tlb_area {
+	unsigned long used;
+	unsigned int index;
+	spinlock_t lock;
+};
+
+static void __init swiotlb_adjust_nareas(unsigned int nareas)
+{
+	if (!is_power_of_2(nareas)) {
+		pr_err("swiotlb: Invalid areas parameter %d.\n", nareas);
+		return;
+	}
+
+	default_nareas = nareas;
+
+	pr_info("area num %d.\n", nareas);
+	/*
+	 * Round up number of slabs to the next power of 2.
+	 * The last area is going be smaller than the rest if
+	 * default_nslabs is not power of two.
+	 */
+	if (nareas > 1) {
+		default_nslabs = roundup_pow_of_two(default_nslabs);
+		pr_info("SWIOTLB bounce buffer size roundup to %luMB",
+			(default_nslabs << IO_TLB_SHIFT) >> 20);
+	}
+}
 
 static int __init
 setup_io_tlb_npages(char *str)
@@ -79,6 +118,10 @@ setup_io_tlb_npages(char *str)
 		default_nslabs =
 			ALIGN(simple_strtoul(str, &str, 0), IO_TLB_SEGSIZE);
 	}
+	if (*str == ',')
+		++str;
+	if (isdigit(*str))
+		swiotlb_adjust_nareas(simple_strtoul(str, &str, 0));
 	if (*str == ',')
 		++str;
 	if (!strcmp(str, "force"))
@@ -112,8 +155,19 @@ void __init swiotlb_adjust_size(unsigned long size)
 	 */
 	if (default_nslabs != IO_TLB_DEFAULT_SIZE >> IO_TLB_SHIFT)
 		return;
+
+	/*
+	 * Round up number of slabs to the next power of 2.
+	 * The last area is going be smaller than the rest if
+	 * default_nslabs is not power of two.
+	 */
 	size = ALIGN(size, IO_TLB_SIZE);
 	default_nslabs = ALIGN(size >> IO_TLB_SHIFT, IO_TLB_SEGSIZE);
+	if (default_nareas > 1) {
+		default_nslabs = roundup_pow_of_two(default_nslabs);
+		size = default_nslabs << IO_TLB_SHIFT;
+	}
+
 	pr_info("SWIOTLB bounce buffer size adjusted to %luMB", size >> 20);
 }
 
@@ -192,7 +246,8 @@ void __init swiotlb_update_mem_attributes(void)
 }
 
 static void swiotlb_init_io_tlb_mem(struct io_tlb_mem *mem, phys_addr_t start,
-		unsigned long nslabs, unsigned int flags, bool late_alloc)
+		unsigned long nslabs, unsigned int flags,
+		bool late_alloc, unsigned int nareas)
 {
 	void *vaddr = phys_to_virt(start);
 	unsigned long bytes = nslabs << IO_TLB_SHIFT, i;
@@ -202,10 +257,17 @@ static void swiotlb_init_io_tlb_mem(struct io_tlb_mem *mem, phys_addr_t start,
 	mem->end = mem->start + bytes;
 	mem->index = 0;
 	mem->late_alloc = late_alloc;
+	mem->nareas = nareas;
+	mem->area_nslabs = nslabs / mem->nareas;
 
 	mem->force_bounce = swiotlb_force_bounce || (flags & SWIOTLB_FORCE);
 
 	spin_lock_init(&mem->lock);
+	for (i = 0; i < mem->nareas; i++) {
+		spin_lock_init(&mem->areas[i].lock);
+		mem->areas[i].index = 0;
+	}
+
 	for (i = 0; i < mem->nslabs; i++) {
 		mem->slots[i].list = IO_TLB_SEGSIZE - io_tlb_offset(i);
 		mem->slots[i].orig_addr = INVALID_PHYS_ADDR;
@@ -274,7 +336,13 @@ void __init swiotlb_init_remap(bool addressing_limit, unsigned int flags,
 		panic("%s: Failed to allocate %zu bytes align=0x%lx\n",
 		      __func__, alloc_size, PAGE_SIZE);
 
-	swiotlb_init_io_tlb_mem(mem, __pa(tlb), nslabs, flags, false);
+	mem->areas = memblock_alloc(sizeof(struct io_tlb_area) *
+		default_nareas, SMP_CACHE_BYTES);
+	if (!mem->areas)
+		panic("%s: Failed to allocate mem->areas.\n", __func__);
+
+	swiotlb_init_io_tlb_mem(mem, __pa(tlb), nslabs, flags, false,
+				default_nareas);
 
 	if (flags & SWIOTLB_VERBOSE)
 		swiotlb_print_info();
@@ -296,7 +364,7 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask,
 	struct io_tlb_mem *mem = &io_tlb_default_mem;
 	unsigned long nslabs = ALIGN(size >> IO_TLB_SHIFT, IO_TLB_SEGSIZE);
 	unsigned char *vstart = NULL;
-	unsigned int order;
+	unsigned int order, area_order;
 	bool retried = false;
 	int rc = 0;
 
@@ -337,19 +405,31 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask,
 			(PAGE_SIZE << order) >> 20);
 	}
 
+	area_order = get_order(array_size(sizeof(*mem->areas),
+		default_nareas));
+	mem->areas = (struct io_tlb_area *)
+		__get_free_pages(GFP_KERNEL | __GFP_ZERO, area_order);
+	if (!mem->areas)
+		goto error_area;
+
 	mem->slots = (void *)__get_free_pages(GFP_KERNEL | __GFP_ZERO,
 		get_order(array_size(sizeof(*mem->slots), nslabs)));
-	if (!mem->slots) {
-		free_pages((unsigned long)vstart, order);
-		return -ENOMEM;
-	}
+	if (!mem->slots)
+		goto error_slots;
 
 	set_memory_decrypted((unsigned long)vstart,
 			     (nslabs << IO_TLB_SHIFT) >> PAGE_SHIFT);
-	swiotlb_init_io_tlb_mem(mem, virt_to_phys(vstart), nslabs, 0, true);
+	swiotlb_init_io_tlb_mem(mem, virt_to_phys(vstart), nslabs, 0, true,
+				default_nareas);
 
 	swiotlb_print_info();
 	return 0;
+
+error_slots:
+	free_pages((unsigned long)mem->areas, area_order);
+error_area:
+	free_pages((unsigned long)vstart, order);
+	return -ENOMEM;
 }
 
 void __init swiotlb_exit(void)
@@ -357,6 +437,7 @@ void __init swiotlb_exit(void)
 	struct io_tlb_mem *mem = &io_tlb_default_mem;
 	unsigned long tbl_vaddr;
 	size_t tbl_size, slots_size;
+	unsigned int area_order;
 
 	if (swiotlb_force_bounce)
 		return;
@@ -371,9 +452,14 @@ void __init swiotlb_exit(void)
 
 	set_memory_encrypted(tbl_vaddr, tbl_size >> PAGE_SHIFT);
 	if (mem->late_alloc) {
+		area_order = get_order(array_size(sizeof(*mem->areas),
+			mem->nareas));
+		free_pages((unsigned long)mem->areas, area_order);
 		free_pages(tbl_vaddr, get_order(tbl_size));
 		free_pages((unsigned long)mem->slots, get_order(slots_size));
 	} else {
+		memblock_free_late(__pa(mem->areas),
+				   mem->nareas * sizeof(struct io_tlb_area));
 		memblock_free_late(mem->start, tbl_size);
 		memblock_free_late(__pa(mem->slots), slots_size);
 	}
@@ -476,9 +562,9 @@ static inline unsigned long get_max_slots(unsigned long boundary_mask)
 	return nr_slots(boundary_mask + 1);
 }
 
-static unsigned int wrap_index(struct io_tlb_mem *mem, unsigned int index)
+static unsigned int wrap_area_index(struct io_tlb_mem *mem, unsigned int index)
 {
-	if (index >= mem->nslabs)
+	if (index >= mem->area_nslabs)
 		return 0;
 	return index;
 }
@@ -487,10 +573,11 @@ static unsigned int wrap_index(struct io_tlb_mem *mem, unsigned int index)
  * Find a suitable number of IO TLB entries size that will fit this request and
  * allocate a buffer from that IO TLB pool.
  */
-static int swiotlb_find_slots(struct device *dev, phys_addr_t orig_addr,
-			      size_t alloc_size, unsigned int alloc_align_mask)
+static int swiotlb_do_find_slots(struct io_tlb_mem *mem,
+		struct io_tlb_area *area, int area_index,
+		struct device *dev, phys_addr_t orig_addr,
+		size_t alloc_size, unsigned int alloc_align_mask)
 {
-	struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
 	unsigned long boundary_mask = dma_get_seg_boundary(dev);
 	dma_addr_t tbl_dma_addr =
 		phys_to_dma_unencrypted(dev, mem->start) & boundary_mask;
@@ -501,8 +588,11 @@ static int swiotlb_find_slots(struct device *dev, phys_addr_t orig_addr,
 	unsigned int index, wrap, count = 0, i;
 	unsigned int offset = swiotlb_align_offset(dev, orig_addr);
 	unsigned long flags;
+	unsigned int slot_base;
+	unsigned int slot_index;
 
 	BUG_ON(!nslots);
+	BUG_ON(area_index >= mem->nareas);
 
 	/*
 	 * For mappings with an alignment requirement don't bother looping to
@@ -514,16 +604,20 @@ static int swiotlb_find_slots(struct device *dev, phys_addr_t orig_addr,
 		stride = max(stride, stride << (PAGE_SHIFT - IO_TLB_SHIFT));
 	stride = max(stride, (alloc_align_mask >> IO_TLB_SHIFT) + 1);
 
-	spin_lock_irqsave(&mem->lock, flags);
-	if (unlikely(nslots > mem->nslabs - mem->used))
+	spin_lock_irqsave(&area->lock, flags);
+	if (unlikely(nslots > mem->area_nslabs - area->used))
 		goto not_found;
 
-	index = wrap = wrap_index(mem, ALIGN(mem->index, stride));
+	slot_base = area_index * mem->area_nslabs;
+	index = wrap = wrap_area_index(mem, ALIGN(area->index, stride));
+
 	do {
+		slot_index = slot_base + index;
+
 		if (orig_addr &&
-		    (slot_addr(tbl_dma_addr, index) & iotlb_align_mask) !=
-			    (orig_addr & iotlb_align_mask)) {
-			index = wrap_index(mem, index + 1);
+		    (slot_addr(tbl_dma_addr, slot_index) &
+		     iotlb_align_mask) != (orig_addr & iotlb_align_mask)) {
+			index = wrap_area_index(mem, index + 1);
 			continue;
 		}
 
@@ -532,26 +626,26 @@ static int swiotlb_find_slots(struct device *dev, phys_addr_t orig_addr,
 		 * contiguous buffers, we allocate the buffers from that slot
 		 * and mark the entries as '0' indicating unavailable.
 		 */
-		if (!iommu_is_span_boundary(index, nslots,
+		if (!iommu_is_span_boundary(slot_index, nslots,
 					    nr_slots(tbl_dma_addr),
 					    max_slots)) {
-			if (mem->slots[index].list >= nslots)
+			if (mem->slots[slot_index].list >= nslots)
 				goto found;
 		}
-		index = wrap_index(mem, index + stride);
+		index = wrap_area_index(mem, index + stride);
 	} while (index != wrap);
 
 not_found:
-	spin_unlock_irqrestore(&mem->lock, flags);
+	spin_unlock_irqrestore(&area->lock, flags);
 	return -1;
 
 found:
-	for (i = index; i < index + nslots; i++) {
+	for (i = slot_index; i < slot_index + nslots; i++) {
 		mem->slots[i].list = 0;
-		mem->slots[i].alloc_size =
-			alloc_size - (offset + ((i - index) << IO_TLB_SHIFT));
+		mem->slots[i].alloc_size = alloc_size - (offset +
+				((i - slot_index) << IO_TLB_SHIFT));
 	}
-	for (i = index - 1;
+	for (i = slot_index - 1;
 	     io_tlb_offset(i) != IO_TLB_SEGSIZE - 1 &&
 	     mem->slots[i].list; i--)
 		mem->slots[i].list = ++count;
@@ -559,14 +653,43 @@ static int swiotlb_find_slots(struct device *dev, phys_addr_t orig_addr,
 	/*
 	 * Update the indices to avoid searching in the next round.
 	 */
-	if (index + nslots < mem->nslabs)
-		mem->index = index + nslots;
+	if (index + nslots < mem->area_nslabs)
+		area->index = index + nslots;
 	else
-		mem->index = 0;
-	mem->used += nslots;
+		area->index = 0;
+	area->used += nslots;
+	spin_unlock_irqrestore(&area->lock, flags);
+	return slot_index;
+}
 
-	spin_unlock_irqrestore(&mem->lock, flags);
-	return index;
+static int swiotlb_find_slots(struct device *dev, phys_addr_t orig_addr,
+		size_t alloc_size, unsigned int alloc_align_mask)
+{
+	struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
+	int start = raw_smp_processor_id() & ((1U << __fls(mem->nareas)) - 1);
+	int i = start, index;
+
+	do {
+		index = swiotlb_do_find_slots(mem, mem->areas + i, i,
+					      dev, orig_addr, alloc_size,
+					      alloc_align_mask);
+		if (index >= 0)
+			return index;
+		if (++i >= mem->nareas)
+			i = 0;
+	} while (i != start);
+
+	return -1;
+}
+
+static unsigned long mem_used(struct io_tlb_mem *mem)
+{
+	int i;
+	unsigned long used = 0;
+
+	for (i = 0; i < mem->nareas; i++)
+		used += mem->areas[i].used;
+	return used;
 }
 
 phys_addr_t swiotlb_tbl_map_single(struct device *dev, phys_addr_t orig_addr,
@@ -598,7 +721,7 @@ phys_addr_t swiotlb_tbl_map_single(struct device *dev, phys_addr_t orig_addr,
 		if (!(attrs & DMA_ATTR_NO_WARN))
 			dev_warn_ratelimited(dev,
 	"swiotlb buffer is full (sz: %zd bytes), total %lu (slots), used %lu (slots)\n",
-				 alloc_size, mem->nslabs, mem->used);
+				 alloc_size, mem->nslabs, mem_used(mem));
 		return (phys_addr_t)DMA_MAPPING_ERROR;
 	}
 
@@ -628,6 +751,8 @@ static void swiotlb_release_slots(struct device *dev, phys_addr_t tlb_addr)
 	unsigned int offset = swiotlb_align_offset(dev, tlb_addr);
 	int index = (tlb_addr - offset - mem->start) >> IO_TLB_SHIFT;
 	int nslots = nr_slots(mem->slots[index].alloc_size + offset);
+	int aindex = index / mem->area_nslabs;
+	struct io_tlb_area *area = &mem->areas[aindex];
 	int count, i;
 
 	/*
@@ -636,7 +761,9 @@ static void swiotlb_release_slots(struct device *dev, phys_addr_t tlb_addr)
 	 * While returning the entries to the free list, we merge the entries
 	 * with slots below and above the pool being returned.
 	 */
-	spin_lock_irqsave(&mem->lock, flags);
+	BUG_ON(aindex >= mem->nareas);
+
+	spin_lock_irqsave(&area->lock, flags);
 	if (index + nslots < ALIGN(index + 1, IO_TLB_SEGSIZE))
 		count = mem->slots[index + nslots].list;
 	else
@@ -660,8 +787,8 @@ static void swiotlb_release_slots(struct device *dev, phys_addr_t tlb_addr)
 	     io_tlb_offset(i) != IO_TLB_SEGSIZE - 1 && mem->slots[i].list;
 	     i--)
 		mem->slots[i].list = ++count;
-	mem->used -= nslots;
-	spin_unlock_irqrestore(&mem->lock, flags);
+	area->used -= nslots;
+	spin_unlock_irqrestore(&area->lock, flags);
 }
 
 /*
@@ -759,12 +886,14 @@ EXPORT_SYMBOL_GPL(is_swiotlb_active);
 static void swiotlb_create_debugfs_files(struct io_tlb_mem *mem,
 					 const char *dirname)
 {
+	unsigned long used = mem_used(mem);
+
 	mem->debugfs = debugfs_create_dir(dirname, io_tlb_default_mem.debugfs);
 	if (!mem->nslabs)
 		return;
 
 	debugfs_create_ulong("io_tlb_nslabs", 0400, mem->debugfs, &mem->nslabs);
-	debugfs_create_ulong("io_tlb_used", 0400, mem->debugfs, &mem->used);
+	debugfs_create_ulong("io_tlb_used", 0400, mem->debugfs, &used);
 }
 
 static int __init __maybe_unused swiotlb_create_default_debugfs(void)
@@ -815,6 +944,9 @@ static int rmem_swiotlb_device_init(struct reserved_mem *rmem,
 	struct io_tlb_mem *mem = rmem->priv;
 	unsigned long nslabs = rmem->size >> IO_TLB_SHIFT;
 
+	/* Set Per-device io tlb area to one */
+	unsigned int nareas = 1;
+
 	/*
 	 * Since multiple devices can share the same pool, the private data,
 	 * io_tlb_mem struct, will be initialized by the first device attached
@@ -831,10 +963,18 @@ static int rmem_swiotlb_device_init(struct reserved_mem *rmem,
 			return -ENOMEM;
 		}
 
+		mem->areas = kcalloc(nareas, sizeof(*mem->areas),
+				GFP_KERNEL);
+		if (!mem->areas) {
+			kfree(mem);
+			kfree(mem->slots);
+			return -ENOMEM;
+		}
+
 		set_memory_decrypted((unsigned long)phys_to_virt(rmem->base),
 				     rmem->size >> PAGE_SHIFT);
 		swiotlb_init_io_tlb_mem(mem, rmem->base, nslabs, SWIOTLB_FORCE,
-				false);
+					false, nareas);
 		mem->for_alloc = true;
 
 		rmem->priv = mem;
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
