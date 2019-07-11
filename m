Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D9665180
	for <lists.iommu@lfdr.de>; Thu, 11 Jul 2019 07:43:43 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A03CF4B7A;
	Thu, 11 Jul 2019 05:43:38 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 5B2B14B66
	for <iommu@lists.linux-foundation.org>;
	Thu, 11 Jul 2019 05:33:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id AC183DF
	for <iommu@lists.linux-foundation.org>;
	Thu, 11 Jul 2019 05:33:52 +0000 (UTC)
X-UUID: 327af44e836944e1adb3d59daca23acd-20190711
X-UUID: 327af44e836944e1adb3d59daca23acd-20190711
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
	(envelope-from <miles.chen@mediatek.com>)
	(mhqrelay.mediatek.com ESMTP with TLS)
	with ESMTP id 1269385009; Thu, 11 Jul 2019 13:33:46 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
	mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server
	(TLS) id 15.0.1395.4; Thu, 11 Jul 2019 13:33:44 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
	(172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
	Frontend Transport; Thu, 11 Jul 2019 13:33:44 +0800
From: <miles.chen@mediatek.com>
To: Christoph Hellwig <hch@lst.de>, Marek Szyprowski
	<m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH] kernel/dma: export dma_alloc_from_contiguous to modules
Date: Thu, 11 Jul 2019 13:33:43 +0800
Message-ID: <20190711053343.28873-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,UNPARSEABLE_RELAY
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Miles Chen <miles.chen@mediatek.com>, iommu@lists.linux-foundation.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	wsd_upstream@mediatek.com
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

From: Miles Chen <miles.chen@mediatek.com>

This change exports dma_alloc_from_contiguous and
dma_release_from_contiguous to modules.

Currently, we can add a reserve a memory node in dts files, make
it a CMA memory by setting compatible = "shared-dma-pool",
and setup the dev->cma_area by using of_reserved_mem_device_init_by_idx().

Export dma_alloc_from_contiguous and dma_release_from_contiguous, so we
can allocate/free from/to dev->cma_area in kernel modules.

Signed-off-by: Miles Chen <miles.chen@mediatek.com>
---
 kernel/dma/contiguous.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
index b2a87905846d..d5920bdedc77 100644
--- a/kernel/dma/contiguous.c
+++ b/kernel/dma/contiguous.c
@@ -197,6 +197,7 @@ struct page *dma_alloc_from_contiguous(struct device *dev, size_t count,
 
 	return cma_alloc(dev_get_cma_area(dev), count, align, no_warn);
 }
+EXPORT_SYMBOL_GPL(dma_alloc_from_contiguous);
 
 /**
  * dma_release_from_contiguous() - release allocated pages
@@ -213,6 +214,7 @@ bool dma_release_from_contiguous(struct device *dev, struct page *pages,
 {
 	return cma_release(dev_get_cma_area(dev), pages, count);
 }
+EXPORT_SYMBOL_GPL(dma_release_from_contiguous);
 
 /*
  * Support for reserved memory regions defined in device tree
-- 
2.18.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
