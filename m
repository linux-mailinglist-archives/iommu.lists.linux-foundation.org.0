Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D79DC33F45
	for <lists.iommu@lfdr.de>; Tue,  4 Jun 2019 08:55:16 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 80905E1C;
	Tue,  4 Jun 2019 06:55:13 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A797CDDE
	for <iommu@lists.linux-foundation.org>;
	Tue,  4 Jun 2019 06:55:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B77F419B
	for <iommu@lists.linux-foundation.org>;
	Tue,  4 Jun 2019 06:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=/4JrYgSgHdndUDJKcPMt28vvDvs6001/lFYfiqCR+8k=;
	b=kV1L0jbzTM25ktTT2kTpM8el2N
	0kEj0MDtBMvQ2Ljyct5xMT7zRuh/lxfzgeJCJZn27WeJtVLTV3o8lUSWvtB0zBuzbaIDvGl3Uk8fl
	myqFCYZEeVauOQYpeDd1h2dsq+n4px0Cufobx5V3ujQyBVOQEsdHxnU7OrTaQMWzdgs8jFg/WMvcc
	XceS4APlrhd2eDhESp3fNgLYsU23nUUmwMuPyTevnPN5QlcN21pl1bpt+BBxixZIkbLFhIwEo/bm2
	l2So5bkiWzmPtqeGbTLzviqP5Y+s4TjOkkq9ZE4wpHw4wX+NIzdzyqKyOGB5s5G4YXCtbKLa7UAv5
	uw+TV+Nw==;
Received: from 089144193064.atnat0002.highway.a1.net ([89.144.193.64]
	helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hY3Li-0003ST-8n; Tue, 04 Jun 2019 06:55:10 +0000
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org
Subject: [PATCH 1/3] vmalloc: lift the arm flag for coherent mappings to
	common code
Date: Tue,  4 Jun 2019 08:55:02 +0200
Message-Id: <20190604065504.25662-2-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190604065504.25662-1-hch@lst.de>
References: <20190604065504.25662-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_MED,
	SUSPICIOUS_RECIPS autolearn=no version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-xtensa@linux-xtensa.org, linux-kernel@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>, linux-mm@kvack.org,
	Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

The arm architecture had a VM_ARM_DMA_CONSISTENT flag to mark DMA
coherent remapping for a while.  Lift this flag to common code so
that we can use it generically.  We also check it in the only place
VM_USERMAP is directly check so that we can entirely replace that
flag as well (although I'm not even sure why we'd want to allow
remapping DMA appings, but I'd rather not change behavior).

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/arm/mm/dma-mapping.c | 22 +++++++---------------
 arch/arm/mm/mm.h          |  3 ---
 include/linux/vmalloc.h   |  2 ++
 mm/vmalloc.c              |  5 ++++-
 4 files changed, 13 insertions(+), 19 deletions(-)

diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
index 0a75058c11f3..e197b028e341 100644
--- a/arch/arm/mm/dma-mapping.c
+++ b/arch/arm/mm/dma-mapping.c
@@ -360,19 +360,13 @@ static void *
 __dma_alloc_remap(struct page *page, size_t size, gfp_t gfp, pgprot_t prot,
 	const void *caller)
 {
-	/*
-	 * DMA allocation can be mapped to user space, so lets
-	 * set VM_USERMAP flags too.
-	 */
-	return dma_common_contiguous_remap(page, size,
-			VM_ARM_DMA_CONSISTENT | VM_USERMAP,
+	return dma_common_contiguous_remap(page, size, VM_DMA_COHERENT,
 			prot, caller);
 }
 
 static void __dma_free_remap(void *cpu_addr, size_t size)
 {
-	dma_common_free_remap(cpu_addr, size,
-			VM_ARM_DMA_CONSISTENT | VM_USERMAP);
+	dma_common_free_remap(cpu_addr, size, VM_DMA_COHERENT);
 }
 
 #define DEFAULT_DMA_COHERENT_POOL_SIZE	SZ_256K
@@ -1387,8 +1381,8 @@ static void *
 __iommu_alloc_remap(struct page **pages, size_t size, gfp_t gfp, pgprot_t prot,
 		    const void *caller)
 {
-	return dma_common_pages_remap(pages, size,
-			VM_ARM_DMA_CONSISTENT | VM_USERMAP, prot, caller);
+	return dma_common_pages_remap(pages, size, VM_DMA_COHERENT, prot,
+			caller);
 }
 
 /*
@@ -1472,7 +1466,7 @@ static struct page **__iommu_get_pages(void *cpu_addr, unsigned long attrs)
 		return cpu_addr;
 
 	area = find_vm_area(cpu_addr);
-	if (area && (area->flags & VM_ARM_DMA_CONSISTENT))
+	if (area && (area->flags & VM_DMA_COHERENT))
 		return area->pages;
 	return NULL;
 }
@@ -1630,10 +1624,8 @@ void __arm_iommu_free_attrs(struct device *dev, size_t size, void *cpu_addr,
 		return;
 	}
 
-	if ((attrs & DMA_ATTR_NO_KERNEL_MAPPING) == 0) {
-		dma_common_free_remap(cpu_addr, size,
-			VM_ARM_DMA_CONSISTENT | VM_USERMAP);
-	}
+	if ((attrs & DMA_ATTR_NO_KERNEL_MAPPING) == 0)
+		dma_common_free_remap(cpu_addr, size, VM_DMA_COHERENT);
 
 	__iommu_remove_mapping(dev, handle, size);
 	__iommu_free_buffer(dev, pages, size, attrs);
diff --git a/arch/arm/mm/mm.h b/arch/arm/mm/mm.h
index 6b045c6653ea..6ec48188ef9f 100644
--- a/arch/arm/mm/mm.h
+++ b/arch/arm/mm/mm.h
@@ -68,9 +68,6 @@ extern void __flush_dcache_page(struct address_space *mapping, struct page *page
 #define VM_ARM_MTYPE(mt)		((mt) << 20)
 #define VM_ARM_MTYPE_MASK	(0x1f << 20)
 
-/* consistent regions used by dma_alloc_attrs() */
-#define VM_ARM_DMA_CONSISTENT	0x20000000
-
 
 struct static_vm {
 	struct vm_struct vm;
diff --git a/include/linux/vmalloc.h b/include/linux/vmalloc.h
index 51e131245379..500fa4fb06f0 100644
--- a/include/linux/vmalloc.h
+++ b/include/linux/vmalloc.h
@@ -18,6 +18,7 @@ struct notifier_block;		/* in notifier.h */
 #define VM_ALLOC		0x00000002	/* vmalloc() */
 #define VM_MAP			0x00000004	/* vmap()ed pages */
 #define VM_USERMAP		0x00000008	/* suitable for remap_vmalloc_range */
+#define VM_DMA_COHERENT		0x00000010	/* dma_alloc_coherent */
 #define VM_UNINITIALIZED	0x00000020	/* vm_struct is not fully initialized */
 #define VM_NO_GUARD		0x00000040      /* don't add guard page */
 #define VM_KASAN		0x00000080      /* has allocated kasan shadow memory */
@@ -26,6 +27,7 @@ struct notifier_block;		/* in notifier.h */
  * vfree_atomic().
  */
 #define VM_FLUSH_RESET_PERMS	0x00000100      /* Reset direct map and flush TLB on unmap */
+
 /* bits [20..32] reserved for arch specific ioremap internals */
 
 /*
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 233af6936c93..c4b5784bccc1 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -2948,7 +2948,7 @@ int remap_vmalloc_range_partial(struct vm_area_struct *vma, unsigned long uaddr,
 	if (!area)
 		return -EINVAL;
 
-	if (!(area->flags & VM_USERMAP))
+	if (!(area->flags & (VM_USERMAP | VM_DMA_COHERENT)))
 		return -EINVAL;
 
 	if (kaddr + size > area->addr + get_vm_area_size(area))
@@ -3438,6 +3438,9 @@ static int s_show(struct seq_file *m, void *p)
 	if (v->flags & VM_USERMAP)
 		seq_puts(m, " user");
 
+	if (v->flags & VM_DMA_COHERENT)
+		seq_puts(m, " dma-coherent");
+
 	if (is_vmalloc_addr(v->pages))
 		seq_puts(m, " vpages");
 
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
