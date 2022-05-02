Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 71BB7516936
	for <lists.iommu@lfdr.de>; Mon,  2 May 2022 03:52:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EBFBC81DAB;
	Mon,  2 May 2022 01:52:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VS32lCZCurj6; Mon,  2 May 2022 01:52:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id AA0C5825BF;
	Mon,  2 May 2022 01:52:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 92F14C0081;
	Mon,  2 May 2022 01:52:19 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 68D08C002D
 for <iommu@lists.linux-foundation.org>; Mon,  2 May 2022 01:52:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 48B05408E6
 for <iommu@lists.linux-foundation.org>; Mon,  2 May 2022 01:52:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=intel.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SFfS-J_YsqoW for <iommu@lists.linux-foundation.org>;
 Mon,  2 May 2022 01:52:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D9BF3408EB
 for <iommu@lists.linux-foundation.org>; Mon,  2 May 2022 01:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651456336; x=1682992336;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lkANiqxwg+NKnt9wAD26mwUc2KXK0TgdKn2hUx8ny9E=;
 b=lUr/fHrOFXjKd6CKRBL08ij7Tw9KjEPby1LOoEw6GPCrd2K5O7e9MNEc
 5o5yFJmAxnXyeHhNh8EYD3RZk/L/C/ZcQ/jKS6A4Ul7BL0WjuqPqN2Kpa
 ewGN4Pwz5W7bkm4t5wAmPXMKuAjbGupOeXjup0VGRGmt9S/bdOOBh53zy
 gQH2RamSdP1pgIlv3Tkz5DQPsWDYMMywymSPM/iQCVWGq8icFcIgbto2J
 Z5NoiwTYrqn7kNai6PAoNbrwIYuRLv0hbJmDiob9krfSAozLfoR252f2N
 6vY0ki2Efwoy89QffORNXBxUJj6zYZYDHIEZtgff0BzbZKcAcd7kWinXN g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10334"; a="254535341"
X-IronPort-AV: E=Sophos;i="5.91,190,1647327600"; d="scan'208";a="254535341"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2022 18:52:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,190,1647327600"; d="scan'208";a="707406507"
Received: from allen-box.sh.intel.com ([10.239.159.48])
 by fmsmga001.fm.intel.com with ESMTP; 01 May 2022 18:52:12 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Christoph Hellwig <hch@infradead.org>, Kevin Tian <kevin.tian@intel.com>,
 Ashok Raj <ashok.raj@intel.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>,
 Dave Jiang <dave.jiang@intel.com>, Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v5 08/12] iommu/sva: Use attach/detach_pasid_dev in SVA
 interfaces
Date: Mon,  2 May 2022 09:48:38 +0800
Message-Id: <20220502014842.991097-9-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220502014842.991097-1-baolu.lu@linux.intel.com>
References: <20220502014842.991097-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Jacob jun Pan <jacob.jun.pan@intel.com>
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

The existing iommu SVA interfaces are implemented by calling the SVA
specific iommu ops provided by the IOMMU drivers. There's no need for
any SVA specific ops in iommu_ops vector anymore as we can achieve
this through the generic attach/detach_dev_pasid domain ops.

This refactors the IOMMU SVA interfaces implementation by using the
attach/detach_pasid_dev ops and align them with the concept of the
iommu domain. Put the new SVA code in the sva related file in order
to make it self-contained.

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 include/linux/iommu.h         |  44 ++++----
 drivers/iommu/iommu-sva-lib.c | 194 ++++++++++++++++++++++++++++++++++
 drivers/iommu/iommu.c         |  92 ----------------
 3 files changed, 217 insertions(+), 113 deletions(-)

diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index f582f434c513..c5a16b47cae8 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -683,12 +683,6 @@ int iommu_dev_enable_feature(struct device *dev, enum iommu_dev_features f);
 int iommu_dev_disable_feature(struct device *dev, enum iommu_dev_features f);
 bool iommu_dev_feature_enabled(struct device *dev, enum iommu_dev_features f);
 
-struct iommu_sva *iommu_sva_bind_device(struct device *dev,
-					struct mm_struct *mm,
-					void *drvdata);
-void iommu_sva_unbind_device(struct iommu_sva *handle);
-u32 iommu_sva_get_pasid(struct iommu_sva *handle);
-
 int iommu_device_use_default_domain(struct device *dev);
 void iommu_device_unuse_default_domain(struct device *dev);
 
@@ -1030,21 +1024,6 @@ iommu_dev_disable_feature(struct device *dev, enum iommu_dev_features feat)
 	return -ENODEV;
 }
 
-static inline struct iommu_sva *
-iommu_sva_bind_device(struct device *dev, struct mm_struct *mm, void *drvdata)
-{
-	return NULL;
-}
-
-static inline void iommu_sva_unbind_device(struct iommu_sva *handle)
-{
-}
-
-static inline u32 iommu_sva_get_pasid(struct iommu_sva *handle)
-{
-	return IOMMU_PASID_INVALID;
-}
-
 static inline struct iommu_fwspec *dev_iommu_fwspec_get(struct device *dev)
 {
 	return NULL;
@@ -1086,6 +1065,29 @@ static inline void iommu_detach_device_pasid(struct iommu_domain *domain,
 }
 #endif /* CONFIG_IOMMU_API */
 
+#ifdef CONFIG_IOMMU_SVA
+struct iommu_sva *iommu_sva_bind_device(struct device *dev,
+					struct mm_struct *mm,
+					void *drvdata);
+void iommu_sva_unbind_device(struct iommu_sva *handle);
+u32 iommu_sva_get_pasid(struct iommu_sva *handle);
+#else /* CONFIG_IOMMU_SVA */
+static inline struct iommu_sva *
+iommu_sva_bind_device(struct device *dev, struct mm_struct *mm, void *drvdata)
+{
+	return NULL;
+}
+
+static inline void iommu_sva_unbind_device(struct iommu_sva *handle)
+{
+}
+
+static inline u32 iommu_sva_get_pasid(struct iommu_sva *handle)
+{
+	return IOMMU_PASID_INVALID;
+}
+#endif /* CONFIG_IOMMU_SVA */
+
 /**
  * iommu_map_sgtable - Map the given buffer to the IOMMU domain
  * @domain:	The IOMMU domain to perform the mapping
diff --git a/drivers/iommu/iommu-sva-lib.c b/drivers/iommu/iommu-sva-lib.c
index d524a402be3b..0524659a4c0c 100644
--- a/drivers/iommu/iommu-sva-lib.c
+++ b/drivers/iommu/iommu-sva-lib.c
@@ -11,6 +11,7 @@
 
 static DEFINE_MUTEX(iommu_sva_lock);
 static DECLARE_IOASID_SET(iommu_sva_pasid);
+static DEFINE_XARRAY_ALLOC(iommu_sva_ioas_array);
 
 struct iommu_sva_ioas {
 	struct mm_struct *mm;
@@ -87,3 +88,196 @@ struct mm_struct *iommu_sva_find(ioasid_t pasid)
 	return ioasid_find(&iommu_sva_pasid, pasid, __mmget_not_zero);
 }
 EXPORT_SYMBOL_GPL(iommu_sva_find);
+
+/*
+ * Get or put an ioas for a shared memory.
+ */
+static struct iommu_sva_ioas *iommu_sva_ioas_get(struct mm_struct *mm,
+						 ioasid_t pasid)
+{
+	struct iommu_sva_ioas *ioas;
+	int ret;
+
+	ioas = xa_load(&iommu_sva_ioas_array, pasid);
+	if (ioas) {
+		if (WARN_ON(ioas->mm != mm))
+			return ERR_PTR(-EINVAL);
+		refcount_inc(&ioas->users);
+		return ioas;
+	}
+
+	ioas = kzalloc(sizeof(*ioas), GFP_KERNEL);
+	if (!ioas)
+		return ERR_PTR(-ENOMEM);
+
+	ioas->mm = mm;
+	ioas->pasid = pasid;
+	refcount_set(&ioas->users, 1);
+	INIT_LIST_HEAD(&ioas->bonds);
+	ret = xa_err(xa_store(&iommu_sva_ioas_array, pasid, ioas, GFP_KERNEL));
+	if (ret) {
+		kfree(ioas);
+		return ERR_PTR(ret);
+	}
+
+	mmgrab(mm);
+
+	return ioas;
+}
+
+static void iommu_sva_ioas_put(struct iommu_sva_ioas *ioas)
+{
+	if (refcount_dec_and_test(&ioas->users)) {
+		WARN_ON(!list_empty(&ioas->bonds));
+		xa_erase(&iommu_sva_ioas_array, ioas->pasid);
+		mmdrop(ioas->mm);
+		kfree(ioas);
+	}
+}
+
+/*
+ * IOMMU SVA driver-oriented interfaces
+ */
+static struct iommu_domain *
+iommu_sva_alloc_domain(struct device *dev, struct iommu_sva_ioas *ioas)
+{
+	struct bus_type *bus = dev->bus;
+	struct iommu_domain *domain;
+
+	if (!bus || !bus->iommu_ops)
+		return NULL;
+
+	domain = bus->iommu_ops->domain_alloc(IOMMU_DOMAIN_SVA);
+	if (!domain)
+		return NULL;
+
+	/* The caller must hold a reference to ioas. */
+	domain->sva_ioas = ioas;
+	domain->type = IOMMU_DOMAIN_SVA;
+
+	return domain;
+}
+
+/**
+ * iommu_sva_bind_device() - Bind a process address space to a device
+ * @dev: the device
+ * @mm: the mm to bind, caller must hold a reference to it
+ * @drvdata: opaque data pointer to pass to bind callback
+ *
+ * Create a bond between device and address space, allowing the device to access
+ * the mm using the returned PASID. If a bond already exists between @device and
+ * @mm, it is returned and an additional reference is taken. Caller must call
+ * iommu_sva_unbind_device() to release each reference.
+ *
+ * iommu_dev_enable_feature(dev, IOMMU_DEV_FEAT_SVA) must be called first, to
+ * initialize the required SVA features.
+ *
+ * On error, returns an ERR_PTR value.
+ */
+struct iommu_sva *
+iommu_sva_bind_device(struct device *dev, struct mm_struct *mm, void *drvdata)
+{
+	int ret = -EINVAL;
+	struct iommu_sva *handle;
+	struct iommu_domain *domain;
+	struct iommu_sva_ioas *ioas;
+
+	/*
+	 * TODO: Remove the drvdata parameter after kernel PASID support is
+	 * enabled for the idxd driver.
+	 */
+	if (drvdata)
+		return ERR_PTR(-EOPNOTSUPP);
+
+	/* Allocate mm->pasid if necessary. */
+	ret = iommu_sva_alloc_pasid(mm, 1, (1U << dev->iommu->pasid_bits) - 1);
+	if (ret)
+		return ERR_PTR(ret);
+
+	mutex_lock(&iommu_sva_lock);
+	ioas = iommu_sva_ioas_get(mm, mm->pasid);
+	if (IS_ERR(ioas)) {
+		ret = PTR_ERR(ioas);
+		goto out_unlock;
+	}
+
+	/* Search for an existing bond. */
+	list_for_each_entry(handle, &ioas->bonds, node) {
+		if (handle->dev == dev) {
+			refcount_inc(&handle->users);
+			/* No new bond, drop the counter. */
+			iommu_sva_ioas_put(ioas);
+			goto out_success;
+		}
+	}
+
+	handle = kzalloc(sizeof(*handle), GFP_KERNEL);
+	if (!handle) {
+		ret = -ENOMEM;
+		goto out_put_ioas;
+	}
+
+	/* The reference to ioas will be kept until domain free. */
+	domain = iommu_sva_alloc_domain(dev, ioas);
+	if (!domain) {
+		ret = -ENODEV;
+		goto out_free_handle;
+	}
+
+	ret = iommu_attach_device_pasid(domain, dev, mm->pasid);
+	if (ret)
+		goto out_free_domain;
+
+	handle->dev = dev;
+	handle->domain = domain;
+	handle->sva_ioas = ioas;
+	refcount_set(&handle->users, 1);
+	list_add_tail(&handle->node, &ioas->bonds);
+
+out_success:
+	mutex_unlock(&iommu_sva_lock);
+	return handle;
+
+out_free_domain:
+	iommu_domain_free(domain);
+out_free_handle:
+	kfree(handle);
+out_put_ioas:
+	iommu_sva_ioas_put(ioas);
+out_unlock:
+	mutex_unlock(&iommu_sva_lock);
+	return ERR_PTR(ret);
+}
+EXPORT_SYMBOL_GPL(iommu_sva_bind_device);
+
+/**
+ * iommu_sva_unbind_device() - Remove a bond created with iommu_sva_bind_device
+ * @handle: the handle returned by iommu_sva_bind_device()
+ *
+ * Put reference to a bond between device and address space. The device should
+ * not be issuing any more transaction for this PASID. All outstanding page
+ * requests for this PASID must have been flushed to the IOMMU.
+ */
+void iommu_sva_unbind_device(struct iommu_sva *handle)
+{
+	struct device *dev = handle->dev;
+	struct iommu_domain *domain = handle->domain;
+	struct iommu_sva_ioas *ioas = handle->sva_ioas;
+
+	mutex_lock(&iommu_sva_lock);
+	if (refcount_dec_and_test(&handle->users)) {
+		list_del(&handle->node);
+		iommu_detach_device_pasid(domain, dev, ioas->pasid);
+		iommu_domain_free(domain);
+		iommu_sva_ioas_put(ioas);
+		kfree(handle);
+	}
+	mutex_unlock(&iommu_sva_lock);
+}
+EXPORT_SYMBOL_GPL(iommu_sva_unbind_device);
+
+u32 iommu_sva_get_pasid(struct iommu_sva *handle)
+{
+	return handle->sva_ioas->pasid;
+}
+EXPORT_SYMBOL_GPL(iommu_sva_get_pasid);
diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 89c9d19ddb28..7cae631c1baa 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2731,98 +2731,6 @@ bool iommu_dev_feature_enabled(struct device *dev, enum iommu_dev_features feat)
 }
 EXPORT_SYMBOL_GPL(iommu_dev_feature_enabled);
 
-/**
- * iommu_sva_bind_device() - Bind a process address space to a device
- * @dev: the device
- * @mm: the mm to bind, caller must hold a reference to it
- * @drvdata: opaque data pointer to pass to bind callback
- *
- * Create a bond between device and address space, allowing the device to access
- * the mm using the returned PASID. If a bond already exists between @device and
- * @mm, it is returned and an additional reference is taken. Caller must call
- * iommu_sva_unbind_device() to release each reference.
- *
- * iommu_dev_enable_feature(dev, IOMMU_DEV_FEAT_SVA) must be called first, to
- * initialize the required SVA features.
- *
- * On error, returns an ERR_PTR value.
- */
-struct iommu_sva *
-iommu_sva_bind_device(struct device *dev, struct mm_struct *mm, void *drvdata)
-{
-	struct iommu_group *group;
-	struct iommu_sva *handle = ERR_PTR(-EINVAL);
-	const struct iommu_ops *ops = dev_iommu_ops(dev);
-
-	if (!ops->sva_bind)
-		return ERR_PTR(-ENODEV);
-
-	group = iommu_group_get(dev);
-	if (!group)
-		return ERR_PTR(-ENODEV);
-
-	/* Ensure device count and domain don't change while we're binding */
-	mutex_lock(&group->mutex);
-
-	/*
-	 * To keep things simple, SVA currently doesn't support IOMMU groups
-	 * with more than one device. Existing SVA-capable systems are not
-	 * affected by the problems that required IOMMU groups (lack of ACS
-	 * isolation, device ID aliasing and other hardware issues).
-	 */
-	if (iommu_group_device_count(group) != 1)
-		goto out_unlock;
-
-	handle = ops->sva_bind(dev, mm, drvdata);
-
-out_unlock:
-	mutex_unlock(&group->mutex);
-	iommu_group_put(group);
-
-	return handle;
-}
-EXPORT_SYMBOL_GPL(iommu_sva_bind_device);
-
-/**
- * iommu_sva_unbind_device() - Remove a bond created with iommu_sva_bind_device
- * @handle: the handle returned by iommu_sva_bind_device()
- *
- * Put reference to a bond between device and address space. The device should
- * not be issuing any more transaction for this PASID. All outstanding page
- * requests for this PASID must have been flushed to the IOMMU.
- */
-void iommu_sva_unbind_device(struct iommu_sva *handle)
-{
-	struct iommu_group *group;
-	struct device *dev = handle->dev;
-	const struct iommu_ops *ops = dev_iommu_ops(dev);
-
-	if (!ops->sva_unbind)
-		return;
-
-	group = iommu_group_get(dev);
-	if (!group)
-		return;
-
-	mutex_lock(&group->mutex);
-	ops->sva_unbind(handle);
-	mutex_unlock(&group->mutex);
-
-	iommu_group_put(group);
-}
-EXPORT_SYMBOL_GPL(iommu_sva_unbind_device);
-
-u32 iommu_sva_get_pasid(struct iommu_sva *handle)
-{
-	const struct iommu_ops *ops = dev_iommu_ops(handle->dev);
-
-	if (!ops->sva_get_pasid)
-		return IOMMU_PASID_INVALID;
-
-	return ops->sva_get_pasid(handle);
-}
-EXPORT_SYMBOL_GPL(iommu_sva_get_pasid);
-
 /*
  * Changes the default domain of an iommu group that has *only* one device
  *
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
