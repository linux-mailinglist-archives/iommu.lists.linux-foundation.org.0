Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECD73A220E
	for <lists.iommu@lfdr.de>; Thu, 10 Jun 2021 04:03:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87EA783224;
	Thu, 10 Jun 2021 02:03:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zEvJThlq3wyM; Thu, 10 Jun 2021 02:03:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 91FED83211;
	Thu, 10 Jun 2021 02:03:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6D866C0022;
	Thu, 10 Jun 2021 02:03:29 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 628BCC000B
 for <iommu@lists.linux-foundation.org>; Thu, 10 Jun 2021 02:03:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 418F7831AC
 for <iommu@lists.linux-foundation.org>; Thu, 10 Jun 2021 02:03:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SqaCRSPWQXjO for <iommu@lists.linux-foundation.org>;
 Thu, 10 Jun 2021 02:03:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 497328318C
 for <iommu@lists.linux-foundation.org>; Thu, 10 Jun 2021 02:03:27 +0000 (UTC)
IronPort-SDR: PwgzhdhiDKO53UBhinyv5ZnnUSjDUz+3LKPIx+MtFyWH0hhGCyY+iUI8DdE8dA0wBDtYAsSziC
 3UHiiWcoBLRQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10010"; a="202184230"
X-IronPort-AV: E=Sophos;i="5.83,262,1616482800"; d="scan'208";a="202184230"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2021 19:03:27 -0700
IronPort-SDR: 7/6DYhadQdmA2gf0LsaLCOursYN7prleSk+fBl9MDIyao6jpjcjhH1cCUk1IWB4naOZgezVwU1
 8sssO5SINiUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,262,1616482800"; d="scan'208";a="402500392"
Received: from allen-box.sh.intel.com ([10.239.159.105])
 by orsmga006.jf.intel.com with ESMTP; 09 Jun 2021 19:03:24 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH 10/23] iommu/vt-d: Allocate/register iopf queue for sva devices
Date: Thu, 10 Jun 2021 10:01:02 +0800
Message-Id: <20210610020115.1637656-11-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210610020115.1637656-1-baolu.lu@linux.intel.com>
References: <20210610020115.1637656-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Cc: Fenghua Yu <fenghua.yu@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 Aditya Srivastava <yashsri421@gmail.com>, Randy Dunlap <rdunlap@infradead.org>,
 YueHaibing <yuehaibing@huawei.com>,
 "Gustavo A . R . Silva" <gustavoars@kernel.org>,
 iommu@lists.linux-foundation.org, Colin Ian King <colin.king@canonical.com>,
 Will Deacon <will@kernel.org>
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

This allocates and registers the iopf queue infrastructure for devices
which want to support IO page fault for SVA.

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
Link: https://lore.kernel.org/r/20210520031531.712333-1-baolu.lu@linux.intel.com
---
 include/linux/intel-iommu.h |  2 ++
 drivers/iommu/intel/iommu.c | 66 ++++++++++++++++++++++++++-----------
 drivers/iommu/intel/svm.c   | 37 +++++++++++++++++----
 3 files changed, 79 insertions(+), 26 deletions(-)

diff --git a/include/linux/intel-iommu.h b/include/linux/intel-iommu.h
index 4e8bb186daa7..222520d149c1 100644
--- a/include/linux/intel-iommu.h
+++ b/include/linux/intel-iommu.h
@@ -606,6 +606,8 @@ struct intel_iommu {
 	struct completion prq_complete;
 	struct ioasid_allocator_ops pasid_allocator; /* Custom allocator for PASIDs */
 #endif
+	struct iopf_queue *iopf_queue;
+	unsigned char iopfq_name[16];
 	struct q_inval  *qi;            /* Queued invalidation info */
 	u32 *iommu_state; /* Store iommu states between suspend and resume.*/
 
diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index 0ca7f8a2f38e..e78773d46d7d 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -46,6 +46,7 @@
 #include <asm/iommu.h>
 
 #include "../irq_remapping.h"
+#include "../iommu-sva-lib.h"
 #include "pasid.h"
 #include "cap_audit.h"
 
@@ -5338,6 +5339,34 @@ static int intel_iommu_disable_auxd(struct device *dev)
 	return 0;
 }
 
+static int intel_iommu_enable_sva(struct device *dev)
+{
+	struct device_domain_info *info = get_domain_info(dev);
+	struct intel_iommu *iommu = info->iommu;
+
+	if (!info || !iommu || dmar_disabled)
+		return -EINVAL;
+
+	if (!(iommu->flags & VTD_FLAG_SVM_CAPABLE))
+		return -ENODEV;
+
+	if (intel_iommu_enable_pasid(iommu, dev))
+		return -ENODEV;
+
+	if (!info->pasid_enabled || !info->pri_enabled || !info->ats_enabled)
+		return -EINVAL;
+
+	return iopf_queue_add_device(iommu->iopf_queue, dev);
+}
+
+static int intel_iommu_disable_sva(struct device *dev)
+{
+	struct device_domain_info *info = get_domain_info(dev);
+	struct intel_iommu *iommu = info->iommu;
+
+	return iopf_queue_remove_device(iommu->iopf_queue, dev);
+}
+
 /*
  * A PCI express designated vendor specific extended capability is defined
  * in the section 3.7 of Intel scalable I/O virtualization technical spec
@@ -5399,38 +5428,37 @@ intel_iommu_dev_has_feat(struct device *dev, enum iommu_dev_features feat)
 static int
 intel_iommu_dev_enable_feat(struct device *dev, enum iommu_dev_features feat)
 {
-	if (feat == IOMMU_DEV_FEAT_AUX)
+	switch (feat) {
+	case IOMMU_DEV_FEAT_AUX:
 		return intel_iommu_enable_auxd(dev);
 
-	if (feat == IOMMU_DEV_FEAT_IOPF)
+	case IOMMU_DEV_FEAT_IOPF:
 		return intel_iommu_dev_has_feat(dev, feat) ? 0 : -ENODEV;
 
-	if (feat == IOMMU_DEV_FEAT_SVA) {
-		struct device_domain_info *info = get_domain_info(dev);
-
-		if (!info)
-			return -EINVAL;
-
-		if (intel_iommu_enable_pasid(info->iommu, dev))
-			return -ENODEV;
+	case IOMMU_DEV_FEAT_SVA:
+		return intel_iommu_enable_sva(dev);
 
-		if (!info->pasid_enabled || !info->pri_enabled || !info->ats_enabled)
-			return -EINVAL;
-
-		if (info->iommu->flags & VTD_FLAG_SVM_CAPABLE)
-			return 0;
+	default:
+		return -ENODEV;
 	}
-
-	return -ENODEV;
 }
 
 static int
 intel_iommu_dev_disable_feat(struct device *dev, enum iommu_dev_features feat)
 {
-	if (feat == IOMMU_DEV_FEAT_AUX)
+	switch (feat) {
+	case IOMMU_DEV_FEAT_AUX:
 		return intel_iommu_disable_auxd(dev);
 
-	return -ENODEV;
+	case IOMMU_DEV_FEAT_IOPF:
+		return 0;
+
+	case IOMMU_DEV_FEAT_SVA:
+		return intel_iommu_disable_sva(dev);
+
+	default:
+		return -ENODEV;
+	}
 }
 
 static bool
diff --git a/drivers/iommu/intel/svm.c b/drivers/iommu/intel/svm.c
index d51ddece4259..4dc3ab36e9ae 100644
--- a/drivers/iommu/intel/svm.c
+++ b/drivers/iommu/intel/svm.c
@@ -84,6 +84,7 @@ svm_lookup_device_by_dev(struct intel_svm *svm, struct device *dev)
 
 int intel_svm_enable_prq(struct intel_iommu *iommu)
 {
+	struct iopf_queue *iopfq;
 	struct page *pages;
 	int irq, ret;
 
@@ -100,13 +101,20 @@ int intel_svm_enable_prq(struct intel_iommu *iommu)
 		pr_err("IOMMU: %s: Failed to create IRQ vector for page request queue\n",
 		       iommu->name);
 		ret = -EINVAL;
-	err:
-		free_pages((unsigned long)iommu->prq, PRQ_ORDER);
-		iommu->prq = NULL;
-		return ret;
+		goto free_prq;
 	}
 	iommu->pr_irq = irq;
 
+	snprintf(iommu->iopfq_name, sizeof(iommu->iopfq_name),
+		 "dmar%d-iopfq", iommu->seq_id);
+	iopfq = iopf_queue_alloc(iommu->iopfq_name);
+	if (!iopfq) {
+		pr_err("IOMMU: %s: Failed to allocate iopf queue\n", iommu->name);
+		ret = -ENOMEM;
+		goto free_hwirq;
+	}
+	iommu->iopf_queue = iopfq;
+
 	snprintf(iommu->prq_name, sizeof(iommu->prq_name), "dmar%d-prq", iommu->seq_id);
 
 	ret = request_threaded_irq(irq, NULL, prq_event_thread, IRQF_ONESHOT,
@@ -114,9 +122,7 @@ int intel_svm_enable_prq(struct intel_iommu *iommu)
 	if (ret) {
 		pr_err("IOMMU: %s: Failed to request IRQ for page request queue\n",
 		       iommu->name);
-		dmar_free_hwirq(irq);
-		iommu->pr_irq = 0;
-		goto err;
+		goto free_iopfq;
 	}
 	dmar_writeq(iommu->reg + DMAR_PQH_REG, 0ULL);
 	dmar_writeq(iommu->reg + DMAR_PQT_REG, 0ULL);
@@ -125,6 +131,18 @@ int intel_svm_enable_prq(struct intel_iommu *iommu)
 	init_completion(&iommu->prq_complete);
 
 	return 0;
+
+free_iopfq:
+	iopf_queue_free(iommu->iopf_queue);
+	iommu->iopf_queue = NULL;
+free_hwirq:
+	dmar_free_hwirq(irq);
+	iommu->pr_irq = 0;
+free_prq:
+	free_pages((unsigned long)iommu->prq, PRQ_ORDER);
+	iommu->prq = NULL;
+
+	return ret;
 }
 
 int intel_svm_finish_prq(struct intel_iommu *iommu)
@@ -139,6 +157,11 @@ int intel_svm_finish_prq(struct intel_iommu *iommu)
 		iommu->pr_irq = 0;
 	}
 
+	if (iommu->iopf_queue) {
+		iopf_queue_free(iommu->iopf_queue);
+		iommu->iopf_queue = NULL;
+	}
+
 	free_pages((unsigned long)iommu->prq, PRQ_ORDER);
 	iommu->prq = NULL;
 
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
