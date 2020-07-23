Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EBFF22AE86
	for <lists.iommu@lfdr.de>; Thu, 23 Jul 2020 14:01:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 04DFC2C348;
	Thu, 23 Jul 2020 12:01:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tFgnxGeZjavn; Thu, 23 Jul 2020 12:00:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id CCD7F2C346;
	Thu, 23 Jul 2020 12:00:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B4906C004C;
	Thu, 23 Jul 2020 12:00:58 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 139C5C004C
 for <iommu@lists.linux-foundation.org>; Thu, 23 Jul 2020 12:00:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 0FEC489AF1
 for <iommu@lists.linux-foundation.org>; Thu, 23 Jul 2020 12:00:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7u8Cb5XDEUoC for <iommu@lists.linux-foundation.org>;
 Thu, 23 Jul 2020 12:00:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 1D9FA898D9
 for <iommu@lists.linux-foundation.org>; Thu, 23 Jul 2020 12:00:56 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id DE83868AFE; Thu, 23 Jul 2020 14:00:51 +0200 (CEST)
Date: Thu, 23 Jul 2020 14:00:51 +0200
From: Christoph Hellwig <hch@lst.de>
To: "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>
Subject: Re: [PATCH v3 1/2] dma-direct: provide the ability to reserve
 per-numa CMA
Message-ID: <20200723120051.GB31598@lst.de>
References: <20200628111251.19108-1-song.bao.hua@hisilicon.com>
 <20200628111251.19108-2-song.bao.hua@hisilicon.com>
 <20200722142943.GB17658@lst.de>
 <B926444035E5E2439431908E3842AFD25A1606@DGGEMI525-MBS.china.huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <B926444035E5E2439431908E3842AFD25A1606@DGGEMI525-MBS.china.huawei.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 Steve Capper <steve.capper@arm.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>, Linuxarm <linuxarm@huawei.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "Zengtao \(B\)" <prime.zeng@hisilicon.com>,
 "ganapatrao.kulkarni@cavium.com" <ganapatrao.kulkarni@cavium.com>,
 huangdaode <huangdaode@huawei.com>, Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@linux.ibm.com>, "will@kernel.org" <will@kernel.org>,
 Christoph Hellwig <hch@lst.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
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

On Wed, Jul 22, 2020 at 09:41:50PM +0000, Song Bao Hua (Barry Song) wrote:
> I got a kernel robot warning which said dev should be checked before being accessed
> when I did a similar change in v1. Probably it was an invalid warning if dev should
> never be null.

That usually shows up if a function is inconsistent about sometimes
checking it and sometimes now.

> Yes, it looks much better.

Below is a prep patch to rebase on top of:

---
From b81a5e1da65fce9750f0a8b66dbb6f842cbfdd4d Mon Sep 17 00:00:00 2001
From: Christoph Hellwig <hch@lst.de>
Date: Wed, 22 Jul 2020 16:33:43 +0200
Subject: dma-contiguous: cleanup dma_alloc_contiguous

Split out a cma_alloc_aligned helper to deal with the "interesting"
calling conventions for cma_alloc, which then allows to the main
function to be written straight forward.  This also takes advantage
of the fact that NULL dev arguments have been gone from the DMA API
for a while.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 kernel/dma/contiguous.c | 31 ++++++++++++++-----------------
 1 file changed, 14 insertions(+), 17 deletions(-)

diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
index 15bc5026c485f2..cff7e60968b9e1 100644
--- a/kernel/dma/contiguous.c
+++ b/kernel/dma/contiguous.c
@@ -215,6 +215,13 @@ bool dma_release_from_contiguous(struct device *dev, struct page *pages,
 	return cma_release(dev_get_cma_area(dev), pages, count);
 }
 
+static struct page *cma_alloc_aligned(struct cma *cma, size_t size, gfp_t gfp)
+{
+	unsigned int align = min(get_order(size), CONFIG_CMA_ALIGNMENT);
+
+	return cma_alloc(cma, size >> PAGE_SHIFT, align, gfp & __GFP_NOWARN);
+}
+
 /**
  * dma_alloc_contiguous() - allocate contiguous pages
  * @dev:   Pointer to device for which the allocation is performed.
@@ -231,24 +238,14 @@ bool dma_release_from_contiguous(struct device *dev, struct page *pages,
  */
 struct page *dma_alloc_contiguous(struct device *dev, size_t size, gfp_t gfp)
 {
-	size_t count = size >> PAGE_SHIFT;
-	struct page *page = NULL;
-	struct cma *cma = NULL;
-
-	if (dev && dev->cma_area)
-		cma = dev->cma_area;
-	else if (count > 1)
-		cma = dma_contiguous_default_area;
-
 	/* CMA can be used only in the context which permits sleeping */
-	if (cma && gfpflags_allow_blocking(gfp)) {
-		size_t align = get_order(size);
-		size_t cma_align = min_t(size_t, align, CONFIG_CMA_ALIGNMENT);
-
-		page = cma_alloc(cma, count, cma_align, gfp & __GFP_NOWARN);
-	}
-
-	return page;
+	if (!gfpflags_allow_blocking(gfp))
+		return NULL;
+	if (dev->cma_area)
+		return cma_alloc_aligned(dev->cma_area, size, gfp);
+	if (size <= PAGE_SIZE || !dma_contiguous_default_area)
+		return NULL;
+	return cma_alloc_aligned(dma_contiguous_default_area, size, gfp);
 }
 
 /**
-- 
2.27.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
