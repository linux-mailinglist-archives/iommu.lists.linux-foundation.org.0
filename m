Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 96AF826445F
	for <lists.iommu@lfdr.de>; Thu, 10 Sep 2020 12:43:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4F33F8768F;
	Thu, 10 Sep 2020 10:43:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y5cyptEgqEmI; Thu, 10 Sep 2020 10:43:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B758D8768C;
	Thu, 10 Sep 2020 10:43:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A29C3C0051;
	Thu, 10 Sep 2020 10:43:47 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 54F87C0859
 for <iommu@lists.linux-foundation.org>; Thu, 10 Sep 2020 10:43:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 2D6A42E1C1
 for <iommu@lists.linux-foundation.org>; Thu, 10 Sep 2020 10:43:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0-1ldZWSvNGO for <iommu@lists.linux-foundation.org>;
 Thu, 10 Sep 2020 10:43:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by silver.osuosl.org (Postfix) with ESMTPS id A7E382E1B4
 for <iommu@lists.linux-foundation.org>; Thu, 10 Sep 2020 10:43:36 +0000 (UTC)
IronPort-SDR: A9KCT6if/K2nnU4KvvWMXQJGE19+51qBSiP2Daimk+0V+9gVrA+McoejFcXJJD680omr0DN7Hq
 iM8lC2whOqpA==
X-IronPort-AV: E=McAfee;i="6000,8403,9739"; a="138024921"
X-IronPort-AV: E=Sophos;i="5.76,412,1592895600"; d="scan'208";a="138024921"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2020 03:43:35 -0700
IronPort-SDR: FlWst0LPoXcZc8M3/b3UAEgYvTImnFEVWvl/g53iLTTwiyQbXUK+7e1k21ARbg5uAZKkLtqVNS
 kSDHCmWtNI0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,412,1592895600"; d="scan'208";a="334137212"
Received: from jacob-builder.jf.intel.com ([10.7.199.155])
 by orsmga008.jf.intel.com with ESMTP; 10 Sep 2020 03:43:35 -0700
From: Liu Yi L <yi.l.liu@intel.com>
To: alex.williamson@redhat.com, eric.auger@redhat.com,
 baolu.lu@linux.intel.com, joro@8bytes.org
Subject: [PATCH v7 11/16] vfio/type1: Allow invalidating first-level/stage
 IOMMU cache
Date: Thu, 10 Sep 2020 03:45:28 -0700
Message-Id: <1599734733-6431-12-git-send-email-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1599734733-6431-1-git-send-email-yi.l.liu@intel.com>
References: <1599734733-6431-1-git-send-email-yi.l.liu@intel.com>
Cc: jean-philippe@linaro.org, kevin.tian@intel.com, ashok.raj@intel.com,
 kvm@vger.kernel.org, stefanha@gmail.com, jun.j.tian@intel.com,
 iommu@lists.linux-foundation.org, yi.y.sun@intel.com, jasowang@redhat.com,
 hao.wu@intel.com
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

This patch provides an interface allowing the userspace to invalidate
IOMMU cache for first-level page table. It is required when the first
level IOMMU page table is not managed by the host kernel in the nested
translation setup.

Cc: Kevin Tian <kevin.tian@intel.com>
CC: Jacob Pan <jacob.jun.pan@linux.intel.com>
Cc: Alex Williamson <alex.williamson@redhat.com>
Cc: Eric Auger <eric.auger@redhat.com>
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: Joerg Roedel <joro@8bytes.org>
Cc: Lu Baolu <baolu.lu@linux.intel.com>
Signed-off-by: Liu Yi L <yi.l.liu@intel.com>
Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
---
v1 -> v2:
*) rename from "vfio/type1: Flush stage-1 IOMMU cache for nesting type"
*) rename vfio_cache_inv_fn() to vfio_dev_cache_invalidate_fn()
*) vfio_dev_cache_inv_fn() always successful
*) remove VFIO_IOMMU_CACHE_INVALIDATE, and reuse VFIO_IOMMU_NESTING_OP
---
 drivers/vfio/vfio_iommu_type1.c | 38 ++++++++++++++++++++++++++++++++++++++
 include/uapi/linux/vfio.h       |  3 +++
 2 files changed, 41 insertions(+)

diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
index 11f1156..b67ce2d 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -3112,6 +3112,41 @@ static long vfio_iommu_handle_pgtbl_op(struct vfio_iommu *iommu,
 	return ret;
 }
 
+static int vfio_dev_cache_invalidate_fn(struct device *dev, void *data)
+{
+	struct domain_capsule *dc = (struct domain_capsule *)data;
+	unsigned long arg = *(unsigned long *)dc->data;
+
+	iommu_uapi_cache_invalidate(dc->domain, dev, (void __user *)arg);
+	return 0;
+}
+
+static long vfio_iommu_invalidate_cache(struct vfio_iommu *iommu,
+					unsigned long arg)
+{
+	struct domain_capsule dc = { .data = &arg };
+	struct iommu_nesting_info *info;
+	int ret;
+
+	mutex_lock(&iommu->lock);
+	info = iommu->nesting_info;
+	if (!info || !(info->features & IOMMU_NESTING_FEAT_CACHE_INVLD)) {
+		ret = -EOPNOTSUPP;
+		goto out_unlock;
+	}
+
+	ret = vfio_prepare_nesting_domain_capsule(iommu, &dc);
+	if (ret)
+		goto out_unlock;
+
+	iommu_group_for_each_dev(dc.group->iommu_group, &dc,
+				 vfio_dev_cache_invalidate_fn);
+
+out_unlock:
+	mutex_unlock(&iommu->lock);
+	return ret;
+}
+
 static long vfio_iommu_type1_nesting_op(struct vfio_iommu *iommu,
 					unsigned long arg)
 {
@@ -3136,6 +3171,9 @@ static long vfio_iommu_type1_nesting_op(struct vfio_iommu *iommu,
 	case VFIO_IOMMU_NESTING_OP_UNBIND_PGTBL:
 		ret = vfio_iommu_handle_pgtbl_op(iommu, false, arg + minsz);
 		break;
+	case VFIO_IOMMU_NESTING_OP_CACHE_INVLD:
+		ret = vfio_iommu_invalidate_cache(iommu, arg + minsz);
+		break;
 	default:
 		ret = -EINVAL;
 	}
diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
index a99bd71..a09a407 100644
--- a/include/uapi/linux/vfio.h
+++ b/include/uapi/linux/vfio.h
@@ -1233,6 +1233,8 @@ struct vfio_iommu_type1_pasid_request {
  * +-----------------+-----------------------------------------------+
  * | UNBIND_PGTBL    |      struct iommu_gpasid_bind_data            |
  * +-----------------+-----------------------------------------------+
+ * | CACHE_INVLD     |      struct iommu_cache_invalidate_info       |
+ * +-----------------+-----------------------------------------------+
  *
  * returns: 0 on success, -errno on failure.
  */
@@ -1246,6 +1248,7 @@ struct vfio_iommu_type1_nesting_op {
 enum {
 	VFIO_IOMMU_NESTING_OP_BIND_PGTBL,
 	VFIO_IOMMU_NESTING_OP_UNBIND_PGTBL,
+	VFIO_IOMMU_NESTING_OP_CACHE_INVLD,
 	VFIO_IOMMU_NESTING_OP_NUM,
 };
 
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
