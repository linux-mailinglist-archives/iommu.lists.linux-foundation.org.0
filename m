Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6D4468ED4
	for <lists.iommu@lfdr.de>; Mon,  6 Dec 2021 03:01:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8925340445;
	Mon,  6 Dec 2021 02:00:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jIaOrU-64WG5; Mon,  6 Dec 2021 02:00:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 4069340449;
	Mon,  6 Dec 2021 02:00:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 19452C0012;
	Mon,  6 Dec 2021 02:00:57 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 708A4C0012
 for <iommu@lists.linux-foundation.org>; Mon,  6 Dec 2021 02:00:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5039340448
 for <iommu@lists.linux-foundation.org>; Mon,  6 Dec 2021 02:00:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AOnR6kyeF1xh for <iommu@lists.linux-foundation.org>;
 Mon,  6 Dec 2021 02:00:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5BEF040445
 for <iommu@lists.linux-foundation.org>; Mon,  6 Dec 2021 02:00:54 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10189"; a="224099113"
X-IronPort-AV: E=Sophos;i="5.87,290,1631602800"; d="scan'208";a="224099113"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2021 18:00:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,290,1631602800"; d="scan'208";a="514542516"
Received: from allen-box.sh.intel.com ([10.239.159.118])
 by orsmga008.jf.intel.com with ESMTP; 05 Dec 2021 18:00:41 -0800
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Joerg Roedel <joro@8bytes.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Christoph Hellwig <hch@infradead.org>, Kevin Tian <kevin.tian@intel.com>,
 Ashok Raj <ashok.raj@intel.com>
Subject: [PATCH v3 11/18] iommu: Expose group variants of dma ownership
 interfaces
Date: Mon,  6 Dec 2021 09:58:56 +0800
Message-Id: <20211206015903.88687-12-baolu.lu@linux.intel.com>
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

The vfio needs to set DMA_OWNER_PRIVATE_DOMAIN_USER for the entire group
when attaching it to a vfio container. Expose group variants of setting/
releasing dma ownership for this purpose.

This also exposes the helper iommu_group_dma_owner_unclaimed() for vfio
to report to userspace if the group is viable to user assignment for
compatibility with VFIO_GROUP_FLAGS_VIABLE.

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 include/linux/iommu.h | 21 ++++++++++++++++
 drivers/iommu/iommu.c | 58 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 79 insertions(+)

diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 24676b498f38..afcc07bc8d41 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -701,6 +701,10 @@ u32 iommu_sva_get_pasid(struct iommu_sva *handle);
 int iommu_device_set_dma_owner(struct device *dev, enum iommu_dma_owner owner,
 			       void *owner_cookie);
 void iommu_device_release_dma_owner(struct device *dev, enum iommu_dma_owner owner);
+int iommu_group_set_dma_owner(struct iommu_group *group, enum iommu_dma_owner owner,
+			      void *owner_cookie);
+void iommu_group_release_dma_owner(struct iommu_group *group, enum iommu_dma_owner owner);
+bool iommu_group_dma_owner_unclaimed(struct iommu_group *group);
 
 #else /* CONFIG_IOMMU_API */
 
@@ -1117,6 +1121,23 @@ static inline void iommu_device_release_dma_owner(struct device *dev,
 						  enum iommu_dma_owner owner)
 {
 }
+
+static inline int iommu_group_set_dma_owner(struct iommu_group *group,
+					    enum iommu_dma_owner owner,
+					    void *owner_cookie)
+{
+	return -EINVAL;
+}
+
+static inline void iommu_group_release_dma_owner(struct iommu_group *group,
+						 enum iommu_dma_owner owner)
+{
+}
+
+static inline bool iommu_group_dma_owner_unclaimed(struct iommu_group *group)
+{
+	return false;
+}
 #endif /* CONFIG_IOMMU_API */
 
 /**
diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 0cba04a8ea3b..423197db99a9 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -3425,6 +3425,64 @@ static void __iommu_group_release_dma_owner(struct iommu_group *group,
 	}
 }
 
+/**
+ * iommu_group_set_dma_owner() - Set DMA ownership of a group
+ * @group: The group.
+ * @owner: DMA owner type.
+ * @owner_cookie: Caller specified pointer. Could be used for exclusive
+ *                declaration. Could be NULL.
+ *
+ * This is to support backward compatibility for legacy vfio which manages
+ * dma ownership in group level. New invocations on this interface should be
+ * prohibited. Instead, please turn to iommu_device_set_dma_owner().
+ */
+int iommu_group_set_dma_owner(struct iommu_group *group, enum iommu_dma_owner owner,
+			      void *owner_cookie)
+{
+	int ret;
+
+	mutex_lock(&group->mutex);
+	ret = __iommu_group_set_dma_owner(group, owner, owner_cookie);
+	mutex_unlock(&group->mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(iommu_group_set_dma_owner);
+
+/**
+ * iommu_group_release_dma_owner() - Release DMA ownership of a group
+ * @group: The group.
+ * @owner: DMA owner type.
+ *
+ * Release the DMA ownership claimed by iommu_group_set_dma_owner().
+ */
+void iommu_group_release_dma_owner(struct iommu_group *group, enum iommu_dma_owner owner)
+{
+	mutex_lock(&group->mutex);
+	__iommu_group_release_dma_owner(group, owner);
+	mutex_unlock(&group->mutex);
+}
+EXPORT_SYMBOL_GPL(iommu_group_release_dma_owner);
+
+/**
+ * iommu_group_dma_owner_unclaimed() - Is group dma ownership claimed
+ * @group: The group.
+ *
+ * This provides status check on a given group. It is racey and only for
+ * non-binding status reporting.
+ */
+bool iommu_group_dma_owner_unclaimed(struct iommu_group *group)
+{
+	enum iommu_dma_owner owner;
+
+	mutex_lock(&group->mutex);
+	owner = group->dma_owner;
+	mutex_unlock(&group->mutex);
+
+	return owner == DMA_OWNER_NONE;
+}
+EXPORT_SYMBOL_GPL(iommu_group_dma_owner_unclaimed);
+
 /**
  * iommu_device_set_dma_owner() - Set DMA ownership of a device
  * @dev: The device.
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
