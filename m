Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7B419DE09
	for <lists.iommu@lfdr.de>; Fri,  3 Apr 2020 20:36:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 05B0788E41;
	Fri,  3 Apr 2020 18:36:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eNUB+VKVZSUL; Fri,  3 Apr 2020 18:36:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 33AC188E9F;
	Fri,  3 Apr 2020 18:36:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1FAC5C1AE2;
	Fri,  3 Apr 2020 18:36:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 73A8EC07FF
 for <iommu@lists.linux-foundation.org>; Fri,  3 Apr 2020 18:36:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 62DBD87DB8
 for <iommu@lists.linux-foundation.org>; Fri,  3 Apr 2020 18:36:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ur+TIFVomtmF for <iommu@lists.linux-foundation.org>;
 Fri,  3 Apr 2020 18:36:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 92CB788091
 for <iommu@lists.linux-foundation.org>; Fri,  3 Apr 2020 18:36:29 +0000 (UTC)
IronPort-SDR: bwLwyvk+yoJ7G3644jHm23ImnPe6pGyZAa+lyfBzfTL5dDStnjzfZkQrC842adT2KZ8Y4jyw/Q
 I6ETKdpSUXAg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2020 11:36:27 -0700
IronPort-SDR: P+PjU57kf5ZV4+2nDd+GmNLO3ZXL3lNEuDnNL15enVKjxlAHmsrxvCKbUOTEcJgMcNzHVO71VF
 7hF1j078GY2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,340,1580803200"; d="scan'208";a="268439814"
Received: from jacob-builder.jf.intel.com ([10.7.199.155])
 by orsmga002.jf.intel.com with ESMTP; 03 Apr 2020 11:36:27 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: "Lu Baolu" <baolu.lu@linux.intel.com>, iommu@lists.linux-foundation.org,
 LKML <linux-kernel@vger.kernel.org>, Joerg Roedel <joro@8bytes.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>,
 Eric Auger <eric.auger@redhat.com>
Subject: [PATCH v11 03/10] iommu/vt-d: Use a helper function to skip agaw for
 SL
Date: Fri,  3 Apr 2020 11:42:07 -0700
Message-Id: <1585939334-21396-4-git-send-email-jacob.jun.pan@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1585939334-21396-1-git-send-email-jacob.jun.pan@linux.intel.com>
References: <1585939334-21396-1-git-send-email-jacob.jun.pan@linux.intel.com>
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Raj Ashok <ashok.raj@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>,
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

An Intel iommu domain uses 5-level page table by default. If the
iommu that the domain tries to attach supports less page levels,
the top level page tables should be skipped. Add a helper to do
this so that it could be used in other places.

---
v11 Added Baolu's commit message and squashed 4 & 5 from v10.
---

Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/iommu/intel-pasid.c | 34 ++++++++++++++++++++++++----------
 1 file changed, 24 insertions(+), 10 deletions(-)

diff --git a/drivers/iommu/intel-pasid.c b/drivers/iommu/intel-pasid.c
index 22b30f10b396..66c364719ad1 100644
--- a/drivers/iommu/intel-pasid.c
+++ b/drivers/iommu/intel-pasid.c
@@ -500,6 +500,26 @@ int intel_pasid_setup_first_level(struct intel_iommu *iommu,
 }
 
 /*
+ * Skip top levels of page tables for iommu which has less agaw
+ * than default. Unnecessary for PT mode.
+ */
+static inline int iommu_skip_agaw(struct dmar_domain *domain,
+				  struct intel_iommu *iommu,
+				  struct dma_pte **pgd)
+{
+	int agaw;
+
+	for (agaw = domain->agaw; agaw > iommu->agaw; agaw--) {
+		*pgd = phys_to_virt(dma_pte_addr(*pgd));
+		if (!dma_pte_present(*pgd)) {
+			return -EINVAL;
+		}
+	}
+
+	return agaw;
+}
+
+/*
  * Set up the scalable mode pasid entry for second only translation type.
  */
 int intel_pasid_setup_second_level(struct intel_iommu *iommu,
@@ -522,17 +542,11 @@ int intel_pasid_setup_second_level(struct intel_iommu *iommu,
 		return -EINVAL;
 	}
 
-	/*
-	 * Skip top levels of page tables for iommu which has less agaw
-	 * than default. Unnecessary for PT mode.
-	 */
 	pgd = domain->pgd;
-	for (agaw = domain->agaw; agaw > iommu->agaw; agaw--) {
-		pgd = phys_to_virt(dma_pte_addr(pgd));
-		if (!dma_pte_present(pgd)) {
-			dev_err(dev, "Invalid domain page table\n");
-			return -EINVAL;
-		}
+	agaw = iommu_skip_agaw(domain, iommu, &pgd);
+	if (agaw < 0) {
+		dev_err(dev, "Invalid domain page table\n");
+		return -EINVAL;
 	}
 
 	pgd_val = virt_to_phys(pgd);
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
