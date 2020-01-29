Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id AB59114CA3F
	for <lists.iommu@lfdr.de>; Wed, 29 Jan 2020 13:06:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5B93286E26;
	Wed, 29 Jan 2020 12:06:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eXLyg9tDIvJ7; Wed, 29 Jan 2020 12:06:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1EB1F86E53;
	Wed, 29 Jan 2020 12:06:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 19A31C1D8B;
	Wed, 29 Jan 2020 12:06:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 51E90C1D84
 for <iommu@lists.linux-foundation.org>; Wed, 29 Jan 2020 12:06:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 40CF786DF4
 for <iommu@lists.linux-foundation.org>; Wed, 29 Jan 2020 12:06:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H1Taav6Qn8hD for <iommu@lists.linux-foundation.org>;
 Wed, 29 Jan 2020 12:06:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 0BAB486E15
 for <iommu@lists.linux-foundation.org>; Wed, 29 Jan 2020 12:06:40 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Jan 2020 04:06:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,377,1574150400"; d="scan'208";a="222433145"
Received: from jacob-builder.jf.intel.com ([10.7.199.155])
 by orsmga008.jf.intel.com with ESMTP; 29 Jan 2020 04:06:38 -0800
From: "Liu, Yi L" <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	eric.auger@redhat.com
Subject: [RFC v3 4/8] vfio/type1: Add VFIO_NESTING_GET_IOMMU_UAPI_VERSION
Date: Wed, 29 Jan 2020 04:11:48 -0800
Message-Id: <1580299912-86084-5-git-send-email-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1580299912-86084-1-git-send-email-yi.l.liu@intel.com>
References: <1580299912-86084-1-git-send-email-yi.l.liu@intel.com>
Cc: kevin.tian@intel.com, ashok.raj@intel.com, kvm@vger.kernel.org,
 jean-philippe.brucker@arm.com, jun.j.tian@intel.com,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 yi.y.sun@intel.com
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

In Linux Kernel, the IOMMU nesting translation (a.k.a. IOMMU dual stage
translation capability) is abstracted in uapi/iommu.h, in which the uAPIs
like bind_gpasid/iommu_cache_invalidate/fault_report/pgreq_resp are defined.

VFIO_TYPE1_NESTING_IOMMU stands for the vfio iommu type which is backed by
IOMMU nesting translation capability. VFIO exposes the nesting capability
to userspace and also exposes uAPIs (will be added in later patches) to user
space for setting up nesting translation from userspace. Thus applications
like QEMU could support vIOMMU for pass-through devices with IOMMU nesting
translation capability.

As VFIO expose the nesting IOMMU programming to userspace, it also needs to
provide an API for the uapi/iommu.h version check to ensure compatibility.
This patch reports the iommu uapi version to userspace. Applications could
use this API to do version check before further using the nesting uAPIs.

Cc: Kevin Tian <kevin.tian@intel.com>
CC: Jacob Pan <jacob.jun.pan@linux.intel.com>
Cc: Alex Williamson <alex.williamson@redhat.com>
Cc: Eric Auger <eric.auger@redhat.com>
Cc: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
Signed-off-by: Liu Yi L <yi.l.liu@intel.com>
---
 drivers/vfio/vfio.c       |  3 +++
 include/uapi/linux/vfio.h | 10 ++++++++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/vfio/vfio.c b/drivers/vfio/vfio.c
index 425d60a..9087ad4 100644
--- a/drivers/vfio/vfio.c
+++ b/drivers/vfio/vfio.c
@@ -1170,6 +1170,9 @@ static long vfio_fops_unl_ioctl(struct file *filep,
 	case VFIO_GET_API_VERSION:
 		ret = VFIO_API_VERSION;
 		break;
+	case VFIO_NESTING_GET_IOMMU_UAPI_VERSION:
+		ret = iommu_get_uapi_version();
+		break;
 	case VFIO_CHECK_EXTENSION:
 		ret = vfio_ioctl_check_extension(container, arg);
 		break;
diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
index d4bf415..62113be 100644
--- a/include/uapi/linux/vfio.h
+++ b/include/uapi/linux/vfio.h
@@ -857,6 +857,16 @@ struct vfio_iommu_type1_pasid_quota {
  */
 #define VFIO_IOMMU_SET_PASID_QUOTA	_IO(VFIO_TYPE, VFIO_BASE + 23)
 
+/**
+ * VFIO_NESTING_GET_IOMMU_UAPI_VERSION - _IO(VFIO_TYPE, VFIO_BASE + 24)
+ *
+ * Report the version of the IOMMU UAPI when dual stage IOMMU is supported.
+ * In VFIO, it is needed for VFIO_TYPE1_NESTING_IOMMU.
+ * Availability: Always.
+ * Return: IOMMU UAPI version
+ */
+#define VFIO_NESTING_GET_IOMMU_UAPI_VERSION	_IO(VFIO_TYPE, VFIO_BASE + 24)
+
 /* -------- Additional API for SPAPR TCE (Server POWERPC) IOMMU -------- */
 
 /*
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
