Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 944072993F3
	for <lists.iommu@lfdr.de>; Mon, 26 Oct 2020 18:35:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 56BEC858B3;
	Mon, 26 Oct 2020 17:35:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qBs8LDwhC8XA; Mon, 26 Oct 2020 17:35:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8C4AA85B0A;
	Mon, 26 Oct 2020 17:35:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 674E8C0051;
	Mon, 26 Oct 2020 17:35:43 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 11B39C0051
 for <iommu@lists.linux-foundation.org>; Mon, 26 Oct 2020 17:35:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 0CD1685B0A
 for <iommu@lists.linux-foundation.org>; Mon, 26 Oct 2020 17:35:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ea7KSss_bSLS for <iommu@lists.linux-foundation.org>;
 Mon, 26 Oct 2020 17:35:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 5DFCF85AF1
 for <iommu@lists.linux-foundation.org>; Mon, 26 Oct 2020 17:35:40 +0000 (UTC)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CKhnT1P4ZzLnBf;
 Tue, 27 Oct 2020 01:35:41 +0800 (CST)
Received: from localhost.localdomain (10.69.192.58) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.487.0; Tue, 27 Oct 2020 01:35:29 +0800
From: John Garry <john.garry@huawei.com>
To: <joro@8bytes.org>, <robin.murphy@arm.com>
Subject: [PATCH v2 4/4] iommu: avoid taking iova_rbtree_lock twice
Date: Tue, 27 Oct 2020 01:31:41 +0800
Message-ID: <1603733501-211004-5-git-send-email-john.garry@huawei.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1603733501-211004-1-git-send-email-john.garry@huawei.com>
References: <1603733501-211004-1-git-send-email-john.garry@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.69.192.58]
X-CFilter-Loop: Reflected
Cc: linuxarm@huawei.com, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, xiyou.wangcong@gmail.com
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

From: Cong Wang <xiyou.wangcong@gmail.com>

Both find_iova() and __free_iova() take iova_rbtree_lock,
there is no reason to take and release it twice inside
free_iova().

Fold them into one critical section by calling the unlock
versions instead.

Signed-off-by: Cong Wang <xiyou.wangcong@gmail.com>
Reviewed-by: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: John Garry <john.garry@huawei.com>
---
 drivers/iommu/iova.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/iova.c b/drivers/iommu/iova.c
index 386005055aca..3b32e6746c70 100644
--- a/drivers/iommu/iova.c
+++ b/drivers/iommu/iova.c
@@ -398,10 +398,14 @@ EXPORT_SYMBOL_GPL(__free_iova);
 void
 free_iova(struct iova_domain *iovad, unsigned long pfn)
 {
-	struct iova *iova = find_iova(iovad, pfn);
+	unsigned long flags;
+	struct iova *iova;
 
+	spin_lock_irqsave(&iovad->iova_rbtree_lock, flags);
+	iova = private_find_iova(iovad, pfn);
 	if (iova)
-		__free_iova(iovad, iova);
+		private_free_iova(iovad, iova);
+	spin_unlock_irqrestore(&iovad->iova_rbtree_lock, flags);
 
 }
 EXPORT_SYMBOL_GPL(free_iova);
-- 
2.26.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
