Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id C20DC504A43
	for <lists.iommu@lfdr.de>; Mon, 18 Apr 2022 02:52:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5829B41C19;
	Mon, 18 Apr 2022 00:52:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PxrA0BE1OjVP; Mon, 18 Apr 2022 00:52:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 03EEA41BA4;
	Mon, 18 Apr 2022 00:52:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C2D97C002C;
	Mon, 18 Apr 2022 00:52:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 23F54C002C
 for <iommu@lists.linux-foundation.org>; Mon, 18 Apr 2022 00:52:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1228341B39
 for <iommu@lists.linux-foundation.org>; Mon, 18 Apr 2022 00:52:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S24WnTCHopwY for <iommu@lists.linux-foundation.org>;
 Mon, 18 Apr 2022 00:52:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0050641A6B
 for <iommu@lists.linux-foundation.org>; Mon, 18 Apr 2022 00:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650243170; x=1681779170;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bzKeQHa5qWTWSDpiVDQ6SnLMeCA91i1EIw+rja1W+U0=;
 b=JgtnDgkib9nLnbIUPi9Dk1b0KqRj/6XR8cl/M19cqwlYkwU9IMFI04B4
 1Z2qUk0utruZpsup7bpvUpsSmRORDb2ztju6+dR0cTQquWSpWK0Sfdj2f
 tW0hy0EIlH0NtpyJ4Oify5Sy4g/iAwo6mmbEJ3J8OhVa/fWCMt63DwqJA
 4G2700gfxH0ZIsaWgNpj6nC45kVAyBN9W/VGWD1QzFE6MbINxfmy5I0kQ
 Yo3BpKNZOZMgTx5GRFIu17xOIaOLMnyaBzxfizYcAb9JktXuBzevnMdNJ
 eHylGD3qNBq/5/FP9ITjo8G/L56HQr1IySgvgxz5HC82xfOZr8uU7Fxty w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10320"; a="262284660"
X-IronPort-AV: E=Sophos;i="5.90,267,1643702400"; d="scan'208";a="262284660"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2022 17:52:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,267,1643702400"; d="scan'208";a="701651315"
Received: from allen-box.sh.intel.com ([10.239.159.48])
 by fmsmga001.fm.intel.com with ESMTP; 17 Apr 2022 17:52:48 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: [RESEND PATCH v8 09/11] vfio: Delete the unbound_list
Date: Mon, 18 Apr 2022 08:49:58 +0800
Message-Id: <20220418005000.897664-10-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220418005000.897664-1-baolu.lu@linux.intel.com>
References: <20220418005000.897664-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Cc: Kevin Tian <kevin.tian@intel.com>, iommu@lists.linux-foundation.org,
 Jason Gunthorpe <jgg@nvidia.com>, linux-kernel@vger.kernel.org
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

From: Jason Gunthorpe <jgg@nvidia.com>

commit 60720a0fc646 ("vfio: Add device tracking during unbind") added the
unbound list to plug a problem with KVM where KVM_DEV_VFIO_GROUP_DEL
relied on vfio_group_get_external_user() succeeding to return the
vfio_group from a group file descriptor. The unbound list allowed
vfio_group_get_external_user() to continue to succeed in edge cases.

However commit 5d6dee80a1e9 ("vfio: New external user group/file match")
deleted the call to vfio_group_get_external_user() during
KVM_DEV_VFIO_GROUP_DEL. Instead vfio_external_group_match_file() is used
to directly match the file descriptor to the group pointer.

This in turn avoids the call down to vfio_dev_viable() during
KVM_DEV_VFIO_GROUP_DEL and also avoids the trouble the first commit was
trying to fix.

There are no other users of vfio_dev_viable() that care about the time
after vfio_unregister_group_dev() returns, so simply delete the
unbound_list entirely.

Reviewed-by: Chaitanya Kulkarni <kch@nvidia.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
Acked-by: Alex Williamson <alex.williamson@redhat.com>
---
 drivers/vfio/vfio.c | 74 ++-------------------------------------------
 1 file changed, 2 insertions(+), 72 deletions(-)

diff --git a/drivers/vfio/vfio.c b/drivers/vfio/vfio.c
index 8a9347f732a5..b2f19d17d0c3 100644
--- a/drivers/vfio/vfio.c
+++ b/drivers/vfio/vfio.c
@@ -62,11 +62,6 @@ struct vfio_container {
 	bool				noiommu;
 };
 
-struct vfio_unbound_dev {
-	struct device			*dev;
-	struct list_head		unbound_next;
-};
-
 struct vfio_group {
 	struct device 			dev;
 	struct cdev			cdev;
@@ -79,8 +74,6 @@ struct vfio_group {
 	struct notifier_block		nb;
 	struct list_head		vfio_next;
 	struct list_head		container_next;
-	struct list_head		unbound_list;
-	struct mutex			unbound_lock;
 	atomic_t			opened;
 	wait_queue_head_t		container_q;
 	enum vfio_group_type		type;
@@ -340,16 +333,8 @@ vfio_group_get_from_iommu(struct iommu_group *iommu_group)
 static void vfio_group_release(struct device *dev)
 {
 	struct vfio_group *group = container_of(dev, struct vfio_group, dev);
-	struct vfio_unbound_dev *unbound, *tmp;
-
-	list_for_each_entry_safe(unbound, tmp,
-				 &group->unbound_list, unbound_next) {
-		list_del(&unbound->unbound_next);
-		kfree(unbound);
-	}
 
 	mutex_destroy(&group->device_lock);
-	mutex_destroy(&group->unbound_lock);
 	iommu_group_put(group->iommu_group);
 	ida_free(&vfio.group_ida, MINOR(group->dev.devt));
 	kfree(group);
@@ -381,8 +366,6 @@ static struct vfio_group *vfio_group_alloc(struct iommu_group *iommu_group,
 	refcount_set(&group->users, 1);
 	INIT_LIST_HEAD(&group->device_list);
 	mutex_init(&group->device_lock);
-	INIT_LIST_HEAD(&group->unbound_list);
-	mutex_init(&group->unbound_lock);
 	init_waitqueue_head(&group->container_q);
 	group->iommu_group = iommu_group;
 	/* put in vfio_group_release() */
@@ -571,19 +554,8 @@ static int vfio_dev_viable(struct device *dev, void *data)
 	struct vfio_group *group = data;
 	struct vfio_device *device;
 	struct device_driver *drv = READ_ONCE(dev->driver);
-	struct vfio_unbound_dev *unbound;
-	int ret = -EINVAL;
 
-	mutex_lock(&group->unbound_lock);
-	list_for_each_entry(unbound, &group->unbound_list, unbound_next) {
-		if (dev == unbound->dev) {
-			ret = 0;
-			break;
-		}
-	}
-	mutex_unlock(&group->unbound_lock);
-
-	if (!ret || !drv || vfio_dev_driver_allowed(dev, drv))
+	if (!drv || vfio_dev_driver_allowed(dev, drv))
 		return 0;
 
 	device = vfio_group_get_device(group, dev);
@@ -592,7 +564,7 @@ static int vfio_dev_viable(struct device *dev, void *data)
 		return 0;
 	}
 
-	return ret;
+	return -EINVAL;
 }
 
 /*
@@ -634,7 +606,6 @@ static int vfio_iommu_group_notifier(struct notifier_block *nb,
 {
 	struct vfio_group *group = container_of(nb, struct vfio_group, nb);
 	struct device *dev = data;
-	struct vfio_unbound_dev *unbound;
 
 	switch (action) {
 	case IOMMU_GROUP_NOTIFY_ADD_DEVICE:
@@ -663,28 +634,6 @@ static int vfio_iommu_group_notifier(struct notifier_block *nb,
 			__func__, iommu_group_id(group->iommu_group),
 			dev->driver->name);
 		break;
-	case IOMMU_GROUP_NOTIFY_UNBOUND_DRIVER:
-		dev_dbg(dev, "%s: group %d unbound from driver\n", __func__,
-			iommu_group_id(group->iommu_group));
-		/*
-		 * XXX An unbound device in a live group is ok, but we'd
-		 * really like to avoid the above BUG_ON by preventing other
-		 * drivers from binding to it.  Once that occurs, we have to
-		 * stop the system to maintain isolation.  At a minimum, we'd
-		 * want a toggle to disable driver auto probe for this device.
-		 */
-
-		mutex_lock(&group->unbound_lock);
-		list_for_each_entry(unbound,
-				    &group->unbound_list, unbound_next) {
-			if (dev == unbound->dev) {
-				list_del(&unbound->unbound_next);
-				kfree(unbound);
-				break;
-			}
-		}
-		mutex_unlock(&group->unbound_lock);
-		break;
 	}
 	return NOTIFY_OK;
 }
@@ -889,29 +838,10 @@ static struct vfio_device *vfio_device_get_from_name(struct vfio_group *group,
 void vfio_unregister_group_dev(struct vfio_device *device)
 {
 	struct vfio_group *group = device->group;
-	struct vfio_unbound_dev *unbound;
 	unsigned int i = 0;
 	bool interrupted = false;
 	long rc;
 
-	/*
-	 * When the device is removed from the group, the group suddenly
-	 * becomes non-viable; the device has a driver (until the unbind
-	 * completes), but it's not present in the group.  This is bad news
-	 * for any external users that need to re-acquire a group reference
-	 * in order to match and release their existing reference.  To
-	 * solve this, we track such devices on the unbound_list to bridge
-	 * the gap until they're fully unbound.
-	 */
-	unbound = kzalloc(sizeof(*unbound), GFP_KERNEL);
-	if (unbound) {
-		unbound->dev = device->dev;
-		mutex_lock(&group->unbound_lock);
-		list_add(&unbound->unbound_next, &group->unbound_list);
-		mutex_unlock(&group->unbound_lock);
-	}
-	WARN_ON(!unbound);
-
 	vfio_device_put(device);
 	rc = try_wait_for_completion(&device->comp);
 	while (rc <= 0) {
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
