Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id EC80C13672D
	for <lists.iommu@lfdr.de>; Fri, 10 Jan 2020 07:12:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8E06A86A39;
	Fri, 10 Jan 2020 06:12:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AXOf0MaGaWSt; Fri, 10 Jan 2020 06:12:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 21D6286A51;
	Fri, 10 Jan 2020 06:12:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 049DDC0881;
	Fri, 10 Jan 2020 06:12:32 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7C2E4C0881
 for <iommu@lists.linux-foundation.org>; Fri, 10 Jan 2020 06:12:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 6B61586881
 for <iommu@lists.linux-foundation.org>; Fri, 10 Jan 2020 06:12:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 68iByVA7Nq6I for <iommu@lists.linux-foundation.org>;
 Fri, 10 Jan 2020 06:12:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 05B9286A2B
 for <iommu@lists.linux-foundation.org>; Fri, 10 Jan 2020 06:12:29 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Jan 2020 22:12:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,415,1571727600"; d="scan'208";a="236883144"
Received: from allen-box.sh.intel.com ([10.239.159.136])
 by orsmga002.jf.intel.com with ESMTP; 09 Jan 2020 22:12:28 -0800
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH 2/2] iommu/vt-d: Unnecessary to handle default identity domain
Date: Fri, 10 Jan 2020 14:10:58 +0800
Message-Id: <20200110061058.26958-2-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200110061058.26958-1-baolu.lu@linux.intel.com>
References: <20200110061058.26958-1-baolu.lu@linux.intel.com>
Cc: kevin.tian@intel.com, ashok.raj@intel.com, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, jacob.jun.pan@intel.com
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

The iommu default domain framework has been designed to take
care of setting identity default domain type. It's unnecessary
to handle this again in the VT-d driver. Hence, remove it.

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/iommu/intel-iommu.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
index 6aeaad2cf8a9..e7942bc05e4e 100644
--- a/drivers/iommu/intel-iommu.c
+++ b/drivers/iommu/intel-iommu.c
@@ -387,7 +387,6 @@ static int intel_iommu_superpage = 1;
 static int iommu_identity_mapping;
 static int intel_no_bounce;
 
-#define IDENTMAP_ALL		1
 #define IDENTMAP_GFX		2
 #define IDENTMAP_AZALIA		4
 
@@ -3079,8 +3078,7 @@ static int device_def_domain_type(struct device *dev)
 			return IOMMU_DOMAIN_DMA;
 	}
 
-	return (iommu_identity_mapping & IDENTMAP_ALL) ?
-			IOMMU_DOMAIN_IDENTITY : 0;
+	return 0;
 }
 
 static void intel_iommu_init_qi(struct intel_iommu *iommu)
@@ -3424,9 +3422,6 @@ static int __init init_dmars(void)
 		iommu->flush.flush_iotlb(iommu, 0, 0, 0, DMA_TLB_GLOBAL_FLUSH);
 	}
 
-	if (iommu_default_passthrough())
-		iommu_identity_mapping |= IDENTMAP_ALL;
-
 #ifdef CONFIG_INTEL_IOMMU_BROKEN_GFX_WA
 	dmar_map_gfx = 0;
 #endif
@@ -5017,7 +5012,7 @@ static int __init platform_optin_force_iommu(void)
 	 * map for all devices except those marked as being untrusted.
 	 */
 	if (dmar_disabled)
-		iommu_identity_mapping |= IDENTMAP_ALL;
+		iommu_set_default_passthrough(false);
 
 	dmar_disabled = 0;
 	no_iommu = 0;
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
