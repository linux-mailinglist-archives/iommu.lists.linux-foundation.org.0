Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8744BAEBF
	for <lists.iommu@lfdr.de>; Fri, 18 Feb 2022 01:58:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 17F4041ED4;
	Fri, 18 Feb 2022 00:58:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4Kw4zOoLEjqq; Fri, 18 Feb 2022 00:58:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 7D4F141ECF;
	Fri, 18 Feb 2022 00:58:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 638C9C000B;
	Fri, 18 Feb 2022 00:58:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 87EA7C000B
 for <iommu@lists.linux-foundation.org>; Fri, 18 Feb 2022 00:58:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 657716F6FE
 for <iommu@lists.linux-foundation.org>; Fri, 18 Feb 2022 00:58:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=intel.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HdrvkLMHWE4X for <iommu@lists.linux-foundation.org>;
 Fri, 18 Feb 2022 00:58:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A311960A7E
 for <iommu@lists.linux-foundation.org>; Fri, 18 Feb 2022 00:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645145905; x=1676681905;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1Ukpy7fqUbU/7OJeycVek0Vy3fDNcYmELqt4zxST+04=;
 b=QXKkK2yNjmNOHhv1eN0JoKChbx3K6af+Kyx/q43iYqYGKlzChkN2wFin
 wxcuT+Huf7Hzncj69MM7E3FQ1oUs4Wms6ZmTJ7gV4LP3cBqkFp0Ek4ZnX
 ExtuQzYWW5vQYCTnV7Q+JqjUNmwXgMNW9ObLMljC1mHu25k+fJOs6ICGX
 NlTXYDofsnUoRBhiZtu/CA7ufzuYLR90FSWFK7m5xsiu+xFhif4wuchM/
 673LWCDca+EhjBuR5V6c6yKkL1JB3Mg25QI9AFt7fpa1xa2gRurPKhaTn
 LTYRApybQOwjuq8xvi8LNysi5Lc1Zc0sgs7nALbtiXu2t2FzyXNM72HKG w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="249852029"
X-IronPort-AV: E=Sophos;i="5.88,377,1635231600"; d="scan'208";a="249852029"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 16:58:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,377,1635231600"; d="scan'208";a="637491633"
Received: from allen-box.sh.intel.com ([10.239.159.118])
 by orsmga004.jf.intel.com with ESMTP; 17 Feb 2022 16:58:08 -0800
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Joerg Roedel <joro@8bytes.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Christoph Hellwig <hch@infradead.org>, Kevin Tian <kevin.tian@intel.com>,
 Ashok Raj <ashok.raj@intel.com>
Subject: [PATCH v6 11/11] iommu: Remove iommu group changes notifier
Date: Fri, 18 Feb 2022 08:55:21 +0800
Message-Id: <20220218005521.172832-12-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220218005521.172832-1-baolu.lu@linux.intel.com>
References: <20220218005521.172832-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Cc: kvm@vger.kernel.org, rafael@kernel.org, David Airlie <airlied@linux.ie>,
 linux-pci@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>, Dmitry Osipenko <digetx@gmail.com>,
 Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
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

The iommu group changes notifer is not referenced in the tree. Remove it
to avoid dead code.

Suggested-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 include/linux/iommu.h | 23 -------------
 drivers/iommu/iommu.c | 75 -------------------------------------------
 2 files changed, 98 deletions(-)

diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 77972ef978b5..6ef2df258673 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -407,13 +407,6 @@ static inline const struct iommu_ops *dev_iommu_ops(struct device *dev)
 	return dev->iommu->iommu_dev->ops;
 }
 
-#define IOMMU_GROUP_NOTIFY_ADD_DEVICE		1 /* Device added */
-#define IOMMU_GROUP_NOTIFY_DEL_DEVICE		2 /* Pre Device removed */
-#define IOMMU_GROUP_NOTIFY_BIND_DRIVER		3 /* Pre Driver bind */
-#define IOMMU_GROUP_NOTIFY_BOUND_DRIVER		4 /* Post Driver bind */
-#define IOMMU_GROUP_NOTIFY_UNBIND_DRIVER	5 /* Pre Driver unbind */
-#define IOMMU_GROUP_NOTIFY_UNBOUND_DRIVER	6 /* Post Driver unbind */
-
 extern int bus_set_iommu(struct bus_type *bus, const struct iommu_ops *ops);
 extern int bus_iommu_probe(struct bus_type *bus);
 extern bool iommu_present(struct bus_type *bus);
@@ -478,10 +471,6 @@ extern int iommu_group_for_each_dev(struct iommu_group *group, void *data,
 extern struct iommu_group *iommu_group_get(struct device *dev);
 extern struct iommu_group *iommu_group_ref_get(struct iommu_group *group);
 extern void iommu_group_put(struct iommu_group *group);
-extern int iommu_group_register_notifier(struct iommu_group *group,
-					 struct notifier_block *nb);
-extern int iommu_group_unregister_notifier(struct iommu_group *group,
-					   struct notifier_block *nb);
 extern int iommu_register_device_fault_handler(struct device *dev,
 					iommu_dev_fault_handler_t handler,
 					void *data);
@@ -878,18 +867,6 @@ static inline void iommu_group_put(struct iommu_group *group)
 {
 }
 
-static inline int iommu_group_register_notifier(struct iommu_group *group,
-						struct notifier_block *nb)
-{
-	return -ENODEV;
-}
-
-static inline int iommu_group_unregister_notifier(struct iommu_group *group,
-						  struct notifier_block *nb)
-{
-	return 0;
-}
-
 static inline
 int iommu_register_device_fault_handler(struct device *dev,
 					iommu_dev_fault_handler_t handler,
diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 4e2ad7124780..196358ed8c3d 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -18,7 +18,6 @@
 #include <linux/errno.h>
 #include <linux/iommu.h>
 #include <linux/idr.h>
-#include <linux/notifier.h>
 #include <linux/err.h>
 #include <linux/pci.h>
 #include <linux/bitops.h>
@@ -40,7 +39,6 @@ struct iommu_group {
 	struct kobject *devices_kobj;
 	struct list_head devices;
 	struct mutex mutex;
-	struct blocking_notifier_head notifier;
 	void *iommu_data;
 	void (*iommu_data_release)(void *iommu_data);
 	char *name;
@@ -632,7 +630,6 @@ struct iommu_group *iommu_group_alloc(void)
 	mutex_init(&group->mutex);
 	INIT_LIST_HEAD(&group->devices);
 	INIT_LIST_HEAD(&group->entry);
-	BLOCKING_INIT_NOTIFIER_HEAD(&group->notifier);
 
 	ret = ida_simple_get(&iommu_group_ida, 0, 0, GFP_KERNEL);
 	if (ret < 0) {
@@ -905,10 +902,6 @@ int iommu_group_add_device(struct iommu_group *group, struct device *dev)
 	if (ret)
 		goto err_put_group;
 
-	/* Notify any listeners about change to group. */
-	blocking_notifier_call_chain(&group->notifier,
-				     IOMMU_GROUP_NOTIFY_ADD_DEVICE, dev);
-
 	trace_add_device_to_group(group->id, dev);
 
 	dev_info(dev, "Adding to iommu group %d\n", group->id);
@@ -950,10 +943,6 @@ void iommu_group_remove_device(struct device *dev)
 
 	dev_info(dev, "Removing from iommu group %d\n", group->id);
 
-	/* Pre-notify listeners that a device is being removed. */
-	blocking_notifier_call_chain(&group->notifier,
-				     IOMMU_GROUP_NOTIFY_DEL_DEVICE, dev);
-
 	mutex_lock(&group->mutex);
 	list_for_each_entry(tmp_device, &group->devices, list) {
 		if (tmp_device->dev == dev) {
@@ -1075,36 +1064,6 @@ void iommu_group_put(struct iommu_group *group)
 }
 EXPORT_SYMBOL_GPL(iommu_group_put);
 
-/**
- * iommu_group_register_notifier - Register a notifier for group changes
- * @group: the group to watch
- * @nb: notifier block to signal
- *
- * This function allows iommu group users to track changes in a group.
- * See include/linux/iommu.h for actions sent via this notifier.  Caller
- * should hold a reference to the group throughout notifier registration.
- */
-int iommu_group_register_notifier(struct iommu_group *group,
-				  struct notifier_block *nb)
-{
-	return blocking_notifier_chain_register(&group->notifier, nb);
-}
-EXPORT_SYMBOL_GPL(iommu_group_register_notifier);
-
-/**
- * iommu_group_unregister_notifier - Unregister a notifier
- * @group: the group to watch
- * @nb: notifier block to signal
- *
- * Unregister a previously registered group notifier block.
- */
-int iommu_group_unregister_notifier(struct iommu_group *group,
-				    struct notifier_block *nb)
-{
-	return blocking_notifier_chain_unregister(&group->notifier, nb);
-}
-EXPORT_SYMBOL_GPL(iommu_group_unregister_notifier);
-
 /**
  * iommu_register_device_fault_handler() - Register a device fault handler
  * @dev: the device
@@ -1650,14 +1609,8 @@ static int remove_iommu_group(struct device *dev, void *data)
 static int iommu_bus_notifier(struct notifier_block *nb,
 			      unsigned long action, void *data)
 {
-	unsigned long group_action = 0;
 	struct device *dev = data;
-	struct iommu_group *group;
 
-	/*
-	 * ADD/DEL call into iommu driver ops if provided, which may
-	 * result in ADD/DEL notifiers to group->notifier
-	 */
 	if (action == BUS_NOTIFY_ADD_DEVICE) {
 		int ret;
 
@@ -1668,34 +1621,6 @@ static int iommu_bus_notifier(struct notifier_block *nb,
 		return NOTIFY_OK;
 	}
 
-	/*
-	 * Remaining BUS_NOTIFYs get filtered and republished to the
-	 * group, if anyone is listening
-	 */
-	group = iommu_group_get(dev);
-	if (!group)
-		return 0;
-
-	switch (action) {
-	case BUS_NOTIFY_BIND_DRIVER:
-		group_action = IOMMU_GROUP_NOTIFY_BIND_DRIVER;
-		break;
-	case BUS_NOTIFY_BOUND_DRIVER:
-		group_action = IOMMU_GROUP_NOTIFY_BOUND_DRIVER;
-		break;
-	case BUS_NOTIFY_UNBIND_DRIVER:
-		group_action = IOMMU_GROUP_NOTIFY_UNBIND_DRIVER;
-		break;
-	case BUS_NOTIFY_UNBOUND_DRIVER:
-		group_action = IOMMU_GROUP_NOTIFY_UNBOUND_DRIVER;
-		break;
-	}
-
-	if (group_action)
-		blocking_notifier_call_chain(&group->notifier,
-					     group_action, dev);
-
-	iommu_group_put(group);
 	return 0;
 }
 
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
