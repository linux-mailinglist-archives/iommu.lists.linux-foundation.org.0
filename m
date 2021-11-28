Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD4D460315
	for <lists.iommu@lfdr.de>; Sun, 28 Nov 2021 03:52:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7A2B607D2;
	Sun, 28 Nov 2021 02:52:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jZ6Aa7ikNYm9; Sun, 28 Nov 2021 02:52:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id CBE2F607E8;
	Sun, 28 Nov 2021 02:52:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A8CE0C000A;
	Sun, 28 Nov 2021 02:52:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 43145C000A
 for <iommu@lists.linux-foundation.org>; Sun, 28 Nov 2021 02:52:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 31FDC81B36
 for <iommu@lists.linux-foundation.org>; Sun, 28 Nov 2021 02:52:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DdWqy2q1GuYx for <iommu@lists.linux-foundation.org>;
 Sun, 28 Nov 2021 02:52:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 67CFE81ADE
 for <iommu@lists.linux-foundation.org>; Sun, 28 Nov 2021 02:52:48 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10181"; a="235738961"
X-IronPort-AV: E=Sophos;i="5.87,270,1631602800"; d="scan'208";a="235738961"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2021 18:52:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,270,1631602800"; d="scan'208";a="652489175"
Received: from allen-box.sh.intel.com ([10.239.159.118])
 by fmsmga001.fm.intel.com with ESMTP; 27 Nov 2021 18:52:40 -0800
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Joerg Roedel <joro@8bytes.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Christoph Hellwig <hch@infradead.org>, Kevin Tian <kevin.tian@intel.com>,
 Ashok Raj <ashok.raj@intel.com>
Subject: [PATCH v2 15/17] vfio: Remove iommu group notifier
Date: Sun, 28 Nov 2021 10:50:49 +0800
Message-Id: <20211128025051.355578-16-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211128025051.355578-1-baolu.lu@linux.intel.com>
References: <20211128025051.355578-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Cc: kvm@vger.kernel.org, rafael@kernel.org, David Airlie <airlied@linux.ie>,
 linux-pci@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>, Will Deacon <will@kernel.org>,
 Stuart Yoder <stuyoder@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Chaitanya Kulkarni <kch@nvidia.com>, Dan Williams <dan.j.williams@intel.com>,
 Cornelia Huck <cohuck@redhat.com>, linux-kernel@vger.kernel.org,
 Li Yang <leoyang.li@nxp.com>, iommu@lists.linux-foundation.org,
 Jacob jun Pan <jacob.jun.pan@intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Robin Murphy <robin.murphy@arm.com>
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

The iommu core and driver core have been enhanced to avoid unsafe driver
binding to a live group after iommu_group_set_dma_owner(PRIVATE_USER)
has been called. There's no need to register iommu group notifier. This
removes the iommu group notifer which contains BUG_ON() and WARN().

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/vfio/vfio.c | 147 --------------------------------------------
 1 file changed, 147 deletions(-)

diff --git a/drivers/vfio/vfio.c b/drivers/vfio/vfio.c
index 5c81346367b1..33d984ff3cc5 100644
--- a/drivers/vfio/vfio.c
+++ b/drivers/vfio/vfio.c
@@ -71,7 +71,6 @@ struct vfio_group {
 	struct vfio_container		*container;
 	struct list_head		device_list;
 	struct mutex			device_lock;
-	struct notifier_block		nb;
 	struct list_head		vfio_next;
 	struct list_head		container_next;
 	atomic_t			opened;
@@ -274,8 +273,6 @@ void vfio_unregister_iommu_driver(const struct vfio_iommu_driver_ops *ops)
 }
 EXPORT_SYMBOL_GPL(vfio_unregister_iommu_driver);
 
-static int vfio_iommu_group_notifier(struct notifier_block *nb,
-				     unsigned long action, void *data);
 static void vfio_group_get(struct vfio_group *group);
 
 /**
@@ -395,13 +392,6 @@ static struct vfio_group *vfio_create_group(struct iommu_group *iommu_group,
 		goto err_put;
 	}
 
-	group->nb.notifier_call = vfio_iommu_group_notifier;
-	err = iommu_group_register_notifier(iommu_group, &group->nb);
-	if (err) {
-		ret = ERR_PTR(err);
-		goto err_put;
-	}
-
 	mutex_lock(&vfio.group_lock);
 
 	/* Did we race creating this group? */
@@ -422,7 +412,6 @@ static struct vfio_group *vfio_create_group(struct iommu_group *iommu_group,
 
 err_unlock:
 	mutex_unlock(&vfio.group_lock);
-	iommu_group_unregister_notifier(group->iommu_group, &group->nb);
 err_put:
 	put_device(&group->dev);
 	return ret;
@@ -447,7 +436,6 @@ static void vfio_group_put(struct vfio_group *group)
 	cdev_device_del(&group->cdev, &group->dev);
 	mutex_unlock(&vfio.group_lock);
 
-	iommu_group_unregister_notifier(group->iommu_group, &group->nb);
 	put_device(&group->dev);
 }
 
@@ -503,141 +491,6 @@ static struct vfio_device *vfio_group_get_device(struct vfio_group *group,
 	return NULL;
 }
 
-/*
- * Some drivers, like pci-stub, are only used to prevent other drivers from
- * claiming a device and are therefore perfectly legitimate for a user owned
- * group.  The pci-stub driver has no dependencies on DMA or the IOVA mapping
- * of the device, but it does prevent the user from having direct access to
- * the device, which is useful in some circumstances.
- *
- * We also assume that we can include PCI interconnect devices, ie. bridges.
- * IOMMU grouping on PCI necessitates that if we lack isolation on a bridge
- * then all of the downstream devices will be part of the same IOMMU group as
- * the bridge.  Thus, if placing the bridge into the user owned IOVA space
- * breaks anything, it only does so for user owned devices downstream.  Note
- * that error notification via MSI can be affected for platforms that handle
- * MSI within the same IOVA space as DMA.
- */
-static const char * const vfio_driver_allowed[] = { "pci-stub" };
-
-static bool vfio_dev_driver_allowed(struct device *dev,
-				    struct device_driver *drv)
-{
-	if (dev_is_pci(dev)) {
-		struct pci_dev *pdev = to_pci_dev(dev);
-
-		if (pdev->hdr_type != PCI_HEADER_TYPE_NORMAL)
-			return true;
-	}
-
-	return match_string(vfio_driver_allowed,
-			    ARRAY_SIZE(vfio_driver_allowed),
-			    drv->name) >= 0;
-}
-
-/*
- * A vfio group is viable for use by userspace if all devices are in
- * one of the following states:
- *  - driver-less
- *  - bound to a vfio driver
- *  - bound to an otherwise allowed driver
- *  - a PCI interconnect device
- *
- * We use two methods to determine whether a device is bound to a vfio
- * driver.  The first is to test whether the device exists in the vfio
- * group.  The second is to test if the device exists on the group
- * unbound_list, indicating it's in the middle of transitioning from
- * a vfio driver to driver-less.
- */
-static int vfio_dev_viable(struct device *dev, void *data)
-{
-	struct vfio_group *group = data;
-	struct vfio_device *device;
-	struct device_driver *drv = READ_ONCE(dev->driver);
-
-	if (!drv || vfio_dev_driver_allowed(dev, drv))
-		return 0;
-
-	device = vfio_group_get_device(group, dev);
-	if (device) {
-		vfio_device_put(device);
-		return 0;
-	}
-
-	return -EINVAL;
-}
-
-/**
- * Async device support
- */
-static int vfio_group_nb_add_dev(struct vfio_group *group, struct device *dev)
-{
-	struct vfio_device *device;
-
-	/* Do we already know about it?  We shouldn't */
-	device = vfio_group_get_device(group, dev);
-	if (WARN_ON_ONCE(device)) {
-		vfio_device_put(device);
-		return 0;
-	}
-
-	/* Nothing to do for idle groups */
-	if (!atomic_read(&group->container_users))
-		return 0;
-
-	/* TODO Prevent device auto probing */
-	dev_WARN(dev, "Device added to live group %d!\n",
-		 iommu_group_id(group->iommu_group));
-
-	return 0;
-}
-
-static int vfio_group_nb_verify(struct vfio_group *group, struct device *dev)
-{
-	/* We don't care what happens when the group isn't in use */
-	if (!atomic_read(&group->container_users))
-		return 0;
-
-	return vfio_dev_viable(dev, group);
-}
-
-static int vfio_iommu_group_notifier(struct notifier_block *nb,
-				     unsigned long action, void *data)
-{
-	struct vfio_group *group = container_of(nb, struct vfio_group, nb);
-	struct device *dev = data;
-
-	switch (action) {
-	case IOMMU_GROUP_NOTIFY_ADD_DEVICE:
-		vfio_group_nb_add_dev(group, dev);
-		break;
-	case IOMMU_GROUP_NOTIFY_DEL_DEVICE:
-		/*
-		 * Nothing to do here.  If the device is in use, then the
-		 * vfio sub-driver should block the remove callback until
-		 * it is unused.  If the device is unused or attached to a
-		 * stub driver, then it should be released and we don't
-		 * care that it will be going away.
-		 */
-		break;
-	case IOMMU_GROUP_NOTIFY_BIND_DRIVER:
-		dev_dbg(dev, "%s: group %d binding to driver\n", __func__,
-			iommu_group_id(group->iommu_group));
-		break;
-	case IOMMU_GROUP_NOTIFY_BOUND_DRIVER:
-		dev_dbg(dev, "%s: group %d bound to driver %s\n", __func__,
-			iommu_group_id(group->iommu_group), dev->driver->name);
-		BUG_ON(vfio_group_nb_verify(group, dev));
-		break;
-	case IOMMU_GROUP_NOTIFY_UNBIND_DRIVER:
-		dev_dbg(dev, "%s: group %d unbinding from driver %s\n",
-			__func__, iommu_group_id(group->iommu_group),
-			dev->driver->name);
-		break;
-	}
-	return NOTIFY_OK;
-}
-
 /**
  * VFIO driver API
  */
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
