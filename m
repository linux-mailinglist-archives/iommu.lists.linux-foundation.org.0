Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3EEA7FA9
	for <lists.iommu@lfdr.de>; Wed,  4 Sep 2019 11:47:12 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 7F1EE13DD;
	Wed,  4 Sep 2019 09:47:10 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 13A9013D8
	for <iommu@lists.linux-foundation.org>;
	Wed,  4 Sep 2019 09:46:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id A0CBD89B
	for <iommu@lists.linux-foundation.org>;
	Wed,  4 Sep 2019 09:46:50 +0000 (UTC)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 8E76FF1821FAB7104FF9;
	Wed,  4 Sep 2019 17:46:47 +0800 (CST)
Received: from linux-ibm.site (10.175.102.37) by
	DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server
	id 14.3.439.0; Wed, 4 Sep 2019 17:46:38 +0800
From: zhong jiang <zhongjiang@huawei.com>
To: <joro@8bytes.org>
Subject: [PATCH v2] iommu/pamu: Use kzfree rather than its implementation
Date: Wed, 4 Sep 2019 17:43:44 +0800
Message-ID: <1567590224-23364-1-git-send-email-zhongjiang@huawei.com>
X-Mailer: git-send-email 1.7.12.4
MIME-Version: 1.0
X-Originating-IP: [10.175.102.37]
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=unavailable version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: iommu@lists.linux-foundation.org, zhongjiang@huawei.com,
	linux-kernel@vger.kernel.org
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

Use kzfree instead of memset() + kfree().

Signed-off-by: zhong jiang <zhongjiang@huawei.com>
---
 drivers/iommu/fsl_pamu.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/iommu/fsl_pamu.c b/drivers/iommu/fsl_pamu.c
index cde281b..e924368 100644
--- a/drivers/iommu/fsl_pamu.c
+++ b/drivers/iommu/fsl_pamu.c
@@ -1174,11 +1174,7 @@ static int fsl_pamu_probe(struct platform_device *pdev)
 	if (irq != NO_IRQ)
 		free_irq(irq, data);
 
-	if (data) {
-		memset(data, 0, sizeof(struct pamu_isr_data));
-		kfree(data);
-	}
-
+	kzfree(data);
 	if (pamu_regs)
 		iounmap(pamu_regs);
 
-- 
1.7.12.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
