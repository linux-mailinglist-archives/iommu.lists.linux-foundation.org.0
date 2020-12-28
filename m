Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 973A22E3B65
	for <lists.iommu@lfdr.de>; Mon, 28 Dec 2020 14:51:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0823F870A0;
	Mon, 28 Dec 2020 13:51:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0kW3TcVcS7HV; Mon, 28 Dec 2020 13:50:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id DC72A87035;
	Mon, 28 Dec 2020 13:50:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CB196C0891;
	Mon, 28 Dec 2020 13:50:57 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 94DCBC0891
 for <iommu@lists.linux-foundation.org>; Mon, 28 Dec 2020 13:50:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 78F9B85E0B
 for <iommu@lists.linux-foundation.org>; Mon, 28 Dec 2020 13:50:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yw4nRbDtnc3r for <iommu@lists.linux-foundation.org>;
 Mon, 28 Dec 2020 13:50:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0F3E185DF4
 for <iommu@lists.linux-foundation.org>; Mon, 28 Dec 2020 13:50:54 +0000 (UTC)
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4D4Jnf3ZXYzMBT8;
 Mon, 28 Dec 2020 21:49:42 +0800 (CST)
Received: from ubuntu.network (10.175.138.68) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.498.0; Mon, 28 Dec 2020 21:50:33 +0800
From: Zheng Yongjun <zhengyongjun3@huawei.com>
To: <joro@8bytes.org>, <will@kernel.org>, <iommu@lists.linux-foundation.org>, 
 <linux-kernel@vger.kernel.org>
Subject: [PATCH -next] iommu: amd: Use DEFINE_SPINLOCK() for spinlock
Date: Mon, 28 Dec 2020 21:51:12 +0800
Message-ID: <20201228135112.28621-1-zhengyongjun3@huawei.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Originating-IP: [10.175.138.68]
X-CFilter-Loop: Reflected
Cc: Zheng Yongjun <zhengyongjun3@huawei.com>
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

spinlock can be initialized automatically with DEFINE_SPINLOCK()
rather than explicitly calling spin_lock_init().

Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
---
 drivers/iommu/amd/iommu_v2.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/iommu/amd/iommu_v2.c b/drivers/iommu/amd/iommu_v2.c
index 5ecc0bc608ec..f8d4ad421e07 100644
--- a/drivers/iommu/amd/iommu_v2.c
+++ b/drivers/iommu/amd/iommu_v2.c
@@ -77,7 +77,7 @@ struct fault {
 };
 
 static LIST_HEAD(state_list);
-static spinlock_t state_lock;
+static DEFINE_SPINLOCK(state_lock);
 
 static struct workqueue_struct *iommu_wq;
 
@@ -938,8 +938,6 @@ static int __init amd_iommu_v2_init(void)
 		return 0;
 	}
 
-	spin_lock_init(&state_lock);
-
 	ret = -ENOMEM;
 	iommu_wq = alloc_workqueue("amd_iommu_v2", WQ_MEM_RECLAIM, 0);
 	if (iommu_wq == NULL)
-- 
2.22.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
