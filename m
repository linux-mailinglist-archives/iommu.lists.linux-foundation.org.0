Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 137FB333821
	for <lists.iommu@lfdr.de>; Wed, 10 Mar 2021 10:07:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9381D6F521;
	Wed, 10 Mar 2021 09:07:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yCtBzB_8nN-h; Wed, 10 Mar 2021 09:06:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BBFC6F6A2;
	Wed, 10 Mar 2021 09:06:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 173CCC000E;
	Wed, 10 Mar 2021 09:06:59 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2F74BC0001
 for <iommu@lists.linux-foundation.org>; Wed, 10 Mar 2021 09:06:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9AC83842DB
 for <iommu@lists.linux-foundation.org>; Wed, 10 Mar 2021 09:06:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 85qmzWAloC5X for <iommu@lists.linux-foundation.org>;
 Wed, 10 Mar 2021 09:06:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E23B8842D8
 for <iommu@lists.linux-foundation.org>; Wed, 10 Mar 2021 09:06:53 +0000 (UTC)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4DwR400qkwz8vtv;
 Wed, 10 Mar 2021 17:05:04 +0800 (CST)
Received: from DESKTOP-5IS4806.china.huawei.com (10.174.184.42) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.498.0; Wed, 10 Mar 2021 17:06:26 +0800
From: Keqian Zhu <zhukeqian1@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <iommu@lists.linux-foundation.org>, Alex Williamson
 <alex.williamson@redhat.com>, Robin Murphy <robin.murphy@arm.com>, Yi Sun
 <yi.y.sun@linux.intel.com>, Will Deacon <will@kernel.org>
Subject: [PATCH v2 09/11] vfio/iommu_type1: Add HWDBM status maintanance
Date: Wed, 10 Mar 2021 17:06:12 +0800
Message-ID: <20210310090614.26668-10-zhukeqian1@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210310090614.26668-1-zhukeqian1@huawei.com>
References: <20210310090614.26668-1-zhukeqian1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.174.184.42]
X-CFilter-Loop: Reflected
Cc: Mark Rutland <mark.rutland@arm.com>, jiangkunkun@huawei.com,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Marc Zyngier <maz@kernel.org>,
 Cornelia Huck <cohuck@redhat.com>, lushenming@huawei.com,
 Kirti Wankhede <kwankhede@nvidia.com>, James Morse <james.morse@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, wanghaibin.wang@huawei.com
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

From: jiangkunkun <jiangkunkun@huawei.com>

We are going to optimize dirty log tracking based on iommu
HWDBM feature, but the dirty log from iommu is useful only
when all iommu backed groups are connected to iommu with
HWDBM feature. This maintains a counter for this feature.

Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
---

changelog:

v2:
 - Simplify vfio_group_supports_hwdbm().
 - AS feature report of HWDBM has been changed, so change vfio_dev_has_feature() to
   vfio_dev_enable_feature().

---
 drivers/vfio/vfio_iommu_type1.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
index 4bb162c1d649..876351c061e4 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -79,6 +79,7 @@ struct vfio_iommu {
 	bool			dirty_page_tracking;
 	bool			pinned_page_dirty_scope;
 	bool			container_open;
+	uint64_t		num_non_hwdbm_groups;
 };
 
 struct vfio_domain {
@@ -116,6 +117,7 @@ struct vfio_group {
 	struct list_head	next;
 	bool			mdev_group;	/* An mdev group */
 	bool			pinned_page_dirty_scope;
+	bool			iommu_hwdbm;	/* For iommu-backed group */
 };
 
 struct vfio_iova {
@@ -1187,6 +1189,24 @@ static void vfio_update_pgsize_bitmap(struct vfio_iommu *iommu)
 	}
 }
 
+static int vfio_dev_enable_feature(struct device *dev, void *data)
+{
+	enum iommu_dev_features *feat = data;
+
+	if (iommu_dev_feature_enabled(dev, *feat))
+		return 0;
+
+	return iommu_dev_enable_feature(dev, *feat);
+}
+
+static bool vfio_group_supports_hwdbm(struct vfio_group *group)
+{
+	enum iommu_dev_features feat = IOMMU_DEV_FEAT_HWDBM;
+
+	return !iommu_group_for_each_dev(group->iommu_group, &feat,
+					 vfio_dev_enable_feature);
+}
+
 static int update_user_bitmap(u64 __user *bitmap, struct vfio_iommu *iommu,
 			      struct vfio_dma *dma, dma_addr_t base_iova,
 			      size_t pgsize)
@@ -2435,6 +2455,12 @@ static int vfio_iommu_type1_attach_group(void *iommu_data,
 	 * capable via the page pinning interface.
 	 */
 	iommu->num_non_pinned_groups++;
+
+	/* Update the hwdbm status of group and iommu */
+	group->iommu_hwdbm = vfio_group_supports_hwdbm(group);
+	if (!group->iommu_hwdbm)
+		iommu->num_non_hwdbm_groups++;
+
 	mutex_unlock(&iommu->lock);
 	vfio_iommu_resv_free(&group_resv_regions);
 
@@ -2571,6 +2597,7 @@ static void vfio_iommu_type1_detach_group(void *iommu_data,
 	struct vfio_domain *domain;
 	struct vfio_group *group;
 	bool update_dirty_scope = false;
+	bool update_iommu_hwdbm = false;
 	LIST_HEAD(iova_copy);
 
 	mutex_lock(&iommu->lock);
@@ -2609,6 +2636,7 @@ static void vfio_iommu_type1_detach_group(void *iommu_data,
 
 		vfio_iommu_detach_group(domain, group);
 		update_dirty_scope = !group->pinned_page_dirty_scope;
+		update_iommu_hwdbm = !group->iommu_hwdbm;
 		list_del(&group->next);
 		kfree(group);
 		/*
@@ -2651,6 +2679,8 @@ static void vfio_iommu_type1_detach_group(void *iommu_data,
 		if (iommu->dirty_page_tracking)
 			vfio_iommu_populate_bitmap_full(iommu);
 	}
+	if (update_iommu_hwdbm)
+		iommu->num_non_hwdbm_groups--;
 	mutex_unlock(&iommu->lock);
 }
 
-- 
2.19.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
