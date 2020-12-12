Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F93C2D85D5
	for <lists.iommu@lfdr.de>; Sat, 12 Dec 2020 11:23:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E4C5886DAE;
	Sat, 12 Dec 2020 10:23:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hcc5OahT5AX9; Sat, 12 Dec 2020 10:23:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B96B386E31;
	Sat, 12 Dec 2020 10:23:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9DD83C1834;
	Sat, 12 Dec 2020 10:23:38 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 700C5C013B
 for <iommu@lists.linux-foundation.org>; Sat, 12 Dec 2020 10:23:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 5253D867ED
 for <iommu@lists.linux-foundation.org>; Sat, 12 Dec 2020 10:23:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QuCSfzc64vEF for <iommu@lists.linux-foundation.org>;
 Sat, 12 Dec 2020 10:23:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 48C3886781
 for <iommu@lists.linux-foundation.org>; Sat, 12 Dec 2020 10:23:33 +0000 (UTC)
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CtNyQ2vt0z7D0Z;
 Sat, 12 Dec 2020 18:22:54 +0800 (CST)
Received: from SWX921481.china.huawei.com (10.126.200.168) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.487.0; Sat, 12 Dec 2020 18:23:20 +0800
From: Barry Song <song.bao.hua@hisilicon.com>
To: <hch@lst.de>, <m.szyprowski@samsung.com>, <robin.murphy@arm.com>
Subject: [PATCH] dma-mapping: benchmark: check the validity of dma mask bits
Date: Sat, 12 Dec 2020 23:18:44 +1300
Message-ID: <20201212101844.23612-1-song.bao.hua@hisilicon.com>
X-Mailer: git-send-email 2.21.0.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.126.200.168]
X-CFilter-Loop: Reflected
Cc: iommu@lists.linux-foundation.org, linuxarm@huawei.com,
 Dan Carpenter <dan.carpenter@oracle.com>
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

While dma_mask_bits is larger than 64, the bahvaiour is undefined. On the
other hand, dma_mask_bits which is smaller than 20 (1MB) makes no sense
in real hardware.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Barry Song <song.bao.hua@hisilicon.com>
---
 kernel/dma/map_benchmark.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/kernel/dma/map_benchmark.c b/kernel/dma/map_benchmark.c
index b1496e744c68..19f661692073 100644
--- a/kernel/dma/map_benchmark.c
+++ b/kernel/dma/map_benchmark.c
@@ -214,6 +214,12 @@ static long map_benchmark_ioctl(struct file *file, unsigned int cmd,
 			return -EINVAL;
 		}
 
+		if (map->bparam.dma_bits < 20 ||
+		    map->bparam.dma_bits > 64) {
+			pr_err("invalid dma_bits\n");
+			return -EINVAL;
+		}
+
 		if (map->bparam.node != NUMA_NO_NODE &&
 		    !node_possible(map->bparam.node)) {
 			pr_err("invalid numa node\n");
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
