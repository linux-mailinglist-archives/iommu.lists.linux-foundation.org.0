Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7BB216376
	for <lists.iommu@lfdr.de>; Tue,  7 Jul 2020 03:44:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0126E895EA;
	Tue,  7 Jul 2020 01:44:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QXxJIHFDCRyH; Tue,  7 Jul 2020 01:44:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4877F8963F;
	Tue,  7 Jul 2020 01:44:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 18865C016F;
	Tue,  7 Jul 2020 01:44:41 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2B4DFC016F
 for <iommu@lists.linux-foundation.org>; Tue,  7 Jul 2020 01:44:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1B5808960C
 for <iommu@lists.linux-foundation.org>; Tue,  7 Jul 2020 01:44:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KjPNVgE28DK3 for <iommu@lists.linux-foundation.org>;
 Tue,  7 Jul 2020 01:44:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 2578288A5F
 for <iommu@lists.linux-foundation.org>; Tue,  7 Jul 2020 01:44:38 +0000 (UTC)
IronPort-SDR: JDHH3xZtyHAnhsNGg63j43f1CZJ64jnlESMVbFGcjIIpyHi9KXyZS7HfACyU27GZRFcP7T/jn2
 81RY+vjqdYbA==
X-IronPort-AV: E=McAfee;i="6000,8403,9674"; a="149036791"
X-IronPort-AV: E=Sophos;i="5.75,321,1589266800"; d="scan'208";a="149036791"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2020 18:44:37 -0700
IronPort-SDR: r2MissJE+dKEGoM0n2MM/jZq/XvM0p1cLGMyoJVK5k4cwJx0TeWEtoYMFm5KqbGfyPA4zbYqOr
 Z+en8dUeNW8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,321,1589266800"; d="scan'208";a="266688930"
Received: from allen-box.sh.intel.com ([10.239.159.139])
 by fmsmga007.fm.intel.com with ESMTP; 06 Jul 2020 18:44:35 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v2 1/2] iommu: iommu_aux_at(de)tach_device() extension
Date: Tue,  7 Jul 2020 09:39:56 +0800
Message-Id: <20200707013957.23672-2-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200707013957.23672-1-baolu.lu@linux.intel.com>
References: <20200707013957.23672-1-baolu.lu@linux.intel.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Dave Jiang <dave.jiang@intel.com>,
 Ashok Raj <ashok.raj@intel.com>, kvm@vger.kernel.org,
 Cornelia Huck <cohuck@redhat.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org
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

The hardware assistant vfio mediated device is a use case of iommu
aux-domain. The interactions between vfio/mdev and iommu during mdev
creation and passthr are:

- Create a group for mdev with iommu_group_alloc();
- Add the device to the group with
        group = iommu_group_alloc();
        if (IS_ERR(group))
                return PTR_ERR(group);

        ret = iommu_group_add_device(group, &mdev->dev);
        if (!ret)
                dev_info(&mdev->dev, "MDEV: group_id = %d\n",
                         iommu_group_id(group));
- Allocate an aux-domain
        iommu_domain_alloc()
- Attach the aux-domain to the physical device from which the mdev is
  created.
        iommu_aux_attach_device()

In the whole process, an iommu group was allocated for the mdev and an
iommu domain was attached to the group, but the group->domain leaves
NULL. As the result, iommu_get_domain_for_dev() doesn't work anymore.

The iommu_get_domain_for_dev() is a necessary interface for device
drivers that want to support aux-domain. For example,

        struct iommu_domain *domain;
        struct device *dev = mdev_dev(mdev);
        unsigned long pasid;

        domain = iommu_get_domain_for_dev(dev);
        if (!domain)
                return -ENODEV;

        pasid = iommu_aux_get_pasid(domain, dev->parent);
        if (pasid == IOASID_INVALID)
                return -EINVAL;

         /* Program the device context with the PASID value */
         ....

This extends iommu_aux_at(de)tach_device() so that the users could pass
in an optional device pointer (struct device for vfio/mdev for example),
and the necessary check and data link could be done.

Fixes: a3a195929d40b ("iommu: Add APIs for multiple domains per device")
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Alex Williamson <alex.williamson@redhat.com>
Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/iommu/iommu.c           | 86 +++++++++++++++++++++++++++++----
 drivers/vfio/vfio_iommu_type1.c |  5 +-
 include/linux/iommu.h           | 12 +++--
 3 files changed, 87 insertions(+), 16 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 1ed1e14a1f0c..435835058209 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2723,26 +2723,92 @@ EXPORT_SYMBOL_GPL(iommu_dev_feature_enabled);
  * This should make us safe against a device being attached to a guest as a
  * whole while there are still pasid users on it (aux and sva).
  */
-int iommu_aux_attach_device(struct iommu_domain *domain, struct device *dev)
+int iommu_aux_attach_device(struct iommu_domain *domain,
+			    struct device *phys_dev, struct device *dev)
 {
-	int ret = -ENODEV;
+	struct iommu_group *group;
+	int ret;
 
-	if (domain->ops->aux_attach_dev)
-		ret = domain->ops->aux_attach_dev(domain, dev);
+	if (!domain->ops->aux_attach_dev ||
+	    !iommu_dev_feature_enabled(phys_dev, IOMMU_DEV_FEAT_AUX))
+		return -ENODEV;
 
-	if (!ret)
-		trace_attach_device_to_domain(dev);
+	/* Bare use only. */
+	if (!dev) {
+		ret = domain->ops->aux_attach_dev(domain, phys_dev);
+		if (!ret)
+			trace_attach_device_to_domain(phys_dev);
+
+		return ret;
+	}
+
+	/*
+	 * The caller has created a made-up device (for example, vfio/mdev)
+	 * and allocated an iommu_group for user level direct assignment.
+	 * Make sure that the group has only single device and hasn't been
+	 * attached by any other domain.
+	 */
+	group = iommu_group_get(dev);
+	if (!group)
+		return -ENODEV;
+
+	/*
+	 * Lock the group to make sure the device-count doesn't change while
+	 * we are attaching.
+	 */
+	mutex_lock(&group->mutex);
+	ret = -EINVAL;
+	if ((iommu_group_device_count(group) != 1) || group->domain)
+		goto out_unlock;
+
+	ret = -EBUSY;
+	if (group->default_domain && group->domain != group->default_domain)
+		goto out_unlock;
+
+	ret = domain->ops->aux_attach_dev(domain, phys_dev);
+	if (!ret) {
+		trace_attach_device_to_domain(phys_dev);
+		group->domain = domain;
+	}
+
+out_unlock:
+	mutex_unlock(&group->mutex);
+	iommu_group_put(group);
 
 	return ret;
 }
 EXPORT_SYMBOL_GPL(iommu_aux_attach_device);
 
-void iommu_aux_detach_device(struct iommu_domain *domain, struct device *dev)
+void iommu_aux_detach_device(struct iommu_domain *domain,
+			     struct device *phys_dev, struct device *dev)
 {
-	if (domain->ops->aux_detach_dev) {
-		domain->ops->aux_detach_dev(domain, dev);
-		trace_detach_device_from_domain(dev);
+	struct iommu_group *group;
+
+	if (WARN_ON_ONCE(!domain->ops->aux_detach_dev))
+		return;
+
+	if (!dev) {
+		domain->ops->aux_detach_dev(domain, phys_dev);
+		trace_detach_device_from_domain(phys_dev);
+
+		return;
 	}
+
+	group = iommu_group_get(dev);
+	if (!group)
+		return;
+
+	mutex_lock(&group->mutex);
+	if (WARN_ON(iommu_group_device_count(group) != 1))
+		goto out_unlock;
+
+	domain->ops->aux_detach_dev(domain, phys_dev);
+	group->domain = NULL;
+	trace_detach_device_from_domain(phys_dev);
+
+out_unlock:
+	mutex_unlock(&group->mutex);
+	iommu_group_put(group);
 }
 EXPORT_SYMBOL_GPL(iommu_aux_detach_device);
 
diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
index 5e556ac9102a..d3be45dfa58e 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -1635,7 +1635,8 @@ static int vfio_mdev_attach_domain(struct device *dev, void *data)
 	iommu_device = vfio_mdev_get_iommu_device(dev);
 	if (iommu_device) {
 		if (iommu_dev_feature_enabled(iommu_device, IOMMU_DEV_FEAT_AUX))
-			return iommu_aux_attach_device(domain, iommu_device);
+			return iommu_aux_attach_device(domain,
+						       iommu_device, dev);
 		else
 			return iommu_attach_device(domain, iommu_device);
 	}
@@ -1651,7 +1652,7 @@ static int vfio_mdev_detach_domain(struct device *dev, void *data)
 	iommu_device = vfio_mdev_get_iommu_device(dev);
 	if (iommu_device) {
 		if (iommu_dev_feature_enabled(iommu_device, IOMMU_DEV_FEAT_AUX))
-			iommu_aux_detach_device(domain, iommu_device);
+			iommu_aux_detach_device(domain, iommu_device, dev);
 		else
 			iommu_detach_device(domain, iommu_device);
 	}
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 5657d4fef9f2..7da5e67bf7dc 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -632,8 +632,10 @@ bool iommu_dev_has_feature(struct device *dev, enum iommu_dev_features f);
 int iommu_dev_enable_feature(struct device *dev, enum iommu_dev_features f);
 int iommu_dev_disable_feature(struct device *dev, enum iommu_dev_features f);
 bool iommu_dev_feature_enabled(struct device *dev, enum iommu_dev_features f);
-int iommu_aux_attach_device(struct iommu_domain *domain, struct device *dev);
-void iommu_aux_detach_device(struct iommu_domain *domain, struct device *dev);
+int iommu_aux_attach_device(struct iommu_domain *domain,
+			    struct device *phys_dev, struct device *dev);
+void iommu_aux_detach_device(struct iommu_domain *domain,
+			     struct device *phys_dev, struct device *dev);
 int iommu_aux_get_pasid(struct iommu_domain *domain, struct device *dev);
 
 struct iommu_sva *iommu_sva_bind_device(struct device *dev,
@@ -1007,13 +1009,15 @@ iommu_dev_disable_feature(struct device *dev, enum iommu_dev_features feat)
 }
 
 static inline int
-iommu_aux_attach_device(struct iommu_domain *domain, struct device *dev)
+iommu_aux_attach_device(struct iommu_domain *domain,
+			struct device *phys_dev, struct device *dev)
 {
 	return -ENODEV;
 }
 
 static inline void
-iommu_aux_detach_device(struct iommu_domain *domain, struct device *dev)
+iommu_aux_detach_device(struct iommu_domain *domain,
+			struct device *phys_dev, struct device *dev)
 {
 }
 
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
