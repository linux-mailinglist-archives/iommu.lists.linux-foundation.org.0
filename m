Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 607BF1A20EB
	for <lists.iommu@lfdr.de>; Wed,  8 Apr 2020 14:01:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1466A87E32;
	Wed,  8 Apr 2020 12:01:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hpoHndEwyffc; Wed,  8 Apr 2020 12:01:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5945A87DF9;
	Wed,  8 Apr 2020 12:01:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5430DC1AE8;
	Wed,  8 Apr 2020 12:01:16 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9CBA2C0177
 for <iommu@lists.linux-foundation.org>; Wed,  8 Apr 2020 12:01:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 8B10487E9D
 for <iommu@lists.linux-foundation.org>; Wed,  8 Apr 2020 12:01:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id udTa-MG-8WVo for <iommu@lists.linux-foundation.org>;
 Wed,  8 Apr 2020 12:01:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 13A208789D
 for <iommu@lists.linux-foundation.org>; Wed,  8 Apr 2020 12:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=wZGu7E9NrB8a6JOqBsvTFS2592UYD4YuthrlJ5Mfj4Q=; b=XJuv7igyWlmNX35Wt5LnTOfiVc
 ut2/s2p5lkc2e7NGRtK/0ep9Yye9CvC2bfqNHC5wiTDSunsZCEFnS7mGRRsgXBbH41zUf6OaBSyZu
 Z9UeAKSlJj7qZlSMnRMllVxFd/bv7khA1komYJFhOoY6pRafnNuTWCjqS4Xx32iBL8K1+6EcYC1W+
 VhR1u/2NcpsPnzoLgTgK2kmOiOE8nvcAWXAL+Zf/J1p2hbEoS2a2wVMjDmRyOBFec/y+wn/q/1+Qp
 7RieU+8odbcz9cq6gbpfCXzeslEr8Yg4sP4k3r7xeHFucsQDoFm+5vYo/waxtSCMavqk09cjGzPO0
 mxGjxTBw==;
Received: from [2001:4bb8:180:5765:65b6:f11e:f109:b151] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jM9O2-0005jC-NA; Wed, 08 Apr 2020 12:00:55 +0000
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
Subject: [PATCH 24/28] mm: switch the test_vmalloc module to use __vmalloc_node
Date: Wed,  8 Apr 2020 13:59:22 +0200
Message-Id: <20200408115926.1467567-25-hch@lst.de>
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

No need to export the very low-level __vmalloc_node_range when the
test module can use a slightly higher level variant.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 lib/test_vmalloc.c | 26 +++++++-------------------
 mm/vmalloc.c       | 17 ++++++++---------
 2 files changed, 15 insertions(+), 28 deletions(-)

diff --git a/lib/test_vmalloc.c b/lib/test_vmalloc.c
index 8bbefcaddfe8..cd6aef05dfb4 100644
--- a/lib/test_vmalloc.c
+++ b/lib/test_vmalloc.c
@@ -91,12 +91,8 @@ static int random_size_align_alloc_test(void)
 		 */
 		size = ((rnd % 10) + 1) * PAGE_SIZE;
 
-		ptr = __vmalloc_node_range(size, align,
-		   VMALLOC_START, VMALLOC_END,
-		   GFP_KERNEL | __GFP_ZERO,
-		   PAGE_KERNEL,
-		   0, 0, __builtin_return_address(0));
-
+		ptr = __vmalloc_node(size, align, GFP_KERNEL | __GFP_ZERO,
+				__builtin_return_address(0));
 		if (!ptr)
 			return -1;
 
@@ -118,12 +114,8 @@ static int align_shift_alloc_test(void)
 	for (i = 0; i < BITS_PER_LONG; i++) {
 		align = ((unsigned long) 1) << i;
 
-		ptr = __vmalloc_node_range(PAGE_SIZE, align,
-			VMALLOC_START, VMALLOC_END,
-			GFP_KERNEL | __GFP_ZERO,
-			PAGE_KERNEL,
-			0, 0, __builtin_return_address(0));
-
+		ptr = __vmalloc_node(PAGE_SIZE, align, GFP_KERNEL | __GFP_ZERO,
+				__builtin_return_address(0));
 		if (!ptr)
 			return -1;
 
@@ -139,13 +131,9 @@ static int fix_align_alloc_test(void)
 	int i;
 
 	for (i = 0; i < test_loop_count; i++) {
-		ptr = __vmalloc_node_range(5 * PAGE_SIZE,
-			THREAD_ALIGN << 1,
-			VMALLOC_START, VMALLOC_END,
-			GFP_KERNEL | __GFP_ZERO,
-			PAGE_KERNEL,
-			0, 0, __builtin_return_address(0));
-
+		ptr = __vmalloc_node(5 * PAGE_SIZE, THREAD_ALIGN << 1,
+				GFP_KERNEL | __GFP_ZERO,
+				__builtin_return_address(0));
 		if (!ptr)
 			return -1;
 
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index ae8249ef5821..333fbe77255a 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -2522,15 +2522,6 @@ void *__vmalloc_node_range(unsigned long size, unsigned long align,
 	return NULL;
 }
 
-/*
- * This is only for performance analysis of vmalloc and stress purpose.
- * It is required by vmalloc test module, therefore do not use it other
- * than that.
- */
-#ifdef CONFIG_TEST_VMALLOC_MODULE
-EXPORT_SYMBOL_GPL(__vmalloc_node_range);
-#endif
-
 /**
  * __vmalloc_node - allocate virtually contiguous memory
  * @size:	    allocation size
@@ -2556,6 +2547,14 @@ void *__vmalloc_node(unsigned long size, unsigned long align,
 	return __vmalloc_node_range(size, align, VMALLOC_START, VMALLOC_END,
 				gfp_mask, PAGE_KERNEL, 0, node, caller);
 }
+/*
+ * This is only for performance analysis of vmalloc and stress purpose.
+ * It is required by vmalloc test module, therefore do not use it other
+ * than that.
+ */
+#ifdef CONFIG_TEST_VMALLOC_MODULE
+EXPORT_SYMBOL_GPL(__vmalloc_node);
+#endif
 
 void *__vmalloc(unsigned long size, gfp_t gfp_mask)
 {
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
