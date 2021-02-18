Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 3175031F4F4
	for <lists.iommu@lfdr.de>; Fri, 19 Feb 2021 07:02:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7540086EAF;
	Fri, 19 Feb 2021 06:02:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id COo9oMzYGabM; Fri, 19 Feb 2021 06:02:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0FFE886FCB;
	Fri, 19 Feb 2021 06:02:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F151DC000D;
	Fri, 19 Feb 2021 06:02:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 50D4FC000E
 for <iommu@lists.linux-foundation.org>; Fri, 19 Feb 2021 06:02:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 3AE06872B2
 for <iommu@lists.linux-foundation.org>; Fri, 19 Feb 2021 06:02:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mb5mY6JgZ-4f for <iommu@lists.linux-foundation.org>;
 Fri, 19 Feb 2021 06:02:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by hemlock.osuosl.org (Postfix) with ESMTPS id B229387372
 for <iommu@lists.linux-foundation.org>; Fri, 19 Feb 2021 06:02:30 +0000 (UTC)
IronPort-SDR: vjTLKwGK24mKpl/qPdpOzj8Ca9b5pwEarQjSiWFjt+eVT8ri6klpuNebRnOR5+oOH7V+jLtBhb
 jkGnH375qwnw==
X-IronPort-AV: E=McAfee;i="6000,8403,9899"; a="245198115"
X-IronPort-AV: E=Sophos;i="5.81,189,1610438400"; d="scan'208";a="245198115"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2021 22:02:29 -0800
IronPort-SDR: XQw/6G0ph2O1Y6a0jvL080Eu9m5E4qPpB4jhUj1UDJUDsMTs6fKeXQZGlgI3+YILCiRCzndCjr
 4FlUQPJZ9XdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,189,1610438400"; d="scan'208";a="362829352"
Received: from otc-wp-03.jf.intel.com ([10.54.39.79])
 by orsmga003.jf.intel.com with ESMTP; 18 Feb 2021 22:02:29 -0800
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: LKML <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 Joerg Roedel <joro@8bytes.org>, "Lu Baolu" <baolu.lu@linux.intel.com>
Subject: [PATCH 3/4] iommu/vt-d: Reject unsupported page request modes
Date: Thu, 18 Feb 2021 13:31:17 -0800
Message-Id: <1613683878-89946-4-git-send-email-jacob.jun.pan@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613683878-89946-1-git-send-email-jacob.jun.pan@linux.intel.com>
References: <1613683878-89946-1-git-send-email-jacob.jun.pan@linux.intel.com>
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Dave Jiang <dave.jiang@intel.com>,
 Raj Ashok <ashok.raj@intel.com>, Yi Sun <yi.y.sun@intel.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>, Wu Hao <hao.wu@intel.com>
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
