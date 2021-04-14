Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 1979635ED5E
	for <lists.iommu@lfdr.de>; Wed, 14 Apr 2021 08:42:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B4F540453;
	Wed, 14 Apr 2021 06:42:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N-F9VLyeiaNZ; Wed, 14 Apr 2021 06:42:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD75440EF3;
	Wed, 14 Apr 2021 06:42:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B2992C0012;
	Wed, 14 Apr 2021 06:42:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 023B4C000A
 for <iommu@lists.linux-foundation.org>; Wed, 14 Apr 2021 06:42:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E48BB400FA
 for <iommu@lists.linux-foundation.org>; Wed, 14 Apr 2021 06:42:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Uq39K4GiAU6X for <iommu@lists.linux-foundation.org>;
 Wed, 14 Apr 2021 06:42:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1478A400F3
 for <iommu@lists.linux-foundation.org>; Wed, 14 Apr 2021 06:42:45 +0000 (UTC)
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FKtBx0wkbz18JCq;
 Wed, 14 Apr 2021 14:40:25 +0800 (CST)
Received: from localhost.localdomain (10.69.192.58) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.498.0; Wed, 14 Apr 2021 14:42:34 +0800
From: chenxiang <chenxiang66@hisilicon.com>
To: <robin.murphy@arm.com>, <will@kernel.org>, <joro@8bytes.org>
Subject: [PATCH] iommu/iova: put free_iova_mem() outside of spinlock
 iova_rbtree_lock
Date: Wed, 14 Apr 2021 14:38:27 +0800
Message-ID: <1618382307-59139-1-git-send-email-chenxiang66@hisilicon.com>
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
It has a small promote on the performance after the change.

Signed-off-by: Xiang Chen <chenxiang66@hisilicon.com>
---
 drivers/iommu/iova.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/iova.c b/drivers/iommu/iova.c
index c669526f..292ed4a 100644
--- a/drivers/iommu/iova.c
+++ b/drivers/iommu/iova.c
@@ -339,7 +339,6 @@ static void private_free_iova(struct iova_domain *iovad, struct iova *iova)
 	assert_spin_locked(&iovad->iova_rbtree_lock);
 	__cached_rbnode_delete_update(iovad, iova);
 	rb_erase(&iova->node, &iovad->rbroot);
-	free_iova_mem(iova);
 }
 
 /**
@@ -376,6 +375,7 @@ __free_iova(struct iova_domain *iovad, struct iova *iova)
 	spin_lock_irqsave(&iovad->iova_rbtree_lock, flags);
 	private_free_iova(iovad, iova);
 	spin_unlock_irqrestore(&iovad->iova_rbtree_lock, flags);
+	free_iova_mem(iova);
 }
 EXPORT_SYMBOL_GPL(__free_iova);
 
@@ -397,7 +397,7 @@ free_iova(struct iova_domain *iovad, unsigned long pfn)
 	if (iova)
 		private_free_iova(iovad, iova);
 	spin_unlock_irqrestore(&iovad->iova_rbtree_lock, flags);
-
+	free_iova_mem(iova);
 }
 EXPORT_SYMBOL_GPL(free_iova);
 
@@ -746,6 +746,7 @@ iova_magazine_free_pfns(struct iova_magazine *mag, struct iova_domain *iovad)
 			continue;
 
 		private_free_iova(iovad, iova);
+		free_iova_mem(iova);
 	}
 
 	spin_unlock_irqrestore(&iovad->iova_rbtree_lock, flags);
-- 
2.8.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
