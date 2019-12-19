Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id B322B125A81
	for <lists.iommu@lfdr.de>; Thu, 19 Dec 2019 06:20:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6922787CD9;
	Thu, 19 Dec 2019 05:20:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XNN3jifCpUDf; Thu, 19 Dec 2019 05:19:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E5C7787C5F;
	Thu, 19 Dec 2019 05:19:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D31B3C077D;
	Thu, 19 Dec 2019 05:19:59 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9C064C1D84
 for <iommu@lists.linux-foundation.org>; Thu, 19 Dec 2019 05:19:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 8292C87C5F
 for <iommu@lists.linux-foundation.org>; Thu, 19 Dec 2019 05:19:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1nFvqaUc0sdP for <iommu@lists.linux-foundation.org>;
 Thu, 19 Dec 2019 05:19:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 4181087C98
 for <iommu@lists.linux-foundation.org>; Thu, 19 Dec 2019 05:19:54 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Dec 2019 21:19:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,330,1571727600"; d="scan'208";a="213131740"
Received: from allen-box.sh.intel.com ([10.239.159.136])
 by fmsmga008.fm.intel.com with ESMTP; 18 Dec 2019 21:19:52 -0800
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH 2/2] iommu/vt-d: Loose requirement for flush queue
 initializaton
Date: Thu, 19 Dec 2019 13:18:51 +0800
Message-Id: <20191219051851.25159-2-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191219051851.25159-1-baolu.lu@linux.intel.com>
References: <20191219051851.25159-1-baolu.lu@linux.intel.com>
Cc: kevin.tian@intel.com, ashok.raj@intel.com, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, jacob.jun.pan@intel.com,
 David Woodhouse <dwmw2@infradead.org>
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
index 93e1d7c3ac7c..65eee8cf6d59 100644
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
