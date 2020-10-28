Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CFD729CD75
	for <lists.iommu@lfdr.de>; Wed, 28 Oct 2020 02:57:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E84D1869B9;
	Wed, 28 Oct 2020 01:57:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xHIrSAeIowWA; Wed, 28 Oct 2020 01:57:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BA5CC869B8;
	Wed, 28 Oct 2020 01:57:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A5CA2C0051;
	Wed, 28 Oct 2020 01:57:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BA941C0051
 for <iommu@lists.linux-foundation.org>; Wed, 28 Oct 2020 01:57:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id A8ABE2E172
 for <iommu@lists.linux-foundation.org>; Wed, 28 Oct 2020 01:57:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VW5qqPzKdP+S for <iommu@lists.linux-foundation.org>;
 Wed, 28 Oct 2020 01:57:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by silver.osuosl.org (Postfix) with ESMTPS id 38D672E122
 for <iommu@lists.linux-foundation.org>; Wed, 28 Oct 2020 01:57:50 +0000 (UTC)
IronPort-SDR: oq0oqjuNXpol+Qe+Tql92M1mKciW4YUO0JIGHhHv8kXy0e0KUvviu1uMuoo7vwFb559LvS5AvU
 kqFoHpxBbdNg==
X-IronPort-AV: E=McAfee;i="6000,8403,9787"; a="185942625"
X-IronPort-AV: E=Sophos;i="5.77,425,1596524400"; d="scan'208";a="185942625"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2020 18:57:50 -0700
IronPort-SDR: ySAY52Qi7L5Tl93LzgKsBgKukExS5AveMXMtM4WT9UbtL2GjkqGG1tWhaUotsZF6bvPT0AAQ03
 qYMWPB06++rg==
X-IronPort-AV: E=Sophos;i="5.77,425,1596524400"; d="scan'208";a="468554118"
Received: from yisun1-ubuntu2.bj.intel.com ([10.238.145.59])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 27 Oct 2020 18:57:48 -0700
From: Yi Sun <yi.y.sun@linux.intel.com>
To: joro@8bytes.org,
	dwmw2@infradead.org,
	baolu.lu@linux.intel.com
Subject: [PATCH v1 3/3] iommu/vt-d: Fix a bug for PDP check in prq_event_thread
Date: Wed, 28 Oct 2020 09:36:58 +0800
Message-Id: <1603849018-6578-4-git-send-email-yi.y.sun@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1603849018-6578-1-git-send-email-yi.y.sun@linux.intel.com>
References: <1603849018-6578-1-git-send-email-yi.y.sun@linux.intel.com>
Cc: iommu@lists.linux-foundation.org, Yi Sun <yi.y.sun@linux.intel.com>,
 linux-kernel@vger.kernel.org, Liu@osuosl.org
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

Signed-off-by: Liu, Yi L <yi.l.liu@intel.com>
Signed-off-by: Yi Sun <yi.y.sun@linux.intel.com>
---
 drivers/iommu/intel/svm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/intel/svm.c b/drivers/iommu/intel/svm.c
index 75d9dc9..1870248 100644
--- a/drivers/iommu/intel/svm.c
+++ b/drivers/iommu/intel/svm.c
@@ -1032,7 +1032,7 @@ static irqreturn_t prq_event_thread(int irq, void *d)
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
