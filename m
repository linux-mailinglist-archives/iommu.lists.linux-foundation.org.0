Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 372C071135
	for <lists.iommu@lfdr.de>; Tue, 23 Jul 2019 07:28:21 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 66E2DCD3;
	Tue, 23 Jul 2019 05:27:58 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 15D63CBC
	for <iommu@lists.linux-foundation.org>;
	Tue, 23 Jul 2019 05:27:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
	[210.160.252.171])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id C5A457C3
	for <iommu@lists.linux-foundation.org>;
	Tue, 23 Jul 2019 05:27:54 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,297,1559487600"; d="scan'208";a="22145540"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
	by relmlie5.idc.renesas.com with ESMTP; 23 Jul 2019 14:27:52 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 6316641E4097;
	Tue, 23 Jul 2019 14:27:52 +0900 (JST)
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: ulf.hansson@linaro.org, hch@lst.de, m.szyprowski@samsung.com,
	robin.murphy@arm.com, joro@8bytes.org, axboe@kernel.dk
Subject: [PATCH v8 3/5] block: sort headers on blk-setting.c
Date: Tue, 23 Jul 2019 14:26:46 +0900
Message-Id: <1563859608-19456-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563859608-19456-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1563859608-19456-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
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

This patch sorts the headers in alphabetic order to ease
the maintenance for this part.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 block/blk-settings.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/block/blk-settings.c b/block/blk-settings.c
index 2ae348c..45f2c52 100644
--- a/block/blk-settings.c
+++ b/block/blk-settings.c
@@ -2,16 +2,16 @@
 /*
  * Functions related to setting various queue properties from drivers
  */
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/init.h>
 #include <linux/bio.h>
 #include <linux/blkdev.h>
-#include <linux/memblock.h>	/* for max_pfn/max_low_pfn */
 #include <linux/gcd.h>
-#include <linux/lcm.h>
-#include <linux/jiffies.h>
 #include <linux/gfp.h>
+#include <linux/init.h>
+#include <linux/jiffies.h>
+#include <linux/kernel.h>
+#include <linux/lcm.h>
+#include <linux/memblock.h>     /* for max_pfn/max_low_pfn */
+#include <linux/module.h>
 
 #include "blk.h"
 #include "blk-wbt.h"
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
