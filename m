Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id C22162F7868
	for <lists.iommu@lfdr.de>; Fri, 15 Jan 2021 13:14:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 80DAA20444;
	Fri, 15 Jan 2021 12:14:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yOBWoFgPZ4eS; Fri, 15 Jan 2021 12:14:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id E85AB2050A;
	Fri, 15 Jan 2021 12:14:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CC91BC013A;
	Fri, 15 Jan 2021 12:14:25 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 82405C013A;
 Fri, 15 Jan 2021 12:14:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7E9548738D;
 Fri, 15 Jan 2021 12:14:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NYUFGg-Jpsvp; Fri, 15 Jan 2021 12:14:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by hemlock.osuosl.org (Postfix) with ESMTP id CC6EA8738C;
 Fri, 15 Jan 2021 12:14:22 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 87C8B13A1;
 Fri, 15 Jan 2021 04:14:22 -0800 (PST)
Received: from usa.arm.com (a074945.blr.arm.com [10.162.16.71])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 111C63F70D;
 Fri, 15 Jan 2021 04:14:17 -0800 (PST)
From: Vivek Gautam <vivek.gautam@arm.com>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux-foundation.org, virtualization@lists.linux-foundation.org
Subject: [PATCH RFC v1 06/15] iommu/virtio: Add headers for table format
 probing
Date: Fri, 15 Jan 2021 17:43:33 +0530
Message-Id: <20210115121342.15093-7-vivek.gautam@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210115121342.15093-1-vivek.gautam@arm.com>
References: <20210115121342.15093-1-vivek.gautam@arm.com>
Cc: jean-philippe@linaro.org, kevin.tian@intel.com, mst@redhat.com,
 will.deacon@arm.com, alex.williamson@redhat.com, vivek.gautam@arm.com,
 robin.murphy@arm.com
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

From: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>

Add required UAPI defines for probing table format for underlying
iommu hardware. The device may provide information about hardware
tables and additional capabilities for each device.
This allows guest to correctly fabricate stage-1 page tables.

Signed-off-by: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
[Vivek: Use a single "struct virtio_iommu_probe_table_format" rather
        than separate structures for page table and pasid table format.
	Also update commit message.]
Signed-off-by: Vivek Gautam <vivek.gautam@arm.com>
Cc: Joerg Roedel <joro@8bytes.org>
Cc: Will Deacon <will.deacon@arm.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: Eric Auger <eric.auger@redhat.com>
Cc: Alex Williamson <alex.williamson@redhat.com>
Cc: Kevin Tian <kevin.tian@intel.com>
Cc: Jacob Pan <jacob.jun.pan@linux.intel.com>
Cc: Liu Yi L <yi.l.liu@intel.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
---
 include/uapi/linux/virtio_iommu.h | 44 ++++++++++++++++++++++++++++++-
 1 file changed, 43 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/virtio_iommu.h b/include/uapi/linux/virtio_iommu.h
index 237e36a280cb..43821e33e7af 100644
--- a/include/uapi/linux/virtio_iommu.h
+++ b/include/uapi/linux/virtio_iommu.h
@@ -2,7 +2,7 @@
 /*
  * Virtio-iommu definition v0.12
  *
- * Copyright (C) 2019 Arm Ltd.
+ * Copyright (C) 2019-2021 Arm Ltd.
  */
 #ifndef _UAPI_LINUX_VIRTIO_IOMMU_H
 #define _UAPI_LINUX_VIRTIO_IOMMU_H
@@ -111,6 +111,12 @@ struct virtio_iommu_req_unmap {
 
 #define VIRTIO_IOMMU_PROBE_T_NONE		0
 #define VIRTIO_IOMMU_PROBE_T_RESV_MEM		1
+#define VIRTIO_IOMMU_PROBE_T_PAGE_SIZE_MASK	2
+#define VIRTIO_IOMMU_PROBE_T_INPUT_RANGE	3
+#define VIRTIO_IOMMU_PROBE_T_OUTPUT_SIZE	4
+#define VIRTIO_IOMMU_PROBE_T_PASID_SIZE		5
+#define VIRTIO_IOMMU_PROBE_T_PAGE_TABLE_FMT	6
+#define VIRTIO_IOMMU_PROBE_T_PASID_TABLE_FMT	7
 
 #define VIRTIO_IOMMU_PROBE_T_MASK		0xfff
 
@@ -130,6 +136,42 @@ struct virtio_iommu_probe_resv_mem {
 	__le64					end;
 };
 
+struct virtio_iommu_probe_page_size_mask {
+	struct virtio_iommu_probe_property	head;
+	__u8					reserved[4];
+	__le64					mask;
+};
+
+struct virtio_iommu_probe_input_range {
+	struct virtio_iommu_probe_property	head;
+	__u8					reserved[4];
+	__le64					start;
+	__le64					end;
+};
+
+struct virtio_iommu_probe_output_size {
+	struct virtio_iommu_probe_property	head;
+	__u8					bits;
+	__u8					reserved[3];
+};
+
+struct virtio_iommu_probe_pasid_size {
+	struct virtio_iommu_probe_property	head;
+	__u8					bits;
+	__u8					reserved[3];
+};
+
+/* Arm LPAE page table format */
+#define VIRTIO_IOMMU_FOMRAT_PGTF_ARM_LPAE	1
+/* Arm smmu-v3 type PASID table format */
+#define VIRTIO_IOMMU_FORMAT_PSTF_ARM_SMMU_V3	2
+
+struct virtio_iommu_probe_table_format {
+	struct virtio_iommu_probe_property	head;
+	__le16					format;
+	__u8					reserved[2];
+};
+
 struct virtio_iommu_req_probe {
 	struct virtio_iommu_req_head		head;
 	__le32					endpoint;
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
