Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC2756D67
	for <lists.iommu@lfdr.de>; Wed, 26 Jun 2019 17:14:08 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 30D50E6F;
	Wed, 26 Jun 2019 15:13:58 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 5A537AC7
	for <iommu@lists.linux-foundation.org>;
	Wed, 26 Jun 2019 15:13:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id D1E0B880
	for <iommu@lists.linux-foundation.org>;
	Wed, 26 Jun 2019 15:13:55 +0000 (UTC)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 6AF3767679FA3F4B31A8;
	Wed, 26 Jun 2019 23:13:52 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
	DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server
	id 14.3.439.0; Wed, 26 Jun 2019 23:13:42 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <alex.williamson@redhat.com>, <eric.auger@redhat.com>,
	<pmorel@linux.vnet.ibm.com>
Subject: [PATCH v7 4/6] vfio/type1: check dma map request is within a valid
	iova range
Date: Wed, 26 Jun 2019 16:12:46 +0100
Message-ID: <20190626151248.11776-5-shameerali.kolothum.thodi@huawei.com>
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

This checks and rejects any dma map request outside valid iova
range.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
v6 --> v7

Addressed the case where a container with only an mdev device will
have an empty list(Suggested by Alex).
---
 drivers/vfio/vfio_iommu_type1.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
index e872fb3a0f39..89ad0da7152c 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -1050,6 +1050,27 @@ static int vfio_pin_map_dma(struct vfio_iommu *iommu, struct vfio_dma *dma,
 	return ret;
 }
 
+/*
+ * Check dma map request is within a valid iova range
+ */
+static bool vfio_iommu_iova_dma_valid(struct vfio_iommu *iommu,
+				      dma_addr_t start, dma_addr_t end)
+{
+	struct list_head *iova = &iommu->iova_list;
+	struct vfio_iova *node;
+
+	list_for_each_entry(node, iova, list) {
+		if (start >= node->start && end <= node->end)
+			return true;
+	}
+
+	/*
+	 * Check for list_empty() as well since a container with
+	 * only an mdev device will have an empty list.
+	 */
+	return list_empty(&iommu->iova_list);
+}
+
 static int vfio_dma_do_map(struct vfio_iommu *iommu,
 			   struct vfio_iommu_type1_dma_map *map)
 {
@@ -1093,6 +1114,11 @@ static int vfio_dma_do_map(struct vfio_iommu *iommu,
 		goto out_unlock;
 	}
 
+	if (!vfio_iommu_iova_dma_valid(iommu, iova, iova + size - 1)) {
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+
 	dma = kzalloc(sizeof(*dma), GFP_KERNEL);
 	if (!dma) {
 		ret = -ENOMEM;
-- 
2.17.1


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
