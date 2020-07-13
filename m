Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B79D21D818
	for <lists.iommu@lfdr.de>; Mon, 13 Jul 2020 16:16:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E034087803;
	Mon, 13 Jul 2020 14:16:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OKMD--4PHdVy; Mon, 13 Jul 2020 14:16:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AE94687808;
	Mon, 13 Jul 2020 14:16:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 95B72C088E;
	Mon, 13 Jul 2020 14:16:00 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 49E7FC0733
 for <iommu@lists.linux-foundation.org>; Mon, 13 Jul 2020 14:15:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 2BB0223735
 for <iommu@lists.linux-foundation.org>; Mon, 13 Jul 2020 14:15:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BGG1tewAT5dE for <iommu@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 14:15:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by silver.osuosl.org (Postfix) with ESMTPS id 8197B23504
 for <iommu@lists.linux-foundation.org>; Mon, 13 Jul 2020 14:15:57 +0000 (UTC)
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 7CDD5BCC515B84495D4F;
 Mon, 13 Jul 2020 22:15:48 +0800 (CST)
Received: from kernelci-master.huawei.com (10.175.101.6) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.487.0; Mon, 13 Jul 2020 22:15:38 +0800
From: Wei Yongjun <weiyongjun1@huawei.com>
To: Hulk Robot <hulkci@huawei.com>, Joerg Roedel <joro@8bytes.org>, Eric Auger
 <eric.auger@redhat.com>, Tom Murphy <murphyt7@tcd.ie>
Subject: [PATCH -next] iommu: Make some functions static
Date: Mon, 13 Jul 2020 22:25:42 +0800
Message-ID: <20200713142542.50294-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
Cc: iommu@lists.linux-foundation.org, Wei Yongjun <weiyongjun1@huawei.com>,
 linux-kernel@vger.kernel.org
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

The sparse tool complains as follows:

drivers/iommu/iommu.c:386:5: warning:
 symbol 'iommu_insert_resv_region' was not declared. Should it be static?
drivers/iommu/iommu.c:2182:5: warning:
 symbol '__iommu_map' was not declared. Should it be static?

Those functions are not used outside of iommu.c, so mark them static.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/iommu/iommu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 1ed1e14a1f0c..40947f5bc6c5 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -383,8 +383,8 @@ static ssize_t iommu_group_show_name(struct iommu_group *group, char *buf)
  * Elements are sorted by start address and overlapping segments
  * of the same type are merged.
  */
-int iommu_insert_resv_region(struct iommu_resv_region *new,
-			     struct list_head *regions)
+static int iommu_insert_resv_region(struct iommu_resv_region *new,
+				    struct list_head *regions)
 {
 	struct iommu_resv_region *iter, *tmp, *nr, *top;
 	LIST_HEAD(stack);
@@ -2179,8 +2179,8 @@ static size_t iommu_pgsize(struct iommu_domain *domain,
 	return pgsize;
 }
 
-int __iommu_map(struct iommu_domain *domain, unsigned long iova,
-	      phys_addr_t paddr, size_t size, int prot, gfp_t gfp)
+static int __iommu_map(struct iommu_domain *domain, unsigned long iova,
+		       phys_addr_t paddr, size_t size, int prot, gfp_t gfp)
 {
 	const struct iommu_ops *ops = domain->ops;
 	unsigned long orig_iova = iova;

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
