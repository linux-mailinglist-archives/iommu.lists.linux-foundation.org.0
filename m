Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2611CE9D8
	for <lists.iommu@lfdr.de>; Tue, 12 May 2020 02:56:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 686CD881CC;
	Tue, 12 May 2020 00:56:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n7+yJqTQzEGg; Tue, 12 May 2020 00:56:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id A891A881EC;
	Tue, 12 May 2020 00:56:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9625FC016F;
	Tue, 12 May 2020 00:56:48 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0430AC016F
 for <iommu@lists.linux-foundation.org>; Tue, 12 May 2020 00:56:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E846F8816B
 for <iommu@lists.linux-foundation.org>; Tue, 12 May 2020 00:56:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kdynPle7Wo6a for <iommu@lists.linux-foundation.org>;
 Tue, 12 May 2020 00:56:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 6F80F881AB
 for <iommu@lists.linux-foundation.org>; Tue, 12 May 2020 00:56:46 +0000 (UTC)
IronPort-SDR: 8oKYCjag8Pbw3Z4UqnrfgCsIVbfsHXk0AlFz5yj7h+bGjWhwVqtT490tsQi0R1J7g3/y0j/B7n
 +KxFUu6xT4vQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2020 17:56:46 -0700
IronPort-SDR: jr7IzPvIgyAb4gLoDoVbyt/l90LGhGQQ3G7tBELtjQCTY9or0v30Q3lMbfmFQwNFFpDucGPrWY
 1TnsaqDBAPhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,381,1583222400"; d="scan'208";a="286458429"
Received: from allen-box.sh.intel.com ([10.239.159.139])
 by fmsmga004.fm.intel.com with ESMTP; 11 May 2020 17:56:44 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH v5 5/5] iommu/vt-d: Remove redundant IOTLB flush
Date: Tue, 12 May 2020 08:53:07 +0800
Message-Id: <20200512005307.19860-6-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200512005307.19860-1-baolu.lu@linux.intel.com>
References: <20200512005307.19860-1-baolu.lu@linux.intel.com>
Cc: kevin.tian@intel.com, ashok.raj@intel.com, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org
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

IOTLB flush already included in the PASID tear down and the page request
drain process. There is no need to flush again.

Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
---
 drivers/iommu/intel-svm.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/iommu/intel-svm.c b/drivers/iommu/intel-svm.c
index 84cc263cec47..d8e19486523f 100644
--- a/drivers/iommu/intel-svm.c
+++ b/drivers/iommu/intel-svm.c
@@ -209,11 +209,9 @@ static void intel_mm_release(struct mmu_notifier *mn, struct mm_struct *mm)
 	 * *has* to handle gracefully without affecting other processes.
 	 */
 	rcu_read_lock();
-	list_for_each_entry_rcu(sdev, &svm->devs, list) {
+	list_for_each_entry_rcu(sdev, &svm->devs, list)
 		intel_pasid_tear_down_entry(svm->iommu, sdev->dev,
 					    svm->pasid, true);
-		intel_flush_svm_range_dev(svm, sdev, 0, -1, 0);
-	}
 	rcu_read_unlock();
 
 }
@@ -407,7 +405,6 @@ int intel_svm_unbind_gpasid(struct device *dev, int pasid)
 			intel_pasid_tear_down_entry(iommu, dev,
 						    svm->pasid, false);
 			intel_svm_drain_prq(dev, svm->pasid);
-			intel_flush_svm_range_dev(svm, sdev, 0, -1, 0);
 			kfree_rcu(sdev, rcu);
 
 			if (list_empty(&svm->devs)) {
@@ -647,7 +644,6 @@ int intel_svm_unbind_mm(struct device *dev, int pasid)
 			intel_pasid_tear_down_entry(iommu, dev,
 						    svm->pasid, false);
 			intel_svm_drain_prq(dev, svm->pasid);
-			intel_flush_svm_range_dev(svm, sdev, 0, -1, 0);
 			kfree_rcu(sdev, rcu);
 
 			if (list_empty(&svm->devs)) {
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
