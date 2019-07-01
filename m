Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id F28E63A60F
	for <lists.iommu@lfdr.de>; Sun,  9 Jun 2019 15:41:35 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 40A9DC9B;
	Sun,  9 Jun 2019 13:41:22 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id CC984C51
	for <iommu@lists.linux-foundation.org>;
	Sun,  9 Jun 2019 13:41:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 2287476F
	for <iommu@lists.linux-foundation.org>;
	Sun,  9 Jun 2019 13:41:18 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Jun 2019 06:41:16 -0700
X-ExtLoop1: 1
Received: from jacob-builder.jf.intel.com ([10.7.199.155])
	by orsmga003.jf.intel.com with ESMTP; 09 Jun 2019 06:41:16 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: iommu@lists.linux-foundation.org, LKML <linux-kernel@vger.kernel.org>,
	Joerg Roedel <joro@8bytes.org>, David Woodhouse <dwmw2@infradead.org>,
	Eric Auger <eric.auger@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
Subject: [PATCH v4 03/22] iommu: Introduce device fault report API
Date: Sun,  9 Jun 2019 06:44:03 -0700
Message-Id: <1560087862-57608-4-git-send-email-jacob.jun.pan@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560087862-57608-1-git-send-email-jacob.jun.pan@linux.intel.com>
References: <1560087862-57608-1-git-send-email-jacob.jun.pan@linux.intel.com>
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Raj Ashok <ashok.raj@intel.com>,
	Andriy Shevchenko <andriy.shevchenko@linux.intel.com>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

Traditionally, device specific faults are detected and handled within
their own device drivers. When IOMMU is enabled, faults such as DMA
related transactions are detected by IOMMU. There is no generic
reporting mechanism to report faults back to the in-kernel device
driver or the guest OS in case of assigned devices.

This patch introduces a registration API for device specific fault
handlers. This differs from the existing iommu_set_fault_handler/
report_iommu_fault infrastructures in several ways:
- it allows to report more sophisticated fault events (both
  unrecoverable faults and page request faults) due to the nature
  of the iommu_fault struct
- it is device specific and not domain specific.

The current iommu_report_device_fault() implementation only handles
the "shoot and forget" unrecoverable fault case. Handling of page
request faults or stalled faults will come later.

Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
Signed-off-by: Ashok Raj <ashok.raj@intel.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 drivers/iommu/iommu.c | 127 +++++++++++++++++++++++++++++++++++++++++++++++++-
 include/linux/iommu.h |  33 ++++++++++++-
 2 files changed, 157 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 67ee662..7955184 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -644,6 +644,13 @@ int iommu_group_add_device(struct iommu_group *group, struct device *dev)
 		goto err_free_name;
 	}
 
+	dev->iommu_param = kzalloc(sizeof(*dev->iommu_param), GFP_KERNEL);
+	if (!dev->iommu_param) {
+		ret = -ENOMEM;
+		goto err_free_name;
+	}
+	mutex_init(&dev->iommu_param->lock);
+
 	kobject_get(group->devices_kobj);
 
 	dev->iommu_group = group;
@@ -674,6 +681,7 @@ int iommu_group_add_device(struct iommu_group *group, struct device *dev)
 	mutex_unlock(&group->mutex);
 	dev->iommu_group = NULL;
 	kobject_put(group->devices_kobj);
+	kfree(dev->iommu_param);
 err_free_name:
 	kfree(device->name);
 err_remove_link:
@@ -720,7 +728,7 @@ void iommu_group_remove_device(struct device *dev)
 	sysfs_remove_link(&dev->kobj, "iommu_group");
 
 	trace_remove_device_from_group(group->id, dev);
-
+	kfree(dev->iommu_param);
 	kfree(device->name);
 	kfree(device);
 	dev->iommu_group = NULL;
@@ -855,6 +863,123 @@ int iommu_group_unregister_notifier(struct iommu_group *group,
 EXPORT_SYMBOL_GPL(iommu_group_unregister_notifier);
 
 /**
+ * iommu_register_device_fault_handler() - Register a device fault handler
+ * @dev: the device
+ * @handler: the fault handler
+ * @data: private data passed as argument to the handler
+ *
+ * When an IOMMU fault event is received, this handler gets called with the
+ * fault event and data as argument.
+ *
+ * Return 0 if the fault handler was installed successfully, or an error.
+ */
+int iommu_register_device_fault_handler(struct device *dev,
+					iommu_dev_fault_handler_t handler,
+					void *data)
+{
+	struct iommu_param *param = dev->iommu_param;
+	int ret = 0;
+
+	/*
+	 * Device iommu_param should have been allocated when device is
+	 * added to its iommu_group.
+	 */
+	if (!param)
+		return -EINVAL;
+
+	mutex_lock(&param->lock);
+	/* Only allow one fault handler registered for each device */
+	if (param->fault_param) {
+		ret = -EBUSY;
+		goto done_unlock;
+	}
+
+	get_device(dev);
+	param->fault_param =
+		kzalloc(sizeof(struct iommu_fault_param), GFP_KERNEL);
+	if (!param->fault_param) {
+		put_device(dev);
+		ret = -ENOMEM;
+		goto done_unlock;
+	}
+	param->fault_param->handler = handler;
+	param->fault_param->data = data;
+
+done_unlock:
+	mutex_unlock(&param->lock);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(iommu_register_device_fault_handler);
+
+/**
+ * iommu_unregister_device_fault_handler() - Unregister the device fault handler
+ * @dev: the device
+ *
+ * Remove the device fault handler installed with
+ * iommu_register_device_fault_handler().
+ *
+ * Return 0 on success, or an error.
+ */
+int iommu_unregister_device_fault_handler(struct device *dev)
+{
+	struct iommu_param *param = dev->iommu_param;
+	int ret = 0;
+
+	if (!param)
+		return -EINVAL;
+
+	mutex_lock(&param->lock);
+
+	if (!param->fault_param)
+		goto unlock;
+
+	kfree(param->fault_param);
+	param->fault_param = NULL;
+	put_device(dev);
+unlock:
+	mutex_unlock(&param->lock);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(iommu_unregister_device_fault_handler);
+
+
+/**
+ * iommu_report_device_fault() - Report fault event to device
+ * @dev: the device
+ * @evt: fault event data
+ *
+ * Called by IOMMU drivers when a fault is detected, typically in a threaded IRQ
+ * handler.
+ *
+ * Return 0 on success, or an error.
+ */
+int iommu_report_device_fault(struct device *dev, struct iommu_fault_event *evt)
+{
+	struct iommu_param *param = dev->iommu_param;
+	struct iommu_fault_param *fparam;
+	int ret = 0;
+
+	/* iommu_param is allocated when device is added to group */
+	if (!param || !evt)
+		return -EINVAL;
+
+	/* we only report device fault if there is a handler registered */
+	mutex_lock(&param->lock);
+	fparam = param->fault_param;
+	if (!fparam || !fparam->handler) {
+		ret = -EINVAL;
+		goto done_unlock;
+	}
+	ret = fparam->handler(evt, fparam->data);
+done_unlock:
+	mutex_unlock(&param->lock);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(iommu_report_device_fault);
+
+/**
  * iommu_group_id - Return ID for a group
  * @group: the group to ID
  *
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 7890a92..b87b74c 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -322,9 +322,9 @@ struct iommu_fault_event {
 
 /**
  * struct iommu_fault_param - per-device IOMMU fault data
- * @dev_fault_handler: Callback function to handle IOMMU faults at device level
- * @data: handler private data
  *
+ * @handler: Callback function to handle IOMMU faults at device level
+ * @data: handler private data
  */
 struct iommu_fault_param {
 	iommu_dev_fault_handler_t handler;
@@ -341,6 +341,7 @@ struct iommu_fault_param {
  *	struct iommu_fwspec	*iommu_fwspec;
  */
 struct iommu_param {
+	struct mutex lock;
 	struct iommu_fault_param *fault_param;
 };
 
@@ -433,6 +434,15 @@ extern int iommu_group_register_notifier(struct iommu_group *group,
 					 struct notifier_block *nb);
 extern int iommu_group_unregister_notifier(struct iommu_group *group,
 					   struct notifier_block *nb);
+extern int iommu_register_device_fault_handler(struct device *dev,
+					iommu_dev_fault_handler_t handler,
+					void *data);
+
+extern int iommu_unregister_device_fault_handler(struct device *dev);
+
+extern int iommu_report_device_fault(struct device *dev,
+				     struct iommu_fault_event *evt);
+
 extern int iommu_group_id(struct iommu_group *group);
 extern struct iommu_group *iommu_group_get_for_dev(struct device *dev);
 extern struct iommu_domain *iommu_group_default_domain(struct iommu_group *);
@@ -741,6 +751,25 @@ static inline int iommu_group_unregister_notifier(struct iommu_group *group,
 	return 0;
 }
 
+static inline
+int iommu_register_device_fault_handler(struct device *dev,
+					iommu_dev_fault_handler_t handler,
+					void *data)
+{
+	return -ENODEV;
+}
+
+static inline int iommu_unregister_device_fault_handler(struct device *dev)
+{
+	return 0;
+}
+
+static inline
+int iommu_report_device_fault(struct device *dev, struct iommu_fault_event *evt)
+{
+	return -ENODEV;
+}
+
 static inline int iommu_group_id(struct iommu_group *group)
 {
 	return -ENODEV;
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
