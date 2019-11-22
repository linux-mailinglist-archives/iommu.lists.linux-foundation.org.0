Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id CB73D105EE7
	for <lists.iommu@lfdr.de>; Fri, 22 Nov 2019 04:08:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 7AD2E25EC9;
	Fri, 22 Nov 2019 03:08:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zsWGUB-Z-ZuF; Fri, 22 Nov 2019 03:08:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 4C32125E94;
	Fri, 22 Nov 2019 03:08:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 392AFC1DDB;
	Fri, 22 Nov 2019 03:08:31 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7B5AEC18DA
 for <iommu@lists.linux-foundation.org>; Fri, 22 Nov 2019 03:08:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 722BC871EB
 for <iommu@lists.linux-foundation.org>; Fri, 22 Nov 2019 03:08:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mKLRSKkR1jRB for <iommu@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 03:08:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id C34048709E
 for <iommu@lists.linux-foundation.org>; Fri, 22 Nov 2019 03:08:28 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Nov 2019 19:08:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,228,1571727600"; d="scan'208";a="232540456"
Received: from allen-box.sh.intel.com ([10.239.159.136])
 by fmsmga004.fm.intel.com with ESMTP; 21 Nov 2019 19:08:26 -0800
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH 4/5] iommu/vt-d: Consolidate pasid-based tlb invalidation
Date: Fri, 22 Nov 2019 11:04:48 +0800
Message-Id: <20191122030449.28892-5-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191122030449.28892-1-baolu.lu@linux.intel.com>
References: <20191122030449.28892-1-baolu.lu@linux.intel.com>
Cc: kevin.tian@intel.com, ashok.raj@intel.com, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, David Woodhouse <dwmw2@infradead.org>
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

Merge pasid-based tlb invalidation into iommu->flush.p_iotlb_inv.

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/iommu/intel-iommu.c | 43 +++++++++++++++++++++++++++++++++++++
 drivers/iommu/intel-pasid.c | 18 ++--------------
 drivers/iommu/intel-svm.c   | 23 +++-----------------
 3 files changed, 48 insertions(+), 36 deletions(-)

diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
index 4eeb18942d3c..fec78cc877c1 100644
--- a/drivers/iommu/intel-iommu.c
+++ b/drivers/iommu/intel-iommu.c
@@ -3032,6 +3032,48 @@ qi_flush_dev_iotlb(struct intel_iommu *iommu, u16 sid, u16 pfsid,
 	qi_submit_sync(&desc, iommu);
 }
 
+/* PASID-based IOTLB invalidation */
+static void
+qi_flush_piotlb(struct intel_iommu *iommu, u16 did, u32 pasid, u64 addr,
+		unsigned long npages, bool ih)
+{
+	struct qi_desc desc = {.qw2 = 0, .qw3 = 0};
+
+	/*
+	 * npages == -1 means a PASID-selective invalidation, otherwise,
+	 * a positive value for Page-selective-within-PASID invalidation.
+	 * 0 is not a valid input.
+	 */
+	if (WARN_ON(!npages)) {
+		pr_err("Invalid input npages = %ld\n", npages);
+		return;
+	}
+
+	if (npages == -1) {
+		desc.qw0 = QI_EIOTLB_PASID(pasid) |
+				QI_EIOTLB_DID(did) |
+				QI_EIOTLB_GRAN(QI_GRAN_NONG_PASID) |
+				QI_EIOTLB_TYPE;
+		desc.qw1 = 0;
+	} else {
+		int mask = ilog2(__roundup_pow_of_two(npages));
+		unsigned long align = (1ULL << (VTD_PAGE_SHIFT + mask));
+
+		if (WARN_ON_ONCE(!ALIGN(addr, align)))
+			addr &= ~(align - 1);
+
+		desc.qw0 = QI_EIOTLB_PASID(pasid) |
+				QI_EIOTLB_DID(did) |
+				QI_EIOTLB_GRAN(QI_GRAN_PSI_PASID) |
+				QI_EIOTLB_TYPE;
+		desc.qw1 = QI_EIOTLB_ADDR(addr) |
+				QI_EIOTLB_IH(ih) |
+				QI_EIOTLB_AM(mask);
+	}
+
+	qi_submit_sync(&desc, iommu);
+}
+
 static void intel_iommu_init_qi(struct intel_iommu *iommu)
 {
 	/*
@@ -3065,6 +3107,7 @@ static void intel_iommu_init_qi(struct intel_iommu *iommu)
 		iommu->flush.iotlb_inv = qi_flush_iotlb;
 		iommu->flush.pc_inv = qi_flush_pasid;
 		iommu->flush.dev_tlb_inv = qi_flush_dev_iotlb;
+		iommu->flush.p_iotlb_inv = qi_flush_piotlb;
 		pr_info("%s: Using Queued invalidation\n", iommu->name);
 	}
 }
diff --git a/drivers/iommu/intel-pasid.c b/drivers/iommu/intel-pasid.c
index 01dd9c86178b..78ff4eee8595 100644
--- a/drivers/iommu/intel-pasid.c
+++ b/drivers/iommu/intel-pasid.c
@@ -359,20 +359,6 @@ pasid_set_flpm(struct pasid_entry *pe, u64 value)
 	pasid_set_bits(&pe->val[2], GENMASK_ULL(3, 2), value << 2);
 }
 
-static void
-iotlb_invalidation_with_pasid(struct intel_iommu *iommu, u16 did, u32 pasid)
-{
-	struct qi_desc desc;
-
-	desc.qw0 = QI_EIOTLB_PASID(pasid) | QI_EIOTLB_DID(did) |
-			QI_EIOTLB_GRAN(QI_GRAN_NONG_PASID) | QI_EIOTLB_TYPE;
-	desc.qw1 = 0;
-	desc.qw2 = 0;
-	desc.qw3 = 0;
-
-	qi_submit_sync(&desc, iommu);
-}
-
 static void
 devtlb_invalidation_with_pasid(struct intel_iommu *iommu,
 			       struct device *dev, int pasid)
@@ -409,7 +395,7 @@ void intel_pasid_tear_down_entry(struct intel_iommu *iommu,
 		clflush_cache_range(pte, sizeof(*pte));
 
 	iommu->flush.pc_inv(iommu, did, pasid, QI_PC_GRAN_PSWD);
-	iotlb_invalidation_with_pasid(iommu, did, pasid);
+	iommu->flush.p_iotlb_inv(iommu, did, pasid, 0, -1, 0);
 
 	/* Device IOTLB doesn't need to be flushed in caching mode. */
 	if (!cap_caching_mode(iommu->cap))
@@ -425,7 +411,7 @@ static void pasid_flush_caches(struct intel_iommu *iommu,
 
 	if (cap_caching_mode(iommu->cap)) {
 		iommu->flush.pc_inv(iommu, did, pasid, QI_PC_GRAN_PSWD);
-		iotlb_invalidation_with_pasid(iommu, did, pasid);
+		iommu->flush.p_iotlb_inv(iommu, did, pasid, 0, -1, 0);
 	} else {
 		iommu_flush_write_buffer(iommu);
 	}
diff --git a/drivers/iommu/intel-svm.c b/drivers/iommu/intel-svm.c
index f5594b9981a5..02c6b14f0568 100644
--- a/drivers/iommu/intel-svm.c
+++ b/drivers/iommu/intel-svm.c
@@ -118,27 +118,10 @@ static void intel_flush_svm_range_dev (struct intel_svm *svm, struct intel_svm_d
 				unsigned long address, unsigned long pages, int ih)
 {
 	struct qi_desc desc;
+	struct intel_iommu *iommu = svm->iommu;
 
-	if (pages == -1) {
-		desc.qw0 = QI_EIOTLB_PASID(svm->pasid) |
-			QI_EIOTLB_DID(sdev->did) |
-			QI_EIOTLB_GRAN(QI_GRAN_NONG_PASID) |
-			QI_EIOTLB_TYPE;
-		desc.qw1 = 0;
-	} else {
-		int mask = ilog2(__roundup_pow_of_two(pages));
-
-		desc.qw0 = QI_EIOTLB_PASID(svm->pasid) |
-				QI_EIOTLB_DID(sdev->did) |
-				QI_EIOTLB_GRAN(QI_GRAN_PSI_PASID) |
-				QI_EIOTLB_TYPE;
-		desc.qw1 = QI_EIOTLB_ADDR(address) |
-				QI_EIOTLB_IH(ih) |
-				QI_EIOTLB_AM(mask);
-	}
-	desc.qw2 = 0;
-	desc.qw3 = 0;
-	qi_submit_sync(&desc, svm->iommu);
+	iommu->flush.p_iotlb_inv(iommu, sdev->did,
+				 svm->pasid, address, pages, ih);
 
 	if (sdev->dev_iotlb) {
 		desc.qw0 = QI_DEV_EIOTLB_PASID(svm->pasid) |
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
