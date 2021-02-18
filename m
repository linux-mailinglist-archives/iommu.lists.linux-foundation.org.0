Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3E831F4F2
	for <lists.iommu@lfdr.de>; Fri, 19 Feb 2021 07:02:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6651A86B70;
	Fri, 19 Feb 2021 06:02:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RhkIH6w5B5Ny; Fri, 19 Feb 2021 06:02:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D612086B59;
	Fri, 19 Feb 2021 06:02:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B4454C000D;
	Fri, 19 Feb 2021 06:02:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 38635C000D
 for <iommu@lists.linux-foundation.org>; Fri, 19 Feb 2021 06:02:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 226C9872B2
 for <iommu@lists.linux-foundation.org>; Fri, 19 Feb 2021 06:02:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jl--LBey-Bmf for <iommu@lists.linux-foundation.org>;
 Fri, 19 Feb 2021 06:02:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7624487302
 for <iommu@lists.linux-foundation.org>; Fri, 19 Feb 2021 06:02:30 +0000 (UTC)
IronPort-SDR: 2QCR4bU0lWklHLCt4UuPV0+DStuSaoihOZDuvN8QmWHhwLm4oJ+BQy9n1kE2Ol/YJniAcgkEqK
 Jgs/8n3WdnMw==
X-IronPort-AV: E=McAfee;i="6000,8403,9899"; a="245198113"
X-IronPort-AV: E=Sophos;i="5.81,189,1610438400"; d="scan'208";a="245198113"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2021 22:02:29 -0800
IronPort-SDR: iGS3uvHw9fSFwsAwfvfzOL8FMbWuBmMZsgsbUE9NHDkNfLXyws1lOf/lkqjzSz/1Fyj3dys3Lz
 oeWXBxCctg5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,189,1610438400"; d="scan'208";a="362829348"
Received: from otc-wp-03.jf.intel.com ([10.54.39.79])
 by orsmga003.jf.intel.com with ESMTP; 18 Feb 2021 22:02:29 -0800
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: LKML <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 Joerg Roedel <joro@8bytes.org>, "Lu Baolu" <baolu.lu@linux.intel.com>
Subject: [PATCH 2/4] iommu/vt-d: Enable write protect propagation from guest
Date: Thu, 18 Feb 2021 13:31:16 -0800
Message-Id: <1613683878-89946-3-git-send-email-jacob.jun.pan@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613683878-89946-1-git-send-email-jacob.jun.pan@linux.intel.com>
References: <1613683878-89946-1-git-send-email-jacob.jun.pan@linux.intel.com>
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Dave Jiang <dave.jiang@intel.com>,
 Raj Ashok <ashok.raj@intel.com>, Sanjay Kumar <sanjay.k.kumar@intel.com>,
 Yi Sun <yi.y.sun@intel.com>, Jean-Philippe Brucker <jean-philippe@linaro.com>,
 Wu Hao <hao.wu@intel.com>
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

Write protect bit, when set, inhibits supervisor writes to the read-only
pages. In guest supervisor shared virtual addressing (SVA), write-protect
should be honored upon guest bind supervisor PASID request.

This patch extends the VT-d portion of the IOMMU UAPI to include WP bit.
WPE bit of the  supervisor PASID entry will be set to match CPU CR0.WP bit.

Signed-off-by: Sanjay Kumar <sanjay.k.kumar@intel.com>
Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
---
 drivers/iommu/intel/pasid.c | 5 +++++
 include/uapi/linux/iommu.h  | 3 ++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/intel/pasid.c b/drivers/iommu/intel/pasid.c
index 0b7e0e726ade..c7a2ec930af4 100644
--- a/drivers/iommu/intel/pasid.c
+++ b/drivers/iommu/intel/pasid.c
@@ -763,6 +763,11 @@ intel_pasid_setup_bind_data(struct intel_iommu *iommu, struct pasid_entry *pte,
 			return -EINVAL;
 		}
 		pasid_set_sre(pte);
+		/* Enable write protect WP if guest requested */
+		if (pasid_data->flags & IOMMU_SVA_VTD_GPASID_WPE) {
+			if (pasid_enable_wpe(pte))
+				return -EINVAL;
+		}
 	}
 
 	if (pasid_data->flags & IOMMU_SVA_VTD_GPASID_EAFE) {
diff --git a/include/uapi/linux/iommu.h b/include/uapi/linux/iommu.h
index 68cb558fe8db..33f3dc7a91de 100644
--- a/include/uapi/linux/iommu.h
+++ b/include/uapi/linux/iommu.h
@@ -288,7 +288,8 @@ struct iommu_gpasid_bind_data_vtd {
 #define IOMMU_SVA_VTD_GPASID_PWT	(1 << 3) /* page-level write through */
 #define IOMMU_SVA_VTD_GPASID_EMTE	(1 << 4) /* extended mem type enable */
 #define IOMMU_SVA_VTD_GPASID_CD		(1 << 5) /* PASID-level cache disable */
-#define IOMMU_SVA_VTD_GPASID_LAST	(1 << 6)
+#define IOMMU_SVA_VTD_GPASID_WPE	(1 << 6) /* Write protect enable */
+#define IOMMU_SVA_VTD_GPASID_LAST	(1 << 7)
 	__u64 flags;
 	__u32 pat;
 	__u32 emt;
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
