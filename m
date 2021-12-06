Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E53C468EAE
	for <lists.iommu@lfdr.de>; Mon,  6 Dec 2021 02:59:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7D8280F8B;
	Mon,  6 Dec 2021 01:59:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MC0Kg6jH0GfT; Mon,  6 Dec 2021 01:59:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id DB3E480F73;
	Mon,  6 Dec 2021 01:59:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B5581C0071;
	Mon,  6 Dec 2021 01:59:29 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4F0CEC0012
 for <iommu@lists.linux-foundation.org>; Mon,  6 Dec 2021 01:59:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 311CC40472
 for <iommu@lists.linux-foundation.org>; Mon,  6 Dec 2021 01:59:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Nv-6jOzHGLM3 for <iommu@lists.linux-foundation.org>;
 Mon,  6 Dec 2021 01:59:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5BA8A40462
 for <iommu@lists.linux-foundation.org>; Mon,  6 Dec 2021 01:59:27 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10189"; a="298027407"
X-IronPort-AV: E=Sophos;i="5.87,290,1631602800"; 
 d="scan'208,223";a="298027407"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2021 17:59:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,290,1631602800"; 
 d="scan'208,223";a="514541932"
Received: from allen-box.sh.intel.com ([10.239.159.118])
 by orsmga008.jf.intel.com with ESMTP; 05 Dec 2021 17:59:19 -0800
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Joerg Roedel <joro@8bytes.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Christoph Hellwig <hch@infradead.org>, Kevin Tian <kevin.tian@intel.com>,
 Ashok Raj <ashok.raj@intel.com>
Subject: [PATCH v3 01/18] iommu: Add device dma ownership set/release
 interfaces
Date: Mon,  6 Dec 2021 09:58:46 +0800
Message-Id: <20211206015903.88687-2-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211206015903.88687-1-baolu.lu@linux.intel.com>
References: <20211206015903.88687-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Cc: kvm@vger.kernel.org, rafael@kernel.org, David Airlie <airlied@linux.ie>,
 linux-pci@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>, Dmitry Osipenko <digetx@gmail.com>,
 Will Deacon <will@kernel.org>, Stuart Yoder <stuyoder@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chaitanya Kulkarni <kch@nvidia.com>,
 Dan Williams <dan.j.williams@intel.com>, Cornelia Huck <cohuck@redhat.com>,
 linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>,
 iommu@lists.linux-foundation.org, Jacob jun Pan <jacob.jun.pan@intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Robin Murphy <robin.murphy@arm.com>
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

From the perspective of who is initiating the device to do DMA, device
DMA could be divided into the following types:

        DMA_OWNER_DMA_API: Device DMAs are initiated by a kernel driver
			through the kernel DMA API.
        DMA_OWNER_PRIVATE_DOMAIN: Device DMAs are initiated by a kernel
			driver with its own PRIVATE domain.
	DMA_OWNER_PRIVATE_DOMAIN_USER: Device DMAs are initiated by
			userspace.

Different DMA ownerships are exclusive for all devices in the same iommu
group as an iommu group is the smallest granularity of device isolation
and protection that the IOMMU subsystem can guarantee. This extends the
iommu core to enforce this exclusion.

Basically two new interfaces are provided:

        int iommu_device_set_dma_owner(struct device *dev,
                enum iommu_dma_owner type, void *owner_cookie);
        void iommu_device_release_dma_owner(struct device *dev,
                enum iommu_dma_owner type);

Although above interfaces are per-device, DMA owner is tracked per group
under the hood. An iommu group cannot have different dma ownership set
at the same time. Violation of this assumption fails
iommu_device_set_dma_owner().

Kernel driver which does DMA have DMA_OWNER_DMA_API automatically set/
released in the driver binding/unbinding process (see next patch).

Kernel driver which doesn't do DMA could avoid setting the owner type.
Device bound to such driver is considered same as a driver-less device
which is compatible to all owner types.

Userspace driver framework (e.g. vfio) should set
DMA_OWNER_PRIVATE_DOMAIN_USER for a device before the userspace is allowed
to access it, plus a owner cookie pointer to mark the user identity so a
single group cannot be operated by multiple users simultaneously. Vice
versa, the owner type should be released after the user access permission
is withdrawn.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Kevin Tian <kevin.tian@intel.com>
Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 include/linux/iommu.h | 36 +++++++++++++++++
 drivers/iommu/iommu.c | 93 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 129 insertions(+)

diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index d2f3435e7d17..24676b498f38 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -162,6 +162,23 @@ enum iommu_dev_features {
 	IOMMU_DEV_FEAT_IOPF,
 };
 
+/**
+ * enum iommu_dma_owner - IOMMU DMA ownership
+ * @DMA_OWNER_NONE: No DMA ownership.
+ * @DMA_OWNER_DMA_API: Device DMAs are initiated by a kernel driver through
+ *			the kernel DMA API.
+ * @DMA_OWNER_PRIVATE_DOMAIN: Device DMAs are initiated by a kernel driver
+ *			which provides an UNMANAGED domain.
+ * @DMA_OWNER_PRIVATE_DOMAIN_USER: Device DMAs are initiated by userspace,
+ *			kernel ensures that DMAs never go to kernel memory.
+ */
+enum iommu_dma_owner {
+	DMA_OWNER_NONE,
+	DMA_OWNER_DMA_API,
+	DMA_OWNER_PRIVATE_DOMAIN,
+	DMA_OWNER_PRIVATE_DOMAIN_USER,
+};
+
 #define IOMMU_PASID_INVALID	(-1U)
 
 #ifdef CONFIG_IOMMU_API
@@ -681,6 +698,10 @@ struct iommu_sva *iommu_sva_bind_device(struct device *dev,
 void iommu_sva_unbind_device(struct iommu_sva *handle);
 u32 iommu_sva_get_pasid(struct iommu_sva *handle);
 
+int iommu_device_set_dma_owner(struct device *dev, enum iommu_dma_owner owner,
+			       void *owner_cookie);
+void iommu_device_release_dma_owner(struct device *dev, enum iommu_dma_owner owner);
+
 #else /* CONFIG_IOMMU_API */
 
 struct iommu_ops {};
@@ -1081,6 +1102,21 @@ static inline struct iommu_fwspec *dev_iommu_fwspec_get(struct device *dev)
 {
 	return NULL;
 }
+
+static inline int iommu_device_set_dma_owner(struct device *dev,
+					     enum iommu_dma_owner owner,
+					     void *owner_cookie)
+{
+	if (owner != DMA_OWNER_DMA_API)
+		return -EINVAL;
+
+	return 0;
+}
+
+static inline void iommu_device_release_dma_owner(struct device *dev,
+						  enum iommu_dma_owner owner)
+{
+}
 #endif /* CONFIG_IOMMU_API */
 
 /**
diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 8b86406b7162..1de520a07518 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -48,6 +48,9 @@ struct iommu_group {
 	struct iommu_domain *default_domain;
 	struct iommu_domain *domain;
 	struct list_head entry;
+	enum iommu_dma_owner dma_owner;
+	refcount_t owner_cnt;
+	void *owner_cookie;
 };
 
 struct group_device {
@@ -621,6 +624,7 @@ struct iommu_group *iommu_group_alloc(void)
 	INIT_LIST_HEAD(&group->devices);
 	INIT_LIST_HEAD(&group->entry);
 	BLOCKING_INIT_NOTIFIER_HEAD(&group->notifier);
+	group->dma_owner = DMA_OWNER_NONE;
 
 	ret = ida_simple_get(&iommu_group_ida, 0, 0, GFP_KERNEL);
 	if (ret < 0) {
@@ -3351,3 +3355,92 @@ static ssize_t iommu_group_store_type(struct iommu_group *group,
 
 	return ret;
 }
+
+static int __iommu_group_set_dma_owner(struct iommu_group *group,
+				       enum iommu_dma_owner owner,
+				       void *owner_cookie)
+{
+	if (refcount_inc_not_zero(&group->owner_cnt)) {
+		if (group->dma_owner != owner ||
+		    group->owner_cookie != owner_cookie) {
+			refcount_dec(&group->owner_cnt);
+			return -EBUSY;
+		}
+
+		return 0;
+	}
+
+	group->dma_owner = owner;
+	group->owner_cookie = owner_cookie;
+	refcount_set(&group->owner_cnt, 1);
+
+	return 0;
+}
+
+static void __iommu_group_release_dma_owner(struct iommu_group *group,
+					    enum iommu_dma_owner owner)
+{
+	if (WARN_ON(group->dma_owner != owner))
+		return;
+
+	if (!refcount_dec_and_test(&group->owner_cnt))
+		return;
+
+	group->dma_owner = DMA_OWNER_NONE;
+}
+
+/**
+ * iommu_device_set_dma_owner() - Set DMA ownership of a device
+ * @dev: The device.
+ * @owner: DMA ownership type.
+ * @owner_cookie: Caller specified pointer. Could be used for exclusive
+ *                declaration. Could be NULL.
+ *
+ * Set the DMA ownership of a device. The different ownerships are
+ * exclusive. The caller could specify a owner_cookie pointer so that
+ * the same DMA ownership could be exclusive among different owners.
+ */
+int iommu_device_set_dma_owner(struct device *dev, enum iommu_dma_owner owner,
+			       void *owner_cookie)
+{
+	struct iommu_group *group = iommu_group_get(dev);
+	int ret;
+
+	if (!group) {
+		if (owner == DMA_OWNER_DMA_API)
+			return 0;
+		else
+			return -ENODEV;
+	}
+
+	mutex_lock(&group->mutex);
+	ret = __iommu_group_set_dma_owner(group, owner, owner_cookie);
+	mutex_unlock(&group->mutex);
+	iommu_group_put(group);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(iommu_device_set_dma_owner);
+
+/**
+ * iommu_device_release_dma_owner() - Release DMA ownership of a device
+ * @dev: The device.
+ * @owner: The DMA ownership type.
+ *
+ * Release the DMA ownership claimed by iommu_device_set_dma_owner().
+ */
+void iommu_device_release_dma_owner(struct device *dev, enum iommu_dma_owner owner)
+{
+	struct iommu_group *group = iommu_group_get(dev);
+
+	if (!group) {
+		WARN_ON(owner != DMA_OWNER_DMA_API);
+		return;
+	}
+
+	mutex_lock(&group->mutex);
+	__iommu_group_release_dma_owner(group, owner);
+	mutex_unlock(&group->mutex);
+	iommu_group_put(group);
+}
+EXPORT_SYMBOL_GPL(iommu_device_release_dma_owner);
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
