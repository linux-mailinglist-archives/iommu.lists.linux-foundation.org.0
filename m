Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id DC22911A123
	for <lists.iommu@lfdr.de>; Wed, 11 Dec 2019 03:13:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6ECED87D71;
	Wed, 11 Dec 2019 02:13:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oaRcVGfc2l7E; Wed, 11 Dec 2019 02:13:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id D2AC787D48;
	Wed, 11 Dec 2019 02:13:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BF957C0881;
	Wed, 11 Dec 2019 02:13:27 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D0A17C0881
 for <iommu@lists.linux-foundation.org>; Wed, 11 Dec 2019 02:13:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C021186C2C
 for <iommu@lists.linux-foundation.org>; Wed, 11 Dec 2019 02:13:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DYduo-9tJ-QX for <iommu@lists.linux-foundation.org>;
 Wed, 11 Dec 2019 02:13:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 436F985F0F
 for <iommu@lists.linux-foundation.org>; Wed, 11 Dec 2019 02:13:25 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Dec 2019 18:13:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,301,1571727600"; d="scan'208";a="225353013"
Received: from allen-box.sh.intel.com ([10.239.159.136])
 by orsmga002.jf.intel.com with ESMTP; 10 Dec 2019 18:13:22 -0800
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>, David Woodhouse <dwmw2@infradead.org>,
 Alex Williamson <alex.williamson@redhat.com>
Subject: [PATCH v3 3/6] iommu/vt-d: Add PASID_FLAG_FL5LP for first-level pasid
 setup
Date: Wed, 11 Dec 2019 10:12:16 +0800
Message-Id: <20191211021219.8997-4-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191211021219.8997-1-baolu.lu@linux.intel.com>
References: <20191211021219.8997-1-baolu.lu@linux.intel.com>
Cc: kevin.tian@intel.com, ashok.raj@intel.com, kvm@vger.kernel.org,
 sanjay.k.kumar@intel.com, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, yi.y.sun@intel.com
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

Current intel_pasid_setup_first_level() use 5-level paging for
first level translation if CPUs use 5-level paging mode too.
This makes sense for SVA usages since the page table is shared
between CPUs and IOMMUs. But it makes no sense if we only want
to use first level for IOVA translation. Add PASID_FLAG_FL5LP
bit in the flags which indicates whether the 5-level paging
mode should be used.

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/iommu/intel-pasid.c | 7 ++-----
 drivers/iommu/intel-pasid.h | 6 ++++++
 drivers/iommu/intel-svm.c   | 8 ++++++--
 3 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/intel-pasid.c b/drivers/iommu/intel-pasid.c
index 3cb569e76642..22b30f10b396 100644
--- a/drivers/iommu/intel-pasid.c
+++ b/drivers/iommu/intel-pasid.c
@@ -477,18 +477,15 @@ int intel_pasid_setup_first_level(struct intel_iommu *iommu,
 		pasid_set_sre(pte);
 	}
 
-#ifdef CONFIG_X86
-	/* Both CPU and IOMMU paging mode need to match */
-	if (cpu_feature_enabled(X86_FEATURE_LA57)) {
+	if (flags & PASID_FLAG_FL5LP) {
 		if (cap_5lp_support(iommu->cap)) {
 			pasid_set_flpm(pte, 1);
 		} else {
-			pr_err("VT-d has no 5-level paging support for CPU\n");
+			pr_err("No 5-level paging support for first-level\n");
 			pasid_clear_entry(pte);
 			return -EINVAL;
 		}
 	}
-#endif /* CONFIG_X86 */
 
 	pasid_set_domain_id(pte, did);
 	pasid_set_address_width(pte, iommu->agaw);
diff --git a/drivers/iommu/intel-pasid.h b/drivers/iommu/intel-pasid.h
index fc8cd8f17de1..92de6df24ccb 100644
--- a/drivers/iommu/intel-pasid.h
+++ b/drivers/iommu/intel-pasid.h
@@ -37,6 +37,12 @@
  */
 #define PASID_FLAG_SUPERVISOR_MODE	BIT(0)
 
+/*
+ * The PASID_FLAG_FL5LP flag Indicates using 5-level paging for first-
+ * level translation, otherwise, 4-level paging will be used.
+ */
+#define PASID_FLAG_FL5LP		BIT(1)
+
 struct pasid_dir_entry {
 	u64 val;
 };
diff --git a/drivers/iommu/intel-svm.c b/drivers/iommu/intel-svm.c
index 04023033b79f..d7f2a5358900 100644
--- a/drivers/iommu/intel-svm.c
+++ b/drivers/iommu/intel-svm.c
@@ -364,7 +364,9 @@ int intel_svm_bind_mm(struct device *dev, int *pasid, int flags, struct svm_dev_
 		ret = intel_pasid_setup_first_level(iommu, dev,
 				mm ? mm->pgd : init_mm.pgd,
 				svm->pasid, FLPT_DEFAULT_DID,
-				mm ? 0 : PASID_FLAG_SUPERVISOR_MODE);
+				(mm ? 0 : PASID_FLAG_SUPERVISOR_MODE) |
+				(cpu_feature_enabled(X86_FEATURE_LA57) ?
+				 PASID_FLAG_FL5LP : 0));
 		spin_unlock(&iommu->lock);
 		if (ret) {
 			if (mm)
@@ -385,7 +387,9 @@ int intel_svm_bind_mm(struct device *dev, int *pasid, int flags, struct svm_dev_
 		ret = intel_pasid_setup_first_level(iommu, dev,
 						mm ? mm->pgd : init_mm.pgd,
 						svm->pasid, FLPT_DEFAULT_DID,
-						mm ? 0 : PASID_FLAG_SUPERVISOR_MODE);
+						(mm ? 0 : PASID_FLAG_SUPERVISOR_MODE) |
+						(cpu_feature_enabled(X86_FEATURE_LA57) ?
+						PASID_FLAG_FL5LP : 0));
 		spin_unlock(&iommu->lock);
 		if (ret) {
 			kfree(sdev);
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
