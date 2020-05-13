Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 752F21D2268
	for <lists.iommu@lfdr.de>; Thu, 14 May 2020 00:55:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2202288377;
	Wed, 13 May 2020 22:55:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a+BhuulODbSj; Wed, 13 May 2020 22:55:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 38C4C86D82;
	Wed, 13 May 2020 22:55:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 25F4AC016F;
	Wed, 13 May 2020 22:55:44 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 57B64C088B
 for <iommu@lists.linux-foundation.org>; Wed, 13 May 2020 22:55:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 51CB385B5B
 for <iommu@lists.linux-foundation.org>; Wed, 13 May 2020 22:55:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XzCYmCGZvyWz for <iommu@lists.linux-foundation.org>;
 Wed, 13 May 2020 22:55:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 50A7985D55
 for <iommu@lists.linux-foundation.org>; Wed, 13 May 2020 22:55:41 +0000 (UTC)
IronPort-SDR: 7cvA5UKfNscM1otAcSQU/9qCQ9kPkZqa1HGR3SbE4+7fIDA297gbeRGNvZNw6TFQyEP0y8eDhD
 7Qy9A2Ng/O/w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2020 15:55:40 -0700
IronPort-SDR: bcqBrEcVBabFSGtrRciIUmSxWVg/f74t6GT/ei4lplsDGSFZqtEhjo70GiwujZ7lbFvN5OQUpJ
 k9wNJPyv9V9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,389,1583222400"; d="scan'208";a="437682651"
Received: from jacob-builder.jf.intel.com ([10.7.199.155])
 by orsmga005.jf.intel.com with ESMTP; 13 May 2020 15:55:40 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: "Lu Baolu" <baolu.lu@linux.intel.com>, iommu@lists.linux-foundation.org,
 LKML <linux-kernel@vger.kernel.org>, Joerg Roedel <joro@8bytes.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>,
 Eric Auger <eric.auger@redhat.com>
Subject: [PATCH v13 2/8] iommu/vt-d: Use a helper function to skip agaw for SL
Date: Wed, 13 May 2020 16:01:43 -0700
Message-Id: <1589410909-38925-3-git-send-email-jacob.jun.pan@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589410909-38925-1-git-send-email-jacob.jun.pan@linux.intel.com>
References: <1589410909-38925-1-git-send-email-jacob.jun.pan@linux.intel.com>
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Raj Ashok <ashok.raj@intel.com>,
 Christoph Hellwig <hch@infradead.org>,
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

Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
---
 drivers/iommu/intel-pasid.c | 33 +++++++++++++++++++++++----------
 1 file changed, 23 insertions(+), 10 deletions(-)

diff --git a/drivers/iommu/intel-pasid.c b/drivers/iommu/intel-pasid.c
index 22b30f10b396..d9cea3011b58 100644
--- a/drivers/iommu/intel-pasid.c
+++ b/drivers/iommu/intel-pasid.c
@@ -500,6 +500,25 @@ int intel_pasid_setup_first_level(struct intel_iommu *iommu,
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
+		if (!dma_pte_present(*pgd))
+			return -EINVAL;
+	}
+
+	return agaw;
+}
+
+/*
  * Set up the scalable mode pasid entry for second only translation type.
  */
 int intel_pasid_setup_second_level(struct intel_iommu *iommu,
@@ -522,17 +541,11 @@ int intel_pasid_setup_second_level(struct intel_iommu *iommu,
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
