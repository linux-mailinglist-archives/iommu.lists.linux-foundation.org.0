Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 08056210F27
	for <lists.iommu@lfdr.de>; Wed,  1 Jul 2020 17:27:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B04718BFDA;
	Wed,  1 Jul 2020 15:27:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8dzMA41Zt9ud; Wed,  1 Jul 2020 15:27:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 453848BFC8;
	Wed,  1 Jul 2020 15:27:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3C755C0733;
	Wed,  1 Jul 2020 15:27:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DD206C0890
 for <iommu@lists.linux-foundation.org>; Wed,  1 Jul 2020 15:27:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C892789283
 for <iommu@lists.linux-foundation.org>; Wed,  1 Jul 2020 15:27:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LukGb9CXtoda for <iommu@lists.linux-foundation.org>;
 Wed,  1 Jul 2020 15:27:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 2B9D489292
 for <iommu@lists.linux-foundation.org>; Wed,  1 Jul 2020 15:27:24 +0000 (UTC)
IronPort-SDR: sfT7+F1r7UaXE0Lni3NU/C1s7PhUlN8xkWgoG5GAyfnXmjBxmCIDugOlnPIk3fz9VSE/GtBDpK
 EYWThlr1IadA==
X-IronPort-AV: E=McAfee;i="6000,8403,9668"; a="126699729"
X-IronPort-AV: E=Sophos;i="5.75,300,1589266800"; d="scan'208";a="126699729"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2020 08:27:23 -0700
IronPort-SDR: btFBBtRUEX+vHGqsy/EMYLn4PZ9C6iB7F/OQDO2ETyrDoFqHxBFwPaib5XKujzPdHVDuYGPHhD
 +J2hJBUNDAgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,300,1589266800"; d="scan'208";a="295591653"
Received: from jacob-builder.jf.intel.com ([10.7.199.155])
 by orsmga002.jf.intel.com with ESMTP; 01 Jul 2020 08:27:22 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: iommu@lists.linux-foundation.org, LKML <linux-kernel@vger.kernel.org>,
 "Lu Baolu" <baolu.lu@linux.intel.com>, Joerg Roedel <joro@8bytes.org>,
 David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH v3 5/7] iommu/vt-d: Fix devTLB flush for vSVA
Date: Wed,  1 Jul 2020 08:33:54 -0700
Message-Id: <1593617636-79385-6-git-send-email-jacob.jun.pan@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1593617636-79385-1-git-send-email-jacob.jun.pan@linux.intel.com>
References: <1593617636-79385-1-git-send-email-jacob.jun.pan@linux.intel.com>
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Raj Ashok <ashok.raj@intel.com>
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

From: Liu Yi L <yi.l.liu@intel.com>

For guest SVA usage, in order to optimize for less VMEXIT, guest request
of IOTLB flush also includes device TLB.

On the host side, IOMMU driver performs IOTLB and implicit devTLB
invalidation. When PASID-selective granularity is requested by the guest
we need to derive the equivalent address range for devTLB instead of
using the address information in the UAPI data. The reason for that is, unlike
IOTLB flush, devTLB flush does not support PASID-selective granularity.
This is to say, we need to set the following in the PASID based devTLB
invalidation descriptor:
- entire 64 bit range in address ~(0x1 << 63)
- S bit = 1 (VT-d CH 6.5.2.6).

Without this fix, device TLB flush range is not set properly for PASID
selective granularity. This patch also merged devTLB flush code for both
implicit and explicit cases.

Fixes: 6ee1b77ba3ac ("iommu/vt-d: Add svm/sva invalidate function")
Acked-by: Lu Baolu <baolu.lu@linux.intel.com>
Signed-off-by: Liu Yi L <yi.l.liu@intel.com>
Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
---
 drivers/iommu/intel/iommu.c | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index 96340da57075..6a0c62c7395c 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -5408,7 +5408,7 @@ intel_iommu_sva_invalidate(struct iommu_domain *domain, struct device *dev,
 	sid = PCI_DEVID(bus, devfn);
 
 	/* Size is only valid in address selective invalidation */
-	if (inv_info->granularity != IOMMU_INV_GRANU_PASID)
+	if (inv_info->granularity == IOMMU_INV_GRANU_ADDR)
 		size = to_vtd_size(inv_info->addr_info.granule_size,
 				   inv_info->addr_info.nb_granules);
 
@@ -5417,6 +5417,7 @@ intel_iommu_sva_invalidate(struct iommu_domain *domain, struct device *dev,
 			 IOMMU_CACHE_INV_TYPE_NR) {
 		int granu = 0;
 		u64 pasid = 0;
+		u64 addr = 0;
 
 		granu = to_vtd_granularity(cache_type, inv_info->granularity);
 		if (granu == -EINVAL) {
@@ -5456,24 +5457,31 @@ intel_iommu_sva_invalidate(struct iommu_domain *domain, struct device *dev,
 					(granu == QI_GRAN_NONG_PASID) ? -1 : 1 << size,
 					inv_info->addr_info.flags & IOMMU_INV_ADDR_FLAGS_LEAF);
 
+			if (!info->ats_enabled)
+				break;
 			/*
 			 * Always flush device IOTLB if ATS is enabled. vIOMMU
 			 * in the guest may assume IOTLB flush is inclusive,
 			 * which is more efficient.
 			 */
-			if (info->ats_enabled)
-				qi_flush_dev_iotlb_pasid(iommu, sid,
-						info->pfsid, pasid,
-						info->ats_qdep,
-						inv_info->addr_info.addr,
-						size);
-			break;
+			fallthrough;
 		case IOMMU_CACHE_INV_TYPE_DEV_IOTLB:
+			/*
+			 * There is no PASID selective flush for device TLB, so
+			 * the equivalent of that is we set the size to be the
+			 * entire range of 64 bit. User only provides PASID info
+			 * without address info. So we set addr to 0.
+			 */
+			if (inv_info->granularity == IOMMU_INV_GRANU_PASID) {
+				size = 64 - VTD_PAGE_SHIFT;
+				addr = 0;
+			} else if (inv_info->granularity == IOMMU_INV_GRANU_ADDR)
+				addr = inv_info->addr_info.addr;
+
 			if (info->ats_enabled)
 				qi_flush_dev_iotlb_pasid(iommu, sid,
 						info->pfsid, pasid,
-						info->ats_qdep,
-						inv_info->addr_info.addr,
+						info->ats_qdep, addr,
 						size);
 			else
 				pr_warn_ratelimited("Passdown device IOTLB flush w/o ATS!\n");
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
