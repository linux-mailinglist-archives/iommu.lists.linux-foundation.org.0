Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id D32253F9061
	for <lists.iommu@lfdr.de>; Thu, 26 Aug 2021 23:59:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36AC4826A4;
	Thu, 26 Aug 2021 21:59:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xuGc_Zenk6JQ; Thu, 26 Aug 2021 21:59:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 36F6B80DE1;
	Thu, 26 Aug 2021 21:59:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 04ECFC001F;
	Thu, 26 Aug 2021 21:59:40 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 19E98C000E
 for <iommu@lists.linux-foundation.org>; Thu, 26 Aug 2021 21:59:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 01E4542629
 for <iommu@lists.linux-foundation.org>; Thu, 26 Aug 2021 21:59:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8WzD7R_7njuI for <iommu@lists.linux-foundation.org>;
 Thu, 26 Aug 2021 21:59:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4797B425BF
 for <iommu@lists.linux-foundation.org>; Thu, 26 Aug 2021 21:59:36 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10088"; a="217853136"
X-IronPort-AV: E=Sophos;i="5.84,354,1620716400"; d="scan'208";a="217853136"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2021 14:59:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,354,1620716400"; d="scan'208";a="528066688"
Received: from otcwcpicx3.sc.intel.com ([172.25.55.73])
 by FMSMGA003.fm.intel.com with ESMTP; 26 Aug 2021 14:59:35 -0700
From: Fenghua Yu <fenghua.yu@intel.com>
To: "Lu Baolu" <baolu.lu@linux.intel.com>,
 "David Woodhouse" <dwmw2@infradead.org>,
 "Jacob Jun Pan" <jacob.jun.pan@intel.com>,
 "Dave Jiang" <dave.jiang@intel.com>, "Ashok Raj" <ashok.raj@intel.com>,
 "Ravi V Shankar" <ravi.v.shankar@intel.com>
Subject: [PATCH 1/2] iommu/vt-d: Fix PASID leak
Date: Thu, 26 Aug 2021 21:59:17 +0000
Message-Id: <20210826215918.4073446-1-fenghua.yu@intel.com>
X-Mailer: git-send-email 2.33.0
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

mm->pasid will be used in intel_svm_free_pasid() after load_pasid()
during unbinding mm. Clearing it in load_pasid() will cause PASID cannot
be freed in intel_svm_free_pasid().

Additionally mm->pasid was updated already before load_pasid() during pasid
allocation. No need to update it again in load_pasid() during binding mm.

Don't update mm->pasid to avoid the issues in both binding mm and
unbinding mm.

Please note that load_pasid() and its called functions will be re-written
in upcoming re-enabling ENQCMD series. This patch tries to fix the issues
cleanly before the re-enabling ENQCMD series.

Fixes: 62ef907a045e ("iommu/vt-d: Fix PASID reference leak")

Reported-and-tested-by: Dave Jiang <dave.jiang@intel.com>
Co-developed-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
Signed-off-by: Fenghua Yu <fenghua.yu@intel.com>
---
 drivers/iommu/intel/svm.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/iommu/intel/svm.c b/drivers/iommu/intel/svm.c
index 4b9b3f35ba0e..ceeca633a5f9 100644
--- a/drivers/iommu/intel/svm.c
+++ b/drivers/iommu/intel/svm.c
@@ -516,9 +516,6 @@ static void load_pasid(struct mm_struct *mm, u32 pasid)
 {
 	mutex_lock(&mm->context.lock);
 
-	/* Synchronize with READ_ONCE in update_pasid(). */
-	smp_store_release(&mm->pasid, pasid);
-
 	/* Update PASID MSR on all CPUs running the mm's tasks. */
 	on_each_cpu_mask(mm_cpumask(mm), _load_pasid, NULL, true);
 
-- 
2.33.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
