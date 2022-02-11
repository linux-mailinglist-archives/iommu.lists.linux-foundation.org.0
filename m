Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id C94EF4B1CDB
	for <lists.iommu@lfdr.de>; Fri, 11 Feb 2022 04:14:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 422C1818EC;
	Fri, 11 Feb 2022 03:14:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2RXgFae9h1q8; Fri, 11 Feb 2022 03:14:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 4501A817C0;
	Fri, 11 Feb 2022 03:14:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 159EDC0039;
	Fri, 11 Feb 2022 03:14:46 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BD48BC000B
 for <iommu@lists.linux-foundation.org>; Fri, 11 Feb 2022 03:14:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 90263817C0
 for <iommu@lists.linux-foundation.org>; Fri, 11 Feb 2022 03:14:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N6NYio0jMWGq for <iommu@lists.linux-foundation.org>;
 Fri, 11 Feb 2022 03:14:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AE15A8175E
 for <iommu@lists.linux-foundation.org>; Fri, 11 Feb 2022 03:14:41 +0000 (UTC)
Received: from dggeme759-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4JvzBk1nmFzZfYb;
 Fri, 11 Feb 2022 11:10:22 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 dggeme759-chm.china.huawei.com (10.3.19.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.21; Fri, 11 Feb 2022 11:14:37 +0800
To: <song.bao.hua@hisilicon.com>, <shuah@kernel.org>,
 <chenxiang66@hisilicon.com>
Subject: [PATCH] dma-mapping: benchmark: Extract a common header file for
 map_benchmark definition
Date: Fri, 11 Feb 2022 11:14:41 +0800
Message-ID: <20220211031441.41126-1-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggeme759-chm.china.huawei.com (10.3.19.105)
X-CFilter-Loop: Reflected
Cc: iommu@lists.linux-foundation.org, linuxarm@openeuler.org,
 linux-kselftest@vger.kernel.org
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
From: Tian Tao via iommu <iommu@lists.linux-foundation.org>
Reply-To: Tian Tao <tiantao6@hisilicon.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

kernel/dma/map_benchmark.c and selftests/dma/dma_map_benchmark.c
have duplicate map_benchmark definitions, which tends to lead to
inconsistent changes to map_benchmark on both sides, extract a
common header file to avoid this problem.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 kernel/dma/map_benchmark.c                    | 24 +-------------
 kernel/dma/map_benchmark.h                    | 31 +++++++++++++++++++
 .../testing/selftests/dma/dma_map_benchmark.c | 25 +--------------
 3 files changed, 33 insertions(+), 47 deletions(-)
 create mode 100644 kernel/dma/map_benchmark.h

diff --git a/kernel/dma/map_benchmark.c b/kernel/dma/map_benchmark.c
index 9b9af1bd6be3..c05f4e242991 100644
--- a/kernel/dma/map_benchmark.c
+++ b/kernel/dma/map_benchmark.c
@@ -18,29 +18,7 @@
 #include <linux/slab.h>
 #include <linux/timekeeping.h>
 
-#define DMA_MAP_BENCHMARK	_IOWR('d', 1, struct map_benchmark)
-#define DMA_MAP_MAX_THREADS	1024
-#define DMA_MAP_MAX_SECONDS	300
-#define DMA_MAP_MAX_TRANS_DELAY	(10 * NSEC_PER_MSEC)
-
-#define DMA_MAP_BIDIRECTIONAL	0
-#define DMA_MAP_TO_DEVICE	1
-#define DMA_MAP_FROM_DEVICE	2
-
-struct map_benchmark {
-	__u64 avg_map_100ns; /* average map latency in 100ns */
-	__u64 map_stddev; /* standard deviation of map latency */
-	__u64 avg_unmap_100ns; /* as above */
-	__u64 unmap_stddev;
-	__u32 threads; /* how many threads will do map/unmap in parallel */
-	__u32 seconds; /* how long the test will last */
-	__s32 node; /* which numa node this benchmark will run on */
-	__u32 dma_bits; /* DMA addressing capability */
-	__u32 dma_dir; /* DMA data direction */
-	__u32 dma_trans_ns; /* time for DMA transmission in ns */
-	__u32 granule;	/* how many PAGE_SIZE will do map/unmap once a time */
-	__u8 expansion[76];	/* For future use */
-};
+#include "map_benchmark.h"
 
 struct map_benchmark_data {
 	struct map_benchmark bparam;
diff --git a/kernel/dma/map_benchmark.h b/kernel/dma/map_benchmark.h
new file mode 100644
index 000000000000..62674c83bde4
--- /dev/null
+++ b/kernel/dma/map_benchmark.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2022 HiSilicon Limited.
+ */
+
+#ifndef _KERNEL_DMA_BENCHMARK_H
+#define _KERNEL_DMA_BENCHMARK_H
+
+#define DMA_MAP_BENCHMARK       _IOWR('d', 1, struct map_benchmark)
+#define DMA_MAP_MAX_THREADS     1024
+#define DMA_MAP_MAX_SECONDS     300
+#define DMA_MAP_MAX_TRANS_DELAY (10 * NSEC_PER_MSEC)
+
+#define DMA_MAP_BIDIRECTIONAL   0
+#define DMA_MAP_TO_DEVICE       1
+#define DMA_MAP_FROM_DEVICE     2
+
+struct map_benchmark {
+	__u64 avg_map_100ns; /* average map latency in 100ns */
+	__u64 map_stddev; /* standard deviation of map latency */
+	__u64 avg_unmap_100ns; /* as above */
+	__u64 unmap_stddev;
+	__u32 threads; /* how many threads will do map/unmap in parallel */
+	__u32 seconds; /* how long the test will last */
+	__s32 node; /* which numa node this benchmark will run on */
+	__u32 dma_bits; /* DMA addressing capability */
+	__u32 dma_dir; /* DMA data direction */
+	__u32 dma_trans_ns; /* time for DMA transmission in ns */
+	__u32 granule;  /* how many PAGE_SIZE will do map/unmap once a time */
+};
+#endif /* _KERNEL_DMA_BENCHMARK_H */
diff --git a/tools/testing/selftests/dma/dma_map_benchmark.c b/tools/testing/selftests/dma/dma_map_benchmark.c
index 485dff51bad2..33bf073071aa 100644
--- a/tools/testing/selftests/dma/dma_map_benchmark.c
+++ b/tools/testing/selftests/dma/dma_map_benchmark.c
@@ -11,39 +11,16 @@
 #include <sys/ioctl.h>
 #include <sys/mman.h>
 #include <linux/types.h>
+#include "../../../../kernel/dma/map_benchmark.h"
 
 #define NSEC_PER_MSEC	1000000L
 
-#define DMA_MAP_BENCHMARK	_IOWR('d', 1, struct map_benchmark)
-#define DMA_MAP_MAX_THREADS	1024
-#define DMA_MAP_MAX_SECONDS     300
-#define DMA_MAP_MAX_TRANS_DELAY	(10 * NSEC_PER_MSEC)
-
-#define DMA_MAP_BIDIRECTIONAL	0
-#define DMA_MAP_TO_DEVICE	1
-#define DMA_MAP_FROM_DEVICE	2
-
 static char *directions[] = {
 	"BIDIRECTIONAL",
 	"TO_DEVICE",
 	"FROM_DEVICE",
 };
 
-struct map_benchmark {
-	__u64 avg_map_100ns; /* average map latency in 100ns */
-	__u64 map_stddev; /* standard deviation of map latency */
-	__u64 avg_unmap_100ns; /* as above */
-	__u64 unmap_stddev;
-	__u32 threads; /* how many threads will do map/unmap in parallel */
-	__u32 seconds; /* how long the test will last */
-	__s32 node; /* which numa node this benchmark will run on */
-	__u32 dma_bits; /* DMA addressing capability */
-	__u32 dma_dir; /* DMA data direction */
-	__u32 dma_trans_ns; /* time for DMA transmission in ns */
-	__u32 granule; /* how many PAGE_SIZE will do map/unmap once a time */
-	__u8 expansion[76];	/* For future use */
-};
-
 int main(int argc, char **argv)
 {
 	struct map_benchmark map;
-- 
2.33.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
