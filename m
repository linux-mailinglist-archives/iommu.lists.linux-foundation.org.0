Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 538BF22A000
	for <lists.iommu@lfdr.de>; Wed, 22 Jul 2020 21:19:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id E72BF88793;
	Wed, 22 Jul 2020 19:19:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YbSxPUOj1fle; Wed, 22 Jul 2020 19:19:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 44B9488794;
	Wed, 22 Jul 2020 19:19:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 32619C004C;
	Wed, 22 Jul 2020 19:19:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F3461C004D
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jul 2020 19:19:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id D99A080646
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jul 2020 19:19:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e2oeUNPFNL0H for <iommu@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 19:19:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 50749883DE
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jul 2020 19:19:44 +0000 (UTC)
IronPort-SDR: NGAetfXBBGmjYOIY8cjPF+WqziL2RTV1ZV7Y4k9mbZW7HBnLpJFCJHzGuqu3pgGMk51Pdd7dg9
 /lSeErG5jnVw==
X-IronPort-AV: E=McAfee;i="6000,8403,9690"; a="129972723"
X-IronPort-AV: E=Sophos;i="5.75,383,1589266800"; d="scan'208";a="129972723"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2020 12:19:43 -0700
IronPort-SDR: hVzD5+/qvEXJqO5ErIpPN4LTK3KutmMl0RX9PIkAaLwkI5Zrx2qw9Mrl0G3UfL0uDZBjd/mzM7
 oQ2iSCabtv0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,383,1589266800"; d="scan'208";a="362811897"
Received: from jacob-builder.jf.intel.com ([10.7.199.155])
 by orsmga001.jf.intel.com with ESMTP; 22 Jul 2020 12:19:43 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: iommu@lists.linux-foundation.org, LKML <linux-kernel@vger.kernel.org>,
 "Lu Baolu" <baolu.lu@linux.intel.com>, Joerg Roedel <joro@8bytes.org>,
 David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH v5 3/7] iommu/vt-d: Fix PASID devTLB invalidation
Date: Wed, 22 Jul 2020 12:26:23 -0700
Message-Id: <1595445987-40095-4-git-send-email-jacob.jun.pan@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595445987-40095-1-git-send-email-jacob.jun.pan@linux.intel.com>
References: <1595445987-40095-1-git-send-email-jacob.jun.pan@linux.intel.com>
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

DevTLB flush can be used for both DMA request with and without PASIDs.
The former uses PASID#0 (RID2PASID), latter uses non-zero PASID for SVA
usage.

This patch adds a check for PASID value such that devTLB flush with
PASID is used for SVA case. This is more efficient in that multiple
PASIDs can be used by a single device, when tearing down a PASID entry
we shall flush only the devTLB specific to a PASID.

Fixes: 6f7db75e1c46 ("iommu/vt-d: Add second level page table")
Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
---
 drivers/iommu/intel/pasid.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/intel/pasid.c b/drivers/iommu/intel/pasid.c
index c81f0f17c6ba..fa0154cce537 100644
--- a/drivers/iommu/intel/pasid.c
+++ b/drivers/iommu/intel/pasid.c
@@ -486,7 +486,16 @@ devtlb_invalidation_with_pasid(struct intel_iommu *iommu,
 	qdep = info->ats_qdep;
 	pfsid = info->pfsid;
 
-	qi_flush_dev_iotlb(iommu, sid, pfsid, qdep, 0, 64 - VTD_PAGE_SHIFT);
+	/*
+	 * When PASID 0 is used, it indicates RID2PASID(DMA request w/o PASID),
+	 * devTLB flush w/o PASID should be used. For non-zero PASID under
+	 * SVA usage, device could do DMA with multiple PASIDs. It is more
+	 * efficient to flush devTLB specific to the PASID.
+	 */
+	if (pasid == PASID_RID2PASID)
+		qi_flush_dev_iotlb(iommu, sid, pfsid, qdep, 0, 64 - VTD_PAGE_SHIFT);
+	else
+		qi_flush_dev_iotlb_pasid(iommu, sid, pfsid, pasid, qdep, 0, 64 - VTD_PAGE_SHIFT);
 }
 
 void intel_pasid_tear_down_entry(struct intel_iommu *iommu, struct device *dev,
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
