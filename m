Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 741B24D7BBD
	for <lists.iommu@lfdr.de>; Mon, 14 Mar 2022 08:32:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF155405EE;
	Mon, 14 Mar 2022 07:32:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DKckJZRWvVMP; Mon, 14 Mar 2022 07:32:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id AC9A9405F0;
	Mon, 14 Mar 2022 07:32:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 83BF3C000B;
	Mon, 14 Mar 2022 07:32:17 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ACAB4C000B
 for <iommu@lists.linux-foundation.org>; Mon, 14 Mar 2022 07:32:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B71540270
 for <iommu@lists.linux-foundation.org>; Mon, 14 Mar 2022 07:32:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5-tNdJs7VZcg for <iommu@lists.linux-foundation.org>;
 Mon, 14 Mar 2022 07:32:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C8A4E40261
 for <iommu@lists.linux-foundation.org>; Mon, 14 Mar 2022 07:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=tCQPVGkfrukt4Dhgd/m8K7XGtVrl0r8X20GxVdNHixk=; b=ENNItxcdsAagWAfjgj/8+y982H
 gh50MENeg/ax/OS7Fov6li0O5SQnNLVr0BqfVzuuzju/FcYqJlRTQJPJL3BrzIDsJO3ks0LS+ILtS
 CkJEYoIwpoL6ptQvzrS2W+46fwBq3U2+fJ6IoE5tCVcnuI0z+6fYNN+VOkwK8P6ZsBEnNHweD8G76
 JXrWKYiQ++5QYu2v027qSoahDtSHnSCymKyy1r1TMGpw067rLd/NUVSZmMK515LT0f9U5pLn9XuEd
 SUNEsRc/aLRyqWwRUpskuuDHXD0b4X4VXD3Y3IYvp1A+0MPW28KuwT+adBEIHIzoAtbobOA8f0sNd
 7/N4x57g==;
Received: from [46.140.54.162] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTfBa-0044pG-D4; Mon, 14 Mar 2022 07:32:11 +0000
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org
Subject: [PATCH 12/15] swiotlb: provide swiotlb_init variants that remap the
 buffer
Date: Mon, 14 Mar 2022 08:31:26 +0100
Message-Id: <20220314073129.1862284-13-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220314073129.1862284-1-hch@lst.de>
References: <20220314073129.1862284-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 linux-s390@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>,
 linux-ia64@vger.kernel.org, Anshuman Khandual <anshuman.khandual@arm.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Robin Murphy <robin.murphy@arm.com>, x86@kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 tboot-devel@lists.sourceforge.net, linux-hyperv@vger.kernel.org,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
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

To shared more code between swiotlb and xen-swiotlb, offer a
swiotlb_init_remap interface and add a remap callback to
swiotlb_init_late that will allow Xen to remap the buffer the
buffer without duplicating much of the logic.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/x86/pci/sta2x11-fixup.c |  2 +-
 include/linux/swiotlb.h      |  5 ++++-
 kernel/dma/swiotlb.c         | 38 +++++++++++++++++++++++++++++++++---
 3 files changed, 40 insertions(+), 5 deletions(-)

diff --git a/arch/x86/pci/sta2x11-fixup.c b/arch/x86/pci/sta2x11-fixup.c
index c7e6faf59a861..7368afc039987 100644
--- a/arch/x86/pci/sta2x11-fixup.c
+++ b/arch/x86/pci/sta2x11-fixup.c
@@ -57,7 +57,7 @@ static void sta2x11_new_instance(struct pci_dev *pdev)
 		int size = STA2X11_SWIOTLB_SIZE;
 		/* First instance: register your own swiotlb area */
 		dev_info(&pdev->dev, "Using SWIOTLB (size %i)\n", size);
-		if (swiotlb_init_late(size, GFP_DMA))
+		if (swiotlb_init_late(size, GFP_DMA, NULL))
 			dev_emerg(&pdev->dev, "init swiotlb failed\n");
 	}
 	list_add(&instance->list, &sta2x11_instance_list);
diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index ee655f2e4d28b..7b50c82f84ce9 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -36,8 +36,11 @@ struct scatterlist;
 
 int swiotlb_init_with_tbl(char *tlb, unsigned long nslabs, unsigned int flags);
 unsigned long swiotlb_size_or_default(void);
+void __init swiotlb_init_remap(bool addressing_limit, unsigned int flags,
+	int (*remap)(void *tlb, unsigned long nslabs));
+int swiotlb_init_late(size_t size, gfp_t gfp_mask,
+	int (*remap)(void *tlb, unsigned long nslabs));
 extern int swiotlb_late_init_with_tbl(char *tlb, unsigned long nslabs);
-int swiotlb_init_late(size_t size, gfp_t gfp_mask);
 extern void __init swiotlb_update_mem_attributes(void);
 
 phys_addr_t swiotlb_tbl_map_single(struct device *hwdev, phys_addr_t phys,
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 79641c446d284..88ea7b9bce6e9 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -256,9 +256,11 @@ int __init swiotlb_init_with_tbl(char *tlb, unsigned long nslabs,
  * Statically reserve bounce buffer space and initialize bounce buffer data
  * structures for the software IO TLB used to implement the DMA API.
  */
-void __init swiotlb_init(bool addressing_limit, unsigned int flags)
+void __init swiotlb_init_remap(bool addressing_limit, unsigned int flags,
+		int (*remap)(void *tlb, unsigned long nslabs))
 {
-	size_t bytes = PAGE_ALIGN(default_nslabs << IO_TLB_SHIFT);
+	unsigned long nslabs = default_nslabs;
+	size_t bytes;
 	void *tlb;
 
 	if (!addressing_limit && !swiotlb_force_bounce)
@@ -271,12 +273,24 @@ void __init swiotlb_init(bool addressing_limit, unsigned int flags)
 	 * allow to pick a location everywhere for hypervisors with guest
 	 * memory encryption.
 	 */
+retry:
+	bytes = PAGE_ALIGN(default_nslabs << IO_TLB_SHIFT);
 	if (flags & SWIOTLB_ANY)
 		tlb = memblock_alloc(bytes, PAGE_SIZE);
 	else
 		tlb = memblock_alloc_low(bytes, PAGE_SIZE);
 	if (!tlb)
 		goto fail;
+	if (remap && remap(tlb, nslabs) < 0) {
+		memblock_free(tlb, PAGE_ALIGN(bytes));
+
+		/* Min is 2MB */
+		if (nslabs <= 1024)
+			panic("%s: Failed to remap %zu bytes\n",
+			      __func__, bytes);
+		nslabs = max(1024UL, ALIGN(nslabs >> 1, IO_TLB_SEGSIZE));
+		goto retry;
+	}
 	if (swiotlb_init_with_tbl(tlb, default_nslabs, flags))
 		goto fail_free_mem;
 	return;
@@ -287,12 +301,18 @@ void __init swiotlb_init(bool addressing_limit, unsigned int flags)
 	pr_warn("Cannot allocate buffer");
 }
 
+void __init swiotlb_init(bool addressing_limit, unsigned int flags)
+{
+	return swiotlb_init_remap(addressing_limit, flags, NULL);
+}
+
 /*
  * Systems with larger DMA zones (those that don't support ISA) can
  * initialize the swiotlb later using the slab allocator if needed.
  * This should be just like above, but with some error catching.
  */
-int swiotlb_init_late(size_t size, gfp_t gfp_mask)
+int swiotlb_init_late(size_t size, gfp_t gfp_mask,
+		int (*remap)(void *tlb, unsigned long nslabs))
 {
 	unsigned long nslabs = ALIGN(size >> IO_TLB_SHIFT, IO_TLB_SEGSIZE);
 	unsigned long bytes;
@@ -303,6 +323,7 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask)
 	if (swiotlb_force_disable)
 		return 0;
 
+retry:
 	order = get_order(nslabs << IO_TLB_SHIFT);
 	nslabs = SLABS_PER_PAGE << order;
 	bytes = nslabs << IO_TLB_SHIFT;
@@ -317,6 +338,17 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask)
 
 	if (!vstart)
 		return -ENOMEM;
+	if (remap)
+		rc = remap(vstart, nslabs);
+	if (rc) {
+		free_pages((unsigned long)vstart, order);
+ 
+		/* Min is 2MB */
+		if (nslabs <= 1024)
+			return rc;
+		nslabs = max(1024UL, ALIGN(nslabs >> 1, IO_TLB_SEGSIZE));
+		goto retry;
+	}
 
 	if (order != get_order(bytes)) {
 		pr_warn("only able to allocate %ld MB\n",
-- 
2.30.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
