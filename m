Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DBD569D30
	for <lists.iommu@lfdr.de>; Thu,  7 Jul 2022 10:24:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 22F9C40C8A;
	Thu,  7 Jul 2022 08:24:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 22F9C40C8A
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ZmK6w3xo
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j7Xrz6xaVTPj; Thu,  7 Jul 2022 08:24:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 5540A40C7B;
	Thu,  7 Jul 2022 08:24:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5540A40C7B
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 22569C007D;
	Thu,  7 Jul 2022 08:24:43 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6B599C002D
 for <iommu@lists.linux-foundation.org>; Thu,  7 Jul 2022 08:24:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3769661153
 for <iommu@lists.linux-foundation.org>; Thu,  7 Jul 2022 08:24:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3769661153
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ZmK6w3xo
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id APpuVGnCszTB for <iommu@lists.linux-foundation.org>;
 Thu,  7 Jul 2022 08:24:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 998BC610CD
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 998BC610CD
 for <iommu@lists.linux-foundation.org>; Thu,  7 Jul 2022 08:24:40 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id y9so3706179pff.12
 for <iommu@lists.linux-foundation.org>; Thu, 07 Jul 2022 01:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Q+aiRuV9a1GwGhFhwaWbX6KG6VyNV8G0B48M/34l+ro=;
 b=ZmK6w3xo6iOV/7hdXRDzg2ZIfYsSsyAQRFvF/LpCL2vW/GvS/n6/nUm2Xx0p2QNsMA
 vVFkeKpu4L/JMM4hcSjjHGsIhHPon3GL+Ygp63GzqKBPq5BJesNV7au7DXCJW5HxpWpI
 VNuU3GhIlAvdMG+QpnePEBYKiZtv+aiYLSeO3js6k8RYwyj+WjvDURs5aeZ2Po1e4iq8
 sYsNLFoE9yqepxmuChipxY9KKMpFkwh65g1DPcsHpG1konZFvXDKr7UQwZ6eS4mYsHb1
 d7kV8HLsHkw7znT4mjZNMFyI36Ao8+XHZFROD2QTFkU0CpzTlxVDbuRMRaxm24b6STID
 iVcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Q+aiRuV9a1GwGhFhwaWbX6KG6VyNV8G0B48M/34l+ro=;
 b=b/W+hSGj8/sMLzelSTQFQyjB66lFfXXO8dCV1Tl//k6ixoFdPAb2hELDKfBpVNjAn9
 mAUJu6mktRhLfz1DolifMrAJZl9ezWtOoF+o8/3XvmGPNVTAVk2f3fRfEmXH5gBEwNS5
 SG1RgDu4LNa8XVZTfjftbvycagCRoLXnbvuispjbsFXMRe4Ugx1C8dQmWhbDlNVFdL0p
 KOcI27dss19iIYLDkxM8WdH/mzk/kYVyqTO6zJWvwdEvbNsJH+9C5FCooxeOmYQnx14j
 mI3KZ/lyC5dqEdc18Bd9Sr52ZwRv3AP83jwl9affaGjCgBHrmDnHb2vQHwWxDrCHjXEQ
 kPgA==
X-Gm-Message-State: AJIora9Ct6u43sw3meH3w2IZhW7PQKkEs9EFyKLG/q2mNCWQZH5Hk+FR
 qlJ+yDEDz7SvCtDZKKuZtPw=
X-Google-Smtp-Source: AGRyM1ugCaSrDniVkrhvcnP4oJMk5L+a09xCzqQ7Eid6EgnoIw9SOH12RhuvCo5F5d879uBRj/i5Mw==
X-Received: by 2002:a17:903:4094:b0:16b:df0e:6312 with SMTP id
 z20-20020a170903409400b0016bdf0e6312mr23599321plc.61.1657182279875; 
 Thu, 07 Jul 2022 01:24:39 -0700 (PDT)
Received: from ubuntu-Virtual-Machine.corp.microsoft.com
 ([2001:4898:80e8:b:ec7c:b887:273:abe6])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a170902e80800b0015e8d4eb285sm17808743plg.207.2022.07.07.01.24.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 01:24:39 -0700 (PDT)
From: Tianyu Lan <ltykernel@gmail.com>
To: corbet@lwn.net, hch@infradead.org, m.szyprowski@samsung.com,
 robin.murphy@arm.com, paulmck@kernel.org, bp@suse.de,
 akpm@linux-foundation.org, keescook@chromium.org, pmladek@suse.com,
 rdunlap@infradead.org, damien.lemoal@opensource.wdc.com,
 michael.h.kelley@microsoft.com, kys@microsoft.com
Subject: [PATCH V3] swiotlb: Split up single swiotlb lock
Date: Thu,  7 Jul 2022 04:24:36 -0400
Message-Id: <20220707082436.447984-1-ltykernel@gmail.com>
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

Area number can be set via swiotlb kernel parameter and is default
to be possible cpu number. If possible cpu number is not power of
2, area number will be round up to the next power of 2.

This idea from Andi Kleen patch(https://github.com/intel/tdx/commit/
4529b5784c141782c72ec9bd9a92df2b68cb7d45).

Based-on-idea-by: Andi Kleen <ak@linux.intel.com>
Signed-off-by: Tianyu Lan <Tianyu.Lan@microsoft.com>
---
Change since v2:
       * Use possible cpu number to adjust iotlb area number

Change since v1:
       * Move struct io_tlb_area to swiotlb.c
       * Fix some coding style issue.
---
 .../admin-guide/kernel-parameters.txt         |   4 +-
 include/linux/swiotlb.h                       |   5 +
 kernel/dma/swiotlb.c                          | 222 +++++++++++++++---
 3 files changed, 191 insertions(+), 40 deletions(-)

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
index cb50f8d38360..9e7aeca8faf4 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -70,6 +70,43 @@ struct io_tlb_mem io_tlb_default_mem;
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
+static void swiotlb_adjust_nareas(unsigned int nareas)
+{
+	if (!is_power_of_2(nareas))
+		nareas = roundup_pow_of_two(nareas);
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
@@ -79,6 +116,10 @@ setup_io_tlb_npages(char *str)
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
@@ -112,8 +153,19 @@ void __init swiotlb_adjust_size(unsigned long size)
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
 
@@ -192,7 +244,8 @@ void __init swiotlb_update_mem_attributes(void)
 }
 
 static void swiotlb_init_io_tlb_mem(struct io_tlb_mem *mem, phys_addr_t start,
-		unsigned long nslabs, unsigned int flags, bool late_alloc)
+		unsigned long nslabs, unsigned int flags,
+		bool late_alloc, unsigned int nareas)
 {
 	void *vaddr = phys_to_virt(start);
 	unsigned long bytes = nslabs << IO_TLB_SHIFT, i;
@@ -202,10 +255,17 @@ static void swiotlb_init_io_tlb_mem(struct io_tlb_mem *mem, phys_addr_t start,
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
@@ -274,7 +334,16 @@ void __init swiotlb_init_remap(bool addressing_limit, unsigned int flags,
 		panic("%s: Failed to allocate %zu bytes align=0x%lx\n",
 		      __func__, alloc_size, PAGE_SIZE);
 
-	swiotlb_init_io_tlb_mem(mem, __pa(tlb), nslabs, flags, false);
+	if (default_nareas == 1)
+		swiotlb_adjust_nareas(num_possible_cpus());
+
+	mem->areas = memblock_alloc(sizeof(struct io_tlb_area) *
+		default_nareas, SMP_CACHE_BYTES);
+	if (!mem->areas)
+		panic("%s: Failed to allocate mem->areas.\n", __func__);
+
+	swiotlb_init_io_tlb_mem(mem, __pa(tlb), nslabs, flags, false,
+				default_nareas);
 
 	if (flags & SWIOTLB_VERBOSE)
 		swiotlb_print_info();
@@ -296,7 +365,7 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask,
 	struct io_tlb_mem *mem = &io_tlb_default_mem;
 	unsigned long nslabs = ALIGN(size >> IO_TLB_SHIFT, IO_TLB_SEGSIZE);
 	unsigned char *vstart = NULL;
-	unsigned int order;
+	unsigned int order, area_order;
 	bool retried = false;
 	int rc = 0;
 
@@ -337,19 +406,34 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask,
 			(PAGE_SIZE << order) >> 20);
 	}
 
+	if (default_nareas == 1)
+		swiotlb_adjust_nareas(num_possible_cpus());
+
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
@@ -357,6 +441,7 @@ void __init swiotlb_exit(void)
 	struct io_tlb_mem *mem = &io_tlb_default_mem;
 	unsigned long tbl_vaddr;
 	size_t tbl_size, slots_size;
+	unsigned int area_order;
 
 	if (swiotlb_force_bounce)
 		return;
@@ -371,9 +456,14 @@ void __init swiotlb_exit(void)
 
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
@@ -476,9 +566,9 @@ static inline unsigned long get_max_slots(unsigned long boundary_mask)
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
@@ -487,10 +577,11 @@ static unsigned int wrap_index(struct io_tlb_mem *mem, unsigned int index)
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
@@ -501,8 +592,11 @@ static int swiotlb_find_slots(struct device *dev, phys_addr_t orig_addr,
 	unsigned int index, wrap, count = 0, i;
 	unsigned int offset = swiotlb_align_offset(dev, orig_addr);
 	unsigned long flags;
+	unsigned int slot_base;
+	unsigned int slot_index;
 
 	BUG_ON(!nslots);
+	BUG_ON(area_index >= mem->nareas);
 
 	/*
 	 * For mappings with an alignment requirement don't bother looping to
@@ -514,16 +608,20 @@ static int swiotlb_find_slots(struct device *dev, phys_addr_t orig_addr,
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
 
@@ -532,26 +630,26 @@ static int swiotlb_find_slots(struct device *dev, phys_addr_t orig_addr,
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
@@ -559,14 +657,43 @@ static int swiotlb_find_slots(struct device *dev, phys_addr_t orig_addr,
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
@@ -598,7 +725,7 @@ phys_addr_t swiotlb_tbl_map_single(struct device *dev, phys_addr_t orig_addr,
 		if (!(attrs & DMA_ATTR_NO_WARN))
 			dev_warn_ratelimited(dev,
 	"swiotlb buffer is full (sz: %zd bytes), total %lu (slots), used %lu (slots)\n",
-				 alloc_size, mem->nslabs, mem->used);
+				 alloc_size, mem->nslabs, mem_used(mem));
 		return (phys_addr_t)DMA_MAPPING_ERROR;
 	}
 
@@ -628,6 +755,8 @@ static void swiotlb_release_slots(struct device *dev, phys_addr_t tlb_addr)
 	unsigned int offset = swiotlb_align_offset(dev, tlb_addr);
 	int index = (tlb_addr - offset - mem->start) >> IO_TLB_SHIFT;
 	int nslots = nr_slots(mem->slots[index].alloc_size + offset);
+	int aindex = index / mem->area_nslabs;
+	struct io_tlb_area *area = &mem->areas[aindex];
 	int count, i;
 
 	/*
@@ -636,7 +765,9 @@ static void swiotlb_release_slots(struct device *dev, phys_addr_t tlb_addr)
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
@@ -660,8 +791,8 @@ static void swiotlb_release_slots(struct device *dev, phys_addr_t tlb_addr)
 	     io_tlb_offset(i) != IO_TLB_SEGSIZE - 1 && mem->slots[i].list;
 	     i--)
 		mem->slots[i].list = ++count;
-	mem->used -= nslots;
-	spin_unlock_irqrestore(&mem->lock, flags);
+	area->used -= nslots;
+	spin_unlock_irqrestore(&area->lock, flags);
 }
 
 /*
@@ -759,12 +890,14 @@ EXPORT_SYMBOL_GPL(is_swiotlb_active);
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
@@ -815,6 +948,9 @@ static int rmem_swiotlb_device_init(struct reserved_mem *rmem,
 	struct io_tlb_mem *mem = rmem->priv;
 	unsigned long nslabs = rmem->size >> IO_TLB_SHIFT;
 
+	/* Set Per-device io tlb area to one */
+	unsigned int nareas = 1;
+
 	/*
 	 * Since multiple devices can share the same pool, the private data,
 	 * io_tlb_mem struct, will be initialized by the first device attached
@@ -831,10 +967,18 @@ static int rmem_swiotlb_device_init(struct reserved_mem *rmem,
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
