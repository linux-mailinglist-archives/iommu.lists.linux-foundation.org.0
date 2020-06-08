Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B441F1A03
	for <lists.iommu@lfdr.de>; Mon,  8 Jun 2020 15:27:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id E57F887917;
	Mon,  8 Jun 2020 13:27:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PAjFE4XcfvH3; Mon,  8 Jun 2020 13:27:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id A90F5878C8;
	Mon,  8 Jun 2020 13:27:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 93994C016F;
	Mon,  8 Jun 2020 13:27:24 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4FDC9C016F
 for <iommu@lists.linux-foundation.org>; Mon,  8 Jun 2020 13:27:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 3AAF486078
 for <iommu@lists.linux-foundation.org>; Mon,  8 Jun 2020 13:27:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KhMo2DHb03hq for <iommu@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 13:27:22 +0000 (UTC)
X-Greylist: delayed 00:05:01 by SQLgrey-1.7.6
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id DDCA585EB8
 for <iommu@lists.linux-foundation.org>; Mon,  8 Jun 2020 13:27:21 +0000 (UTC)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed60:c85f:a5bf:b1bd:702b])
 by xavier.telenet-ops.be with bizsmtp
 id odNJ2200D0R8aca01dNJ0S; Mon, 08 Jun 2020 15:22:18 +0200
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1jiHjG-00013I-97; Mon, 08 Jun 2020 15:22:18 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1jiHjG-0007nj-6d; Mon, 08 Jun 2020 15:22:18 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, David Rientjes <rientjes@google.com>
Subject: [PATCH v2] dma-pool: Fix too large DMA pools on medium systems
Date: Mon,  8 Jun 2020 15:22:17 +0200
Message-Id: <20200608132217.29945-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.17.1
Cc: iommu@lists.linux-foundation.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-kernel@vger.kernel.org
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On systems with at least 32 MiB, but less than 32 GiB of RAM, the DMA
memory pools are much larger than intended (e.g. 2 MiB instead of 128
KiB on a 256 MiB system).

Fix this by correcting the calculation of the number of GiBs of RAM in
the system.  Invert the order of the min/max operations, to keep on
calculating in pages until the last step, which aids readability.

Fixes: 1d659236fb43c4d2 ("dma-pool: scale the default DMA coherent pool size with memory capacity")
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
v2:
  - Improve readability:
      - Divide by (SZ_1G / SZ_128K) instead of using a shift,
      - Invert min/max order to keep calculating in pages until the last
	step.
---
 kernel/dma/pool.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/kernel/dma/pool.c b/kernel/dma/pool.c
index 35bb51c31fff370f..8cfa01243ed27b6f 100644
--- a/kernel/dma/pool.c
+++ b/kernel/dma/pool.c
@@ -175,10 +175,9 @@ static int __init dma_atomic_pool_init(void)
 	 * sizes to 128KB per 1GB of memory, min 128KB, max MAX_ORDER-1.
 	 */
 	if (!atomic_pool_size) {
-		atomic_pool_size = max(totalram_pages() >> PAGE_SHIFT, 1UL) *
-					SZ_128K;
-		atomic_pool_size = min_t(size_t, atomic_pool_size,
-					 1 << (PAGE_SHIFT + MAX_ORDER-1));
+		unsigned long pages = totalram_pages() / (SZ_1G / SZ_128K);
+		pages = min_t(unsigned long, pages, MAX_ORDER_NR_PAGES);
+		atomic_pool_size = max_t(size_t, pages << PAGE_SHIFT, SZ_128K);
 	}
 	INIT_WORK(&atomic_pool_work, atomic_pool_work_fn);
 
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
