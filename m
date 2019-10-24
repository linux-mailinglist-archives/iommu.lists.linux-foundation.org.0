Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B67E3317
	for <lists.iommu@lfdr.de>; Thu, 24 Oct 2019 14:53:04 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id CBD92154D;
	Thu, 24 Oct 2019 12:52:58 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 8E0A81539
	for <iommu@lists.linux-foundation.org>;
	Thu, 24 Oct 2019 12:52:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 00E00831
	for <iommu@lists.linux-foundation.org>;
	Thu, 24 Oct 2019 12:52:56 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Oct 2019 05:52:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,224,1569308400"; d="scan'208";a="201464809"
Received: from iov.bj.intel.com ([10.238.145.67])
	by orsmga003.jf.intel.com with ESMTP; 24 Oct 2019 05:52:53 -0700
From: Liu Yi L <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	eric.auger@redhat.com
Subject: [RFC v2 2/3] vfio/type1: VFIO_IOMMU_PASID_REQUEST(alloc/free)
Date: Thu, 24 Oct 2019 08:26:22 -0400
Message-Id: <1571919983-3231-3-git-send-email-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1571919983-3231-1-git-send-email-yi.l.liu@intel.com>
References: <1571919983-3231-1-git-send-email-yi.l.liu@intel.com>
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kevin.tian@intel.com, ashok.raj@intel.com, kvm@vger.kernel.org,
	jean-philippe.brucker@arm.com, jun.j.tian@intel.com,
	iommu@lists.linux-foundation.org, yi.y.sun@intel.com
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

This patch adds VFIO_IOMMU_PASID_REQUEST ioctl which aims
to passdown PASID allocation/free request from the virtual
iommu. This is required to get PASID managed in system-wide.

Cc: Kevin Tian <kevin.tian@intel.com>
Signed-off-by: Liu Yi L <yi.l.liu@intel.com>
Signed-off-by: Yi Sun <yi.y.sun@linux.intel.com>
Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
---
 drivers/vfio/vfio_iommu_type1.c | 114 ++++++++++++++++++++++++++++++++++++++++
 include/uapi/linux/vfio.h       |  25 +++++++++
 2 files changed, 139 insertions(+)

diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
index cd8d3a5..3d73a7d 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -2248,6 +2248,83 @@ static int vfio_cache_inv_fn(struct device *dev, void *data)
 	return iommu_cache_invalidate(dc->domain, dev, &ustruct->info);
 }
 
+static int vfio_iommu_type1_pasid_alloc(struct vfio_iommu *iommu,
+					 int min_pasid,
+					 int max_pasid)
+{
+	int ret;
+	ioasid_t pasid;
+	struct mm_struct *mm = NULL;
+
+	mutex_lock(&iommu->lock);
+	if (!IS_IOMMU_CAP_DOMAIN_IN_CONTAINER(iommu)) {
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+	mm = get_task_mm(current);
+	/* Track ioasid allocation owner by mm */
+	pasid = ioasid_alloc((struct ioasid_set *)mm, min_pasid,
+				max_pasid, NULL);
+	if (pasid == INVALID_IOASID) {
+		ret = -ENOSPC;
+		goto out_unlock;
+	}
+	ret = pasid;
+out_unlock:
+	mutex_unlock(&iommu->lock);
+	if (mm)
+		mmput(mm);
+	return ret;
+}
+
+static int vfio_iommu_type1_pasid_free(struct vfio_iommu *iommu,
+				       unsigned int pasid)
+{
+	struct mm_struct *mm = NULL;
+	void *pdata;
+	int ret = 0;
+
+	mutex_lock(&iommu->lock);
+	if (!IS_IOMMU_CAP_DOMAIN_IN_CONTAINER(iommu)) {
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+
+	/**
+	 * REVISIT:
+	 * There are two cases free could fail:
+	 * 1. free pasid by non-owner, we use ioasid_set to track mm, if
+	 * the set does not match, caller is not permitted to free.
+	 * 2. free before unbind all devices, we can check if ioasid private
+	 * data, if data != NULL, then fail to free.
+	 */
+	mm = get_task_mm(current);
+	pdata = ioasid_find((struct ioasid_set *)mm, pasid, NULL);
+	if (IS_ERR(pdata)) {
+		if (pdata == ERR_PTR(-ENOENT))
+			pr_err("PASID %u is not allocated\n", pasid);
+		else if (pdata == ERR_PTR(-EACCES))
+			pr_err("Free PASID %u by non-owner, denied", pasid);
+		else
+			pr_err("Error searching PASID %u\n", pasid);
+		ret = -EPERM;
+		goto out_unlock;
+	}
+	if (pdata) {
+		pr_debug("Cannot free pasid %d with private data\n", pasid);
+		/* Expect PASID has no private data if not bond */
+		ret = -EBUSY;
+		goto out_unlock;
+	}
+	ioasid_free(pasid);
+
+out_unlock:
+	if (mm)
+		mmput(mm);
+	mutex_unlock(&iommu->lock);
+	return ret;
+}
+
 static long vfio_iommu_type1_ioctl(void *iommu_data,
 				   unsigned int cmd, unsigned long arg)
 {
@@ -2370,6 +2447,43 @@ static long vfio_iommu_type1_ioctl(void *iommu_data,
 					    &ustruct);
 		mutex_unlock(&iommu->lock);
 		return ret;
+
+	} else if (cmd == VFIO_IOMMU_PASID_REQUEST) {
+		struct vfio_iommu_type1_pasid_request req;
+		int min_pasid, max_pasid, pasid;
+
+		minsz = offsetofend(struct vfio_iommu_type1_pasid_request,
+				    flag);
+
+		if (copy_from_user(&req, (void __user *)arg, minsz))
+			return -EFAULT;
+
+		if (req.argsz < minsz)
+			return -EINVAL;
+
+		switch (req.flag) {
+		/**
+		 * TODO: min_pasid and max_pasid align with
+		 * typedef unsigned int ioasid_t
+		 */
+		case VFIO_IOMMU_PASID_ALLOC:
+			if (copy_from_user(&min_pasid,
+				(void __user *)arg + minsz, sizeof(min_pasid)))
+				return -EFAULT;
+			if (copy_from_user(&max_pasid,
+				(void __user *)arg + minsz + sizeof(min_pasid),
+				sizeof(max_pasid)))
+				return -EFAULT;
+			return vfio_iommu_type1_pasid_alloc(iommu,
+						min_pasid, max_pasid);
+		case VFIO_IOMMU_PASID_FREE:
+			if (copy_from_user(&pasid,
+				(void __user *)arg + minsz, sizeof(pasid)))
+				return -EFAULT;
+			return vfio_iommu_type1_pasid_free(iommu, pasid);
+		default:
+			return -EINVAL;
+		}
 	}
 
 	return -ENOTTY;
diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
index ccf60a2..04de290 100644
--- a/include/uapi/linux/vfio.h
+++ b/include/uapi/linux/vfio.h
@@ -807,6 +807,31 @@ struct vfio_iommu_type1_cache_invalidate {
 };
 #define VFIO_IOMMU_CACHE_INVALIDATE      _IO(VFIO_TYPE, VFIO_BASE + 24)
 
+/*
+ * @flag=VFIO_IOMMU_PASID_ALLOC, refer to the @min_pasid and @max_pasid fields
+ * @flag=VFIO_IOMMU_PASID_FREE, refer to @pasid field
+ */
+struct vfio_iommu_type1_pasid_request {
+	__u32	argsz;
+#define VFIO_IOMMU_PASID_ALLOC	(1 << 0)
+#define VFIO_IOMMU_PASID_FREE	(1 << 1)
+	__u32	flag;
+	union {
+		struct {
+			int min_pasid;
+			int max_pasid;
+		};
+		int pasid;
+	};
+};
+
+/**
+ * VFIO_IOMMU_PASID_REQUEST - _IOWR(VFIO_TYPE, VFIO_BASE + 27,
+ *				struct vfio_iommu_type1_pasid_request)
+ *
+ */
+#define VFIO_IOMMU_PASID_REQUEST	_IO(VFIO_TYPE, VFIO_BASE + 27)
+
 /* -------- Additional API for SPAPR TCE (Server POWERPC) IOMMU -------- */
 
 /*
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
