Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 01BC02EBED0
	for <lists.iommu@lfdr.de>; Wed,  6 Jan 2021 14:39:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id AA02B860A8;
	Wed,  6 Jan 2021 13:39:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AxFqliWhuSQU; Wed,  6 Jan 2021 13:39:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B37508618E;
	Wed,  6 Jan 2021 13:39:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9F4EEC088B;
	Wed,  6 Jan 2021 13:39:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2D1CBC013A
 for <iommu@lists.linux-foundation.org>; Wed,  6 Jan 2021 13:39:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 28F6585CEC
 for <iommu@lists.linux-foundation.org>; Wed,  6 Jan 2021 13:39:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fTZLrPxNFhbV for <iommu@lists.linux-foundation.org>;
 Wed,  6 Jan 2021 13:39:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by whitealder.osuosl.org (Postfix) with ESMTPS id C7D0585D5F
 for <iommu@lists.linux-foundation.org>; Wed,  6 Jan 2021 13:39:19 +0000 (UTC)
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4D9r633xVzzl1B5;
 Wed,  6 Jan 2021 21:38:03 +0800 (CST)
Received: from localhost.localdomain (10.69.192.58) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.498.0; Wed, 6 Jan 2021 21:39:03 +0800
From: John Garry <john.garry@huawei.com>
To: <joro@8bytes.org>, <will@kernel.org>
Subject: [PATCH v2 5/6] iommu: Delete iommu_domain_window_disable()
Date: Wed, 6 Jan 2021 21:35:10 +0800
Message-ID: <1609940111-28563-6-git-send-email-john.garry@huawei.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1609940111-28563-1-git-send-email-john.garry@huawei.com>
References: <1609940111-28563-1-git-send-email-john.garry@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.69.192.58]
X-CFilter-Loop: Reflected
Cc: iommu@lists.linux-foundation.org, robin.murphy@arm.com,
 linux-kernel@vger.kernel.org
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

Function iommu_domain_window_disable() is not referenced in the tree, so
delete it.

Signed-off-by: John Garry <john.garry@huawei.com>
---
 drivers/iommu/iommu.c | 9 ---------
 include/linux/iommu.h | 6 ------
 2 files changed, 15 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 4f4edb087ce6..20201ef97b8f 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2598,15 +2598,6 @@ int iommu_domain_window_enable(struct iommu_domain *domain, u32 wnd_nr,
 }
 EXPORT_SYMBOL_GPL(iommu_domain_window_enable);
 
-void iommu_domain_window_disable(struct iommu_domain *domain, u32 wnd_nr)
-{
-	if (unlikely(domain->ops->domain_window_disable == NULL))
-		return;
-
-	return domain->ops->domain_window_disable(domain, wnd_nr);
-}
-EXPORT_SYMBOL_GPL(iommu_domain_window_disable);
-
 /**
  * report_iommu_fault() - report about an IOMMU fault to the IOMMU framework
  * @domain: the iommu domain where the fault has happened
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index b3f0e2018c62..72059fcfa108 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -514,7 +514,6 @@ extern int iommu_domain_set_attr(struct iommu_domain *domain, enum iommu_attr,
 extern int iommu_domain_window_enable(struct iommu_domain *domain, u32 wnd_nr,
 				      phys_addr_t offset, u64 size,
 				      int prot);
-extern void iommu_domain_window_disable(struct iommu_domain *domain, u32 wnd_nr);
 
 extern int report_iommu_fault(struct iommu_domain *domain, struct device *dev,
 			      unsigned long iova, int flags);
@@ -746,11 +745,6 @@ static inline int iommu_domain_window_enable(struct iommu_domain *domain,
 	return -ENODEV;
 }
 
-static inline void iommu_domain_window_disable(struct iommu_domain *domain,
-					       u32 wnd_nr)
-{
-}
-
 static inline phys_addr_t iommu_iova_to_phys(struct iommu_domain *domain, dma_addr_t iova)
 {
 	return 0;
-- 
2.26.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
