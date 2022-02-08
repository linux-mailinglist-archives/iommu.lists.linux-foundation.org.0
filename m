Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id B55FE4ACDFA
	for <lists.iommu@lfdr.de>; Tue,  8 Feb 2022 02:27:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3D8EE40147;
	Tue,  8 Feb 2022 01:27:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IfNz8Tp2q-1O; Tue,  8 Feb 2022 01:27:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 3C08440180;
	Tue,  8 Feb 2022 01:27:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 15678C000B;
	Tue,  8 Feb 2022 01:27:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 77D6DC000B
 for <iommu@lists.linux-foundation.org>; Tue,  8 Feb 2022 01:27:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 58F0B403ED
 for <iommu@lists.linux-foundation.org>; Tue,  8 Feb 2022 01:27:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=intel.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tKM4i8bc_Rpf for <iommu@lists.linux-foundation.org>;
 Tue,  8 Feb 2022 01:27:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D1AC640400
 for <iommu@lists.linux-foundation.org>; Tue,  8 Feb 2022 01:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644283650; x=1675819650;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Yc2pZ2VOJRuge/G6emzQ/+fwzFgYy7PPu4NBL1mMAxU=;
 b=j+GXofRk5Nzq2YeOiDdQoKGpZJtV9HP99DNDHlGU4RwT2gq1WQ/JTfky
 t+z1vqfnkQ10KKiCBcGLzS9xil6Qk1LHZ2tFSr31Tpb6quz11rO6o7iYk
 gHX/eYDdzZKUWpCHDwdeghYhV4HFLmr31C6olAI+XTm80A9ptfm3E1vxi
 6l7bk7mp37s2TqoxwgsVbPa8i/9Pte/8OJ6FMNp0a36Cf54/7LQI0K+Zp
 gCYTJbGAe3HlYN57zoUEgPRxWEao3badG5DT619L+yjCpsPkp5YnUoDIL
 fbcpqkyjKA1M4tvye2j7fi/ZxsUxZZ2/9qaGndulzTatihuTLdbAk3Pcx g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10251"; a="228816224"
X-IronPort-AV: E=Sophos;i="5.88,351,1635231600"; d="scan'208";a="228816224"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 17:27:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,351,1635231600"; d="scan'208";a="677948801"
Received: from allen-box.sh.intel.com ([10.239.159.118])
 by fmsmga001.fm.intel.com with ESMTP; 07 Feb 2022 17:27:26 -0800
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Christoph Hellwig <hch@infradead.org>, Ben Skeggs <bskeggs@redhat.com>,
 Kevin Tian <kevin.tian@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v2 01/10] iommu/vt-d: Remove guest pasid related callbacks
Date: Tue,  8 Feb 2022 09:25:50 +0800
Message-Id: <20220208012559.1121729-2-baolu.lu@linux.intel.com>
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

The guest pasid related callbacks are not called in the tree. Remove them
to avoid dead code.

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 include/linux/intel-iommu.h |  10 --
 include/linux/intel-svm.h   |  12 ---
 drivers/iommu/intel/pasid.h |   4 -
 drivers/iommu/intel/iommu.c | 208 -----------------------------------
 drivers/iommu/intel/pasid.c | 161 ---------------------------
 drivers/iommu/intel/svm.c   | 209 ------------------------------------
 6 files changed, 604 deletions(-)

diff --git a/include/linux/intel-iommu.h b/include/linux/intel-iommu.h
index 69230fd695ea..beaacb589abd 100644
--- a/include/linux/intel-iommu.h
+++ b/include/linux/intel-iommu.h
@@ -525,12 +525,6 @@ struct context_entry {
  */
 #define DOMAIN_FLAG_USE_FIRST_LEVEL		BIT(1)
 
-/*
- * Domain represents a virtual machine which demands iommu nested
- * translation mode support.
- */
-#define DOMAIN_FLAG_NESTING_MODE		BIT(2)
-
 struct dmar_domain {
 	int	nid;			/* node id */
 
@@ -765,9 +759,6 @@ struct intel_iommu *device_to_iommu(struct device *dev, u8 *bus, u8 *devfn);
 extern void intel_svm_check(struct intel_iommu *iommu);
 extern int intel_svm_enable_prq(struct intel_iommu *iommu);
 extern int intel_svm_finish_prq(struct intel_iommu *iommu);
-int intel_svm_bind_gpasid(struct iommu_domain *domain, struct device *dev,
-			  struct iommu_gpasid_bind_data *data);
-int intel_svm_unbind_gpasid(struct device *dev, u32 pasid);
 struct iommu_sva *intel_svm_bind(struct device *dev, struct mm_struct *mm,
 				 void *drvdata);
 void intel_svm_unbind(struct iommu_sva *handle);
@@ -795,7 +786,6 @@ struct intel_svm {
 
 	unsigned int flags;
 	u32 pasid;
-	int gpasid; /* In case that guest PASID is different from host PASID */
 	struct list_head devs;
 };
 #else
diff --git a/include/linux/intel-svm.h b/include/linux/intel-svm.h
index 1b73bab7eeff..b3b125b332aa 100644
--- a/include/linux/intel-svm.h
+++ b/include/linux/intel-svm.h
@@ -25,17 +25,5 @@
  * do such IOTLB flushes automatically.
  */
 #define SVM_FLAG_SUPERVISOR_MODE	BIT(0)
-/*
- * The SVM_FLAG_GUEST_MODE flag is used when a PASID bind is for guest
- * processes. Compared to the host bind, the primary differences are:
- * 1. mm life cycle management
- * 2. fault reporting
- */
-#define SVM_FLAG_GUEST_MODE		BIT(1)
-/*
- * The SVM_FLAG_GUEST_PASID flag is used when a guest has its own PASID space,
- * which requires guest and host PASID translation at both directions.
- */
-#define SVM_FLAG_GUEST_PASID		BIT(2)
 
 #endif /* __INTEL_SVM_H__ */
diff --git a/drivers/iommu/intel/pasid.h b/drivers/iommu/intel/pasid.h
index d5552e2c160d..ab4408c824a5 100644
--- a/drivers/iommu/intel/pasid.h
+++ b/drivers/iommu/intel/pasid.h
@@ -118,10 +118,6 @@ int intel_pasid_setup_second_level(struct intel_iommu *iommu,
 int intel_pasid_setup_pass_through(struct intel_iommu *iommu,
 				   struct dmar_domain *domain,
 				   struct device *dev, u32 pasid);
-int intel_pasid_setup_nested(struct intel_iommu *iommu,
-			     struct device *dev, pgd_t *pgd, u32 pasid,
-			     struct iommu_gpasid_bind_data_vtd *pasid_data,
-			     struct dmar_domain *domain, int addr_width);
 void intel_pasid_tear_down_entry(struct intel_iommu *iommu,
 				 struct device *dev, u32 pasid,
 				 bool fault_ignore);
diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index 92fea3fbbb11..4f9d95067c8f 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -4825,13 +4825,6 @@ static int prepare_domain_attach_device(struct iommu_domain *domain,
 	if (!iommu)
 		return -ENODEV;
 
-	if ((dmar_domain->flags & DOMAIN_FLAG_NESTING_MODE) &&
-	    !ecap_nest(iommu->ecap)) {
-		dev_err(dev, "%s: iommu not support nested translation\n",
-			iommu->name);
-		return -EINVAL;
-	}
-
 	/* check if this iommu agaw is sufficient for max mapped address */
 	addr_width = agaw_to_width(iommu->agaw);
 	if (addr_width > cap_mgaw(iommu->cap))
@@ -4919,185 +4912,6 @@ static void intel_iommu_aux_detach_device(struct iommu_domain *domain,
 	aux_domain_remove_dev(to_dmar_domain(domain), dev);
 }
 
-#ifdef CONFIG_INTEL_IOMMU_SVM
-/*
- * 2D array for converting and sanitizing IOMMU generic TLB granularity to
- * VT-d granularity. Invalidation is typically included in the unmap operation
- * as a result of DMA or VFIO unmap. However, for assigned devices guest
- * owns the first level page tables. Invalidations of translation caches in the
- * guest are trapped and passed down to the host.
- *
- * vIOMMU in the guest will only expose first level page tables, therefore
- * we do not support IOTLB granularity for request without PASID (second level).
- *
- * For example, to find the VT-d granularity encoding for IOTLB
- * type and page selective granularity within PASID:
- * X: indexed by iommu cache type
- * Y: indexed by enum iommu_inv_granularity
- * [IOMMU_CACHE_INV_TYPE_IOTLB][IOMMU_INV_GRANU_ADDR]
- */
-
-static const int
-inv_type_granu_table[IOMMU_CACHE_INV_TYPE_NR][IOMMU_INV_GRANU_NR] = {
-	/*
-	 * PASID based IOTLB invalidation: PASID selective (per PASID),
-	 * page selective (address granularity)
-	 */
-	{-EINVAL, QI_GRAN_NONG_PASID, QI_GRAN_PSI_PASID},
-	/* PASID based dev TLBs */
-	{-EINVAL, -EINVAL, QI_DEV_IOTLB_GRAN_PASID_SEL},
-	/* PASID cache */
-	{-EINVAL, -EINVAL, -EINVAL}
-};
-
-static inline int to_vtd_granularity(int type, int granu)
-{
-	return inv_type_granu_table[type][granu];
-}
-
-static inline u64 to_vtd_size(u64 granu_size, u64 nr_granules)
-{
-	u64 nr_pages = (granu_size * nr_granules) >> VTD_PAGE_SHIFT;
-
-	/* VT-d size is encoded as 2^size of 4K pages, 0 for 4k, 9 for 2MB, etc.
-	 * IOMMU cache invalidate API passes granu_size in bytes, and number of
-	 * granu size in contiguous memory.
-	 */
-	return order_base_2(nr_pages);
-}
-
-static int
-intel_iommu_sva_invalidate(struct iommu_domain *domain, struct device *dev,
-			   struct iommu_cache_invalidate_info *inv_info)
-{
-	struct dmar_domain *dmar_domain = to_dmar_domain(domain);
-	struct device_domain_info *info;
-	struct intel_iommu *iommu;
-	unsigned long flags;
-	int cache_type;
-	u8 bus, devfn;
-	u16 did, sid;
-	int ret = 0;
-	u64 size = 0;
-
-	if (!inv_info || !dmar_domain)
-		return -EINVAL;
-
-	if (!dev || !dev_is_pci(dev))
-		return -ENODEV;
-
-	iommu = device_to_iommu(dev, &bus, &devfn);
-	if (!iommu)
-		return -ENODEV;
-
-	if (!(dmar_domain->flags & DOMAIN_FLAG_NESTING_MODE))
-		return -EINVAL;
-
-	spin_lock_irqsave(&device_domain_lock, flags);
-	spin_lock(&iommu->lock);
-	info = get_domain_info(dev);
-	if (!info) {
-		ret = -EINVAL;
-		goto out_unlock;
-	}
-	did = dmar_domain->iommu_did[iommu->seq_id];
-	sid = PCI_DEVID(bus, devfn);
-
-	/* Size is only valid in address selective invalidation */
-	if (inv_info->granularity == IOMMU_INV_GRANU_ADDR)
-		size = to_vtd_size(inv_info->granu.addr_info.granule_size,
-				   inv_info->granu.addr_info.nb_granules);
-
-	for_each_set_bit(cache_type,
-			 (unsigned long *)&inv_info->cache,
-			 IOMMU_CACHE_INV_TYPE_NR) {
-		int granu = 0;
-		u64 pasid = 0;
-		u64 addr = 0;
-
-		granu = to_vtd_granularity(cache_type, inv_info->granularity);
-		if (granu == -EINVAL) {
-			pr_err_ratelimited("Invalid cache type and granu combination %d/%d\n",
-					   cache_type, inv_info->granularity);
-			break;
-		}
-
-		/*
-		 * PASID is stored in different locations based on the
-		 * granularity.
-		 */
-		if (inv_info->granularity == IOMMU_INV_GRANU_PASID &&
-		    (inv_info->granu.pasid_info.flags & IOMMU_INV_PASID_FLAGS_PASID))
-			pasid = inv_info->granu.pasid_info.pasid;
-		else if (inv_info->granularity == IOMMU_INV_GRANU_ADDR &&
-			 (inv_info->granu.addr_info.flags & IOMMU_INV_ADDR_FLAGS_PASID))
-			pasid = inv_info->granu.addr_info.pasid;
-
-		switch (BIT(cache_type)) {
-		case IOMMU_CACHE_INV_TYPE_IOTLB:
-			/* HW will ignore LSB bits based on address mask */
-			if (inv_info->granularity == IOMMU_INV_GRANU_ADDR &&
-			    size &&
-			    (inv_info->granu.addr_info.addr & ((BIT(VTD_PAGE_SHIFT + size)) - 1))) {
-				pr_err_ratelimited("User address not aligned, 0x%llx, size order %llu\n",
-						   inv_info->granu.addr_info.addr, size);
-			}
-
-			/*
-			 * If granu is PASID-selective, address is ignored.
-			 * We use npages = -1 to indicate that.
-			 */
-			qi_flush_piotlb(iommu, did, pasid,
-					mm_to_dma_pfn(inv_info->granu.addr_info.addr),
-					(granu == QI_GRAN_NONG_PASID) ? -1 : 1 << size,
-					inv_info->granu.addr_info.flags & IOMMU_INV_ADDR_FLAGS_LEAF);
-
-			if (!info->ats_enabled)
-				break;
-			/*
-			 * Always flush device IOTLB if ATS is enabled. vIOMMU
-			 * in the guest may assume IOTLB flush is inclusive,
-			 * which is more efficient.
-			 */
-			fallthrough;
-		case IOMMU_CACHE_INV_TYPE_DEV_IOTLB:
-			/*
-			 * PASID based device TLB invalidation does not support
-			 * IOMMU_INV_GRANU_PASID granularity but only supports
-			 * IOMMU_INV_GRANU_ADDR.
-			 * The equivalent of that is we set the size to be the
-			 * entire range of 64 bit. User only provides PASID info
-			 * without address info. So we set addr to 0.
-			 */
-			if (inv_info->granularity == IOMMU_INV_GRANU_PASID) {
-				size = 64 - VTD_PAGE_SHIFT;
-				addr = 0;
-			} else if (inv_info->granularity == IOMMU_INV_GRANU_ADDR) {
-				addr = inv_info->granu.addr_info.addr;
-			}
-
-			if (info->ats_enabled)
-				qi_flush_dev_iotlb_pasid(iommu, sid,
-						info->pfsid, pasid,
-						info->ats_qdep, addr,
-						size);
-			else
-				pr_warn_ratelimited("Passdown device IOTLB flush w/o ATS!\n");
-			break;
-		default:
-			dev_err_ratelimited(dev, "Unsupported IOMMU invalidation type %d\n",
-					    cache_type);
-			ret = -EINVAL;
-		}
-	}
-out_unlock:
-	spin_unlock(&iommu->lock);
-	spin_unlock_irqrestore(&device_domain_lock, flags);
-
-	return ret;
-}
-#endif
-
 static int intel_iommu_map(struct iommu_domain *domain,
 			   unsigned long iova, phys_addr_t hpa,
 			   size_t size, int iommu_prot, gfp_t gfp)
@@ -5545,24 +5359,6 @@ static bool intel_iommu_is_attach_deferred(struct iommu_domain *domain,
 	return attach_deferred(dev);
 }
 
-static int
-intel_iommu_enable_nesting(struct iommu_domain *domain)
-{
-	struct dmar_domain *dmar_domain = to_dmar_domain(domain);
-	unsigned long flags;
-	int ret = -ENODEV;
-
-	spin_lock_irqsave(&device_domain_lock, flags);
-	if (list_empty(&dmar_domain->devices)) {
-		dmar_domain->flags |= DOMAIN_FLAG_NESTING_MODE;
-		dmar_domain->flags &= ~DOMAIN_FLAG_USE_FIRST_LEVEL;
-		ret = 0;
-	}
-	spin_unlock_irqrestore(&device_domain_lock, flags);
-
-	return ret;
-}
-
 /*
  * Check that the device does not live on an external facing PCI port that is
  * marked as untrusted. Such devices should not be able to apply quirks and
@@ -5599,7 +5395,6 @@ const struct iommu_ops intel_iommu_ops = {
 	.capable		= intel_iommu_capable,
 	.domain_alloc		= intel_iommu_domain_alloc,
 	.domain_free		= intel_iommu_domain_free,
-	.enable_nesting		= intel_iommu_enable_nesting,
 	.attach_dev		= intel_iommu_attach_device,
 	.detach_dev		= intel_iommu_detach_device,
 	.aux_attach_dev		= intel_iommu_aux_attach_device,
@@ -5624,9 +5419,6 @@ const struct iommu_ops intel_iommu_ops = {
 	.def_domain_type	= device_def_domain_type,
 	.pgsize_bitmap		= SZ_4K,
 #ifdef CONFIG_INTEL_IOMMU_SVM
-	.cache_invalidate	= intel_iommu_sva_invalidate,
-	.sva_bind_gpasid	= intel_svm_bind_gpasid,
-	.sva_unbind_gpasid	= intel_svm_unbind_gpasid,
 	.sva_bind		= intel_svm_bind,
 	.sva_unbind		= intel_svm_unbind,
 	.sva_get_pasid		= intel_svm_get_pasid,
diff --git a/drivers/iommu/intel/pasid.c b/drivers/iommu/intel/pasid.c
index 07c390aed1fe..10fb82ea467d 100644
--- a/drivers/iommu/intel/pasid.c
+++ b/drivers/iommu/intel/pasid.c
@@ -762,164 +762,3 @@ int intel_pasid_setup_pass_through(struct intel_iommu *iommu,
 
 	return 0;
 }
-
-static int
-intel_pasid_setup_bind_data(struct intel_iommu *iommu, struct pasid_entry *pte,
-			    struct iommu_gpasid_bind_data_vtd *pasid_data)
-{
-	/*
-	 * Not all guest PASID table entry fields are passed down during bind,
-	 * here we only set up the ones that are dependent on guest settings.
-	 * Execution related bits such as NXE, SMEP are not supported.
-	 * Other fields, such as snoop related, are set based on host needs
-	 * regardless of guest settings.
-	 */
-	if (pasid_data->flags & IOMMU_SVA_VTD_GPASID_SRE) {
-		if (!ecap_srs(iommu->ecap)) {
-			pr_err_ratelimited("No supervisor request support on %s\n",
-					   iommu->name);
-			return -EINVAL;
-		}
-		pasid_set_sre(pte);
-		/* Enable write protect WP if guest requested */
-		if (pasid_data->flags & IOMMU_SVA_VTD_GPASID_WPE)
-			pasid_set_wpe(pte);
-	}
-
-	if (pasid_data->flags & IOMMU_SVA_VTD_GPASID_EAFE) {
-		if (!ecap_eafs(iommu->ecap)) {
-			pr_err_ratelimited("No extended access flag support on %s\n",
-					   iommu->name);
-			return -EINVAL;
-		}
-		pasid_set_eafe(pte);
-	}
-
-	/*
-	 * Memory type is only applicable to devices inside processor coherent
-	 * domain. Will add MTS support once coherent devices are available.
-	 */
-	if (pasid_data->flags & IOMMU_SVA_VTD_GPASID_MTS_MASK) {
-		pr_warn_ratelimited("No memory type support %s\n",
-				    iommu->name);
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
-/**
- * intel_pasid_setup_nested() - Set up PASID entry for nested translation.
- * This could be used for guest shared virtual address. In this case, the
- * first level page tables are used for GVA-GPA translation in the guest,
- * second level page tables are used for GPA-HPA translation.
- *
- * @iommu:      IOMMU which the device belong to
- * @dev:        Device to be set up for translation
- * @gpgd:       FLPTPTR: First Level Page translation pointer in GPA
- * @pasid:      PASID to be programmed in the device PASID table
- * @pasid_data: Additional PASID info from the guest bind request
- * @domain:     Domain info for setting up second level page tables
- * @addr_width: Address width of the first level (guest)
- */
-int intel_pasid_setup_nested(struct intel_iommu *iommu, struct device *dev,
-			     pgd_t *gpgd, u32 pasid,
-			     struct iommu_gpasid_bind_data_vtd *pasid_data,
-			     struct dmar_domain *domain, int addr_width)
-{
-	struct pasid_entry *pte;
-	struct dma_pte *pgd;
-	int ret = 0;
-	u64 pgd_val;
-	int agaw;
-	u16 did;
-
-	if (!ecap_nest(iommu->ecap)) {
-		pr_err_ratelimited("IOMMU: %s: No nested translation support\n",
-				   iommu->name);
-		return -EINVAL;
-	}
-
-	if (!(domain->flags & DOMAIN_FLAG_NESTING_MODE)) {
-		pr_err_ratelimited("Domain is not in nesting mode, %x\n",
-				   domain->flags);
-		return -EINVAL;
-	}
-
-	pte = intel_pasid_get_entry(dev, pasid);
-	if (WARN_ON(!pte))
-		return -EINVAL;
-
-	/*
-	 * Caller must ensure PASID entry is not in use, i.e. not bind the
-	 * same PASID to the same device twice.
-	 */
-	if (pasid_pte_is_present(pte))
-		return -EBUSY;
-
-	pasid_clear_entry(pte);
-
-	/* Sanity checking performed by caller to make sure address
-	 * width matching in two dimensions:
-	 * 1. CPU vs. IOMMU
-	 * 2. Guest vs. Host.
-	 */
-	switch (addr_width) {
-#ifdef CONFIG_X86
-	case ADDR_WIDTH_5LEVEL:
-		if (!cpu_feature_enabled(X86_FEATURE_LA57) ||
-		    !cap_5lp_support(iommu->cap)) {
-			dev_err_ratelimited(dev,
-					    "5-level paging not supported\n");
-			return -EINVAL;
-		}
-
-		pasid_set_flpm(pte, 1);
-		break;
-#endif
-	case ADDR_WIDTH_4LEVEL:
-		pasid_set_flpm(pte, 0);
-		break;
-	default:
-		dev_err_ratelimited(dev, "Invalid guest address width %d\n",
-				    addr_width);
-		return -EINVAL;
-	}
-
-	/* First level PGD is in GPA, must be supported by the second level */
-	if ((uintptr_t)gpgd > domain->max_addr) {
-		dev_err_ratelimited(dev,
-				    "Guest PGD %lx not supported, max %llx\n",
-				    (uintptr_t)gpgd, domain->max_addr);
-		return -EINVAL;
-	}
-	pasid_set_flptr(pte, (uintptr_t)gpgd);
-
-	ret = intel_pasid_setup_bind_data(iommu, pte, pasid_data);
-	if (ret)
-		return ret;
-
-	/* Setup the second level based on the given domain */
-	pgd = domain->pgd;
-
-	agaw = iommu_skip_agaw(domain, iommu, &pgd);
-	if (agaw < 0) {
-		dev_err_ratelimited(dev, "Invalid domain page table\n");
-		return -EINVAL;
-	}
-	pgd_val = virt_to_phys(pgd);
-	pasid_set_slptr(pte, pgd_val);
-	pasid_set_fault_enable(pte);
-
-	did = domain->iommu_did[iommu->seq_id];
-	pasid_set_domain_id(pte, did);
-
-	pasid_set_address_width(pte, agaw);
-	pasid_set_page_snoop(pte, !!ecap_smpwc(iommu->ecap));
-
-	pasid_set_translation_type(pte, PASID_ENTRY_PGTT_NESTED);
-	pasid_set_present(pte);
-	pasid_flush_caches(iommu, pte, pasid, did);
-
-	return ret;
-}
diff --git a/drivers/iommu/intel/svm.c b/drivers/iommu/intel/svm.c
index 5b5d69b04fcc..d04c83dd3a58 100644
--- a/drivers/iommu/intel/svm.c
+++ b/drivers/iommu/intel/svm.c
@@ -318,193 +318,6 @@ static int pasid_to_svm_sdev(struct device *dev, unsigned int pasid,
 	return 0;
 }
 
-int intel_svm_bind_gpasid(struct iommu_domain *domain, struct device *dev,
-			  struct iommu_gpasid_bind_data *data)
-{
-	struct intel_iommu *iommu = device_to_iommu(dev, NULL, NULL);
-	struct intel_svm_dev *sdev = NULL;
-	struct dmar_domain *dmar_domain;
-	struct device_domain_info *info;
-	struct intel_svm *svm = NULL;
-	unsigned long iflags;
-	int ret = 0;
-
-	if (WARN_ON(!iommu) || !data)
-		return -EINVAL;
-
-	if (data->format != IOMMU_PASID_FORMAT_INTEL_VTD)
-		return -EINVAL;
-
-	/* IOMMU core ensures argsz is more than the start of the union */
-	if (data->argsz < offsetofend(struct iommu_gpasid_bind_data, vendor.vtd))
-		return -EINVAL;
-
-	/* Make sure no undefined flags are used in vendor data */
-	if (data->vendor.vtd.flags & ~(IOMMU_SVA_VTD_GPASID_LAST - 1))
-		return -EINVAL;
-
-	if (!dev_is_pci(dev))
-		return -ENOTSUPP;
-
-	/* VT-d supports devices with full 20 bit PASIDs only */
-	if (pci_max_pasids(to_pci_dev(dev)) != PASID_MAX)
-		return -EINVAL;
-
-	/*
-	 * We only check host PASID range, we have no knowledge to check
-	 * guest PASID range.
-	 */
-	if (data->hpasid <= 0 || data->hpasid >= PASID_MAX)
-		return -EINVAL;
-
-	info = get_domain_info(dev);
-	if (!info)
-		return -EINVAL;
-
-	dmar_domain = to_dmar_domain(domain);
-
-	mutex_lock(&pasid_mutex);
-	ret = pasid_to_svm_sdev(dev, data->hpasid, &svm, &sdev);
-	if (ret)
-		goto out;
-
-	if (sdev) {
-		/*
-		 * Do not allow multiple bindings of the same device-PASID since
-		 * there is only one SL page tables per PASID. We may revisit
-		 * once sharing PGD across domains are supported.
-		 */
-		dev_warn_ratelimited(dev, "Already bound with PASID %u\n",
-				     svm->pasid);
-		ret = -EBUSY;
-		goto out;
-	}
-
-	if (!svm) {
-		/* We come here when PASID has never been bond to a device. */
-		svm = kzalloc(sizeof(*svm), GFP_KERNEL);
-		if (!svm) {
-			ret = -ENOMEM;
-			goto out;
-		}
-		/* REVISIT: upper layer/VFIO can track host process that bind
-		 * the PASID. ioasid_set = mm might be sufficient for vfio to
-		 * check pasid VMM ownership. We can drop the following line
-		 * once VFIO and IOASID set check is in place.
-		 */
-		svm->mm = get_task_mm(current);
-		svm->pasid = data->hpasid;
-		if (data->flags & IOMMU_SVA_GPASID_VAL) {
-			svm->gpasid = data->gpasid;
-			svm->flags |= SVM_FLAG_GUEST_PASID;
-		}
-		pasid_private_add(data->hpasid, svm);
-		INIT_LIST_HEAD_RCU(&svm->devs);
-		mmput(svm->mm);
-	}
-	sdev = kzalloc(sizeof(*sdev), GFP_KERNEL);
-	if (!sdev) {
-		ret = -ENOMEM;
-		goto out;
-	}
-	sdev->dev = dev;
-	sdev->sid = PCI_DEVID(info->bus, info->devfn);
-	sdev->iommu = iommu;
-
-	/* Only count users if device has aux domains */
-	if (iommu_dev_feature_enabled(dev, IOMMU_DEV_FEAT_AUX))
-		sdev->users = 1;
-
-	/* Set up device context entry for PASID if not enabled already */
-	ret = intel_iommu_enable_pasid(iommu, sdev->dev);
-	if (ret) {
-		dev_err_ratelimited(dev, "Failed to enable PASID capability\n");
-		kfree(sdev);
-		goto out;
-	}
-
-	/*
-	 * PASID table is per device for better security. Therefore, for
-	 * each bind of a new device even with an existing PASID, we need to
-	 * call the nested mode setup function here.
-	 */
-	spin_lock_irqsave(&iommu->lock, iflags);
-	ret = intel_pasid_setup_nested(iommu, dev,
-				       (pgd_t *)(uintptr_t)data->gpgd,
-				       data->hpasid, &data->vendor.vtd, dmar_domain,
-				       data->addr_width);
-	spin_unlock_irqrestore(&iommu->lock, iflags);
-	if (ret) {
-		dev_err_ratelimited(dev, "Failed to set up PASID %llu in nested mode, Err %d\n",
-				    data->hpasid, ret);
-		/*
-		 * PASID entry should be in cleared state if nested mode
-		 * set up failed. So we only need to clear IOASID tracking
-		 * data such that free call will succeed.
-		 */
-		kfree(sdev);
-		goto out;
-	}
-
-	svm->flags |= SVM_FLAG_GUEST_MODE;
-
-	init_rcu_head(&sdev->rcu);
-	list_add_rcu(&sdev->list, &svm->devs);
- out:
-	if (!IS_ERR_OR_NULL(svm) && list_empty(&svm->devs)) {
-		pasid_private_remove(data->hpasid);
-		kfree(svm);
-	}
-
-	mutex_unlock(&pasid_mutex);
-	return ret;
-}
-
-int intel_svm_unbind_gpasid(struct device *dev, u32 pasid)
-{
-	struct intel_iommu *iommu = device_to_iommu(dev, NULL, NULL);
-	struct intel_svm_dev *sdev;
-	struct intel_svm *svm;
-	int ret;
-
-	if (WARN_ON(!iommu))
-		return -EINVAL;
-
-	mutex_lock(&pasid_mutex);
-	ret = pasid_to_svm_sdev(dev, pasid, &svm, &sdev);
-	if (ret)
-		goto out;
-
-	if (sdev) {
-		if (iommu_dev_feature_enabled(dev, IOMMU_DEV_FEAT_AUX))
-			sdev->users--;
-		if (!sdev->users) {
-			list_del_rcu(&sdev->list);
-			intel_pasid_tear_down_entry(iommu, dev,
-						    svm->pasid, false);
-			intel_svm_drain_prq(dev, svm->pasid);
-			kfree_rcu(sdev, rcu);
-
-			if (list_empty(&svm->devs)) {
-				/*
-				 * We do not free the IOASID here in that
-				 * IOMMU driver did not allocate it.
-				 * Unlike native SVM, IOASID for guest use was
-				 * allocated prior to the bind call.
-				 * In any case, if the free call comes before
-				 * the unbind, IOMMU driver will get notified
-				 * and perform cleanup.
-				 */
-				pasid_private_remove(pasid);
-				kfree(svm);
-			}
-		}
-	}
-out:
-	mutex_unlock(&pasid_mutex);
-	return ret;
-}
-
 static int intel_svm_alloc_pasid(struct device *dev, struct mm_struct *mm,
 				 unsigned int flags)
 {
@@ -1125,28 +938,6 @@ int intel_svm_page_response(struct device *dev,
 		goto out;
 	}
 
-	/*
-	 * For responses from userspace, need to make sure that the
-	 * pasid has been bound to its mm.
-	 */
-	if (svm->flags & SVM_FLAG_GUEST_MODE) {
-		struct mm_struct *mm;
-
-		mm = get_task_mm(current);
-		if (!mm) {
-			ret = -EINVAL;
-			goto out;
-		}
-
-		if (mm != svm->mm) {
-			ret = -ENODEV;
-			mmput(mm);
-			goto out;
-		}
-
-		mmput(mm);
-	}
-
 	/*
 	 * Per VT-d spec. v3.0 ch7.7, system software must respond
 	 * with page group response if private data is present (PDP)
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
