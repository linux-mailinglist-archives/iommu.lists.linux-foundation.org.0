Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A96B3D311B
	for <lists.iommu@lfdr.de>; Fri, 23 Jul 2021 03:06:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3360E82718;
	Fri, 23 Jul 2021 01:06:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UzAd2udj63-d; Fri, 23 Jul 2021 01:06:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 6232A8270B;
	Fri, 23 Jul 2021 01:06:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 35BFCC000E;
	Fri, 23 Jul 2021 01:06:16 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 25F2CC000E
 for <iommu@lists.linux-foundation.org>; Fri, 23 Jul 2021 01:06:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 00F48606D9
 for <iommu@lists.linux-foundation.org>; Fri, 23 Jul 2021 01:06:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rxWle31sKYJj for <iommu@lists.linux-foundation.org>;
 Fri, 23 Jul 2021 01:06:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3B0E86069A
 for <iommu@lists.linux-foundation.org>; Fri, 23 Jul 2021 01:06:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: ezequiel) with ESMTPSA id 5C8B01F447F8
From: Ezequiel Garcia <ezequiel@collabora.com>
To: iommu@lists.linux-foundation.org,
	linux-media@vger.kernel.org
Subject: [PATCH] iommu/dma: Fix leak in non-contiguous API
Date: Thu, 22 Jul 2021 22:05:52 -0300
Message-Id: <20210723010552.50969-1-ezequiel@collabora.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Cc: Will Deacon <will@kernel.org>, stable@vger.kernel.org,
 Ricardo Ribalda <ribalda@chromium.org>, kernel@collabora.com,
 Ezequiel Garcia <ezequiel@collabora.com>, Christoph Hellwig <hch@lst.de>
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

Currently, iommu_dma_alloc_noncontiguous() allocates a
struct dma_sgt_handle object to hold some state needed for
iommu_dma_free_noncontiguous().

However, the handle is neither freed nor returned explicitly by
the ->alloc_noncontiguous method, and therefore seems leaked.
This was found by code inspection, so please review carefully and test.

As a side note, it appears the struct dma_sgt_handle type is exposed
to users of the DMA-API by linux/dma-map-ops.h, but is has no users
or functions returning the type explicitly.

This may indicate it's a good idea to move the struct dma_sgt_handle type
to drivers/iommu/dma-iommu.c. The decision is left to maintainers :-)

Cc: stable@vger.kernel.org
Fixes: e817ee5f2f95c ("dma-iommu: implement ->alloc_noncontiguous")
Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/iommu/dma-iommu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 4e34e8b26579..16c06a1aab80 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -768,6 +768,7 @@ static void iommu_dma_free_noncontiguous(struct device *dev, size_t size,
 	__iommu_dma_unmap(dev, sgt->sgl->dma_address, size);
 	__iommu_dma_free_pages(sh->pages, PAGE_ALIGN(size) >> PAGE_SHIFT);
 	sg_free_table(&sh->sgt);
+	kfree(sh);
 }
 #endif /* CONFIG_DMA_REMAP */
 
-- 
2.32.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
