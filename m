Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id B3770173ABD
	for <lists.iommu@lfdr.de>; Fri, 28 Feb 2020 16:08:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6287D88185;
	Fri, 28 Feb 2020 15:08:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mlQqYzher7Nk; Fri, 28 Feb 2020 15:08:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B0DF58817F;
	Fri, 28 Feb 2020 15:08:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A5D2EC1D85;
	Fri, 28 Feb 2020 15:08:37 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DCDB7C1D84;
 Fri, 28 Feb 2020 15:08:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C0BC286AB3;
 Fri, 28 Feb 2020 15:08:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X8iAOwpyI304; Fri, 28 Feb 2020 15:08:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 181D386CBB;
 Fri, 28 Feb 2020 15:08:34 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 64F0E50C; Fri, 28 Feb 2020 16:08:29 +0100 (CET)
From: Joerg Roedel <joro@8bytes.org>
To: iommu@lists.linux-foundation.org
Subject: [PATCH 05/14] iommu: Rename struct iommu_param to dev_iommu
Date: Fri, 28 Feb 2020 16:08:11 +0100
Message-Id: <20200228150820.15340-6-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200228150820.15340-1-joro@8bytes.org>
References: <20200228150820.15340-1-joro@8bytes.org>
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
 Sudeep Holla <sudeep.holla@arm.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-mediatek@lists.infradead.org,
 Andy Gross <agross@kernel.org>, Joerg Roedel <jroedel@suse.de>,
 Hanjun Guo <guohanjun@huawei.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

From: Joerg Roedel <jroedel@suse.de>

The term dev_iommu aligns better with other existing structures and
their accessor functions.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 drivers/iommu/iommu.c  | 28 ++++++++++++++--------------
 include/linux/device.h |  6 +++---
 include/linux/iommu.h  |  4 ++--
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 3e3528436e0b..beac2ef063dd 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -152,9 +152,9 @@ void iommu_device_unregister(struct iommu_device *iommu)
 }
 EXPORT_SYMBOL_GPL(iommu_device_unregister);
 
-static struct iommu_param *iommu_get_dev_param(struct device *dev)
+static struct dev_iommu *dev_iommu_get(struct device *dev)
 {
-	struct iommu_param *param = dev->iommu_param;
+	struct dev_iommu *param = dev->iommu;
 
 	if (param)
 		return param;
@@ -164,14 +164,14 @@ static struct iommu_param *iommu_get_dev_param(struct device *dev)
 		return NULL;
 
 	mutex_init(&param->lock);
-	dev->iommu_param = param;
+	dev->iommu = param;
 	return param;
 }
 
-static void iommu_free_dev_param(struct device *dev)
+static void dev_iommu_free(struct device *dev)
 {
-	kfree(dev->iommu_param);
-	dev->iommu_param = NULL;
+	kfree(dev->iommu);
+	dev->iommu = NULL;
 }
 
 int iommu_probe_device(struct device *dev)
@@ -183,7 +183,7 @@ int iommu_probe_device(struct device *dev)
 	if (!ops)
 		return -EINVAL;
 
-	if (!iommu_get_dev_param(dev))
+	if (!dev_iommu_get(dev))
 		return -ENOMEM;
 
 	if (!try_module_get(ops->owner)) {
@@ -200,7 +200,7 @@ int iommu_probe_device(struct device *dev)
 err_module_put:
 	module_put(ops->owner);
 err_free_dev_param:
-	iommu_free_dev_param(dev);
+	dev_iommu_free(dev);
 	return ret;
 }
 
@@ -211,9 +211,9 @@ void iommu_release_device(struct device *dev)
 	if (dev->iommu_group)
 		ops->remove_device(dev);
 
-	if (dev->iommu_param) {
+	if (dev->iommu) {
 		module_put(ops->owner);
-		iommu_free_dev_param(dev);
+		dev_iommu_free(dev);
 	}
 }
 
@@ -972,7 +972,7 @@ int iommu_register_device_fault_handler(struct device *dev,
 					iommu_dev_fault_handler_t handler,
 					void *data)
 {
-	struct iommu_param *param = dev->iommu_param;
+	struct dev_iommu *param = dev->iommu;
 	int ret = 0;
 
 	if (!param)
@@ -1015,7 +1015,7 @@ EXPORT_SYMBOL_GPL(iommu_register_device_fault_handler);
  */
 int iommu_unregister_device_fault_handler(struct device *dev)
 {
-	struct iommu_param *param = dev->iommu_param;
+	struct dev_iommu *param = dev->iommu;
 	int ret = 0;
 
 	if (!param)
@@ -1055,7 +1055,7 @@ EXPORT_SYMBOL_GPL(iommu_unregister_device_fault_handler);
  */
 int iommu_report_device_fault(struct device *dev, struct iommu_fault_event *evt)
 {
-	struct iommu_param *param = dev->iommu_param;
+	struct dev_iommu *param = dev->iommu;
 	struct iommu_fault_event *evt_pending = NULL;
 	struct iommu_fault_param *fparam;
 	int ret = 0;
@@ -1104,7 +1104,7 @@ int iommu_page_response(struct device *dev,
 	int ret = -EINVAL;
 	struct iommu_fault_event *evt;
 	struct iommu_fault_page_request *prm;
-	struct iommu_param *param = dev->iommu_param;
+	struct dev_iommu *param = dev->iommu;
 	struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
 
 	if (!domain || !domain->ops->page_response)
diff --git a/include/linux/device.h b/include/linux/device.h
index 0cd7c647c16c..af621f9fe85b 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -44,7 +44,7 @@ struct iommu_ops;
 struct iommu_group;
 struct iommu_fwspec;
 struct dev_pin_info;
-struct iommu_param;
+struct dev_iommu;
 
 /**
  * struct subsys_interface - interfaces to device functions
@@ -514,7 +514,7 @@ struct dev_links_info {
  * 		device (i.e. the bus driver that discovered the device).
  * @iommu_group: IOMMU group the device belongs to.
  * @iommu_fwspec: IOMMU-specific properties supplied by firmware.
- * @iommu_param: Per device generic IOMMU runtime data
+ * @iommu:	Per device generic IOMMU runtime data
  *
  * @offline_disabled: If set, the device is permanently online.
  * @offline:	Set after successful invocation of bus type's .offline().
@@ -614,7 +614,7 @@ struct device {
 	void	(*release)(struct device *dev);
 	struct iommu_group	*iommu_group;
 	struct iommu_fwspec	*iommu_fwspec;
-	struct iommu_param	*iommu_param;
+	struct dev_iommu	*iommu;
 
 	bool			offline_disabled:1;
 	bool			offline:1;
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index d1b5f4d98569..a2dc84183fce 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -365,7 +365,7 @@ struct iommu_fault_param {
 };
 
 /**
- * struct iommu_param - collection of per-device IOMMU data
+ * struct dev_iommu - Collection of per-device IOMMU data
  *
  * @fault_param: IOMMU detected device fault reporting data
  *
@@ -373,7 +373,7 @@ struct iommu_fault_param {
  *	struct iommu_group	*iommu_group;
  *	struct iommu_fwspec	*iommu_fwspec;
  */
-struct iommu_param {
+struct dev_iommu {
 	struct mutex lock;
 	struct iommu_fault_param *fault_param;
 };
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
