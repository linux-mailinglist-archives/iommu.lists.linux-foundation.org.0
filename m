Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 2812F1F14BD
	for <lists.iommu@lfdr.de>; Mon,  8 Jun 2020 10:52:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A8DBB8636A;
	Mon,  8 Jun 2020 08:52:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cg5xKcPaBosj; Mon,  8 Jun 2020 08:52:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 19CA5863CE;
	Mon,  8 Jun 2020 08:52:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 002C5C016F;
	Mon,  8 Jun 2020 08:52:38 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A6065C016F
 for <iommu@lists.linux-foundation.org>; Mon,  8 Jun 2020 08:52:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 95FCD862A0
 for <iommu@lists.linux-foundation.org>; Mon,  8 Jun 2020 08:52:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0vjgH3LIoD1P for <iommu@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 08:52:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 49A1C811C2
 for <iommu@lists.linux-foundation.org>; Mon,  8 Jun 2020 08:52:34 +0000 (UTC)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed60:c85f:a5bf:b1bd:702b])
 by michel.telenet-ops.be with bizsmtp
 id oYsY2200L0R8aca06YsY5g; Mon, 08 Jun 2020 10:52:32 +0200
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1jiDWC-0006nd-84; Mon, 08 Jun 2020 10:52:32 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1jiDWC-0002Ki-5C; Mon, 08 Jun 2020 10:52:32 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, David Rientjes <rientjes@google.com>
Subject: [PATCH] dma-pool: Fix too large DMA pools on medium systems
Date: Mon,  8 Jun 2020 10:52:31 +0200
Message-Id: <20200608085231.8924-1-geert@linux-m68k.org>
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
the system.

Fixes: 1d659236fb43c4d2 ("dma-pool: scale the default DMA coherent pool size with memory capacity")
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 kernel/dma/pool.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/dma/pool.c b/kernel/dma/pool.c
index 35bb51c31fff370f..1c7eab2cc0498003 100644
--- a/kernel/dma/pool.c
+++ b/kernel/dma/pool.c
@@ -175,8 +175,8 @@ static int __init dma_atomic_pool_init(void)
 	 * sizes to 128KB per 1GB of memory, min 128KB, max MAX_ORDER-1.
 	 */
 	if (!atomic_pool_size) {
-		atomic_pool_size = max(totalram_pages() >> PAGE_SHIFT, 1UL) *
-					SZ_128K;
+		unsigned long gigs = totalram_pages() >> (30 - PAGE_SHIFT);
+		atomic_pool_size = max(gigs, 1UL) * SZ_128K;
 		atomic_pool_size = min_t(size_t, atomic_pool_size,
 					 1 << (PAGE_SHIFT + MAX_ORDER-1));
 	}
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
