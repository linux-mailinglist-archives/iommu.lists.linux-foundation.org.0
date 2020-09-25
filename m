Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id D9496278474
	for <lists.iommu@lfdr.de>; Fri, 25 Sep 2020 11:56:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 38E30875C6;
	Fri, 25 Sep 2020 09:56:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gia4qz5zYZwW; Fri, 25 Sep 2020 09:56:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id CC069875B5;
	Fri, 25 Sep 2020 09:56:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C4184C0859;
	Fri, 25 Sep 2020 09:56:04 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 110F0C0859
 for <iommu@lists.linux-foundation.org>; Fri, 25 Sep 2020 09:56:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id CCFEE2E148
 for <iommu@lists.linux-foundation.org>; Fri, 25 Sep 2020 09:56:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jS+wkxQ9mC81 for <iommu@lists.linux-foundation.org>;
 Fri, 25 Sep 2020 09:56:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by silver.osuosl.org (Postfix) with ESMTPS id 247ED2E147
 for <iommu@lists.linux-foundation.org>; Fri, 25 Sep 2020 09:55:59 +0000 (UTC)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id D80C62B58327539BEEE7;
 Fri, 25 Sep 2020 17:55:56 +0800 (CST)
Received: from localhost.localdomain (10.69.192.58) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.487.0; Fri, 25 Sep 2020 17:55:48 +0800
From: John Garry <john.garry@huawei.com>
To: <joro@8bytes.org>, <robin.murphy@arm.com>
Subject: [PATCH 1/2] iommu/iova: Flush CPU rcache for when a depot fills
Date: Fri, 25 Sep 2020 17:51:08 +0800
Message-ID: <1601027469-221812-2-git-send-email-john.garry@huawei.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1601027469-221812-1-git-send-email-john.garry@huawei.com>
References: <1601027469-221812-1-git-send-email-john.garry@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.69.192.58]
X-CFilter-Loop: Reflected
Cc: linuxarm@huawei.com, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, xiyou.wangcong@gmail.com
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

Leizhen reported some time ago that IOVA performance may degrade over time
[0], but unfortunately his solution to fix this problem was not given
attention.

To summarize, the issue is that as time goes by, the CPU rcache and depot
rcache continue to grow. As such, IOVA RB tree access time also continues
to grow.

At a certain point, a depot may become full, and also some CPU rcaches may
also be full when we try to insert another IOVA. For this scenario,
currently we free the "loaded" CPU rcache and create a new one. This
free'ing means that we need to free many IOVAs in the RB tree, which
makes IO throughput performance fall off a cliff in our storage scenario:

Jobs: 12 (f=12): [RRRRRRRRRRRR] [0.0% done] [6314MB/0KB/0KB /s] [1616K/0/0 iops]
Jobs: 12 (f=12): [RRRRRRRRRRRR] [0.0% done] [5669MB/0KB/0KB /s] [1451K/0/0 iops]
Jobs: 12 (f=12): [RRRRRRRRRRRR] [0.0% done] [6031MB/0KB/0KB /s] [1544K/0/0 iops]
Jobs: 12 (f=12): [RRRRRRRRRRRR] [0.0% done] [6673MB/0KB/0KB /s] [1708K/0/0 iops]
Jobs: 12 (f=12): [RRRRRRRRRRRR] [0.0% done] [6705MB/0KB/0KB /s] [1717K/0/0 iops]
Jobs: 12 (f=12): [RRRRRRRRRRRR] [0.0% done] [6031MB/0KB/0KB /s] [1544K/0/0 iops]
Jobs: 12 (f=12): [RRRRRRRRRRRR] [0.0% done] [6761MB/0KB/0KB /s] [1731K/0/0 iops]
Jobs: 12 (f=12): [RRRRRRRRRRRR] [0.0% done] [6705MB/0KB/0KB /s] [1717K/0/0 iops]
Jobs: 12 (f=12): [RRRRRRRRRRRR] [0.0% done] [6685MB/0KB/0KB /s] [1711K/0/0 iops]
Jobs: 12 (f=12): [RRRRRRRRRRRR] [0.0% done] [6178MB/0KB/0KB /s] [1582K/0/0 iops]
Jobs: 12 (f=12): [RRRRRRRRRRRR] [0.0% done] [6731MB/0KB/0KB /s] [1723K/0/0 iops]
Jobs: 12 (f=12): [RRRRRRRRRRRR] [0.0% done] [2387MB/0KB/0KB /s] [611K/0/0 iops]
Jobs: 12 (f=12): [RRRRRRRRRRRR] [0.0% done] [2689MB/0KB/0KB /s] [688K/0/0 iops]
Jobs: 12 (f=12): [RRRRRRRRRRRR] [0.0% done] [2278MB/0KB/0KB /s] [583K/0/0 iops]
Jobs: 12 (f=12): [RRRRRRRRRRRR] [0.0% done] [1288MB/0KB/0KB /s] [330K/0/0 iops]
Jobs: 12 (f=12): [RRRRRRRRRRRR] [0.0% done] [1632MB/0KB/0KB /s] [418K/0/0 iops]
Jobs: 12 (f=12): [RRRRRRRRRRRR] [0.0% done] [1765MB/0KB/0KB /s] [452K/0/0 iops]

And continue in this fashion, without recovering. Note that in this
example we had to wait 16 hours for this to occur. Also note that IO
throughput also becomes gradually becomes more unstable leading up to this
point.

As a solution this issue, we judge that the IOVA rcaches have grown too
big, and just flush all the CPUs rcaches instead.

The depot rcaches, however, are not flushed, as they can be used to
immediately replenish active CPUs.

In future, some IOVA rcache compaction could be implemented to solve the
instabilty issue, which I figure could be quite complex to implement.

[0] https://lore.kernel.org/linux-iommu/20190815121104.29140-3-thunder.leizhen@huawei.com/

Reported-by: Xiang Chen <chenxiang66@hisilicon.com>
Tested-by: Xiang Chen <chenxiang66@hisilicon.com>
Signed-off-by: John Garry <john.garry@huawei.com>
---
 drivers/iommu/iova.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/iommu/iova.c b/drivers/iommu/iova.c
index 45a251da5453..05e0b462e0d9 100644
--- a/drivers/iommu/iova.c
+++ b/drivers/iommu/iova.c
@@ -892,9 +892,8 @@ static bool __iova_rcache_insert(struct iova_domain *iovad,
 				 struct iova_rcache *rcache,
 				 unsigned long iova_pfn)
 {
-	struct iova_magazine *mag_to_free = NULL;
 	struct iova_cpu_rcache *cpu_rcache;
-	bool can_insert = false;
+	bool can_insert = false, flush = false;
 	unsigned long flags;
 
 	cpu_rcache = raw_cpu_ptr(rcache->cpu_rcaches);
@@ -913,13 +912,19 @@ static bool __iova_rcache_insert(struct iova_domain *iovad,
 			if (rcache->depot_size < MAX_GLOBAL_MAGS) {
 				rcache->depot[rcache->depot_size++] =
 						cpu_rcache->loaded;
+				can_insert = true;
+				cpu_rcache->loaded = new_mag;
 			} else {
-				mag_to_free = cpu_rcache->loaded;
+				/*
+				 * The depot is full, meaning that a very large
+				 * cache of IOVAs has built up, which slows
+				 * down RB tree accesses significantly
+				 * -> let's flush at this point.
+				 */
+				flush = true;
+				iova_magazine_free(new_mag);
 			}
 			spin_unlock(&rcache->lock);
-
-			cpu_rcache->loaded = new_mag;
-			can_insert = true;
 		}
 	}
 
@@ -928,9 +933,11 @@ static bool __iova_rcache_insert(struct iova_domain *iovad,
 
 	spin_unlock_irqrestore(&cpu_rcache->lock, flags);
 
-	if (mag_to_free) {
-		iova_magazine_free_pfns(mag_to_free, iovad);
-		iova_magazine_free(mag_to_free);
+	if (flush) {
+		int cpu;
+
+		for_each_online_cpu(cpu)
+			free_cpu_cached_iovas(cpu, iovad);
 	}
 
 	return can_insert;
-- 
2.26.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
