Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 9557C513698
	for <lists.iommu@lfdr.de>; Thu, 28 Apr 2022 16:14:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4670240298;
	Thu, 28 Apr 2022 14:14:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hyvfzz5nEsAa; Thu, 28 Apr 2022 14:14:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id D4EC9401F8;
	Thu, 28 Apr 2022 14:14:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BDB83C002D;
	Thu, 28 Apr 2022 14:14:38 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4CE73C002D
 for <iommu@lists.linux-foundation.org>; Thu, 28 Apr 2022 14:14:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2B30E41A2C
 for <iommu@lists.linux-foundation.org>; Thu, 28 Apr 2022 14:14:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DXXHZTrGdRTR for <iommu@lists.linux-foundation.org>;
 Thu, 28 Apr 2022 14:14:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 665F74198B
 for <iommu@lists.linux-foundation.org>; Thu, 28 Apr 2022 14:14:35 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 u6-20020a17090a1f0600b001d86bd69427so4491460pja.5
 for <iommu@lists.linux-foundation.org>; Thu, 28 Apr 2022 07:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0UUXPJDraGbhFTVoIbnS8XgAby0hzaUlyipurHUShxA=;
 b=OPKAv1lB4sk0oLs5sGNAhS9Dwl7/ENyLSNSRjMJdO/nvlEwTsK9QalHUjbNwDr2JBt
 t7aql+4ZLYfxK/LGguw9ZLAl9OstwIeYcyEtzKKa2V2Y4XefDxCSPSef4xEtI77/Oe8I
 dSv2ruDaINqbNbTTJVbmRQPskwNewiy51S6NzBOcXGoHRfrK66QR0SvrdLg6Rywxbv4u
 WMnXEMFQjQNkscpZXpPNjU3Z3TAR7JoC+7+irOw7H96zX4CEBK7aWrtFCPZ3FkhCwTqN
 5BOAXJJPEQVkLNGG6moL15w5TRBN52RI5IxhBsg/oJLIcfKENvPBnUS3rFHVX5FCn+CD
 dAKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0UUXPJDraGbhFTVoIbnS8XgAby0hzaUlyipurHUShxA=;
 b=57L4bG/iY08KzP5pcPiegwCNLF/BSGEUSu143hNokcA3U25joo8csWrrKoBtj5DoJf
 InPoT/Xla6tGJFFKjO/y9AO9n7n2KJ133KLXZ6smJVzVEAutaJsyAPqNWLlbnLtFDGj5
 8GPtd74LXI8gvZbQ1DZVlCJSNaFvjFcqICKl4mdECzLmMVIAN18X9TVbzU0lbg3k3ftg
 Vys2gQtAnnZWWJgScftZwdeIGS0IGK2/k24OJk+MBDWoul3rG4dWI7yEwixfHscPB7uX
 ImOLM+xMWBibS8CV43lLz9U8mW8a52HvDumg3e6nV/G3mGWq7kL+QiVYi2N+9qfzBzmx
 O2NA==
X-Gm-Message-State: AOAM5312Ll5kQRRHAvPgfH9pJWoeGluqdJRRxTGDn1s+AGgPNzibSjtP
 7ZQTz/X1LXbPgMUm+eA5Vgk=
X-Google-Smtp-Source: ABdhPJx3oKpzJf14JM8e3akcHdJdzgdHIBV59CgvGcddyLqaWktNCE5X78fv+H/+1SMjtq4EI5c1lg==
X-Received: by 2002:a17:903:1206:b0:151:7d67:2924 with SMTP id
 l6-20020a170903120600b001517d672924mr33694577plh.45.1651155274381; 
 Thu, 28 Apr 2022 07:14:34 -0700 (PDT)
Received: from ubuntu-Virtual-Machine.corp.microsoft.com
 ([2001:4898:80e8:f:de19:84:6ee0:6f2e])
 by smtp.gmail.com with ESMTPSA id
 d8-20020a056a00198800b004fab740dbe6sm65331pfl.15.2022.04.28.07.14.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 07:14:33 -0700 (PDT)
From: Tianyu Lan <ltykernel@gmail.com>
To: hch@infradead.org, m.szyprowski@samsung.com, robin.murphy@arm.com,
 michael.h.kelley@microsoft.com, kys@microsoft.com
Subject: [RFC PATCH 1/2] swiotlb: Split up single swiotlb lock
Date: Thu, 28 Apr 2022 10:14:28 -0400
Message-Id: <20220428141429.1637028-2-ltykernel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220428141429.1637028-1-ltykernel@gmail.com>
References: <20220428141429.1637028-1-ltykernel@gmail.com>
MIME-Version: 1.0
Cc: parri.andrea@gmail.com, thomas.lendacky@amd.com, wei.liu@kernel.org,
 Andi Kleen <ak@linux.intel.com>, Tianyu Lan <Tianyu.Lan@microsoft.com>,
 linux-hyperv@vger.kernel.org, konrad.wilk@oracle.com,
 linux-kernel@vger.kernel.org, kirill.shutemov@intel.com,
 iommu@lists.linux-foundation.org, andi.kleen@intel.com, brijesh.singh@amd.com,
 vkuznets@redhat.com, hch@lst.de
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

This patch splits the swiotlb into individual areas which have their
own lock. When there are swiotlb map/allocate request, allocate
io tlb buffer from areas averagely and free the allocation back
to the associated area. This is to prepare to resolve the overhead
of single spinlock among device's queues. Per device may have its
own io tlb mem and bounce buffer pool.

This idea from Andi Kleen patch(https://github.com/intel/tdx/commit/4529b578
4c141782c72ec9bd9a92df2b68cb7d45). Rework it and make it may work
for individual device's io tlb mem. The device driver may determine
area number according to device queue number.

Based-on-idea-by: Andi Kleen <ak@linux.intel.com>
Signed-off-by: Tianyu Lan <Tianyu.Lan@microsoft.com>
---
 include/linux/swiotlb.h |  25 ++++++
 kernel/dma/swiotlb.c    | 173 +++++++++++++++++++++++++++++++---------
 2 files changed, 162 insertions(+), 36 deletions(-)

diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index 7ed35dd3de6e..489c249da434 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -62,6 +62,24 @@ dma_addr_t swiotlb_map(struct device *dev, phys_addr_t phys,
 #ifdef CONFIG_SWIOTLB
 extern enum swiotlb_force swiotlb_force;
 
+/**
+ * struct io_tlb_area - IO TLB memory area descriptor
+ *
+ * This is a single area with a single lock.
+ *
+ * @used:	The number of used IO TLB block.
+ * @area_index: The index of to tlb area.
+ * @index:	The slot index to start searching in this area for next round.
+ * @lock:	The lock to protect the above data structures in the map and
+ *		unmap calls.
+ */
+struct io_tlb_area {
+	unsigned long used;
+	unsigned int area_index;
+	unsigned int index;
+	spinlock_t lock;
+};
+
 /**
  * struct io_tlb_mem - IO TLB Memory Pool Descriptor
  *
@@ -89,6 +107,9 @@ extern enum swiotlb_force swiotlb_force;
  * @late_alloc:	%true if allocated using the page allocator
  * @force_bounce: %true if swiotlb bouncing is forced
  * @for_alloc:  %true if the pool is used for memory allocation
+ * @num_areas:  The area number in the pool.
+ * @area_start: The area index to start searching in the next round.
+ * @area_nslabs: The slot number in the area.
  */
 struct io_tlb_mem {
 	phys_addr_t start;
@@ -102,6 +123,10 @@ struct io_tlb_mem {
 	bool late_alloc;
 	bool force_bounce;
 	bool for_alloc;
+	unsigned int num_areas;
+	unsigned int area_start;
+	unsigned int area_nslabs;
+	struct io_tlb_area *areas;
 	struct io_tlb_slot {
 		phys_addr_t orig_addr;
 		size_t alloc_size;
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index e2ef0864eb1e..00a16f540f20 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -62,6 +62,8 @@
 
 #define INVALID_PHYS_ADDR (~(phys_addr_t)0)
 
+#define NUM_AREAS_DEFAULT 1
+
 static bool swiotlb_force_bounce;
 static bool swiotlb_force_disable;
 
@@ -70,6 +72,25 @@ struct io_tlb_mem io_tlb_default_mem;
 phys_addr_t swiotlb_unencrypted_base;
 
 static unsigned long default_nslabs = IO_TLB_DEFAULT_SIZE >> IO_TLB_SHIFT;
+static unsigned long default_area_num = NUM_AREAS_DEFAULT;
+
+static int swiotlb_setup_areas(struct io_tlb_mem *mem,
+		unsigned int num_areas, unsigned long nslabs)
+{
+	if (nslabs < 1 || !is_power_of_2(num_areas)) {
+		pr_err("swiotlb: Invalid areas parameter %d.\n", num_areas);
+		return -EINVAL;
+	}
+
+	/* Round up number of slabs to the next power of 2.
+	 * The last area is going be smaller than the rest if default_nslabs is
+	 * not power of two.
+	 */
+	mem->area_start = 0;
+	mem->num_areas = num_areas;
+	mem->area_nslabs = nslabs / num_areas;
+	return 0;
+}
 
 static int __init
 setup_io_tlb_npages(char *str)
@@ -114,6 +135,8 @@ void __init swiotlb_adjust_size(unsigned long size)
 		return;
 	size = ALIGN(size, IO_TLB_SIZE);
 	default_nslabs = ALIGN(size >> IO_TLB_SHIFT, IO_TLB_SEGSIZE);
+	swiotlb_setup_areas(&io_tlb_default_mem, default_area_num,
+			    default_nslabs);
 	pr_info("SWIOTLB bounce buffer size adjusted to %luMB", size >> 20);
 }
 
@@ -195,7 +218,8 @@ static void swiotlb_init_io_tlb_mem(struct io_tlb_mem *mem, phys_addr_t start,
 				    unsigned long nslabs, bool late_alloc)
 {
 	void *vaddr = phys_to_virt(start);
-	unsigned long bytes = nslabs << IO_TLB_SHIFT, i;
+	unsigned long bytes = nslabs << IO_TLB_SHIFT, i, j;
+	unsigned int block_list;
 
 	mem->nslabs = nslabs;
 	mem->start = start;
@@ -206,8 +230,13 @@ static void swiotlb_init_io_tlb_mem(struct io_tlb_mem *mem, phys_addr_t start,
 	if (swiotlb_force_bounce)
 		mem->force_bounce = true;
 
-	spin_lock_init(&mem->lock);
-	for (i = 0; i < mem->nslabs; i++) {
+	for (i = 0, j = 0, k = 0; i < mem->nslabs; i++) {
+		if (!(i % mem->area_nslabs)) {
+			mem->areas[j].index = 0;
+			spin_lock_init(&mem->areas[j].lock);
+			j++;
+		}
+
 		mem->slots[i].list = IO_TLB_SEGSIZE - io_tlb_offset(i);
 		mem->slots[i].orig_addr = INVALID_PHYS_ADDR;
 		mem->slots[i].alloc_size = 0;
@@ -272,6 +301,13 @@ void __init swiotlb_init_remap(bool addressing_limit, unsigned int flags,
 		panic("%s: Failed to allocate %zu bytes align=0x%lx\n",
 		      __func__, alloc_size, PAGE_SIZE);
 
+	swiotlb_setup_areas(&io_tlb_default_mem, default_area_num,
+		    default_nslabs);
+	mem->areas = memblock_alloc(sizeof(struct io_tlb_area) * mem->num_areas,
+			    SMP_CACHE_BYTES);
+	if (!mem->areas)
+		panic("%s: Failed to allocate mem->areas.\n", __func__);
+
 	swiotlb_init_io_tlb_mem(mem, __pa(tlb), default_nslabs, false);
 	mem->force_bounce = flags & SWIOTLB_FORCE;
 
@@ -296,7 +332,7 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask,
 	unsigned long nslabs = ALIGN(size >> IO_TLB_SHIFT, IO_TLB_SEGSIZE);
 	unsigned long bytes;
 	unsigned char *vstart = NULL;
-	unsigned int order;
+	unsigned int order, area_order;
 	int rc = 0;
 
 	if (swiotlb_force_disable)
@@ -334,18 +370,32 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask,
 		goto retry;
 	}
 
+	swiotlb_setup_areas(&io_tlb_default_mem, default_area_num,
+			    nslabs);
+
+	area_order = get_order(array_size(sizeof(*mem->areas),
+		default_area_num));
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
 
 	set_memory_decrypted((unsigned long)vstart, bytes >> PAGE_SHIFT);
 	swiotlb_init_io_tlb_mem(mem, virt_to_phys(vstart), nslabs, true);
 
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
@@ -353,6 +403,7 @@ void __init swiotlb_exit(void)
 	struct io_tlb_mem *mem = &io_tlb_default_mem;
 	unsigned long tbl_vaddr;
 	size_t tbl_size, slots_size;
+	unsigned int area_order;
 
 	if (swiotlb_force_bounce)
 		return;
@@ -367,9 +418,14 @@ void __init swiotlb_exit(void)
 
 	set_memory_encrypted(tbl_vaddr, tbl_size >> PAGE_SHIFT);
 	if (mem->late_alloc) {
+		area_order = get_order(array_size(sizeof(*mem->areas),
+			mem->num_areas));
+		free_pages((unsigned long)mem->areas, area_order);
 		free_pages(tbl_vaddr, get_order(tbl_size));
 		free_pages((unsigned long)mem->slots, get_order(slots_size));
 	} else {
+		memblock_free_late(__pa(mem->areas),
+				   mem->num_areas * sizeof(struct io_tlb_area));
 		memblock_free_late(mem->start, tbl_size);
 		memblock_free_late(__pa(mem->slots), slots_size);
 	}
@@ -472,9 +528,9 @@ static inline unsigned long get_max_slots(unsigned long boundary_mask)
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
@@ -483,10 +539,13 @@ static unsigned int wrap_index(struct io_tlb_mem *mem, unsigned int index)
  * Find a suitable number of IO TLB entries size that will fit this request and
  * allocate a buffer from that IO TLB pool.
  */
-static int swiotlb_find_slots(struct device *dev, phys_addr_t orig_addr,
-			      size_t alloc_size, unsigned int alloc_align_mask)
+static int swiotlb_do_find_slots(struct io_tlb_mem *mem,
+				 struct io_tlb_area *area,
+				 int area_index,
+				 struct device *dev, phys_addr_t orig_addr,
+				 size_t alloc_size,
+				 unsigned int alloc_align_mask)
 {
-	struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
 	unsigned long boundary_mask = dma_get_seg_boundary(dev);
 	dma_addr_t tbl_dma_addr =
 		phys_to_dma_unencrypted(dev, mem->start) & boundary_mask;
@@ -497,8 +556,11 @@ static int swiotlb_find_slots(struct device *dev, phys_addr_t orig_addr,
 	unsigned int index, wrap, count = 0, i;
 	unsigned int offset = swiotlb_align_offset(dev, orig_addr);
 	unsigned long flags;
+	unsigned int slot_base;
+	unsigned int slot_index;
 
 	BUG_ON(!nslots);
+	BUG_ON(area_index >= mem->num_areas);
 
 	/*
 	 * For mappings with an alignment requirement don't bother looping to
@@ -510,16 +572,20 @@ static int swiotlb_find_slots(struct device *dev, phys_addr_t orig_addr,
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
 
@@ -528,26 +594,26 @@ static int swiotlb_find_slots(struct device *dev, phys_addr_t orig_addr,
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
 		mem->slots[i].alloc_size =
-			alloc_size - (offset + ((i - index) << IO_TLB_SHIFT));
+			alloc_size - (offset + ((i - slot_index) << IO_TLB_SHIFT));
 	}
-	for (i = index - 1;
+	for (i = slot_index - 1;
 	     io_tlb_offset(i) != IO_TLB_SEGSIZE - 1 &&
 	     mem->slots[i].list; i--)
 		mem->slots[i].list = ++count;
@@ -555,14 +621,45 @@ static int swiotlb_find_slots(struct device *dev, phys_addr_t orig_addr,
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
+			      size_t alloc_size, unsigned int alloc_align_mask)
+{
+	struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
+	int start, i, index;
+
+	i = start = mem->area_start;
+	mem->area_start = (mem->area_start + 1) % mem->num_areas;
+
+	do {
+		index = swiotlb_do_find_slots(mem, mem->areas + i, i,
+					      dev, orig_addr, alloc_size,
+					      alloc_align_mask);
+		if (index >= 0)
+			return index;
+		if (++i >= mem->num_areas)
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
+	for (i = 0; i < mem->num_areas; i++)
+		used += mem->areas[i].used;
+	return used;
 }
 
 phys_addr_t swiotlb_tbl_map_single(struct device *dev, phys_addr_t orig_addr,
@@ -594,7 +691,7 @@ phys_addr_t swiotlb_tbl_map_single(struct device *dev, phys_addr_t orig_addr,
 		if (!(attrs & DMA_ATTR_NO_WARN))
 			dev_warn_ratelimited(dev,
 	"swiotlb buffer is full (sz: %zd bytes), total %lu (slots), used %lu (slots)\n",
-				 alloc_size, mem->nslabs, mem->used);
+				 alloc_size, mem->nslabs, mem_used(mem));
 		return (phys_addr_t)DMA_MAPPING_ERROR;
 	}
 
@@ -624,6 +721,8 @@ static void swiotlb_release_slots(struct device *dev, phys_addr_t tlb_addr)
 	unsigned int offset = swiotlb_align_offset(dev, tlb_addr);
 	int index = (tlb_addr - offset - mem->start) >> IO_TLB_SHIFT;
 	int nslots = nr_slots(mem->slots[index].alloc_size + offset);
+	int aindex = index / mem->area_nslabs;
+	struct io_tlb_area *area = &mem->areas[aindex];
 	int count, i;
 
 	/*
@@ -632,7 +731,9 @@ static void swiotlb_release_slots(struct device *dev, phys_addr_t tlb_addr)
 	 * While returning the entries to the free list, we merge the entries
 	 * with slots below and above the pool being returned.
 	 */
-	spin_lock_irqsave(&mem->lock, flags);
+	BUG_ON(aindex >= mem->num_areas);
+
+	spin_lock_irqsave(&area->lock, flags);
 	if (index + nslots < ALIGN(index + 1, IO_TLB_SEGSIZE))
 		count = mem->slots[index + nslots].list;
 	else
@@ -656,8 +757,8 @@ static void swiotlb_release_slots(struct device *dev, phys_addr_t tlb_addr)
 	     io_tlb_offset(i) != IO_TLB_SEGSIZE - 1 && mem->slots[i].list;
 	     i--)
 		mem->slots[i].list = ++count;
-	mem->used -= nslots;
-	spin_unlock_irqrestore(&mem->lock, flags);
+	area->used -= nslots;
+	spin_unlock_irqrestore(&area->lock, flags);
 }
 
 /*
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
