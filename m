Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 8364D516FDB
	for <lists.iommu@lfdr.de>; Mon,  2 May 2022 14:54:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2885E83104;
	Mon,  2 May 2022 12:54:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5KeNzukTX_Y2; Mon,  2 May 2022 12:54:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id DF0FD830AB;
	Mon,  2 May 2022 12:54:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B75D9C002D;
	Mon,  2 May 2022 12:54:48 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 86A9FC0085
 for <iommu@lists.linux-foundation.org>; Mon,  2 May 2022 12:54:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6EF7C83104
 for <iommu@lists.linux-foundation.org>; Mon,  2 May 2022 12:54:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YW5tZzmpJiz1 for <iommu@lists.linux-foundation.org>;
 Mon,  2 May 2022 12:54:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6DAD9830AB
 for <iommu@lists.linux-foundation.org>; Mon,  2 May 2022 12:54:46 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id e5so542711pgc.5
 for <iommu@lists.linux-foundation.org>; Mon, 02 May 2022 05:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SlDjCmMQFfT9AeNC8NegD/tFy0XkVjLn3XIxf/dgkUY=;
 b=ftAvtbWbIL8Sc+zSL91nsd4Rd6IWzifBdgeCzMdc5Fkpa4lpr0uQZno0PrWXg5oRKW
 Pt/KEKINDvvhEQsaQrOFFzqhbKfpwx6ZRlCVp1dMDIKZ3rn+u+CP2s5yfY61WtTEhVJ1
 dFtNUyUr8VIqChsN4GkBS6zBoFPQjnH9LXFD4zb6fnHL9uWiC+S81tWbhTdSRLrGRO5k
 VVndXFJi+ArYP8uehDUr4pnj0uzn4uhlF/D4jbtPYO2oCDIZMwy+7/msq/kuupw15R80
 cT6eGpx5J9kAYBEkkf5yOGhpY0AZKazHhqU4U34oPytJamI+qZftjJjpPdgH4u8h+Xci
 FnkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SlDjCmMQFfT9AeNC8NegD/tFy0XkVjLn3XIxf/dgkUY=;
 b=O04XkUQv3JbIcCyBcbRoiTGRzAULoT90BrlZE3MKv3BUuBwY4yIETI9GaMo2RSeI/h
 31jCcBzPJ0z61C2V7cdT8pyLH0azY8w+dAa/O2uySfvMxhfRJ0N/kLlZ6Ujb6r3dqMsi
 utGOJACPknqGvepvVT648r5v4XDLdVzGjqpNu/KzNfVXP0pK6XyjPaqn9Jb582xQiPTA
 9nGLE68dGQPO9JXp0aNWy1duWeNHcZdP+r2fUiKam3Oy6WP0+D/DkPYCcYl+BT3UfIE6
 vVhPaD7Swdi4vMvJAd7Leiviu7HMWTob0DpGX4GPeB6jYnDxMkXFT+3RcvaOM36vtPBZ
 XcaQ==
X-Gm-Message-State: AOAM533MiF1gyt/3rJt8jWgcjVy2rP5HY9olnAAZMRIOBYpLrJtyhT7q
 2MTuwt4YszBHPz1sHBVu8oU=
X-Google-Smtp-Source: ABdhPJxBma0XeN87MjfvrV1Mz9kpqLJleLcZWyrg3vdxGiIrrurORTX9rAjQPUJmIauvFMo/Vm9Gtg==
X-Received: by 2002:a63:981a:0:b0:398:49ba:a65e with SMTP id
 q26-20020a63981a000000b0039849baa65emr9642106pgd.231.1651496085748; 
 Mon, 02 May 2022 05:54:45 -0700 (PDT)
Received: from ubuntu-Virtual-Machine.corp.microsoft.com
 ([2001:4898:80e8:3:7753:ad69:7fc0:9dfc])
 by smtp.gmail.com with ESMTPSA id
 n5-20020a62e505000000b0050dc76281cesm4634892pff.168.2022.05.02.05.54.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 May 2022 05:54:45 -0700 (PDT)
From: Tianyu Lan <ltykernel@gmail.com>
To: hch@infradead.org, m.szyprowski@samsung.com, robin.murphy@arm.com,
 michael.h.kelley@microsoft.com, kys@microsoft.com
Subject: [RFC PATCH V2 2/2] Swiotlb: Add device bounce buffer allocation
 interface
Date: Mon,  2 May 2022 08:54:36 -0400
Message-Id: <20220502125436.23607-3-ltykernel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220502125436.23607-1-ltykernel@gmail.com>
References: <20220502125436.23607-1-ltykernel@gmail.com>
MIME-Version: 1.0
Cc: parri.andrea@gmail.com, thomas.lendacky@amd.com, wei.liu@kernel.org,
 Tianyu Lan <Tianyu.Lan@microsoft.com>, linux-hyperv@vger.kernel.org,
 konrad.wilk@oracle.com, linux-kernel@vger.kernel.org,
 kirill.shutemov@intel.com, iommu@lists.linux-foundation.org,
 andi.kleen@intel.com, brijesh.singh@amd.com, vkuznets@redhat.com, hch@lst.de
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

In SEV/TDX Confidential VM, device DMA transaction needs use swiotlb
bounce buffer to share data with host/hypervisor. The swiotlb spinlock
introduces overhead among devices if they share io tlb mem. Avoid such
issue, introduce swiotlb_device_allocate() to allocate device bounce
buffer from default io tlb pool and set up child IO tlb mem for queue
bounce buffer allocaton according input queue number. Device may have
multi io queues and setting up the same number of child io tlb mem may
help to resolve spinlock overhead among queues.

Introduce IO TLB Block unit(2MB) concepts to allocate big bounce buffer
from default pool for devices. IO TLB segment(256k) is too small.

Signed-off-by: Tianyu Lan <Tianyu.Lan@microsoft.com>
---
 include/linux/swiotlb.h |  35 +++++++-
 kernel/dma/swiotlb.c    | 195 +++++++++++++++++++++++++++++++++++++++-
 2 files changed, 225 insertions(+), 5 deletions(-)

diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index 4a3f6a7b4b7e..efd29e884fd7 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -31,6 +31,14 @@ struct scatterlist;
 #define IO_TLB_SHIFT 11
 #define IO_TLB_SIZE (1 << IO_TLB_SHIFT)
 
+/*
+ * IO TLB BLOCK UNIT as device bounce buffer allocation unit.
+ * This allows device allocates bounce buffer from default io
+ * tlb pool.
+ */
+#define IO_TLB_BLOCKSIZE   (8 * IO_TLB_SEGSIZE)
+#define IO_TLB_BLOCK_UNIT  (IO_TLB_BLOCKSIZE << IO_TLB_SHIFT)
+
 /* default to 64MB */
 #define IO_TLB_DEFAULT_SIZE (64UL<<20)
 
@@ -89,9 +97,11 @@ extern enum swiotlb_force swiotlb_force;
  * @late_alloc:	%true if allocated using the page allocator
  * @force_bounce: %true if swiotlb bouncing is forced
  * @for_alloc:  %true if the pool is used for memory allocation
- * @child_nslot:The number of IO TLB slot in the child IO TLB mem.
  * @num_child:  The child io tlb mem number in the pool.
+ * @child_nslot:The number of IO TLB slot in the child IO TLB mem.
+ * @child_nblock:The number of IO TLB block in the child IO TLB mem.
  * @child_start:The child index to start searching in the next round.
+ * @block_start:The block index to start searching in the next round.
  */
 struct io_tlb_mem {
 	phys_addr_t start;
@@ -107,8 +117,16 @@ struct io_tlb_mem {
 	bool for_alloc;
 	unsigned int num_child;
 	unsigned int child_nslot;
+	unsigned int child_nblock;
 	unsigned int child_start;
+	unsigned int block_index;
 	struct io_tlb_mem *child;
+	struct io_tlb_mem *parent;
+	struct io_tlb_block {
+		size_t alloc_size;
+		unsigned long start_slot;
+		unsigned int list;
+	} *block;
 	struct io_tlb_slot {
 		phys_addr_t orig_addr;
 		size_t alloc_size;
@@ -137,6 +155,10 @@ unsigned int swiotlb_max_segment(void);
 size_t swiotlb_max_mapping_size(struct device *dev);
 bool is_swiotlb_active(struct device *dev);
 void __init swiotlb_adjust_size(unsigned long size);
+int swiotlb_device_allocate(struct device *dev,
+			    unsigned int area_num,
+			    unsigned long size);
+void swiotlb_device_free(struct device *dev);
 #else
 static inline void swiotlb_init(bool addressing_limited, unsigned int flags)
 {
@@ -169,6 +191,17 @@ static inline bool is_swiotlb_active(struct device *dev)
 static inline void swiotlb_adjust_size(unsigned long size)
 {
 }
+
+void swiotlb_device_free(struct device *dev)
+{
+}
+
+int swiotlb_device_allocate(struct device *dev,
+			    unsigned int area_num,
+			    unsigned long size)
+{
+	return -ENOMEM;
+}
 #endif /* CONFIG_SWIOTLB */
 
 extern void swiotlb_print_info(void);
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 32e8f42530b6..f8a0711cd9de 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -195,7 +195,8 @@ static void swiotlb_init_io_tlb_mem(struct io_tlb_mem *mem, phys_addr_t start,
 				    unsigned long nslabs, bool late_alloc)
 {
 	void *vaddr = phys_to_virt(start);
-	unsigned long bytes = nslabs << IO_TLB_SHIFT, i;
+	unsigned long bytes = nslabs << IO_TLB_SHIFT, i, j;
+	unsigned int block_num = nslabs / IO_TLB_BLOCKSIZE;
 
 	mem->nslabs = nslabs;
 	mem->start = start;
@@ -210,6 +211,7 @@ static void swiotlb_init_io_tlb_mem(struct io_tlb_mem *mem, phys_addr_t start,
 
 	if (mem->num_child) {
 		mem->child_nslot = nslabs / mem->num_child;
+		mem->child_nblock = block_num / mem->num_child;
 		mem->child_start = 0;
 
 		/*
@@ -219,15 +221,24 @@ static void swiotlb_init_io_tlb_mem(struct io_tlb_mem *mem, phys_addr_t start,
 		 */
 		for (i = 0; i < mem->num_child; i++) {
 			mem->child[i].slots = mem->slots + i * mem->child_nslot;
-			mem->child[i].num_child = 0;
+			mem->child[i].block = mem->block + i * mem->child_nblock;
+			mem->child[i].num_child = 0;			
 
 			swiotlb_init_io_tlb_mem(&mem->child[i],
 				start + ((i * mem->child_nslot) << IO_TLB_SHIFT),
 				mem->child_nslot, late_alloc);
 		}
+
+		return;
 	}
 
-	for (i = 0; i < mem->nslabs; i++) {
+	for (i = 0, j = 0; i < mem->nslabs; i++) {
+		if (!(i % IO_TLB_BLOCKSIZE)) {
+			mem->block[j].alloc_size = 0;
+			mem->block[j].list = block_num--;
+			j++;
+		}
+
 		mem->slots[i].list = IO_TLB_SEGSIZE - io_tlb_offset(i);
 		mem->slots[i].orig_addr = INVALID_PHYS_ADDR;
 		mem->slots[i].alloc_size = 0;
@@ -292,6 +303,13 @@ void __init swiotlb_init_remap(bool addressing_limit, unsigned int flags,
 		panic("%s: Failed to allocate %zu bytes align=0x%lx\n",
 		      __func__, alloc_size, PAGE_SIZE);
 
+	mem->num_child = 0;
+	mem->block = memblock_alloc(sizeof(struct io_tlb_block) *
+				    (default_nslabs / IO_TLB_BLOCKSIZE),
+				     SMP_CACHE_BYTES);
+	if (!mem->block)
+		panic("%s: Failed to allocate mem->block.\n", __func__);
+
 	swiotlb_init_io_tlb_mem(mem, __pa(tlb), default_nslabs, false);
 	mem->force_bounce = flags & SWIOTLB_FORCE;
 
@@ -316,7 +334,7 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask,
 	unsigned long nslabs = ALIGN(size >> IO_TLB_SHIFT, IO_TLB_SEGSIZE);
 	unsigned long bytes;
 	unsigned char *vstart = NULL;
-	unsigned int order;
+	unsigned int order, block_order;
 	int rc = 0;
 
 	if (swiotlb_force_disable)
@@ -354,6 +372,13 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask,
 		goto retry;
 	}
 
+	block_order = get_order(array_size(sizeof(*mem->block),
+		nslabs / IO_TLB_BLOCKSIZE));
+	mem->block = (struct io_tlb_block *)
+		__get_free_pages(GFP_KERNEL | __GFP_ZERO, block_order);
+	if (!mem->block)
+		goto error_block;
+
 	mem->slots = (void *)__get_free_pages(GFP_KERNEL | __GFP_ZERO,
 		get_order(array_size(sizeof(*mem->slots), nslabs)));
 	if (!mem->slots)
@@ -366,6 +391,8 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask,
 	return 0;
 
 error_slots:
+	free_pages((unsigned long)mem->block, block_order);
+error_block:
 	free_pages((unsigned long)vstart, order);
 	return -ENOMEM;
 }
@@ -375,6 +402,7 @@ void __init swiotlb_exit(void)
 	struct io_tlb_mem *mem = &io_tlb_default_mem;
 	unsigned long tbl_vaddr;
 	size_t tbl_size, slots_size;
+	unsigned int block_array_size, block_order;
 
 	if (swiotlb_force_bounce)
 		return;
@@ -386,12 +414,16 @@ void __init swiotlb_exit(void)
 	tbl_vaddr = (unsigned long)phys_to_virt(mem->start);
 	tbl_size = PAGE_ALIGN(mem->end - mem->start);
 	slots_size = PAGE_ALIGN(array_size(sizeof(*mem->slots), mem->nslabs));
+	block_array_size = array_size(sizeof(*mem->block), mem->nslabs / IO_TLB_BLOCKSIZE);
 
 	set_memory_encrypted(tbl_vaddr, tbl_size >> PAGE_SHIFT);
 	if (mem->late_alloc) {
+		block_order = get_order(block_array_size);
+		free_pages((unsigned long)mem->block, block_order);
 		free_pages(tbl_vaddr, get_order(tbl_size));
 		free_pages((unsigned long)mem->slots, get_order(slots_size));
 	} else {
+		memblock_free_late(__pa(mem->block), block_array_size);
 		memblock_free_late(mem->start, tbl_size);
 		memblock_free_late(__pa(mem->slots), slots_size);
 	}
@@ -839,6 +871,161 @@ static int __init __maybe_unused swiotlb_create_default_debugfs(void)
 late_initcall(swiotlb_create_default_debugfs);
 #endif
 
+static void swiotlb_do_free_block(struct io_tlb_mem *mem,
+		phys_addr_t start, unsigned int block_num)
+{
+
+	unsigned int start_slot = (start - mem->start) >> IO_TLB_SHIFT;
+	unsigned int block_index = start_slot / IO_TLB_BLOCKSIZE;
+	unsigned int mem_block_num = mem->nslabs / IO_TLB_BLOCKSIZE;
+	unsigned long flags;
+	int count, i, num;
+
+	spin_lock_irqsave(&mem->lock, flags);
+	if (block_index + block_num < mem_block_num)
+		count = mem->block[block_index + mem_block_num].list;
+	else
+		count = 0;
+
+
+	for (i = block_index + block_num; i >= block_index; i--) {
+		mem->block[i].list = ++count;
+		/* Todo: recover slot->list and alloc_size here. */
+	}
+
+	for (i = block_index - 1, num = block_index % mem_block_num;
+	    i < num && mem->block[i].list; i--)
+		mem->block[i].list = ++count;
+
+	spin_unlock_irqrestore(&mem->lock, flags);
+}
+
+static void swiotlb_free_block(struct io_tlb_mem *mem,
+			       phys_addr_t start, unsigned int block_num)
+{
+	unsigned int slot_index, child_index;
+
+	if (mem->num_child) {
+		slot_index = (start - mem->start) >> IO_TLB_SHIFT;
+		child_index = slot_index / mem->child_nslot;
+
+		swiotlb_do_free_block(&mem->child[child_index],
+				      start, block_num);
+	} else {
+		swiotlb_do_free_block(mem, start, block_num);
+	}
+}
+
+void swiotlb_device_free(struct device *dev)
+{
+	struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
+	struct io_tlb_mem *parent_mem = dev->dma_io_tlb_mem->parent;
+
+	swiotlb_free_block(parent_mem, mem->start, mem->nslabs / IO_TLB_BLOCKSIZE);
+}
+
+
+static struct page *swiotlb_alloc_block(struct io_tlb_mem *mem, unsigned int block_num)
+{
+	unsigned int block_index, nslot;
+	phys_addr_t tlb_addr;
+	unsigned long flags;
+	int i, j;
+
+	if (!mem || !mem->block)
+		return NULL;
+
+	spin_lock_irqsave(&mem->lock, flags);
+	block_index = mem->block_index;
+
+	/* Todo: Search more blocks. */
+	if (mem->block[block_index].list < block_num) {
+		spin_unlock_irqrestore(&mem->lock, flags);
+		return NULL;
+	}
+
+	/* Update block and slot list. */
+	for (i = block_index; i < block_index + block_num; i++) {
+		mem->block[i].list = 0;
+		mem->block[i].alloc_size = IO_TLB_BLOCKSIZE;
+		for (j = 0; j < IO_TLB_BLOCKSIZE; j++) {
+			nslot = i * IO_TLB_BLOCKSIZE + j;
+			mem->slots[nslot].list = 0;
+			mem->slots[nslot].alloc_size = IO_TLB_SIZE;
+		}
+	}
+
+	mem->index = nslot + 1;
+	mem->block_index += block_num;
+	mem->used += block_num * IO_TLB_BLOCKSIZE;
+	spin_unlock_irqrestore(&mem->lock, flags);
+
+	tlb_addr = slot_addr(mem->start, block_index * IO_TLB_BLOCKSIZE);
+	return pfn_to_page(PFN_DOWN(tlb_addr));
+}
+
+/*
+ * swiotlb_device_allocate - Allocate bounce buffer fo device from
+ * default io tlb pool. The allocation size should be aligned with
+ * IO_TLB_BLOCK_UNIT.
+ */
+int swiotlb_device_allocate(struct device *dev,
+			    unsigned int queue_num,
+			    unsigned long size)
+{
+	struct io_tlb_mem *mem, *parent_mem = dev->dma_io_tlb_mem;
+	unsigned long nslabs = ALIGN(size >> IO_TLB_SHIFT, IO_TLB_BLOCKSIZE);
+	struct page *page;
+	int ret = -ENOMEM;
+
+	page = swiotlb_alloc_block(parent_mem, nslabs / IO_TLB_BLOCKSIZE);
+	if (!page)
+		return -ENOMEM;
+
+	mem = kzalloc(sizeof(*mem), GFP_KERNEL);
+	if (!mem)
+		goto error_mem;
+
+	mem->slots = kzalloc(array_size(sizeof(*mem->slots), nslabs),
+			     GFP_KERNEL);
+	if (!mem->slots)
+		goto error_slots;
+
+	mem->block = kcalloc(nslabs / IO_TLB_BLOCKSIZE,
+				sizeof(struct io_tlb_block),
+				GFP_KERNEL);
+	if (!mem->block)
+		goto error_block;
+
+	mem->num_child = queue_num;
+	mem->child = kcalloc(queue_num,
+				sizeof(struct io_tlb_mem),
+				GFP_KERNEL);
+	if (!mem->child)
+		goto error_child;
+
+
+	swiotlb_init_io_tlb_mem(mem, page_to_phys(page), nslabs, true);
+	mem->force_bounce = true;
+	mem->for_alloc = true;
+
+	mem->vaddr = parent_mem->vaddr + page_to_phys(page) -  parent_mem->start;
+	dev->dma_io_tlb_mem->parent = parent_mem;
+	dev->dma_io_tlb_mem = mem;
+	return 0;
+
+error_child:
+	kfree(mem->block);
+error_block:
+	kfree(mem->slots);
+error_slots:
+	kfree(mem);
+error_mem:
+	swiotlb_free_block(mem, page_to_phys(page), nslabs / IO_TLB_BLOCKSIZE);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(swiotlb_device_allocate);
+
 #ifdef CONFIG_DMA_RESTRICTED_POOL
 
 struct page *swiotlb_alloc(struct device *dev, size_t size)
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
