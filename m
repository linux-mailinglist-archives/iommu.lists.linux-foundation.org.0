Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B9912E13D
	for <lists.iommu@lfdr.de>; Thu,  2 Jan 2020 01:19:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 451DF85633;
	Thu,  2 Jan 2020 00:19:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rgogYETiBWks; Thu,  2 Jan 2020 00:19:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8A0608578B;
	Thu,  2 Jan 2020 00:19:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 853A3C1D85;
	Thu,  2 Jan 2020 00:19:46 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B6C14C077D
 for <iommu@lists.linux-foundation.org>; Thu,  2 Jan 2020 00:19:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B35B0854E8
 for <iommu@lists.linux-foundation.org>; Thu,  2 Jan 2020 00:19:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ld3XD0cXPf8N for <iommu@lists.linux-foundation.org>;
 Thu,  2 Jan 2020 00:19:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 3F231854C0
 for <iommu@lists.linux-foundation.org>; Thu,  2 Jan 2020 00:19:44 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Jan 2020 16:19:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,384,1571727600"; d="scan'208";a="244475925"
Received: from allen-box.sh.intel.com ([10.239.159.136])
 by fmsmga004.fm.intel.com with ESMTP; 01 Jan 2020 16:19:43 -0800
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH 12/22] iommu/vt-d: Loose requirement for flush queue
 initializaton
Date: Thu,  2 Jan 2020 08:18:13 +0800
Message-Id: <20200102001823.21976-13-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200102001823.21976-1-baolu.lu@linux.intel.com>
References: <20200102001823.21976-1-baolu.lu@linux.intel.com>
Cc: iommu@lists.linux-foundation.org
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

Currently if flush queue initialization fails, we return error
or enforce the system-wide strict mode. These are unnecessary
because we always check the existence of a flush queue before
queuing any iova's for lazy flushing. Printing a informational
message is enough.

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/iommu/intel-iommu.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
index 4631b1796482..34723f6be672 100644
--- a/drivers/iommu/intel-iommu.c
+++ b/drivers/iommu/intel-iommu.c
@@ -1854,15 +1854,15 @@ static int domain_init(struct dmar_domain *domain, struct intel_iommu *iommu,
 {
 	int adjust_width, agaw;
 	unsigned long sagaw;
-	int err;
+	int ret;
 
 	init_iova_domain(&domain->iovad, VTD_PAGE_SIZE, IOVA_START_PFN);
 
 	if (!intel_iommu_strict) {
-		err = init_iova_flush_queue(&domain->iovad,
+		ret = init_iova_flush_queue(&domain->iovad,
 					    iommu_flush_iova, iova_entry_free);
-		if (err)
-			return err;
+		if (ret)
+			pr_info("iova flush queue initialization failed\n");
 	}
 
 	domain_reserve_special_ranges(domain);
@@ -5222,10 +5222,8 @@ static struct iommu_domain *intel_iommu_domain_alloc(unsigned type)
 			ret = init_iova_flush_queue(&dmar_domain->iovad,
 						    iommu_flush_iova,
 						    iova_entry_free);
-			if (ret) {
-				pr_warn("iova flush queue initialization failed\n");
-				intel_iommu_strict = 1;
-			}
+			if (ret)
+				pr_info("iova flush queue initialization failed\n");
 		}
 
 		domain_update_iommu_cap(dmar_domain);
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
