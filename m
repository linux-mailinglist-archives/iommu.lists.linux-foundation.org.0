Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id E8EF72C1FD9
	for <lists.iommu@lfdr.de>; Tue, 24 Nov 2020 09:28:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 40D84204C6;
	Tue, 24 Nov 2020 08:28:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6TE0a6NjpC1B; Tue, 24 Nov 2020 08:28:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 76C2F203D9;
	Tue, 24 Nov 2020 08:28:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5CC1CC0052;
	Tue, 24 Nov 2020 08:28:31 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 77951C0052
 for <iommu@lists.linux-foundation.org>; Tue, 24 Nov 2020 08:28:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 73ED6858A6
 for <iommu@lists.linux-foundation.org>; Tue, 24 Nov 2020 08:28:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AyRLWR_LwBxZ for <iommu@lists.linux-foundation.org>;
 Tue, 24 Nov 2020 08:28:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 59A7B858B3
 for <iommu@lists.linux-foundation.org>; Tue, 24 Nov 2020 08:28:29 +0000 (UTC)
IronPort-SDR: MzKcXhv1b41nY4HVY2ZNq1dHA5x7/7DsFaCyuBijQkQVkQe+6ZH7fm1tl0CfONKbFBwKqrM4/B
 4QUrJuljvYNA==
X-IronPort-AV: E=McAfee;i="6000,8403,9814"; a="159677873"
X-IronPort-AV: E=Sophos;i="5.78,365,1599548400"; d="scan'208";a="159677873"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2020 00:28:29 -0800
IronPort-SDR: 1Ps5ccEyiDGITzQXN/edjNpFmBbXb8BOfNP3U5u1IgJ5su2SsumXIdEiI8cPkq1/EpbBz3DSF+
 wpSfDq21f2Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,365,1599548400"; d="scan'208";a="432539699"
Received: from allen-box.sh.intel.com ([10.239.159.28])
 by fmsmga001.fm.intel.com with ESMTP; 24 Nov 2020 00:28:26 -0800
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Tom Murphy <murphyt7@tcd.ie>, David Woodhouse <dwmw2@infradead.org>,
 Christoph Hellwig <hch@infradead.org>
Subject: [PATCH v6 1/7] iommu: Handle freelists when using deferred flushing
 in iommu drivers
Date: Tue, 24 Nov 2020 16:20:51 +0800
Message-Id: <20201124082057.2614359-2-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201124082057.2614359-1-baolu.lu@linux.intel.com>
References: <20201124082057.2614359-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Ashok Raj <ashok.raj@intel.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Logan Gunthorpe <logang@deltatee.com>
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

From: Tom Murphy <murphyt7@tcd.ie>

Allow the iommu_unmap_fast to return newly freed page table pages and
pass the freelist to queue_iova in the dma-iommu ops path.

This is useful for iommu drivers (in this case the intel iommu driver)
which need to wait for the ioTLB to be flushed before newly
free/unmapped page table pages can be freed. This way we can still batch
ioTLB free operations and handle the freelists.

Signed-off-by: Tom Murphy <murphyt7@tcd.ie>
Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
Tested-by: Logan Gunthorpe <logang@deltatee.com>
---
 drivers/iommu/dma-iommu.c   | 29 +++++++++++++------
 drivers/iommu/intel/iommu.c | 55 ++++++++++++++++++++++++-------------
 include/linux/iommu.h       |  1 +
 3 files changed, 58 insertions(+), 27 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 0cbcd3fc3e7e..9c827a4d2207 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -49,6 +49,18 @@ struct iommu_dma_cookie {
 	struct iommu_domain		*fq_domain;
 };
 
+static void iommu_dma_entry_dtor(unsigned long data)
+{
+	struct page *freelist = (struct page *)data;
+
+	while (freelist) {
+		unsigned long p = (unsigned long)page_address(freelist);
+
+		freelist = freelist->freelist;
+		free_page(p);
+	}
+}
+
 static inline size_t cookie_msi_granule(struct iommu_dma_cookie *cookie)
 {
 	if (cookie->type == IOMMU_DMA_IOVA_COOKIE)
@@ -343,7 +355,7 @@ static int iommu_dma_init_domain(struct iommu_domain *domain, dma_addr_t base,
 	if (!cookie->fq_domain && !iommu_domain_get_attr(domain,
 			DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE, &attr) && attr) {
 		if (init_iova_flush_queue(iovad, iommu_dma_flush_iotlb_all,
-					NULL))
+					  iommu_dma_entry_dtor))
 			pr_warn("iova flush queue initialization failed\n");
 		else
 			cookie->fq_domain = domain;
@@ -440,7 +452,7 @@ static dma_addr_t iommu_dma_alloc_iova(struct iommu_domain *domain,
 }
 
 static void iommu_dma_free_iova(struct iommu_dma_cookie *cookie,
-		dma_addr_t iova, size_t size)
+		dma_addr_t iova, size_t size, struct page *freelist)
 {
 	struct iova_domain *iovad = &cookie->iovad;
 
@@ -449,7 +461,8 @@ static void iommu_dma_free_iova(struct iommu_dma_cookie *cookie,
 		cookie->msi_iova -= size;
 	else if (cookie->fq_domain)	/* non-strict mode */
 		queue_iova(iovad, iova_pfn(iovad, iova),
-				size >> iova_shift(iovad), 0);
+				size >> iova_shift(iovad),
+				(unsigned long)freelist);
 	else
 		free_iova_fast(iovad, iova_pfn(iovad, iova),
 				size >> iova_shift(iovad));
@@ -474,7 +487,7 @@ static void __iommu_dma_unmap(struct device *dev, dma_addr_t dma_addr,
 
 	if (!cookie->fq_domain)
 		iommu_iotlb_sync(domain, &iotlb_gather);
-	iommu_dma_free_iova(cookie, dma_addr, size);
+	iommu_dma_free_iova(cookie, dma_addr, size, iotlb_gather.freelist);
 }
 
 static dma_addr_t __iommu_dma_map(struct device *dev, phys_addr_t phys,
@@ -496,7 +509,7 @@ static dma_addr_t __iommu_dma_map(struct device *dev, phys_addr_t phys,
 		return DMA_MAPPING_ERROR;
 
 	if (iommu_map_atomic(domain, iova, phys - iova_off, size, prot)) {
-		iommu_dma_free_iova(cookie, iova, size);
+		iommu_dma_free_iova(cookie, iova, size, NULL);
 		return DMA_MAPPING_ERROR;
 	}
 	return iova + iova_off;
@@ -649,7 +662,7 @@ static void *iommu_dma_alloc_remap(struct device *dev, size_t size,
 out_free_sg:
 	sg_free_table(&sgt);
 out_free_iova:
-	iommu_dma_free_iova(cookie, iova, size);
+	iommu_dma_free_iova(cookie, iova, size, NULL);
 out_free_pages:
 	__iommu_dma_free_pages(pages, count);
 	return NULL;
@@ -900,7 +913,7 @@ static int iommu_dma_map_sg(struct device *dev, struct scatterlist *sg,
 	return __finalise_sg(dev, sg, nents, iova);
 
 out_free_iova:
-	iommu_dma_free_iova(cookie, iova, iova_len);
+	iommu_dma_free_iova(cookie, iova, iova_len, NULL);
 out_restore_sg:
 	__invalidate_sg(sg, nents);
 	return 0;
@@ -1228,7 +1241,7 @@ static struct iommu_dma_msi_page *iommu_dma_get_msi_page(struct device *dev,
 	return msi_page;
 
 out_free_iova:
-	iommu_dma_free_iova(cookie, iova, size);
+	iommu_dma_free_iova(cookie, iova, size, NULL);
 out_free_page:
 	kfree(msi_page);
 	return NULL;
diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index 0233d2438c44..414b4321fb61 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -1243,17 +1243,17 @@ static struct page *dma_pte_clear_level(struct dmar_domain *domain, int level,
    pages can only be freed after the IOTLB flush has been done. */
 static struct page *domain_unmap(struct dmar_domain *domain,
 				 unsigned long start_pfn,
-				 unsigned long last_pfn)
+				 unsigned long last_pfn,
+				 struct page *freelist)
 {
-	struct page *freelist;
-
 	BUG_ON(!domain_pfn_supported(domain, start_pfn));
 	BUG_ON(!domain_pfn_supported(domain, last_pfn));
 	BUG_ON(start_pfn > last_pfn);
 
 	/* we don't need lock here; nobody else touches the iova range */
 	freelist = dma_pte_clear_level(domain, agaw_to_level(domain->agaw),
-				       domain->pgd, 0, start_pfn, last_pfn, NULL);
+				       domain->pgd, 0, start_pfn, last_pfn,
+				       freelist);
 
 	/* free pgd */
 	if (start_pfn == 0 && last_pfn == DOMAIN_MAX_PFN(domain->gaw)) {
@@ -2011,7 +2011,8 @@ static void domain_exit(struct dmar_domain *domain)
 	if (domain->pgd) {
 		struct page *freelist;
 
-		freelist = domain_unmap(domain, 0, DOMAIN_MAX_PFN(domain->gaw));
+		freelist = domain_unmap(domain, 0,
+					DOMAIN_MAX_PFN(domain->gaw), NULL);
 		dma_free_pagelist(freelist);
 	}
 
@@ -3570,7 +3571,7 @@ static void intel_unmap(struct device *dev, dma_addr_t dev_addr, size_t size)
 	if (dev_is_pci(dev))
 		pdev = to_pci_dev(dev);
 
-	freelist = domain_unmap(domain, start_pfn, last_pfn);
+	freelist = domain_unmap(domain, start_pfn, last_pfn, NULL);
 	if (intel_iommu_strict || (pdev && pdev->untrusted) ||
 			!has_iova_flush_queue(&domain->iovad)) {
 		iommu_flush_iotlb_psi(iommu, domain, start_pfn,
@@ -4636,7 +4637,8 @@ static int intel_iommu_memory_notifier(struct notifier_block *nb,
 			struct page *freelist;
 
 			freelist = domain_unmap(si_domain,
-						start_vpfn, last_vpfn);
+						start_vpfn, last_vpfn,
+						NULL);
 
 			rcu_read_lock();
 			for_each_active_iommu(iommu, drhd)
@@ -5609,10 +5611,8 @@ static size_t intel_iommu_unmap(struct iommu_domain *domain,
 				struct iommu_iotlb_gather *gather)
 {
 	struct dmar_domain *dmar_domain = to_dmar_domain(domain);
-	struct page *freelist = NULL;
 	unsigned long start_pfn, last_pfn;
-	unsigned int npages;
-	int iommu_id, level = 0;
+	int level = 0;
 
 	/* Cope with horrid API which requires us to unmap more than the
 	   size argument if it happens to be a large-page mapping. */
@@ -5624,22 +5624,38 @@ static size_t intel_iommu_unmap(struct iommu_domain *domain,
 	start_pfn = iova >> VTD_PAGE_SHIFT;
 	last_pfn = (iova + size - 1) >> VTD_PAGE_SHIFT;
 
-	freelist = domain_unmap(dmar_domain, start_pfn, last_pfn);
-
-	npages = last_pfn - start_pfn + 1;
-
-	for_each_domain_iommu(iommu_id, dmar_domain)
-		iommu_flush_iotlb_psi(g_iommus[iommu_id], dmar_domain,
-				      start_pfn, npages, !freelist, 0);
-
-	dma_free_pagelist(freelist);
+	gather->freelist = domain_unmap(dmar_domain, start_pfn,
+					last_pfn, gather->freelist);
 
 	if (dmar_domain->max_addr == iova + size)
 		dmar_domain->max_addr = iova;
 
+	iommu_iotlb_gather_add_page(domain, gather, iova, size);
+
 	return size;
 }
 
+static void intel_iommu_tlb_sync(struct iommu_domain *domain,
+				 struct iommu_iotlb_gather *gather)
+{
+	struct dmar_domain *dmar_domain = to_dmar_domain(domain);
+	unsigned long iova_pfn = IOVA_PFN(gather->start);
+	size_t size = gather->end - gather->start;
+	unsigned long start_pfn, last_pfn;
+	unsigned long nrpages;
+	int iommu_id;
+
+	nrpages = aligned_nrpages(gather->start, size);
+	start_pfn = mm_to_dma_pfn(iova_pfn);
+	last_pfn = start_pfn + nrpages - 1;
+
+	for_each_domain_iommu(iommu_id, dmar_domain)
+		iommu_flush_iotlb_psi(g_iommus[iommu_id], dmar_domain,
+				      start_pfn, nrpages, !gather->freelist, 0);
+
+	dma_free_pagelist(gather->freelist);
+}
+
 static phys_addr_t intel_iommu_iova_to_phys(struct iommu_domain *domain,
 					    dma_addr_t iova)
 {
@@ -6099,6 +6115,7 @@ const struct iommu_ops intel_iommu_ops = {
 	.aux_get_pasid		= intel_iommu_aux_get_pasid,
 	.map			= intel_iommu_map,
 	.unmap			= intel_iommu_unmap,
+	.iotlb_sync		= intel_iommu_tlb_sync,
 	.iova_to_phys		= intel_iommu_iova_to_phys,
 	.probe_device		= intel_iommu_probe_device,
 	.probe_finalize		= intel_iommu_probe_finalize,
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index b95a6f8db6ff..e56bae327e35 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -180,6 +180,7 @@ struct iommu_iotlb_gather {
 	unsigned long		start;
 	unsigned long		end;
 	size_t			pgsize;
+	struct page		*freelist;
 };
 
 /**
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
