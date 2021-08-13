Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0503EBBE7
	for <lists.iommu@lfdr.de>; Fri, 13 Aug 2021 20:14:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6066D40FF8;
	Fri, 13 Aug 2021 18:14:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sQJFYPNRSWLp; Fri, 13 Aug 2021 18:14:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 5226A401FE;
	Fri, 13 Aug 2021 18:14:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1BEC7C000E;
	Fri, 13 Aug 2021 18:14:37 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0A5E7C000E
 for <iommu@lists.linux-foundation.org>; Fri, 13 Aug 2021 18:14:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 077E280C06
 for <iommu@lists.linux-foundation.org>; Fri, 13 Aug 2021 18:14:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3X28RCWBHs16 for <iommu@lists.linux-foundation.org>;
 Fri, 13 Aug 2021 18:14:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4CC7380B86
 for <iommu@lists.linux-foundation.org>; Fri, 13 Aug 2021 18:14:35 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10075"; a="215599562"
X-IronPort-AV: E=Sophos;i="5.84,319,1620716400"; d="scan'208";a="215599562"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2021 11:14:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,319,1620716400"; d="scan'208";a="508340240"
Received: from otcwcpicx3.sc.intel.com ([172.25.55.73])
 by fmsmga004.fm.intel.com with ESMTP; 13 Aug 2021 11:14:32 -0700
From: Fenghua Yu <fenghua.yu@intel.com>
To: "Lu Baolu" <baolu.lu@linux.intel.com>, "Joerg Roedel" <joro@8bytes.org>,
 "David Woodhouse" <dwmw2@infradead.org>, "Ashok Raj" <ashok.raj@intel.com>,
 "Dave Hansen" <dave.hansen@intel.com>,
 "Jacob Jun Pan" <jacob.jun.pan@intel.com>,
 "Ravi V Shankar" <ravi.v.shankar@intel.com>
Subject: [PATCH] iommu/vt-d: Fix PASID reference leak
Date: Fri, 13 Aug 2021 18:13:45 +0000
Message-Id: <20210813181345.1870742-1-fenghua.yu@intel.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Cc: Fenghua Yu <fenghua.yu@intel.com>, iommu@lists.linux-foundation.org
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

Signed-off-by: Fenghua Yu <fenghua.yu@intel.com>
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
2.32.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
