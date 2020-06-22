Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id D26FB20445B
	for <lists.iommu@lfdr.de>; Tue, 23 Jun 2020 01:18:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 80D8688923;
	Mon, 22 Jun 2020 23:18:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G0qRcAhFrnYx; Mon, 22 Jun 2020 23:18:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id EA2588890A;
	Mon, 22 Jun 2020 23:18:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E3DD2C016F;
	Mon, 22 Jun 2020 23:18:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F3B77C016F
 for <iommu@lists.linux-foundation.org>; Mon, 22 Jun 2020 23:18:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E0557214E6
 for <iommu@lists.linux-foundation.org>; Mon, 22 Jun 2020 23:18:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 11GpkvDi40ak for <iommu@lists.linux-foundation.org>;
 Mon, 22 Jun 2020 23:18:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by silver.osuosl.org (Postfix) with ESMTPS id AA6D8226D0
 for <iommu@lists.linux-foundation.org>; Mon, 22 Jun 2020 23:18:07 +0000 (UTC)
IronPort-SDR: 0+amgcya4facauC9SkeNvADYV9eeuvrlLC45g0Xo41uQ88XaVsvola9exat+amFnGOR/pQU9Wz
 G8+aHSoMHZ4A==
X-IronPort-AV: E=McAfee;i="6000,8403,9660"; a="161982987"
X-IronPort-AV: E=Sophos;i="5.75,268,1589266800"; d="scan'208";a="161982987"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2020 16:18:07 -0700
IronPort-SDR: vQ2Vo+mDpd/1uwprscCpLv22KR3a76bylmvOUBYDOEDpM8sxQvlQBTpHvuFtT9ayprAmPFkYVb
 xzxuER/GOreg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,268,1589266800"; d="scan'208";a="301006551"
Received: from allen-box.sh.intel.com ([10.239.159.139])
 by fmsmga004.fm.intel.com with ESMTP; 22 Jun 2020 16:18:06 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH 5/6] iommu/vt-d: Update scalable mode paging structure
 coherency
Date: Tue, 23 Jun 2020 07:13:44 +0800
Message-Id: <20200622231345.29722-6-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200622231345.29722-1-baolu.lu@linux.intel.com>
References: <20200622231345.29722-1-baolu.lu@linux.intel.com>
Cc: Kevin Tian <kevin.tian@intel.com>, iommu@lists.linux-foundation.org,
 Ashok Raj <ashok.raj@intel.com>
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

The Scalable-mode Page-walk Coherency (SMPWC) field in the VT-d extended
capability register indicates the hardware coherency behavior on paging
structures accessed through the pasid table entry. This is ignored in
current code and using ECAP.C instead which is only valid in legacy mode.
Fix this so that paging structure updates could be manually flushed from
the cache line if hardware page walking is not snooped.

Fixes: 765b6a98c1de3 ("iommu/vt-d: Enumerate the scalable mode capability")
Cc: Ashok Raj <ashok.raj@intel.com>
Cc: Kevin Tian <kevin.tian@intel.com>
Cc: Jacob Pan <jacob.jun.pan@linux.intel.com>
Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/iommu/intel/iommu.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index 66d07b1a3be2..f16bf63ea9fd 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -612,6 +612,12 @@ struct intel_iommu *domain_get_iommu(struct dmar_domain *domain)
 	return g_iommus[iommu_id];
 }
 
+static inline bool iommu_paging_structure_coherency(struct intel_iommu *iommu)
+{
+	return sm_supported(iommu) ?
+			ecap_smpwc(iommu->ecap) : ecap_coherent(iommu->ecap);
+}
+
 static void domain_update_iommu_coherency(struct dmar_domain *domain)
 {
 	struct dmar_drhd_unit *drhd;
@@ -623,7 +629,7 @@ static void domain_update_iommu_coherency(struct dmar_domain *domain)
 
 	for_each_domain_iommu(i, domain) {
 		found = true;
-		if (!ecap_coherent(g_iommus[i]->ecap)) {
+		if (!iommu_paging_structure_coherency(g_iommus[i])) {
 			domain->iommu_coherency = 0;
 			break;
 		}
@@ -634,7 +640,7 @@ static void domain_update_iommu_coherency(struct dmar_domain *domain)
 	/* No hardware attached; use lowest common denominator */
 	rcu_read_lock();
 	for_each_active_iommu(iommu, drhd) {
-		if (!ecap_coherent(iommu->ecap)) {
+		if (!iommu_paging_structure_coherency(iommu)) {
 			domain->iommu_coherency = 0;
 			break;
 		}
@@ -2094,7 +2100,8 @@ static int domain_context_mapping_one(struct dmar_domain *domain,
 
 	context_set_fault_enable(context);
 	context_set_present(context);
-	domain_flush_cache(domain, context, sizeof(*context));
+	if (!ecap_coherent(iommu->ecap))
+		clflush_cache_range(context, sizeof(*context));
 
 	/*
 	 * It's a non-present to present mapping. If hardware doesn't cache
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
