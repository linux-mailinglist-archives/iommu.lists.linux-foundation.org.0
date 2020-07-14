Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id A263A21E7CC
	for <lists.iommu@lfdr.de>; Tue, 14 Jul 2020 08:02:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 240208936F;
	Tue, 14 Jul 2020 06:02:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wTI_Tv-NLOyg; Tue, 14 Jul 2020 06:01:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BDBFF89371;
	Tue, 14 Jul 2020 06:01:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A8681C0733;
	Tue, 14 Jul 2020 06:01:59 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 118E3C0733
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jul 2020 06:01:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 5CA028A6D7
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jul 2020 06:01:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QCAT48vD+6dP for <iommu@lists.linux-foundation.org>;
 Tue, 14 Jul 2020 06:01:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by hemlock.osuosl.org (Postfix) with ESMTPS id BCEBD8A6D4
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jul 2020 06:01:55 +0000 (UTC)
IronPort-SDR: WnD0RODrvedTpUTPKKuYl1LV4gtmTtm9JxIspsBb8bp+OXKQl9HktWBrRKkLkxGibfmCFjQvo8
 PELsVMdROaOg==
X-IronPort-AV: E=McAfee;i="6000,8403,9681"; a="147947582"
X-IronPort-AV: E=Sophos;i="5.75,350,1589266800"; d="scan'208";a="147947582"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2020 23:01:55 -0700
IronPort-SDR: 4ebZ60DufuEhFPqE4Gkmd+ePddVrhbbdayHPeCH8VuA3vj20rht4UKFYoH48pMqMStwVzf2thc
 Dn5L6WunnSqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,350,1589266800"; d="scan'208";a="324450182"
Received: from allen-box.sh.intel.com ([10.239.159.139])
 by FMSMGA003.fm.intel.com with ESMTP; 13 Jul 2020 23:01:52 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>,
 Alex Williamson <alex.williamson@redhat.com>
Subject: [PATCH v3 2/4] iommu: Add iommu_aux_at(de)tach_group()
Date: Tue, 14 Jul 2020 13:57:01 +0800
Message-Id: <20200714055703.5510-3-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200714055703.5510-1-baolu.lu@linux.intel.com>
References: <20200714055703.5510-1-baolu.lu@linux.intel.com>
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Kevin Tian <kevin.tian@intel.com>, Dave Jiang <dave.jiang@intel.com>,
 Ashok Raj <ashok.raj@intel.com>, kvm@vger.kernel.org,
 Cornelia Huck <cohuck@redhat.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>
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

This adds two new aux-domain APIs for a use case like vfio/mdev where
sub-devices derived from an aux-domain capable device are created and
put in an iommu_group.

/**
 * iommu_aux_attach_group - attach an aux-domain to an iommu_group which
 *                          contains sub-devices (for example mdevs) derived
 *                          from @dev.
 * @domain: an aux-domain;
 * @group:  an iommu_group which contains sub-devices derived from @dev;
 * @dev:    the physical device which supports IOMMU_DEV_FEAT_AUX.
 *
 * Returns 0 on success, or an error value.
 */
int iommu_aux_attach_group(struct iommu_domain *domain,
                           struct iommu_group *group,
                           struct device *dev)

/**
 * iommu_aux_detach_group - detach an aux-domain from an iommu_group
 *
 * @domain: an aux-domain;
 * @group:  an iommu_group which contains sub-devices derived from @dev;
 * @dev:    the physical device which supports IOMMU_DEV_FEAT_AUX.
 *
 * @domain must have been attached to @group via iommu_aux_attach_group().
 */
void iommu_aux_detach_group(struct iommu_domain *domain,
                            struct iommu_group *group,
                            struct device *dev)

It also adds a flag in the iommu_group data structure to identify
an iommu_group with aux-domain attached from those normal ones.

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/iommu/iommu.c | 58 +++++++++++++++++++++++++++++++++++++++++++
 include/linux/iommu.h | 17 +++++++++++++
 2 files changed, 75 insertions(+)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index e1fdd3531d65..cad5a19ebf22 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -45,6 +45,7 @@ struct iommu_group {
 	struct iommu_domain *default_domain;
 	struct iommu_domain *domain;
 	struct list_head entry;
+	unsigned int aux_domain_attached:1;
 };
 
 struct group_device {
@@ -2759,6 +2760,63 @@ int iommu_aux_get_pasid(struct iommu_domain *domain, struct device *dev)
 }
 EXPORT_SYMBOL_GPL(iommu_aux_get_pasid);
 
+/**
+ * iommu_aux_attach_group - attach an aux-domain to an iommu_group which
+ *                          contains sub-devices (for example mdevs) derived
+ *                          from @dev.
+ * @domain: an aux-domain;
+ * @group:  an iommu_group which contains sub-devices derived from @dev;
+ * @dev:    the physical device which supports IOMMU_DEV_FEAT_AUX.
+ *
+ * Returns 0 on success, or an error value.
+ */
+int iommu_aux_attach_group(struct iommu_domain *domain,
+			   struct iommu_group *group, struct device *dev)
+{
+	int ret = -EBUSY;
+
+	mutex_lock(&group->mutex);
+	if (group->domain)
+		goto out_unlock;
+
+	ret = iommu_aux_attach_device(domain, dev);
+	if (!ret) {
+		group->domain = domain;
+		group->aux_domain_attached = true;
+	}
+
+out_unlock:
+	mutex_unlock(&group->mutex);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(iommu_aux_attach_group);
+
+/**
+ * iommu_aux_detach_group - detach an aux-domain from an iommu_group
+ *
+ * @domain: an aux-domain;
+ * @group:  an iommu_group which contains sub-devices derived from @dev;
+ * @dev:    the physical device which supports IOMMU_DEV_FEAT_AUX.
+ *
+ * @domain must have been attached to @group via iommu_aux_attach_group().
+ */
+void iommu_aux_detach_group(struct iommu_domain *domain,
+			    struct iommu_group *group, struct device *dev)
+{
+	mutex_lock(&group->mutex);
+
+	if (WARN_ON(!group->aux_domain_attached || group->domain != domain))
+		goto out_unlock;
+
+	iommu_aux_detach_device(domain, dev);
+	group->aux_domain_attached = false;
+	group->domain = NULL;
+
+out_unlock:
+	mutex_unlock(&group->mutex);
+}
+EXPORT_SYMBOL_GPL(iommu_aux_detach_group);
+
 /**
  * iommu_sva_bind_device() - Bind a process address space to a device
  * @dev: the device
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 5657d4fef9f2..9506551139ab 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -635,6 +635,10 @@ bool iommu_dev_feature_enabled(struct device *dev, enum iommu_dev_features f);
 int iommu_aux_attach_device(struct iommu_domain *domain, struct device *dev);
 void iommu_aux_detach_device(struct iommu_domain *domain, struct device *dev);
 int iommu_aux_get_pasid(struct iommu_domain *domain, struct device *dev);
+int iommu_aux_attach_group(struct iommu_domain *domain,
+			   struct iommu_group *group, struct device *dev);
+void iommu_aux_detach_group(struct iommu_domain *domain,
+			   struct iommu_group *group, struct device *dev);
 
 struct iommu_sva *iommu_sva_bind_device(struct device *dev,
 					struct mm_struct *mm,
@@ -1023,6 +1027,19 @@ iommu_aux_get_pasid(struct iommu_domain *domain, struct device *dev)
 	return -ENODEV;
 }
 
+static inline int
+iommu_aux_attach_group(struct iommu_domain *domain,
+		       struct iommu_group *group, struct device *dev)
+{
+	return -ENODEV;
+}
+
+static inline void
+iommu_aux_detach_group(struct iommu_domain *domain,
+		       struct iommu_group *group, struct device *dev)
+{
+}
+
 static inline struct iommu_sva *
 iommu_sva_bind_device(struct device *dev, struct mm_struct *mm, void *drvdata)
 {
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
