Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBAD18DBBE
	for <lists.iommu@lfdr.de>; Sat, 21 Mar 2020 00:22:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BE847875F8;
	Fri, 20 Mar 2020 23:22:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yGfRfdpNKOb4; Fri, 20 Mar 2020 23:22:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CA26E875B7;
	Fri, 20 Mar 2020 23:22:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B481BC07FF;
	Fri, 20 Mar 2020 23:22:04 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E069FC07FF
 for <iommu@lists.linux-foundation.org>; Fri, 20 Mar 2020 23:22:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id D66B0262A0
 for <iommu@lists.linux-foundation.org>; Fri, 20 Mar 2020 23:22:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1-WvnzZoAOdv for <iommu@lists.linux-foundation.org>;
 Fri, 20 Mar 2020 23:22:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by silver.osuosl.org (Postfix) with ESMTPS id C5AA82549D
 for <iommu@lists.linux-foundation.org>; Fri, 20 Mar 2020 23:22:01 +0000 (UTC)
IronPort-SDR: ovaigwHTgWlLoQtfyvfdshCruDrVJzb6hHUtgoCgGDChPTCMycFjtoNo1gd6ZJjnhmBhxAYAW1
 V9D0mjfqhy9Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2020 16:22:01 -0700
IronPort-SDR: 7HWaRnyyskbWMO/IcOtuDiEPHqo726e+PFwCVlYHd2gKY0ffSvH8WISZ/ZEF+QwM2BisSlfx4x
 7hSljLqOenFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,286,1580803200"; d="scan'208";a="418877224"
Received: from jacob-builder.jf.intel.com ([10.7.199.155])
 by orsmga005.jf.intel.com with ESMTP; 20 Mar 2020 16:22:01 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: "Lu Baolu" <baolu.lu@linux.intel.com>, iommu@lists.linux-foundation.org,
 LKML <linux-kernel@vger.kernel.org>, Joerg Roedel <joro@8bytes.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>
Subject: [PATCH V10 02/11] iommu/uapi: Define a mask for bind data
Date: Fri, 20 Mar 2020 16:27:32 -0700
Message-Id: <1584746861-76386-3-git-send-email-jacob.jun.pan@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1584746861-76386-1-git-send-email-jacob.jun.pan@linux.intel.com>
References: <1584746861-76386-1-git-send-email-jacob.jun.pan@linux.intel.com>
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Raj Ashok <ashok.raj@intel.com>,
 Jonathan Cameron <jic23@kernel.org>
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

Memory type related flags can be grouped together for one simple check.

---
v9 renamed from EMT to MTS since these are memory type support flags.
---

Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
---
 include/uapi/linux/iommu.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/iommu.h b/include/uapi/linux/iommu.h
index 4ad3496e5c43..d7bcbc5f79b0 100644
--- a/include/uapi/linux/iommu.h
+++ b/include/uapi/linux/iommu.h
@@ -284,7 +284,10 @@ struct iommu_gpasid_bind_data_vtd {
 	__u32 pat;
 	__u32 emt;
 };
-
+#define IOMMU_SVA_VTD_GPASID_MTS_MASK	(IOMMU_SVA_VTD_GPASID_CD | \
+					 IOMMU_SVA_VTD_GPASID_EMTE | \
+					 IOMMU_SVA_VTD_GPASID_PCD |  \
+					 IOMMU_SVA_VTD_GPASID_PWT)
 /**
  * struct iommu_gpasid_bind_data - Information about device and guest PASID binding
  * @version:	Version of this data structure
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
