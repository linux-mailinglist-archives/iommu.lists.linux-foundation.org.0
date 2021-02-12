Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id B821B319CED
	for <lists.iommu@lfdr.de>; Fri, 12 Feb 2021 11:59:22 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 52E3687266;
	Fri, 12 Feb 2021 10:59:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HehNfCruE6IL; Fri, 12 Feb 2021 10:59:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 238A186B77;
	Fri, 12 Feb 2021 10:59:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1C195C013A;
	Fri, 12 Feb 2021 10:59:20 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 76465C013A;
 Fri, 12 Feb 2021 10:59:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 7231786E68;
 Fri, 12 Feb 2021 10:59:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5omG6i+5ZjOa; Fri, 12 Feb 2021 10:59:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by whitealder.osuosl.org (Postfix) with ESMTP id 9947686B6C;
 Fri, 12 Feb 2021 10:59:16 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A134511B3;
 Fri, 12 Feb 2021 02:59:15 -0800 (PST)
Received: from usa.arm.com (a074945.blr.arm.com [10.162.16.71])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 614273F719;
 Fri, 12 Feb 2021 02:59:11 -0800 (PST)
From: Vivek Gautam <vivek.gautam@arm.com>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux-foundation.org, virtualization@lists.linux-foundation.org
Subject: [PATCH 1/2] iommu: Report domain nesting info for arm-smmu-v3
Date: Fri, 12 Feb 2021 16:28:58 +0530
Message-Id: <20210212105859.8445-2-vivek.gautam@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210212105859.8445-1-vivek.gautam@arm.com>
References: <20210212105859.8445-1-vivek.gautam@arm.com>
Cc: jean-philippe@linaro.org, kevin.tian@intel.com, mst@redhat.com,
 will.deacon@arm.com, alex.williamson@redhat.com, robin.murphy@arm.com
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

Add a vendor specific structure for domain nesting info for
arm smmu-v3, and necessary info fields required to populate
stage1 page tables.

Signed-off-by: Vivek Gautam <vivek.gautam@arm.com>
---
 include/uapi/linux/iommu.h | 31 +++++++++++++++++++++++++------
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/include/uapi/linux/iommu.h b/include/uapi/linux/iommu.h
index 4d3d988fa353..5f059bcf7720 100644
--- a/include/uapi/linux/iommu.h
+++ b/include/uapi/linux/iommu.h
@@ -323,7 +323,8 @@ struct iommu_gpasid_bind_data {
 #define IOMMU_GPASID_BIND_VERSION_1	1
 	__u32 version;
 #define IOMMU_PASID_FORMAT_INTEL_VTD	1
-#define IOMMU_PASID_FORMAT_LAST		2
+#define IOMMU_PASID_FORMAT_ARM_SMMU_V3	2
+#define IOMMU_PASID_FORMAT_LAST		3
 	__u32 format;
 	__u32 addr_width;
 #define IOMMU_SVA_GPASID_VAL	(1 << 0) /* guest PASID valid */
@@ -409,6 +410,21 @@ struct iommu_nesting_info_vtd {
 	__u64	ecap_reg;
 };
 
+/*
+ * struct iommu_nesting_info_arm_smmuv3 - Arm SMMU-v3 nesting info.
+ */
+struct iommu_nesting_info_arm_smmuv3 {
+	__u32	flags;
+	__u16	asid_bits;
+
+	/* Arm LPAE page table format as per kernel */
+#define ARM_PGTBL_32_LPAE_S1		(0x0)
+#define ARM_PGTBL_64_LPAE_S1		(0x2)
+	__u8	pgtbl_fmt;
+
+	__u8	padding[9];
+};
+
 /*
  * struct iommu_nesting_info - Information for nesting-capable IOMMU.
  *			       userspace should check it before using
@@ -445,11 +461,13 @@ struct iommu_nesting_info_vtd {
  * +---------------+------------------------------------------------------+
  *
  * data struct types defined for @format:
- * +================================+=====================================+
- * | @format                        | data struct                         |
- * +================================+=====================================+
- * | IOMMU_PASID_FORMAT_INTEL_VTD   | struct iommu_nesting_info_vtd       |
- * +--------------------------------+-------------------------------------+
+ * +================================+======================================+
+ * | @format                        | data struct                          |
+ * +================================+======================================+
+ * | IOMMU_PASID_FORMAT_INTEL_VTD   | struct iommu_nesting_info_vtd        |
+ * +---------------+-------------------------------------------------------+
+ * | IOMMU_PASID_FORMAT_ARM_SMMU_V3 | struct iommu_nesting_info_arm_smmuv3 |
+ * +--------------------------------+--------------------------------------+
  *
  */
 struct iommu_nesting_info {
@@ -466,6 +484,7 @@ struct iommu_nesting_info {
 	/* Vendor specific data */
 	union {
 		struct iommu_nesting_info_vtd vtd;
+		struct iommu_nesting_info_arm_smmuv3 smmuv3;
 	} vendor;
 };
 
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
