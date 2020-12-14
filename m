Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A74D2D99CF
	for <lists.iommu@lfdr.de>; Mon, 14 Dec 2020 15:25:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 51DEF8704B;
	Mon, 14 Dec 2020 14:25:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tyECnsTZCgdp; Mon, 14 Dec 2020 14:25:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0D58E87036;
	Mon, 14 Dec 2020 14:25:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 03C25C013B;
	Mon, 14 Dec 2020 14:25:40 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 46DC3C013B
 for <iommu@lists.linux-foundation.org>; Mon, 14 Dec 2020 13:44:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 32E568672F
 for <iommu@lists.linux-foundation.org>; Mon, 14 Dec 2020 13:44:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8rr0YSKiDWV5 for <iommu@lists.linux-foundation.org>;
 Mon, 14 Dec 2020 13:44:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by whitealder.osuosl.org (Postfix) with ESMTPS id A12A78672C
 for <iommu@lists.linux-foundation.org>; Mon, 14 Dec 2020 13:44:26 +0000 (UTC)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CvjK90zgmzhtBs;
 Mon, 14 Dec 2020 21:43:41 +0800 (CST)
Received: from ubuntu.network (10.175.138.68) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.498.0; Mon, 14 Dec 2020 21:44:09 +0800
From: Zheng Yongjun <zhengyongjun3@huawei.com>
To: <joro@8bytes.org>, <will@kernel.org>, <iommu@lists.linux-foundation.org>, 
 <linux-kernel@vger.kernel.org>
Subject: [PATCH -next] iommu/amd/init: convert comma to semicolon
Date: Mon, 14 Dec 2020 21:44:38 +0800
Message-ID: <20201214134438.4776-1-zhengyongjun3@huawei.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Originating-IP: [10.175.138.68]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 14 Dec 2020 14:25:39 +0000
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

Replace a comma between expression statements by a semicolon.

Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
---
 drivers/iommu/amd/init.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/amd/init.c b/drivers/iommu/amd/init.c
index 23a790f8f550..dad011e88268 100644
--- a/drivers/iommu/amd/init.c
+++ b/drivers/iommu/amd/init.c
@@ -2053,8 +2053,8 @@ static int iommu_init_intcapxt(struct amd_iommu *iommu)
 	 * whenever the irq affinity is changed from user-space.
 	 */
 	notify->irq = iommu->dev->irq;
-	notify->notify = _irq_notifier_notify,
-	notify->release = _irq_notifier_release,
+	notify->notify = _irq_notifier_notify;
+	notify->release = _irq_notifier_release;
 	ret = irq_set_affinity_notifier(iommu->dev->irq, notify);
 	if (ret) {
 		pr_err("Failed to register irq affinity notifier (devid=%#x, irq %d)\n",
-- 
2.22.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
