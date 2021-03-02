Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D6A32A99C
	for <lists.iommu@lfdr.de>; Tue,  2 Mar 2021 19:45:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C0094CF91;
	Tue,  2 Mar 2021 18:45:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zIsvn51g0dCZ; Tue,  2 Mar 2021 18:45:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DBEF4EB91;
	Tue,  2 Mar 2021 18:45:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C0DD5C0016;
	Tue,  2 Mar 2021 18:45:51 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 21842C0012
 for <iommu@lists.linux-foundation.org>; Tue,  2 Mar 2021 18:45:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D750660717
 for <iommu@lists.linux-foundation.org>; Tue,  2 Mar 2021 18:45:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tNFPp68HSbIt for <iommu@lists.linux-foundation.org>;
 Tue,  2 Mar 2021 18:45:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4493C60723
 for <iommu@lists.linux-foundation.org>; Tue,  2 Mar 2021 18:45:48 +0000 (UTC)
IronPort-SDR: ld7iifIxAQrbs3rA9t+Q/Z9QoEmKO/xZgmbGG8KInszeQHUp4i78pdPsL9BGNe+JQXCYhqkWbR
 pCf1sesnDg7g==
X-IronPort-AV: E=McAfee;i="6000,8403,9911"; a="174575583"
X-IronPort-AV: E=Sophos;i="5.81,217,1610438400"; d="scan'208";a="174575583"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 10:45:47 -0800
IronPort-SDR: g3GivGKU19uek/rZqVdlDSjX5AV4F+2yBGH1BSxjrKxNaN0L37u4cVnx7Glb9M87GynBljQI8q
 B7MRIDpmNdjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,217,1610438400"; d="scan'208";a="406158811"
Received: from otc-wp-03.jf.intel.com ([10.54.39.79])
 by orsmga007.jf.intel.com with ESMTP; 02 Mar 2021 10:45:47 -0800
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: LKML <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 Joerg Roedel <joro@8bytes.org>, "Lu Baolu" <baolu.lu@linux.intel.com>,
 David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH v2 3/4] iommu/vt-d: Reject unsupported page request modes
Date: Tue,  2 Mar 2021 02:13:59 -0800
Message-Id: <1614680040-1989-4-git-send-email-jacob.jun.pan@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614680040-1989-1-git-send-email-jacob.jun.pan@linux.intel.com>
References: <1614680040-1989-1-git-send-email-jacob.jun.pan@linux.intel.com>
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Raj Ashok <ashok.raj@intel.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>
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

When supervisor/privilige mode SVM is used, we bind init_mm.pgd with
a supervisor PASID. There should not be any page fault for init_mm.
Execution request with DMA read is also not supported.

This patch checks PRQ descriptor for both unsupported configurations,
reject them both with invalid responses.

Fixes: 1c4f88b7f1f92 ("iommu/vt-d: Shared virtual address in scalable
mode")
Acked-by: Lu Baolu <baolu.lu@linux.intel.com>
Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
---
 drivers/iommu/intel/svm.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/intel/svm.c b/drivers/iommu/intel/svm.c
index 23a1e4f58c54..ff7ae7cc17d5 100644
--- a/drivers/iommu/intel/svm.c
+++ b/drivers/iommu/intel/svm.c
@@ -1113,7 +1113,17 @@ static irqreturn_t prq_event_thread(int irq, void *d)
 			       ((unsigned long long *)req)[1]);
 			goto no_pasid;
 		}
-
+		/* We shall not receive page request for supervisor SVM */
+		if (req->pm_req && (req->rd_req | req->wr_req)) {
+			pr_err("Unexpected page request in Privilege Mode");
+			/* No need to find the matching sdev as for bad_req */
+			goto no_pasid;
+		}
+		/* DMA read with exec requeset is not supported. */
+		if (req->exe_req && req->rd_req) {
+			pr_err("Execution request not supported\n");
+			goto no_pasid;
+		}
 		if (!svm || svm->pasid != req->pasid) {
 			rcu_read_lock();
 			svm = ioasid_find(NULL, req->pasid, NULL);
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
