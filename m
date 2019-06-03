Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FCF3260B
	for <lists.iommu@lfdr.de>; Mon,  3 Jun 2019 03:24:21 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1A9CEC3F;
	Mon,  3 Jun 2019 01:24:10 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 57638BB3
	for <iommu@lists.linux-foundation.org>;
	Mon,  3 Jun 2019 01:24:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 9622083A
	for <iommu@lists.linux-foundation.org>;
	Mon,  3 Jun 2019 01:24:07 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Jun 2019 18:24:07 -0700
X-ExtLoop1: 1
Received: from allen-box.sh.intel.com ([10.239.159.136])
	by FMSMGA003.fm.intel.com with ESMTP; 02 Jun 2019 18:24:03 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: David Woodhouse <dwmw2@infradead.org>, Joerg Roedel <joro@8bytes.org>,
	Bjorn Helgaas <bhelgaas@google.com>, Christoph Hellwig <hch@lst.de>
Subject: [PATCH v4 8/9] iommu/vt-d: Code refactoring for bounce map and unmap
Date: Mon,  3 Jun 2019 09:16:19 +0800
Message-Id: <20190603011620.31999-9-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190603011620.31999-1-baolu.lu@linux.intel.com>
References: <20190603011620.31999-1-baolu.lu@linux.intel.com>
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Juergen Gross <jgross@suse.com>, kevin.tian@intel.com,
	Stefano Stabellini <sstabellini@kernel.org>, ashok.raj@intel.com,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	alan.cox@intel.com, Jonathan Corbet <corbet@lwn.net>,
	Robin Murphy <robin.murphy@arm.com>, Steven Rostedt <rostedt@goodmis.org>,
	linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
	pengfei.xu@intel.com, Ingo Molnar <mingo@redhat.com>,
	jacob.jun.pan@intel.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	mika.westerberg@linux.intel.com
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

In order to making it ready for calling iommu_bounce_map() and
iommu_bounce_unmap() in __intel_map_single() and intel_unmap(),
we need to do some code refactoring.

Cc: Ashok Raj <ashok.raj@intel.com>
Cc: Jacob Pan <jacob.jun.pan@linux.intel.com>
Cc: Kevin Tian <kevin.tian@intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/iommu/intel-iommu.c | 89 ++++++++++++++++++++-----------------
 1 file changed, 49 insertions(+), 40 deletions(-)

diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
index 41439647f75d..2f54734d1c43 100644
--- a/drivers/iommu/intel-iommu.c
+++ b/drivers/iommu/intel-iommu.c
@@ -3510,16 +3510,19 @@ static bool iommu_need_mapping(struct device *dev)
 	return true;
 }
 
-static dma_addr_t __intel_map_single(struct device *dev, phys_addr_t paddr,
-				     size_t size, int dir, u64 dma_mask)
+static dma_addr_t
+__intel_map_single(struct device *dev, phys_addr_t paddr, size_t size,
+		   enum dma_data_direction dir, unsigned long attrs,
+		   u64 dma_mask)
 {
+	unsigned long paddr_pfn = paddr >> PAGE_SHIFT;
 	struct dmar_domain *domain;
+	struct intel_iommu *iommu;
 	phys_addr_t start_paddr;
 	unsigned long iova_pfn;
+	unsigned long nrpages;
 	int prot = 0;
 	int ret;
-	struct intel_iommu *iommu;
-	unsigned long paddr_pfn = paddr >> PAGE_SHIFT;
 
 	BUG_ON(dir == DMA_NONE);
 
@@ -3528,9 +3531,9 @@ static dma_addr_t __intel_map_single(struct device *dev, phys_addr_t paddr,
 		return DMA_MAPPING_ERROR;
 
 	iommu = domain_get_iommu(domain);
-	size = aligned_nrpages(paddr, size);
-
-	iova_pfn = intel_alloc_iova(dev, domain, dma_to_mm_pfn(size), dma_mask);
+	nrpages = aligned_nrpages(paddr, size);
+	iova_pfn = intel_alloc_iova(dev, domain,
+				    dma_to_mm_pfn(nrpages), dma_mask);
 	if (!iova_pfn)
 		goto error;
 
@@ -3550,7 +3553,7 @@ static dma_addr_t __intel_map_single(struct device *dev, phys_addr_t paddr,
 	 * is not a big problem
 	 */
 	ret = domain_pfn_mapping(domain, mm_to_dma_pfn(iova_pfn),
-				 mm_to_dma_pfn(paddr_pfn), size, prot);
+				 mm_to_dma_pfn(paddr_pfn), nrpages, prot);
 	if (ret)
 		goto error;
 
@@ -3560,7 +3563,7 @@ static dma_addr_t __intel_map_single(struct device *dev, phys_addr_t paddr,
 
 error:
 	if (iova_pfn)
-		free_iova_fast(&domain->iovad, iova_pfn, dma_to_mm_pfn(size));
+		free_iova_fast(&domain->iovad, iova_pfn, dma_to_mm_pfn(nrpages));
 	dev_err(dev, "Device request: %zx@%llx dir %d --- failed\n",
 		size, (unsigned long long)paddr, dir);
 	return DMA_MAPPING_ERROR;
@@ -3573,7 +3576,7 @@ static dma_addr_t intel_map_page(struct device *dev, struct page *page,
 {
 	if (iommu_need_mapping(dev))
 		return __intel_map_single(dev, page_to_phys(page) + offset,
-				size, dir, *dev->dma_mask);
+					  size, dir, attrs, *dev->dma_mask);
 	return dma_direct_map_page(dev, page, offset, size, dir, attrs);
 }
 
@@ -3582,38 +3585,53 @@ static dma_addr_t intel_map_resource(struct device *dev, phys_addr_t phys_addr,
 				     unsigned long attrs)
 {
 	if (iommu_need_mapping(dev))
-		return __intel_map_single(dev, phys_addr, size, dir,
-				*dev->dma_mask);
+		return __intel_map_single(dev, phys_addr,
+					  size, dir, attrs, *dev->dma_mask);
 	return dma_direct_map_resource(dev, phys_addr, size, dir, attrs);
 }
 
-static void intel_unmap(struct device *dev, dma_addr_t dev_addr, size_t size)
+static void intel_unmap(struct device *dev, dma_addr_t dev_addr, size_t size,
+			struct scatterlist *sglist, int nelems,
+			enum dma_data_direction dir, unsigned long attrs)
 {
-	struct dmar_domain *domain;
 	unsigned long start_pfn, last_pfn;
-	unsigned long nrpages;
-	unsigned long iova_pfn;
-	struct intel_iommu *iommu;
-	struct page *freelist;
+	struct page *freelist = NULL;
 	struct pci_dev *pdev = NULL;
+	struct dmar_domain *domain;
+	unsigned long nrpages = 0;
+	struct intel_iommu *iommu;
+	unsigned long iova_pfn;
 
 	domain = find_domain(dev);
 	BUG_ON(!domain);
 
 	iommu = domain_get_iommu(domain);
 
-	iova_pfn = IOVA_PFN(dev_addr);
+	if (sglist) {
+		struct scatterlist *sg;
+		int i;
 
-	nrpages = aligned_nrpages(dev_addr, size);
-	start_pfn = mm_to_dma_pfn(iova_pfn);
-	last_pfn = start_pfn + nrpages - 1;
+		dev_addr = sg_dma_address(sglist) & PAGE_MASK;
+		iova_pfn = IOVA_PFN(dev_addr);
+		for_each_sg(sglist, sg, nelems, i) {
+			nrpages += aligned_nrpages(sg_dma_address(sg),
+			sg_dma_len(sg));
+		}
+		start_pfn = mm_to_dma_pfn(iova_pfn);
+		last_pfn = start_pfn + nrpages - 1;
 
-	if (dev_is_pci(dev))
-		pdev = to_pci_dev(dev);
+		freelist = domain_unmap(domain, start_pfn, last_pfn);
+	} else {
+		iova_pfn = IOVA_PFN(dev_addr);
+		nrpages = aligned_nrpages(dev_addr, size);
+		start_pfn = mm_to_dma_pfn(iova_pfn);
+		last_pfn = start_pfn + nrpages - 1;
 
-	dev_dbg(dev, "Device unmapping: pfn %lx-%lx\n", start_pfn, last_pfn);
+		freelist = domain_unmap(domain, start_pfn, last_pfn);
+	}
 
-	freelist = domain_unmap(domain, start_pfn, last_pfn);
+	if (dev_is_pci(dev))
+		pdev = to_pci_dev(dev);
 
 	if (intel_iommu_strict || (pdev && pdev->untrusted)) {
 		iommu_flush_iotlb_psi(iommu, domain, start_pfn,
@@ -3636,7 +3654,7 @@ static void intel_unmap_page(struct device *dev, dma_addr_t dev_addr,
 			     unsigned long attrs)
 {
 	if (iommu_need_mapping(dev))
-		intel_unmap(dev, dev_addr, size);
+		intel_unmap(dev, dev_addr, size, NULL, 0, dir, attrs);
 	else
 		dma_direct_unmap_page(dev, dev_addr, size, dir, attrs);
 }
@@ -3645,7 +3663,7 @@ static void intel_unmap_resource(struct device *dev, dma_addr_t dev_addr,
 		size_t size, enum dma_data_direction dir, unsigned long attrs)
 {
 	if (iommu_need_mapping(dev))
-		intel_unmap(dev, dev_addr, size);
+		intel_unmap(dev, dev_addr, size, NULL, 0, dir, attrs);
 }
 
 static void *intel_alloc_coherent(struct device *dev, size_t size,
@@ -3675,7 +3693,7 @@ static void *intel_alloc_coherent(struct device *dev, size_t size,
 	memset(page_address(page), 0, size);
 
 	*dma_handle = __intel_map_single(dev, page_to_phys(page), size,
-					 DMA_BIDIRECTIONAL,
+					 DMA_BIDIRECTIONAL, attrs,
 					 dev->coherent_dma_mask);
 	if (*dma_handle != DMA_MAPPING_ERROR)
 		return page_address(page);
@@ -3697,7 +3715,7 @@ static void intel_free_coherent(struct device *dev, size_t size, void *vaddr,
 	size = PAGE_ALIGN(size);
 	order = get_order(size);
 
-	intel_unmap(dev, dma_handle, size);
+	intel_unmap(dev, dma_handle, size, NULL, 0, 0, attrs);
 	if (!dma_release_from_contiguous(dev, page, size >> PAGE_SHIFT))
 		__free_pages(page, order);
 }
@@ -3706,19 +3724,10 @@ static void intel_unmap_sg(struct device *dev, struct scatterlist *sglist,
 			   int nelems, enum dma_data_direction dir,
 			   unsigned long attrs)
 {
-	dma_addr_t startaddr = sg_dma_address(sglist) & PAGE_MASK;
-	unsigned long nrpages = 0;
-	struct scatterlist *sg;
-	int i;
-
 	if (!iommu_need_mapping(dev))
 		return dma_direct_unmap_sg(dev, sglist, nelems, dir, attrs);
 
-	for_each_sg(sglist, sg, nelems, i) {
-		nrpages += aligned_nrpages(sg_dma_address(sg), sg_dma_len(sg));
-	}
-
-	intel_unmap(dev, startaddr, nrpages << VTD_PAGE_SHIFT);
+	intel_unmap(dev, 0, 0, sglist, nelems, dir, attrs);
 }
 
 static int intel_map_sg(struct device *dev, struct scatterlist *sglist, int nelems,
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
