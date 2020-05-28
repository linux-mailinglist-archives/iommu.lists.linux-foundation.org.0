Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id C91031E68EE
	for <lists.iommu@lfdr.de>; Thu, 28 May 2020 19:57:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4F36A88241;
	Thu, 28 May 2020 17:57:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G6YKfc1gMuJG; Thu, 28 May 2020 17:57:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B12A688254;
	Thu, 28 May 2020 17:57:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A3B2AC016F;
	Thu, 28 May 2020 17:57:40 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1644FC016F
 for <iommu@lists.linux-foundation.org>; Thu, 28 May 2020 17:57:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 11B5D86FA5
 for <iommu@lists.linux-foundation.org>; Thu, 28 May 2020 17:57:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9IWZCxlDzJWL for <iommu@lists.linux-foundation.org>;
 Thu, 28 May 2020 17:57:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 7E02386F9A
 for <iommu@lists.linux-foundation.org>; Thu, 28 May 2020 17:57:36 +0000 (UTC)
IronPort-SDR: MkjQ1TEYtWlLloMvOFW9Mr088Jn1RCsA5ZaV3QueRLjjPmHVQT3DRcC2DHkIZdjtEISXYBzc7E
 +C17PW5yp70w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2020 10:57:35 -0700
IronPort-SDR: fco9CEO8XR2JlX6tJVG1Ozrw4df4pHmH2T4kBBPWCsQnI5NNTgOL+8uhXk8uJtV/nLBTZlBW69
 hdqjD28hKRfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,445,1583222400"; d="scan'208";a="256243677"
Received: from jacob-builder.jf.intel.com ([10.7.199.155])
 by orsmga007.jf.intel.com with ESMTP; 28 May 2020 10:57:35 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: "Lu Baolu" <baolu.lu@linux.intel.com>,
	Joerg Roedel <joro@8bytes.org>
Subject: [PATCH] iommu/vt-d: Fix compile warning
Date: Thu, 28 May 2020 11:03:51 -0700
Message-Id: <1590689031-79318-1-git-send-email-jacob.jun.pan@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Cc: iommu@lists.linux-foundation.org, LKML <linux-kernel@vger.kernel.org>
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

Make intel_svm_unbind_mm() a static function.

Fixes: 064a57d7ddfc ("iommu/vt-d: Replace intel SVM APIs with generic
SVA APIs")
Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
---
 drivers/iommu/intel-svm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/intel-svm.c b/drivers/iommu/intel-svm.c
index 3c190c3b90b9..d386853121a2 100644
--- a/drivers/iommu/intel-svm.c
+++ b/drivers/iommu/intel-svm.c
@@ -597,7 +597,7 @@ intel_svm_bind_mm(struct device *dev, int flags, struct svm_dev_ops *ops,
 }
 
 /* Caller must hold pasid_mutex */
-int intel_svm_unbind_mm(struct device *dev, int pasid)
+static int intel_svm_unbind_mm(struct device *dev, int pasid)
 {
 	struct intel_svm_dev *sdev;
 	struct intel_iommu *iommu;
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
