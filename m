Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 702DC230810
	for <lists.iommu@lfdr.de>; Tue, 28 Jul 2020 12:48:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 26A0186C1A;
	Tue, 28 Jul 2020 10:48:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U3cYAGeoD2n7; Tue, 28 Jul 2020 10:47:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 646C686C46;
	Tue, 28 Jul 2020 10:47:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5322FC004D;
	Tue, 28 Jul 2020 10:47:59 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D91C5C0888
 for <iommu@lists.linux-foundation.org>; Tue, 28 Jul 2020 10:47:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C412088246
 for <iommu@lists.linux-foundation.org>; Tue, 28 Jul 2020 10:47:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q8wcsMZ2L4PY for <iommu@lists.linux-foundation.org>;
 Tue, 28 Jul 2020 10:47:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9346086D41
 for <iommu@lists.linux-foundation.org>; Tue, 28 Jul 2020 10:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=SrNxb7cfoeHkRxwqIu8gXj3if9OqY1Mn6++aEyw+BN8=; b=hyZjJAXwUIHFMRDwGfygu6ku1N
 8rZOthaVTNAe6rGOMKfs4fmYqjXOK4o4S0670kU7Q4LrivzVNOhMa7kZ1MjjaddJqFyDxzzmgM2K4
 l3UxMn8Ki2Cv7MfxgcTaED4rnAtjBFyN6xQw4M3kp3PrhxRL84SGGZxehkUIbqkLA/GyuKhBWlh0P
 2LI0PP43Qb7zf5gdSJgAspVp1mxrees2mFk95w6L87w9ZmdE0DD2cQcDmSPe8snGu//niBf/u8MnK
 nOKJqzDzMiC7mx7eaADrKBZqhLc4fEeldL78ySp7fZSm7S3P+YZZJ5P2WFdpmTolLgGZt2sBtmRec
 65d9CweQ==;
Received: from [2001:4bb8:180:6102:7902:553b:654a:8555] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0N9A-0004ru-Em; Tue, 28 Jul 2020 10:47:48 +0000
From: Christoph Hellwig <hch@lst.de>
To: Amit Pundir <amit.pundir@linaro.org>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: [PATCH 2/2] dma-pool: Only allocate from CMA when in same memory zone
Date: Tue, 28 Jul 2020 12:47:42 +0200
Message-Id: <20200728104742.422960-3-hch@lst.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200728104742.422960-1-hch@lst.de>
References: <20200728104742.422960-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>,
 linux-rpi-kernel@lists.infradead.org, jeremy.linton@arm.com,
 David Rientjes <rientjes@google.com>
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

From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>

There is no guarantee to CMA's placement, so allocating a zone specific
atomic pool from CMA might return memory from a completely different
memory zone. To get around this double check CMA's placement before
allocating from it.

Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
[hch: rebased, added a fallback to the page allocator, allow dipping into
      lower CMA pools]
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 kernel/dma/pool.c | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/kernel/dma/pool.c b/kernel/dma/pool.c
index 1ddcd48f271fff..83fda10394937b 100644
--- a/kernel/dma/pool.c
+++ b/kernel/dma/pool.c
@@ -3,7 +3,9 @@
  * Copyright (C) 2012 ARM Ltd.
  * Copyright (C) 2020 Google LLC
  */
+#include <linux/cma.h>
 #include <linux/debugfs.h>
+#include <linux/dma-contiguous.h>
 #include <linux/dma-direct.h>
 #include <linux/dma-noncoherent.h>
 #include <linux/init.h>
@@ -55,6 +57,29 @@ static void dma_atomic_pool_size_add(gfp_t gfp, size_t size)
 		pool_size_kernel += size;
 }
 
+static bool cma_in_zone(gfp_t gfp)
+{
+	unsigned long size;
+	phys_addr_t end;
+	struct cma *cma;
+
+	cma = dev_get_cma_area(NULL);
+	if (!cma)
+		return false;
+
+	size = cma_get_size(cma);
+	if (!size)
+		return false;
+
+	/* CMA can't cross zone boundaries, see cma_activate_area() */
+	end = cma_get_base(cma) - memblock_start_of_DRAM() + size - 1;
+	if (IS_ENABLED(CONFIG_ZONE_DMA) && (gfp & GFP_DMA))
+		return end <= DMA_BIT_MASK(zone_dma_bits);
+	if (IS_ENABLED(CONFIG_ZONE_DMA32) && (gfp & GFP_DMA32))
+		return end <= DMA_BIT_MASK(32);
+	return true;
+}
+
 static int atomic_pool_expand(struct gen_pool *pool, size_t pool_size,
 			      gfp_t gfp)
 {
@@ -68,7 +93,11 @@ static int atomic_pool_expand(struct gen_pool *pool, size_t pool_size,
 
 	do {
 		pool_size = 1 << (PAGE_SHIFT + order);
-		page = alloc_pages(gfp, order);
+		if (cma_in_zone(gfp))
+ 			page = dma_alloc_from_contiguous(NULL, 1 << order,
+ 							 order, false);
+		if (!page)
+			page = alloc_pages(gfp, order);
 	} while (!page && order-- > 0);
 	if (!page)
 		goto out;
-- 
2.27.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
