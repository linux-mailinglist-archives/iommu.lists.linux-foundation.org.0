Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id C31E0125A7F
	for <lists.iommu@lfdr.de>; Thu, 19 Dec 2019 06:19:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 47A0D87C98;
	Thu, 19 Dec 2019 05:19:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9VzghfzPVOIY; Thu, 19 Dec 2019 05:19:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C177E87C5F;
	Thu, 19 Dec 2019 05:19:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A2B32C1D88;
	Thu, 19 Dec 2019 05:19:56 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AF2A3C077D
 for <iommu@lists.linux-foundation.org>; Thu, 19 Dec 2019 05:19:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A46CD87CD9
 for <iommu@lists.linux-foundation.org>; Thu, 19 Dec 2019 05:19:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kuaFi-QFiwoy for <iommu@lists.linux-foundation.org>;
 Thu, 19 Dec 2019 05:19:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 8D71687C5F
 for <iommu@lists.linux-foundation.org>; Thu, 19 Dec 2019 05:19:53 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Dec 2019 21:19:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,330,1571727600"; d="scan'208";a="213131732"
Received: from allen-box.sh.intel.com ([10.239.159.136])
 by fmsmga008.fm.intel.com with ESMTP; 18 Dec 2019 21:19:51 -0800
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH 1/2] iommu/vt-d: Avoid iova flush queue in strict mode
Date: Thu, 19 Dec 2019 13:18:50 +0800
Message-Id: <20191219051851.25159-1-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.17.1
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

If Intel IOMMU strict mode is enabled by users, it's unnecessary
to create the iova flush queue.

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/iommu/intel-iommu.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
index 0726705d2d89..93e1d7c3ac7c 100644
--- a/drivers/iommu/intel-iommu.c
+++ b/drivers/iommu/intel-iommu.c
@@ -1858,10 +1858,12 @@ static int domain_init(struct dmar_domain *domain, struct intel_iommu *iommu,
 
 	init_iova_domain(&domain->iovad, VTD_PAGE_SIZE, IOVA_START_PFN);
 
-	err = init_iova_flush_queue(&domain->iovad,
-				    iommu_flush_iova, iova_entry_free);
-	if (err)
-		return err;
+	if (!intel_iommu_strict) {
+		err = init_iova_flush_queue(&domain->iovad,
+					    iommu_flush_iova, iova_entry_free);
+		if (err)
+			return err;
+	}
 
 	domain_reserve_special_ranges(domain);
 
@@ -5199,6 +5201,7 @@ static struct iommu_domain *intel_iommu_domain_alloc(unsigned type)
 {
 	struct dmar_domain *dmar_domain;
 	struct iommu_domain *domain;
+	int ret;
 
 	switch (type) {
 	case IOMMU_DOMAIN_DMA:
@@ -5215,11 +5218,14 @@ static struct iommu_domain *intel_iommu_domain_alloc(unsigned type)
 			return NULL;
 		}
 
-		if (type == IOMMU_DOMAIN_DMA &&
-		    init_iova_flush_queue(&dmar_domain->iovad,
-					  iommu_flush_iova, iova_entry_free)) {
-			pr_warn("iova flush queue initialization failed\n");
-			intel_iommu_strict = 1;
+		if (!intel_iommu_strict && type == IOMMU_DOMAIN_DMA) {
+			ret = init_iova_flush_queue(&dmar_domain->iovad,
+						    iommu_flush_iova,
+						    iova_entry_free);
+			if (ret) {
+				pr_warn("iova flush queue initialization failed\n");
+				intel_iommu_strict = 1;
+			}
 		}
 
 		domain_update_iommu_cap(dmar_domain);
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
