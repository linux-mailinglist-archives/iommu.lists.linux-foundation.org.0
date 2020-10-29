Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id A9EC529E717
	for <lists.iommu@lfdr.de>; Thu, 29 Oct 2020 10:19:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 42CA9857C2;
	Thu, 29 Oct 2020 09:19:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dT0fjgj6dIZC; Thu, 29 Oct 2020 09:19:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id BDCB7854C0;
	Thu, 29 Oct 2020 09:19:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A6836C088B;
	Thu, 29 Oct 2020 09:19:03 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4CF1AC0051
 for <iommu@lists.linux-foundation.org>; Thu, 29 Oct 2020 09:19:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 3B2AA8755E
 for <iommu@lists.linux-foundation.org>; Thu, 29 Oct 2020 09:19:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZjVqpa1Ul-cO for <iommu@lists.linux-foundation.org>;
 Thu, 29 Oct 2020 09:19:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 2ED5D87558
 for <iommu@lists.linux-foundation.org>; Thu, 29 Oct 2020 09:19:00 +0000 (UTC)
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CMKd00X6WzkYYL;
 Thu, 29 Oct 2020 17:19:00 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.487.0; Thu, 29 Oct 2020
 17:18:47 +0800
From: Yu Kuai <yukuai3@huawei.com>
To: <joro@8bytes.org>, <mripard@kernel.org>, <wens@csie.org>
Subject: [PATCH] iommu/sun50i: check return value of of_find_device_by_node()
 in sun50i_iommu_of_xlate()
Date: Thu, 29 Oct 2020 17:22:44 +0800
Message-ID: <20201029092244.900564-1-yukuai3@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
Cc: yukuai3@huawei.com, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 yi.zhang@huawei.com
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

If of_find_device_by_node() failed in sun50i_iommu_of_xlate(), null
pointer dereference will be triggered. Thus return error code if
of_find_device_by_node() failed.

Fixes: 4100b8c229b3("iommu: Add Allwinner H6 IOMMU driver")
Signed-off-by: Yu Kuai <yukuai3@huawei.com>
---
 drivers/iommu/sun50i-iommu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/iommu/sun50i-iommu.c b/drivers/iommu/sun50i-iommu.c
index ea6db1341916..ce94ffa15215 100644
--- a/drivers/iommu/sun50i-iommu.c
+++ b/drivers/iommu/sun50i-iommu.c
@@ -764,6 +764,9 @@ static int sun50i_iommu_of_xlate(struct device *dev,
 	struct platform_device *iommu_pdev = of_find_device_by_node(args->np);
 	unsigned id = args->args[0];
 
+	if (!iommu_pdev)
+		return -ENODEV;
+
 	dev_iommu_priv_set(dev, platform_get_drvdata(iommu_pdev));
 
 	return iommu_fwspec_add_ids(dev, &id, 1);
-- 
2.25.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
