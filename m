Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 692F320BDE1
	for <lists.iommu@lfdr.de>; Sat, 27 Jun 2020 05:19:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5FA3588298;
	Sat, 27 Jun 2020 03:19:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sqXJYiLkVYfF; Sat, 27 Jun 2020 03:19:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 39C6B88295;
	Sat, 27 Jun 2020 03:19:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1B81EC016F;
	Sat, 27 Jun 2020 03:19:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 11B5AC016F
 for <iommu@lists.linux-foundation.org>; Sat, 27 Jun 2020 03:19:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id EDAD9882A1
 for <iommu@lists.linux-foundation.org>; Sat, 27 Jun 2020 03:19:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7x0ulVLUWNzX for <iommu@lists.linux-foundation.org>;
 Sat, 27 Jun 2020 03:19:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by hemlock.osuosl.org (Postfix) with ESMTPS id BF3E38829A
 for <iommu@lists.linux-foundation.org>; Sat, 27 Jun 2020 03:19:48 +0000 (UTC)
IronPort-SDR: CW5jlbgFd1+/CGUOmyZT5nst06eCb7Um7HdLLNvOacQZ6G+LoqLxetgPFTdVYjn1LPtZCvtQ2l
 UywlfVtm7muA==
X-IronPort-AV: E=McAfee;i="6000,8403,9664"; a="143799264"
X-IronPort-AV: E=Sophos;i="5.75,286,1589266800"; d="scan'208";a="143799264"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2020 20:19:47 -0700
IronPort-SDR: qY7Jeb0gjAhCYKqtByIdcIK5OQ+iplSWB3X3cDvSESt7Dti7Yy0tRrjx9TsUe4kK0esTBPdZ6f
 m+bf/00U1rBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,286,1589266800"; d="scan'208";a="302510424"
Received: from allen-box.sh.intel.com ([10.239.159.139])
 by fmsmga004.fm.intel.com with ESMTP; 26 Jun 2020 20:19:45 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>,
 Alex Williamson <alex.williamson@redhat.com>
Subject: [PATCH 1/2] iommu: Add iommu_group_get/set_domain()
Date: Sat, 27 Jun 2020 11:15:31 +0800
Message-Id: <20200627031532.28046-1-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: Kevin Tian <kevin.tian@intel.com>, Dave Jiang <dave.jiang@intel.com>,
 Ashok Raj <ashok.raj@intel.com>, kvm@vger.kernel.org,
 Cornelia Huck <cohuck@redhat.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org
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

The hardware assistant vfio mediated device is a use case of iommu
aux-domain. The interactions between vfio/mdev and iommu during mdev
creation and passthr are:

- Create a group for mdev with iommu_group_alloc();
- Add the device to the group with
        group = iommu_group_alloc();
        if (IS_ERR(group))
                return PTR_ERR(group);

        ret = iommu_group_add_device(group, &mdev->dev);
        if (!ret)
                dev_info(&mdev->dev, "MDEV: group_id = %d\n",
                         iommu_group_id(group));
- Allocate an aux-domain
	iommu_domain_alloc()
- Attach the aux-domain to the physical device from which the mdev is
  created.
	iommu_aux_attach_device()

In the whole process, an iommu group was allocated for the mdev and an
iommu domain was attached to the group, but the group->domain leaves
NULL. As the result, iommu_get_domain_for_dev() doesn't work anymore.

This adds iommu_group_get/set_domain() so that group->domain could be
managed whenever a domain is attached or detached through the aux-domain
api's.

Fixes: 7bd50f0cd2fd5 ("vfio/type1: Add domain at(de)taching group helpers")
Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/iommu/iommu.c | 28 ++++++++++++++++++++++++++++
 include/linux/iommu.h | 14 ++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index d43120eb1dc5..e2b665303d70 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -715,6 +715,34 @@ int iommu_group_set_name(struct iommu_group *group, const char *name)
 }
 EXPORT_SYMBOL_GPL(iommu_group_set_name);
 
+/**
+ * iommu_group_get_domain - get domain of a group
+ * @group: the group
+ *
+ * This is called to get the domain of a group.
+ */
+struct iommu_domain *iommu_group_get_domain(struct iommu_group *group)
+{
+	return group->domain;
+}
+EXPORT_SYMBOL_GPL(iommu_group_get_domain);
+
+/**
+ * iommu_group_set_domain - set domain for a group
+ * @group: the group
+ * @domain: iommu domain
+ *
+ * This is called to set the domain for a group. In aux-domain case, a domain
+ * might attach or detach to an iommu group through the aux-domain apis, but
+ * the group->domain doesn't get a chance to be updated there.
+ */
+void iommu_group_set_domain(struct iommu_group *group,
+			    struct iommu_domain *domain)
+{
+	group->domain = domain;
+}
+EXPORT_SYMBOL_GPL(iommu_group_set_domain);
+
 static int iommu_create_device_direct_mappings(struct iommu_group *group,
 					       struct device *dev)
 {
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 5f0b7859d2eb..ff88d548a870 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -496,6 +496,9 @@ extern void iommu_group_set_iommudata(struct iommu_group *group,
 				      void *iommu_data,
 				      void (*release)(void *iommu_data));
 extern int iommu_group_set_name(struct iommu_group *group, const char *name);
+extern struct iommu_domain *iommu_group_get_domain(struct iommu_group *group);
+extern void iommu_group_set_domain(struct iommu_group *group,
+				   struct iommu_domain *domain);
 extern int iommu_group_add_device(struct iommu_group *group,
 				  struct device *dev);
 extern void iommu_group_remove_device(struct device *dev);
@@ -840,6 +843,17 @@ static inline int iommu_group_set_name(struct iommu_group *group,
 	return -ENODEV;
 }
 
+static inline
+struct iommu_domain *iommu_group_get_domain(struct iommu_group *group)
+{
+	return NULL;
+}
+
+static inline void iommu_group_set_domain(struct iommu_group *group,
+					  struct iommu_domain *domain)
+{
+}
+
 static inline int iommu_group_add_device(struct iommu_group *group,
 					 struct device *dev)
 {
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
