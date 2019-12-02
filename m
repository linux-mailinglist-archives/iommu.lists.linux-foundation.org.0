Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5AA10F109
	for <lists.iommu@lfdr.de>; Mon,  2 Dec 2019 20:53:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9C01D85F4D;
	Mon,  2 Dec 2019 19:53:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nfp7qOB4CmLV; Mon,  2 Dec 2019 19:53:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id F198685EC6;
	Mon,  2 Dec 2019 19:53:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DB565C1798;
	Mon,  2 Dec 2019 19:53:51 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 683A0C087F
 for <iommu@lists.linux-foundation.org>; Mon,  2 Dec 2019 19:53:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 55AFC20BF8
 for <iommu@lists.linux-foundation.org>; Mon,  2 Dec 2019 19:53:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SToDExk-PiRl for <iommu@lists.linux-foundation.org>;
 Mon,  2 Dec 2019 19:53:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by silver.osuosl.org (Postfix) with ESMTPS id 4A0CD204BC
 for <iommu@lists.linux-foundation.org>; Mon,  2 Dec 2019 19:53:49 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Dec 2019 11:53:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,270,1571727600"; d="scan'208";a="218438141"
Received: from jacob-builder.jf.intel.com ([10.7.199.155])
 by fmsmga001.fm.intel.com with ESMTP; 02 Dec 2019 11:53:48 -0800
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: iommu@lists.linux-foundation.org, LKML <linux-kernel@vger.kernel.org>,
 Joerg Roedel <joro@8bytes.org>, "Lu Baolu" <baolu.lu@linux.intel.com>,
 David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH v5 1/8] iommu/vt-d: Fix CPU and IOMMU SVM feature matching
 checks
Date: Mon,  2 Dec 2019 11:58:22 -0800
Message-Id: <1575316709-54903-2-git-send-email-jacob.jun.pan@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1575316709-54903-1-git-send-email-jacob.jun.pan@linux.intel.com>
References: <1575316709-54903-1-git-send-email-jacob.jun.pan@linux.intel.com>
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Raj Ashok <ashok.raj@intel.com>,
 Joe Perches <joe@perches.com>
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

Shared Virtual Memory(SVM) is based on a collective set of hardware
features detected at runtime. There are requirements for matching CPU
and IOMMU capabilities.

The current code checks CPU and IOMMU feature set for SVM support but
the result is never stored nor used. Therefore, SVM can still be used
even when these checks failed. The consequences can be:
1. CPU uses 5-level paging mode for virtual address of 57 bits, but
IOMMU can only support 4-level paging mode with 48 bits address for DMA.
2. 1GB page size is used by CPU but IOMMU does not support it. VT-d
unrecoverable faults may be generated.

The best solution to fix these problems is to prevent them in the first
place.

This patch consolidates code for checking PASID, CPU vs. IOMMU paging
mode compatibility, as well as provides specific error messages for
each failed checks. On sane hardware configurations, these error message
shall never appear in kernel log.

Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Acked-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/iommu/intel-iommu.c | 10 ++--------
 drivers/iommu/intel-svm.c   | 40 +++++++++++++++++++++++++++-------------
 include/linux/intel-iommu.h |  5 ++++-
 3 files changed, 33 insertions(+), 22 deletions(-)

diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
index 3f974919d3bd..d598168e410d 100644
--- a/drivers/iommu/intel-iommu.c
+++ b/drivers/iommu/intel-iommu.c
@@ -3289,10 +3289,7 @@ static int __init init_dmars(void)
 
 		if (!ecap_pass_through(iommu->ecap))
 			hw_pass_through = 0;
-#ifdef CONFIG_INTEL_IOMMU_SVM
-		if (pasid_supported(iommu))
-			intel_svm_init(iommu);
-#endif
+		intel_svm_check(iommu);
 	}
 
 	/*
@@ -4471,10 +4468,7 @@ static int intel_iommu_add(struct dmar_drhd_unit *dmaru)
 	if (ret)
 		goto out;
 
-#ifdef CONFIG_INTEL_IOMMU_SVM
-	if (pasid_supported(iommu))
-		intel_svm_init(iommu);
-#endif
+	intel_svm_check(iommu);
 
 	if (dmaru->ignored) {
 		/*
diff --git a/drivers/iommu/intel-svm.c b/drivers/iommu/intel-svm.c
index 9b159132405d..716c543488f6 100644
--- a/drivers/iommu/intel-svm.c
+++ b/drivers/iommu/intel-svm.c
@@ -23,19 +23,6 @@
 
 static irqreturn_t prq_event_thread(int irq, void *d);
 
-int intel_svm_init(struct intel_iommu *iommu)
-{
-	if (cpu_feature_enabled(X86_FEATURE_GBPAGES) &&
-			!cap_fl1gp_support(iommu->cap))
-		return -EINVAL;
-
-	if (cpu_feature_enabled(X86_FEATURE_LA57) &&
-			!cap_5lp_support(iommu->cap))
-		return -EINVAL;
-
-	return 0;
-}
-
 #define PRQ_ORDER 0
 
 int intel_svm_enable_prq(struct intel_iommu *iommu)
@@ -99,6 +86,33 @@ int intel_svm_finish_prq(struct intel_iommu *iommu)
 	return 0;
 }
 
+static inline bool intel_svm_capable(struct intel_iommu *iommu)
+{
+	return iommu->flags & VTD_FLAG_SVM_CAPABLE;
+}
+
+void intel_svm_check(struct intel_iommu *iommu)
+{
+	if (!pasid_supported(iommu))
+		return;
+
+	if (cpu_feature_enabled(X86_FEATURE_GBPAGES) &&
+	    !cap_fl1gp_support(iommu->cap)) {
+		pr_err("%s SVM disabled, incompatible 1GB page capability\n",
+		       iommu->name);
+		return;
+	}
+
+	if (cpu_feature_enabled(X86_FEATURE_LA57) &&
+	    !cap_5lp_support(iommu->cap)) {
+		pr_err("%s SVM disabled, incompatible paging mode\n",
+		       iommu->name);
+		return;
+	}
+
+	iommu->flags |= VTD_FLAG_SVM_CAPABLE;
+}
+
 static void intel_flush_svm_range_dev (struct intel_svm *svm, struct intel_svm_dev *sdev,
 				unsigned long address, unsigned long pages, int ih)
 {
diff --git a/include/linux/intel-iommu.h b/include/linux/intel-iommu.h
index ed11ef594378..7dcfa1c4a844 100644
--- a/include/linux/intel-iommu.h
+++ b/include/linux/intel-iommu.h
@@ -433,6 +433,7 @@ enum {
 
 #define VTD_FLAG_TRANS_PRE_ENABLED	(1 << 0)
 #define VTD_FLAG_IRQ_REMAP_PRE_ENABLED	(1 << 1)
+#define VTD_FLAG_SVM_CAPABLE		(1 << 2)
 
 extern int intel_iommu_sm;
 
@@ -656,7 +657,7 @@ void iommu_flush_write_buffer(struct intel_iommu *iommu);
 int intel_iommu_enable_pasid(struct intel_iommu *iommu, struct device *dev);
 
 #ifdef CONFIG_INTEL_IOMMU_SVM
-int intel_svm_init(struct intel_iommu *iommu);
+extern void intel_svm_check(struct intel_iommu *iommu);
 extern int intel_svm_enable_prq(struct intel_iommu *iommu);
 extern int intel_svm_finish_prq(struct intel_iommu *iommu);
 
@@ -684,6 +685,8 @@ struct intel_svm {
 };
 
 extern struct intel_iommu *intel_svm_device_to_iommu(struct device *dev);
+#else
+static inline void intel_svm_check(struct intel_iommu *iommu) {}
 #endif
 
 #ifdef CONFIG_INTEL_IOMMU_DEBUGFS
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
