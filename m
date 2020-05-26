Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4FE1D5F08
	for <lists.iommu@lfdr.de>; Sat, 16 May 2020 08:24:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id B43E1898E3;
	Sat, 16 May 2020 06:24:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KHkskKB05hDr; Sat, 16 May 2020 06:24:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 17A7E898BB;
	Sat, 16 May 2020 06:24:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 111B8C016F;
	Sat, 16 May 2020 06:24:45 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 31EBAC016F
 for <iommu@lists.linux-foundation.org>; Sat, 16 May 2020 06:24:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 1871787E39
 for <iommu@lists.linux-foundation.org>; Sat, 16 May 2020 06:24:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dhdBkPyQQSAr for <iommu@lists.linux-foundation.org>;
 Sat, 16 May 2020 06:24:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 6A62287E34
 for <iommu@lists.linux-foundation.org>; Sat, 16 May 2020 06:24:42 +0000 (UTC)
IronPort-SDR: XqlmGKOz2QCqSXCh0CWIgodJkTcCQvZmgv9UsPqtmGm2Q9dQ0zh4rSH6woSroaouUOFYJZP0+A
 XtZ1Pvq/aX3A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2020 23:24:42 -0700
IronPort-SDR: Lu39lU4tc1ZgGOEjg7unYWUCQl0t3IvyJ0TI11HIM3ygWoOMzxsbmOTWKgNCimAx2k8mIHKHoz
 lg94CNcPQZ/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,398,1583222400"; d="scan'208";a="281442408"
Received: from allen-box.sh.intel.com ([10.239.159.139])
 by orsmga002.jf.intel.com with ESMTP; 15 May 2020 23:24:40 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH 05/18] iommu/vt-d: Support flushing more translation cache
 types
Date: Sat, 16 May 2020 14:20:48 +0800
Message-Id: <20200516062101.29541-6-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200516062101.29541-1-baolu.lu@linux.intel.com>
References: <20200516062101.29541-1-baolu.lu@linux.intel.com>
Cc: iommu@lists.linux-foundation.org, Tom Murphy <murphyt7@tcd.ie>
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

From: Jacob Pan <jacob.jun.pan@linux.intel.com>

When Shared Virtual Memory is exposed to a guest via vIOMMU, scalable
IOTLB invalidation may be passed down from outside IOMMU subsystems.
This patch adds invalidation functions that can be used for additional
translation cache types.

Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/iommu/dmar.c        | 39 +++++++++++++++++++++++++++++++++++++
 drivers/iommu/intel-pasid.c |  3 ++-
 include/linux/intel-iommu.h | 21 ++++++++++++++++----
 3 files changed, 58 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/dmar.c b/drivers/iommu/dmar.c
index f77dae7ba7d4..34ee8f28555f 100644
--- a/drivers/iommu/dmar.c
+++ b/drivers/iommu/dmar.c
@@ -1421,6 +1421,45 @@ void qi_flush_piotlb(struct intel_iommu *iommu, u16 did, u32 pasid, u64 addr,
 	qi_submit_sync(&desc, iommu);
 }
 
+/* PASID-based device IOTLB Invalidate */
+void qi_flush_dev_iotlb_pasid(struct intel_iommu *iommu, u16 sid, u16 pfsid,
+			      u32 pasid,  u16 qdep, u64 addr,
+			      unsigned int size_order, u64 granu)
+{
+	unsigned long mask = 1UL << (VTD_PAGE_SHIFT + size_order - 1);
+	struct qi_desc desc = {.qw1 = 0, .qw2 = 0, .qw3 = 0};
+
+	desc.qw0 = QI_DEV_EIOTLB_PASID(pasid) | QI_DEV_EIOTLB_SID(sid) |
+		QI_DEV_EIOTLB_QDEP(qdep) | QI_DEIOTLB_TYPE |
+		QI_DEV_IOTLB_PFSID(pfsid);
+	desc.qw1 = QI_DEV_EIOTLB_GLOB(granu);
+
+	/*
+	 * If S bit is 0, we only flush a single page. If S bit is set,
+	 * The least significant zero bit indicates the invalidation address
+	 * range. VT-d spec 6.5.2.6.
+	 * e.g. address bit 12[0] indicates 8KB, 13[0] indicates 16KB.
+	 * size order = 0 is PAGE_SIZE 4KB
+	 * Max Invs Pending (MIP) is set to 0 for now until we have DIT in
+	 * ECAP.
+	 */
+	desc.qw1 |= addr & ~mask;
+	if (size_order)
+		desc.qw1 |= QI_DEV_EIOTLB_SIZE;
+
+	qi_submit_sync(&desc, iommu);
+}
+
+void qi_flush_pasid_cache(struct intel_iommu *iommu, u16 did,
+			  u64 granu, int pasid)
+{
+	struct qi_desc desc = {.qw1 = 0, .qw2 = 0, .qw3 = 0};
+
+	desc.qw0 = QI_PC_PASID(pasid) | QI_PC_DID(did) |
+			QI_PC_GRAN(granu) | QI_PC_TYPE;
+	qi_submit_sync(&desc, iommu);
+}
+
 /*
  * Disable Queued Invalidation interface.
  */
diff --git a/drivers/iommu/intel-pasid.c b/drivers/iommu/intel-pasid.c
index c7fa1b79eaf7..5d9d9ff49334 100644
--- a/drivers/iommu/intel-pasid.c
+++ b/drivers/iommu/intel-pasid.c
@@ -375,7 +375,8 @@ pasid_cache_invalidation_with_pasid(struct intel_iommu *iommu,
 {
 	struct qi_desc desc;
 
-	desc.qw0 = QI_PC_DID(did) | QI_PC_PASID_SEL | QI_PC_PASID(pasid);
+	desc.qw0 = QI_PC_DID(did) | QI_PC_GRAN(QI_PC_PASID_SEL) |
+		QI_PC_PASID(pasid) | QI_PC_TYPE;
 	desc.qw1 = 0;
 	desc.qw2 = 0;
 	desc.qw3 = 0;
diff --git a/include/linux/intel-iommu.h b/include/linux/intel-iommu.h
index 3dfd426dfb03..a9c984b29a72 100644
--- a/include/linux/intel-iommu.h
+++ b/include/linux/intel-iommu.h
@@ -334,7 +334,7 @@ enum {
 #define QI_IOTLB_GRAN(gran) 	(((u64)gran) >> (DMA_TLB_FLUSH_GRANU_OFFSET-4))
 #define QI_IOTLB_ADDR(addr)	(((u64)addr) & VTD_PAGE_MASK)
 #define QI_IOTLB_IH(ih)		(((u64)ih) << 6)
-#define QI_IOTLB_AM(am)		(((u8)am))
+#define QI_IOTLB_AM(am)		(((u8)am) & 0x3f)
 
 #define QI_CC_FM(fm)		(((u64)fm) << 48)
 #define QI_CC_SID(sid)		(((u64)sid) << 32)
@@ -353,16 +353,21 @@ enum {
 #define QI_PC_DID(did)		(((u64)did) << 16)
 #define QI_PC_GRAN(gran)	(((u64)gran) << 4)
 
-#define QI_PC_ALL_PASIDS	(QI_PC_TYPE | QI_PC_GRAN(0))
-#define QI_PC_PASID_SEL		(QI_PC_TYPE | QI_PC_GRAN(1))
+/* PASID cache invalidation granu */
+#define QI_PC_ALL_PASIDS	0
+#define QI_PC_PASID_SEL		1
 
 #define QI_EIOTLB_ADDR(addr)	((u64)(addr) & VTD_PAGE_MASK)
 #define QI_EIOTLB_IH(ih)	(((u64)ih) << 6)
-#define QI_EIOTLB_AM(am)	(((u64)am))
+#define QI_EIOTLB_AM(am)	(((u64)am) & 0x3f)
 #define QI_EIOTLB_PASID(pasid) 	(((u64)pasid) << 32)
 #define QI_EIOTLB_DID(did)	(((u64)did) << 16)
 #define QI_EIOTLB_GRAN(gran) 	(((u64)gran) << 4)
 
+/* QI Dev-IOTLB inv granu */
+#define QI_DEV_IOTLB_GRAN_ALL		1
+#define QI_DEV_IOTLB_GRAN_PASID_SEL	0
+
 #define QI_DEV_EIOTLB_ADDR(a)	((u64)(a) & VTD_PAGE_MASK)
 #define QI_DEV_EIOTLB_SIZE	(((u64)1) << 11)
 #define QI_DEV_EIOTLB_GLOB(g)	((u64)g)
@@ -679,8 +684,16 @@ extern void qi_flush_iotlb(struct intel_iommu *iommu, u16 did, u64 addr,
 			  unsigned int size_order, u64 type);
 extern void qi_flush_dev_iotlb(struct intel_iommu *iommu, u16 sid, u16 pfsid,
 			u16 qdep, u64 addr, unsigned mask);
+
 void qi_flush_piotlb(struct intel_iommu *iommu, u16 did, u32 pasid, u64 addr,
 		     unsigned long npages, bool ih);
+
+void qi_flush_dev_iotlb_pasid(struct intel_iommu *iommu, u16 sid, u16 pfsid,
+			      u32 pasid, u16 qdep, u64 addr,
+			      unsigned int size_order, u64 granu);
+void qi_flush_pasid_cache(struct intel_iommu *iommu, u16 did, u64 granu,
+			  int pasid);
+
 extern int qi_submit_sync(struct qi_desc *desc, struct intel_iommu *iommu);
 
 extern int dmar_ir_support(void);
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
