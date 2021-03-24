Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 74317346F53
	for <lists.iommu@lfdr.de>; Wed, 24 Mar 2021 03:17:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF6DB848F0;
	Wed, 24 Mar 2021 02:17:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uGAajhiYGuas; Wed, 24 Mar 2021 02:17:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1AC78831DB;
	Wed, 24 Mar 2021 02:17:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 05845C0012;
	Wed, 24 Mar 2021 02:17:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5D069C000A
 for <iommu@lists.linux-foundation.org>; Wed, 24 Mar 2021 02:17:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4BA3C40603
 for <iommu@lists.linux-foundation.org>; Wed, 24 Mar 2021 02:17:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5x5L4392CdhQ for <iommu@lists.linux-foundation.org>;
 Wed, 24 Mar 2021 02:17:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DBB7540602
 for <iommu@lists.linux-foundation.org>; Wed, 24 Mar 2021 02:17:17 +0000 (UTC)
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4F4sK51D6czkf2y;
 Wed, 24 Mar 2021 10:15:37 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.498.0; Wed, 24 Mar 2021 10:17:03 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <akpm@linux-foundation.org>, <peterz@infradead.org>, <paulmck@kernel.org>, 
 <ast@kernel.org>, <tglx@linutronix.de>, <rostedt@goodmis.org>, <hch@lst.de>,
 <m.szyprowski@samsung.com>, <song.bao.hua@hisilicon.com>
Subject: [PATCH] dma-mapping: make map_benchmark compile into module
Date: Wed, 24 Mar 2021 10:17:38 +0800
Message-ID: <1616552258-22282-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Cc: Tian Tao <tiantao6@hisilicon.com>, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org
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

under some scenarios, it is necessary to compile map_benchmark
into module to test iommu, so this patch changed Kconfig and
export_symbol to implement map_benchmark compiled into module.

On the other hand, map_benchmark is a driver, which is supposed
to be able to run as a module.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 kernel/dma/Kconfig | 2 +-
 kernel/kthread.c   | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/dma/Kconfig b/kernel/dma/Kconfig
index 77b4055..0468293 100644
--- a/kernel/dma/Kconfig
+++ b/kernel/dma/Kconfig
@@ -223,7 +223,7 @@ config DMA_API_DEBUG_SG
 	  If unsure, say N.
 
 config DMA_MAP_BENCHMARK
-	bool "Enable benchmarking of streaming DMA mapping"
+	tristate "Enable benchmarking of streaming DMA mapping"
 	depends on DEBUG_FS
 	help
 	  Provides /sys/kernel/debug/dma_map_benchmark that helps with testing
diff --git a/kernel/kthread.c b/kernel/kthread.c
index 1578973..fa4736f 100644
--- a/kernel/kthread.c
+++ b/kernel/kthread.c
@@ -455,6 +455,7 @@ void kthread_bind_mask(struct task_struct *p, const struct cpumask *mask)
 {
 	__kthread_bind_mask(p, mask, TASK_UNINTERRUPTIBLE);
 }
+EXPORT_SYMBOL(kthread_bind_mask);
 
 /**
  * kthread_bind - bind a just-created kthread to a cpu.
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
