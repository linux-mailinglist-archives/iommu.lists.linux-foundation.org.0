Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D3A206F3D
	for <lists.iommu@lfdr.de>; Wed, 24 Jun 2020 10:49:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7A25989370;
	Wed, 24 Jun 2020 08:49:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sz5GjGucdP4D; Wed, 24 Jun 2020 08:49:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id F421B8887C;
	Wed, 24 Jun 2020 08:49:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C1BB5C0894;
	Wed, 24 Jun 2020 08:49:00 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 29CDCC0888
 for <iommu@lists.linux-foundation.org>; Wed, 24 Jun 2020 08:48:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 274098719A
 for <iommu@lists.linux-foundation.org>; Wed, 24 Jun 2020 08:48:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4BZWLq7XwAFZ for <iommu@lists.linux-foundation.org>;
 Wed, 24 Jun 2020 08:48:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 578EE87215
 for <iommu@lists.linux-foundation.org>; Wed, 24 Jun 2020 08:48:58 +0000 (UTC)
IronPort-SDR: JX7M4YbnrSLid6ZSQBTtSa+X1DyFDN1xIFVsSjnDFDj+KqZdBkcqntKQ0PyvD8Qs1mjEUxLhXl
 eoZ03RfresAg==
X-IronPort-AV: E=McAfee;i="6000,8403,9661"; a="131815142"
X-IronPort-AV: E=Sophos;i="5.75,274,1589266800"; d="scan'208";a="131815142"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2020 01:48:57 -0700
IronPort-SDR: E8W7F/cBC6NIiYaEoaRkxgCm4w8jP534zpS6pw/OoG9br0vMDHC6/kHM31ekJnejcyYl6iFFhI
 KhTZWk7uBceA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,274,1589266800"; d="scan'208";a="275624521"
Received: from jacob-builder.jf.intel.com ([10.7.199.155])
 by orsmga003.jf.intel.com with ESMTP; 24 Jun 2020 01:48:56 -0700
From: Liu Yi L <yi.l.liu@intel.com>
To: alex.williamson@redhat.com, eric.auger@redhat.com,
 baolu.lu@linux.intel.com, joro@8bytes.org
Subject: [PATCH v3 10/14] vfio/type1: Allow invalidating first-level/stage
 IOMMU cache
Date: Wed, 24 Jun 2020 01:55:23 -0700
Message-Id: <1592988927-48009-11-git-send-email-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1592988927-48009-1-git-send-email-yi.l.liu@intel.com>
References: <1592988927-48009-1-git-send-email-yi.l.liu@intel.com>
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
 drivers/vfio/vfio_iommu_type1.c | 52 +++++++++++++++++++++++++++++++++++++++++
 include/uapi/linux/vfio.h       |  3 +++
 2 files changed, 55 insertions(+)

diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
index 5926533..4c21300 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -3080,6 +3080,53 @@ static long vfio_iommu_handle_pgtbl_op(struct vfio_iommu *iommu,
 	return ret;
 }
 
+static int vfio_dev_cache_invalidate_fn(struct device *dev, void *data)
+{
+	struct domain_capsule *dc = (struct domain_capsule *)data;
+	unsigned long arg = *(unsigned long *) dc->data;
+
+	iommu_cache_invalidate(dc->domain, dev, (void __user *) arg);
+	return 0;
+}
+
+static long vfio_iommu_invalidate_cache(struct vfio_iommu *iommu,
+					unsigned long arg)
+{
+	struct domain_capsule dc = { .data = &arg };
+	struct vfio_group *group;
+	struct vfio_domain *domain;
+	int ret = 0;
+	struct iommu_nesting_info *info;
+
+	mutex_lock(&iommu->lock);
+	/*
+	 * Cache invalidation is required for any nesting IOMMU,
+	 * so no need to check system-wide PASID support.
+	 */
+	info = iommu->nesting_info;
+	if (!info || !(info->features & IOMMU_NESTING_FEAT_CACHE_INVLD)) {
+		ret = -ENOTSUPP;
+		goto out_unlock;
+	}
+
+	group = vfio_find_nesting_group(iommu);
+	if (!group) {
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+
+	domain = list_first_entry(&iommu->domain_list,
+				      struct vfio_domain, next);
+	dc.group = group;
+	dc.domain = domain->domain;
+	iommu_group_for_each_dev(group->iommu_group, &dc,
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
@@ -3102,6 +3149,11 @@ static long vfio_iommu_type1_nesting_op(struct vfio_iommu *iommu,
 	case VFIO_IOMMU_NESTING_OP_UNBIND_PGTBL:
 		ret = vfio_iommu_handle_pgtbl_op(iommu, false, arg + minsz);
 		break;
+	case VFIO_IOMMU_NESTING_OP_CACHE_INVLD:
+	{
+		ret = vfio_iommu_invalidate_cache(iommu, arg + minsz);
+		break;
+	}
 	default:
 		ret = -EINVAL;
 	}
diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
index 2c9def8..7f8678e 100644
--- a/include/uapi/linux/vfio.h
+++ b/include/uapi/linux/vfio.h
@@ -1213,6 +1213,8 @@ struct vfio_iommu_type1_pasid_request {
  * +-----------------+-----------------------------------------------+
  * | UNBIND_PGTBL    |      struct iommu_gpasid_bind_data            |
  * +-----------------+-----------------------------------------------+
+ * | CACHE_INVLD     |      struct iommu_cache_invalidate_info       |
+ * +-----------------+-----------------------------------------------+
  *
  * returns: 0 on success, -errno on failure.
  */
@@ -1225,6 +1227,7 @@ struct vfio_iommu_type1_nesting_op {
 
 #define VFIO_IOMMU_NESTING_OP_BIND_PGTBL	(0)
 #define VFIO_IOMMU_NESTING_OP_UNBIND_PGTBL	(1)
+#define VFIO_IOMMU_NESTING_OP_CACHE_INVLD	(2)
 
 #define VFIO_IOMMU_NESTING_OP		_IO(VFIO_TYPE, VFIO_BASE + 19)
 
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
