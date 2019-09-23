Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 73765BB3AE
	for <lists.iommu@lfdr.de>; Mon, 23 Sep 2019 14:27:37 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 9C60BCDF;
	Mon, 23 Sep 2019 12:27:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 76591CC9
	for <iommu@lists.linux-foundation.org>;
	Mon, 23 Sep 2019 12:27:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id D72048A3
	for <iommu@lists.linux-foundation.org>;
	Mon, 23 Sep 2019 12:27:26 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Sep 2019 05:27:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,539,1559545200"; d="scan'208";a="203116676"
Received: from allen-box.sh.intel.com ([10.239.159.136])
	by fmsmga001.fm.intel.com with ESMTP; 23 Sep 2019 05:27:24 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>, David Woodhouse <dwmw2@infradead.org>,
	Alex Williamson <alex.williamson@redhat.com>
Subject: [RFC PATCH 3/4] iommu/vt-d: Map/unmap domain with mmmap/mmunmap
Date: Mon, 23 Sep 2019 20:24:53 +0800
Message-Id: <20190923122454.9888-4-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190923122454.9888-1-baolu.lu@linux.intel.com>
References: <20190923122454.9888-1-baolu.lu@linux.intel.com>
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kevin.tian@intel.com, Yi Sun <yi.y.sun@linux.intel.com>,
	ashok.raj@intel.com, kvm@vger.kernel.org,
	sanjay.k.kumar@intel.com, iommu@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org, yi.y.sun@intel.com
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

If a dmar domain has DOMAIN_FLAG_FIRST_LEVEL_TRANS bit set
in its flags, IOMMU will use the first level page table for
translation. Hence, we need to map or unmap addresses in the
first level page table.

Cc: Ashok Raj <ashok.raj@intel.com>
Cc: Jacob Pan <jacob.jun.pan@linux.intel.com>
Cc: Kevin Tian <kevin.tian@intel.com>
Cc: Liu Yi L <yi.l.liu@intel.com>
Cc: Yi Sun <yi.y.sun@linux.intel.com>
Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/iommu/intel-iommu.c | 94 ++++++++++++++++++++++++++++++++-----
 1 file changed, 82 insertions(+), 12 deletions(-)

diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
index 9cfe8098d993..103480016010 100644
--- a/drivers/iommu/intel-iommu.c
+++ b/drivers/iommu/intel-iommu.c
@@ -168,6 +168,11 @@ static inline unsigned long virt_to_dma_pfn(void *p)
 	return page_to_dma_pfn(virt_to_page(p));
 }
 
+static inline unsigned long dma_pfn_to_addr(unsigned long pfn)
+{
+	return pfn << VTD_PAGE_SHIFT;
+}
+
 /* global iommu list, set NULL for ignored DMAR units */
 static struct intel_iommu **g_iommus;
 
@@ -307,6 +312,9 @@ static int hw_pass_through = 1;
  */
 #define DOMAIN_FLAG_LOSE_CHILDREN		BIT(1)
 
+/* Domain uses first level translation for DMA remapping. */
+#define DOMAIN_FLAG_FIRST_LEVEL_TRANS		BIT(2)
+
 #define for_each_domain_iommu(idx, domain)			\
 	for (idx = 0; idx < g_num_of_iommus; idx++)		\
 		if (domain->iommu_refcnt[idx])
@@ -552,6 +560,11 @@ static inline int domain_type_is_si(struct dmar_domain *domain)
 	return domain->flags & DOMAIN_FLAG_STATIC_IDENTITY;
 }
 
+static inline int domain_type_is_flt(struct dmar_domain *domain)
+{
+	return domain->flags & DOMAIN_FLAG_FIRST_LEVEL_TRANS;
+}
+
 static inline int domain_pfn_supported(struct dmar_domain *domain,
 				       unsigned long pfn)
 {
@@ -1147,8 +1160,15 @@ static struct page *domain_unmap(struct dmar_domain *domain,
 	BUG_ON(start_pfn > last_pfn);
 
 	/* we don't need lock here; nobody else touches the iova range */
-	freelist = dma_pte_clear_level(domain, agaw_to_level(domain->agaw),
-				       domain->pgd, 0, start_pfn, last_pfn, NULL);
+	if (domain_type_is_flt(domain))
+		freelist = intel_mmunmap_range(domain,
+					       dma_pfn_to_addr(start_pfn),
+					       dma_pfn_to_addr(last_pfn + 1));
+	else
+		freelist = dma_pte_clear_level(domain,
+					       agaw_to_level(domain->agaw),
+					       domain->pgd, 0, start_pfn,
+					       last_pfn, NULL);
 
 	/* free pgd */
 	if (start_pfn == 0 && last_pfn == DOMAIN_MAX_PFN(domain->gaw)) {
@@ -2213,9 +2233,10 @@ static inline int hardware_largepage_caps(struct dmar_domain *domain,
 	return level;
 }
 
-static int __domain_mapping(struct dmar_domain *domain, unsigned long iov_pfn,
-			    struct scatterlist *sg, unsigned long phys_pfn,
-			    unsigned long nr_pages, int prot)
+static int
+__domain_mapping_dma(struct dmar_domain *domain, unsigned long iov_pfn,
+		     struct scatterlist *sg, unsigned long phys_pfn,
+		     unsigned long nr_pages, int prot)
 {
 	struct dma_pte *first_pte = NULL, *pte = NULL;
 	phys_addr_t uninitialized_var(pteval);
@@ -2223,13 +2244,6 @@ static int __domain_mapping(struct dmar_domain *domain, unsigned long iov_pfn,
 	unsigned int largepage_lvl = 0;
 	unsigned long lvl_pages = 0;
 
-	BUG_ON(!domain_pfn_supported(domain, iov_pfn + nr_pages - 1));
-
-	if ((prot & (DMA_PTE_READ|DMA_PTE_WRITE)) == 0)
-		return -EINVAL;
-
-	prot &= DMA_PTE_READ | DMA_PTE_WRITE | DMA_PTE_SNP;
-
 	if (!sg) {
 		sg_res = nr_pages;
 		pteval = ((phys_addr_t)phys_pfn << VTD_PAGE_SHIFT) | prot;
@@ -2328,6 +2342,62 @@ static int __domain_mapping(struct dmar_domain *domain, unsigned long iov_pfn,
 	return 0;
 }
 
+static int
+__domain_mapping_mm(struct dmar_domain *domain, unsigned long iov_pfn,
+		    struct scatterlist *sg, unsigned long phys_pfn,
+		    unsigned long nr_pages, int prot)
+{
+	int ret = 0;
+
+	if (!sg)
+		return intel_mmmap_range(domain, dma_pfn_to_addr(iov_pfn),
+					 dma_pfn_to_addr(iov_pfn + nr_pages),
+					 dma_pfn_to_addr(phys_pfn), prot);
+
+	while (nr_pages > 0) {
+		unsigned long sg_pages, phys;
+		unsigned long pgoff = sg->offset & ~PAGE_MASK;
+
+		sg_pages = aligned_nrpages(sg->offset, sg->length);
+		phys = sg_phys(sg) - pgoff;
+
+		ret = intel_mmmap_range(domain, dma_pfn_to_addr(iov_pfn),
+					dma_pfn_to_addr(iov_pfn + sg_pages),
+					phys, prot);
+		if (ret)
+			break;
+
+		sg->dma_address = ((dma_addr_t)dma_pfn_to_addr(iov_pfn)) + pgoff;
+		sg->dma_length = sg->length;
+
+		nr_pages -= sg_pages;
+		iov_pfn += sg_pages;
+		sg = sg_next(sg);
+	}
+
+	return ret;
+}
+
+static int
+__domain_mapping(struct dmar_domain *domain, unsigned long iov_pfn,
+		 struct scatterlist *sg, unsigned long phys_pfn,
+		 unsigned long nr_pages, int prot)
+{
+	BUG_ON(!domain_pfn_supported(domain, iov_pfn + nr_pages - 1));
+
+	if ((prot & (DMA_PTE_READ|DMA_PTE_WRITE)) == 0)
+		return -EINVAL;
+
+	prot &= DMA_PTE_READ | DMA_PTE_WRITE | DMA_PTE_SNP;
+
+	if (domain_type_is_flt(domain))
+		return __domain_mapping_mm(domain, iov_pfn, sg,
+					   phys_pfn, nr_pages, prot);
+	else
+		return __domain_mapping_dma(domain, iov_pfn, sg,
+					    phys_pfn, nr_pages, prot);
+}
+
 static int domain_mapping(struct dmar_domain *domain, unsigned long iov_pfn,
 			  struct scatterlist *sg, unsigned long phys_pfn,
 			  unsigned long nr_pages, int prot)
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
