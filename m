Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 463CA35B10
	for <lists.iommu@lfdr.de>; Wed,  5 Jun 2019 13:17:07 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5CC8EC90;
	Wed,  5 Jun 2019 11:16:57 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 10BD8B8E
	for <iommu@lists.linux-foundation.org>;
	Wed,  5 Jun 2019 11:16:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
	[210.160.252.172])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 73AE6844
	for <iommu@lists.linux-foundation.org>;
	Wed,  5 Jun 2019 11:16:54 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,550,1549897200"; d="scan'208";a="17680350"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
	by relmlie6.idc.renesas.com with ESMTP; 05 Jun 2019 20:16:52 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id CEC6541BD771;
	Wed,  5 Jun 2019 20:16:52 +0900 (JST)
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: ulf.hansson@linaro.org, wsa+renesas@sang-engineering.com, hch@lst.de,
	m.szyprowski@samsung.com, robin.murphy@arm.com, joro@8bytes.org
Subject: [RFC PATCH v5 2/8] iommu/dma: move iommu_dma_unmap_sg() place
Date: Wed,  5 Jun 2019 20:11:48 +0900
Message-Id: <1559733114-4221-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559733114-4221-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1559733114-4221-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-renesas-soc@vger.kernel.org, iommu@lists.linux-foundation.org,
	linux-mmc@vger.kernel.org
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

iommu_dma_map_sg() will use the unmap function in the future. To
avoid a forward declaration, this patch move the function place.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/iommu/dma-iommu.c | 48 +++++++++++++++++++++++------------------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 0dee374..034caae 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -730,6 +730,30 @@ static void iommu_dma_unmap_page(struct device *dev, dma_addr_t dma_handle,
 	__iommu_dma_unmap(dev, dma_handle, size);
 }
 
+static void iommu_dma_unmap_sg(struct device *dev, struct scatterlist *sg,
+		int nents, enum dma_data_direction dir, unsigned long attrs)
+{
+	dma_addr_t start, end;
+	struct scatterlist *tmp;
+	int i;
+
+	if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC))
+		iommu_dma_sync_sg_for_cpu(dev, sg, nents, dir);
+
+	/*
+	 * The scatterlist segments are mapped into a single
+	 * contiguous IOVA allocation, so this is incredibly easy.
+	 */
+	start = sg_dma_address(sg);
+	for_each_sg(sg_next(sg), tmp, nents - 1, i) {
+		if (sg_dma_len(tmp) == 0)
+			break;
+		sg = tmp;
+	}
+	end = sg_dma_address(sg) + sg_dma_len(sg);
+	__iommu_dma_unmap(dev, start, end - start);
+}
+
 /*
  * Prepare a successfully-mapped scatterlist to give back to the caller.
  *
@@ -887,30 +911,6 @@ static int iommu_dma_map_sg(struct device *dev, struct scatterlist *sg,
 	return 0;
 }
 
-static void iommu_dma_unmap_sg(struct device *dev, struct scatterlist *sg,
-		int nents, enum dma_data_direction dir, unsigned long attrs)
-{
-	dma_addr_t start, end;
-	struct scatterlist *tmp;
-	int i;
-
-	if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC))
-		iommu_dma_sync_sg_for_cpu(dev, sg, nents, dir);
-
-	/*
-	 * The scatterlist segments are mapped into a single
-	 * contiguous IOVA allocation, so this is incredibly easy.
-	 */
-	start = sg_dma_address(sg);
-	for_each_sg(sg_next(sg), tmp, nents - 1, i) {
-		if (sg_dma_len(tmp) == 0)
-			break;
-		sg = tmp;
-	}
-	end = sg_dma_address(sg) + sg_dma_len(sg);
-	__iommu_dma_unmap(dev, start, end - start);
-}
-
 static dma_addr_t iommu_dma_map_resource(struct device *dev, phys_addr_t phys,
 		size_t size, enum dma_data_direction dir, unsigned long attrs)
 {
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
