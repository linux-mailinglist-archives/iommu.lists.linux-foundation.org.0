Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F5D4ACDFC
	for <lists.iommu@lfdr.de>; Tue,  8 Feb 2022 02:27:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D5DE8175F;
	Tue,  8 Feb 2022 01:27:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W5nk0jGNivlj; Tue,  8 Feb 2022 01:27:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id AE4798184F;
	Tue,  8 Feb 2022 01:27:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8A1DAC000B;
	Tue,  8 Feb 2022 01:27:43 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3E76AC000B
 for <iommu@lists.linux-foundation.org>; Tue,  8 Feb 2022 01:27:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2939A404CD
 for <iommu@lists.linux-foundation.org>; Tue,  8 Feb 2022 01:27:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=intel.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ez5Qskz1NrcJ for <iommu@lists.linux-foundation.org>;
 Tue,  8 Feb 2022 01:27:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B44FE40180
 for <iommu@lists.linux-foundation.org>; Tue,  8 Feb 2022 01:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644283659; x=1675819659;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xFxV3FwAnpydDENbVAtQKuNvQsT3jO7UeOEfBjt59z0=;
 b=QJxDVxE7cgHrsvk9JVAR81Tez/HyavJnPtSIdQdOboQHs0HN/8xvEnVg
 p9OCTLcOjR6dzIsSiGhRA2H6Dpgc5SOKys6hJ2IbexCBy806DdSjZ9zUn
 uWbTDPhxaPTRKNbOYjVTT9qIaVyW5D5DUlb1bEG2jRPCYMUV2YXctPeOA
 6zLvaomr3Fj4LmpP0zqvuq5QNkyS75hwTcB2phrL7sN9MzNVR/EOVDDvP
 BeEKEvgfQvaHl9mn4w1S9MFu3Ki/zwBYkgbpjjgzPHmvQ9YqnNcjEecxf
 iH3DgAojU29P0sdYKVSIjgI5j0cAl1igRylcJz34QgQlV+EyfHjcNgF13 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10251"; a="228816252"
X-IronPort-AV: E=Sophos;i="5.88,351,1635231600"; d="scan'208";a="228816252"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 17:27:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,351,1635231600"; d="scan'208";a="677948819"
Received: from allen-box.sh.intel.com ([10.239.159.118])
 by fmsmga001.fm.intel.com with ESMTP; 07 Feb 2022 17:27:35 -0800
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Christoph Hellwig <hch@infradead.org>, Ben Skeggs <bskeggs@redhat.com>,
 Kevin Tian <kevin.tian@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v2 03/10] iommu/vt-d: Remove aux-domain related callbacks
Date: Tue,  8 Feb 2022 09:25:52 +0800
Message-Id: <20220208012559.1121729-4-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220208012559.1121729-1-baolu.lu@linux.intel.com>
References: <20220208012559.1121729-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jacob jun Pan <jacob.jun.pan@intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Christoph Hellwig <hch@lst.de>
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

The aux-domain related callbacks are not called in the tree. Remove them
to avoid dead code.

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 include/linux/intel-iommu.h   |  17 --
 drivers/iommu/intel/debugfs.c |   3 +-
 drivers/iommu/intel/iommu.c   | 309 +---------------------------------
 3 files changed, 3 insertions(+), 326 deletions(-)

diff --git a/include/linux/intel-iommu.h b/include/linux/intel-iommu.h
index beaacb589abd..5cfda90b2cca 100644
--- a/include/linux/intel-iommu.h
+++ b/include/linux/intel-iommu.h
@@ -542,7 +542,6 @@ struct dmar_domain {
 	u8 iommu_snooping: 1;		/* indicate snooping control feature */
 
 	struct list_head devices;	/* all devices' list */
-	struct list_head subdevices;	/* all subdevices' list */
 	struct iova_domain iovad;	/* iova's that belong to this domain */
 
 	struct dma_pte	*pgd;		/* virtual address */
@@ -557,11 +556,6 @@ struct dmar_domain {
 					   2 == 1GiB, 3 == 512GiB, 4 == 1TiB */
 	u64		max_addr;	/* maximum mapped address */
 
-	u32		default_pasid;	/*
-					 * The default pasid used for non-SVM
-					 * traffic on mediated devices.
-					 */
-
 	struct iommu_domain domain;	/* generic domain data structure for
 					   iommu core */
 };
@@ -614,21 +608,11 @@ struct intel_iommu {
 	void *perf_statistic;
 };
 
-/* Per subdevice private data */
-struct subdev_domain_info {
-	struct list_head link_phys;	/* link to phys device siblings */
-	struct list_head link_domain;	/* link to domain siblings */
-	struct device *pdev;		/* physical device derived from */
-	struct dmar_domain *domain;	/* aux-domain */
-	int users;			/* user count */
-};
-
 /* PCI domain-device relationship */
 struct device_domain_info {
 	struct list_head link;	/* link to domain siblings */
 	struct list_head global; /* link to global list */
 	struct list_head table;	/* link to pasid table */
-	struct list_head subdevices; /* subdevices sibling */
 	u32 segment;		/* PCI segment number */
 	u8 bus;			/* PCI bus number */
 	u8 devfn;		/* PCI devfn number */
@@ -639,7 +623,6 @@ struct device_domain_info {
 	u8 pri_enabled:1;
 	u8 ats_supported:1;
 	u8 ats_enabled:1;
-	u8 auxd_enabled:1;	/* Multiple domains per device */
 	u8 ats_qdep;
 	struct device *dev; /* it's NULL for PCIe-to-PCI bridge */
 	struct intel_iommu *iommu; /* IOMMU used by this device */
diff --git a/drivers/iommu/intel/debugfs.c b/drivers/iommu/intel/debugfs.c
index 62e23ff3c987..db7a0ca73626 100644
--- a/drivers/iommu/intel/debugfs.c
+++ b/drivers/iommu/intel/debugfs.c
@@ -351,8 +351,7 @@ static int show_device_domain_translation(struct device *dev, void *data)
 	if (!domain)
 		return 0;
 
-	seq_printf(m, "Device %s with pasid %d @0x%llx\n",
-		   dev_name(dev), domain->default_pasid,
+	seq_printf(m, "Device %s @0x%llx\n", dev_name(dev),
 		   (u64)virt_to_phys(domain->pgd));
 	seq_puts(m, "IOVA_PFN\t\tPML5E\t\t\tPML4E\t\t\tPDPE\t\t\tPDE\t\t\tPTE\n");
 
diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index 4f9d95067c8f..2b5f4e57a8bb 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -1573,18 +1573,6 @@ static void domain_update_iotlb(struct dmar_domain *domain)
 			break;
 		}
 
-	if (!has_iotlb_device) {
-		struct subdev_domain_info *sinfo;
-
-		list_for_each_entry(sinfo, &domain->subdevices, link_domain) {
-			info = get_domain_info(sinfo->pdev);
-			if (info && info->ats_enabled) {
-				has_iotlb_device = true;
-				break;
-			}
-		}
-	}
-
 	domain->has_iotlb_device = has_iotlb_device;
 }
 
@@ -1682,7 +1670,6 @@ static void iommu_flush_dev_iotlb(struct dmar_domain *domain,
 {
 	unsigned long flags;
 	struct device_domain_info *info;
-	struct subdev_domain_info *sinfo;
 
 	if (!domain->has_iotlb_device)
 		return;
@@ -1691,27 +1678,9 @@ static void iommu_flush_dev_iotlb(struct dmar_domain *domain,
 	list_for_each_entry(info, &domain->devices, link)
 		__iommu_flush_dev_iotlb(info, addr, mask);
 
-	list_for_each_entry(sinfo, &domain->subdevices, link_domain) {
-		info = get_domain_info(sinfo->pdev);
-		__iommu_flush_dev_iotlb(info, addr, mask);
-	}
 	spin_unlock_irqrestore(&device_domain_lock, flags);
 }
 
-static void domain_flush_piotlb(struct intel_iommu *iommu,
-				struct dmar_domain *domain,
-				u64 addr, unsigned long npages, bool ih)
-{
-	u16 did = domain->iommu_did[iommu->seq_id];
-
-	if (domain->default_pasid)
-		qi_flush_piotlb(iommu, did, domain->default_pasid,
-				addr, npages, ih);
-
-	if (!list_empty(&domain->devices))
-		qi_flush_piotlb(iommu, did, PASID_RID2PASID, addr, npages, ih);
-}
-
 static void iommu_flush_iotlb_psi(struct intel_iommu *iommu,
 				  struct dmar_domain *domain,
 				  unsigned long pfn, unsigned int pages,
@@ -1727,7 +1696,7 @@ static void iommu_flush_iotlb_psi(struct intel_iommu *iommu,
 		ih = 1 << 6;
 
 	if (domain_use_first_level(domain)) {
-		domain_flush_piotlb(iommu, domain, addr, pages, ih);
+		qi_flush_piotlb(iommu, did, PASID_RID2PASID, addr, pages, ih);
 	} else {
 		/*
 		 * Fallback to domain selective flush if no PSI support or
@@ -1776,7 +1745,7 @@ static void intel_flush_iotlb_all(struct iommu_domain *domain)
 		u16 did = dmar_domain->iommu_did[iommu->seq_id];
 
 		if (domain_use_first_level(dmar_domain))
-			domain_flush_piotlb(iommu, dmar_domain, 0, -1, 0);
+			qi_flush_piotlb(iommu, did, PASID_RID2PASID, 0, -1, 0);
 		else
 			iommu->flush.flush_iotlb(iommu, did, 0, 0,
 						 DMA_TLB_DSI_FLUSH);
@@ -1983,7 +1952,6 @@ static struct dmar_domain *alloc_domain(unsigned int type)
 		domain->flags |= DOMAIN_FLAG_USE_FIRST_LEVEL;
 	domain->has_iotlb_device = false;
 	INIT_LIST_HEAD(&domain->devices);
-	INIT_LIST_HEAD(&domain->subdevices);
 
 	return domain;
 }
@@ -2676,8 +2644,6 @@ static struct dmar_domain *dmar_insert_one_dev_info(struct intel_iommu *iommu,
 	info->domain = domain;
 	info->iommu = iommu;
 	info->pasid_table = NULL;
-	info->auxd_enabled = 0;
-	INIT_LIST_HEAD(&info->subdevices);
 
 	if (dev && dev_is_pci(dev)) {
 		struct pci_dev *pdev = to_pci_dev(info->dev);
@@ -4637,183 +4603,6 @@ static void intel_iommu_domain_free(struct iommu_domain *domain)
 		domain_exit(to_dmar_domain(domain));
 }
 
-/*
- * Check whether a @domain could be attached to the @dev through the
- * aux-domain attach/detach APIs.
- */
-static inline bool
-is_aux_domain(struct device *dev, struct iommu_domain *domain)
-{
-	struct device_domain_info *info = get_domain_info(dev);
-
-	return info && info->auxd_enabled &&
-			domain->type == IOMMU_DOMAIN_UNMANAGED;
-}
-
-static inline struct subdev_domain_info *
-lookup_subdev_info(struct dmar_domain *domain, struct device *dev)
-{
-	struct subdev_domain_info *sinfo;
-
-	if (!list_empty(&domain->subdevices)) {
-		list_for_each_entry(sinfo, &domain->subdevices, link_domain) {
-			if (sinfo->pdev == dev)
-				return sinfo;
-		}
-	}
-
-	return NULL;
-}
-
-static int auxiliary_link_device(struct dmar_domain *domain,
-				 struct device *dev)
-{
-	struct device_domain_info *info = get_domain_info(dev);
-	struct subdev_domain_info *sinfo = lookup_subdev_info(domain, dev);
-
-	assert_spin_locked(&device_domain_lock);
-	if (WARN_ON(!info))
-		return -EINVAL;
-
-	if (!sinfo) {
-		sinfo = kzalloc(sizeof(*sinfo), GFP_ATOMIC);
-		if (!sinfo)
-			return -ENOMEM;
-		sinfo->domain = domain;
-		sinfo->pdev = dev;
-		list_add(&sinfo->link_phys, &info->subdevices);
-		list_add(&sinfo->link_domain, &domain->subdevices);
-	}
-
-	return ++sinfo->users;
-}
-
-static int auxiliary_unlink_device(struct dmar_domain *domain,
-				   struct device *dev)
-{
-	struct device_domain_info *info = get_domain_info(dev);
-	struct subdev_domain_info *sinfo = lookup_subdev_info(domain, dev);
-	int ret;
-
-	assert_spin_locked(&device_domain_lock);
-	if (WARN_ON(!info || !sinfo || sinfo->users <= 0))
-		return -EINVAL;
-
-	ret = --sinfo->users;
-	if (!ret) {
-		list_del(&sinfo->link_phys);
-		list_del(&sinfo->link_domain);
-		kfree(sinfo);
-	}
-
-	return ret;
-}
-
-static int aux_domain_add_dev(struct dmar_domain *domain,
-			      struct device *dev)
-{
-	int ret;
-	unsigned long flags;
-	struct intel_iommu *iommu;
-
-	iommu = device_to_iommu(dev, NULL, NULL);
-	if (!iommu)
-		return -ENODEV;
-
-	if (domain->default_pasid <= 0) {
-		u32 pasid;
-
-		/* No private data needed for the default pasid */
-		pasid = ioasid_alloc(NULL, PASID_MIN,
-				     pci_max_pasids(to_pci_dev(dev)) - 1,
-				     NULL);
-		if (pasid == INVALID_IOASID) {
-			pr_err("Can't allocate default pasid\n");
-			return -ENODEV;
-		}
-		domain->default_pasid = pasid;
-	}
-
-	spin_lock_irqsave(&device_domain_lock, flags);
-	ret = auxiliary_link_device(domain, dev);
-	if (ret <= 0)
-		goto link_failed;
-
-	/*
-	 * Subdevices from the same physical device can be attached to the
-	 * same domain. For such cases, only the first subdevice attachment
-	 * needs to go through the full steps in this function. So if ret >
-	 * 1, just goto out.
-	 */
-	if (ret > 1)
-		goto out;
-
-	/*
-	 * iommu->lock must be held to attach domain to iommu and setup the
-	 * pasid entry for second level translation.
-	 */
-	spin_lock(&iommu->lock);
-	ret = domain_attach_iommu(domain, iommu);
-	if (ret)
-		goto attach_failed;
-
-	/* Setup the PASID entry for mediated devices: */
-	if (domain_use_first_level(domain))
-		ret = domain_setup_first_level(iommu, domain, dev,
-					       domain->default_pasid);
-	else
-		ret = intel_pasid_setup_second_level(iommu, domain, dev,
-						     domain->default_pasid);
-	if (ret)
-		goto table_failed;
-
-	spin_unlock(&iommu->lock);
-out:
-	spin_unlock_irqrestore(&device_domain_lock, flags);
-
-	return 0;
-
-table_failed:
-	domain_detach_iommu(domain, iommu);
-attach_failed:
-	spin_unlock(&iommu->lock);
-	auxiliary_unlink_device(domain, dev);
-link_failed:
-	spin_unlock_irqrestore(&device_domain_lock, flags);
-	if (list_empty(&domain->subdevices) && domain->default_pasid > 0)
-		ioasid_put(domain->default_pasid);
-
-	return ret;
-}
-
-static void aux_domain_remove_dev(struct dmar_domain *domain,
-				  struct device *dev)
-{
-	struct device_domain_info *info;
-	struct intel_iommu *iommu;
-	unsigned long flags;
-
-	if (!is_aux_domain(dev, &domain->domain))
-		return;
-
-	spin_lock_irqsave(&device_domain_lock, flags);
-	info = get_domain_info(dev);
-	iommu = info->iommu;
-
-	if (!auxiliary_unlink_device(domain, dev)) {
-		spin_lock(&iommu->lock);
-		intel_pasid_tear_down_entry(iommu, dev,
-					    domain->default_pasid, false);
-		domain_detach_iommu(domain, iommu);
-		spin_unlock(&iommu->lock);
-	}
-
-	spin_unlock_irqrestore(&device_domain_lock, flags);
-
-	if (list_empty(&domain->subdevices) && domain->default_pasid > 0)
-		ioasid_put(domain->default_pasid);
-}
-
 static int prepare_domain_attach_device(struct iommu_domain *domain,
 					struct device *dev)
 {
@@ -4866,9 +4655,6 @@ static int intel_iommu_attach_device(struct iommu_domain *domain,
 		return -EPERM;
 	}
 
-	if (is_aux_domain(dev, domain))
-		return -EPERM;
-
 	/* normally dev is not mapped */
 	if (unlikely(domain_context_mapped(dev))) {
 		struct dmar_domain *old_domain;
@@ -4885,33 +4671,12 @@ static int intel_iommu_attach_device(struct iommu_domain *domain,
 	return domain_add_dev_info(to_dmar_domain(domain), dev);
 }
 
-static int intel_iommu_aux_attach_device(struct iommu_domain *domain,
-					 struct device *dev)
-{
-	int ret;
-
-	if (!is_aux_domain(dev, domain))
-		return -EPERM;
-
-	ret = prepare_domain_attach_device(domain, dev);
-	if (ret)
-		return ret;
-
-	return aux_domain_add_dev(to_dmar_domain(domain), dev);
-}
-
 static void intel_iommu_detach_device(struct iommu_domain *domain,
 				      struct device *dev)
 {
 	dmar_remove_one_dev_info(dev);
 }
 
-static void intel_iommu_aux_detach_device(struct iommu_domain *domain,
-					  struct device *dev)
-{
-	aux_domain_remove_dev(to_dmar_domain(domain), dev);
-}
-
 static int intel_iommu_map(struct iommu_domain *domain,
 			   unsigned long iova, phys_addr_t hpa,
 			   size_t size, int iommu_prot, gfp_t gfp)
@@ -5205,46 +4970,6 @@ static struct iommu_group *intel_iommu_device_group(struct device *dev)
 	return generic_device_group(dev);
 }
 
-static int intel_iommu_enable_auxd(struct device *dev)
-{
-	struct device_domain_info *info;
-	struct intel_iommu *iommu;
-	unsigned long flags;
-	int ret;
-
-	iommu = device_to_iommu(dev, NULL, NULL);
-	if (!iommu || dmar_disabled)
-		return -EINVAL;
-
-	if (!sm_supported(iommu) || !pasid_supported(iommu))
-		return -EINVAL;
-
-	ret = intel_iommu_enable_pasid(iommu, dev);
-	if (ret)
-		return -ENODEV;
-
-	spin_lock_irqsave(&device_domain_lock, flags);
-	info = get_domain_info(dev);
-	info->auxd_enabled = 1;
-	spin_unlock_irqrestore(&device_domain_lock, flags);
-
-	return 0;
-}
-
-static int intel_iommu_disable_auxd(struct device *dev)
-{
-	struct device_domain_info *info;
-	unsigned long flags;
-
-	spin_lock_irqsave(&device_domain_lock, flags);
-	info = get_domain_info(dev);
-	if (!WARN_ON(!info))
-		info->auxd_enabled = 0;
-	spin_unlock_irqrestore(&device_domain_lock, flags);
-
-	return 0;
-}
-
 static int intel_iommu_enable_sva(struct device *dev)
 {
 	struct device_domain_info *info = get_domain_info(dev);
@@ -5301,9 +5026,6 @@ static int
 intel_iommu_dev_enable_feat(struct device *dev, enum iommu_dev_features feat)
 {
 	switch (feat) {
-	case IOMMU_DEV_FEAT_AUX:
-		return intel_iommu_enable_auxd(dev);
-
 	case IOMMU_DEV_FEAT_IOPF:
 		return intel_iommu_enable_iopf(dev);
 
@@ -5319,9 +5041,6 @@ static int
 intel_iommu_dev_disable_feat(struct device *dev, enum iommu_dev_features feat)
 {
 	switch (feat) {
-	case IOMMU_DEV_FEAT_AUX:
-		return intel_iommu_disable_auxd(dev);
-
 	case IOMMU_DEV_FEAT_IOPF:
 		return 0;
 
@@ -5333,26 +5052,6 @@ intel_iommu_dev_disable_feat(struct device *dev, enum iommu_dev_features feat)
 	}
 }
 
-static bool
-intel_iommu_dev_feat_enabled(struct device *dev, enum iommu_dev_features feat)
-{
-	struct device_domain_info *info = get_domain_info(dev);
-
-	if (feat == IOMMU_DEV_FEAT_AUX)
-		return scalable_mode_support() && info && info->auxd_enabled;
-
-	return false;
-}
-
-static int
-intel_iommu_aux_get_pasid(struct iommu_domain *domain, struct device *dev)
-{
-	struct dmar_domain *dmar_domain = to_dmar_domain(domain);
-
-	return dmar_domain->default_pasid > 0 ?
-			dmar_domain->default_pasid : -EINVAL;
-}
-
 static bool intel_iommu_is_attach_deferred(struct iommu_domain *domain,
 					   struct device *dev)
 {
@@ -5397,9 +5096,6 @@ const struct iommu_ops intel_iommu_ops = {
 	.domain_free		= intel_iommu_domain_free,
 	.attach_dev		= intel_iommu_attach_device,
 	.detach_dev		= intel_iommu_detach_device,
-	.aux_attach_dev		= intel_iommu_aux_attach_device,
-	.aux_detach_dev		= intel_iommu_aux_detach_device,
-	.aux_get_pasid		= intel_iommu_aux_get_pasid,
 	.map_pages		= intel_iommu_map_pages,
 	.unmap_pages		= intel_iommu_unmap_pages,
 	.iotlb_sync_map		= intel_iommu_iotlb_sync_map,
@@ -5412,7 +5108,6 @@ const struct iommu_ops intel_iommu_ops = {
 	.get_resv_regions	= intel_iommu_get_resv_regions,
 	.put_resv_regions	= generic_iommu_put_resv_regions,
 	.device_group		= intel_iommu_device_group,
-	.dev_feat_enabled	= intel_iommu_dev_feat_enabled,
 	.dev_enable_feat	= intel_iommu_dev_enable_feat,
 	.dev_disable_feat	= intel_iommu_dev_disable_feat,
 	.is_attach_deferred	= intel_iommu_is_attach_deferred,
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
