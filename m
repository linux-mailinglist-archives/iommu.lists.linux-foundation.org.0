Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA0C37908F
	for <lists.iommu@lfdr.de>; Mon, 10 May 2021 16:22:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A195404F7;
	Mon, 10 May 2021 14:22:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6o39fy8mHqe3; Mon, 10 May 2021 14:22:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id B228A40538;
	Mon, 10 May 2021 14:22:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8B604C0024;
	Mon, 10 May 2021 14:22:40 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 49602C0001
 for <iommu@lists.linux-foundation.org>; Mon, 10 May 2021 14:22:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2B8488408F
 for <iommu@lists.linux-foundation.org>; Mon, 10 May 2021 14:22:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PX5OvGUf6sGx for <iommu@lists.linux-foundation.org>;
 Mon, 10 May 2021 14:22:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 09AF283EAE
 for <iommu@lists.linux-foundation.org>; Mon, 10 May 2021 14:22:36 +0000 (UTC)
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Ff38H6410zqTrx;
 Mon, 10 May 2021 22:19:11 +0800 (CST)
Received: from localhost.localdomain (10.69.192.58) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.498.0; Mon, 10 May 2021 22:22:25 +0800
From: John Garry <john.garry@huawei.com>
To: <joro@8bytes.org>, <will@kernel.org>, <robin.murphy@arm.com>,
 <hch@lst.de>, <m.szyprowski@samsung.com>
Subject: [PATCH v2 04/15] iommu: Add iommu_group_get_max_opt_dma_size()
Date: Mon, 10 May 2021 22:17:18 +0800
Message-ID: <1620656249-68890-5-git-send-email-john.garry@huawei.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1620656249-68890-1-git-send-email-john.garry@huawei.com>
References: <1620656249-68890-1-git-send-email-john.garry@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.69.192.58]
X-CFilter-Loop: Reflected
Cc: linux-scsi@vger.kernel.org, linuxarm@huawei.com,
 linux-kernel@vger.kernel.org, sai.praneeth.prakhya@intel.com,
 iommu@lists.linux-foundation.org
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

Add a function to return the max optimised DMA size for an IOMMU group.

Signed-off-by: John Garry <john.garry@huawei.com>
---
 drivers/iommu/iommu.c | 5 +++++
 include/linux/iommu.h | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 63cdfb11ebed..62e4491f32e0 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2296,6 +2296,11 @@ struct iommu_domain *iommu_get_dma_domain(struct device *dev)
 	return dev->iommu_group->default_domain;
 }
 
+size_t iommu_group_get_max_opt_dma_size(struct iommu_group *group)
+{
+	return group->max_opt_dma_size;
+}
+
 /*
  * IOMMU groups are really the natural working unit of the IOMMU, but
  * the IOMMU API works on domains and devices.  Bridge that gap by
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 32d448050bf7..e26abda94792 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -405,6 +405,7 @@ extern int iommu_sva_unbind_gpasid(struct iommu_domain *domain,
 				   struct device *dev, ioasid_t pasid);
 extern struct iommu_domain *iommu_get_domain_for_dev(struct device *dev);
 extern struct iommu_domain *iommu_get_dma_domain(struct device *dev);
+extern size_t iommu_group_get_max_opt_dma_size(struct iommu_group *group);
 extern int iommu_map(struct iommu_domain *domain, unsigned long iova,
 		     phys_addr_t paddr, size_t size, int prot);
 extern int iommu_map_atomic(struct iommu_domain *domain, unsigned long iova,
@@ -653,6 +654,11 @@ static inline struct iommu_domain *iommu_get_domain_for_dev(struct device *dev)
 	return NULL;
 }
 
+static inline size_t iommu_group_get_max_opt_dma_size(struct iommu_group *group)
+{
+	return 0;
+}
+
 static inline int iommu_map(struct iommu_domain *domain, unsigned long iova,
 			    phys_addr_t paddr, size_t size, int prot)
 {
-- 
2.26.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
