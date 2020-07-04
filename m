Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E722144FF
	for <lists.iommu@lfdr.de>; Sat,  4 Jul 2020 13:20:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id BBFFD884A3;
	Sat,  4 Jul 2020 11:20:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jUhVRdqwF2SK; Sat,  4 Jul 2020 11:20:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id ACC83885DD;
	Sat,  4 Jul 2020 11:20:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 89480C0733;
	Sat,  4 Jul 2020 11:20:01 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 80A70C08A2
 for <iommu@lists.linux-foundation.org>; Sat,  4 Jul 2020 11:19:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7DBB88852E
 for <iommu@lists.linux-foundation.org>; Sat,  4 Jul 2020 11:19:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UzeK8yDyAiFR for <iommu@lists.linux-foundation.org>;
 Sat,  4 Jul 2020 11:19:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by hemlock.osuosl.org (Postfix) with ESMTPS id EC99789294
 for <iommu@lists.linux-foundation.org>; Sat,  4 Jul 2020 11:19:54 +0000 (UTC)
IronPort-SDR: nr2RIw+bL/3UMPVR15IftltZs7B3rX8kaElK1u0gwBWORZ2BDjBAxBI/csQasa/Dh0Z9uXaamO
 X/XrYhtFJINA==
X-IronPort-AV: E=McAfee;i="6000,8403,9671"; a="134701879"
X-IronPort-AV: E=Sophos;i="5.75,311,1589266800"; d="scan'208";a="134701879"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2020 04:19:53 -0700
IronPort-SDR: I/r2cHkUorl9oIxwek7zycgwWIjmAhSVOVY5UernlILLMy3/HY+/hbVQWND9ygfwYmLqdlp+aq
 7lBeVm5vtIsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,311,1589266800"; d="scan'208";a="282521432"
Received: from jacob-builder.jf.intel.com ([10.7.199.155])
 by orsmga006.jf.intel.com with ESMTP; 04 Jul 2020 04:19:52 -0700
From: Liu Yi L <yi.l.liu@intel.com>
To: alex.williamson@redhat.com, eric.auger@redhat.com,
 baolu.lu@linux.intel.com, joro@8bytes.org
Subject: [PATCH v4 07/15] vfio/type1: Add VFIO_IOMMU_PASID_REQUEST (alloc/free)
Date: Sat,  4 Jul 2020 04:26:21 -0700
Message-Id: <1593861989-35920-8-git-send-email-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1593861989-35920-1-git-send-email-yi.l.liu@intel.com>
References: <1593861989-35920-1-git-send-email-yi.l.liu@intel.com>
Cc: jean-philippe@linaro.org, kevin.tian@intel.com, ashok.raj@intel.com,
 kvm@vger.kernel.org, stefanha@gmail.com, jun.j.tian@intel.com,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 yi.y.sun@intel.com, hao.wu@intel.com
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

This patch allows user space to request PASID allocation/free, e.g. when
serving the request from the guest.

PASIDs that are not freed by userspace are automatically freed when the
IOASID set is destroyed when process exits.

Cc: Kevin Tian <kevin.tian@intel.com>
CC: Jacob Pan <jacob.jun.pan@linux.intel.com>
Cc: Alex Williamson <alex.williamson@redhat.com>
Cc: Eric Auger <eric.auger@redhat.com>
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: Joerg Roedel <joro@8bytes.org>
Cc: Lu Baolu <baolu.lu@linux.intel.com>
Signed-off-by: Liu Yi L <yi.l.liu@intel.com>
Signed-off-by: Yi Sun <yi.y.sun@linux.intel.com>
Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
---
v3 -> v4:
*) address comments from v3, except the below comment against the range
   of PASID_FREE request. needs more help on it.
    "> +if (req.range.min > req.range.max)

    Is it exploitable that a user can spin the kernel for a long time in
    the case of a free by calling this with [0, MAX_UINT] regardless of
    their actual allocations?"

v1 -> v2:
*) move the vfio_mm related code to be a seprate module
*) use a single structure for alloc/free, could support a range of PASIDs
*) fetch vfio_mm at group_attach time instead of at iommu driver open time
---
 drivers/vfio/Kconfig            |  1 +
 drivers/vfio/vfio_iommu_type1.c | 84 +++++++++++++++++++++++++++++++++++++++++
 drivers/vfio/vfio_pasid.c       | 10 +++++
 include/linux/vfio.h            |  6 +++
 include/uapi/linux/vfio.h       | 36 ++++++++++++++++++
 5 files changed, 137 insertions(+)

diff --git a/drivers/vfio/Kconfig b/drivers/vfio/Kconfig
index 3d8a108..95d90c6 100644
--- a/drivers/vfio/Kconfig
+++ b/drivers/vfio/Kconfig
@@ -2,6 +2,7 @@
 config VFIO_IOMMU_TYPE1
 	tristate
 	depends on VFIO
+	select VFIO_PASID if (X86)
 	default n
 
 config VFIO_IOMMU_SPAPR_TCE
diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
index 80623b8..29726ca 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -76,6 +76,7 @@ struct vfio_iommu {
 	bool				dirty_page_tracking;
 	bool				pinned_page_dirty_scope;
 	struct iommu_nesting_info	*nesting_info;
+	struct vfio_mm			*vmm;
 };
 
 struct vfio_domain {
@@ -1937,6 +1938,11 @@ static void vfio_iommu_iova_insert_copy(struct vfio_iommu *iommu,
 
 static void vfio_iommu_release_nesting_info(struct vfio_iommu *iommu)
 {
+	if (iommu->vmm) {
+		vfio_mm_put(iommu->vmm);
+		iommu->vmm = NULL;
+	}
+
 	kfree(iommu->nesting_info);
 	iommu->nesting_info = NULL;
 }
@@ -2075,6 +2081,25 @@ static int vfio_iommu_type1_attach_group(void *iommu_data,
 			goto out_detach;
 		}
 		iommu->nesting_info = info;
+
+		if (info->features & IOMMU_NESTING_FEAT_SYSWIDE_PASID) {
+			struct vfio_mm *vmm;
+			int sid;
+
+			vmm = vfio_mm_get_from_task(current);
+			if (IS_ERR(vmm)) {
+				ret = PTR_ERR(vmm);
+				goto out_detach;
+			}
+			iommu->vmm = vmm;
+
+			sid = vfio_mm_ioasid_sid(vmm);
+			ret = iommu_domain_set_attr(domain->domain,
+						    DOMAIN_ATTR_IOASID_SID,
+						    &sid);
+			if (ret)
+				goto out_detach;
+		}
 	}
 
 	/* Get aperture info */
@@ -2860,6 +2885,63 @@ static int vfio_iommu_type1_dirty_pages(struct vfio_iommu *iommu,
 	return -EINVAL;
 }
 
+static int vfio_iommu_type1_pasid_alloc(struct vfio_iommu *iommu,
+					unsigned int min,
+					unsigned int max)
+{
+	int ret = -EOPNOTSUPP;
+
+	mutex_lock(&iommu->lock);
+	if (iommu->vmm)
+		ret = vfio_pasid_alloc(iommu->vmm, min, max);
+	mutex_unlock(&iommu->lock);
+	return ret;
+}
+
+static int vfio_iommu_type1_pasid_free(struct vfio_iommu *iommu,
+					unsigned int min,
+					unsigned int max)
+{
+	int ret = -EOPNOTSUPP;
+
+	mutex_lock(&iommu->lock);
+	if (iommu->vmm) {
+		vfio_pasid_free_range(iommu->vmm, min, max);
+		ret = 0;
+	}
+	mutex_unlock(&iommu->lock);
+	return ret;
+}
+
+static int vfio_iommu_type1_pasid_request(struct vfio_iommu *iommu,
+					  unsigned long arg)
+{
+	struct vfio_iommu_type1_pasid_request req;
+	unsigned long minsz;
+
+	minsz = offsetofend(struct vfio_iommu_type1_pasid_request, range);
+
+	if (copy_from_user(&req, (void __user *)arg, minsz))
+		return -EFAULT;
+
+	if (req.argsz < minsz || (req.flags & ~VFIO_PASID_REQUEST_MASK))
+		return -EINVAL;
+
+	if (req.range.min > req.range.max)
+		return -EINVAL;
+
+	switch (req.flags & VFIO_PASID_REQUEST_MASK) {
+	case VFIO_IOMMU_FLAG_ALLOC_PASID:
+		return vfio_iommu_type1_pasid_alloc(iommu,
+					req.range.min, req.range.max);
+	case VFIO_IOMMU_FLAG_FREE_PASID:
+		return vfio_iommu_type1_pasid_free(iommu,
+					req.range.min, req.range.max);
+	default:
+		return -EINVAL;
+	}
+}
+
 static long vfio_iommu_type1_ioctl(void *iommu_data,
 				   unsigned int cmd, unsigned long arg)
 {
@@ -2876,6 +2958,8 @@ static long vfio_iommu_type1_ioctl(void *iommu_data,
 		return vfio_iommu_type1_unmap_dma(iommu, arg);
 	case VFIO_IOMMU_DIRTY_PAGES:
 		return vfio_iommu_type1_dirty_pages(iommu, arg);
+	case VFIO_IOMMU_PASID_REQUEST:
+		return vfio_iommu_type1_pasid_request(iommu, arg);
 	}
 
 	return -ENOTTY;
diff --git a/drivers/vfio/vfio_pasid.c b/drivers/vfio/vfio_pasid.c
index c46b870..6f907db 100644
--- a/drivers/vfio/vfio_pasid.c
+++ b/drivers/vfio/vfio_pasid.c
@@ -53,6 +53,7 @@ void vfio_mm_put(struct vfio_mm *vmm)
 {
 	kref_put_mutex(&vmm->kref, vfio_mm_release, &vfio_pasid.vfio_mm_lock);
 }
+EXPORT_SYMBOL_GPL(vfio_mm_put);
 
 static void vfio_mm_get(struct vfio_mm *vmm)
 {
@@ -104,6 +105,13 @@ struct vfio_mm *vfio_mm_get_from_task(struct task_struct *task)
 	mmput(mm);
 	return vmm;
 }
+EXPORT_SYMBOL_GPL(vfio_mm_get_from_task);
+
+int vfio_mm_ioasid_sid(struct vfio_mm *vmm)
+{
+	return vmm->ioasid_sid;
+}
+EXPORT_SYMBOL_GPL(vfio_mm_ioasid_sid);
 
 int vfio_pasid_alloc(struct vfio_mm *vmm, int min, int max)
 {
@@ -113,6 +121,7 @@ int vfio_pasid_alloc(struct vfio_mm *vmm, int min, int max)
 
 	return (pasid == INVALID_IOASID) ? -ENOSPC : pasid;
 }
+EXPORT_SYMBOL_GPL(vfio_pasid_alloc);
 
 void vfio_pasid_free_range(struct vfio_mm *vmm,
 			    ioasid_t min, ioasid_t max)
@@ -130,6 +139,7 @@ void vfio_pasid_free_range(struct vfio_mm *vmm,
 	for (; pasid <= max; pasid++)
 		ioasid_free(pasid);
 }
+EXPORT_SYMBOL_GPL(vfio_pasid_free_range);
 
 static int __init vfio_pasid_init(void)
 {
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index 9da6468..35c922a 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -101,6 +101,7 @@ struct vfio_mm;
 #if IS_ENABLED(CONFIG_VFIO_PASID)
 extern struct vfio_mm *vfio_mm_get_from_task(struct task_struct *task);
 extern void vfio_mm_put(struct vfio_mm *vmm);
+int vfio_mm_ioasid_sid(struct vfio_mm *vmm);
 extern int vfio_pasid_alloc(struct vfio_mm *vmm, int min, int max);
 extern void vfio_pasid_free_range(struct vfio_mm *vmm,
 					ioasid_t min, ioasid_t max);
@@ -114,6 +115,11 @@ static inline void vfio_mm_put(struct vfio_mm *vmm)
 {
 }
 
+static inline int vfio_mm_ioasid_sid(struct vfio_mm *vmm)
+{
+	return -ENOTTY;
+}
+
 static inline int vfio_pasid_alloc(struct vfio_mm *vmm, int min, int max)
 {
 	return -ENOTTY;
diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
index 3e3de9c..fe267b8e 100644
--- a/include/uapi/linux/vfio.h
+++ b/include/uapi/linux/vfio.h
@@ -1169,6 +1169,42 @@ struct vfio_iommu_type1_dirty_bitmap_get {
 
 #define VFIO_IOMMU_DIRTY_PAGES             _IO(VFIO_TYPE, VFIO_BASE + 17)
 
+/**
+ * VFIO_IOMMU_PASID_REQUEST - _IOWR(VFIO_TYPE, VFIO_BASE + 18,
+ *				struct vfio_iommu_type1_pasid_request)
+ *
+ * PASID (Processor Address Space ID) is a PCIe concept for tagging
+ * address spaces in DMA requests. When system-wide PASID allocation
+ * is required by underlying iommu driver (e.g. Intel VT-d), this
+ * provides an interface for userspace to request pasid alloc/free
+ * for its assigned devices. Userspace should check the availability
+ * of this API through VFIO_IOMMU_GET_INFO.
+ *
+ * @flags=VFIO_IOMMU_FLAG_ALLOC_PASID, allocate a single PASID within @range.
+ * @flags=VFIO_IOMMU_FLAG_FREE_PASID, free the PASIDs within @range.
+ * @range is [min, max], which means both @min and @max are inclusive.
+ * ALLOC_PASID and FREE_PASID are mutually exclusive.
+ *
+ * returns: allocated PASID value on success, -errno on failure for
+ *	     ALLOC_PASID;
+ *	     0 for FREE_PASID operation;
+ */
+struct vfio_iommu_type1_pasid_request {
+	__u32	argsz;
+#define VFIO_IOMMU_FLAG_ALLOC_PASID	(1 << 0)
+#define VFIO_IOMMU_FLAG_FREE_PASID	(1 << 1)
+	__u32	flags;
+	struct {
+		__u32	min;
+		__u32	max;
+	} range;
+};
+
+#define VFIO_PASID_REQUEST_MASK	(VFIO_IOMMU_FLAG_ALLOC_PASID | \
+					 VFIO_IOMMU_FLAG_FREE_PASID)
+
+#define VFIO_IOMMU_PASID_REQUEST	_IO(VFIO_TYPE, VFIO_BASE + 18)
+
 /* -------- Additional API for SPAPR TCE (Server POWERPC) IOMMU -------- */
 
 /*
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
