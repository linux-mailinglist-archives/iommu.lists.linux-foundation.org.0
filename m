Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 8330545A4D7
	for <lists.iommu@lfdr.de>; Tue, 23 Nov 2021 15:11:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2645F80EF5;
	Tue, 23 Nov 2021 14:11:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cmqBzS0qRHFc; Tue, 23 Nov 2021 14:11:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id A253480EE7;
	Tue, 23 Nov 2021 14:11:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7E66DC0036;
	Tue, 23 Nov 2021 14:11:14 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 15F84C0012
 for <iommu@lists.linux-foundation.org>; Tue, 23 Nov 2021 14:11:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 10A68403C5
 for <iommu@lists.linux-foundation.org>; Tue, 23 Nov 2021 14:11:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OhxQQ5Ifgi55 for <iommu@lists.linux-foundation.org>;
 Tue, 23 Nov 2021 14:11:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp2.osuosl.org (Postfix) with ESMTP id D19A640400
 for <iommu@lists.linux-foundation.org>; Tue, 23 Nov 2021 14:11:09 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 43611150C;
 Tue, 23 Nov 2021 06:11:09 -0800 (PST)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com
 [10.1.196.40])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 28FA33F66F;
 Tue, 23 Nov 2021 06:11:08 -0800 (PST)
From: Robin Murphy <robin.murphy@arm.com>
To: joro@8bytes.org,
	will@kernel.org
Subject: [PATCH 9/9] iommu: Move flush queue data into iommu_dma_cookie
Date: Tue, 23 Nov 2021 14:10:44 +0000
Message-Id: <49bfd9636fd21c4b40e07558db6bfbbf82a449ac.1637674723.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.28.0.dirty
In-Reply-To: <cover.1637671820.git.robin.murphy@arm.com>
References: <cover.1637671820.git.robin.murphy@arm.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, willy@infradead.org,
 iommu@lists.linux-foundation.org
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

Complete the move into iommu-dma by refactoring the flush queues
themselves to belong to the DMA cookie rather than the IOVA domain.

The refactoring may as well extend to some minor cosmetic aspects
too, to help us stay one step ahead of the style police.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/dma-iommu.c | 171 +++++++++++++++++++++-----------------
 drivers/iommu/iova.c      |   2 -
 include/linux/iova.h      |  44 +---------
 3 files changed, 95 insertions(+), 122 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index ddf75e7c2ebc..8a1aa980d376 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -9,9 +9,12 @@
  */
 
 #include <linux/acpi_iort.h>
+#include <linux/atomic.h>
+#include <linux/crash_dump.h>
 #include <linux/device.h>
-#include <linux/dma-map-ops.h>
+#include <linux/dma-direct.h>
 #include <linux/dma-iommu.h>
+#include <linux/dma-map-ops.h>
 #include <linux/gfp.h>
 #include <linux/huge_mm.h>
 #include <linux/iommu.h>
@@ -20,11 +23,10 @@
 #include <linux/mm.h>
 #include <linux/mutex.h>
 #include <linux/pci.h>
-#include <linux/swiotlb.h>
 #include <linux/scatterlist.h>
+#include <linux/spinlock.h>
+#include <linux/swiotlb.h>
 #include <linux/vmalloc.h>
-#include <linux/crash_dump.h>
-#include <linux/dma-direct.h>
 
 struct iommu_dma_msi_page {
 	struct list_head	list;
@@ -41,7 +43,19 @@ struct iommu_dma_cookie {
 	enum iommu_dma_cookie_type	type;
 	union {
 		/* Full allocator for IOMMU_DMA_IOVA_COOKIE */
-		struct iova_domain	iovad;
+		struct {
+			struct iova_domain	iovad;
+
+			struct iova_fq __percpu *fq;	/* Flush queue */
+			/* Number of TLB flushes that have been started */
+			atomic64_t		fq_flush_start_cnt;
+			/* Number of TLB flushes that have been finished */
+			atomic64_t		fq_flush_finish_cnt;
+			/* Timer to regularily empty the flush queues */
+			struct timer_list	fq_timer;
+			/* 1 when timer is active, 0 when not */
+			atomic_t		fq_timer_on;
+		};
 		/* Trivial linear page allocator for IOMMU_DMA_MSI_COOKIE */
 		dma_addr_t		msi_iova;
 	};
@@ -65,6 +79,27 @@ static int __init iommu_dma_forcedac_setup(char *str)
 early_param("iommu.forcedac", iommu_dma_forcedac_setup);
 
 
+/* Number of entries per flush queue */
+#define IOVA_FQ_SIZE	256
+
+/* Timeout (in ms) after which entries are flushed from the queue */
+#define IOVA_FQ_TIMEOUT	10
+
+/* Flush queue entry for deferred flushing */
+struct iova_fq_entry {
+	unsigned long iova_pfn;
+	unsigned long pages;
+	struct list_head freelist;
+	u64 counter; /* Flush counter when this entry was added */
+};
+
+/* Per-CPU flush queue structure */
+struct iova_fq {
+	struct iova_fq_entry entries[IOVA_FQ_SIZE];
+	unsigned int head, tail;
+	spinlock_t lock;
+};
+
 #define fq_ring_for_each(i, fq) \
 	for ((i) = (fq)->head; (i) != (fq)->tail; (i) = ((i) + 1) % IOVA_FQ_SIZE)
 
@@ -74,9 +109,9 @@ static inline bool fq_full(struct iova_fq *fq)
 	return (((fq->tail + 1) % IOVA_FQ_SIZE) == fq->head);
 }
 
-static inline unsigned fq_ring_add(struct iova_fq *fq)
+static inline unsigned int fq_ring_add(struct iova_fq *fq)
 {
-	unsigned idx = fq->tail;
+	unsigned int idx = fq->tail;
 
 	assert_spin_locked(&fq->lock);
 
@@ -85,10 +120,10 @@ static inline unsigned fq_ring_add(struct iova_fq *fq)
 	return idx;
 }
 
-static void fq_ring_free(struct iova_domain *iovad, struct iova_fq *fq)
+static void fq_ring_free(struct iommu_dma_cookie *cookie, struct iova_fq *fq)
 {
-	u64 counter = atomic64_read(&iovad->fq_flush_finish_cnt);
-	unsigned idx;
+	u64 counter = atomic64_read(&cookie->fq_flush_finish_cnt);
+	unsigned int idx;
 
 	assert_spin_locked(&fq->lock);
 
@@ -98,7 +133,7 @@ static void fq_ring_free(struct iova_domain *iovad, struct iova_fq *fq)
 			break;
 
 		put_pages_list(&fq->entries[idx].freelist);
-		free_iova_fast(iovad,
+		free_iova_fast(&cookie->iovad,
 			       fq->entries[idx].iova_pfn,
 			       fq->entries[idx].pages);
 
@@ -106,50 +141,50 @@ static void fq_ring_free(struct iova_domain *iovad, struct iova_fq *fq)
 	}
 }
 
-static void iova_domain_flush(struct iova_domain *iovad)
+static void fq_flush_iotlb(struct iommu_dma_cookie *cookie)
 {
-	atomic64_inc(&iovad->fq_flush_start_cnt);
-	iovad->fq_domain->ops->flush_iotlb_all(iovad->fq_domain);
-	atomic64_inc(&iovad->fq_flush_finish_cnt);
+	atomic64_inc(&cookie->fq_flush_start_cnt);
+	cookie->fq_domain->ops->flush_iotlb_all(cookie->fq_domain);
+	atomic64_inc(&cookie->fq_flush_finish_cnt);
 }
 
 static void fq_flush_timeout(struct timer_list *t)
 {
-	struct iova_domain *iovad = from_timer(iovad, t, fq_timer);
+	struct iommu_dma_cookie *cookie = from_timer(cookie, t, fq_timer);
 	int cpu;
 
-	atomic_set(&iovad->fq_timer_on, 0);
-	iova_domain_flush(iovad);
+	atomic_set(&cookie->fq_timer_on, 0);
+	fq_flush_iotlb(cookie);
 
 	for_each_possible_cpu(cpu) {
 		unsigned long flags;
 		struct iova_fq *fq;
 
-		fq = per_cpu_ptr(iovad->fq, cpu);
+		fq = per_cpu_ptr(cookie->fq, cpu);
 		spin_lock_irqsave(&fq->lock, flags);
-		fq_ring_free(iovad, fq);
+		fq_ring_free(cookie, fq);
 		spin_unlock_irqrestore(&fq->lock, flags);
 	}
 }
 
-void queue_iova(struct iova_domain *iovad,
+static void queue_iova(struct iommu_dma_cookie *cookie,
 		unsigned long pfn, unsigned long pages,
 		struct list_head *freelist)
 {
 	struct iova_fq *fq;
 	unsigned long flags;
-	unsigned idx;
+	unsigned int idx;
 
 	/*
 	 * Order against the IOMMU driver's pagetable update from unmapping
-	 * @pte, to guarantee that iova_domain_flush() observes that if called
+	 * @pte, to guarantee that fq_flush_iotlb() observes that if called
 	 * from a different CPU before we release the lock below. Full barrier
 	 * so it also pairs with iommu_dma_init_fq() to avoid seeing partially
 	 * written fq state here.
 	 */
 	smp_mb();
 
-	fq = raw_cpu_ptr(iovad->fq);
+	fq = raw_cpu_ptr(cookie->fq);
 	spin_lock_irqsave(&fq->lock, flags);
 
 	/*
@@ -157,65 +192,66 @@ void queue_iova(struct iova_domain *iovad,
 	 * flushed out on another CPU. This makes the fq_full() check below less
 	 * likely to be true.
 	 */
-	fq_ring_free(iovad, fq);
+	fq_ring_free(cookie, fq);
 
 	if (fq_full(fq)) {
-		iova_domain_flush(iovad);
-		fq_ring_free(iovad, fq);
+		fq_flush_iotlb(cookie);
+		fq_ring_free(cookie, fq);
 	}
 
 	idx = fq_ring_add(fq);
 
 	fq->entries[idx].iova_pfn = pfn;
 	fq->entries[idx].pages    = pages;
-	fq->entries[idx].counter  = atomic64_read(&iovad->fq_flush_start_cnt);
+	fq->entries[idx].counter  = atomic64_read(&cookie->fq_flush_start_cnt);
 	list_splice(freelist, &fq->entries[idx].freelist);
 
 	spin_unlock_irqrestore(&fq->lock, flags);
 
 	/* Avoid false sharing as much as possible. */
-	if (!atomic_read(&iovad->fq_timer_on) &&
-	    !atomic_xchg(&iovad->fq_timer_on, 1))
-		mod_timer(&iovad->fq_timer,
+	if (!atomic_read(&cookie->fq_timer_on) &&
+	    !atomic_xchg(&cookie->fq_timer_on, 1))
+		mod_timer(&cookie->fq_timer,
 			  jiffies + msecs_to_jiffies(IOVA_FQ_TIMEOUT));
 }
 
-static void free_iova_flush_queue(struct iova_domain *iovad)
+static void iommu_dma_free_fq(struct iommu_dma_cookie *cookie)
 {
 	int cpu, idx;
 
-	if (!iovad->fq)
+	if (!cookie->fq)
 		return;
 
-	del_timer(&iovad->fq_timer);
-	/*
-	 * This code runs when the iova_domain is being detroyed, so don't
-	 * bother to free iovas, just free any remaining pagetable pages.
-	 */
+	del_timer(&cookie->fq_timer);
+	/* The IOVAs will be torn down separately, so just free our queued pages */
 	for_each_possible_cpu(cpu) {
-		struct iova_fq *fq = per_cpu_ptr(iovad->fq, cpu);
+		struct iova_fq *fq = per_cpu_ptr(cookie->fq, cpu);
 
 		fq_ring_for_each(idx, fq)
 			put_pages_list(&fq->entries[idx].freelist);
 	}
 
-	free_percpu(iovad->fq);
-
-	iovad->fq = NULL;
-	iovad->fq_domain = NULL;
+	free_percpu(cookie->fq);
 }
 
-int init_iova_flush_queue(struct iova_domain *iovad, struct iommu_domain *fq_domain)
+/* sysfs updates are serialised by the mutex of the group owning @domain */
+int iommu_dma_init_fq(struct iommu_domain *domain)
 {
+	struct iommu_dma_cookie *cookie = domain->iova_cookie;
 	struct iova_fq __percpu *queue;
 	int i, cpu;
 
-	atomic64_set(&iovad->fq_flush_start_cnt,  0);
-	atomic64_set(&iovad->fq_flush_finish_cnt, 0);
+	if (cookie->fq_domain)
+		return 0;
+
+	atomic64_set(&cookie->fq_flush_start_cnt,  0);
+	atomic64_set(&cookie->fq_flush_finish_cnt, 0);
 
 	queue = alloc_percpu(struct iova_fq);
-	if (!queue)
+	if (!queue) {
+		pr_warn("iova flush queue initialization failed\n");
 		return -ENOMEM;
+	}
 
 	for_each_possible_cpu(cpu) {
 		struct iova_fq *fq = per_cpu_ptr(queue, cpu);
@@ -229,12 +265,16 @@ int init_iova_flush_queue(struct iova_domain *iovad, struct iommu_domain *fq_dom
 			INIT_LIST_HEAD(&fq->entries[i].freelist);
 	}
 
-	iovad->fq_domain = fq_domain;
-	iovad->fq = queue;
-
-	timer_setup(&iovad->fq_timer, fq_flush_timeout, 0);
-	atomic_set(&iovad->fq_timer_on, 0);
+	cookie->fq = queue;
 
+	timer_setup(&cookie->fq_timer, fq_flush_timeout, 0);
+	atomic_set(&cookie->fq_timer_on, 0);
+	/*
+	 * Prevent incomplete fq state being observable. Pairs with path from
+	 * __iommu_dma_unmap() through iommu_dma_free_iova() to queue_iova()
+	 */
+	smp_wmb();
+	WRITE_ONCE(cookie->fq_domain, domain);
 	return 0;
 }
 
@@ -320,7 +360,7 @@ void iommu_put_dma_cookie(struct iommu_domain *domain)
 		return;
 
 	if (cookie->type == IOMMU_DMA_IOVA_COOKIE && cookie->iovad.granule) {
-		free_iova_flush_queue(&cookie->iovad);
+		iommu_dma_free_fq(cookie);
 		put_iova_domain(&cookie->iovad);
 	}
 
@@ -469,29 +509,6 @@ static bool dev_use_swiotlb(struct device *dev)
 	return IS_ENABLED(CONFIG_SWIOTLB) && dev_is_untrusted(dev);
 }
 
-/* sysfs updates are serialised by the mutex of the group owning @domain */
-int iommu_dma_init_fq(struct iommu_domain *domain)
-{
-	struct iommu_dma_cookie *cookie = domain->iova_cookie;
-	int ret;
-
-	if (cookie->fq_domain)
-		return 0;
-
-	ret = init_iova_flush_queue(&cookie->iovad, domain);
-	if (ret) {
-		pr_warn("iova flush queue initialization failed\n");
-		return ret;
-	}
-	/*
-	 * Prevent incomplete iovad->fq being observable. Pairs with path from
-	 * __iommu_dma_unmap() through iommu_dma_free_iova() to queue_iova()
-	 */
-	smp_wmb();
-	WRITE_ONCE(cookie->fq_domain, domain);
-	return 0;
-}
-
 /**
  * iommu_dma_init_domain - Initialise a DMA mapping domain
  * @domain: IOMMU domain previously prepared by iommu_get_dma_cookie()
@@ -630,7 +647,7 @@ static void iommu_dma_free_iova(struct iommu_dma_cookie *cookie,
 	if (cookie->type == IOMMU_DMA_MSI_COOKIE)
 		cookie->msi_iova -= size;
 	else if (gather && gather->queued)
-		queue_iova(iovad, iova_pfn(iovad, iova),
+		queue_iova(cookie, iova_pfn(iovad, iova),
 				size >> iova_shift(iovad),
 				&gather->freelist);
 	else
diff --git a/drivers/iommu/iova.c b/drivers/iommu/iova.c
index 6673dfa8e7c5..72ac25831584 100644
--- a/drivers/iommu/iova.c
+++ b/drivers/iommu/iova.c
@@ -61,8 +61,6 @@ init_iova_domain(struct iova_domain *iovad, unsigned long granule,
 	iovad->start_pfn = start_pfn;
 	iovad->dma_32bit_pfn = 1UL << (32 - iova_shift(iovad));
 	iovad->max32_alloc_size = iovad->dma_32bit_pfn;
-	iovad->fq_domain = NULL;
-	iovad->fq = NULL;
 	iovad->anchor.pfn_lo = iovad->anchor.pfn_hi = IOVA_ANCHOR;
 	rb_link_node(&iovad->anchor.node, NULL, &iovad->rbroot.rb_node);
 	rb_insert_color(&iovad->anchor.node, &iovad->rbroot);
diff --git a/include/linux/iova.h b/include/linux/iova.h
index 072a09c06e8a..0abd48c5e622 100644
--- a/include/linux/iova.h
+++ b/include/linux/iova.h
@@ -12,9 +12,6 @@
 #include <linux/types.h>
 #include <linux/kernel.h>
 #include <linux/rbtree.h>
-#include <linux/atomic.h>
-#include <linux/dma-mapping.h>
-#include <linux/iommu.h>
 
 /* iova structure */
 struct iova {
@@ -36,27 +33,6 @@ struct iova_rcache {
 	struct iova_cpu_rcache __percpu *cpu_rcaches;
 };
 
-/* Number of entries per Flush Queue */
-#define IOVA_FQ_SIZE	256
-
-/* Timeout (in ms) after which entries are flushed from the Flush-Queue */
-#define IOVA_FQ_TIMEOUT	10
-
-/* Flush Queue entry for defered flushing */
-struct iova_fq_entry {
-	unsigned long iova_pfn;
-	unsigned long pages;
-	struct list_head freelist;
-	u64 counter; /* Flush counter when this entrie was added */
-};
-
-/* Per-CPU Flush Queue structure */
-struct iova_fq {
-	struct iova_fq_entry entries[IOVA_FQ_SIZE];
-	unsigned head, tail;
-	spinlock_t lock;
-};
-
 /* holds all the iova translations for a domain */
 struct iova_domain {
 	spinlock_t	iova_rbtree_lock; /* Lock to protect update of rbtree */
@@ -67,23 +43,9 @@ struct iova_domain {
 	unsigned long	start_pfn;	/* Lower limit for this domain */
 	unsigned long	dma_32bit_pfn;
 	unsigned long	max32_alloc_size; /* Size of last failed allocation */
-	struct iova_fq __percpu *fq;	/* Flush Queue */
-
-	atomic64_t	fq_flush_start_cnt;	/* Number of TLB flushes that
-						   have been started */
-
-	atomic64_t	fq_flush_finish_cnt;	/* Number of TLB flushes that
-						   have been finished */
-
 	struct iova	anchor;		/* rbtree lookup anchor */
+
 	struct iova_rcache rcaches[IOVA_RANGE_CACHE_MAX_SIZE];	/* IOVA range caches */
-
-	struct iommu_domain *fq_domain;
-
-	struct timer_list fq_timer;		/* Timer to regularily empty the
-						   flush-queues */
-	atomic_t fq_timer_on;			/* 1 when timer is active, 0
-						   when not */
 	struct hlist_node	cpuhp_dead;
 };
 
@@ -133,16 +95,12 @@ struct iova *alloc_iova(struct iova_domain *iovad, unsigned long size,
 	bool size_aligned);
 void free_iova_fast(struct iova_domain *iovad, unsigned long pfn,
 		    unsigned long size);
-void queue_iova(struct iova_domain *iovad,
-		unsigned long pfn, unsigned long pages,
-		struct list_head *freelist);
 unsigned long alloc_iova_fast(struct iova_domain *iovad, unsigned long size,
 			      unsigned long limit_pfn, bool flush_rcache);
 struct iova *reserve_iova(struct iova_domain *iovad, unsigned long pfn_lo,
 	unsigned long pfn_hi);
 void init_iova_domain(struct iova_domain *iovad, unsigned long granule,
 	unsigned long start_pfn);
-int init_iova_flush_queue(struct iova_domain *iovad, struct iommu_domain *fq_domain);
 struct iova *find_iova(struct iova_domain *iovad, unsigned long pfn);
 void put_iova_domain(struct iova_domain *iovad);
 #else
-- 
2.28.0.dirty

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
