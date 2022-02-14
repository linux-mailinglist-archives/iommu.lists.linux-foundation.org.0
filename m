Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B4C4B3F1C
	for <lists.iommu@lfdr.de>; Mon, 14 Feb 2022 02:58:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 047B360BF8;
	Mon, 14 Feb 2022 01:58:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XoJFSHrz3mSB; Mon, 14 Feb 2022 01:58:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id AD72D60B1F;
	Mon, 14 Feb 2022 01:58:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 858AFC000B;
	Mon, 14 Feb 2022 01:58:17 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6CC19C000B
 for <iommu@lists.linux-foundation.org>; Mon, 14 Feb 2022 01:58:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 44579400C7
 for <iommu@lists.linux-foundation.org>; Mon, 14 Feb 2022 01:58:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=intel.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j7XqNy8IX2VX for <iommu@lists.linux-foundation.org>;
 Mon, 14 Feb 2022 01:58:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4E836401E1
 for <iommu@lists.linux-foundation.org>; Mon, 14 Feb 2022 01:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644803893; x=1676339893;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0CZE7+YTD7fnZhoJBP0Cd+nmJ2h58KJf+22966WBBI8=;
 b=OVKYMPquO6Rl6Duawy6I4sg4cXPMFPcZ1U+1j9OIcHHeGjjigN8vqqWE
 dKPZW9gpiTUfNShMoMGteaQdycGNpxta5OMNYIJW1TtNKObvpHNkSOKki
 X09tLZPnXhUjH2RnoUFP1avLGqltVFHkFXSrGb5I8vwztF2YfJe+T/2T7
 WVgBj2xviIwMilgfKA4yn9Q8MhzNTKdhQe45DrF3f6CHs6h40Dg5gLHWc
 cuQalnAXkUMPeMTH7rRB3SuyHK1Lh+8gmjEibUNRHeu7VPq9wLqxSdLbL
 ljwlUmf04vTEmhlnK8yZZXrt9yVP14d+Bi7QNAxN60+VoZIveN05GqDHN w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10257"; a="249938548"
X-IronPort-AV: E=Sophos;i="5.88,366,1635231600"; d="scan'208";a="249938548"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2022 17:58:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,366,1635231600"; d="scan'208";a="680137474"
Received: from allen-box.sh.intel.com ([10.239.159.118])
 by fmsmga001.fm.intel.com with ESMTP; 13 Feb 2022 17:58:08 -0800
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Christoph Hellwig <hch@infradead.org>, Ben Skeggs <bskeggs@redhat.com>,
 Kevin Tian <kevin.tian@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v3 10/10] iommu: Split struct iommu_ops
Date: Mon, 14 Feb 2022 09:55:38 +0800
Message-Id: <20220214015538.2828933-11-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220214015538.2828933-1-baolu.lu@linux.intel.com>
References: <20220214015538.2828933-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jacob jun Pan <jacob.jun.pan@intel.com>, Daniel Vetter <daniel@ffwll.ch>
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

Move the domain specific operations out of struct iommu_ops into a new
structure that only has domain specific operations. This solves the
problem of needing to know if the method vector for a given operation
needs to be retrieved from the device or the domain. Logically the domain
ops are the ones that make sense for external subsystems and endpoint
drivers to use, while device ops, with the sole exception of domain_alloc,
are IOMMU API internals.

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
---
 include/linux/iommu.h                       | 91 ++++++++++++---------
 drivers/iommu/amd/iommu.c                   | 20 +++--
 drivers/iommu/apple-dart.c                  | 20 +++--
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 18 ++--
 drivers/iommu/arm/arm-smmu/arm-smmu.c       | 20 +++--
 drivers/iommu/arm/arm-smmu/qcom_iommu.c     | 18 ++--
 drivers/iommu/exynos-iommu.c                | 14 ++--
 drivers/iommu/fsl_pamu_domain.c             | 10 ++-
 drivers/iommu/intel/iommu.c                 | 20 +++--
 drivers/iommu/iommu.c                       | 19 +++--
 drivers/iommu/ipmmu-vmsa.c                  | 18 ++--
 drivers/iommu/msm_iommu.c                   | 30 +++----
 drivers/iommu/mtk_iommu.c                   | 20 +++--
 drivers/iommu/mtk_iommu_v1.c                | 14 ++--
 drivers/iommu/omap-iommu.c                  | 14 ++--
 drivers/iommu/rockchip-iommu.c              | 14 ++--
 drivers/iommu/s390-iommu.c                  | 14 ++--
 drivers/iommu/sprd-iommu.c                  | 18 ++--
 drivers/iommu/sun50i-iommu.c                | 18 ++--
 drivers/iommu/tegra-gart.c                  | 18 ++--
 drivers/iommu/tegra-smmu.c                  | 14 ++--
 drivers/iommu/virtio-iommu.c                | 14 ++--
 22 files changed, 256 insertions(+), 200 deletions(-)

diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 47ca7eca5d7b..d70cc20b5948 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -37,6 +37,7 @@ struct iommu_group;
 struct bus_type;
 struct device;
 struct iommu_domain;
+struct iommu_domain_ops;
 struct notifier_block;
 struct iommu_sva;
 struct iommu_fault_event;
@@ -88,7 +89,7 @@ struct iommu_domain_geometry {
 
 struct iommu_domain {
 	unsigned type;
-	const struct iommu_ops *ops;
+	const struct iommu_domain_ops *ops;
 	unsigned long pgsize_bitmap;	/* Bitmap of page sizes in use */
 	iommu_fault_handler_t handler;
 	void *handler_token;
@@ -192,26 +193,11 @@ struct iommu_iotlb_gather {
  * struct iommu_ops - iommu ops and capabilities
  * @capable: check capability
  * @domain_alloc: allocate iommu domain
- * @domain_free: free iommu domain
- * @attach_dev: attach device to an iommu domain
- * @detach_dev: detach device from an iommu domain
- * @map: map a physically contiguous memory region to an iommu domain
- * @map_pages: map a physically contiguous set of pages of the same size to
- *             an iommu domain.
- * @unmap: unmap a physically contiguous memory region from an iommu domain
- * @unmap_pages: unmap a number of pages of the same size from an iommu domain
- * @flush_iotlb_all: Synchronously flush all hardware TLBs for this domain
- * @iotlb_sync_map: Sync mappings created recently using @map to the hardware
- * @iotlb_sync: Flush all queued ranges from the hardware TLBs and empty flush
- *            queue
- * @iova_to_phys: translate iova to physical address
  * @probe_device: Add device to iommu driver handling
  * @release_device: Remove device from iommu driver handling
  * @probe_finalize: Do final setup work after the device is added to an IOMMU
  *                  group and attached to the groups domain
  * @device_group: find iommu group for a particular device
- * @enable_nesting: Enable nesting
- * @set_pgtable_quirks: Set io page table quirks (IO_PGTABLE_QUIRK_*)
  * @get_resv_regions: Request list of reserved regions for a device
  * @put_resv_regions: Free list of reserved regions for a device
  * @of_xlate: add OF master IDs to iommu grouping
@@ -228,6 +214,7 @@ struct iommu_iotlb_gather {
  *		- IOMMU_DOMAIN_IDENTITY: must use an identity domain
  *		- IOMMU_DOMAIN_DMA: must use a dma domain
  *		- 0: use the default setting
+ * @default_domain_ops: the default ops for domains
  * @pgsize_bitmap: bitmap of all possible supported page sizes
  * @owner: Driver module providing these ops
  */
@@ -236,33 +223,11 @@ struct iommu_ops {
 
 	/* Domain allocation and freeing by the iommu driver */
 	struct iommu_domain *(*domain_alloc)(unsigned iommu_domain_type);
-	void (*domain_free)(struct iommu_domain *);
 
-	int (*attach_dev)(struct iommu_domain *domain, struct device *dev);
-	void (*detach_dev)(struct iommu_domain *domain, struct device *dev);
-	int (*map)(struct iommu_domain *domain, unsigned long iova,
-		   phys_addr_t paddr, size_t size, int prot, gfp_t gfp);
-	int (*map_pages)(struct iommu_domain *domain, unsigned long iova,
-			 phys_addr_t paddr, size_t pgsize, size_t pgcount,
-			 int prot, gfp_t gfp, size_t *mapped);
-	size_t (*unmap)(struct iommu_domain *domain, unsigned long iova,
-		     size_t size, struct iommu_iotlb_gather *iotlb_gather);
-	size_t (*unmap_pages)(struct iommu_domain *domain, unsigned long iova,
-			      size_t pgsize, size_t pgcount,
-			      struct iommu_iotlb_gather *iotlb_gather);
-	void (*flush_iotlb_all)(struct iommu_domain *domain);
-	void (*iotlb_sync_map)(struct iommu_domain *domain, unsigned long iova,
-			       size_t size);
-	void (*iotlb_sync)(struct iommu_domain *domain,
-			   struct iommu_iotlb_gather *iotlb_gather);
-	phys_addr_t (*iova_to_phys)(struct iommu_domain *domain, dma_addr_t iova);
 	struct iommu_device *(*probe_device)(struct device *dev);
 	void (*release_device)(struct device *dev);
 	void (*probe_finalize)(struct device *dev);
 	struct iommu_group *(*device_group)(struct device *dev);
-	int (*enable_nesting)(struct iommu_domain *domain);
-	int (*set_pgtable_quirks)(struct iommu_domain *domain,
-				  unsigned long quirks);
 
 	/* Request/Free a list of reserved regions for a device */
 	void (*get_resv_regions)(struct device *dev, struct list_head *list);
@@ -288,10 +253,60 @@ struct iommu_ops {
 
 	int (*def_domain_type)(struct device *dev);
 
+	const struct iommu_domain_ops *default_domain_ops;
 	unsigned long pgsize_bitmap;
 	struct module *owner;
 };
 
+/**
+ * struct iommu_domain_ops - domain specific operations
+ * @attach_dev: attach an iommu domain to a device
+ * @detach_dev: detach an iommu domain from a device
+ * @map: map a physically contiguous memory region to an iommu domain
+ * @map_pages: map a physically contiguous set of pages of the same size to
+ *             an iommu domain.
+ * @unmap: unmap a physically contiguous memory region from an iommu domain
+ * @unmap_pages: unmap a number of pages of the same size from an iommu domain
+ * @flush_iotlb_all: Synchronously flush all hardware TLBs for this domain
+ * @iotlb_sync_map: Sync mappings created recently using @map to the hardware
+ * @iotlb_sync: Flush all queued ranges from the hardware TLBs and empty flush
+ *            queue
+ * @iova_to_phys: translate iova to physical address
+ * @enable_nesting: Enable nesting
+ * @set_pgtable_quirks: Set io page table quirks (IO_PGTABLE_QUIRK_*)
+ * @free: Release the domain after use.
+ */
+struct iommu_domain_ops {
+	int (*attach_dev)(struct iommu_domain *domain, struct device *dev);
+	void (*detach_dev)(struct iommu_domain *domain, struct device *dev);
+
+	int (*map)(struct iommu_domain *domain, unsigned long iova,
+		   phys_addr_t paddr, size_t size, int prot, gfp_t gfp);
+	int (*map_pages)(struct iommu_domain *domain, unsigned long iova,
+			 phys_addr_t paddr, size_t pgsize, size_t pgcount,
+			 int prot, gfp_t gfp, size_t *mapped);
+	size_t (*unmap)(struct iommu_domain *domain, unsigned long iova,
+			size_t size, struct iommu_iotlb_gather *iotlb_gather);
+	size_t (*unmap_pages)(struct iommu_domain *domain, unsigned long iova,
+			      size_t pgsize, size_t pgcount,
+			      struct iommu_iotlb_gather *iotlb_gather);
+
+	void (*flush_iotlb_all)(struct iommu_domain *domain);
+	void (*iotlb_sync_map)(struct iommu_domain *domain, unsigned long iova,
+			       size_t size);
+	void (*iotlb_sync)(struct iommu_domain *domain,
+			   struct iommu_iotlb_gather *iotlb_gather);
+
+	phys_addr_t (*iova_to_phys)(struct iommu_domain *domain,
+				    dma_addr_t iova);
+
+	int (*enable_nesting)(struct iommu_domain *domain);
+	int (*set_pgtable_quirks)(struct iommu_domain *domain,
+				  unsigned long quirks);
+
+	void (*free)(struct iommu_domain *domain);
+};
+
 /**
  * struct iommu_device - IOMMU core representation of one IOMMU hardware
  *			 instance
diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
index 37f2fbb4b129..2bed113c4e6d 100644
--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -2268,13 +2268,6 @@ static int amd_iommu_def_domain_type(struct device *dev)
 const struct iommu_ops amd_iommu_ops = {
 	.capable = amd_iommu_capable,
 	.domain_alloc = amd_iommu_domain_alloc,
-	.domain_free  = amd_iommu_domain_free,
-	.attach_dev = amd_iommu_attach_device,
-	.detach_dev = amd_iommu_detach_device,
-	.map = amd_iommu_map,
-	.iotlb_sync_map	= amd_iommu_iotlb_sync_map,
-	.unmap = amd_iommu_unmap,
-	.iova_to_phys = amd_iommu_iova_to_phys,
 	.probe_device = amd_iommu_probe_device,
 	.release_device = amd_iommu_release_device,
 	.probe_finalize = amd_iommu_probe_finalize,
@@ -2283,9 +2276,18 @@ const struct iommu_ops amd_iommu_ops = {
 	.put_resv_regions = generic_iommu_put_resv_regions,
 	.is_attach_deferred = amd_iommu_is_attach_deferred,
 	.pgsize_bitmap	= AMD_IOMMU_PGSIZES,
-	.flush_iotlb_all = amd_iommu_flush_iotlb_all,
-	.iotlb_sync = amd_iommu_iotlb_sync,
 	.def_domain_type = amd_iommu_def_domain_type,
+	.default_domain_ops = &(const struct iommu_domain_ops) {
+		.attach_dev	= amd_iommu_attach_device,
+		.detach_dev	= amd_iommu_detach_device,
+		.map		= amd_iommu_map,
+		.unmap		= amd_iommu_unmap,
+		.iotlb_sync_map	= amd_iommu_iotlb_sync_map,
+		.iova_to_phys	= amd_iommu_iova_to_phys,
+		.flush_iotlb_all = amd_iommu_flush_iotlb_all,
+		.iotlb_sync	= amd_iommu_iotlb_sync,
+		.free		= amd_iommu_domain_free,
+	}
 };
 
 /*****************************************************************************
diff --git a/drivers/iommu/apple-dart.c b/drivers/iommu/apple-dart.c
index 565ef5598811..decafb07ad08 100644
--- a/drivers/iommu/apple-dart.c
+++ b/drivers/iommu/apple-dart.c
@@ -765,15 +765,6 @@ static void apple_dart_get_resv_regions(struct device *dev,
 
 static const struct iommu_ops apple_dart_iommu_ops = {
 	.domain_alloc = apple_dart_domain_alloc,
-	.domain_free = apple_dart_domain_free,
-	.attach_dev = apple_dart_attach_dev,
-	.detach_dev = apple_dart_detach_dev,
-	.map_pages = apple_dart_map_pages,
-	.unmap_pages = apple_dart_unmap_pages,
-	.flush_iotlb_all = apple_dart_flush_iotlb_all,
-	.iotlb_sync = apple_dart_iotlb_sync,
-	.iotlb_sync_map = apple_dart_iotlb_sync_map,
-	.iova_to_phys = apple_dart_iova_to_phys,
 	.probe_device = apple_dart_probe_device,
 	.release_device = apple_dart_release_device,
 	.device_group = apple_dart_device_group,
@@ -782,6 +773,17 @@ static const struct iommu_ops apple_dart_iommu_ops = {
 	.get_resv_regions = apple_dart_get_resv_regions,
 	.put_resv_regions = generic_iommu_put_resv_regions,
 	.pgsize_bitmap = -1UL, /* Restricted during dart probe */
+	.default_domain_ops = &(const struct iommu_domain_ops) {
+		.attach_dev	= apple_dart_attach_dev,
+		.detach_dev	= apple_dart_detach_dev,
+		.map_pages	= apple_dart_map_pages,
+		.unmap_pages	= apple_dart_unmap_pages,
+		.flush_iotlb_all = apple_dart_flush_iotlb_all,
+		.iotlb_sync	= apple_dart_iotlb_sync,
+		.iotlb_sync_map	= apple_dart_iotlb_sync_map,
+		.iova_to_phys	= apple_dart_iova_to_phys,
+		.free		= apple_dart_domain_free,
+	}
 };
 
 static irqreturn_t apple_dart_irq(int irq, void *dev)
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 6dc6d8b6b368..fd49282c03a3 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -2841,17 +2841,9 @@ static int arm_smmu_dev_disable_feature(struct device *dev,
 static struct iommu_ops arm_smmu_ops = {
 	.capable		= arm_smmu_capable,
 	.domain_alloc		= arm_smmu_domain_alloc,
-	.domain_free		= arm_smmu_domain_free,
-	.attach_dev		= arm_smmu_attach_dev,
-	.map_pages		= arm_smmu_map_pages,
-	.unmap_pages		= arm_smmu_unmap_pages,
-	.flush_iotlb_all	= arm_smmu_flush_iotlb_all,
-	.iotlb_sync		= arm_smmu_iotlb_sync,
-	.iova_to_phys		= arm_smmu_iova_to_phys,
 	.probe_device		= arm_smmu_probe_device,
 	.release_device		= arm_smmu_release_device,
 	.device_group		= arm_smmu_device_group,
-	.enable_nesting		= arm_smmu_enable_nesting,
 	.of_xlate		= arm_smmu_of_xlate,
 	.get_resv_regions	= arm_smmu_get_resv_regions,
 	.put_resv_regions	= generic_iommu_put_resv_regions,
@@ -2865,6 +2857,16 @@ static struct iommu_ops arm_smmu_ops = {
 	.page_response		= arm_smmu_page_response,
 	.pgsize_bitmap		= -1UL, /* Restricted during device attach */
 	.owner			= THIS_MODULE,
+	.default_domain_ops = &(const struct iommu_domain_ops) {
+		.attach_dev		= arm_smmu_attach_dev,
+		.map_pages		= arm_smmu_map_pages,
+		.unmap_pages		= arm_smmu_unmap_pages,
+		.flush_iotlb_all	= arm_smmu_flush_iotlb_all,
+		.iotlb_sync		= arm_smmu_iotlb_sync,
+		.iova_to_phys		= arm_smmu_iova_to_phys,
+		.enable_nesting		= arm_smmu_enable_nesting,
+		.free			= arm_smmu_domain_free,
+	}
 };
 
 /* Probing and initialisation functions */
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 4bc75c4ce402..41321fb47152 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -1583,25 +1583,27 @@ static int arm_smmu_def_domain_type(struct device *dev)
 static struct iommu_ops arm_smmu_ops = {
 	.capable		= arm_smmu_capable,
 	.domain_alloc		= arm_smmu_domain_alloc,
-	.domain_free		= arm_smmu_domain_free,
-	.attach_dev		= arm_smmu_attach_dev,
-	.map_pages		= arm_smmu_map_pages,
-	.unmap_pages		= arm_smmu_unmap_pages,
-	.flush_iotlb_all	= arm_smmu_flush_iotlb_all,
-	.iotlb_sync		= arm_smmu_iotlb_sync,
-	.iova_to_phys		= arm_smmu_iova_to_phys,
 	.probe_device		= arm_smmu_probe_device,
 	.release_device		= arm_smmu_release_device,
 	.probe_finalize		= arm_smmu_probe_finalize,
 	.device_group		= arm_smmu_device_group,
-	.enable_nesting		= arm_smmu_enable_nesting,
-	.set_pgtable_quirks	= arm_smmu_set_pgtable_quirks,
 	.of_xlate		= arm_smmu_of_xlate,
 	.get_resv_regions	= arm_smmu_get_resv_regions,
 	.put_resv_regions	= generic_iommu_put_resv_regions,
 	.def_domain_type	= arm_smmu_def_domain_type,
 	.pgsize_bitmap		= -1UL, /* Restricted during device attach */
 	.owner			= THIS_MODULE,
+	.default_domain_ops = &(const struct iommu_domain_ops) {
+		.attach_dev		= arm_smmu_attach_dev,
+		.map_pages		= arm_smmu_map_pages,
+		.unmap_pages		= arm_smmu_unmap_pages,
+		.flush_iotlb_all	= arm_smmu_flush_iotlb_all,
+		.iotlb_sync		= arm_smmu_iotlb_sync,
+		.iova_to_phys		= arm_smmu_iova_to_phys,
+		.enable_nesting		= arm_smmu_enable_nesting,
+		.set_pgtable_quirks	= arm_smmu_set_pgtable_quirks,
+		.free			= arm_smmu_domain_free,
+	}
 };
 
 static void arm_smmu_device_reset(struct arm_smmu_device *smmu)
diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index b91874cb6cf3..ed659de20661 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -590,19 +590,21 @@ static int qcom_iommu_of_xlate(struct device *dev, struct of_phandle_args *args)
 static const struct iommu_ops qcom_iommu_ops = {
 	.capable	= qcom_iommu_capable,
 	.domain_alloc	= qcom_iommu_domain_alloc,
-	.domain_free	= qcom_iommu_domain_free,
-	.attach_dev	= qcom_iommu_attach_dev,
-	.detach_dev	= qcom_iommu_detach_dev,
-	.map		= qcom_iommu_map,
-	.unmap		= qcom_iommu_unmap,
-	.flush_iotlb_all = qcom_iommu_flush_iotlb_all,
-	.iotlb_sync	= qcom_iommu_iotlb_sync,
-	.iova_to_phys	= qcom_iommu_iova_to_phys,
 	.probe_device	= qcom_iommu_probe_device,
 	.release_device	= qcom_iommu_release_device,
 	.device_group	= generic_device_group,
 	.of_xlate	= qcom_iommu_of_xlate,
 	.pgsize_bitmap	= SZ_4K | SZ_64K | SZ_1M | SZ_16M,
+	.default_domain_ops = &(const struct iommu_domain_ops) {
+		.attach_dev	= qcom_iommu_attach_dev,
+		.detach_dev	= qcom_iommu_detach_dev,
+		.map		= qcom_iommu_map,
+		.unmap		= qcom_iommu_unmap,
+		.flush_iotlb_all = qcom_iommu_flush_iotlb_all,
+		.iotlb_sync	= qcom_iommu_iotlb_sync,
+		.iova_to_phys	= qcom_iommu_iova_to_phys,
+		.free		= qcom_iommu_domain_free,
+	}
 };
 
 static int qcom_iommu_sec_ptbl_init(struct device *dev)
diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
index 939ffa768986..71f2018e23fe 100644
--- a/drivers/iommu/exynos-iommu.c
+++ b/drivers/iommu/exynos-iommu.c
@@ -1309,17 +1309,19 @@ static int exynos_iommu_of_xlate(struct device *dev,
 
 static const struct iommu_ops exynos_iommu_ops = {
 	.domain_alloc = exynos_iommu_domain_alloc,
-	.domain_free = exynos_iommu_domain_free,
-	.attach_dev = exynos_iommu_attach_device,
-	.detach_dev = exynos_iommu_detach_device,
-	.map = exynos_iommu_map,
-	.unmap = exynos_iommu_unmap,
-	.iova_to_phys = exynos_iommu_iova_to_phys,
 	.device_group = generic_device_group,
 	.probe_device = exynos_iommu_probe_device,
 	.release_device = exynos_iommu_release_device,
 	.pgsize_bitmap = SECT_SIZE | LPAGE_SIZE | SPAGE_SIZE,
 	.of_xlate = exynos_iommu_of_xlate,
+	.default_domain_ops = &(const struct iommu_domain_ops) {
+		.attach_dev	= exynos_iommu_attach_device,
+		.detach_dev	= exynos_iommu_detach_device,
+		.map		= exynos_iommu_map,
+		.unmap		= exynos_iommu_unmap,
+		.iova_to_phys	= exynos_iommu_iova_to_phys,
+		.free		= exynos_iommu_domain_free,
+	}
 };
 
 static int __init exynos_iommu_init(void)
diff --git a/drivers/iommu/fsl_pamu_domain.c b/drivers/iommu/fsl_pamu_domain.c
index a47f47307109..69a4a62dc3b9 100644
--- a/drivers/iommu/fsl_pamu_domain.c
+++ b/drivers/iommu/fsl_pamu_domain.c
@@ -453,13 +453,15 @@ static void fsl_pamu_release_device(struct device *dev)
 static const struct iommu_ops fsl_pamu_ops = {
 	.capable	= fsl_pamu_capable,
 	.domain_alloc	= fsl_pamu_domain_alloc,
-	.domain_free    = fsl_pamu_domain_free,
-	.attach_dev	= fsl_pamu_attach_device,
-	.detach_dev	= fsl_pamu_detach_device,
-	.iova_to_phys	= fsl_pamu_iova_to_phys,
 	.probe_device	= fsl_pamu_probe_device,
 	.release_device	= fsl_pamu_release_device,
 	.device_group   = fsl_pamu_device_group,
+	.default_domain_ops = &(const struct iommu_domain_ops) {
+		.attach_dev	= fsl_pamu_attach_device,
+		.detach_dev	= fsl_pamu_detach_device,
+		.iova_to_phys	= fsl_pamu_iova_to_phys,
+		.free		= fsl_pamu_domain_free,
+	}
 };
 
 int __init pamu_domain_init(void)
diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index 80f1294be634..b549172e88ef 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -5092,15 +5092,6 @@ static void intel_iommu_iotlb_sync_map(struct iommu_domain *domain,
 const struct iommu_ops intel_iommu_ops = {
 	.capable		= intel_iommu_capable,
 	.domain_alloc		= intel_iommu_domain_alloc,
-	.domain_free		= intel_iommu_domain_free,
-	.attach_dev		= intel_iommu_attach_device,
-	.detach_dev		= intel_iommu_detach_device,
-	.map_pages		= intel_iommu_map_pages,
-	.unmap_pages		= intel_iommu_unmap_pages,
-	.iotlb_sync_map		= intel_iommu_iotlb_sync_map,
-	.flush_iotlb_all        = intel_flush_iotlb_all,
-	.iotlb_sync		= intel_iommu_tlb_sync,
-	.iova_to_phys		= intel_iommu_iova_to_phys,
 	.probe_device		= intel_iommu_probe_device,
 	.probe_finalize		= intel_iommu_probe_finalize,
 	.release_device		= intel_iommu_release_device,
@@ -5118,6 +5109,17 @@ const struct iommu_ops intel_iommu_ops = {
 	.sva_get_pasid		= intel_svm_get_pasid,
 	.page_response		= intel_svm_page_response,
 #endif
+	.default_domain_ops = &(const struct iommu_domain_ops) {
+		.attach_dev		= intel_iommu_attach_device,
+		.detach_dev		= intel_iommu_detach_device,
+		.map_pages		= intel_iommu_map_pages,
+		.unmap_pages		= intel_iommu_unmap_pages,
+		.iotlb_sync_map		= intel_iommu_iotlb_sync_map,
+		.flush_iotlb_all        = intel_flush_iotlb_all,
+		.iotlb_sync		= intel_iommu_tlb_sync,
+		.iova_to_phys		= intel_iommu_iova_to_phys,
+		.free			= intel_iommu_domain_free,
+	}
 };
 
 static void quirk_iommu_igfx(struct pci_dev *dev)
diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 27276421d253..f2c45b85b9fc 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -1950,10 +1950,11 @@ static struct iommu_domain *__iommu_domain_alloc(struct bus_type *bus,
 	if (!domain)
 		return NULL;
 
-	domain->ops  = bus->iommu_ops;
 	domain->type = type;
 	/* Assume all sizes by default; the driver may override this later */
-	domain->pgsize_bitmap  = bus->iommu_ops->pgsize_bitmap;
+	domain->pgsize_bitmap = bus->iommu_ops->pgsize_bitmap;
+	if (!domain->ops)
+		domain->ops = bus->iommu_ops->default_domain_ops;
 
 	if (iommu_is_dma_domain(domain) && iommu_get_dma_cookie(domain)) {
 		iommu_domain_free(domain);
@@ -1971,7 +1972,7 @@ EXPORT_SYMBOL_GPL(iommu_domain_alloc);
 void iommu_domain_free(struct iommu_domain *domain)
 {
 	iommu_put_dma_cookie(domain);
-	domain->ops->domain_free(domain);
+	domain->ops->free(domain);
 }
 EXPORT_SYMBOL_GPL(iommu_domain_free);
 
@@ -2242,7 +2243,7 @@ static int __iommu_map_pages(struct iommu_domain *domain, unsigned long iova,
 			     phys_addr_t paddr, size_t size, int prot,
 			     gfp_t gfp, size_t *mapped)
 {
-	const struct iommu_ops *ops = domain->ops;
+	const struct iommu_domain_ops *ops = domain->ops;
 	size_t pgsize, count;
 	int ret;
 
@@ -2265,7 +2266,7 @@ static int __iommu_map_pages(struct iommu_domain *domain, unsigned long iova,
 static int __iommu_map(struct iommu_domain *domain, unsigned long iova,
 		       phys_addr_t paddr, size_t size, int prot, gfp_t gfp)
 {
-	const struct iommu_ops *ops = domain->ops;
+	const struct iommu_domain_ops *ops = domain->ops;
 	unsigned long orig_iova = iova;
 	unsigned int min_pagesz;
 	size_t orig_size = size;
@@ -2325,7 +2326,7 @@ static int __iommu_map(struct iommu_domain *domain, unsigned long iova,
 static int _iommu_map(struct iommu_domain *domain, unsigned long iova,
 		      phys_addr_t paddr, size_t size, int prot, gfp_t gfp)
 {
-	const struct iommu_ops *ops = domain->ops;
+	const struct iommu_domain_ops *ops = domain->ops;
 	int ret;
 
 	ret = __iommu_map(domain, iova, paddr, size, prot, gfp);
@@ -2354,7 +2355,7 @@ static size_t __iommu_unmap_pages(struct iommu_domain *domain,
 				  unsigned long iova, size_t size,
 				  struct iommu_iotlb_gather *iotlb_gather)
 {
-	const struct iommu_ops *ops = domain->ops;
+	const struct iommu_domain_ops *ops = domain->ops;
 	size_t pgsize, count;
 
 	pgsize = iommu_pgsize(domain, iova, iova, size, &count);
@@ -2367,7 +2368,7 @@ static size_t __iommu_unmap(struct iommu_domain *domain,
 			    unsigned long iova, size_t size,
 			    struct iommu_iotlb_gather *iotlb_gather)
 {
-	const struct iommu_ops *ops = domain->ops;
+	const struct iommu_domain_ops *ops = domain->ops;
 	size_t unmapped_page, unmapped = 0;
 	unsigned long orig_iova = iova;
 	unsigned int min_pagesz;
@@ -2443,7 +2444,7 @@ static ssize_t __iommu_map_sg(struct iommu_domain *domain, unsigned long iova,
 		struct scatterlist *sg, unsigned int nents, int prot,
 		gfp_t gfp)
 {
-	const struct iommu_ops *ops = domain->ops;
+	const struct iommu_domain_ops *ops = domain->ops;
 	size_t len = 0, mapped = 0;
 	phys_addr_t start;
 	unsigned int i = 0;
diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
index ca752bdc710f..00d5f7a33499 100644
--- a/drivers/iommu/ipmmu-vmsa.c
+++ b/drivers/iommu/ipmmu-vmsa.c
@@ -868,14 +868,6 @@ static struct iommu_group *ipmmu_find_group(struct device *dev)
 
 static const struct iommu_ops ipmmu_ops = {
 	.domain_alloc = ipmmu_domain_alloc,
-	.domain_free = ipmmu_domain_free,
-	.attach_dev = ipmmu_attach_device,
-	.detach_dev = ipmmu_detach_device,
-	.map = ipmmu_map,
-	.unmap = ipmmu_unmap,
-	.flush_iotlb_all = ipmmu_flush_iotlb_all,
-	.iotlb_sync = ipmmu_iotlb_sync,
-	.iova_to_phys = ipmmu_iova_to_phys,
 	.probe_device = ipmmu_probe_device,
 	.release_device = ipmmu_release_device,
 	.probe_finalize = ipmmu_probe_finalize,
@@ -883,6 +875,16 @@ static const struct iommu_ops ipmmu_ops = {
 			? generic_device_group : ipmmu_find_group,
 	.pgsize_bitmap = SZ_1G | SZ_2M | SZ_4K,
 	.of_xlate = ipmmu_of_xlate,
+	.default_domain_ops = &(const struct iommu_domain_ops) {
+		.attach_dev	= ipmmu_attach_device,
+		.detach_dev	= ipmmu_detach_device,
+		.map		= ipmmu_map,
+		.unmap		= ipmmu_unmap,
+		.flush_iotlb_all = ipmmu_flush_iotlb_all,
+		.iotlb_sync	= ipmmu_iotlb_sync,
+		.iova_to_phys	= ipmmu_iova_to_phys,
+		.free		= ipmmu_domain_free,
+	}
 };
 
 /* -----------------------------------------------------------------------------
diff --git a/drivers/iommu/msm_iommu.c b/drivers/iommu/msm_iommu.c
index 3a38352b603f..2b07eb298ce1 100644
--- a/drivers/iommu/msm_iommu.c
+++ b/drivers/iommu/msm_iommu.c
@@ -674,25 +674,27 @@ irqreturn_t msm_iommu_fault_handler(int irq, void *dev_id)
 static struct iommu_ops msm_iommu_ops = {
 	.capable = msm_iommu_capable,
 	.domain_alloc = msm_iommu_domain_alloc,
-	.domain_free = msm_iommu_domain_free,
-	.attach_dev = msm_iommu_attach_dev,
-	.detach_dev = msm_iommu_detach_dev,
-	.map = msm_iommu_map,
-	.unmap = msm_iommu_unmap,
-	/*
-	 * Nothing is needed here, the barrier to guarantee
-	 * completion of the tlb sync operation is implicitly
-	 * taken care when the iommu client does a writel before
-	 * kick starting the other master.
-	 */
-	.iotlb_sync = NULL,
-	.iotlb_sync_map = msm_iommu_sync_map,
-	.iova_to_phys = msm_iommu_iova_to_phys,
 	.probe_device = msm_iommu_probe_device,
 	.release_device = msm_iommu_release_device,
 	.device_group = generic_device_group,
 	.pgsize_bitmap = MSM_IOMMU_PGSIZES,
 	.of_xlate = qcom_iommu_of_xlate,
+	.default_domain_ops = &(const struct iommu_domain_ops) {
+		.attach_dev	= msm_iommu_attach_dev,
+		.detach_dev	= msm_iommu_detach_dev,
+		.map		= msm_iommu_map,
+		.unmap		= msm_iommu_unmap,
+		/*
+		 * Nothing is needed here, the barrier to guarantee
+		 * completion of the tlb sync operation is implicitly
+		 * taken care when the iommu client does a writel before
+		 * kick starting the other master.
+		 */
+		.iotlb_sync	= NULL,
+		.iotlb_sync_map	= msm_iommu_sync_map,
+		.iova_to_phys	= msm_iommu_iova_to_phys,
+		.free		= msm_iommu_domain_free,
+	}
 };
 
 static int msm_iommu_probe(struct platform_device *pdev)
diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 25b834104790..884c288a8f63 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -658,15 +658,6 @@ static void mtk_iommu_get_resv_regions(struct device *dev,
 
 static const struct iommu_ops mtk_iommu_ops = {
 	.domain_alloc	= mtk_iommu_domain_alloc,
-	.domain_free	= mtk_iommu_domain_free,
-	.attach_dev	= mtk_iommu_attach_device,
-	.detach_dev	= mtk_iommu_detach_device,
-	.map		= mtk_iommu_map,
-	.unmap		= mtk_iommu_unmap,
-	.flush_iotlb_all = mtk_iommu_flush_iotlb_all,
-	.iotlb_sync	= mtk_iommu_iotlb_sync,
-	.iotlb_sync_map	= mtk_iommu_sync_map,
-	.iova_to_phys	= mtk_iommu_iova_to_phys,
 	.probe_device	= mtk_iommu_probe_device,
 	.release_device	= mtk_iommu_release_device,
 	.device_group	= mtk_iommu_device_group,
@@ -675,6 +666,17 @@ static const struct iommu_ops mtk_iommu_ops = {
 	.put_resv_regions = generic_iommu_put_resv_regions,
 	.pgsize_bitmap	= SZ_4K | SZ_64K | SZ_1M | SZ_16M,
 	.owner		= THIS_MODULE,
+	.default_domain_ops = &(const struct iommu_domain_ops) {
+		.attach_dev	= mtk_iommu_attach_device,
+		.detach_dev	= mtk_iommu_detach_device,
+		.map		= mtk_iommu_map,
+		.unmap		= mtk_iommu_unmap,
+		.flush_iotlb_all = mtk_iommu_flush_iotlb_all,
+		.iotlb_sync	= mtk_iommu_iotlb_sync,
+		.iotlb_sync_map	= mtk_iommu_sync_map,
+		.iova_to_phys	= mtk_iommu_iova_to_phys,
+		.free		= mtk_iommu_domain_free,
+	}
 };
 
 static int mtk_iommu_hw_init(const struct mtk_iommu_data *data)
diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
index be22fcf988ce..293ef7e1a861 100644
--- a/drivers/iommu/mtk_iommu_v1.c
+++ b/drivers/iommu/mtk_iommu_v1.c
@@ -514,12 +514,6 @@ static int mtk_iommu_hw_init(const struct mtk_iommu_data *data)
 
 static const struct iommu_ops mtk_iommu_ops = {
 	.domain_alloc	= mtk_iommu_domain_alloc,
-	.domain_free	= mtk_iommu_domain_free,
-	.attach_dev	= mtk_iommu_attach_device,
-	.detach_dev	= mtk_iommu_detach_device,
-	.map		= mtk_iommu_map,
-	.unmap		= mtk_iommu_unmap,
-	.iova_to_phys	= mtk_iommu_iova_to_phys,
 	.probe_device	= mtk_iommu_probe_device,
 	.probe_finalize = mtk_iommu_probe_finalize,
 	.release_device	= mtk_iommu_release_device,
@@ -527,6 +521,14 @@ static const struct iommu_ops mtk_iommu_ops = {
 	.device_group	= generic_device_group,
 	.pgsize_bitmap	= ~0UL << MT2701_IOMMU_PAGE_SHIFT,
 	.owner          = THIS_MODULE,
+	.default_domain_ops = &(const struct iommu_domain_ops) {
+		.attach_dev	= mtk_iommu_attach_device,
+		.detach_dev	= mtk_iommu_detach_device,
+		.map		= mtk_iommu_map,
+		.unmap		= mtk_iommu_unmap,
+		.iova_to_phys	= mtk_iommu_iova_to_phys,
+		.free		= mtk_iommu_domain_free,
+	}
 };
 
 static const struct of_device_id mtk_iommu_of_ids[] = {
diff --git a/drivers/iommu/omap-iommu.c b/drivers/iommu/omap-iommu.c
index 980e4af3f06b..4aab631ef517 100644
--- a/drivers/iommu/omap-iommu.c
+++ b/drivers/iommu/omap-iommu.c
@@ -1734,16 +1734,18 @@ static struct iommu_group *omap_iommu_device_group(struct device *dev)
 
 static const struct iommu_ops omap_iommu_ops = {
 	.domain_alloc	= omap_iommu_domain_alloc,
-	.domain_free	= omap_iommu_domain_free,
-	.attach_dev	= omap_iommu_attach_dev,
-	.detach_dev	= omap_iommu_detach_dev,
-	.map		= omap_iommu_map,
-	.unmap		= omap_iommu_unmap,
-	.iova_to_phys	= omap_iommu_iova_to_phys,
 	.probe_device	= omap_iommu_probe_device,
 	.release_device	= omap_iommu_release_device,
 	.device_group	= omap_iommu_device_group,
 	.pgsize_bitmap	= OMAP_IOMMU_PGSIZES,
+	.default_domain_ops = &(const struct iommu_domain_ops) {
+		.attach_dev	= omap_iommu_attach_dev,
+		.detach_dev	= omap_iommu_detach_dev,
+		.map		= omap_iommu_map,
+		.unmap		= omap_iommu_unmap,
+		.iova_to_phys	= omap_iommu_iova_to_phys,
+		.free		= omap_iommu_domain_free,
+	}
 };
 
 static int __init omap_iommu_init(void)
diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iommu.c
index 7f23ad61c094..2ae97a84d41b 100644
--- a/drivers/iommu/rockchip-iommu.c
+++ b/drivers/iommu/rockchip-iommu.c
@@ -1187,17 +1187,19 @@ static int rk_iommu_of_xlate(struct device *dev,
 
 static const struct iommu_ops rk_iommu_ops = {
 	.domain_alloc = rk_iommu_domain_alloc,
-	.domain_free = rk_iommu_domain_free,
-	.attach_dev = rk_iommu_attach_device,
-	.detach_dev = rk_iommu_detach_device,
-	.map = rk_iommu_map,
-	.unmap = rk_iommu_unmap,
 	.probe_device = rk_iommu_probe_device,
 	.release_device = rk_iommu_release_device,
-	.iova_to_phys = rk_iommu_iova_to_phys,
 	.device_group = rk_iommu_device_group,
 	.pgsize_bitmap = RK_IOMMU_PGSIZE_BITMAP,
 	.of_xlate = rk_iommu_of_xlate,
+	.default_domain_ops = &(const struct iommu_domain_ops) {
+		.attach_dev	= rk_iommu_attach_device,
+		.detach_dev	= rk_iommu_detach_device,
+		.map		= rk_iommu_map,
+		.unmap		= rk_iommu_unmap,
+		.iova_to_phys	= rk_iommu_iova_to_phys,
+		.free		= rk_iommu_domain_free,
+	}
 };
 
 static int rk_iommu_probe(struct platform_device *pdev)
diff --git a/drivers/iommu/s390-iommu.c b/drivers/iommu/s390-iommu.c
index 50860ebdd087..3833e86c6e7b 100644
--- a/drivers/iommu/s390-iommu.c
+++ b/drivers/iommu/s390-iommu.c
@@ -363,16 +363,18 @@ void zpci_destroy_iommu(struct zpci_dev *zdev)
 static const struct iommu_ops s390_iommu_ops = {
 	.capable = s390_iommu_capable,
 	.domain_alloc = s390_domain_alloc,
-	.domain_free = s390_domain_free,
-	.attach_dev = s390_iommu_attach_device,
-	.detach_dev = s390_iommu_detach_device,
-	.map = s390_iommu_map,
-	.unmap = s390_iommu_unmap,
-	.iova_to_phys = s390_iommu_iova_to_phys,
 	.probe_device = s390_iommu_probe_device,
 	.release_device = s390_iommu_release_device,
 	.device_group = generic_device_group,
 	.pgsize_bitmap = S390_IOMMU_PGSIZES,
+	.default_domain_ops = &(const struct iommu_domain_ops) {
+		.attach_dev	= s390_iommu_attach_device,
+		.detach_dev	= s390_iommu_detach_device,
+		.map		= s390_iommu_map,
+		.unmap		= s390_iommu_unmap,
+		.iova_to_phys	= s390_iommu_iova_to_phys,
+		.free		= s390_domain_free,
+	}
 };
 
 static int __init s390_iommu_init(void)
diff --git a/drivers/iommu/sprd-iommu.c b/drivers/iommu/sprd-iommu.c
index 27ac818b0354..bd409bab6286 100644
--- a/drivers/iommu/sprd-iommu.c
+++ b/drivers/iommu/sprd-iommu.c
@@ -416,20 +416,22 @@ static int sprd_iommu_of_xlate(struct device *dev, struct of_phandle_args *args)
 
 static const struct iommu_ops sprd_iommu_ops = {
 	.domain_alloc	= sprd_iommu_domain_alloc,
-	.domain_free	= sprd_iommu_domain_free,
-	.attach_dev	= sprd_iommu_attach_device,
-	.detach_dev	= sprd_iommu_detach_device,
-	.map		= sprd_iommu_map,
-	.unmap		= sprd_iommu_unmap,
-	.iotlb_sync_map	= sprd_iommu_sync_map,
-	.iotlb_sync	= sprd_iommu_sync,
-	.iova_to_phys	= sprd_iommu_iova_to_phys,
 	.probe_device	= sprd_iommu_probe_device,
 	.release_device	= sprd_iommu_release_device,
 	.device_group	= sprd_iommu_device_group,
 	.of_xlate	= sprd_iommu_of_xlate,
 	.pgsize_bitmap	= ~0UL << SPRD_IOMMU_PAGE_SHIFT,
 	.owner		= THIS_MODULE,
+	.default_domain_ops = &(const struct iommu_domain_ops) {
+		.attach_dev	= sprd_iommu_attach_device,
+		.detach_dev	= sprd_iommu_detach_device,
+		.map		= sprd_iommu_map,
+		.unmap		= sprd_iommu_unmap,
+		.iotlb_sync_map	= sprd_iommu_sync_map,
+		.iotlb_sync	= sprd_iommu_sync,
+		.iova_to_phys	= sprd_iommu_iova_to_phys,
+		.free		= sprd_iommu_domain_free,
+	}
 };
 
 static const struct of_device_id sprd_iommu_of_match[] = {
diff --git a/drivers/iommu/sun50i-iommu.c b/drivers/iommu/sun50i-iommu.c
index 92997021e188..c54ab477b8fd 100644
--- a/drivers/iommu/sun50i-iommu.c
+++ b/drivers/iommu/sun50i-iommu.c
@@ -760,19 +760,21 @@ static int sun50i_iommu_of_xlate(struct device *dev,
 
 static const struct iommu_ops sun50i_iommu_ops = {
 	.pgsize_bitmap	= SZ_4K,
-	.attach_dev	= sun50i_iommu_attach_device,
-	.detach_dev	= sun50i_iommu_detach_device,
 	.device_group	= sun50i_iommu_device_group,
 	.domain_alloc	= sun50i_iommu_domain_alloc,
-	.domain_free	= sun50i_iommu_domain_free,
-	.flush_iotlb_all = sun50i_iommu_flush_iotlb_all,
-	.iotlb_sync	= sun50i_iommu_iotlb_sync,
-	.iova_to_phys	= sun50i_iommu_iova_to_phys,
-	.map		= sun50i_iommu_map,
 	.of_xlate	= sun50i_iommu_of_xlate,
 	.probe_device	= sun50i_iommu_probe_device,
 	.release_device	= sun50i_iommu_release_device,
-	.unmap		= sun50i_iommu_unmap,
+	.default_domain_ops = &(const struct iommu_domain_ops) {
+		.attach_dev	= sun50i_iommu_attach_device,
+		.detach_dev	= sun50i_iommu_detach_device,
+		.flush_iotlb_all = sun50i_iommu_flush_iotlb_all,
+		.iotlb_sync	= sun50i_iommu_iotlb_sync,
+		.iova_to_phys	= sun50i_iommu_iova_to_phys,
+		.map		= sun50i_iommu_map,
+		.unmap		= sun50i_iommu_unmap,
+		.free		= sun50i_iommu_domain_free,
+	}
 };
 
 static void sun50i_iommu_report_fault(struct sun50i_iommu *iommu,
diff --git a/drivers/iommu/tegra-gart.c b/drivers/iommu/tegra-gart.c
index 6a358f92c7e5..795189bc56b0 100644
--- a/drivers/iommu/tegra-gart.c
+++ b/drivers/iommu/tegra-gart.c
@@ -278,19 +278,21 @@ static void gart_iommu_sync(struct iommu_domain *domain,
 static const struct iommu_ops gart_iommu_ops = {
 	.capable	= gart_iommu_capable,
 	.domain_alloc	= gart_iommu_domain_alloc,
-	.domain_free	= gart_iommu_domain_free,
-	.attach_dev	= gart_iommu_attach_dev,
-	.detach_dev	= gart_iommu_detach_dev,
 	.probe_device	= gart_iommu_probe_device,
 	.release_device	= gart_iommu_release_device,
 	.device_group	= generic_device_group,
-	.map		= gart_iommu_map,
-	.unmap		= gart_iommu_unmap,
-	.iova_to_phys	= gart_iommu_iova_to_phys,
 	.pgsize_bitmap	= GART_IOMMU_PGSIZES,
 	.of_xlate	= gart_iommu_of_xlate,
-	.iotlb_sync_map	= gart_iommu_sync_map,
-	.iotlb_sync	= gart_iommu_sync,
+	.default_domain_ops = &(const struct iommu_domain_ops) {
+		.attach_dev	= gart_iommu_attach_dev,
+		.detach_dev	= gart_iommu_detach_dev,
+		.map		= gart_iommu_map,
+		.unmap		= gart_iommu_unmap,
+		.iova_to_phys	= gart_iommu_iova_to_phys,
+		.iotlb_sync_map	= gart_iommu_sync_map,
+		.iotlb_sync	= gart_iommu_sync,
+		.free		= gart_iommu_domain_free,
+	}
 };
 
 int tegra_gart_suspend(struct gart_device *gart)
diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index e900e3c46903..c451b44cd733 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -969,17 +969,19 @@ static int tegra_smmu_of_xlate(struct device *dev,
 static const struct iommu_ops tegra_smmu_ops = {
 	.capable = tegra_smmu_capable,
 	.domain_alloc = tegra_smmu_domain_alloc,
-	.domain_free = tegra_smmu_domain_free,
-	.attach_dev = tegra_smmu_attach_dev,
-	.detach_dev = tegra_smmu_detach_dev,
 	.probe_device = tegra_smmu_probe_device,
 	.release_device = tegra_smmu_release_device,
 	.device_group = tegra_smmu_device_group,
-	.map = tegra_smmu_map,
-	.unmap = tegra_smmu_unmap,
-	.iova_to_phys = tegra_smmu_iova_to_phys,
 	.of_xlate = tegra_smmu_of_xlate,
 	.pgsize_bitmap = SZ_4K,
+	.default_domain_ops = &(const struct iommu_domain_ops) {
+		.attach_dev	= tegra_smmu_attach_dev,
+		.detach_dev	= tegra_smmu_detach_dev,
+		.map		= tegra_smmu_map,
+		.unmap		= tegra_smmu_unmap,
+		.iova_to_phys	= tegra_smmu_iova_to_phys,
+		.free		= tegra_smmu_domain_free,
+	}
 };
 
 static void tegra_smmu_ahb_enable(void)
diff --git a/drivers/iommu/virtio-iommu.c b/drivers/iommu/virtio-iommu.c
index f2aa34f57454..25be4b822aa0 100644
--- a/drivers/iommu/virtio-iommu.c
+++ b/drivers/iommu/virtio-iommu.c
@@ -1008,12 +1008,6 @@ static int viommu_of_xlate(struct device *dev, struct of_phandle_args *args)
 
 static struct iommu_ops viommu_ops = {
 	.domain_alloc		= viommu_domain_alloc,
-	.domain_free		= viommu_domain_free,
-	.attach_dev		= viommu_attach_dev,
-	.map			= viommu_map,
-	.unmap			= viommu_unmap,
-	.iova_to_phys		= viommu_iova_to_phys,
-	.iotlb_sync		= viommu_iotlb_sync,
 	.probe_device		= viommu_probe_device,
 	.probe_finalize		= viommu_probe_finalize,
 	.release_device		= viommu_release_device,
@@ -1022,6 +1016,14 @@ static struct iommu_ops viommu_ops = {
 	.put_resv_regions	= generic_iommu_put_resv_regions,
 	.of_xlate		= viommu_of_xlate,
 	.owner			= THIS_MODULE,
+	.default_domain_ops = &(const struct iommu_domain_ops) {
+		.attach_dev		= viommu_attach_dev,
+		.map			= viommu_map,
+		.unmap			= viommu_unmap,
+		.iova_to_phys		= viommu_iova_to_phys,
+		.iotlb_sync		= viommu_iotlb_sync,
+		.free			= viommu_domain_free,
+	}
 };
 
 static int viommu_init_vqs(struct viommu_dev *viommu)
-- 
2.25.1


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu

