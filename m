Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D099743D9
	for <lists.iommu@lfdr.de>; Thu, 25 Jul 2019 05:19:03 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5CA4C171C;
	Thu, 25 Jul 2019 03:18:39 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id BCDA916FB
	for <iommu@lists.linux-foundation.org>;
	Thu, 25 Jul 2019 03:18:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 0786C701
	for <iommu@lists.linux-foundation.org>;
	Thu, 25 Jul 2019 03:18:36 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Jul 2019 20:18:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,305,1559545200"; d="scan'208";a="189228365"
Received: from allen-box.sh.intel.com ([10.239.159.136])
	by fmsmga001.fm.intel.com with ESMTP; 24 Jul 2019 20:18:33 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: David Woodhouse <dwmw2@infradead.org>, Joerg Roedel <joro@8bytes.org>,
	Bjorn Helgaas <bhelgaas@google.com>, Christoph Hellwig <hch@lst.de>
Subject: [PATCH v5 10/10] iommu/vt-d: Use bounce buffer for untrusted devices
Date: Thu, 25 Jul 2019 11:17:17 +0800
Message-Id: <20190725031717.32317-11-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190725031717.32317-1-baolu.lu@linux.intel.com>
References: <20190725031717.32317-1-baolu.lu@linux.intel.com>
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
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

The Intel VT-d hardware uses paging for DMA remapping.
The minimum mapped window is a page size. The device
drivers may map buffers not filling the whole IOMMU
window. This allows the device to access to possibly
unrelated memory and a malicious device could exploit
this to perform DMA attacks. To address this, the
Intel IOMMU driver will use bounce pages for those
buffers which don't fill whole IOMMU pages.

Cc: Ashok Raj <ashok.raj@intel.com>
Cc: Jacob Pan <jacob.jun.pan@linux.intel.com>
Cc: Kevin Tian <kevin.tian@intel.com>
Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
Tested-by: Xu Pengfei <pengfei.xu@intel.com>
Tested-by: Mika Westerberg <mika.westerberg@intel.com>
---
 drivers/iommu/Kconfig       |   2 +
 drivers/iommu/intel-iommu.c | 188 +++++++++++++++++++++++++++++++++++-
 2 files changed, 188 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index d7f2e09cbcf2..3baa418edc16 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -195,6 +195,8 @@ config INTEL_IOMMU
 	select IOMMU_IOVA
 	select NEED_DMA_MAP_STATE
 	select DMAR_TABLE
+	select SWIOTLB
+	select IOMMU_BOUNCE_PAGE
 	help
 	  DMA remapping (DMAR) devices support enables independent address
 	  translations for Direct Memory Access (DMA) from devices.
diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
index 4185406b0368..2cdec279ccac 100644
--- a/drivers/iommu/intel-iommu.c
+++ b/drivers/iommu/intel-iommu.c
@@ -44,6 +44,7 @@
 #include <asm/irq_remapping.h>
 #include <asm/cacheflush.h>
 #include <asm/iommu.h>
+#include <trace/events/intel_iommu.h>
 
 #include "irq_remapping.h"
 #include "intel-pasid.h"
@@ -3672,6 +3673,183 @@ static const struct dma_map_ops intel_dma_ops = {
 	.dma_supported = dma_direct_supported,
 };
 
+static dma_addr_t
+bounce_map_single(struct device *dev, phys_addr_t paddr, size_t size,
+		  enum dma_data_direction dir, unsigned long attrs,
+		  u64 dma_mask)
+{
+	struct dmar_domain *domain;
+	struct intel_iommu *iommu;
+	unsigned long iova_pfn;
+	unsigned long nrpages;
+	dma_addr_t ret_addr;
+
+	domain = find_domain(dev);
+	if (WARN_ON(dir == DMA_NONE || !domain))
+		return DMA_MAPPING_ERROR;
+
+	iommu = domain_get_iommu(domain);
+	nrpages = aligned_nrpages(0, size);
+	iova_pfn = intel_alloc_iova(dev, domain,
+				    dma_to_mm_pfn(nrpages), dma_mask);
+	if (!iova_pfn)
+		return DMA_MAPPING_ERROR;
+
+	ret_addr = iommu_bounce_map(dev, iova_pfn << PAGE_SHIFT,
+				    paddr, size, dir, attrs);
+	if (ret_addr == DMA_MAPPING_ERROR) {
+		free_iova_fast(&domain->iovad, iova_pfn, dma_to_mm_pfn(nrpages));
+		return DMA_MAPPING_ERROR;
+	}
+
+	trace_bounce_map_single(dev, iova_pfn << PAGE_SHIFT, paddr, size);
+
+	return ret_addr;
+}
+
+static void
+bounce_unmap_single(struct device *dev, dma_addr_t dev_addr, size_t size,
+		    enum dma_data_direction dir, unsigned long attrs)
+{
+	struct dmar_domain *domain;
+	struct intel_iommu *iommu;
+	unsigned long iova_pfn;
+	unsigned long nrpages;
+
+	domain = find_domain(dev);
+	if (WARN_ON(!domain))
+		return;
+
+	iommu_bounce_unmap(dev, dev_addr, size, dir, attrs);
+	trace_bounce_unmap_single(dev, dev_addr, size);
+
+	iommu = domain_get_iommu(domain);
+	iova_pfn = IOVA_PFN(dev_addr);
+	nrpages = aligned_nrpages(0, size);
+
+	iommu_flush_iotlb_psi(iommu, domain,
+			      mm_to_dma_pfn(iova_pfn), nrpages, 0, 0);
+	free_iova_fast(&domain->iovad, iova_pfn, dma_to_mm_pfn(nrpages));
+}
+
+static dma_addr_t
+bounce_map_page(struct device *dev, struct page *page, unsigned long offset,
+		size_t size, enum dma_data_direction dir, unsigned long attrs)
+{
+	return bounce_map_single(dev, page_to_phys(page) + offset,
+				 size, dir, attrs, *dev->dma_mask);
+}
+
+static dma_addr_t
+bounce_map_resource(struct device *dev, phys_addr_t phys_addr, size_t size,
+		    enum dma_data_direction dir, unsigned long attrs)
+{
+	return bounce_map_single(dev, phys_addr, size,
+				 dir, attrs, *dev->dma_mask);
+}
+
+static void
+bounce_unmap_page(struct device *dev, dma_addr_t dev_addr, size_t size,
+		  enum dma_data_direction dir, unsigned long attrs)
+{
+	bounce_unmap_single(dev, dev_addr, size, dir, attrs);
+}
+
+static void
+bounce_unmap_resource(struct device *dev, dma_addr_t dev_addr, size_t size,
+		      enum dma_data_direction dir, unsigned long attrs)
+{
+	bounce_unmap_single(dev, dev_addr, size, dir, attrs);
+}
+
+static void
+bounce_unmap_sg(struct device *dev, struct scatterlist *sglist, int nelems,
+		enum dma_data_direction dir, unsigned long attrs)
+{
+	struct scatterlist *sg;
+	int i;
+
+	for_each_sg(sglist, sg, nelems, i)
+		bounce_unmap_page(dev, sg->dma_address,
+				  sg_dma_len(sg), dir, attrs);
+}
+
+static int
+bounce_map_sg(struct device *dev, struct scatterlist *sglist, int nelems,
+	      enum dma_data_direction dir, unsigned long attrs)
+{
+	int i;
+	struct scatterlist *sg;
+
+	for_each_sg(sglist, sg, nelems, i) {
+		sg->dma_address = bounce_map_page(dev, sg_page(sg),
+				sg->offset, sg->length, dir, attrs);
+		if (sg->dma_address == DMA_MAPPING_ERROR)
+			goto out_unmap;
+		sg_dma_len(sg) = sg->length;
+	}
+
+	return nelems;
+
+out_unmap:
+	bounce_unmap_sg(dev, sglist, i, dir, attrs | DMA_ATTR_SKIP_CPU_SYNC);
+	return 0;
+}
+
+static void
+bounce_sync_single_for_cpu(struct device *dev, dma_addr_t addr,
+			   size_t size, enum dma_data_direction dir)
+{
+	iommu_bounce_sync(dev, addr, size, dir, SYNC_FOR_CPU);
+}
+
+static void
+bounce_sync_single_for_device(struct device *dev, dma_addr_t addr,
+			      size_t size, enum dma_data_direction dir)
+{
+	iommu_bounce_sync(dev, addr, size, dir, SYNC_FOR_DEVICE);
+}
+
+static void
+bounce_sync_sg_for_cpu(struct device *dev, struct scatterlist *sglist,
+		       int nelems, enum dma_data_direction dir)
+{
+	struct scatterlist *sg;
+	int i;
+
+	for_each_sg(sglist, sg, nelems, i)
+		iommu_bounce_sync(dev, sg_dma_address(sg),
+				  sg_dma_len(sg), dir, SYNC_FOR_CPU);
+}
+
+static void
+bounce_sync_sg_for_device(struct device *dev, struct scatterlist *sglist,
+			  int nelems, enum dma_data_direction dir)
+{
+	struct scatterlist *sg;
+	int i;
+
+	for_each_sg(sglist, sg, nelems, i)
+		iommu_bounce_sync(dev, sg_dma_address(sg),
+				  sg_dma_len(sg), dir, SYNC_FOR_DEVICE);
+}
+
+static const struct dma_map_ops bounce_dma_ops = {
+	.alloc			= intel_alloc_coherent,
+	.free			= intel_free_coherent,
+	.map_sg			= bounce_map_sg,
+	.unmap_sg		= bounce_unmap_sg,
+	.map_page		= bounce_map_page,
+	.unmap_page		= bounce_unmap_page,
+	.sync_single_for_cpu	= bounce_sync_single_for_cpu,
+	.sync_single_for_device	= bounce_sync_single_for_device,
+	.sync_sg_for_cpu	= bounce_sync_sg_for_cpu,
+	.sync_sg_for_device	= bounce_sync_sg_for_device,
+	.map_resource		= bounce_map_resource,
+	.unmap_resource		= bounce_unmap_resource,
+	.dma_supported		= dma_direct_supported,
+};
+
 static inline int iommu_domain_cache_init(void)
 {
 	int ret = 0;
@@ -5212,7 +5390,10 @@ static int intel_iommu_add_device(struct device *dev)
 					 "Device uses a private identity domain.\n");
 			}
 		} else {
-			set_dma_ops(dev, &intel_dma_ops);
+			if (device_needs_bounce(dev))
+				set_dma_ops(dev, &bounce_dma_ops);
+			else
+				set_dma_ops(dev, &intel_dma_ops);
 		}
 	} else {
 		if (device_def_domain_type(dev) == IOMMU_DOMAIN_DMA) {
@@ -5229,7 +5410,10 @@ static int intel_iommu_add_device(struct device *dev)
 					 "Device uses a private dma domain.\n");
 			}
 
-			set_dma_ops(dev, &intel_dma_ops);
+			if (device_needs_bounce(dev))
+				set_dma_ops(dev, &bounce_dma_ops);
+			else
+				set_dma_ops(dev, &intel_dma_ops);
 		}
 	}
 
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
