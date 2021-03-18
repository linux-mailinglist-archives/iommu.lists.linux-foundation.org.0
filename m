Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D10B33FDC6
	for <lists.iommu@lfdr.de>; Thu, 18 Mar 2021 04:25:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 36CD24309A;
	Thu, 18 Mar 2021 03:25:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D6it8GAy6Zpm; Thu, 18 Mar 2021 03:25:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id 56F2F43093;
	Thu, 18 Mar 2021 03:25:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 35A99C0001;
	Thu, 18 Mar 2021 03:25:48 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 56F3CC0001
 for <iommu@lists.linux-foundation.org>; Thu, 18 Mar 2021 03:25:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5300E6069E
 for <iommu@lists.linux-foundation.org>; Thu, 18 Mar 2021 03:25:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c-zRB-7qUg12 for <iommu@lists.linux-foundation.org>;
 Thu, 18 Mar 2021 03:25:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2444E60677
 for <iommu@lists.linux-foundation.org>; Thu, 18 Mar 2021 03:25:44 +0000 (UTC)
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4F1C6w4z1QzkbkX;
 Thu, 18 Mar 2021 11:24:08 +0800 (CST)
Received: from localhost.localdomain (10.69.192.58) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.498.0; Thu, 18 Mar 2021 11:25:30 +0800
From: chenxiang <chenxiang66@hisilicon.com>
To: <robin.murphy@arm.com>, <will@kernel.org>
Subject: [PATCH] iommu/dma: Fix a typo in a comment
Date: Thu, 18 Mar 2021 11:21:24 +0800
Message-ID: <1616037684-59399-1-git-send-email-chenxiang66@hisilicon.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
X-Originating-IP: [10.69.192.58]
X-CFilter-Loop: Reflected
Cc: iommu@lists.linux-foundation.org
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

From: Xiang Chen <chenxiang66@hisilicon.com>

Fix a type "SAC" to "DAC" in the comment of function
iommu_dma_alloc_iova().

Signed-off-by: Xiang Chen <chenxiang66@hisilicon.com>
---
 drivers/iommu/dma-iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index af765c8..3bc17ee 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -443,7 +443,7 @@ static dma_addr_t iommu_dma_alloc_iova(struct iommu_domain *domain,
 	if (domain->geometry.force_aperture)
 		dma_limit = min(dma_limit, (u64)domain->geometry.aperture_end);
 
-	/* Try to get PCI devices a SAC address */
+	/* Try to get PCI devices a DAC address */
 	if (dma_limit > DMA_BIT_MASK(32) && dev_is_pci(dev))
 		iova = alloc_iova_fast(iovad, iova_len,
 				       DMA_BIT_MASK(32) >> shift, false);
-- 
2.8.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
