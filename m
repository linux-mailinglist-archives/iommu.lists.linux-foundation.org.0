Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 291AE324A94
	for <lists.iommu@lfdr.de>; Thu, 25 Feb 2021 07:36:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A11C560754;
	Thu, 25 Feb 2021 06:36:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ME6eh8IPeG6L; Thu, 25 Feb 2021 06:36:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id B04446F6F1;
	Thu, 25 Feb 2021 06:36:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B82BBC0001;
	Thu, 25 Feb 2021 06:36:05 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B6F8EC0001
 for <iommu@lists.linux-foundation.org>; Thu, 25 Feb 2021 06:36:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9845B83F62
 for <iommu@lists.linux-foundation.org>; Thu, 25 Feb 2021 06:36:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lnd6MnYXaEgn for <iommu@lists.linux-foundation.org>;
 Thu, 25 Feb 2021 06:36:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DC2EC83F4E
 for <iommu@lists.linux-foundation.org>; Thu, 25 Feb 2021 06:36:03 +0000 (UTC)
IronPort-SDR: mXuhLtDH8TrYLyEzollK1O4mhq8pQAciSUqnqZQ+6x1tQZ5fCsBGz1IXG2pVe7Z+FacOJVQdtN
 7PMn73qWjJbA==
X-IronPort-AV: E=McAfee;i="6000,8403,9905"; a="249486084"
X-IronPort-AV: E=Sophos;i="5.81,205,1610438400"; d="scan'208";a="249486084"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2021 22:36:02 -0800
IronPort-SDR: b77Wx7U87EoBv/R5GUKpFJyOs3wp1ax7LfGvkJOeaU3knlBXuh6aae18jRM+hM3611QefNyfeV
 1kO2D7znc7UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,205,1610438400"; d="scan'208";a="499965283"
Received: from allen-box.sh.intel.com ([10.239.159.128])
 by fmsmga001.fm.intel.com with ESMTP; 24 Feb 2021 22:36:00 -0800
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>
Subject: [PATCH 3/5] iommu/vt-d: Invalidate PASID cache when root/context
 entry changed
Date: Thu, 25 Feb 2021 14:26:52 +0800
Message-Id: <20210225062654.2864322-4-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210225062654.2864322-1-baolu.lu@linux.intel.com>
References: <20210225062654.2864322-1-baolu.lu@linux.intel.com>
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

When the Intel IOMMU is operating in the scalable mode, some information
from the root and context table may be used to tag entries in the PASID
cache. Software should invalidate the PASID-cache when changing root or
context table entries.

Suggested-by: Ashok Raj <ashok.raj@intel.com>
Fixes: 7373a8cc38197 ("iommu/vt-d: Setup context and enable RID2PASID support")
Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/iommu/intel/iommu.c | 18 +++++++++---------
 include/linux/intel-iommu.h |  1 +
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index 19b3fd0d035b..f41b184ce6eb 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -1340,6 +1340,11 @@ static void iommu_set_root_entry(struct intel_iommu *iommu)
 		      readl, (sts & DMA_GSTS_RTPS), sts);
 
 	raw_spin_unlock_irqrestore(&iommu->register_lock, flag);
+
+	iommu->flush.flush_context(iommu, 0, 0, 0, DMA_CCMD_GLOBAL_INVL);
+	if (sm_supported(iommu))
+		qi_flush_pasid_cache(iommu, 0, QI_PC_GLOBAL, 0);
+	iommu->flush.flush_iotlb(iommu, 0, 0, 0, DMA_TLB_GLOBAL_FLUSH);
 }
 
 void iommu_flush_write_buffer(struct intel_iommu *iommu)
@@ -2423,6 +2428,10 @@ static void domain_context_clear_one(struct intel_iommu *iommu, u8 bus, u8 devfn
 				   (((u16)bus) << 8) | devfn,
 				   DMA_CCMD_MASK_NOBIT,
 				   DMA_CCMD_DEVICE_INVL);
+
+	if (sm_supported(iommu))
+		qi_flush_pasid_cache(iommu, did_old, QI_PC_ALL_PASIDS, 0);
+
 	iommu->flush.flush_iotlb(iommu,
 				 did_old,
 				 0,
@@ -3268,8 +3277,6 @@ static int __init init_dmars(void)
 		register_pasid_allocator(iommu);
 #endif
 		iommu_set_root_entry(iommu);
-		iommu->flush.flush_context(iommu, 0, 0, 0, DMA_CCMD_GLOBAL_INVL);
-		iommu->flush.flush_iotlb(iommu, 0, 0, 0, DMA_TLB_GLOBAL_FLUSH);
 	}
 
 #ifdef CONFIG_INTEL_IOMMU_BROKEN_GFX_WA
@@ -3459,12 +3466,7 @@ static int init_iommu_hw(void)
 		}
 
 		iommu_flush_write_buffer(iommu);
-
 		iommu_set_root_entry(iommu);
-
-		iommu->flush.flush_context(iommu, 0, 0, 0,
-					   DMA_CCMD_GLOBAL_INVL);
-		iommu->flush.flush_iotlb(iommu, 0, 0, 0, DMA_TLB_GLOBAL_FLUSH);
 		iommu_enable_translation(iommu);
 		iommu_disable_protect_mem_regions(iommu);
 	}
@@ -3847,8 +3849,6 @@ static int intel_iommu_add(struct dmar_drhd_unit *dmaru)
 		goto disable_iommu;
 
 	iommu_set_root_entry(iommu);
-	iommu->flush.flush_context(iommu, 0, 0, 0, DMA_CCMD_GLOBAL_INVL);
-	iommu->flush.flush_iotlb(iommu, 0, 0, 0, DMA_TLB_GLOBAL_FLUSH);
 	iommu_enable_translation(iommu);
 
 	iommu_disable_protect_mem_regions(iommu);
diff --git a/include/linux/intel-iommu.h b/include/linux/intel-iommu.h
index 1bc46b88711a..d1f32b33415a 100644
--- a/include/linux/intel-iommu.h
+++ b/include/linux/intel-iommu.h
@@ -372,6 +372,7 @@ enum {
 /* PASID cache invalidation granu */
 #define QI_PC_ALL_PASIDS	0
 #define QI_PC_PASID_SEL		1
+#define QI_PC_GLOBAL		3
 
 #define QI_EIOTLB_ADDR(addr)	((u64)(addr) & VTD_PAGE_MASK)
 #define QI_EIOTLB_IH(ih)	(((u64)ih) << 6)
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
