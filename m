Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E0425864E
	for <lists.iommu@lfdr.de>; Tue,  1 Sep 2020 05:40:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 5F99022DEC;
	Tue,  1 Sep 2020 03:40:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n5S77ZcxHe0R; Tue,  1 Sep 2020 03:40:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id E9E55204DA;
	Tue,  1 Sep 2020 03:40:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C5E40C0052;
	Tue,  1 Sep 2020 03:40:20 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C9270C0052
 for <iommu@lists.linux-foundation.org>; Tue,  1 Sep 2020 03:40:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B97AC86FBB
 for <iommu@lists.linux-foundation.org>; Tue,  1 Sep 2020 03:40:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3gj7DOTQvy57 for <iommu@lists.linux-foundation.org>;
 Tue,  1 Sep 2020 03:40:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 139848700B
 for <iommu@lists.linux-foundation.org>; Tue,  1 Sep 2020 03:40:19 +0000 (UTC)
IronPort-SDR: yQTaiZqbg0hQ9SsmsbsZjMCMDD0gaxZYPVSxeRLyXVAyUbU9esudIe88pC/8sZpLFqbMYLR5Nn
 sxkl3j8K/Vjg==
X-IronPort-AV: E=McAfee;i="6000,8403,9730"; a="144843776"
X-IronPort-AV: E=Sophos;i="5.76,377,1592895600"; d="scan'208";a="144843776"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2020 20:40:18 -0700
IronPort-SDR: Uny4FzJVSCQSqgN74qadmFaEVq0jXOHDJs5Rw8/0OyW8mPY7F0J5iFfI4/WGMAUCuxwk0CA2ju
 mt5Y1hThFPPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,377,1592895600"; d="scan'208";a="325180890"
Received: from allen-box.sh.intel.com ([10.239.159.139])
 by fmsmga004.fm.intel.com with ESMTP; 31 Aug 2020 20:40:15 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>,
 Alex Williamson <alex.williamson@redhat.com>
Subject: [PATCH v4 3/5] iommu: Add iommu_aux_get_domain_for_dev()
Date: Tue,  1 Sep 2020 11:34:20 +0800
Message-Id: <20200901033422.22249-4-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200901033422.22249-1-baolu.lu@linux.intel.com>
References: <20200901033422.22249-1-baolu.lu@linux.intel.com>
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

The device driver needs an API to get its aux-domain. A typical usage
scenario is:

        unsigned long pasid;
        struct iommu_domain *domain;
        struct device *dev = mdev_dev(mdev);
        struct device *iommu_device = vfio_mdev_get_iommu_device(dev);

        domain = iommu_aux_get_domain_for_dev(dev);
        if (!domain)
                return -ENODEV;

        pasid = iommu_aux_get_pasid(domain, iommu_device);
        if (pasid <= 0)
                return -EINVAL;

         /* Program the device context */
         ....

This adds an API for such use case.

Suggested-by: Alex Williamson <alex.williamson@redhat.com>
Link: https://lore.kernel.org/linux-iommu/20200708130749.1b1e1421@x1.home/
Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/iommu/iommu.c | 18 ++++++++++++++++++
 include/linux/iommu.h | 20 ++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index fb21c2ff4861..8fd93a5b8764 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2893,6 +2893,24 @@ void iommu_detach_subdev_group(struct iommu_domain *domain,
 }
 EXPORT_SYMBOL_GPL(iommu_detach_subdev_group);
 
+struct iommu_domain *iommu_aux_get_domain_for_dev(struct device *subdev)
+{
+	struct iommu_domain *domain = NULL;
+	struct iommu_group *group;
+
+	group = iommu_group_get(subdev);
+	if (!group || !group->domain)
+		return NULL;
+
+	if (domain_is_aux(group->domain, subdev))
+		domain = group->domain;
+
+	iommu_group_put(group);
+
+	return domain;
+}
+EXPORT_SYMBOL_GPL(iommu_aux_get_domain_for_dev);
+
 /**
  * iommu_sva_bind_device() - Bind a process address space to a device
  * @dev: the device
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index b9df8b510d4f..ea660a887dbf 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -120,6 +120,7 @@ enum iommu_attr {
 	DOMAIN_ATTR_NESTING,	/* two stages of translation */
 	DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE,
 	DOMAIN_ATTR_MAX,
+	DOMAIN_ATTR_IS_AUX,
 };
 
 /* These are the possible reserved region types */
@@ -622,6 +623,12 @@ static inline void dev_iommu_priv_set(struct device *dev, void *priv)
 	dev->iommu->priv = priv;
 }
 
+static inline bool
+domain_is_aux(struct iommu_domain *domain, struct device *subdev)
+{
+	return iommu_domain_get_attr(domain, DOMAIN_ATTR_IS_AUX, subdev);
+}
+
 int iommu_probe_device(struct device *dev);
 void iommu_release_device(struct device *dev);
 
@@ -638,6 +645,7 @@ int iommu_attach_subdev_group(struct iommu_domain *domain,
 void iommu_detach_subdev_group(struct iommu_domain *domain,
 			       struct iommu_group *group,
 			       iommu_device_lookup_t fn);
+struct iommu_domain *iommu_aux_get_domain_for_dev(struct device *subdev);
 
 struct iommu_sva *iommu_sva_bind_device(struct device *dev,
 					struct mm_struct *mm,
@@ -1039,6 +1047,18 @@ iommu_detach_subdev_group(struct iommu_domain *domain, struct iommu_group *group
 {
 }
 
+static inline bool
+domain_is_aux(struct iommu_domain *domain, struct device *subdev)
+{
+	return false;
+}
+
+static inline struct iommu_domain *
+iommu_aux_get_domain_for_dev(struct device *subdev)
+{
+	return NULL;
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
