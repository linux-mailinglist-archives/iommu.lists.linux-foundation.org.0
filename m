Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 750C43EECB3
	for <lists.iommu@lfdr.de>; Tue, 17 Aug 2021 14:46:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EA2A140247;
	Tue, 17 Aug 2021 12:46:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7jHQW2APgxOa; Tue, 17 Aug 2021 12:46:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id DCBF54018A;
	Tue, 17 Aug 2021 12:46:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B1AE6C0022;
	Tue, 17 Aug 2021 12:46:31 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D8AE5C000E
 for <iommu@lists.linux-foundation.org>; Tue, 17 Aug 2021 12:46:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C76F740530
 for <iommu@lists.linux-foundation.org>; Tue, 17 Aug 2021 12:46:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hc4KaQLqaeG1 for <iommu@lists.linux-foundation.org>;
 Tue, 17 Aug 2021 12:46:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E22444052A
 for <iommu@lists.linux-foundation.org>; Tue, 17 Aug 2021 12:46:29 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10078"; a="195655120"
X-IronPort-AV: E=Sophos;i="5.84,328,1620716400"; d="scan'208";a="195655120"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2021 05:46:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,328,1620716400"; d="scan'208";a="462385522"
Received: from allen-box.sh.intel.com ([10.239.159.118])
 by orsmga007.jf.intel.com with ESMTP; 17 Aug 2021 05:46:06 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH 1/2] iommu/vt-d: Fix PASID reference leak
Date: Tue, 17 Aug 2021 20:43:20 +0800
Message-Id: <20210817124321.1517985-2-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210817124321.1517985-1-baolu.lu@linux.intel.com>
References: <20210817124321.1517985-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Cc: Fenghua Yu <fenghua.yu@intel.com>,
 Kumar Sanjay K <sanjay.k.kumar@intel.com>, iommu@lists.linux-foundation.org,
 Yi Sun <yi.y.sun@intel.com>
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

From: Fenghua Yu <fenghua.yu@intel.com>

A PASID reference is increased whenever a device is bound to an mm (and
its PASID) successfully (i.e. the device's sdev user count is increased).
But the reference is not dropped every time the device is unbound
successfully from the mm (i.e. the device's sdev user count is decreased).
The reference is dropped only once by calling intel_svm_free_pasid() when
there isn't any device bound to the mm. intel_svm_free_pasid() drops the
reference and only frees the PASID on zero reference.

Fix the issue by dropping the PASID reference and freeing the PASID when
no reference on successful unbinding the device by calling
intel_svm_free_pasid() .

Fixes: 4048377414162 ("iommu/vt-d: Use iommu_sva_alloc(free)_pasid() helpers")
Signed-off-by: Fenghua Yu <fenghua.yu@intel.com>
Link: https://lore.kernel.org/r/20210813181345.1870742-1-fenghua.yu@intel.com
Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/iommu/intel/svm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/intel/svm.c b/drivers/iommu/intel/svm.c
index 9b0f22bc0514..4b9b3f35ba0e 100644
--- a/drivers/iommu/intel/svm.c
+++ b/drivers/iommu/intel/svm.c
@@ -675,7 +675,6 @@ static int intel_svm_unbind_mm(struct device *dev, u32 pasid)
 			kfree_rcu(sdev, rcu);
 
 			if (list_empty(&svm->devs)) {
-				intel_svm_free_pasid(mm);
 				if (svm->notifier.ops) {
 					mmu_notifier_unregister(&svm->notifier, mm);
 					/* Clear mm's pasid. */
@@ -690,6 +689,8 @@ static int intel_svm_unbind_mm(struct device *dev, u32 pasid)
 				kfree(svm);
 			}
 		}
+		/* Drop a PASID reference and free it if no reference. */
+		intel_svm_free_pasid(mm);
 	}
 out:
 	return ret;
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
