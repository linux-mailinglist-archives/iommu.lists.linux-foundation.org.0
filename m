Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id B946750DBC8
	for <lists.iommu@lfdr.de>; Mon, 25 Apr 2022 10:56:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C05640271;
	Mon, 25 Apr 2022 08:56:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yh9Y3o9Yh4ST; Mon, 25 Apr 2022 08:56:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 5803B408F6;
	Mon, 25 Apr 2022 08:56:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 16159C002D;
	Mon, 25 Apr 2022 08:56:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EC68CC002D
 for <iommu@lists.linux-foundation.org>; Mon, 25 Apr 2022 08:56:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E8B8E60B27
 for <iommu@lists.linux-foundation.org>; Mon, 25 Apr 2022 08:56:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aUqPIXTK4Vmq for <iommu@lists.linux-foundation.org>;
 Mon, 25 Apr 2022 08:56:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ED8C260AC0
 for <iommu@lists.linux-foundation.org>; Mon, 25 Apr 2022 08:56:29 +0000 (UTC)
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4KmzQ66fxwzhYjN;
 Mon, 25 Apr 2022 16:56:14 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 25 Apr 2022 16:56:26 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 25 Apr
 2022 16:56:25 +0800
To: <linux-kernel@vger.kernel.org>, <iommu@lists.linux-foundation.org>
Subject: [PATCH] iommu/dart: check return value after calling
 platform_get_resource()
Date: Mon, 25 Apr 2022 17:08:26 +0800
Message-ID: <20220425090826.2532165-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
Cc: will@kernel.org, alyssa@rosenzweig.io
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
From: Yang Yingliang via iommu <iommu@lists.linux-foundation.org>
Reply-To: Yang Yingliang <yangyingliang@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

It will cause null-ptr-deref in resource_size(), if platform_get_resource()
returns NULL, move calling resource_size() after devm_ioremap_resource() that
will check 'res' to avoid null-ptr-deref.
And use devm_platform_get_and_ioremap_resource() to simplify code.

Fixes: 46d1fb072e76 ("iommu/dart: Add DART iommu driver")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/iommu/apple-dart.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/apple-dart.c b/drivers/iommu/apple-dart.c
index decafb07ad08..15b77f16cfa3 100644
--- a/drivers/iommu/apple-dart.c
+++ b/drivers/iommu/apple-dart.c
@@ -859,16 +859,15 @@ static int apple_dart_probe(struct platform_device *pdev)
 	dart->dev = dev;
 	spin_lock_init(&dart->lock);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	dart->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
+	if (IS_ERR(dart->regs))
+		return PTR_ERR(dart->regs);
+
 	if (resource_size(res) < 0x4000) {
 		dev_err(dev, "MMIO region too small (%pr)\n", res);
 		return -EINVAL;
 	}
 
-	dart->regs = devm_ioremap_resource(dev, res);
-	if (IS_ERR(dart->regs))
-		return PTR_ERR(dart->regs);
-
 	dart->irq = platform_get_irq(pdev, 0);
 	if (dart->irq < 0)
 		return -ENODEV;
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
