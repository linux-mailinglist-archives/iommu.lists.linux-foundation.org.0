Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC817DB9C
	for <lists.iommu@lfdr.de>; Thu,  1 Aug 2019 14:36:06 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 2C93CB19C;
	Thu,  1 Aug 2019 12:35:56 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D3F634401
	for <iommu@lists.linux-foundation.org>;
	Thu,  1 Aug 2019 12:22:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 02A8A8AC
	for <iommu@lists.linux-foundation.org>;
	Thu,  1 Aug 2019 12:22:29 +0000 (UTC)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id EDF1CC8C7A220F45FF58;
	Thu,  1 Aug 2019 20:22:26 +0800 (CST)
Received: from HGHY4L002753561.china.huawei.com (10.133.215.186) by
	DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server
	id 14.3.439.0; Thu, 1 Aug 2019 20:22:17 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>, John Garry
	<john.garry@huawei.com>, Robin Murphy <robin.murphy@arm.com>, Will Deacon
	<will@kernel.org>, Joerg Roedel <joro@8bytes.org>, linux-arm-kernel
	<linux-arm-kernel@lists.infradead.org>, iommu
	<iommu@lists.linux-foundation.org>, linux-kernel
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 2/2] iommu/iova: enhance the rcache optimization
Date: Thu, 1 Aug 2019 20:21:54 +0800
Message-ID: <20190801122154.18820-2-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.21.0.windows.1
In-Reply-To: <20190801122154.18820-1-thunder.leizhen@huawei.com>
References: <20190801122154.18820-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.133.215.186]
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

The rcache method caches the freed IOVAs, to improve the performance of
IOVAs allocation and release. This is usually okay, but it maybe declined
in some special scenarios.

For example, currently the IOVA_RANGE_CACHE_MAX_SIZE is 6, and for ecch
size, contains: MAX_GLOBAL_MAGS=32 shareable depot magazines, each vcpu
has two magazines(cpu_rcaches->loaded and cpu_rcaches->prev). In an
extreme case, it can max cache ((num_possible_cpus() * 2 + 32) * 128 * 6)
IOVAs, it's very large. The worst case happens when the depot magazines
of a certain size(usually 4K) is full, further free_iova_fast() invoking
will cause iova_magazine_free_pfns() to be called. As the above saied,
too many IOVAs buffered, so that the RB tree is very large, the
iova_magazine_free_pfns()-->private_find_iova(), and the missed iova
allocation: alloc_iova()-->__alloc_and_insert_iova_range() will spend too
much time. And that the current rcache method have no cleanup operation,
the buffered IOVAs will only increase but not decrease.

For my FIO stress test scenario, the performance drop about 35%, and can
not recover even if re-execute the test cases.
Jobs: 21 (f=21): [2.3% done] [8887M/0K /s] [2170K/0 iops]
Jobs: 21 (f=21): [2.3% done] [8902M/0K /s] [2173K/0 iops]
Jobs: 21 (f=21): [2.3% done] [6010M/0K /s] [1467K/0 iops]
Jobs: 21 (f=21): [2.3% done] [5397M/0K /s] [1318K/0 iops]

So that, I add the statistic about the rcache, when the above case
happened, release the IOVAs which are not hit.
Jobs: 21 (f=21): [100.0% done] [10324M/0K /s] [2520K/0 iops]
Jobs: 21 (f=21): [100.0% done] [10290M/0K /s] [2512K/0 iops]
Jobs: 21 (f=21): [100.0% done] [10035M/0K /s] [2450K/0 iops]
Jobs: 21 (f=21): [100.0% done] [10214M/0K /s] [2494K/0 iops]

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/iommu/iova.c | 83 +++++++++++++++++++++++++++++++++++++++++++++++++++-
 include/linux/iova.h |  1 +
 2 files changed, 83 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/iova.c b/drivers/iommu/iova.c
index 4b7a9efa0ef40af..f3828f4add25375 100644
--- a/drivers/iommu/iova.c
+++ b/drivers/iommu/iova.c
@@ -23,6 +23,8 @@ static unsigned long iova_rcache_get(struct iova_domain *iovad,
 				     unsigned long limit_pfn);
 static void init_iova_rcaches(struct iova_domain *iovad);
 static void free_iova_rcaches(struct iova_domain *iovad);
+static void iova_compact_rcache(struct iova_domain *iovad,
+				struct iova_rcache *curr_rcache);
 static void fq_destroy_all_entries(struct iova_domain *iovad);
 static void fq_flush_timeout(struct timer_list *t);
 
@@ -781,6 +783,8 @@ struct iova_magazine {
 
 struct iova_cpu_rcache {
 	spinlock_t lock;
+	bool prev_mag_hit;
+	unsigned long nr_hit;
 	struct iova_magazine *loaded;
 	struct iova_magazine *prev;
 };
@@ -934,6 +938,7 @@ static bool __iova_rcache_insert(struct iova_domain *iovad,
 	if (mag_to_free) {
 		iova_magazine_free_pfns(mag_to_free, iovad);
 		iova_magazine_free(mag_to_free);
+		iova_compact_rcache(iovad, rcache);
 	}
 
 	return can_insert;
@@ -971,18 +976,22 @@ static unsigned long __iova_rcache_get(struct iova_rcache *rcache,
 	} else if (!iova_magazine_empty(cpu_rcache->prev)) {
 		swap(cpu_rcache->prev, cpu_rcache->loaded);
 		has_pfn = true;
+		cpu_rcache->prev_mag_hit = true;
 	} else {
 		spin_lock(&rcache->lock);
 		if (rcache->depot_size > 0) {
 			iova_magazine_free(cpu_rcache->loaded);
 			cpu_rcache->loaded = rcache->depot[--rcache->depot_size];
 			has_pfn = true;
+			rcache->depot_mags_hit = true;
 		}
 		spin_unlock(&rcache->lock);
 	}
 
-	if (has_pfn)
+	if (has_pfn) {
+		cpu_rcache->nr_hit++;
 		iova_pfn = iova_magazine_pop(cpu_rcache->loaded, limit_pfn);
+	}
 
 	spin_unlock_irqrestore(&cpu_rcache->lock, flags);
 
@@ -1049,5 +1058,77 @@ void free_cpu_cached_iovas(unsigned int cpu, struct iova_domain *iovad)
 	}
 }
 
+static void iova_compact_percpu_mags(struct iova_domain *iovad,
+				     struct iova_rcache *rcache)
+{
+	unsigned int cpu;
+
+	for_each_possible_cpu(cpu) {
+		unsigned long flags;
+		struct iova_cpu_rcache *cpu_rcache;
+
+		cpu_rcache = per_cpu_ptr(rcache->cpu_rcaches, cpu);
+
+		spin_lock_irqsave(&cpu_rcache->lock, flags);
+		if (!cpu_rcache->prev_mag_hit)
+			iova_magazine_free_pfns(cpu_rcache->prev, iovad);
+
+		if (cpu_rcache->nr_hit < IOVA_MAG_SIZE)
+			iova_magazine_compact_pfns(cpu_rcache->loaded,
+						   iovad,
+						   cpu_rcache->nr_hit);
+
+		cpu_rcache->nr_hit = 0;
+		cpu_rcache->prev_mag_hit = false;
+		spin_unlock_irqrestore(&cpu_rcache->lock, flags);
+	}
+}
+
+static void iova_compact_depot_mags(struct iova_domain *iovad,
+				    struct iova_rcache *rcache)
+{
+	int i;
+	unsigned long depot_size;
+	struct iova_magazine *depot[MAX_GLOBAL_MAGS];
+
+	spin_lock(&rcache->lock);
+	if (!rcache->depot_size || rcache->depot_mags_hit) {
+		spin_unlock(&rcache->lock);
+		return;
+	}
+
+	depot_size = rcache->depot_size;
+	for (i = 0; i < depot_size; i++)
+		depot[i] = rcache->depot[i];
+	rcache->depot_size = 0;
+	rcache->depot_mags_hit = false;
+	spin_unlock(&rcache->lock);
+
+	for (i = 0; i < depot_size; i++) {
+		iova_magazine_free_pfns(depot[i], iovad);
+		iova_magazine_free(depot[i]);
+	}
+}
+
+static void iova_compact_rcache(struct iova_domain *iovad,
+				struct iova_rcache *curr_rcache)
+{
+	int i;
+	struct iova_rcache *rcache;
+
+	for (i = 0; i < IOVA_RANGE_CACHE_MAX_SIZE; i++) {
+		rcache = &iovad->rcaches[i];
+
+		/*
+		 * Don's compact current rcache, that maybe reused immediately
+		 */
+		if (rcache == curr_rcache)
+			continue;
+
+		iova_compact_percpu_mags(iovad, rcache);
+		iova_compact_depot_mags(iovad, rcache);
+	}
+}
+
 MODULE_AUTHOR("Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>");
 MODULE_LICENSE("GPL");
diff --git a/include/linux/iova.h b/include/linux/iova.h
index a0637abffee88b0..44f35b2641b736c 100644
--- a/include/linux/iova.h
+++ b/include/linux/iova.h
@@ -30,6 +30,7 @@ struct iova {
 
 struct iova_rcache {
 	spinlock_t lock;
+	bool depot_mags_hit;
 	unsigned long depot_size;
 	struct iova_magazine *depot[MAX_GLOBAL_MAGS];
 	struct iova_cpu_rcache __percpu *cpu_rcaches;
-- 
1.8.3


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
