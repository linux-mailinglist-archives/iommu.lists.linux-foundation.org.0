Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D385F7D48
	for <lists.iommu@lfdr.de>; Mon, 11 Nov 2019 19:55:33 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 55F1EE28;
	Mon, 11 Nov 2019 18:55:29 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 8826EE0E
	for <iommu@lists.linux-foundation.org>;
	Mon, 11 Nov 2019 18:55:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 2F647102
	for <iommu@lists.linux-foundation.org>;
	Mon, 11 Nov 2019 18:55:28 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 899DB1FB;
	Mon, 11 Nov 2019 10:55:27 -0800 (PST)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com
	[10.1.196.37])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7C5DD3F52E; 
	Mon, 11 Nov 2019 10:55:26 -0800 (PST)
From: Robin Murphy <robin.murphy@arm.com>
To: joro@8bytes.org
Subject: [PATCH] iommu/rockchip: Don't provoke WARN for harmless IRQs
Date: Mon, 11 Nov 2019 18:55:18 +0000
Message-Id: <82cba203551939399d219e4cb6c602315fd0c410.1573498518.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: heiko@sntech.de, maz@kernel.org, Vasily Khoruzhick <anarsoul@gmail.com>,
	linux-rockchip@lists.infradead.org, iommu@lists.linux-foundation.org,
	linux-arm-kernel@lists.infradead.org
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

Although we don't generally expect IRQs to fire for a suspended IOMMU,
there are certain situations (particularly with debug options) where
we might legitimately end up with the pm_runtime_get_if_in_use() call
from rk_iommu_irq() returning 0. Since this doesn't represent an actual
error, follow the other parts of the driver and save the WARN_ON()
condition for a genuine negative value. Even if we do have spurious
IRQs due to a wedged VOP asserting the shared line, it's not this
driver's job to try to second-guess the IRQ core to warn about that.

Reported-by: Vasily Khoruzhick <anarsoul@gmail.com>
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/rockchip-iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iommu.c
index 4dcbf68dfda4..bd7e9b1e40ac 100644
--- a/drivers/iommu/rockchip-iommu.c
+++ b/drivers/iommu/rockchip-iommu.c
@@ -527,7 +527,7 @@ static irqreturn_t rk_iommu_irq(int irq, void *dev_id)
 	int i, err;
 
 	err = pm_runtime_get_if_in_use(iommu->dev);
-	if (WARN_ON_ONCE(err <= 0))
+	if (!err || WARN_ON_ONCE(err < 0))
 		return ret;
 
 	if (WARN_ON(clk_bulk_enable(iommu->num_clocks, iommu->clocks)))
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
