Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CCE18C977
	for <lists.iommu@lfdr.de>; Fri, 20 Mar 2020 10:04:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id DFD20889B7;
	Fri, 20 Mar 2020 09:04:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WIBacEoun7Ul; Fri, 20 Mar 2020 09:04:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 191A7889C0;
	Fri, 20 Mar 2020 09:04:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C2DBCC07FF;
	Fri, 20 Mar 2020 09:04:01 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EF04CC1D85
 for <iommu@lists.linux-foundation.org>; Fri, 20 Mar 2020 09:03:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D72D387493
 for <iommu@lists.linux-foundation.org>; Fri, 20 Mar 2020 09:03:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hAUreoU9-vPj for <iommu@lists.linux-foundation.org>;
 Fri, 20 Mar 2020 09:03:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0AE5E874A6
 for <iommu@lists.linux-foundation.org>; Fri, 20 Mar 2020 09:03:30 +0000 (UTC)
IronPort-SDR: KY7KQOlkNjU1fZXgrLLbXTxi/uqZAHEmesYAiBWrufzMd4RB4CLB8j2GcB+GrPM16qZQecV5xJ
 ypSj68TPQw3Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2020 02:03:29 -0700
IronPort-SDR: zNkdoaVksLZ1cz81JsKf42P2+/uCowOf5/DRkyBsP1cUR4ySS9ws0vO+qN38OuUynrFrKUznXI
 rITpAngY4DnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,284,1580803200"; d="scan'208";a="264011843"
Received: from allen-box.sh.intel.com ([10.239.159.139])
 by orsmga002.jf.intel.com with ESMTP; 20 Mar 2020 02:03:27 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH v3 1/1] iommu: Configure default domain with def_domain_type
Date: Fri, 20 Mar 2020 17:00:55 +0800
Message-Id: <20200320090055.11945-1-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: iommu@lists.linux-foundation.org
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

With the def_domain_type introduced, iommu default domain framework
is now able to determine a proper default domain for a group. Let's
use this to configure a group's default domain.

If unlikely a device requires a special default domain type other
than that in use, iommu probe procedure will either allocate a new
domain according to the specified domain type, or (if the group has
other devices sitting in it) change the default domain. The vendor
iommu driver which exposes the def_domain_type callback should
guarantee that there're no multiple devices in a same group requires
differnt types of default domain.

Signed-off-by: Sai Praneeth Prakhya <sai.praneeth.prakhya@intel.com>
Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/iommu/iommu.c | 103 ++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 100 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 3e3528436e0b..8db670196706 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -1361,6 +1361,89 @@ struct iommu_group *fsl_mc_device_group(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(fsl_mc_device_group);
 
+static int pre_def_domain_change(struct device *dev, void *data)
+{
+	struct iommu_group *group = data;
+
+	if (device_is_bound(dev))
+		return -EINVAL;
+
+	return iommu_group_create_direct_mappings(group, dev);
+}
+
+static int post_def_domain_change(struct device *dev, void *data)
+{
+	struct iommu_domain *domain = data;
+
+	return domain->ops->add_device(dev);
+}
+
+/**
+ * Changes the default domain of a group
+ *
+ * @group: The group for which the default domain should be changed
+ * @type: The new default domain type
+ *
+ * The caller should hold the group->mutex before call into this function.
+ * Returns 0 on success and error code on failure.
+ */
+static int iommu_group_change_def_domain(struct iommu_group *group, int type)
+{
+	struct iommu_domain *new, *old;
+	const struct iommu_ops *ops;
+	int ret;
+
+	if ((type != IOMMU_DOMAIN_IDENTITY && type != IOMMU_DOMAIN_DMA) ||
+	    !group->default_domain || type == group->default_domain->type ||
+	    !group->default_domain->ops)
+		return -EINVAL;
+
+	if (group->domain != group->default_domain)
+		return -EBUSY;
+
+	iommu_group_ref_get(group);
+	old = group->default_domain;
+	ops = group->default_domain->ops;
+
+	/* Allocate a new domain of requested type. */
+	new = ops->domain_alloc(type);
+	if (!new) {
+		iommu_group_put(group);
+		return -ENOMEM;
+	}
+	new->type = type;
+	new->ops = ops;
+	new->pgsize_bitmap = old->pgsize_bitmap;
+	group->default_domain = new;
+	group->domain = new;
+
+	ret = __iommu_group_for_each_dev(group, group, pre_def_domain_change);
+	if (ret)
+		goto err_out;
+
+	ret = __iommu_attach_group(new, group);
+	if (ret)
+		goto err_out;
+
+	ret = __iommu_group_for_each_dev(group, new, post_def_domain_change);
+	if (ret)
+		goto err_out;
+
+	iommu_domain_free(old);
+	iommu_group_put(group);
+
+	return 0;
+
+err_out:
+	group->default_domain = old;
+	group->domain = old;
+	__iommu_attach_group(old, group);
+	iommu_domain_free(new);
+	iommu_group_put(group);
+
+	return ret;
+}
+
 /**
  * iommu_group_get_for_dev - Find or create the IOMMU group for a device
  * @dev: target device
@@ -1375,6 +1458,7 @@ struct iommu_group *iommu_group_get_for_dev(struct device *dev)
 {
 	const struct iommu_ops *ops = dev->bus->iommu_ops;
 	struct iommu_group *group;
+	int dev_def_type = 0;
 	int ret;
 
 	group = iommu_group_get(dev);
@@ -1391,20 +1475,24 @@ struct iommu_group *iommu_group_get_for_dev(struct device *dev)
 	if (IS_ERR(group))
 		return group;
 
+	if (ops->def_domain_type)
+		dev_def_type = ops->def_domain_type(dev);
+
 	/*
 	 * Try to allocate a default domain - needs support from the
 	 * IOMMU driver.
 	 */
 	if (!group->default_domain) {
 		struct iommu_domain *dom;
+		int type = dev_def_type ? : iommu_def_domain_type;
 
-		dom = __iommu_domain_alloc(dev->bus, iommu_def_domain_type);
-		if (!dom && iommu_def_domain_type != IOMMU_DOMAIN_DMA) {
+		dom = __iommu_domain_alloc(dev->bus, type);
+		if (!dom && type != IOMMU_DOMAIN_DMA) {
 			dom = __iommu_domain_alloc(dev->bus, IOMMU_DOMAIN_DMA);
 			if (dom) {
 				dev_warn(dev,
 					 "failed to allocate default IOMMU domain of type %u; falling back to IOMMU_DOMAIN_DMA",
-					 iommu_def_domain_type);
+					 type);
 			}
 		}
 
@@ -1418,6 +1506,15 @@ struct iommu_group *iommu_group_get_for_dev(struct device *dev)
 					      DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE,
 					      &attr);
 		}
+	} else if (dev_def_type &&
+		   dev_def_type != group->default_domain->type) {
+		mutex_lock(&group->mutex);
+		ret = iommu_group_change_def_domain(group, dev_def_type);
+		mutex_unlock(&group->mutex);
+		if (ret) {
+			iommu_group_put(group);
+			return ERR_PTR(ret);
+		}
 	}
 
 	ret = iommu_group_add_device(group, dev);
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
