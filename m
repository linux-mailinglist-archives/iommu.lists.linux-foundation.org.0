Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A92EF760E2
	for <lists.iommu@lfdr.de>; Fri, 26 Jul 2019 10:32:49 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id DDD03CC9;
	Fri, 26 Jul 2019 08:32:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D62BBB5F
	for <iommu@lists.linux-foundation.org>;
	Fri, 26 Jul 2019 08:32:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
	[210.160.252.171])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 028F5709
	for <iommu@lists.linux-foundation.org>;
	Fri, 26 Jul 2019 08:32:25 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,310,1559487600"; d="scan'208";a="22504208"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
	by relmlie5.idc.renesas.com with ESMTP; 26 Jul 2019 17:32:23 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id AF5FD42017BC;
	Fri, 26 Jul 2019 17:32:23 +0900 (JST)
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: ulf.hansson@linaro.org, hch@lst.de, m.szyprowski@samsung.com,
	robin.murphy@arm.com, joro@8bytes.org, axboe@kernel.dk
Subject: [PATCH v9 4/5] block: add a helper function to merge the segments
Date: Fri, 26 Jul 2019 17:31:15 +0900
Message-Id: <1564129876-28261-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564129876-28261-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1564129876-28261-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-renesas-soc@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-block@vger.kernel.org, wsa+renesas@sang-engineering.com,
	iommu@lists.linux-foundation.org
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

This patch adds a helper function whether a queue can merge
the segments by the DMA MAP layer (e.g. via IOMMU).

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
---
 block/blk-settings.c   | 22 ++++++++++++++++++++++
 include/linux/blkdev.h |  2 ++
 2 files changed, 24 insertions(+)

diff --git a/block/blk-settings.c b/block/blk-settings.c
index 45f2c52..6a78ea0 100644
--- a/block/blk-settings.c
+++ b/block/blk-settings.c
@@ -4,6 +4,7 @@
  */
 #include <linux/bio.h>
 #include <linux/blkdev.h>
+#include <linux/dma-mapping.h>
 #include <linux/gcd.h>
 #include <linux/gfp.h>
 #include <linux/init.h>
@@ -831,6 +832,27 @@ void blk_queue_write_cache(struct request_queue *q, bool wc, bool fua)
 }
 EXPORT_SYMBOL_GPL(blk_queue_write_cache);
 
+/**
+ * blk_queue_can_use_dma_map_merging - configure queue for merging segments.
+ * @q:		the request queue for the device
+ * @dev:	the device pointer for dma
+ *
+ * Tell the block layer about merging the segments by dma map of @q.
+ */
+bool blk_queue_can_use_dma_map_merging(struct request_queue *q,
+				       struct device *dev)
+{
+	unsigned long boundary = dma_get_merge_boundary(dev);
+
+	if (!boundary)
+		return false;
+
+	/* No need to update max_segment_size. see blk_queue_virt_boundary() */
+	blk_queue_virt_boundary(q, boundary);
+
+	return true;
+}
+
 static int __init blk_settings_init(void)
 {
 	blk_max_low_pfn = max_low_pfn - 1;
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 1ef375d..f6d55e2 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -1085,6 +1085,8 @@ extern void blk_queue_dma_alignment(struct request_queue *, int);
 extern void blk_queue_update_dma_alignment(struct request_queue *, int);
 extern void blk_queue_rq_timeout(struct request_queue *, unsigned int);
 extern void blk_queue_write_cache(struct request_queue *q, bool enabled, bool fua);
+extern bool blk_queue_can_use_dma_map_merging(struct request_queue *q,
+					      struct device *dev);
 
 /*
  * Number of physical segments as sent to the device.
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
