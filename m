Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 4671F65E8C
	for <lists.iommu@lfdr.de>; Thu, 11 Jul 2019 19:29:15 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A5C9F54AF;
	Thu, 11 Jul 2019 17:28:54 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 12294530E
	for <iommu@lists.linux-foundation.org>;
	Thu, 11 Jul 2019 17:19:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 5AD34886
	for <iommu@lists.linux-foundation.org>;
	Thu, 11 Jul 2019 17:19:45 +0000 (UTC)
Received: from localhost.localdomain (236.31.169.217.in-addr.arpa
	[217.169.31.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id C73D421537;
	Thu, 11 Jul 2019 17:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1562865585;
	bh=T1CTt0TE4OEiiNmTZnh4zY/TICRATbyMPM/fcKXCp+Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tFRm9dMilr3YFToijTUH1tC7kvgvUpa61DfJcD3DYBc45bXsN9mYXEEefnGoEQtEu
	h9GChzL7Ma/2YnORGP74BMhBAEOP2Wz0akR8GQ/KdQ4N5o2aXUoBCoPdTOiU4NaX0G
	0zgV3wTBwbcQ8WKl9N6OXSvgnyIhFEgsuq3vYKkc=
From: Will Deacon <will@kernel.org>
To: iommu@lists.linux-foundation.org
Subject: [RFC PATCH v2 04/19] iommu: Introduce struct iommu_iotlb_gather for
	batching TLB flushes
Date: Thu, 11 Jul 2019 18:19:12 +0100
Message-Id: <20190711171927.28803-5-will@kernel.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190711171927.28803-1-will@kernel.org>
References: <20190711171927.28803-1-will@kernel.org>
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Vijay Kilary <vkilari@codeaurora.org>,
	Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
	Will Deacon <will@kernel.org>, Jan Glauber <jglauber@marvell.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Jayachandran Chandrasekharan Nair <jnair@marvell.com>,
	Jon Masters <jcm@redhat.com>, Robin Murphy <robin.murphy@arm.com>
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

To permit batching of TLB flushes across multiple calls to the IOMMU
driver's ->unmap() implementation, introduce a new structure for
tracking the address range to be flushed and the granularity at which
the flushing is required.

This is hooked into the IOMMU API and its caller are updated to make use
of the new structure. Subsequent patches will plumb this into the IOMMU
drivers as well, but for now the gathering information is ignored.

Signed-off-by: Will Deacon <will@kernel.org>
---
 drivers/iommu/dma-iommu.c       |  9 +++++++--
 drivers/iommu/iommu.c           | 19 +++++++++++-------
 drivers/vfio/vfio_iommu_type1.c | 26 ++++++++++++++++---------
 include/linux/iommu.h           | 43 +++++++++++++++++++++++++++++++++++++----
 4 files changed, 75 insertions(+), 22 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 129c4badf9ae..9d8a641a8a08 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -455,16 +455,21 @@ static void iommu_dma_free_iova(struct iommu_dma_cookie *cookie,
 static void __iommu_dma_unmap(struct iommu_domain *domain, dma_addr_t dma_addr,
 		size_t size)
 {
+	struct iommu_iotlb_gather iotlb_gather;
 	struct iommu_dma_cookie *cookie = domain->iova_cookie;
 	struct iova_domain *iovad = &cookie->iovad;
 	size_t iova_off = iova_offset(iovad, dma_addr);
+	size_t unmapped;
 
 	dma_addr -= iova_off;
 	size = iova_align(iovad, size + iova_off);
+	iommu_iotlb_gather_init(&iotlb_gather);
+
+	unmapped = iommu_unmap_fast(domain, dma_addr, size, &iotlb_gather);
+	WARN_ON(unmapped != size);
 
-	WARN_ON(iommu_unmap_fast(domain, dma_addr, size) != size);
 	if (!cookie->fq_domain)
-		iommu_tlb_sync(domain);
+		iommu_tlb_sync(domain, &iotlb_gather);
 	iommu_dma_free_iova(cookie, dma_addr, size);
 }
 
diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 0ec6e1cb6430..836b320169e8 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -1640,7 +1640,7 @@ EXPORT_SYMBOL_GPL(iommu_map);
 
 static size_t __iommu_unmap(struct iommu_domain *domain,
 			    unsigned long iova, size_t size,
-			    bool sync)
+			    struct iommu_iotlb_gather *iotlb_gather)
 {
 	const struct iommu_ops *ops = domain->ops;
 	size_t unmapped_page, unmapped = 0;
@@ -1688,9 +1688,6 @@ static size_t __iommu_unmap(struct iommu_domain *domain,
 		unmapped += unmapped_page;
 	}
 
-	if (sync && ops->iotlb_sync)
-		ops->iotlb_sync(domain);
-
 	trace_unmap(orig_iova, size, unmapped);
 	return unmapped;
 }
@@ -1698,14 +1695,22 @@ static size_t __iommu_unmap(struct iommu_domain *domain,
 size_t iommu_unmap(struct iommu_domain *domain,
 		   unsigned long iova, size_t size)
 {
-	return __iommu_unmap(domain, iova, size, true);
+	struct iommu_iotlb_gather iotlb_gather;
+	size_t ret;
+
+	iommu_iotlb_gather_init(&iotlb_gather);
+	ret = __iommu_unmap(domain, iova, size, &iotlb_gather);
+	iommu_tlb_sync(domain, &iotlb_gather);
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(iommu_unmap);
 
 size_t iommu_unmap_fast(struct iommu_domain *domain,
-			unsigned long iova, size_t size)
+			unsigned long iova, size_t size,
+			struct iommu_iotlb_gather *iotlb_gather)
 {
-	return __iommu_unmap(domain, iova, size, false);
+	return __iommu_unmap(domain, iova, size, iotlb_gather);
 }
 EXPORT_SYMBOL_GPL(iommu_unmap_fast);
 
diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
index 7fa35a83da9d..ebcb842efff2 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -666,12 +666,13 @@ static int vfio_iommu_type1_unpin_pages(void *iommu_data,
 }
 
 static long vfio_sync_unpin(struct vfio_dma *dma, struct vfio_domain *domain,
-				struct list_head *regions)
+			    struct list_head *regions,
+			    struct iommu_iotlb_gather *iotlb_gather)
 {
 	long unlocked = 0;
 	struct vfio_regions *entry, *next;
 
-	iommu_tlb_sync(domain->domain);
+	iommu_tlb_sync(domain->domain, iotlb_gather);
 
 	list_for_each_entry_safe(entry, next, regions, list) {
 		unlocked += vfio_unpin_pages_remote(dma,
@@ -701,13 +702,15 @@ static size_t unmap_unpin_fast(struct vfio_domain *domain,
 			       struct vfio_dma *dma, dma_addr_t *iova,
 			       size_t len, phys_addr_t phys, long *unlocked,
 			       struct list_head *unmapped_list,
-			       int *unmapped_cnt)
+			       int *unmapped_cnt,
+			       struct iommu_iotlb_gather *iotlb_gather)
 {
 	size_t unmapped = 0;
 	struct vfio_regions *entry = kzalloc(sizeof(*entry), GFP_KERNEL);
 
 	if (entry) {
-		unmapped = iommu_unmap_fast(domain->domain, *iova, len);
+		unmapped = iommu_unmap_fast(domain->domain, *iova, len,
+					    iotlb_gather);
 
 		if (!unmapped) {
 			kfree(entry);
@@ -727,8 +730,8 @@ static size_t unmap_unpin_fast(struct vfio_domain *domain,
 	 * or in case of errors.
 	 */
 	if (*unmapped_cnt >= VFIO_IOMMU_TLB_SYNC_MAX || !unmapped) {
-		*unlocked += vfio_sync_unpin(dma, domain,
-					     unmapped_list);
+		*unlocked += vfio_sync_unpin(dma, domain, unmapped_list,
+					     iotlb_gather);
 		*unmapped_cnt = 0;
 	}
 
@@ -759,6 +762,7 @@ static long vfio_unmap_unpin(struct vfio_iommu *iommu, struct vfio_dma *dma,
 	dma_addr_t iova = dma->iova, end = dma->iova + dma->size;
 	struct vfio_domain *domain, *d;
 	LIST_HEAD(unmapped_region_list);
+	struct iommu_iotlb_gather iotlb_gather;
 	int unmapped_region_cnt = 0;
 	long unlocked = 0;
 
@@ -783,6 +787,7 @@ static long vfio_unmap_unpin(struct vfio_iommu *iommu, struct vfio_dma *dma,
 		cond_resched();
 	}
 
+	iommu_iotlb_gather_init(&iotlb_gather);
 	while (iova < end) {
 		size_t unmapped, len;
 		phys_addr_t phys, next;
@@ -811,7 +816,8 @@ static long vfio_unmap_unpin(struct vfio_iommu *iommu, struct vfio_dma *dma,
 		 */
 		unmapped = unmap_unpin_fast(domain, dma, &iova, len, phys,
 					    &unlocked, &unmapped_region_list,
-					    &unmapped_region_cnt);
+					    &unmapped_region_cnt,
+					    &iotlb_gather);
 		if (!unmapped) {
 			unmapped = unmap_unpin_slow(domain, dma, &iova, len,
 						    phys, &unlocked);
@@ -822,8 +828,10 @@ static long vfio_unmap_unpin(struct vfio_iommu *iommu, struct vfio_dma *dma,
 
 	dma->iommu_mapped = false;
 
-	if (unmapped_region_cnt)
-		unlocked += vfio_sync_unpin(dma, domain, &unmapped_region_list);
+	if (unmapped_region_cnt) {
+		unlocked += vfio_sync_unpin(dma, domain, &unmapped_region_list,
+					    &iotlb_gather);
+	}
 
 	if (do_accounting) {
 		vfio_lock_acct(dma, -unlocked, true);
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index c5c2534ac875..6cdd2e261ee3 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -195,6 +195,23 @@ struct iommu_sva_ops {
 #ifdef CONFIG_IOMMU_API
 
 /**
+ * struct iommu_iotlb_gather - Range information for a pending IOTLB flush
+ *
+ * @start: IOVA representing the start of the range to be flushed
+ * @end: IOVA representing the end of the range to be flushed (exclusive)
+ * @pgsize: The interval at which to perform the flush
+ *
+ * This structure is intended to be updated by multiple calls to the
+ * ->unmap() function in struct iommu_ops before eventually being passed
+ * into ->iotlb_sync().
+ */
+struct iommu_iotlb_gather {
+	unsigned long		start;
+	unsigned long		end;
+	size_t			pgsize;
+};
+
+/**
  * struct iommu_ops - iommu ops and capabilities
  * @capable: check capability
  * @domain_alloc: allocate iommu domain
@@ -331,6 +348,13 @@ static inline struct iommu_device *dev_to_iommu_device(struct device *dev)
 	return (struct iommu_device *)dev_get_drvdata(dev);
 }
 
+static inline void iommu_iotlb_gather_init(struct iommu_iotlb_gather *gather)
+{
+	*gather = (struct iommu_iotlb_gather) {
+		.start	= ULONG_MAX,
+	};
+}
+
 #define IOMMU_GROUP_NOTIFY_ADD_DEVICE		1 /* Device added */
 #define IOMMU_GROUP_NOTIFY_DEL_DEVICE		2 /* Pre Device removed */
 #define IOMMU_GROUP_NOTIFY_BIND_DRIVER		3 /* Pre Driver bind */
@@ -355,7 +379,8 @@ extern int iommu_map(struct iommu_domain *domain, unsigned long iova,
 extern size_t iommu_unmap(struct iommu_domain *domain, unsigned long iova,
 			  size_t size);
 extern size_t iommu_unmap_fast(struct iommu_domain *domain,
-			       unsigned long iova, size_t size);
+			       unsigned long iova, size_t size,
+			       struct iommu_iotlb_gather *iotlb_gather);
 extern size_t iommu_map_sg(struct iommu_domain *domain, unsigned long iova,
 			   struct scatterlist *sg,unsigned int nents, int prot);
 extern phys_addr_t iommu_iova_to_phys(struct iommu_domain *domain, dma_addr_t iova);
@@ -417,10 +442,13 @@ static inline void iommu_flush_tlb_all(struct iommu_domain *domain)
 		domain->ops->flush_iotlb_all(domain);
 }
 
-static inline void iommu_tlb_sync(struct iommu_domain *domain)
+static inline void iommu_tlb_sync(struct iommu_domain *domain,
+				  struct iommu_iotlb_gather *iotlb_gather)
 {
 	if (domain->ops->iotlb_sync)
 		domain->ops->iotlb_sync(domain);
+
+	iommu_iotlb_gather_init(iotlb_gather);
 }
 
 /* PCI device grouping function */
@@ -500,6 +528,7 @@ struct iommu_ops {};
 struct iommu_group {};
 struct iommu_fwspec {};
 struct iommu_device {};
+struct iommu_iotlb_gather {};
 
 static inline bool iommu_present(struct bus_type *bus)
 {
@@ -554,7 +583,8 @@ static inline size_t iommu_unmap(struct iommu_domain *domain,
 }
 
 static inline size_t iommu_unmap_fast(struct iommu_domain *domain,
-				      unsigned long iova, int gfp_order)
+				      unsigned long iova, int gfp_order,
+				      struct iommu_iotlb_gather *iotlb_gather)
 {
 	return 0;
 }
@@ -570,7 +600,8 @@ static inline void iommu_flush_tlb_all(struct iommu_domain *domain)
 {
 }
 
-static inline void iommu_tlb_sync(struct iommu_domain *domain)
+static inline void iommu_tlb_sync(struct iommu_domain *domain,
+				  struct iommu_iotlb_gather *iotlb_gather)
 {
 }
 
@@ -725,6 +756,10 @@ static inline struct iommu_device *dev_to_iommu_device(struct device *dev)
 	return NULL;
 }
 
+static inline void iommu_iotlb_gather_init(struct iommu_iotlb_gather *gather)
+{
+}
+
 static inline void iommu_device_unregister(struct iommu_device *iommu)
 {
 }
-- 
2.11.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
