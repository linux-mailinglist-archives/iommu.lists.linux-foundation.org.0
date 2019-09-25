Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id CECD4BE57B
	for <lists.iommu@lfdr.de>; Wed, 25 Sep 2019 21:17:51 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id ADD60CF6;
	Wed, 25 Sep 2019 19:17:47 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 249D3CC7
	for <iommu@lists.linux-foundation.org>;
	Wed, 25 Sep 2019 19:17:47 +0000 (UTC)
X-Greylist: delayed 00:33:39 by SQLgrey-1.7.6
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id EEFE2108
	for <iommu@lists.linux-foundation.org>;
	Wed, 25 Sep 2019 19:17:45 +0000 (UTC)
Received: from muedsl-82-207-238-254.citykom.de ([82.207.238.254]
	helo=phil.fritz.box) by gloria.sntech.de with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
	(envelope-from <heiko@sntech.de>)
	id 1iDCGZ-0005Fa-At; Wed, 25 Sep 2019 20:43:55 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: joro@8bytes.org
Subject: [PATCH] iommu/rockchip: don't use platform_get_irq to implicitly
	count irqs
Date: Wed, 25 Sep 2019 20:43:46 +0200
Message-Id: <20190925184346.14121-1-heiko@sntech.de>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-rockchip@lists.infradead.org, iommu@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Heiko Stuebner <heiko@sntech.de>
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

Till now the Rockchip iommu driver walked through the irq list via
platform_get_irq() until it encountered an ENXIO error. With the
recent change to add a central error message, this always results
in such an error for each iommu on probe and shutdown.

To not confuse people, switch to platform_count_irqs() to get the
actual number of interrupts before walking through them.

Fixes: 7723f4c5ecdb ("driver core: platform: Add an error message to platform_get_irq*()")
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/iommu/rockchip-iommu.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iommu.c
index 26290f310f90..4dcbf68dfda4 100644
--- a/drivers/iommu/rockchip-iommu.c
+++ b/drivers/iommu/rockchip-iommu.c
@@ -100,6 +100,7 @@ struct rk_iommu {
 	struct device *dev;
 	void __iomem **bases;
 	int num_mmu;
+	int num_irq;
 	struct clk_bulk_data *clocks;
 	int num_clocks;
 	bool reset_disabled;
@@ -1136,7 +1137,7 @@ static int rk_iommu_probe(struct platform_device *pdev)
 	struct rk_iommu *iommu;
 	struct resource *res;
 	int num_res = pdev->num_resources;
-	int err, i, irq;
+	int err, i;
 
 	iommu = devm_kzalloc(dev, sizeof(*iommu), GFP_KERNEL);
 	if (!iommu)
@@ -1163,6 +1164,10 @@ static int rk_iommu_probe(struct platform_device *pdev)
 	if (iommu->num_mmu == 0)
 		return PTR_ERR(iommu->bases[0]);
 
+	iommu->num_irq = platform_irq_count(pdev);
+	if (iommu->num_irq < 0)
+		return iommu->num_irq;
+
 	iommu->reset_disabled = device_property_read_bool(dev,
 					"rockchip,disable-mmu-reset");
 
@@ -1219,8 +1224,9 @@ static int rk_iommu_probe(struct platform_device *pdev)
 
 	pm_runtime_enable(dev);
 
-	i = 0;
-	while ((irq = platform_get_irq(pdev, i++)) != -ENXIO) {
+	for (i = 0; i < iommu->num_irq; i++) {
+		int irq = platform_get_irq(pdev, i);
+
 		if (irq < 0)
 			return irq;
 
@@ -1245,10 +1251,13 @@ static int rk_iommu_probe(struct platform_device *pdev)
 static void rk_iommu_shutdown(struct platform_device *pdev)
 {
 	struct rk_iommu *iommu = platform_get_drvdata(pdev);
-	int i = 0, irq;
+	int i;
+
+	for (i = 0; i < iommu->num_irq; i++) {
+		int irq = platform_get_irq(pdev, i);
 
-	while ((irq = platform_get_irq(pdev, i++)) != -ENXIO)
 		devm_free_irq(iommu->dev, irq, iommu);
+	}
 
 	pm_runtime_force_suspend(&pdev->dev);
 }
-- 
2.23.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
