Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id F2536E1D8B
	for <lists.iommu@lfdr.de>; Wed, 23 Oct 2019 16:01:04 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5F412B7D;
	Wed, 23 Oct 2019 14:01:00 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id F3C7EACC
	for <iommu@lists.linux-foundation.org>;
	Wed, 23 Oct 2019 14:00:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 69845831
	for <iommu@lists.linux-foundation.org>;
	Wed, 23 Oct 2019 14:00:58 +0000 (UTC)
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id A41CF777CE33060F98F3;
	Wed, 23 Oct 2019 22:00:49 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS408-HUB.china.huawei.com
	(10.3.19.208) with Microsoft SMTP Server id 14.3.439.0; Wed, 23 Oct 2019
	22:00:42 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <joro@8bytes.org>
Subject: [PATCH -next] iommu/ipmmu-vmsa: Remove dev_err() on
	platform_get_irq() failure
Date: Wed, 23 Oct 2019 21:59:41 +0800
Message-ID: <20191023135941.15000-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=unavailable version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: jroedel@suse.de, geert+renesas@glider.be,
	YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org,
	swboyd@chromium.org, iommu@lists.linux-foundation.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

platform_get_irq() will call dev_err() itself on failure,
so there is no need for the driver to also do this.
This is detected by coccinelle.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/iommu/ipmmu-vmsa.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
index a8b7957..5904c23 100644
--- a/drivers/iommu/ipmmu-vmsa.c
+++ b/drivers/iommu/ipmmu-vmsa.c
@@ -1110,10 +1110,8 @@ static int ipmmu_probe(struct platform_device *pdev)
 	/* Root devices have mandatory IRQs */
 	if (ipmmu_is_root(mmu)) {
 		irq = platform_get_irq(pdev, 0);
-		if (irq < 0) {
-			dev_err(&pdev->dev, "no IRQ found\n");
+		if (irq < 0)
 			return irq;
-		}
 
 		ret = devm_request_irq(&pdev->dev, irq, ipmmu_irq, 0,
 				       dev_name(&pdev->dev), mmu);
-- 
2.7.4


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
