Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B63514CA7
	for <lists.iommu@lfdr.de>; Fri, 29 Apr 2022 16:22:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F7A34007C;
	Fri, 29 Apr 2022 14:21:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JMHijQCLXze1; Fri, 29 Apr 2022 14:21:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 921E54007D;
	Fri, 29 Apr 2022 14:21:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 426A7C007C;
	Fri, 29 Apr 2022 14:21:54 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4B31BC002D
 for <iommu@lists.linux-foundation.org>; Fri, 29 Apr 2022 14:21:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3FC8A403A7
 for <iommu@lists.linux-foundation.org>; Fri, 29 Apr 2022 14:21:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rdmmdp9B3gD2 for <iommu@lists.linux-foundation.org>;
 Fri, 29 Apr 2022 14:21:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 795534000B
 for <iommu@lists.linux-foundation.org>; Fri, 29 Apr 2022 14:21:52 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 w17-20020a17090a529100b001db302efed6so5896978pjh.4
 for <iommu@lists.linux-foundation.org>; Fri, 29 Apr 2022 07:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J3vXFpPXGlLbZdZy5pIJRdszv6m+Ytkgy7iGJnPeizo=;
 b=TQxvpMhO2gZBh9jvK4EdPSiB3vxSViIvh9NZkvPW8Snkh4inY8C7lXWYMMdHjwRqZm
 pKovHkAW66ey2KmI9e3JGy+dUx4K9hOEIJOqpV7FbxExEDonVh+aj/+0KOFk3AyeFa5Q
 jy6Mn3IUKGlXEJ7xGpdi4aqdSOaiYKiF7BwEuu1oXvAqKjNY7hz7bAjBYhOQYI7tdpmD
 CAO7u96taMws9h/M+uhPXBwlP8yF6DogPiBMaFZ81FOAkjAW9IaXtKcGEdUoBNuGhHAq
 iWhgg+kbCPwYxYW45/Od2H1BMdDE2WdSrcnqpOJKIl+eBU8ysotyvd2VYE5vVguGnFEr
 zyBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J3vXFpPXGlLbZdZy5pIJRdszv6m+Ytkgy7iGJnPeizo=;
 b=r4pjNkKHWgvWHI/WDBl8i8UTs4C4kNLBwnOjZUFQkHgRPloatCSvPhJua/CxT2jEKx
 qppIYiFXu3U+c0IOvvkiHB2PWbekzaD57384eS2Giqbs3Px1rWza1lE05JZboMP1iPC8
 Fjb5t4xMeajdoVhjPvU+uQnok6rQG8XTIDjOm7CB4HV47oJnjBdwG+RkxICSnM6iQp1e
 9MXHWu1glv0W8nU1R4Sk/9tDElh/kbBbeVCEGDJYdIjot6m9FQbGXE0B9197wBu32Pm6
 iWuiLLhlP/9AmvFwdXn37XlsAXrIsqvLB+LG0izc4YvsfUY155QoZ1DeV9f0s+CF0j/w
 qCEg==
X-Gm-Message-State: AOAM532Ks/Hu7yte8lWL6NoFoTCFnWLmFJbEQQvFKEbkyKBHqL1S8SP2
 Sz40ARDbY6BYs1OesfkxEBg=
X-Google-Smtp-Source: ABdhPJzGZCwD0bnPbSsijlE3SmIzGkLeVQ7WwrR35HkYHR9AkP80QN7Q8MJBF2+0bWm+AbVZLqYWQw==
X-Received: by 2002:a17:902:f68e:b0:15c:4367:d1a0 with SMTP id
 l14-20020a170902f68e00b0015c4367d1a0mr35786022plg.164.1651242111710; 
 Fri, 29 Apr 2022 07:21:51 -0700 (PDT)
Received: from ubuntu-Virtual-Machine.corp.microsoft.com
 ([2001:4898:80e8:37:e92b:c72c:d971:a866])
 by smtp.gmail.com with ESMTPSA id
 d16-20020a056a00245000b004f7728a4346sm3544650pfj.79.2022.04.29.07.21.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 07:21:51 -0700 (PDT)
From: Tianyu Lan <ltykernel@gmail.com>
To: hch@infradead.org, m.szyprowski@samsung.com, robin.murphy@arm.com,
 michael.h.kelley@microsoft.com, kys@microsoft.com
Subject: [RFC PATCH] swiotlb: Add Child IO TLB mem support
Date: Fri, 29 Apr 2022 10:21:47 -0400
Message-Id: <20220429142147.1725184-1-ltykernel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <e7b644f0-6c90-fe99-792d-75c38505dc54@arm.com>
References: <e7b644f0-6c90-fe99-792d-75c38505dc54@arm.com>
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

Traditionally swiotlb was not performance critical because it was only
used for slow devices. But in some setups, like TDX/SEV confidential
guests, all IO has to go through swiotlb. Currently swiotlb only has a
single lock. Under high IO load with multiple CPUs this can lead to
significant lock contention on the swiotlb lock.

This patch adds child IO TLB mem support to resolve spinlock overhead
among device's queues. Each device may allocate IO tlb mem and setup
child IO TLB mem according to queue number. Swiotlb code allocates
bounce buffer among child IO tlb mem iterately.

Signed-off-by: Tianyu Lan <Tianyu.Lan@microsoft.com>
---
 include/linux/swiotlb.h |  7 +++
 kernel/dma/swiotlb.c    | 96 ++++++++++++++++++++++++++++++++++++-----
 2 files changed, 93 insertions(+), 10 deletions(-)

diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index 7ed35dd3de6e..4a3f6a7b4b7e 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -89,6 +89,9 @@ extern enum swiotlb_force swiotlb_force;
  * @late_alloc:	%true if allocated using the page allocator
  * @force_bounce: %true if swiotlb bouncing is forced
  * @for_alloc:  %true if the pool is used for memory allocation
+ * @child_nslot:The number of IO TLB slot in the child IO TLB mem.
+ * @num_child:  The child io tlb mem number in the pool.
+ * @child_start:The child index to start searching in the next round.
  */
 struct io_tlb_mem {
 	phys_addr_t start;
@@ -102,6 +105,10 @@ struct io_tlb_mem {
 	bool late_alloc;
 	bool force_bounce;
 	bool for_alloc;
+	unsigned int num_child;
+	unsigned int child_nslot;
+	unsigned int child_start;
+	struct io_tlb_mem *child;
 	struct io_tlb_slot {
 		phys_addr_t orig_addr;
 		size_t alloc_size;
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index e2ef0864eb1e..382fa2288645 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -207,6 +207,25 @@ static void swiotlb_init_io_tlb_mem(struct io_tlb_mem *mem, phys_addr_t start,
 		mem->force_bounce = true;
 
 	spin_lock_init(&mem->lock);
+
+	if (mem->num_child) {
+		mem->child_nslot = nslabs / mem->num_child;
+		mem->child_start = 0;
+
+		/*
+		 * Initialize child IO TLB mem, divide IO TLB pool
+		 * into child number. Reuse parent mem->slot in the
+		 * child mem->slot.  
+		 */
+		for (i = 0; i < mem->num_child; i++) {
+			mem->num_child = 0;
+			mem->child[i].slots = mem->slots + i * mem->child_nslot;
+			swiotlb_init_io_tlb_mem(&mem->child[i],
+				start + ((i * mem->child_nslot) << IO_TLB_SHIFT),
+				mem->child_nslot, late_alloc);
+		}
+	}
+
 	for (i = 0; i < mem->nslabs; i++) {
 		mem->slots[i].list = IO_TLB_SEGSIZE - io_tlb_offset(i);
 		mem->slots[i].orig_addr = INVALID_PHYS_ADDR;
@@ -336,16 +355,18 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask,
 
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
+	free_pages((unsigned long)vstart, order);
+	return -ENOMEM;
 }
 
 void __init swiotlb_exit(void)
@@ -483,10 +504,11 @@ static unsigned int wrap_index(struct io_tlb_mem *mem, unsigned int index)
  * Find a suitable number of IO TLB entries size that will fit this request and
  * allocate a buffer from that IO TLB pool.
  */
-static int swiotlb_find_slots(struct device *dev, phys_addr_t orig_addr,
-			      size_t alloc_size, unsigned int alloc_align_mask)
+static int swiotlb_do_find_slots(struct io_tlb_mem *mem,
+				 struct device *dev, phys_addr_t orig_addr,
+				 size_t alloc_size,
+				 unsigned int alloc_align_mask)
 {
-	struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
 	unsigned long boundary_mask = dma_get_seg_boundary(dev);
 	dma_addr_t tbl_dma_addr =
 		phys_to_dma_unencrypted(dev, mem->start) & boundary_mask;
@@ -565,6 +587,46 @@ static int swiotlb_find_slots(struct device *dev, phys_addr_t orig_addr,
 	return index;
 }
 
+static int swiotlb_find_slots(struct device *dev, phys_addr_t orig_addr,
+			      size_t alloc_size, unsigned int alloc_align_mask)
+{
+	struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
+	struct io_tlb_mem *child_mem = mem;
+	int start = 0, i = 0, index;
+
+	if (mem->num_child) {
+		i = start = mem->child_start;
+		mem->child_start = (mem->child_start + 1) % mem->num_child;
+		child_mem = mem->child;
+	}
+
+	do {
+		index = swiotlb_do_find_slots(child_mem + i, dev, orig_addr,
+					      alloc_size, alloc_align_mask);
+		if (index >= 0)
+			return i * mem->child_nslot + index;
+		if (++i >= mem->num_child)
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
+	if (mem->num_child) {
+		for (i = 0; i < mem->num_child; i++)
+			used += mem->child[i].used;
+	} else {
+		used = mem->used;
+	}
+
+	return used;
+}
+
 phys_addr_t swiotlb_tbl_map_single(struct device *dev, phys_addr_t orig_addr,
 		size_t mapping_size, size_t alloc_size,
 		unsigned int alloc_align_mask, enum dma_data_direction dir,
@@ -594,7 +656,7 @@ phys_addr_t swiotlb_tbl_map_single(struct device *dev, phys_addr_t orig_addr,
 		if (!(attrs & DMA_ATTR_NO_WARN))
 			dev_warn_ratelimited(dev,
 	"swiotlb buffer is full (sz: %zd bytes), total %lu (slots), used %lu (slots)\n",
-				 alloc_size, mem->nslabs, mem->used);
+				     alloc_size, mem->nslabs, mem_used(mem));
 		return (phys_addr_t)DMA_MAPPING_ERROR;
 	}
 
@@ -617,9 +679,9 @@ phys_addr_t swiotlb_tbl_map_single(struct device *dev, phys_addr_t orig_addr,
 	return tlb_addr;
 }
 
-static void swiotlb_release_slots(struct device *dev, phys_addr_t tlb_addr)
+static void swiotlb_do_release_slots(struct io_tlb_mem *mem,
+				     struct device *dev, phys_addr_t tlb_addr)
 {
-	struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
 	unsigned long flags;
 	unsigned int offset = swiotlb_align_offset(dev, tlb_addr);
 	int index = (tlb_addr - offset - mem->start) >> IO_TLB_SHIFT;
@@ -660,6 +722,20 @@ static void swiotlb_release_slots(struct device *dev, phys_addr_t tlb_addr)
 	spin_unlock_irqrestore(&mem->lock, flags);
 }
 
+static void swiotlb_release_slots(struct device *dev, phys_addr_t tlb_addr)
+{
+	struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
+	int index, offset;
+
+	if (mem->num_child) {
+		offset = swiotlb_align_offset(dev, tlb_addr);	
+		index = (tlb_addr - offset - mem->start) >> IO_TLB_SHIFT;
+		mem = &mem->child[index / mem->child_nslot];
+	}
+
+	swiotlb_do_release_slots(mem, dev, tlb_addr);
+}
+
 /*
  * tlb_addr is the physical address of the bounce buffer to unmap.
  */
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
