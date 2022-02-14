Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 813894B3FE2
	for <lists.iommu@lfdr.de>; Mon, 14 Feb 2022 03:59:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 316A3402AA;
	Mon, 14 Feb 2022 02:59:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ns5BXkToqN9q; Mon, 14 Feb 2022 02:59:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 4262940157;
	Mon, 14 Feb 2022 02:59:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1EBA6C0073;
	Mon, 14 Feb 2022 02:59:06 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5A6A7C000B
 for <iommu@lists.linux-foundation.org>; Mon, 14 Feb 2022 02:59:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3B0134048D
 for <iommu@lists.linux-foundation.org>; Mon, 14 Feb 2022 02:59:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=intel.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OROt42V6PgPT for <iommu@lists.linux-foundation.org>;
 Mon, 14 Feb 2022 02:59:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4B5CC404A1
 for <iommu@lists.linux-foundation.org>; Mon, 14 Feb 2022 02:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644807544; x=1676343544;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VBMsFrh2PTzmv2WOA2c5Cq3XrHldULkt+wE397bzEns=;
 b=G/oP/38l1aWZwD0DTsFj+fdd7+Iv0gqB0111L2jNh1ogqay6P3J8Z7Xr
 mhI8J7GOotzKgZxxjdSJOfrZlFyfgZz1SnDLT1Fo92E7N++DolPIo9fEh
 5zeQ84xyaKctU1RjerFwuX0hv5XBlwriDd+m4kGQOBwvAg4UUs7dviTbF
 2BSqRgP8TsHD3eRG+xImh1+4k6s7QSpZuUrFtTZpgz0F4b5766SCFzruc
 b82C8NWUpwOH8+mhgwZoAQqRpLfhVh164KU/6o6cRb8Q/G4ZTpyO7qxI7
 zRdRbJ46sOyZNEnQMbhYr7J1obVfaFEfFk7QNJaJ2pT2OHdf3U+vnvnJN w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10257"; a="230637545"
X-IronPort-AV: E=Sophos;i="5.88,366,1635231600"; d="scan'208";a="230637545"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2022 18:59:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,366,1635231600"; d="scan'208";a="501515047"
Received: from allen-box.sh.intel.com ([10.239.159.118])
 by orsmga002.jf.intel.com with ESMTP; 13 Feb 2022 18:59:01 -0800
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>, Kevin Tian <kevin.tian@intel.com>,
 Ashok Raj <ashok.raj@intel.com>, Liu Yi L <yi.l.liu@intel.com>,
 Jacob Pan <jacob.jun.pan@linux.intel.com>
Subject: [PATCH v2 10/11] iommu/vt-d: Use xarray for global device_domain_info
Date: Mon, 14 Feb 2022 10:57:03 +0800
Message-Id: <20220214025704.3184654-11-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220214025704.3184654-1-baolu.lu@linux.intel.com>
References: <20220214025704.3184654-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Jason Gunthorpe <jgg@nvidia.com>, Robin Murphy <robin.murphy@arm.com>,
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

Replace the existing global device_domain_list with an array so that it
could be rapidly searched. The index of the array is composed by the PCI
segment, bus and devfn. Use RCU for lock protection.

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 include/linux/intel-iommu.h |  1 -
 drivers/iommu/intel/iommu.c | 72 ++++++++++++++++++-------------------
 2 files changed, 34 insertions(+), 39 deletions(-)

diff --git a/include/linux/intel-iommu.h b/include/linux/intel-iommu.h
index 03f1134fc2fe..aca1c1cc04a8 100644
--- a/include/linux/intel-iommu.h
+++ b/include/linux/intel-iommu.h
@@ -610,7 +610,6 @@ struct intel_iommu {
 /* PCI domain-device relationship */
 struct device_domain_info {
 	struct list_head link;	/* link to domain siblings */
-	struct list_head global; /* link to global list */
 	struct list_head table;	/* link to pasid table */
 	u32 segment;		/* PCI segment number */
 	u8 bus;			/* PCI bus number */
diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index fb17ed8c08f3..ecec923ce191 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -131,8 +131,6 @@ static struct intel_iommu **g_iommus;
 
 static void __init check_tylersburg_isoch(void);
 static int rwbf_quirk;
-static inline struct device_domain_info *
-dmar_search_domain_by_dev_info(int segment, int bus, int devfn);
 
 /*
  * set to 1 to panic kernel if can't successfully enable VT-d
@@ -318,30 +316,34 @@ int intel_iommu_gfx_mapped;
 EXPORT_SYMBOL_GPL(intel_iommu_gfx_mapped);
 
 DEFINE_SPINLOCK(device_domain_lock);
-static LIST_HEAD(device_domain_list);
+static DEFINE_XARRAY_ALLOC(device_domain_array);
+
+/* Convert device source ID into the index of device_domain_array. */
+static inline unsigned long devi_idx(unsigned long seg, u8 bus, u8 devfn)
+{
+	return (seg << 16) | PCI_DEVID(bus, devfn);
+}
 
 /*
- * Iterate over elements in device_domain_list and call the specified
+ * Iterate over elements in device_domain_array and call the specified
  * callback @fn against each element.
  */
 int for_each_device_domain(int (*fn)(struct device_domain_info *info,
 				     void *data), void *data)
 {
-	int ret = 0;
-	unsigned long flags;
 	struct device_domain_info *info;
+	unsigned long index;
+	int ret = 0;
 
-	spin_lock_irqsave(&device_domain_lock, flags);
-	list_for_each_entry(info, &device_domain_list, global) {
+	rcu_read_lock();
+	xa_for_each(&device_domain_array, index, info) {
 		ret = fn(info, data);
-		if (ret) {
-			spin_unlock_irqrestore(&device_domain_lock, flags);
-			return ret;
-		}
+		if (ret)
+			break;
 	}
-	spin_unlock_irqrestore(&device_domain_lock, flags);
+	rcu_read_unlock();
 
-	return 0;
+	return ret;
 }
 
 const struct iommu_ops intel_iommu_ops;
@@ -903,7 +905,8 @@ static void pgtable_walk(struct intel_iommu *iommu, unsigned long pfn, u8 bus, u
 	struct dmar_domain *domain;
 	int offset, level;
 
-	info = dmar_search_domain_by_dev_info(iommu->segment, bus, devfn);
+	info = xa_load(&device_domain_array,
+		       devi_idx(iommu->segment, bus, devfn));
 	if (!info || !info->domain) {
 		pr_info("device [%02x:%02x.%d] not probed\n",
 			bus, PCI_SLOT(devfn), PCI_FUNC(devfn));
@@ -1742,14 +1745,14 @@ static int iommu_init_domains(struct intel_iommu *iommu)
 
 static void disable_dmar_iommu(struct intel_iommu *iommu)
 {
-	struct device_domain_info *info, *tmp;
-	unsigned long flags;
+	struct device_domain_info *info;
+	unsigned long index;
 
 	if (!iommu->domain_ids)
 		return;
 
-	spin_lock_irqsave(&device_domain_lock, flags);
-	list_for_each_entry_safe(info, tmp, &device_domain_list, global) {
+	rcu_read_lock();
+	xa_for_each(&device_domain_array, index, info) {
 		if (info->iommu != iommu)
 			continue;
 
@@ -1758,7 +1761,7 @@ static void disable_dmar_iommu(struct intel_iommu *iommu)
 
 		__dmar_remove_one_dev_info(info);
 	}
-	spin_unlock_irqrestore(&device_domain_lock, flags);
+	rcu_read_unlock();
 
 	if (iommu->gcmd & DMA_GCMD_TE)
 		iommu_disable_translation(iommu);
@@ -2390,19 +2393,6 @@ static void domain_remove_dev_info(struct dmar_domain *domain)
 	spin_unlock_irqrestore(&device_domain_lock, flags);
 }
 
-static inline struct device_domain_info *
-dmar_search_domain_by_dev_info(int segment, int bus, int devfn)
-{
-	struct device_domain_info *info;
-
-	list_for_each_entry(info, &device_domain_list, global)
-		if (info->segment == segment && info->bus == bus &&
-		    info->devfn == devfn)
-			return info;
-
-	return NULL;
-}
-
 static int domain_setup_first_level(struct intel_iommu *iommu,
 				    struct dmar_domain *domain,
 				    struct device *dev,
@@ -4516,8 +4506,8 @@ static struct iommu_device *intel_iommu_probe_device(struct device *dev)
 	struct pci_dev *pdev = dev_is_pci(dev) ? to_pci_dev(dev) : NULL;
 	struct device_domain_info *info;
 	struct intel_iommu *iommu;
-	unsigned long flags;
 	u8 bus, devfn;
+	void *curr;
 
 	iommu = device_to_iommu(dev, &bus, &devfn);
 	if (!iommu)
@@ -4559,10 +4549,15 @@ static struct iommu_device *intel_iommu_probe_device(struct device *dev)
 		}
 	}
 
-	spin_lock_irqsave(&device_domain_lock, flags);
-	list_add(&info->global, &device_domain_list);
+	curr = xa_store(&device_domain_array,
+			devi_idx(info->segment, info->bus, info->devfn),
+			info, GFP_KERNEL);
+	if (xa_err(curr) || WARN_ON(curr)) {
+		kfree(info);
+		return ERR_PTR(-ENOSPC);
+	}
+
 	dev_iommu_priv_set(dev, info);
-	spin_unlock_irqrestore(&device_domain_lock, flags);
 
 	return &iommu->iommu;
 }
@@ -4576,7 +4571,8 @@ static void intel_iommu_release_device(struct device *dev)
 
 	spin_lock_irqsave(&device_domain_lock, flags);
 	dev_iommu_priv_set(dev, NULL);
-	list_del(&info->global);
+	xa_erase(&device_domain_array,
+		 devi_idx(info->segment, info->bus, info->devfn));
 	spin_unlock_irqrestore(&device_domain_lock, flags);
 
 	kfree(info);
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
