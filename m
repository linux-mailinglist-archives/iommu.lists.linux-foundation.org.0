Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id D87D11D5F0B
	for <lists.iommu@lfdr.de>; Sat, 16 May 2020 08:24:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 88921898C0;
	Sat, 16 May 2020 06:24:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vrq0+-u+n9Hh; Sat, 16 May 2020 06:24:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5D247898D4;
	Sat, 16 May 2020 06:24:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 483BFC016F;
	Sat, 16 May 2020 06:24:48 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 52E67C016F
 for <iommu@lists.linux-foundation.org>; Sat, 16 May 2020 06:24:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 42E1A87E41
 for <iommu@lists.linux-foundation.org>; Sat, 16 May 2020 06:24:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KEv0JKWoZYjd for <iommu@lists.linux-foundation.org>;
 Sat, 16 May 2020 06:24:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 6661687E6E
 for <iommu@lists.linux-foundation.org>; Sat, 16 May 2020 06:24:44 +0000 (UTC)
IronPort-SDR: hqtmTfUg7g+Rt7YA0k7TGIq61foxrtfE2S2neJvuOHfgK2WEjkkBqUwk7etaY9EDOPWwUk2kwb
 f0XfPbN/dNag==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2020 23:24:44 -0700
IronPort-SDR: x+zmeLMDzemXUV50bGekO303sXU3iUv3RJUpcV+hdIExCZ6v6HZAaBNBvcs+XW8pEh5nGe7c96
 B+cTCFRs2ZPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,398,1583222400"; d="scan'208";a="281442415"
Received: from allen-box.sh.intel.com ([10.239.159.139])
 by orsmga002.jf.intel.com with ESMTP; 15 May 2020 23:24:42 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH 06/18] iommu/vt-d: Add svm/sva invalidate function
Date: Sat, 16 May 2020 14:20:49 +0800
Message-Id: <20200516062101.29541-7-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200516062101.29541-1-baolu.lu@linux.intel.com>
References: <20200516062101.29541-1-baolu.lu@linux.intel.com>
Cc: iommu@lists.linux-foundation.org, Tom Murphy <murphyt7@tcd.ie>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

From: Jacob Pan <jacob.jun.pan@linux.intel.com>

When Shared Virtual Address (SVA) is enabled for a guest OS via
vIOMMU, we need to provide invalidation support at IOMMU API and driver
level. This patch adds Intel VT-d specific function to implement
iommu passdown invalidate API for shared virtual address.

The use case is for supporting caching structure invalidation
of assigned SVM capable devices. Emulated IOMMU exposes queue
invalidation capability and passes down all descriptors from the guest
to the physical IOMMU.

The assumption is that guest to host device ID mapping should be
resolved prior to calling IOMMU driver. Based on the device handle,
host IOMMU driver can replace certain fields before submit to the
invalidation queue.

Signed-off-by: Liu Yi L <yi.l.liu@intel.com>
Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/iommu/intel-iommu.c | 171 ++++++++++++++++++++++++++++++++++++
 1 file changed, 171 insertions(+)

diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
index f42c548f8421..627bb5093317 100644
--- a/drivers/iommu/intel-iommu.c
+++ b/drivers/iommu/intel-iommu.c
@@ -5242,6 +5242,176 @@ static void intel_iommu_aux_detach_device(struct iommu_domain *domain,
 	aux_domain_remove_dev(to_dmar_domain(domain), dev);
 }
 
+/*
+ * 2D array for converting and sanitizing IOMMU generic TLB granularity to
+ * VT-d granularity. Invalidation is typically included in the unmap operation
+ * as a result of DMA or VFIO unmap. However, for assigned devices guest
+ * owns the first level page tables. Invalidations of translation caches in the
+ * guest are trapped and passed down to the host.
+ *
+ * vIOMMU in the guest will only expose first level page tables, therefore
+ * we do not support IOTLB granularity for request without PASID (second level).
+ *
+ * For example, to find the VT-d granularity encoding for IOTLB
+ * type and page selective granularity within PASID:
+ * X: indexed by iommu cache type
+ * Y: indexed by enum iommu_inv_granularity
+ * [IOMMU_CACHE_INV_TYPE_IOTLB][IOMMU_INV_GRANU_ADDR]
+ */
+
+const static int
+inv_type_granu_table[IOMMU_CACHE_INV_TYPE_NR][IOMMU_INV_GRANU_NR] = {
+	/*
+	 * PASID based IOTLB invalidation: PASID selective (per PASID),
+	 * page selective (address granularity)
+	 */
+	{-EINVAL, QI_GRAN_NONG_PASID, QI_GRAN_PSI_PASID},
+	/* PASID based dev TLBs */
+	{-EINVAL, -EINVAL, QI_DEV_IOTLB_GRAN_PASID_SEL},
+	/* PASID cache */
+	{-EINVAL, -EINVAL, -EINVAL}
+};
+
+static inline int to_vtd_granularity(int type, int granu)
+{
+	return inv_type_granu_table[type][granu];
+}
+
+static inline u64 to_vtd_size(u64 granu_size, u64 nr_granules)
+{
+	u64 nr_pages = (granu_size * nr_granules) >> VTD_PAGE_SHIFT;
+
+	/* VT-d size is encoded as 2^size of 4K pages, 0 for 4k, 9 for 2MB, etc.
+	 * IOMMU cache invalidate API passes granu_size in bytes, and number of
+	 * granu size in contiguous memory.
+	 */
+	return order_base_2(nr_pages);
+}
+
+#ifdef CONFIG_INTEL_IOMMU_SVM
+static int
+intel_iommu_sva_invalidate(struct iommu_domain *domain, struct device *dev,
+			   struct iommu_cache_invalidate_info *inv_info)
+{
+	struct dmar_domain *dmar_domain = to_dmar_domain(domain);
+	struct device_domain_info *info;
+	struct intel_iommu *iommu;
+	unsigned long flags;
+	int cache_type;
+	u8 bus, devfn;
+	u16 did, sid;
+	int ret = 0;
+	u64 size = 0;
+
+	if (!inv_info || !dmar_domain ||
+	    inv_info->version != IOMMU_CACHE_INVALIDATE_INFO_VERSION_1)
+		return -EINVAL;
+
+	if (!dev || !dev_is_pci(dev))
+		return -ENODEV;
+
+	iommu = device_to_iommu(dev, &bus, &devfn);
+	if (!iommu)
+		return -ENODEV;
+
+	if (!(dmar_domain->flags & DOMAIN_FLAG_NESTING_MODE))
+		return -EINVAL;
+
+	spin_lock_irqsave(&device_domain_lock, flags);
+	spin_lock(&iommu->lock);
+	info = dev->archdata.iommu;
+	if (!info) {
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+	did = dmar_domain->iommu_did[iommu->seq_id];
+	sid = PCI_DEVID(bus, devfn);
+
+	/* Size is only valid in address selective invalidation */
+	if (inv_info->granularity != IOMMU_INV_GRANU_PASID)
+		size = to_vtd_size(inv_info->addr_info.granule_size,
+				   inv_info->addr_info.nb_granules);
+
+	for_each_set_bit(cache_type,
+			 (unsigned long *)&inv_info->cache,
+			 IOMMU_CACHE_INV_TYPE_NR) {
+		int granu = 0;
+		u64 pasid = 0;
+
+		granu = to_vtd_granularity(cache_type, inv_info->granularity);
+		if (granu == -EINVAL) {
+			pr_err_ratelimited("Invalid cache type and granu combination %d/%d\n",
+					   cache_type, inv_info->granularity);
+			break;
+		}
+
+		/*
+		 * PASID is stored in different locations based on the
+		 * granularity.
+		 */
+		if (inv_info->granularity == IOMMU_INV_GRANU_PASID &&
+		    (inv_info->pasid_info.flags & IOMMU_INV_PASID_FLAGS_PASID))
+			pasid = inv_info->pasid_info.pasid;
+		else if (inv_info->granularity == IOMMU_INV_GRANU_ADDR &&
+			 (inv_info->addr_info.flags & IOMMU_INV_ADDR_FLAGS_PASID))
+			pasid = inv_info->addr_info.pasid;
+
+		switch (BIT(cache_type)) {
+		case IOMMU_CACHE_INV_TYPE_IOTLB:
+			if (inv_info->granularity == IOMMU_INV_GRANU_ADDR &&
+			    size &&
+			    (inv_info->addr_info.addr & ((BIT(VTD_PAGE_SHIFT + size)) - 1))) {
+				pr_err_ratelimited("Address out of range, 0x%llx, size order %llu\n",
+						   inv_info->addr_info.addr, size);
+				ret = -ERANGE;
+				goto out_unlock;
+			}
+
+			/*
+			 * If granu is PASID-selective, address is ignored.
+			 * We use npages = -1 to indicate that.
+			 */
+			qi_flush_piotlb(iommu, did, pasid,
+					mm_to_dma_pfn(inv_info->addr_info.addr),
+					(granu == QI_GRAN_NONG_PASID) ? -1 : 1 << size,
+					inv_info->addr_info.flags & IOMMU_INV_ADDR_FLAGS_LEAF);
+
+			/*
+			 * Always flush device IOTLB if ATS is enabled. vIOMMU
+			 * in the guest may assume IOTLB flush is inclusive,
+			 * which is more efficient.
+			 */
+			if (info->ats_enabled)
+				qi_flush_dev_iotlb_pasid(iommu, sid,
+						info->pfsid, pasid,
+						info->ats_qdep,
+						inv_info->addr_info.addr,
+						size, granu);
+			break;
+		case IOMMU_CACHE_INV_TYPE_DEV_IOTLB:
+			if (info->ats_enabled)
+				qi_flush_dev_iotlb_pasid(iommu, sid,
+						info->pfsid, pasid,
+						info->ats_qdep,
+						inv_info->addr_info.addr,
+						size, granu);
+			else
+				pr_warn_ratelimited("Passdown device IOTLB flush w/o ATS!\n");
+			break;
+		default:
+			dev_err_ratelimited(dev, "Unsupported IOMMU invalidation type %d\n",
+					    cache_type);
+			ret = -EINVAL;
+		}
+	}
+out_unlock:
+	spin_unlock(&iommu->lock);
+	spin_unlock_irqrestore(&device_domain_lock, flags);
+
+	return ret;
+}
+#endif
+
 static int intel_iommu_map(struct iommu_domain *domain,
 			   unsigned long iova, phys_addr_t hpa,
 			   size_t size, int iommu_prot, gfp_t gfp)
@@ -5781,6 +5951,7 @@ const struct iommu_ops intel_iommu_ops = {
 	.def_domain_type	= device_def_domain_type,
 	.pgsize_bitmap		= INTEL_IOMMU_PGSIZES,
 #ifdef CONFIG_INTEL_IOMMU_SVM
+	.cache_invalidate	= intel_iommu_sva_invalidate,
 	.sva_bind_gpasid	= intel_svm_bind_gpasid,
 	.sva_unbind_gpasid	= intel_svm_unbind_gpasid,
 #endif
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
