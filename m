Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE802EC980
	for <lists.iommu@lfdr.de>; Thu,  7 Jan 2021 05:44:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0D8DC8692E;
	Thu,  7 Jan 2021 04:44:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U7sJ7vWO94GL; Thu,  7 Jan 2021 04:44:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 56AE68691C;
	Thu,  7 Jan 2021 04:44:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3657BC0891;
	Thu,  7 Jan 2021 04:44:41 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C1177C013A
 for <iommu@lists.linux-foundation.org>; Thu,  7 Jan 2021 04:44:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B4598860C2
 for <iommu@lists.linux-foundation.org>; Thu,  7 Jan 2021 04:44:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6e0ML-3yHxcB for <iommu@lists.linux-foundation.org>;
 Thu,  7 Jan 2021 04:44:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 6089786090
 for <iommu@lists.linux-foundation.org>; Thu,  7 Jan 2021 04:44:37 +0000 (UTC)
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4DBDC85hsHzj2pY;
 Thu,  7 Jan 2021 12:43:48 +0800 (CST)
Received: from DESKTOP-5IS4806.china.huawei.com (10.174.184.42) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.498.0; Thu, 7 Jan 2021 12:44:26 +0800
From: Keqian Zhu <zhukeqian1@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <iommu@lists.linux-foundation.org>, <kvm@vger.kernel.org>,
 <kvmarm@lists.cs.columbia.edu>, Alex Williamson <alex.williamson@redhat.com>, 
 Cornelia Huck <cohuck@redhat.com>, Will Deacon <will@kernel.org>, "Marc
 Zyngier" <maz@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>
Subject: [PATCH 1/6] vfio/iommu_type1: Make an explicit "promote" semantic
Date: Thu, 7 Jan 2021 12:43:56 +0800
Message-ID: <20210107044401.19828-2-zhukeqian1@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210107044401.19828-1-zhukeqian1@huawei.com>
References: <20210107044401.19828-1-zhukeqian1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.174.184.42]
X-CFilter-Loop: Reflected
Cc: Mark Rutland <mark.rutland@arm.com>, jiangkunkun@huawei.com,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Daniel
 Lezcano <daniel.lezcano@linaro.org>, Alexios Zavras <alexios.zavras@intel.com>,
 James Morse <james.morse@arm.com>, wanghaibin.wang@huawei.com,
 Thomas Gleixner <tglx@linutronix.de>, Robin Murphy <robin.murphy@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Julien Thierry <julien.thierry.kdev@gmail.com>
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

When we want to promote the pinned_page_dirty_scope of vfio_iommu,
we call the "update" function to visit all vfio_group, but when we
want to downgrade this, we can set the flag as false directly.

So we'd better make an explicit "promote" semantic to the "update"
function. BTW, if vfio_iommu already has been promoted, then return
early.

Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
---
 drivers/vfio/vfio_iommu_type1.c | 30 ++++++++++++++----------------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
index 0b4dedaa9128..334a8240e1da 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -148,7 +148,7 @@ static int put_pfn(unsigned long pfn, int prot);
 static struct vfio_group *vfio_iommu_find_iommu_group(struct vfio_iommu *iommu,
 					       struct iommu_group *iommu_group);
 
-static void update_pinned_page_dirty_scope(struct vfio_iommu *iommu);
+static void promote_pinned_page_dirty_scope(struct vfio_iommu *iommu);
 /*
  * This code handles mapping and unmapping of user data buffers
  * into DMA'ble space using the IOMMU
@@ -714,7 +714,7 @@ static int vfio_iommu_type1_pin_pages(void *iommu_data,
 	group = vfio_iommu_find_iommu_group(iommu, iommu_group);
 	if (!group->pinned_page_dirty_scope) {
 		group->pinned_page_dirty_scope = true;
-		update_pinned_page_dirty_scope(iommu);
+		promote_pinned_page_dirty_scope(iommu);
 	}
 
 	goto pin_done;
@@ -1622,27 +1622,26 @@ static struct vfio_group *vfio_iommu_find_iommu_group(struct vfio_iommu *iommu,
 	return group;
 }
 
-static void update_pinned_page_dirty_scope(struct vfio_iommu *iommu)
+static void promote_pinned_page_dirty_scope(struct vfio_iommu *iommu)
 {
 	struct vfio_domain *domain;
 	struct vfio_group *group;
 
+	if (iommu->pinned_page_dirty_scope)
+		return;
+
 	list_for_each_entry(domain, &iommu->domain_list, next) {
 		list_for_each_entry(group, &domain->group_list, next) {
-			if (!group->pinned_page_dirty_scope) {
-				iommu->pinned_page_dirty_scope = false;
+			if (!group->pinned_page_dirty_scope)
 				return;
-			}
 		}
 	}
 
 	if (iommu->external_domain) {
 		domain = iommu->external_domain;
 		list_for_each_entry(group, &domain->group_list, next) {
-			if (!group->pinned_page_dirty_scope) {
-				iommu->pinned_page_dirty_scope = false;
+			if (!group->pinned_page_dirty_scope)
 				return;
-			}
 		}
 	}
 
@@ -2057,8 +2056,7 @@ static int vfio_iommu_type1_attach_group(void *iommu_data,
 			 * addition of a dirty tracking group.
 			 */
 			group->pinned_page_dirty_scope = true;
-			if (!iommu->pinned_page_dirty_scope)
-				update_pinned_page_dirty_scope(iommu);
+			promote_pinned_page_dirty_scope(iommu);
 			mutex_unlock(&iommu->lock);
 
 			return 0;
@@ -2341,7 +2339,7 @@ static void vfio_iommu_type1_detach_group(void *iommu_data,
 	struct vfio_iommu *iommu = iommu_data;
 	struct vfio_domain *domain;
 	struct vfio_group *group;
-	bool update_dirty_scope = false;
+	bool promote_dirty_scope = false;
 	LIST_HEAD(iova_copy);
 
 	mutex_lock(&iommu->lock);
@@ -2349,7 +2347,7 @@ static void vfio_iommu_type1_detach_group(void *iommu_data,
 	if (iommu->external_domain) {
 		group = find_iommu_group(iommu->external_domain, iommu_group);
 		if (group) {
-			update_dirty_scope = !group->pinned_page_dirty_scope;
+			promote_dirty_scope = !group->pinned_page_dirty_scope;
 			list_del(&group->next);
 			kfree(group);
 
@@ -2379,7 +2377,7 @@ static void vfio_iommu_type1_detach_group(void *iommu_data,
 			continue;
 
 		vfio_iommu_detach_group(domain, group);
-		update_dirty_scope = !group->pinned_page_dirty_scope;
+		promote_dirty_scope = !group->pinned_page_dirty_scope;
 		list_del(&group->next);
 		kfree(group);
 		/*
@@ -2415,8 +2413,8 @@ static void vfio_iommu_type1_detach_group(void *iommu_data,
 	 * Removal of a group without dirty tracking may allow the iommu scope
 	 * to be promoted.
 	 */
-	if (update_dirty_scope)
-		update_pinned_page_dirty_scope(iommu);
+	if (promote_dirty_scope)
+		promote_pinned_page_dirty_scope(iommu);
 	mutex_unlock(&iommu->lock);
 }
 
-- 
2.19.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
