Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 35164363C58
	for <lists.iommu@lfdr.de>; Mon, 19 Apr 2021 09:18:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B66A7606D6;
	Mon, 19 Apr 2021 07:18:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S6PP9awUaaIC; Mon, 19 Apr 2021 07:18:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id C29E96060D;
	Mon, 19 Apr 2021 07:18:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 950C2C001B;
	Mon, 19 Apr 2021 07:18:03 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5BE33C000B
 for <iommu@lists.linux-foundation.org>; Mon, 19 Apr 2021 07:18:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 427B140377
 for <iommu@lists.linux-foundation.org>; Mon, 19 Apr 2021 07:18:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 80noyFUecK9q for <iommu@lists.linux-foundation.org>;
 Mon, 19 Apr 2021 07:17:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2177E40360
 for <iommu@lists.linux-foundation.org>; Mon, 19 Apr 2021 07:17:57 +0000 (UTC)
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FNyl915z9z16LC6;
 Mon, 19 Apr 2021 15:15:33 +0800 (CST)
Received: from localhost.localdomain (10.69.192.58) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.498.0; Mon, 19 Apr 2021 15:17:48 +0800
From: chenxiang <chenxiang66@hisilicon.com>
To: <robin.murphy@arm.com>, <will@kernel.org>, <joro@8bytes.org>
Subject: [PATCH v3] iommu/iova: put free_iova_mem() outside of spinlock
 iova_rbtree_lock
Date: Mon, 19 Apr 2021 15:13:35 +0800
Message-ID: <1618816415-95649-1-git-send-email-chenxiang66@hisilicon.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
X-Originating-IP: [10.69.192.58]
X-CFilter-Loop: Reflected
Cc: iommu@lists.linux-foundation.org, linuxarm@openeuler.org,
 linuxarm@huawei.com
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

From: Xiang Chen <chenxiang66@hisilicon.com>

It is not necessary to put free_iova_mem() inside of spinlock/unlock
iova_rbtree_lock which only leads to more completion for the spinlock.
It has a small promote on the performance after the change. And also
rename private_free_iova() as remove_iova() because the function will not
free iova after that change.

Signed-off-by: Xiang Chen <chenxiang66@hisilicon.com>
---
 drivers/iommu/iova.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/iova.c b/drivers/iommu/iova.c
index b7ecd5b..b6cf5f1 100644
--- a/drivers/iommu/iova.c
+++ b/drivers/iommu/iova.c
@@ -412,12 +412,11 @@ private_find_iova(struct iova_domain *iovad, unsigned long pfn)
 	return NULL;
 }
 
-static void private_free_iova(struct iova_domain *iovad, struct iova *iova)
+static void remove_iova(struct iova_domain *iovad, struct iova *iova)
 {
 	assert_spin_locked(&iovad->iova_rbtree_lock);
 	__cached_rbnode_delete_update(iovad, iova);
 	rb_erase(&iova->node, &iovad->rbroot);
-	free_iova_mem(iova);
 }
 
 /**
@@ -452,8 +451,9 @@ __free_iova(struct iova_domain *iovad, struct iova *iova)
 	unsigned long flags;
 
 	spin_lock_irqsave(&iovad->iova_rbtree_lock, flags);
-	private_free_iova(iovad, iova);
+	remove_iova(iovad, iova);
 	spin_unlock_irqrestore(&iovad->iova_rbtree_lock, flags);
+	free_iova_mem(iova);
 }
 EXPORT_SYMBOL_GPL(__free_iova);
 
@@ -472,10 +472,13 @@ free_iova(struct iova_domain *iovad, unsigned long pfn)
 
 	spin_lock_irqsave(&iovad->iova_rbtree_lock, flags);
 	iova = private_find_iova(iovad, pfn);
-	if (iova)
-		private_free_iova(iovad, iova);
+	if (!iova) {
+		spin_unlock_irqrestore(&iovad->iova_rbtree_lock, flags);
+		return;
+	}
+	remove_iova(iovad, iova);
 	spin_unlock_irqrestore(&iovad->iova_rbtree_lock, flags);
-
+	free_iova_mem(iova);
 }
 EXPORT_SYMBOL_GPL(free_iova);
 
@@ -825,7 +828,8 @@ iova_magazine_free_pfns(struct iova_magazine *mag, struct iova_domain *iovad)
 		if (WARN_ON(!iova))
 			continue;
 
-		private_free_iova(iovad, iova);
+		remove_iova(iovad, iova);
+		free_iova_mem(iova);
 	}
 
 	spin_unlock_irqrestore(&iovad->iova_rbtree_lock, flags);
-- 
2.8.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
