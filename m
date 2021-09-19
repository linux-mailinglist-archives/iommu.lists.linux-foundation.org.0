Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id DC344410A3D
	for <lists.iommu@lfdr.de>; Sun, 19 Sep 2021 08:42:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B9D2404E7;
	Sun, 19 Sep 2021 06:42:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p2Wtl2jHzKro; Sun, 19 Sep 2021 06:42:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 8FB4C404FC;
	Sun, 19 Sep 2021 06:42:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 78D10C0022;
	Sun, 19 Sep 2021 06:42:00 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 87034C000D
 for <iommu@lists.linux-foundation.org>; Sun, 19 Sep 2021 06:41:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 76C57404FC
 for <iommu@lists.linux-foundation.org>; Sun, 19 Sep 2021 06:41:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EKtCX7RuD47M for <iommu@lists.linux-foundation.org>;
 Sun, 19 Sep 2021 06:41:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C5396404E7
 for <iommu@lists.linux-foundation.org>; Sun, 19 Sep 2021 06:41:57 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10111"; a="210081631"
X-IronPort-AV: E=Sophos;i="5.85,305,1624345200"; d="scan'208";a="210081631"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2021 23:41:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,305,1624345200"; d="scan'208";a="510701919"
Received: from yiliu-dev.bj.intel.com (HELO iov-dual.bj.intel.com)
 ([10.238.156.135])
 by fmsmga008.fm.intel.com with ESMTP; 18 Sep 2021 23:41:50 -0700
From: Liu Yi L <yi.l.liu@intel.com>
To: alex.williamson@redhat.com, jgg@nvidia.com, hch@lst.de,
 jasowang@redhat.com, joro@8bytes.org
Subject: [RFC 04/20] iommu: Add iommu_device_get_info interface
Date: Sun, 19 Sep 2021 14:38:32 +0800
Message-Id: <20210919063848.1476776-5-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210919063848.1476776-1-yi.l.liu@intel.com>
References: <20210919063848.1476776-1-yi.l.liu@intel.com>
MIME-Version: 1.0
Cc: kvm@vger.kernel.org, kwankhede@nvidia.com, jean-philippe@linaro.org,
 dave.jiang@intel.com, ashok.raj@intel.com, corbet@lwn.net,
 kevin.tian@intel.com, parav@mellanox.com, lkml@metux.net,
 david@gibson.dropbear.id.au, robin.murphy@arm.com, jun.j.tian@intel.com,
 linux-kernel@vger.kernel.org, lushenming@huawei.com,
 iommu@lists.linux-foundation.org, pbonzini@redhat.com, dwmw2@infradead.org
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

From: Lu Baolu <baolu.lu@linux.intel.com>

This provides an interface for upper layers to get the per-device iommu
attributes.

    int iommu_device_get_info(struct device *dev,
                              enum iommu_devattr attr, void *data);

The first attribute (IOMMU_DEV_INFO_FORCE_SNOOP) is added. It tells if
the iommu can force DMA to snoop cache. At this stage, only PCI devices
which have this attribute set could use the iommufd, this is due to
supporting no-snoop DMA requires additional refactoring work on the
current kvm-vfio contract. The following patch will have vfio check this
attribute to decide whether a pci device can be exposed through
/dev/vfio/devices.

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/iommu/iommu.c | 16 ++++++++++++++++
 include/linux/iommu.h | 19 +++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 63f0af10c403..5ea3a007fd7c 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -3260,3 +3260,19 @@ static ssize_t iommu_group_store_type(struct iommu_group *group,
 
 	return ret;
 }
+
+/* Expose per-device iommu attributes. */
+int iommu_device_get_info(struct device *dev, enum iommu_devattr attr, void *data)
+{
+	const struct iommu_ops *ops;
+
+	if (!dev->bus || !dev->bus->iommu_ops)
+		return -EINVAL;
+
+	ops = dev->bus->iommu_ops;
+	if (unlikely(!ops->device_info))
+		return -ENODEV;
+
+	return ops->device_info(dev, attr, data);
+}
+EXPORT_SYMBOL_GPL(iommu_device_get_info);
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 32d448050bf7..52a6d33c82dc 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -150,6 +150,14 @@ enum iommu_dev_features {
 	IOMMU_DEV_FEAT_IOPF,
 };
 
+/**
+ * enum iommu_devattr - Per device IOMMU attributes
+ * @IOMMU_DEV_INFO_FORCE_SNOOP [bool]: IOMMU can force DMA to be snooped.
+ */
+enum iommu_devattr {
+	IOMMU_DEV_INFO_FORCE_SNOOP,
+};
+
 #define IOMMU_PASID_INVALID	(-1U)
 
 #ifdef CONFIG_IOMMU_API
@@ -215,6 +223,7 @@ struct iommu_iotlb_gather {
  *		- IOMMU_DOMAIN_IDENTITY: must use an identity domain
  *		- IOMMU_DOMAIN_DMA: must use a dma domain
  *		- 0: use the default setting
+ * @device_info: query per-device iommu attributes
  * @pgsize_bitmap: bitmap of all possible supported page sizes
  * @owner: Driver module providing these ops
  */
@@ -283,6 +292,8 @@ struct iommu_ops {
 
 	int (*def_domain_type)(struct device *dev);
 
+	int (*device_info)(struct device *dev, enum iommu_devattr attr, void *data);
+
 	unsigned long pgsize_bitmap;
 	struct module *owner;
 };
@@ -604,6 +615,8 @@ struct iommu_sva *iommu_sva_bind_device(struct device *dev,
 void iommu_sva_unbind_device(struct iommu_sva *handle);
 u32 iommu_sva_get_pasid(struct iommu_sva *handle);
 
+int iommu_device_get_info(struct device *dev, enum iommu_devattr attr, void *data);
+
 #else /* CONFIG_IOMMU_API */
 
 struct iommu_ops {};
@@ -999,6 +1012,12 @@ static inline struct iommu_fwspec *dev_iommu_fwspec_get(struct device *dev)
 {
 	return NULL;
 }
+
+static inline int iommu_device_get_info(struct device *dev,
+					enum iommu_devattr type, void *data)
+{
+	return -ENODEV;
+}
 #endif /* CONFIG_IOMMU_API */
 
 /**
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
