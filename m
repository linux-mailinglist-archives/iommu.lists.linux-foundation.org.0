Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 97732310A66
	for <lists.iommu@lfdr.de>; Fri,  5 Feb 2021 12:39:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BCFE886357;
	Fri,  5 Feb 2021 11:39:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e-jOUAjrCMCb; Fri,  5 Feb 2021 11:39:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id F1F4486637;
	Fri,  5 Feb 2021 11:39:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E1978C1DA9;
	Fri,  5 Feb 2021 11:39:24 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B3AB2C013A
 for <iommu@lists.linux-foundation.org>; Fri,  5 Feb 2021 11:39:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 93D42871D2
 for <iommu@lists.linux-foundation.org>; Fri,  5 Feb 2021 11:39:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qJydX4yS5uCX for <iommu@lists.linux-foundation.org>;
 Fri,  5 Feb 2021 11:39:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by whitealder.osuosl.org (Postfix) with ESMTPS id EBE4887106
 for <iommu@lists.linux-foundation.org>; Fri,  5 Feb 2021 11:39:21 +0000 (UTC)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DXD1F3fFxzlH82;
 Fri,  5 Feb 2021 19:37:37 +0800 (CST)
Received: from SWX921481.china.huawei.com (10.126.202.232) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.498.0; Fri, 5 Feb 2021 19:39:07 +0800
From: Barry Song <song.bao.hua@hisilicon.com>
To: <m.szyprowski@samsung.com>, <hch@lst.de>, <robin.murphy@arm.com>,
 <iommu@lists.linux-foundation.org>
Subject: [PATCH v3 1/2] dma-mapping: benchmark: use u8 for reserved field in
 uAPI structure
Date: Sat, 6 Feb 2021 00:33:24 +1300
Message-ID: <20210205113325.19556-1-song.bao.hua@hisilicon.com>
X-Mailer: git-send-email 2.21.0.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.126.202.232]
X-CFilter-Loop: Reflected
Cc: linux-kernel@vger.kernel.org, linuxarm@openeuler.org
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

The original code put five u32 before a u64 expansion[10] array. Five is
odd, this will cause trouble in the extension of the structure by adding
new features. This patch moves to use u8 for reserved field to avoid
future alignment risk.
Meanwhile, it also clears the memory of struct map_benchmark in tools,
otherwise, if users use old version to run on newer kernel, the random
expansion value will cause side effect on newer kernel.

Signed-off-by: Barry Song <song.bao.hua@hisilicon.com>
---
 kernel/dma/map_benchmark.c                      | 2 +-
 tools/testing/selftests/dma/dma_map_benchmark.c | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/kernel/dma/map_benchmark.c b/kernel/dma/map_benchmark.c
index 1b1b8ff875cb..da95df381483 100644
--- a/kernel/dma/map_benchmark.c
+++ b/kernel/dma/map_benchmark.c
@@ -36,7 +36,7 @@ struct map_benchmark {
 	__s32 node; /* which numa node this benchmark will run on */
 	__u32 dma_bits; /* DMA addressing capability */
 	__u32 dma_dir; /* DMA data direction */
-	__u64 expansion[10];	/* For future use */
+	__u8 expansion[84];	/* For future use */
 };
 
 struct map_benchmark_data {
diff --git a/tools/testing/selftests/dma/dma_map_benchmark.c b/tools/testing/selftests/dma/dma_map_benchmark.c
index 7065163a8388..537d65968c48 100644
--- a/tools/testing/selftests/dma/dma_map_benchmark.c
+++ b/tools/testing/selftests/dma/dma_map_benchmark.c
@@ -6,6 +6,7 @@
 #include <fcntl.h>
 #include <stdio.h>
 #include <stdlib.h>
+#include <string.h>
 #include <unistd.h>
 #include <sys/ioctl.h>
 #include <sys/mman.h>
@@ -35,7 +36,7 @@ struct map_benchmark {
 	__s32 node; /* which numa node this benchmark will run on */
 	__u32 dma_bits; /* DMA addressing capability */
 	__u32 dma_dir; /* DMA data direction */
-	__u64 expansion[10];	/* For future use */
+	__u8 expansion[84];	/* For future use */
 };
 
 int main(int argc, char **argv)
@@ -102,6 +103,7 @@ int main(int argc, char **argv)
 		exit(1);
 	}
 
+	memset(&map, 0, sizeof(map));
 	map.seconds = seconds;
 	map.threads = threads;
 	map.node = node;
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
