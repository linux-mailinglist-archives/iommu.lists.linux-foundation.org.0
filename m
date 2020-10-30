Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D15229FBD4
	for <lists.iommu@lfdr.de>; Fri, 30 Oct 2020 03:58:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 43FA086AC4;
	Fri, 30 Oct 2020 02:58:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8QuSb5D64rSx; Fri, 30 Oct 2020 02:58:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E0DBF86AE9;
	Fri, 30 Oct 2020 02:58:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CBDD5C0051;
	Fri, 30 Oct 2020 02:58:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2476FC0051
 for <iommu@lists.linux-foundation.org>; Fri, 30 Oct 2020 02:58:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 10C8A8747A
 for <iommu@lists.linux-foundation.org>; Fri, 30 Oct 2020 02:58:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EqAAy0Aa8TIV for <iommu@lists.linux-foundation.org>;
 Fri, 30 Oct 2020 02:58:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 79B578742C
 for <iommu@lists.linux-foundation.org>; Fri, 30 Oct 2020 02:58:19 +0000 (UTC)
IronPort-SDR: XeY9nSBStHcBju+zDL2anKl5xw0VA2itkzsaD6+dvEx+n7M9mZD/GvVYkYSLwqmSjVFUZ8y16A
 RoTI9eAQbfqw==
X-IronPort-AV: E=McAfee;i="6000,8403,9789"; a="165054115"
X-IronPort-AV: E=Sophos;i="5.77,432,1596524400"; d="scan'208";a="165054115"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2020 19:58:19 -0700
IronPort-SDR: F5edtGBYImLPwum8yOMDL5Mle0zF4/DVLP2olhY+7FWpKf488xMvUn6fveggURre8kbs0Ilelt
 uMs08YyzjIxw==
X-IronPort-AV: E=Sophos;i="5.77,431,1596524400"; d="scan'208";a="469374416"
Received: from yisun1-ubuntu2.bj.intel.com ([10.238.144.104])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 29 Oct 2020 19:58:16 -0700
From: Yi Sun <yi.y.sun@linux.intel.com>
To: joro@8bytes.org, dwmw2@infradead.org, baolu.lu@linux.intel.com,
 jean-philippe@linaro.org
Subject: [PATCH v2 2/2] iommu/vt-d: Fix a bug for PDP check in prq_event_thread
Date: Fri, 30 Oct 2020 10:37:24 +0800
Message-Id: <1604025444-6954-3-git-send-email-yi.y.sun@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1604025444-6954-1-git-send-email-yi.y.sun@linux.intel.com>
References: <1604025444-6954-1-git-send-email-yi.y.sun@linux.intel.com>
Cc: Yi Sun <yi.y.sun@linux.intel.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Liu@osuosl.org
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

From: "Liu, Yi L" <yi.l.liu@intel.com>

In prq_event_thread(), the QI_PGRP_PDP is wrongly set by
'req->pasid_present' which should be replaced to
'req->priv_data_present'.

Fixes: 5b438f4ba315 ("iommu/vt-d: Support page request in scalable mode")
Signed-off-by: Liu, Yi L <yi.l.liu@intel.com>
Signed-off-by: Yi Sun <yi.y.sun@linux.intel.com>
---
 drivers/iommu/intel/svm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/intel/svm.c b/drivers/iommu/intel/svm.c
index 7584669..3242ebd 100644
--- a/drivers/iommu/intel/svm.c
+++ b/drivers/iommu/intel/svm.c
@@ -1035,7 +1035,7 @@ static irqreturn_t prq_event_thread(int irq, void *d)
 			resp.qw0 = QI_PGRP_PASID(req->pasid) |
 				QI_PGRP_DID(req->rid) |
 				QI_PGRP_PASID_P(req->pasid_present) |
-				QI_PGRP_PDP(req->pasid_present) |
+				QI_PGRP_PDP(req->priv_data_present) |
 				QI_PGRP_RESP_CODE(result) |
 				QI_PGRP_RESP_TYPE;
 			resp.qw1 = QI_PGRP_IDX(req->prg_index) |
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
