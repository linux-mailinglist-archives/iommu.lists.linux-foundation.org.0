Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FBAE1B2F7A
	for <lists.iommu@lfdr.de>; Tue, 21 Apr 2020 20:47:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4D32186E82;
	Tue, 21 Apr 2020 18:47:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JZHnDuZyIIbY; Tue, 21 Apr 2020 18:47:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8156C87015;
	Tue, 21 Apr 2020 18:47:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6FA6BC0175;
	Tue, 21 Apr 2020 18:47:03 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6A3A9C0175
 for <iommu@lists.linux-foundation.org>; Tue, 21 Apr 2020 18:46:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 3B2AA203F2
 for <iommu@lists.linux-foundation.org>; Tue, 21 Apr 2020 18:46:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L4vaW46M343J for <iommu@lists.linux-foundation.org>;
 Tue, 21 Apr 2020 18:46:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by silver.osuosl.org (Postfix) with ESMTPS id B808120242
 for <iommu@lists.linux-foundation.org>; Tue, 21 Apr 2020 18:46:56 +0000 (UTC)
IronPort-SDR: 0JVhN25fGPQfvh/YIGTXKQtGRtky8PpAelsbVfFFIRiVj0vzl6JKvZV0E6QSZ8XN1YHeHoMswC
 rchmK0oI0PgA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2020 11:46:48 -0700
IronPort-SDR: +1mfGseSW/2ckPRgtTnd3DaqQTmgZ4aN70nKaKVQiD0QKYcqU6Aqmzze8A7ThPOv8oLWsj+F3d
 Ktaez4n5CqzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,411,1580803200"; d="scan'208";a="334367883"
Received: from jacob-builder.jf.intel.com ([10.7.199.155])
 by orsmga001.jf.intel.com with ESMTP; 21 Apr 2020 11:46:48 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: "Lu Baolu" <baolu.lu@linux.intel.com>, iommu@lists.linux-foundation.org,
 LKML <linux-kernel@vger.kernel.org>, Joerg Roedel <joro@8bytes.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>,
 Eric Auger <eric.auger@redhat.com>
Subject: [PATCH v12 6/8] iommu/vt-d: Add svm/sva invalidate function
Date: Tue, 21 Apr 2020 11:52:43 -0700
Message-Id: <1587495165-80096-7-git-send-email-jacob.jun.pan@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1587495165-80096-1-git-send-email-jacob.jun.pan@linux.intel.com>
References: <1587495165-80096-1-git-send-email-jacob.jun.pan@linux.intel.com>
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Raj Ashok <ashok.raj@intel.com>,
 Christoph Hellwig <hch@infradead.org>,
 Alex Williamson <alex.williamson@redhat.com>, Liu@osuosl.org,
 Jonathan Cameron <jic23@kernel.org>
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

---
v12	- Use ratelimited prints for all user called APIs.
	- Check for domain nesting attr
---
Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
Signed-off-by: Ashok Raj <ashok.raj@intel.com>
Signed-off-by: Liu, Yi L <yi.l.liu@intel.com>

Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
---
 drivers/iommu/intel-iommu.c | 175 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 175 insertions(+)

diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
index 8862d6b0ef21..24de233faaf5 100644
--- a/drivers/iommu/intel-iommu.c
+++ b/drivers/iommu/intel-iommu.c
@@ -5595,6 +5595,180 @@ static void intel_iommu_aux_detach_device(struct iommu_domain *domain,
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
+	info = iommu_support_dev_iotlb(dmar_domain, iommu, bus, devfn);
+	if (!info) {
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+	did = dmar_domain->iommu_did[iommu->seq_id];
+	sid = PCI_DEVID(bus, devfn);
+
+	/* Size is only valid in non-PASID selective invalidation */
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
+			       cache_type, inv_info->granularity);
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
+				       inv_info->addr_info.addr, size);
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
+		case IOMMU_CACHE_INV_TYPE_PASID:
+			qi_flush_pasid_cache(iommu, did, granu,
+					     inv_info->pasid_info.pasid);
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
@@ -6180,6 +6354,7 @@ const struct iommu_ops intel_iommu_ops = {
 	.is_attach_deferred	= intel_iommu_is_attach_deferred,
 	.pgsize_bitmap		= INTEL_IOMMU_PGSIZES,
 #ifdef CONFIG_INTEL_IOMMU_SVM
+	.cache_invalidate	= intel_iommu_sva_invalidate,
 	.sva_bind_gpasid	= intel_svm_bind_gpasid,
 	.sva_unbind_gpasid	= intel_svm_unbind_gpasid,
 #endif
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
