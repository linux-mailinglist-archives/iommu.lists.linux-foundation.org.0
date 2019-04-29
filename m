Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id EC99BDA7C
	for <lists.iommu@lfdr.de>; Mon, 29 Apr 2019 04:19:00 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 076F91DEC;
	Mon, 29 Apr 2019 02:18:40 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id BB3B31D35
	for <iommu@lists.linux-foundation.org>;
	Mon, 29 Apr 2019 02:16:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 2253A608
	for <iommu@lists.linux-foundation.org>;
	Mon, 29 Apr 2019 02:16:12 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Apr 2019 19:16:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,408,1549958400"; d="scan'208";a="146537869"
Received: from allen-box.sh.intel.com ([10.239.159.136])
	by orsmga003.jf.intel.com with ESMTP; 28 Apr 2019 19:16:09 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: David Woodhouse <dwmw2@infradead.org>,
	Joerg Roedel <joro@8bytes.org>
Subject: [PATCH v3 6/8] iommu/vt-d: Allow DMA domains to be allocated by iommu
	ops
Date: Mon, 29 Apr 2019 10:09:23 +0800
Message-Id: <20190429020925.18136-7-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190429020925.18136-1-baolu.lu@linux.intel.com>
References: <20190429020925.18136-1-baolu.lu@linux.intel.com>
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kevin.tian@intel.com, ashok.raj@intel.com, dima@arista.com,
	tmurphy@arista.com, linux-kernel@vger.kernel.org,
	iommu@lists.linux-foundation.org, jacob.jun.pan@intel.com
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

From: James Sewart <jamessewart@arista.com>

Allowing IOMMU_DOMAIN_DMA and IOMMU_DOMAIN_IDENTITY types of
domains to be allocated through iommu ops allows the default
domain of an iommu_group to be set. This delegates domains of
Intel IOMMU driver to the generic IOMMU layer.

Signed-off-by: James Sewart <jamessewart@arista.com>
Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/iommu/intel-iommu.c | 124 ++++++++++++++++++++++++++----------
 1 file changed, 90 insertions(+), 34 deletions(-)

diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
index d2b51e045603..ec6ac39827ab 100644
--- a/drivers/iommu/intel-iommu.c
+++ b/drivers/iommu/intel-iommu.c
@@ -311,6 +311,12 @@ static int hw_pass_through = 1;
 /* si_domain contains mulitple devices */
 #define DOMAIN_FLAG_STATIC_IDENTITY	(1 << 1)
 
+/*
+ * Domain managed externally, don't cleanup if it isn't attached
+ * to any devices.
+ */
+#define DOMAIN_FLAG_MANAGED_EXTERNALLY	(1 << 2)
+
 #define for_each_domain_iommu(idx, domain)			\
 	for (idx = 0; idx < g_num_of_iommus; idx++)		\
 		if (domain->iommu_refcnt[idx])
@@ -561,6 +567,11 @@ static inline int domain_type_is_vm_or_si(struct dmar_domain *domain)
 				DOMAIN_FLAG_STATIC_IDENTITY);
 }
 
+static inline int domain_managed_externally(struct dmar_domain *domain)
+{
+	return domain->flags & DOMAIN_FLAG_MANAGED_EXTERNALLY;
+}
+
 static inline int domain_pfn_supported(struct dmar_domain *domain,
 				       unsigned long pfn)
 {
@@ -1671,7 +1682,7 @@ static void disable_dmar_iommu(struct intel_iommu *iommu)
 
 		__dmar_remove_one_dev_info(info);
 
-		if (!domain_type_is_vm_or_si(domain)) {
+		if (!domain_managed_externally(domain)) {
 			/*
 			 * The domain_exit() function  can't be called under
 			 * device_domain_lock, as it takes this lock itself.
@@ -2366,7 +2377,12 @@ static int domain_mapping(struct dmar_domain *domain, unsigned long iov_pfn,
 	} else {
 		/* General domains only have one IOMMU */
 		iommu = domain_get_iommu(domain);
-		__mapping_notify_one(iommu, domain, iov_pfn, nr_pages);
+		/*
+		 * There's no associated iommu if domain hasn't been attached
+		 * to any device yet.
+		 */
+		if (iommu)
+			__mapping_notify_one(iommu, domain, iov_pfn, nr_pages);
 	}
 
 	return 0;
@@ -3406,12 +3422,9 @@ static int __init init_dmars(void)
 
 	check_tylersburg_isoch();
 
-	if (iommu_identity_mapping) {
-		ret = si_domain_init(hw_pass_through);
-		if (ret)
-			goto free_iommu;
-	}
-
+	ret = si_domain_init(hw_pass_through);
+	if (ret)
+		goto free_iommu;
 
 	/*
 	 * If we copied translations from a previous kernel in the kdump
@@ -4572,7 +4585,7 @@ static int device_notifier(struct notifier_block *nb,
 			return 0;
 
 		dmar_remove_one_dev_info(dev);
-		if (!domain_type_is_vm_or_si(domain) &&
+		if (!domain_managed_externally(domain) &&
 		    list_empty(&domain->devices))
 			domain_exit(domain);
 	} else if (action == BUS_NOTIFY_ADD_DEVICE) {
@@ -5038,33 +5051,52 @@ static struct iommu_domain *intel_iommu_domain_alloc(unsigned type)
 {
 	struct dmar_domain *dmar_domain;
 	struct iommu_domain *domain;
+	int flags = DOMAIN_FLAG_MANAGED_EXTERNALLY;
 
-	if (type != IOMMU_DOMAIN_UNMANAGED)
-		return NULL;
+	switch (type) {
+	case IOMMU_DOMAIN_UNMANAGED:
+		flags |= DOMAIN_FLAG_VIRTUAL_MACHINE;
+		/* fall through */
+	case IOMMU_DOMAIN_DMA:
+		dmar_domain = alloc_domain(flags);
+		if (!dmar_domain)
+			return NULL;
 
-	dmar_domain = alloc_domain(DOMAIN_FLAG_VIRTUAL_MACHINE);
-	if (!dmar_domain) {
-		pr_err("Can't allocate dmar_domain\n");
-		return NULL;
-	}
-	if (md_domain_init(dmar_domain, DEFAULT_DOMAIN_ADDRESS_WIDTH)) {
-		pr_err("Domain initialization failed\n");
-		domain_exit(dmar_domain);
+		if (md_domain_init(dmar_domain, DEFAULT_DOMAIN_ADDRESS_WIDTH)) {
+			pr_err("Domain initialization failed\n");
+			domain_exit(dmar_domain);
+			return NULL;
+		}
+
+		if (type == IOMMU_DOMAIN_DMA &&
+		    init_iova_flush_queue(&dmar_domain->iovad,
+					  iommu_flush_iova, iova_entry_free)) {
+			pr_warn("iova flush queue initialization failed\n");
+			intel_iommu_strict = 1;
+		}
+
+		domain_update_iommu_cap(dmar_domain);
+		domain = &dmar_domain->domain;
+		domain->geometry.aperture_start = 0;
+		domain->geometry.aperture_end =
+			__DOMAIN_MAX_ADDR(dmar_domain->gaw);
+		domain->geometry.force_aperture = true;
+		break;
+	case IOMMU_DOMAIN_IDENTITY:
+		return &si_domain->domain;
+	default:
 		return NULL;
 	}
-	domain_update_iommu_cap(dmar_domain);
-
-	domain = &dmar_domain->domain;
-	domain->geometry.aperture_start = 0;
-	domain->geometry.aperture_end   = __DOMAIN_MAX_ADDR(dmar_domain->gaw);
-	domain->geometry.force_aperture = true;
 
-	return domain;
+	return &dmar_domain->domain;
 }
 
 static void intel_iommu_domain_free(struct iommu_domain *domain)
 {
-	domain_exit(to_dmar_domain(domain));
+	struct dmar_domain *dmar_domain = to_dmar_domain(domain);
+
+	if (domain_managed_externally(dmar_domain))
+		domain_exit(dmar_domain);
 }
 
 /*
@@ -5240,13 +5272,33 @@ static int intel_iommu_attach_device(struct iommu_domain *domain,
 {
 	int ret;
 
-	if (device_is_rmrr_locked(dev)) {
-		dev_warn(dev, "Device is ineligible for IOMMU domain attach due to platform RMRR requirement.  Contact your platform vendor.\n");
-		return -EPERM;
-	}
+	switch (domain->type) {
+	case IOMMU_DOMAIN_UNMANAGED:
+		if (device_is_rmrr_locked(dev)) {
+			dev_warn(dev, "Device is ineligible for IOMMU domain attach due to platform RMRR requirement. Contact your platform vendor.\n");
+			return -EPERM;
+		}
 
-	if (is_aux_domain(dev, domain))
-		return -EPERM;
+		if (is_aux_domain(dev, domain))
+			return -EPERM;
+
+		break;
+	case IOMMU_DOMAIN_DMA:
+		if (intel_iommu_def_domain_type(dev) == IOMMU_DOMAIN_IDENTITY) {
+			dev_warn(dev, "Device requires identity domain\n");
+			return -EINVAL;
+		}
+		break;
+	case IOMMU_DOMAIN_IDENTITY:
+		if (intel_iommu_def_domain_type(dev) == IOMMU_DOMAIN_DMA) {
+			dev_warn(dev, "Device requires non-identity domain\n");
+			return -EINVAL;
+		}
+		break;
+	default:
+		dev_warn(dev, "Invalid domain type %u\n", domain->type);
+		return -EINVAL;
+	}
 
 	/* normally dev is not mapped */
 	if (unlikely(domain_context_mapped(dev))) {
@@ -5258,7 +5310,7 @@ static int intel_iommu_attach_device(struct iommu_domain *domain,
 			dmar_remove_one_dev_info(dev);
 			rcu_read_unlock();
 
-			if (!domain_type_is_vm_or_si(old_domain) &&
+			if (!domain_managed_externally(old_domain) &&
 			    list_empty(&old_domain->devices))
 				domain_exit(old_domain);
 		}
@@ -5307,6 +5359,10 @@ static int intel_iommu_map(struct iommu_domain *domain,
 	int prot = 0;
 	int ret;
 
+	/* Don't bother if hardware passthrough used. */
+	if (dmar_domain == si_domain && hw_pass_through)
+		return 0;
+
 	if (iommu_prot & IOMMU_READ)
 		prot |= DMA_PTE_READ;
 	if (iommu_prot & IOMMU_WRITE)
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
