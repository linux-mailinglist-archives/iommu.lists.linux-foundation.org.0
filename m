Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C1043539
	for <lists.iommu@lfdr.de>; Thu, 13 Jun 2019 12:20:51 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 63C38130E;
	Thu, 13 Jun 2019 10:20:43 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id BD6E61306
	for <iommu@lists.linux-foundation.org>;
	Thu, 13 Jun 2019 10:20:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from relmlie6.idc.renesas.com (relmlor1.renesas.com
	[210.160.252.171])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 3A5A963D
	for <iommu@lists.linux-foundation.org>;
	Thu, 13 Jun 2019 10:20:40 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.62,369,1554735600"; d="scan'208";a="18380808"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
	by relmlie6.idc.renesas.com with ESMTP; 13 Jun 2019 19:20:37 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id CE64F4274BC5;
	Thu, 13 Jun 2019 19:20:37 +0900 (JST)
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: joro@8bytes.org, axboe@kernel.dk, ulf.hansson@linaro.org,
	wsa+renesas@sang-engineering.com
Subject: [RFC PATCH v6 3/5] block: add a helper function to merge the segments
	by an IOMMU
Date: Thu, 13 Jun 2019 19:20:13 +0900
Message-Id: <1560421215-10750-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560421215-10750-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1560421215-10750-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-renesas-soc@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-block@vger.kernel.org, iommu@lists.linux-foundation.org, hch@lst.de
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
the segments by an IOMMU.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 block/blk-settings.c   | 28 ++++++++++++++++++++++++++++
 include/linux/blkdev.h |  2 ++
 2 files changed, 30 insertions(+)

diff --git a/block/blk-settings.c b/block/blk-settings.c
index 45f2c52..4e4e13e 100644
--- a/block/blk-settings.c
+++ b/block/blk-settings.c
@@ -4,9 +4,11 @@
  */
 #include <linux/bio.h>
 #include <linux/blkdev.h>
+#include <linux/device.h>
 #include <linux/gcd.h>
 #include <linux/gfp.h>
 #include <linux/init.h>
+#include <linux/iommu.h>
 #include <linux/jiffies.h>
 #include <linux/kernel.h>
 #include <linux/lcm.h>
@@ -831,6 +833,32 @@ void blk_queue_write_cache(struct request_queue *q, bool wc, bool fua)
 }
 EXPORT_SYMBOL_GPL(blk_queue_write_cache);
 
+/**
+ * blk_queue_can_use_iommu_merging - configure queue for merging segments.
+ * @q:		the request queue for the device
+ * @dev:	the device pointer for dma
+ *
+ * Tell the block layer about the iommu merging of @q.
+ */
+bool blk_queue_can_use_iommu_merging(struct request_queue *q,
+				     struct device *dev)
+{
+	struct iommu_domain *domain;
+
+	/*
+	 * If the device DMA is translated by an IOMMU, we can assume
+	 * the device can merge the segments.
+	 */
+	if (!device_iommu_mapped(dev))
+		return false;
+
+	domain = iommu_get_domain_for_dev(dev);
+	/* No need to update max_segment_size. see blk_queue_virt_boundary() */
+	blk_queue_virt_boundary(q, iommu_get_minimum_page_size(domain) - 1);
+
+	return true;
+}
+
 static int __init blk_settings_init(void)
 {
 	blk_max_low_pfn = max_low_pfn - 1;
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 592669b..4d1f7dc 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -1091,6 +1091,8 @@ extern void blk_queue_dma_alignment(struct request_queue *, int);
 extern void blk_queue_update_dma_alignment(struct request_queue *, int);
 extern void blk_queue_rq_timeout(struct request_queue *, unsigned int);
 extern void blk_queue_write_cache(struct request_queue *q, bool enabled, bool fua);
+extern bool blk_queue_can_use_iommu_merging(struct request_queue *q,
+					    struct device *dev);
 
 /*
  * Number of physical segments as sent to the device.
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
