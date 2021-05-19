Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 7939F38849A
	for <lists.iommu@lfdr.de>; Wed, 19 May 2021 03:51:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A12660673;
	Wed, 19 May 2021 01:51:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l27zeiB5fpin; Wed, 19 May 2021 01:51:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53AD460865;
	Wed, 19 May 2021 01:51:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3BEADC0027;
	Wed, 19 May 2021 01:51:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 88BEAC000F
 for <iommu@lists.linux-foundation.org>; Wed, 19 May 2021 01:51:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5DD5B60647
 for <iommu@lists.linux-foundation.org>; Wed, 19 May 2021 01:51:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T-EUCE5GMcnB for <iommu@lists.linux-foundation.org>;
 Wed, 19 May 2021 01:51:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8A29B6066D
 for <iommu@lists.linux-foundation.org>; Wed, 19 May 2021 01:51:30 +0000 (UTC)
IronPort-SDR: 4YS1DXfAJIjuNPWIM3Cun66xwdjnzmQM5uGJPGEi1Zcb3FzA4NkU3YkS5aLDN2SZABesrtC4Rh
 Cag2hmbMT/Ew==
X-IronPort-AV: E=McAfee;i="6200,9189,9988"; a="197774689"
X-IronPort-AV: E=Sophos;i="5.82,310,1613462400"; d="scan'208";a="197774689"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2021 18:51:30 -0700
IronPort-SDR: sic2mE8PIAh5VZfDo/S7uoecllHdKyTpE7cEXNF2PTFfqtG9iNeib3JbgPNxKjUzGVovcsHVA+
 tRZZolG4MGwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,310,1613462400"; d="scan'208";a="542260515"
Received: from allen-box.sh.intel.com ([10.239.159.128])
 by fmsmga001.fm.intel.com with ESMTP; 18 May 2021 18:51:28 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH 2/2] iommu/vt-d: Use user privilege for RID2PASID translation
Date: Wed, 19 May 2021 09:50:27 +0800
Message-Id: <20210519015027.108468-3-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210519015027.108468-1-baolu.lu@linux.intel.com>
References: <20210519015027.108468-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Cc: iommu@lists.linux-foundation.org, Dan Carpenter <dan.carpenter@oracle.com>
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

When first-level page tables are used for IOVA translation, we use user
privilege by setting U/S bit in the page table entry. This is to make it
consistent with the second level translation, where the U/S enforcement
is not available. Clear the SRE (Supervisor Request Enable) field in the
pasid table entry of RID2PASID so that requests requesting the supervisor
privilege are blocked and treated as DMA remapping faults.

Fixes: b802d070a52a1 ("iommu/vt-d: Use iova over first level")
Suggested-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
Link: https://lore.kernel.org/r/20210512064426.3440915-1-baolu.lu@linux.intel.com
---
 drivers/iommu/intel/iommu.c | 7 +++++--
 drivers/iommu/intel/pasid.c | 3 ++-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index 9a7b79b5af18..be35284a2016 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -2525,9 +2525,9 @@ static int domain_setup_first_level(struct intel_iommu *iommu,
 				    struct device *dev,
 				    u32 pasid)
 {
-	int flags = PASID_FLAG_SUPERVISOR_MODE;
 	struct dma_pte *pgd = domain->pgd;
 	int agaw, level;
+	int flags = 0;
 
 	/*
 	 * Skip top levels of page tables for iommu which has
@@ -2543,7 +2543,10 @@ static int domain_setup_first_level(struct intel_iommu *iommu,
 	if (level != 4 && level != 5)
 		return -EINVAL;
 
-	flags |= (level == 5) ? PASID_FLAG_FL5LP : 0;
+	if (pasid != PASID_RID2PASID)
+		flags |= PASID_FLAG_SUPERVISOR_MODE;
+	if (level == 5)
+		flags |= PASID_FLAG_FL5LP;
 
 	if (domain->domain.type == IOMMU_DOMAIN_UNMANAGED)
 		flags |= PASID_FLAG_PAGE_SNOOP;
diff --git a/drivers/iommu/intel/pasid.c b/drivers/iommu/intel/pasid.c
index 72646bafc52f..72dc84821dad 100644
--- a/drivers/iommu/intel/pasid.c
+++ b/drivers/iommu/intel/pasid.c
@@ -699,7 +699,8 @@ int intel_pasid_setup_second_level(struct intel_iommu *iommu,
 	 * Since it is a second level only translation setup, we should
 	 * set SRE bit as well (addresses are expected to be GPAs).
 	 */
-	pasid_set_sre(pte);
+	if (pasid != PASID_RID2PASID)
+		pasid_set_sre(pte);
 	pasid_set_present(pte);
 	pasid_flush_caches(iommu, pte, pasid, did);
 
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
