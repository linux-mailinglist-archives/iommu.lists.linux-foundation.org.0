Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A69729E714
	for <lists.iommu@lfdr.de>; Thu, 29 Oct 2020 10:18:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 273608755E;
	Thu, 29 Oct 2020 09:18:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C7OXX6-tVZN6; Thu, 29 Oct 2020 09:18:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 552D487558;
	Thu, 29 Oct 2020 09:18:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3FFFFC0051;
	Thu, 29 Oct 2020 09:18:30 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6C5ADC0051
 for <iommu@lists.linux-foundation.org>; Thu, 29 Oct 2020 09:18:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 5FE758693D
 for <iommu@lists.linux-foundation.org>; Thu, 29 Oct 2020 09:18:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cnhVvXjdvosT for <iommu@lists.linux-foundation.org>;
 Thu, 29 Oct 2020 09:18:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by whitealder.osuosl.org (Postfix) with ESMTPS id E319386924
 for <iommu@lists.linux-foundation.org>; Thu, 29 Oct 2020 09:18:26 +0000 (UTC)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CMKcH1GJ7z7005;
 Thu, 29 Oct 2020 17:18:23 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.487.0; Thu, 29 Oct 2020
 17:18:12 +0800
From: Yu Kuai <yukuai3@huawei.com>
To: <joro@8bytes.org>, <heiko@sntech.de>, <robin.murphy@arm.com>,
 <jeffy.chen@rock-chips.com>
Subject: [PATCH] iommu/rockchip: check return value of
 of_find_device_by_node() in rk_iommu_of_xlate()
Date: Thu, 29 Oct 2020 17:22:02 +0800
Message-ID: <20201029092202.900218-1-yukuai3@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
Cc: yi.zhang@huawei.com, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, iommu@lists.linux-foundation.org,
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

If of_find_device_by_node() failed in rk_iommu_of_xlate(), null pointer
dereference will be triggered. Thus return error code if
of_find_device_by_node() failed.

Fixes: 5fd577c3eac3("iommu/rockchip: Use OF_IOMMU to attach devices automatically")
Signed-off-by: Yu Kuai <yukuai3@huawei.com>
---
 drivers/iommu/rockchip-iommu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iommu.c
index e5d86b7177de..090d149ef8e9 100644
--- a/drivers/iommu/rockchip-iommu.c
+++ b/drivers/iommu/rockchip-iommu.c
@@ -1099,6 +1099,9 @@ static int rk_iommu_of_xlate(struct device *dev,
 
 	iommu_dev = of_find_device_by_node(args->np);
 
+	if (!iommu_dev)
+		return -ENODEV;
+
 	data->iommu = platform_get_drvdata(iommu_dev);
 	dev_iommu_priv_set(dev, data);
 
-- 
2.25.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
