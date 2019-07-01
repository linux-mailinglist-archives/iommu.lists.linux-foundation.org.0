Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D46856D6E
	for <lists.iommu@lfdr.de>; Wed, 26 Jun 2019 17:14:25 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 8AC96E7B;
	Wed, 26 Jun 2019 15:14:04 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 238EAE5A
	for <iommu@lists.linux-foundation.org>;
	Wed, 26 Jun 2019 15:14:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 02D3282F
	for <iommu@lists.linux-foundation.org>;
	Wed, 26 Jun 2019 15:14:01 +0000 (UTC)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 7C79BCA769915FB85BF2;
	Wed, 26 Jun 2019 23:13:57 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
	DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server
	id 14.3.439.0; Wed, 26 Jun 2019 23:13:49 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <alex.williamson@redhat.com>, <eric.auger@redhat.com>,
	<pmorel@linux.vnet.ibm.com>
Subject: [PATCH v7 6/6] vfio/type1: remove duplicate retrieval of reserved
	regions
Date: Wed, 26 Jun 2019 16:12:48 +0100
Message-ID: <20190626151248.11776-7-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20190626151248.11776-1-shameerali.kolothum.thodi@huawei.com>
References: <20190626151248.11776-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kevin.tian@intel.com, kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
	xuwei5@hisilicon.com, linuxarm@huawei.com, iommu@lists.linux-foundation.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

As we now already have the reserved regions list, just pass that into
vfio_iommu_has_sw_msi() fn.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 drivers/vfio/vfio_iommu_type1.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
index 450081802dcd..43b1e68ebce9 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -1308,15 +1308,13 @@ static struct vfio_group *find_iommu_group(struct vfio_domain *domain,
 	return NULL;
 }
 
-static bool vfio_iommu_has_sw_msi(struct iommu_group *group, phys_addr_t *base)
+static bool vfio_iommu_has_sw_msi(struct list_head *group_resv_regions,
+				  phys_addr_t *base)
 {
-	struct list_head group_resv_regions;
-	struct iommu_resv_region *region, *next;
+	struct iommu_resv_region *region;
 	bool ret = false;
 
-	INIT_LIST_HEAD(&group_resv_regions);
-	iommu_get_group_resv_regions(group, &group_resv_regions);
-	list_for_each_entry(region, &group_resv_regions, list) {
+	list_for_each_entry(region, group_resv_regions, list) {
 		/*
 		 * The presence of any 'real' MSI regions should take
 		 * precedence over the software-managed one if the
@@ -1332,8 +1330,7 @@ static bool vfio_iommu_has_sw_msi(struct iommu_group *group, phys_addr_t *base)
 			ret = true;
 		}
 	}
-	list_for_each_entry_safe(region, next, &group_resv_regions, list)
-		kfree(region);
+
 	return ret;
 }
 
@@ -1774,7 +1771,7 @@ static int vfio_iommu_type1_attach_group(void *iommu_data,
 	if (ret)
 		goto out_detach;
 
-	resv_msi = vfio_iommu_has_sw_msi(iommu_group, &resv_msi_base);
+	resv_msi = vfio_iommu_has_sw_msi(&group_resv_regions, &resv_msi_base);
 
 	INIT_LIST_HEAD(&domain->group_list);
 	list_add(&group->next, &domain->group_list);
-- 
2.17.1


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
