Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 76058218D9A
	for <lists.iommu@lfdr.de>; Wed,  8 Jul 2020 18:55:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2ECC088FD7;
	Wed,  8 Jul 2020 16:55:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DLMeBf2oKKK5; Wed,  8 Jul 2020 16:55:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1362088FF2;
	Wed,  8 Jul 2020 16:55:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E7DB8C08A9;
	Wed,  8 Jul 2020 16:55:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D697DC016F
 for <iommu@lists.linux-foundation.org>; Wed,  8 Jul 2020 16:55:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id BE8FA88E2C
 for <iommu@lists.linux-foundation.org>; Wed,  8 Jul 2020 16:55:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l8PpecwkuFxa for <iommu@lists.linux-foundation.org>;
 Wed,  8 Jul 2020 16:55:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by whitealder.osuosl.org (Postfix) with ESMTPS id D2D8D875D4
 for <iommu@lists.linux-foundation.org>; Wed,  8 Jul 2020 16:55:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E9F5BAE02;
 Wed,  8 Jul 2020 16:55:29 +0000 (UTC)
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, David Rientjes <rientjes@google.com>
Subject: [PATCH] dma-pool: Do not allocate pool memory from CMA
Date: Wed,  8 Jul 2020 18:49:39 +0200
Message-Id: <20200708164936.9340-1-nsaenzjulienne@suse.de>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: iommu@lists.linux-foundation.org, linux-rpi-kernel@lists.infradead.org,
 jeremy.linton@arm.com, linux-kernel@vger.kernel.org
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

There is no guarantee to CMA's placement, so allocating a zone specific
atomic pool from CMA might return memory from a completely different
memory zone. So stop using it.

Fixes: c84dc6e68a1d ("dma-pool: add additional coherent pools to map to gfp mask")
Reported-by: Jeremy Linton <jeremy.linton@arm.com>
Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
---

An more costly alternative would be adding an option to
dma_alloc_from_contiguous() so it fails when the allocation doesn't fall
in a specific zone.

 kernel/dma/pool.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/kernel/dma/pool.c b/kernel/dma/pool.c
index 8cfa01243ed2..4bc1c46ae6ef 100644
--- a/kernel/dma/pool.c
+++ b/kernel/dma/pool.c
@@ -6,7 +6,6 @@
 #include <linux/debugfs.h>
 #include <linux/dma-direct.h>
 #include <linux/dma-noncoherent.h>
-#include <linux/dma-contiguous.h>
 #include <linux/init.h>
 #include <linux/genalloc.h>
 #include <linux/set_memory.h>
@@ -69,12 +68,7 @@ static int atomic_pool_expand(struct gen_pool *pool, size_t pool_size,
 
 	do {
 		pool_size = 1 << (PAGE_SHIFT + order);
-
-		if (dev_get_cma_area(NULL))
-			page = dma_alloc_from_contiguous(NULL, 1 << order,
-							 order, false);
-		else
-			page = alloc_pages(gfp, order);
+		page = alloc_pages(gfp, order);
 	} while (!page && order-- > 0);
 	if (!page)
 		goto out;
@@ -118,8 +112,7 @@ static int atomic_pool_expand(struct gen_pool *pool, size_t pool_size,
 	dma_common_free_remap(addr, pool_size);
 #endif
 free_page: __maybe_unused
-	if (!dma_release_from_contiguous(NULL, page, 1 << order))
-		__free_pages(page, order);
+	__free_pages(page, order);
 out:
 	return ret;
 }
-- 
2.27.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
