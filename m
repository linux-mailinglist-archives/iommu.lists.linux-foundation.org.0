Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3637813B80A
	for <lists.iommu@lfdr.de>; Wed, 15 Jan 2020 04:05:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A4D6F878D7;
	Wed, 15 Jan 2020 03:05:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5qUOW1krZudj; Wed, 15 Jan 2020 03:05:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D3A20878BB;
	Wed, 15 Jan 2020 03:05:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BA46EC077D;
	Wed, 15 Jan 2020 03:05:30 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DC85FC1D83
 for <iommu@lists.linux-foundation.org>; Wed, 15 Jan 2020 03:05:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 482B3204FE
 for <iommu@lists.linux-foundation.org>; Wed, 15 Jan 2020 03:05:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SIHFsa-zhNDu for <iommu@lists.linux-foundation.org>;
 Wed, 15 Jan 2020 03:05:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by silver.osuosl.org (Postfix) with ESMTPS id 5A4DC1FEDF
 for <iommu@lists.linux-foundation.org>; Wed, 15 Jan 2020 03:05:28 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Jan 2020 19:05:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,321,1574150400"; d="scan'208";a="219138461"
Received: from unknown (HELO allen-box.sh.intel.com) ([10.239.159.138])
 by fmsmga007.fm.intel.com with ESMTP; 14 Jan 2020 19:05:27 -0800
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH 5/5] iommu/vt-d: Unnecessary to handle default identity domain
Date: Wed, 15 Jan 2020 11:03:59 +0800
Message-Id: <20200115030359.13471-6-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200115030359.13471-1-baolu.lu@linux.intel.com>
References: <20200115030359.13471-1-baolu.lu@linux.intel.com>
Cc: iommu@lists.linux-foundation.org
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
index 3446da5a2186..f1f812cb7b9d 100644
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
@@ -5038,7 +5033,7 @@ static int __init platform_optin_force_iommu(void)
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
