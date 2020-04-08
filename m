Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CBC1A20EA
	for <lists.iommu@lfdr.de>; Wed,  8 Apr 2020 14:01:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 539892048D;
	Wed,  8 Apr 2020 12:01:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LHYNGJfm531F; Wed,  8 Apr 2020 12:01:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id DBC90204DD;
	Wed,  8 Apr 2020 12:01:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BD02EC1D89;
	Wed,  8 Apr 2020 12:01:13 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 23A5BC0177
 for <iommu@lists.linux-foundation.org>; Wed,  8 Apr 2020 12:01:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 1367C86A4A
 for <iommu@lists.linux-foundation.org>; Wed,  8 Apr 2020 12:01:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O9ai-wqrICuJ for <iommu@lists.linux-foundation.org>;
 Wed,  8 Apr 2020 12:01:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 7D1A586A35
 for <iommu@lists.linux-foundation.org>; Wed,  8 Apr 2020 12:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=bBHM+hDSwYwXpplQFIpTmcGbADjtUKFmfQeNb5Nusv4=; b=E5EHOU/1jxrKojb9kP9R2f5evY
 oIqTcxhz8xO+bOobIjQ6F6fNp/1R0fnyH0/uWWrfTEXI1JZEsuWf6lyce4RxGfy6Cp331AKFIvBu1
 MWKICj+gyYwlIHoum0YIEypHVw3JRlUnux+N0UTIZBqmaTGkfIutAFKEk4SXlfkSMKYmDHJTL8pjC
 J7kAwOgmjiJI3ZRt8JlPH3mlOENjkEtBSzYvuI9uEEgBEoX24dBy+rYrhcM7waaJuZx+cuO6T5hBu
 K3LF/PQtYXVj0Gus4oKVrJLmCTOoEMoSBrF2CaQJjU2HDeCK6EUunuvJB26aQSJmbS98++jqbKlBW
 sTtynD1w==;
Received: from [2001:4bb8:180:5765:65b6:f11e:f109:b151] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jM9Nt-0005Yi-9h; Wed, 08 Apr 2020 12:00:45 +0000
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
Subject: [PATCH 21/28] mm: remove the prot argument to __vmalloc_node
Date: Wed,  8 Apr 2020 13:59:19 +0200
Message-Id: <20200408115926.1467567-22-hch@lst.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200408115926.1467567-1-hch@lst.de>
References: <20200408115926.1467567-1-hch@lst.de>
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

This is always PAGE_KERNEL now.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 mm/vmalloc.c | 35 ++++++++++++++---------------------
 1 file changed, 14 insertions(+), 21 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 466a449b3a15..de7952959e82 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -2401,8 +2401,7 @@ void *vmap(struct page **pages, unsigned int count,
 EXPORT_SYMBOL(vmap);
 
 static void *__vmalloc_node(unsigned long size, unsigned long align,
-			    gfp_t gfp_mask, pgprot_t prot,
-			    int node, const void *caller);
+			    gfp_t gfp_mask, int node, const void *caller);
 static void *__vmalloc_area_node(struct vm_struct *area, gfp_t gfp_mask,
 				 pgprot_t prot, int node)
 {
@@ -2420,7 +2419,7 @@ static void *__vmalloc_area_node(struct vm_struct *area, gfp_t gfp_mask,
 	/* Please note that the recursion is strictly bounded. */
 	if (array_size > PAGE_SIZE) {
 		pages = __vmalloc_node(array_size, 1, nested_gfp|highmem_mask,
-				PAGE_KERNEL, node, area->caller);
+				node, area->caller);
 	} else {
 		pages = kmalloc_node(array_size, nested_gfp, node);
 	}
@@ -2539,13 +2538,11 @@ EXPORT_SYMBOL_GPL(__vmalloc_node_range);
  * @size:	    allocation size
  * @align:	    desired alignment
  * @gfp_mask:	    flags for the page level allocator
- * @prot:	    protection mask for the allocated pages
  * @node:	    node to use for allocation or NUMA_NO_NODE
  * @caller:	    caller's return address
  *
- * Allocate enough pages to cover @size from the page level
- * allocator with @gfp_mask flags.  Map them into contiguous
- * kernel virtual space, using a pagetable protection of @prot.
+ * Allocate enough pages to cover @size from the page level allocator with
+ * @gfp_mask flags.  Map them into contiguous kernel virtual space.
  *
  * Reclaim modifiers in @gfp_mask - __GFP_NORETRY, __GFP_RETRY_MAYFAIL
  * and __GFP_NOFAIL are not supported
@@ -2556,16 +2553,15 @@ EXPORT_SYMBOL_GPL(__vmalloc_node_range);
  * Return: pointer to the allocated memory or %NULL on error
  */
 static void *__vmalloc_node(unsigned long size, unsigned long align,
-			    gfp_t gfp_mask, pgprot_t prot,
-			    int node, const void *caller)
+			    gfp_t gfp_mask, int node, const void *caller)
 {
 	return __vmalloc_node_range(size, align, VMALLOC_START, VMALLOC_END,
-				gfp_mask, prot, 0, node, caller);
+				gfp_mask, PAGE_KERNEL, 0, node, caller);
 }
 
 void *__vmalloc(unsigned long size, gfp_t gfp_mask)
 {
-	return __vmalloc_node(size, 1, gfp_mask, PAGE_KERNEL, NUMA_NO_NODE,
+	return __vmalloc_node(size, 1, gfp_mask, NUMA_NO_NODE,
 				__builtin_return_address(0));
 }
 EXPORT_SYMBOL(__vmalloc);
@@ -2573,15 +2569,15 @@ EXPORT_SYMBOL(__vmalloc);
 static inline void *__vmalloc_node_flags(unsigned long size,
 					int node, gfp_t flags)
 {
-	return __vmalloc_node(size, 1, flags, PAGE_KERNEL,
-					node, __builtin_return_address(0));
+	return __vmalloc_node(size, 1, flags, node,
+				__builtin_return_address(0));
 }
 
 
 void *__vmalloc_node_flags_caller(unsigned long size, int node, gfp_t flags,
 				  void *caller)
 {
-	return __vmalloc_node(size, 1, flags, PAGE_KERNEL, node, caller);
+	return __vmalloc_node(size, 1, flags, node, caller);
 }
 
 /**
@@ -2656,8 +2652,8 @@ EXPORT_SYMBOL(vmalloc_user);
  */
 void *vmalloc_node(unsigned long size, int node)
 {
-	return __vmalloc_node(size, 1, GFP_KERNEL, PAGE_KERNEL,
-					node, __builtin_return_address(0));
+	return __vmalloc_node(size, 1, GFP_KERNEL, node,
+			__builtin_return_address(0));
 }
 EXPORT_SYMBOL(vmalloc_node);
 
@@ -2670,9 +2666,6 @@ EXPORT_SYMBOL(vmalloc_node);
  * allocator and map them into contiguous kernel virtual space.
  * The memory allocated is set to zero.
  *
- * For tight control over page level allocator and protection flags
- * use __vmalloc_node() instead.
- *
  * Return: pointer to the allocated memory or %NULL on error
  */
 void *vzalloc_node(unsigned long size, int node)
@@ -2745,8 +2738,8 @@ void *vmalloc_exec(unsigned long size)
  */
 void *vmalloc_32(unsigned long size)
 {
-	return __vmalloc_node(size, 1, GFP_VMALLOC32, PAGE_KERNEL,
-			      NUMA_NO_NODE, __builtin_return_address(0));
+	return __vmalloc_node(size, 1, GFP_VMALLOC32, NUMA_NO_NODE,
+			__builtin_return_address(0));
 }
 EXPORT_SYMBOL(vmalloc_32);
 
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
