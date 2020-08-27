Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C10C254124
	for <lists.iommu@lfdr.de>; Thu, 27 Aug 2020 10:46:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 010AD86A0B;
	Thu, 27 Aug 2020 08:46:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wz0uLyw4MeHa; Thu, 27 Aug 2020 08:46:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 753E786A07;
	Thu, 27 Aug 2020 08:46:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5FE4AC0051;
	Thu, 27 Aug 2020 08:46:39 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 12DF2C0051
 for <iommu@lists.linux-foundation.org>; Thu, 27 Aug 2020 08:46:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id ECEDE86A0B
 for <iommu@lists.linux-foundation.org>; Thu, 27 Aug 2020 08:46:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2+L8Nx2PzNbp for <iommu@lists.linux-foundation.org>;
 Thu, 27 Aug 2020 08:46:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 9DAA386A07
 for <iommu@lists.linux-foundation.org>; Thu, 27 Aug 2020 08:46:33 +0000 (UTC)
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 28EC4C060D18D32208B2;
 Thu, 27 Aug 2020 16:46:18 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.487.0; Thu, 27 Aug 2020 16:46:12 +0800
From: Shaokun Zhang <zhangshaokun@hisilicon.com>
To: <iommu@lists.linux-foundation.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] iommu/iova: Replace cmpxchg with xchg in queue_iova
Date: Thu, 27 Aug 2020 16:43:54 +0800
Message-ID: <1598517834-30275-1-git-send-email-zhangshaokun@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Cc: Shaokun Zhang <zhangshaokun@hisilicon.com>, Yuqi Jin <jinyuqi@huawei.com>
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

From: Yuqi Jin <jinyuqi@huawei.com>

The performance of the atomic_xchg is better than atomic_cmpxchg because
no comparison is required. While the value of @fq_timer_on can only be 0
or 1. Let's use atomic_xchg instead of atomic_cmpxchg here because we
only need to check that the value changes from 0 to 1 or from 1 to 1.

Cc: Joerg Roedel <joro@8bytes.org>
Signed-off-by: Yuqi Jin <jinyuqi@huawei.com>
Signed-off-by: Shaokun Zhang <zhangshaokun@hisilicon.com>
---
 drivers/iommu/iova.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/iova.c b/drivers/iommu/iova.c
index 45a251da5453..30d969a4c5fd 100644
--- a/drivers/iommu/iova.c
+++ b/drivers/iommu/iova.c
@@ -579,7 +579,7 @@ void queue_iova(struct iova_domain *iovad,
 
 	/* Avoid false sharing as much as possible. */
 	if (!atomic_read(&iovad->fq_timer_on) &&
-	    !atomic_cmpxchg(&iovad->fq_timer_on, 0, 1))
+	    !atomic_xchg(&iovad->fq_timer_on, 1))
 		mod_timer(&iovad->fq_timer,
 			  jiffies + msecs_to_jiffies(IOVA_FQ_TIMEOUT));
 }
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
