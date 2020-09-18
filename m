Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3FA26EA75
	for <lists.iommu@lfdr.de>; Fri, 18 Sep 2020 03:28:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id E1E7C876FA;
	Fri, 18 Sep 2020 01:28:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V2vVOiWIcMJz; Fri, 18 Sep 2020 01:28:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id BFA33876FB;
	Fri, 18 Sep 2020 01:28:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9875BC0051;
	Fri, 18 Sep 2020 01:28:37 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 71D55C0051
 for <iommu@lists.linux-foundation.org>; Fri, 18 Sep 2020 01:12:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 5AF5A86FB3
 for <iommu@lists.linux-foundation.org>; Fri, 18 Sep 2020 01:12:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JfnHTBD2cHpA for <iommu@lists.linux-foundation.org>;
 Fri, 18 Sep 2020 01:12:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 5789686FAD
 for <iommu@lists.linux-foundation.org>; Fri, 18 Sep 2020 01:12:38 +0000 (UTC)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id CA5C5D147F08C0996032;
 Fri, 18 Sep 2020 09:12:34 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.487.0; Fri, 18 Sep 2020
 09:12:24 +0800
From: Yu Kuai <yukuai3@huawei.com>
To: <m.szyprowski@samsung.com>, <joro@8bytes.org>, <kgene@kernel.org>,
 <krzk@kernel.org>
Subject: [PATCH] iommu/exynos: add missing put_device() call in
 exynos_iommu_of_xlate()
Date: Fri, 18 Sep 2020 09:13:35 +0800
Message-ID: <20200918011335.909141-1-yukuai3@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 18 Sep 2020 01:28:36 +0000
Cc: linux-samsung-soc@vger.kernel.org, yi.zhang@huawei.com,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 yukuai3@huawei.com, linux-arm-kernel@lists.infradead.org
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

if of_find_device_by_node() succeed, exynos_iommu_of_xlate() doesn't have
a corresponding put_device(). Thus add put_device() to fix the exception
handling for this function implementation.

Fixes: aa759fd376fb ("iommu/exynos: Add callback for initializing devices from device tree")
Signed-off-by: Yu Kuai <yukuai3@huawei.com>
---
 drivers/iommu/exynos-iommu.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
index bad3c0ce10cb..de324b4eedfe 100644
--- a/drivers/iommu/exynos-iommu.c
+++ b/drivers/iommu/exynos-iommu.c
@@ -1295,13 +1295,17 @@ static int exynos_iommu_of_xlate(struct device *dev,
 		return -ENODEV;
 
 	data = platform_get_drvdata(sysmmu);
-	if (!data)
+	if (!data) {
+		put_device(&sysmmu->dev);
 		return -ENODEV;
+	}
 
 	if (!owner) {
 		owner = kzalloc(sizeof(*owner), GFP_KERNEL);
-		if (!owner)
+		if (!owner) {
+			put_device(&sysmmu->dev);
 			return -ENOMEM;
+		}
 
 		INIT_LIST_HEAD(&owner->controllers);
 		mutex_init(&owner->rpm_lock);
-- 
2.25.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
