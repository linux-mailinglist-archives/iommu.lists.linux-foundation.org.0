Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DE54B3F13
	for <lists.iommu@lfdr.de>; Mon, 14 Feb 2022 02:57:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4DF1F81420;
	Mon, 14 Feb 2022 01:57:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b4vCD_wkeoj4; Mon, 14 Feb 2022 01:57:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 36F098145D;
	Mon, 14 Feb 2022 01:57:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1057AC000B;
	Mon, 14 Feb 2022 01:57:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 01A67C000B
 for <iommu@lists.linux-foundation.org>; Mon, 14 Feb 2022 01:57:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E2DAB40343
 for <iommu@lists.linux-foundation.org>; Mon, 14 Feb 2022 01:57:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=intel.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NKEI8Ew10UCv for <iommu@lists.linux-foundation.org>;
 Mon, 14 Feb 2022 01:57:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 34BD24032C
 for <iommu@lists.linux-foundation.org>; Mon, 14 Feb 2022 01:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644803867; x=1676339867;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PSq/mIL6JZbJ/Ks58W4o4yuQUpHdn2gRwhbH1yixEeE=;
 b=FXPXcG92WAcUQ3hu4H6sQN5P3t4ZwxTJ3otVXSmHFDs+wjf9e/yhy8GJ
 1daVeYhPijROGHLx1N+YR/QcHLdWr5WB72g3TCH3yH2cps2s4bd3m48QZ
 FxIYc2RbcKTzYtmnFVLBxWA2Cb7Zyi+xkz0ETg9YcheqWnKaD2mGeNKH8
 GMFFcV5RFSA2Yw4ZNX639w/r3vgR7avUBtDO6/QllaoizbzN43lUJlHoy
 afpsYCirogAQ9qB8E0yWQgzelHOjE/G/ZtMgkFYu7s13sFSJ2RDN024LM
 mOOUuOWEt3oDxPcFb1BsYr9TMBhvnUpDuUUfNwQVT/UQGJODR33y4PV7O A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10257"; a="249938511"
X-IronPort-AV: E=Sophos;i="5.88,366,1635231600"; d="scan'208";a="249938511"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2022 17:57:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,366,1635231600"; d="scan'208";a="680137263"
Received: from allen-box.sh.intel.com ([10.239.159.118])
 by fmsmga001.fm.intel.com with ESMTP; 13 Feb 2022 17:57:42 -0800
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Christoph Hellwig <hch@infradead.org>, Ben Skeggs <bskeggs@redhat.com>,
 Kevin Tian <kevin.tian@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v3 04/10] iommu: Remove aux-domain related interfaces and
 iommu_ops
Date: Mon, 14 Feb 2022 09:55:32 +0800
Message-Id: <20220214015538.2828933-5-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220214015538.2828933-1-baolu.lu@linux.intel.com>
References: <20220214015538.2828933-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jacob jun Pan <jacob.jun.pan@intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Christoph Hellwig <hch@lst.de>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

The aux-domain related interfaces and iommu_ops are not referenced
anywhere in the tree. We've also reached a consensus to redesign it
based the new iommufd framework. Remove them to avoid dead code.

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
---
 include/linux/iommu.h | 29 ---------------------------
 drivers/iommu/iommu.c | 46 -------------------------------------------
 2 files changed, 75 deletions(-)

diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index cde1d0aad60f..9983a01373b2 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -144,7 +144,6 @@ struct iommu_resv_region {
 
 /**
  * enum iommu_dev_features - Per device IOMMU features
- * @IOMMU_DEV_FEAT_AUX: Auxiliary domain feature
  * @IOMMU_DEV_FEAT_SVA: Shared Virtual Addresses
  * @IOMMU_DEV_FEAT_IOPF: I/O Page Faults such as PRI or Stall. Generally
  *			 enabling %IOMMU_DEV_FEAT_SVA requires
@@ -157,7 +156,6 @@ struct iommu_resv_region {
  * iommu_dev_has_feature(), and enable it using iommu_dev_enable_feature().
  */
 enum iommu_dev_features {
-	IOMMU_DEV_FEAT_AUX,
 	IOMMU_DEV_FEAT_SVA,
 	IOMMU_DEV_FEAT_IOPF,
 };
@@ -223,8 +221,6 @@ struct iommu_iotlb_gather {
  * @dev_has/enable/disable_feat: per device entries to check/enable/disable
  *                               iommu specific features.
  * @dev_feat_enabled: check enabled feature
- * @aux_attach/detach_dev: aux-domain specific attach/detach entries.
- * @aux_get_pasid: get the pasid given an aux-domain
  * @sva_bind: Bind process address space to device
  * @sva_unbind: Unbind process address space from device
  * @sva_get_pasid: Get PASID associated to a SVA handle
@@ -285,11 +281,6 @@ struct iommu_ops {
 	int (*dev_enable_feat)(struct device *dev, enum iommu_dev_features f);
 	int (*dev_disable_feat)(struct device *dev, enum iommu_dev_features f);
 
-	/* Aux-domain specific attach/detach entries */
-	int (*aux_attach_dev)(struct iommu_domain *domain, struct device *dev);
-	void (*aux_detach_dev)(struct iommu_domain *domain, struct device *dev);
-	int (*aux_get_pasid)(struct iommu_domain *domain, struct device *dev);
-
 	struct iommu_sva *(*sva_bind)(struct device *dev, struct mm_struct *mm,
 				      void *drvdata);
 	void (*sva_unbind)(struct iommu_sva *handle);
@@ -655,9 +646,6 @@ void iommu_release_device(struct device *dev);
 int iommu_dev_enable_feature(struct device *dev, enum iommu_dev_features f);
 int iommu_dev_disable_feature(struct device *dev, enum iommu_dev_features f);
 bool iommu_dev_feature_enabled(struct device *dev, enum iommu_dev_features f);
-int iommu_aux_attach_device(struct iommu_domain *domain, struct device *dev);
-void iommu_aux_detach_device(struct iommu_domain *domain, struct device *dev);
-int iommu_aux_get_pasid(struct iommu_domain *domain, struct device *dev);
 
 struct iommu_sva *iommu_sva_bind_device(struct device *dev,
 					struct mm_struct *mm,
@@ -1002,23 +990,6 @@ iommu_dev_disable_feature(struct device *dev, enum iommu_dev_features feat)
 	return -ENODEV;
 }
 
-static inline int
-iommu_aux_attach_device(struct iommu_domain *domain, struct device *dev)
-{
-	return -ENODEV;
-}
-
-static inline void
-iommu_aux_detach_device(struct iommu_domain *domain, struct device *dev)
-{
-}
-
-static inline int
-iommu_aux_get_pasid(struct iommu_domain *domain, struct device *dev)
-{
-	return -ENODEV;
-}
-
 static inline struct iommu_sva *
 iommu_sva_bind_device(struct device *dev, struct mm_struct *mm, void *drvdata)
 {
diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 3cbf4781e5bd..0ebaf561a70e 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2749,8 +2749,6 @@ EXPORT_SYMBOL_GPL(iommu_dev_enable_feature);
 
 /*
  * The device drivers should do the necessary cleanups before calling this.
- * For example, before disabling the aux-domain feature, the device driver
- * should detach all aux-domains. Otherwise, this will return -EBUSY.
  */
 int iommu_dev_disable_feature(struct device *dev, enum iommu_dev_features feat)
 {
@@ -2778,50 +2776,6 @@ bool iommu_dev_feature_enabled(struct device *dev, enum iommu_dev_features feat)
 }
 EXPORT_SYMBOL_GPL(iommu_dev_feature_enabled);
 
-/*
- * Aux-domain specific attach/detach.
- *
- * Only works if iommu_dev_feature_enabled(dev, IOMMU_DEV_FEAT_AUX) returns
- * true. Also, as long as domains are attached to a device through this
- * interface, any tries to call iommu_attach_device() should fail
- * (iommu_detach_device() can't fail, so we fail when trying to re-attach).
- * This should make us safe against a device being attached to a guest as a
- * whole while there are still pasid users on it (aux and sva).
- */
-int iommu_aux_attach_device(struct iommu_domain *domain, struct device *dev)
-{
-	int ret = -ENODEV;
-
-	if (domain->ops->aux_attach_dev)
-		ret = domain->ops->aux_attach_dev(domain, dev);
-
-	if (!ret)
-		trace_attach_device_to_domain(dev);
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(iommu_aux_attach_device);
-
-void iommu_aux_detach_device(struct iommu_domain *domain, struct device *dev)
-{
-	if (domain->ops->aux_detach_dev) {
-		domain->ops->aux_detach_dev(domain, dev);
-		trace_detach_device_from_domain(dev);
-	}
-}
-EXPORT_SYMBOL_GPL(iommu_aux_detach_device);
-
-int iommu_aux_get_pasid(struct iommu_domain *domain, struct device *dev)
-{
-	int ret = -ENODEV;
-
-	if (domain->ops->aux_get_pasid)
-		ret = domain->ops->aux_get_pasid(domain, dev);
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(iommu_aux_get_pasid);
-
 /**
  * iommu_sva_bind_device() - Bind a process address space to a device
  * @dev: the device
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
