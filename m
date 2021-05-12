Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE5437B653
	for <lists.iommu@lfdr.de>; Wed, 12 May 2021 08:45:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10CA583626;
	Wed, 12 May 2021 06:45:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QIQYAZ2Ljo2N; Wed, 12 May 2021 06:45:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id E63A9835B1;
	Wed, 12 May 2021 06:45:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C87C1C0001;
	Wed, 12 May 2021 06:45:22 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 226FEC0001
 for <iommu@lists.linux-foundation.org>; Wed, 12 May 2021 06:45:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 04801835B9
 for <iommu@lists.linux-foundation.org>; Wed, 12 May 2021 06:45:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TQIByRNcfjGv for <iommu@lists.linux-foundation.org>;
 Wed, 12 May 2021 06:45:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C7B0D835B1
 for <iommu@lists.linux-foundation.org>; Wed, 12 May 2021 06:45:18 +0000 (UTC)
IronPort-SDR: her7Iw1wm8022/i8l7MUqXtb/3kSGQiZ6qnn1B6Ti3Krhmk4o7KkMCiiCfCb85eE4m/5Ubknh9
 jcVgBatv6Wpw==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="220601850"
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; d="scan'208";a="220601850"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 23:45:18 -0700
IronPort-SDR: Mr3TRUPpSvEHoNhG9TuJWJVY4Ky1OcWmkCaLmvCBTSbhjuIRKC/YSNN+FYi/Sj6S1ME9yciJOf
 LjG6s6JugrVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; d="scan'208";a="537496288"
Received: from allen-box.sh.intel.com ([10.239.159.128])
 by fmsmga001.fm.intel.com with ESMTP; 11 May 2021 23:45:15 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>
Subject: [RESEND PATACH 1/1] iommu/vt-d: Use user privilege for RID2PASID
 translation
Date: Wed, 12 May 2021 14:44:26 +0800
Message-Id: <20210512064426.3440915-1-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: kevin.tian@intel.com, ashok.raj@intel.com, sanjay.k.kumar@intel.com,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 jacob.jun.pan@intel.com
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

Suggested-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
Fixes: b802d070a52a1 ("iommu/vt-d: Use iova over first level")
Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/iommu/intel/iommu.c | 7 +++++--
 drivers/iommu/intel/pasid.c | 3 ++-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index 708f430af1c4..f1742da42478 100644
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
