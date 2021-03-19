Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 56047341E3B
	for <lists.iommu@lfdr.de>; Fri, 19 Mar 2021 14:30:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0703140123;
	Fri, 19 Mar 2021 13:30:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ct_1ucrsXghe; Fri, 19 Mar 2021 13:30:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 19F13400F3;
	Fri, 19 Mar 2021 13:30:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E024DC0010;
	Fri, 19 Mar 2021 13:30:22 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4686BC0001
 for <iommu@lists.linux-foundation.org>; Fri, 19 Mar 2021 13:30:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2035840113
 for <iommu@lists.linux-foundation.org>; Fri, 19 Mar 2021 13:30:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SwccPrEBHRZV for <iommu@lists.linux-foundation.org>;
 Fri, 19 Mar 2021 13:30:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3399D400BF
 for <iommu@lists.linux-foundation.org>; Fri, 19 Mar 2021 13:30:19 +0000 (UTC)
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4F24T25scqzPkWX;
 Fri, 19 Mar 2021 21:27:50 +0800 (CST)
Received: from localhost.localdomain (10.69.192.58) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.498.0; Fri, 19 Mar 2021 21:30:07 +0800
From: John Garry <john.garry@huawei.com>
To: <joro@8bytes.org>, <will@kernel.org>, <jejb@linux.ibm.com>,
 <martin.petersen@oracle.com>, <hch@lst.de>, <m.szyprowski@samsung.com>,
 <robin.murphy@arm.com>
Subject: [PATCH 2/6] iova: Add a per-domain count of reserved nodes
Date: Fri, 19 Mar 2021 21:25:44 +0800
Message-ID: <1616160348-29451-3-git-send-email-john.garry@huawei.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1616160348-29451-1-git-send-email-john.garry@huawei.com>
References: <1616160348-29451-1-git-send-email-john.garry@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.69.192.58]
X-CFilter-Loop: Reflected
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 linux-scsi@vger.kernel.org, linuxarm@huawei.com
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

To help learn if the domain has regular IOVA nodes, add a count of
reserved nodes, calculated at init time.

Signed-off-by: John Garry <john.garry@huawei.com>
---
 drivers/iommu/iova.c | 2 ++
 include/linux/iova.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/iommu/iova.c b/drivers/iommu/iova.c
index e62e9e30b30c..cecc74fb8663 100644
--- a/drivers/iommu/iova.c
+++ b/drivers/iommu/iova.c
@@ -717,6 +717,8 @@ reserve_iova(struct iova_domain *iovad,
 	 * or need to insert remaining non overlap addr range
 	 */
 	iova = __insert_new_range(iovad, pfn_lo, pfn_hi);
+	if (iova)
+		iovad->reserved_node_count++;
 finish:
 
 	spin_unlock_irqrestore(&iovad->iova_rbtree_lock, flags);
diff --git a/include/linux/iova.h b/include/linux/iova.h
index c834c01c0a5b..fd3217a605b2 100644
--- a/include/linux/iova.h
+++ b/include/linux/iova.h
@@ -95,6 +95,7 @@ struct iova_domain {
 						   flush-queues */
 	atomic_t fq_timer_on;			/* 1 when timer is active, 0
 						   when not */
+	int reserved_node_count;
 };
 
 static inline unsigned long iova_size(struct iova *iova)
-- 
2.26.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
