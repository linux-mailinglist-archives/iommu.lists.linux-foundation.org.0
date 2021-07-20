Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC643CF1D3
	for <lists.iommu@lfdr.de>; Tue, 20 Jul 2021 04:08:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B53E400D5;
	Tue, 20 Jul 2021 02:08:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2r4akkMln7fq; Tue, 20 Jul 2021 02:08:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 1FB93400F3;
	Tue, 20 Jul 2021 02:08:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F0665C000E;
	Tue, 20 Jul 2021 02:08:36 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 34097C000E
 for <iommu@lists.linux-foundation.org>; Tue, 20 Jul 2021 02:08:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 13F6D40474
 for <iommu@lists.linux-foundation.org>; Tue, 20 Jul 2021 02:08:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7pT5CfrrTaWb for <iommu@lists.linux-foundation.org>;
 Tue, 20 Jul 2021 02:08:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 32F054046E
 for <iommu@lists.linux-foundation.org>; Tue, 20 Jul 2021 02:08:34 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10050"; a="274987752"
X-IronPort-AV: E=Sophos;i="5.84,253,1620716400"; d="scan'208";a="274987752"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2021 19:08:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,253,1620716400"; d="scan'208";a="453891960"
Received: from allen-box.sh.intel.com ([10.239.159.118])
 by orsmga007.jf.intel.com with ESMTP; 19 Jul 2021 19:08:32 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH 2/3] iommu/vt-d: Implement map/unmap_pages() iommu_ops callback
Date: Tue, 20 Jul 2021 10:06:14 +0800
Message-Id: <20210720020615.4144323-3-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210720020615.4144323-1-baolu.lu@linux.intel.com>
References: <20210720020615.4144323-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Cc: will@kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, robin.murphy@arm.com
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

Implement the map_pages() and unmap_pages() callback for the Intel IOMMU
driver to allow calls from iommu core to map and unmap multiple pages of
the same size in one call. With map/unmap_pages() implemented, the prior
map/unmap callbacks are deprecated.

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/iommu/intel/iommu.c | 37 +++++++++++++++++++++++++++++++++++--
 1 file changed, 35 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index 240af636d51e..6114dac8777d 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -5063,6 +5063,28 @@ static int intel_iommu_map(struct iommu_domain *domain,
 				hpa >> VTD_PAGE_SHIFT, size, prot);
 }
 
+static int intel_iommu_map_pages(struct iommu_domain *domain,
+				 unsigned long iova, phys_addr_t paddr,
+				 size_t pgsize, size_t pgcount,
+				 int prot, gfp_t gfp, size_t *mapped)
+{
+	unsigned long pgshift = __ffs(pgsize);
+	size_t size = pgcount << pgshift;
+	int ret;
+
+	if (pgsize != SZ_4K && pgsize != SZ_2M && pgsize != SZ_1G)
+		return -EINVAL;
+
+	if (!IS_ALIGNED(iova | paddr, pgsize))
+		return -EINVAL;
+
+	ret = intel_iommu_map(domain, iova, paddr, size, prot, gfp);
+	if (!ret && mapped)
+		*mapped = size;
+
+	return ret;
+}
+
 static size_t intel_iommu_unmap(struct iommu_domain *domain,
 				unsigned long iova, size_t size,
 				struct iommu_iotlb_gather *gather)
@@ -5092,6 +5114,17 @@ static size_t intel_iommu_unmap(struct iommu_domain *domain,
 	return size;
 }
 
+static size_t intel_iommu_unmap_pages(struct iommu_domain *domain,
+				      unsigned long iova,
+				      size_t pgsize, size_t pgcount,
+				      struct iommu_iotlb_gather *gather)
+{
+	unsigned long pgshift = __ffs(pgsize);
+	size_t size = pgcount << pgshift;
+
+	return intel_iommu_unmap(domain, iova, size, gather);
+}
+
 static void intel_iommu_tlb_sync(struct iommu_domain *domain,
 				 struct iommu_iotlb_gather *gather)
 {
@@ -5589,9 +5622,9 @@ const struct iommu_ops intel_iommu_ops = {
 	.aux_attach_dev		= intel_iommu_aux_attach_device,
 	.aux_detach_dev		= intel_iommu_aux_detach_device,
 	.aux_get_pasid		= intel_iommu_aux_get_pasid,
-	.map			= intel_iommu_map,
+	.map_pages		= intel_iommu_map_pages,
+	.unmap_pages		= intel_iommu_unmap_pages,
 	.iotlb_sync_map		= intel_iommu_iotlb_sync_map,
-	.unmap			= intel_iommu_unmap,
 	.flush_iotlb_all        = intel_flush_iotlb_all,
 	.iotlb_sync		= intel_iommu_tlb_sync,
 	.iova_to_phys		= intel_iommu_iova_to_phys,
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
