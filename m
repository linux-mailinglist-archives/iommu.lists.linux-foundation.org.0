Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DF218E8A5
	for <lists.iommu@lfdr.de>; Sun, 22 Mar 2020 13:26:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0157F87D57;
	Sun, 22 Mar 2020 12:26:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qmz-lWaoLGNo; Sun, 22 Mar 2020 12:26:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4FE3587D86;
	Sun, 22 Mar 2020 12:26:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3C19CC0177;
	Sun, 22 Mar 2020 12:26:31 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DEB81C1D7E
 for <iommu@lists.linux-foundation.org>; Sun, 22 Mar 2020 12:26:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id DA5C086505
 for <iommu@lists.linux-foundation.org>; Sun, 22 Mar 2020 12:26:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UV7xXj5F1cB1 for <iommu@lists.linux-foundation.org>;
 Sun, 22 Mar 2020 12:26:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 0B9D8865CF
 for <iommu@lists.linux-foundation.org>; Sun, 22 Mar 2020 12:26:25 +0000 (UTC)
IronPort-SDR: fTjzqZSZXLWfbMFwyJnqFB8HDTjlhBZ15XOIyxptOMS01m8awPh4heJzQmoTITcWQ0A8LHkiZb
 pAM0DRrWZgcQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2020 05:26:23 -0700
IronPort-SDR: XVRlIpu/d2DWOsgb+ymfD6NKYbgW+7z52sm8Ou8/b2gOE9wIx/c9xqqTI9gVEdEus1Cwit0U86
 iCybnCM0x0sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,292,1580803200"; d="scan'208";a="239663882"
Received: from jacob-builder.jf.intel.com ([10.7.199.155])
 by orsmga008.jf.intel.com with ESMTP; 22 Mar 2020 05:26:23 -0700
From: "Liu, Yi L" <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	eric.auger@redhat.com
Subject: [PATCH v1 7/8] vfio/type1: Add VFIO_IOMMU_CACHE_INVALIDATE
Date: Sun, 22 Mar 2020 05:32:04 -0700
Message-Id: <1584880325-10561-8-git-send-email-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1584880325-10561-1-git-send-email-yi.l.liu@intel.com>
References: <1584880325-10561-1-git-send-email-yi.l.liu@intel.com>
Cc: jean-philippe@linaro.org, kevin.tian@intel.com, ashok.raj@intel.com,
 kvm@vger.kernel.org, jun.j.tian@intel.com, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, yi.y.sun@intel.com, hao.wu@intel.com
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

From: Liu Yi L <yi.l.liu@linux.intel.com>

For VFIO IOMMUs with the type VFIO_TYPE1_NESTING_IOMMU, guest "owns" the
first-level/stage-1 translation structures, the host IOMMU driver has no
knowledge of first-level/stage-1 structure cache updates unless the guest
invalidation requests are trapped and propagated to the host.

This patch adds a new IOCTL VFIO_IOMMU_CACHE_INVALIDATE to propagate guest
first-level/stage-1 IOMMU cache invalidations to host to ensure IOMMU cache
correctness.

With this patch, vSVA (Virtual Shared Virtual Addressing) can be used safely
as the host IOMMU iotlb correctness are ensured.

Cc: Kevin Tian <kevin.tian@intel.com>
CC: Jacob Pan <jacob.jun.pan@linux.intel.com>
Cc: Alex Williamson <alex.williamson@redhat.com>
Cc: Eric Auger <eric.auger@redhat.com>
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Liu Yi L <yi.l.liu@linux.intel.com>
Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
---
 drivers/vfio/vfio_iommu_type1.c | 49 +++++++++++++++++++++++++++++++++++++++++
 include/uapi/linux/vfio.h       | 22 ++++++++++++++++++
 2 files changed, 71 insertions(+)

diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
index a877747..937ec3f 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -2423,6 +2423,15 @@ static long vfio_iommu_type1_unbind_gpasid(struct vfio_iommu *iommu,
 	return ret;
 }
 
+static int vfio_cache_inv_fn(struct device *dev, void *data)
+{
+	struct domain_capsule *dc = (struct domain_capsule *)data;
+	struct iommu_cache_invalidate_info *cache_inv_info =
+		(struct iommu_cache_invalidate_info *) dc->data;
+
+	return iommu_cache_invalidate(dc->domain, dev, cache_inv_info);
+}
+
 static long vfio_iommu_type1_ioctl(void *iommu_data,
 				   unsigned int cmd, unsigned long arg)
 {
@@ -2629,6 +2638,46 @@ static long vfio_iommu_type1_ioctl(void *iommu_data,
 		}
 		kfree(gbind_data);
 		return ret;
+	} else if (cmd == VFIO_IOMMU_CACHE_INVALIDATE) {
+		struct vfio_iommu_type1_cache_invalidate cache_inv;
+		u32 version;
+		int info_size;
+		void *cache_info;
+		int ret;
+
+		minsz = offsetofend(struct vfio_iommu_type1_cache_invalidate,
+				    flags);
+
+		if (copy_from_user(&cache_inv, (void __user *)arg, minsz))
+			return -EFAULT;
+
+		if (cache_inv.argsz < minsz || cache_inv.flags)
+			return -EINVAL;
+
+		/* Get the version of struct iommu_cache_invalidate_info */
+		if (copy_from_user(&version,
+			(void __user *) (arg + minsz), sizeof(version)))
+			return -EFAULT;
+
+		info_size = iommu_uapi_get_data_size(
+					IOMMU_UAPI_CACHE_INVAL, version);
+
+		cache_info = kzalloc(info_size, GFP_KERNEL);
+		if (!cache_info)
+			return -ENOMEM;
+
+		if (copy_from_user(cache_info,
+			(void __user *) (arg + minsz), info_size)) {
+			kfree(cache_info);
+			return -EFAULT;
+		}
+
+		mutex_lock(&iommu->lock);
+		ret = vfio_iommu_for_each_dev(iommu, vfio_cache_inv_fn,
+					    cache_info);
+		mutex_unlock(&iommu->lock);
+		kfree(cache_info);
+		return ret;
 	}
 
 	return -ENOTTY;
diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
index 2235bc6..62ca791 100644
--- a/include/uapi/linux/vfio.h
+++ b/include/uapi/linux/vfio.h
@@ -899,6 +899,28 @@ struct vfio_iommu_type1_bind {
  */
 #define VFIO_IOMMU_BIND		_IO(VFIO_TYPE, VFIO_BASE + 23)
 
+/**
+ * VFIO_IOMMU_CACHE_INVALIDATE - _IOW(VFIO_TYPE, VFIO_BASE + 24,
+ *			struct vfio_iommu_type1_cache_invalidate)
+ *
+ * Propagate guest IOMMU cache invalidation to the host. The cache
+ * invalidation information is conveyed by @cache_info, the content
+ * format would be structures defined in uapi/linux/iommu.h. User
+ * should be aware of that the struct  iommu_cache_invalidate_info
+ * has a @version field, vfio needs to parse this field before getting
+ * data from userspace.
+ *
+ * Availability of this IOCTL is after VFIO_SET_IOMMU.
+ *
+ * returns: 0 on success, -errno on failure.
+ */
+struct vfio_iommu_type1_cache_invalidate {
+	__u32   argsz;
+	__u32   flags;
+	struct	iommu_cache_invalidate_info cache_info;
+};
+#define VFIO_IOMMU_CACHE_INVALIDATE      _IO(VFIO_TYPE, VFIO_BASE + 24)
+
 /* -------- Additional API for SPAPR TCE (Server POWERPC) IOMMU -------- */
 
 /*
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
