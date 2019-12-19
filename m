Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id C80421259D9
	for <lists.iommu@lfdr.de>; Thu, 19 Dec 2019 04:17:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 41CB386D62;
	Thu, 19 Dec 2019 03:17:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FLBrqEBuDElS; Thu, 19 Dec 2019 03:17:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9CFA786D6F;
	Thu, 19 Dec 2019 03:17:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8C164C077D;
	Thu, 19 Dec 2019 03:17:42 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CA3F5C077D
 for <iommu@lists.linux-foundation.org>; Thu, 19 Dec 2019 03:17:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B3E6E84973
 for <iommu@lists.linux-foundation.org>; Thu, 19 Dec 2019 03:17:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3oLmFeMz9NAT for <iommu@lists.linux-foundation.org>;
 Thu, 19 Dec 2019 03:17:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 1AF1E8573E
 for <iommu@lists.linux-foundation.org>; Thu, 19 Dec 2019 03:17:38 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Dec 2019 19:17:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,330,1571727600"; d="scan'208";a="222160406"
Received: from allen-box.sh.intel.com ([10.239.159.136])
 by fmsmga001.fm.intel.com with ESMTP; 18 Dec 2019 19:17:35 -0800
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>, David Woodhouse <dwmw2@infradead.org>,
 Alex Williamson <alex.williamson@redhat.com>
Subject: [PATCH v4 2/7] iommu/vt-d: Add set domain DOMAIN_ATTR_NESTING attr
Date: Thu, 19 Dec 2019 11:16:29 +0800
Message-Id: <20191219031634.15168-3-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191219031634.15168-1-baolu.lu@linux.intel.com>
References: <20191219031634.15168-1-baolu.lu@linux.intel.com>
Cc: kevin.tian@intel.com, Yi Sun <yi.y.sun@linux.intel.com>,
 ashok.raj@intel.com, kvm@vger.kernel.org, sanjay.k.kumar@intel.com,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 yi.y.sun@intel.com
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

This adds the Intel VT-d specific callback of setting
DOMAIN_ATTR_NESTING domain attribution. It is necessary
to let the VT-d driver know that the domain represents
a virtual machine which requires the IOMMU hardware to
support nested translation mode. Return success if the
IOMMU hardware suports nested mode, otherwise failure.

Signed-off-by: Yi Sun <yi.y.sun@linux.intel.com>
Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/iommu/intel-iommu.c | 56 +++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
index c93fe716e6b0..2b5a47584baf 100644
--- a/drivers/iommu/intel-iommu.c
+++ b/drivers/iommu/intel-iommu.c
@@ -315,6 +315,12 @@ static int hw_pass_through = 1;
  */
 #define DOMAIN_FLAG_USE_FIRST_LEVEL		BIT(2)
 
+/*
+ * Domain represents a virtual machine which demands iommu nested
+ * translation mode support.
+ */
+#define DOMAIN_FLAG_NESTING_MODE		BIT(3)
+
 #define for_each_domain_iommu(idx, domain)			\
 	for (idx = 0; idx < g_num_of_iommus; idx++)		\
 		if (domain->iommu_refcnt[idx])
@@ -5635,6 +5641,24 @@ static inline bool iommu_pasid_support(void)
 	return ret;
 }
 
+static inline bool nested_mode_support(void)
+{
+	struct dmar_drhd_unit *drhd;
+	struct intel_iommu *iommu;
+	bool ret = true;
+
+	rcu_read_lock();
+	for_each_active_iommu(iommu, drhd) {
+		if (!sm_supported(iommu) || !ecap_nest(iommu->ecap)) {
+			ret = false;
+			break;
+		}
+	}
+	rcu_read_unlock();
+
+	return ret;
+}
+
 static bool intel_iommu_capable(enum iommu_cap cap)
 {
 	if (cap == IOMMU_CAP_CACHE_COHERENCY)
@@ -6013,10 +6037,42 @@ static bool intel_iommu_is_attach_deferred(struct iommu_domain *domain,
 	return dev->archdata.iommu == DEFER_DEVICE_DOMAIN_INFO;
 }
 
+static int
+intel_iommu_domain_set_attr(struct iommu_domain *domain,
+			    enum iommu_attr attr, void *data)
+{
+	struct dmar_domain *dmar_domain = to_dmar_domain(domain);
+	unsigned long flags;
+	int ret = 0;
+
+	if (domain->type != IOMMU_DOMAIN_UNMANAGED)
+		return -EINVAL;
+
+	switch (attr) {
+	case DOMAIN_ATTR_NESTING:
+		spin_lock_irqsave(&device_domain_lock, flags);
+		if (nested_mode_support() &&
+		    list_empty(&dmar_domain->devices)) {
+			dmar_domain->flags |= DOMAIN_FLAG_NESTING_MODE;
+			dmar_domain->flags &= ~DOMAIN_FLAG_USE_FIRST_LEVEL;
+		} else {
+			ret = -ENODEV;
+		}
+		spin_unlock_irqrestore(&device_domain_lock, flags);
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	return ret;
+}
+
 const struct iommu_ops intel_iommu_ops = {
 	.capable		= intel_iommu_capable,
 	.domain_alloc		= intel_iommu_domain_alloc,
 	.domain_free		= intel_iommu_domain_free,
+	.domain_set_attr	= intel_iommu_domain_set_attr,
 	.attach_dev		= intel_iommu_attach_device,
 	.detach_dev		= intel_iommu_detach_device,
 	.aux_attach_dev		= intel_iommu_aux_attach_device,
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
