Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 2061B2CDDDC
	for <lists.iommu@lfdr.de>; Thu,  3 Dec 2020 19:39:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9E3CD86449;
	Thu,  3 Dec 2020 18:39:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id er_JBOGYgK94; Thu,  3 Dec 2020 18:39:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 88778865E0;
	Thu,  3 Dec 2020 18:39:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 70C6EC0FA7;
	Thu,  3 Dec 2020 18:39:17 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9723CC0FA7
 for <iommu@lists.linux-foundation.org>; Thu,  3 Dec 2020 18:39:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 86A6186169
 for <iommu@lists.linux-foundation.org>; Thu,  3 Dec 2020 18:39:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8vyuOBZDCgvU for <iommu@lists.linux-foundation.org>;
 Thu,  3 Dec 2020 18:39:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 93E1E86108
 for <iommu@lists.linux-foundation.org>; Thu,  3 Dec 2020 18:39:13 +0000 (UTC)
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Cn4Nn518dzhmFH;
 Fri,  4 Dec 2020 02:38:49 +0800 (CST)
Received: from localhost.localdomain (10.69.192.58) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.487.0; Fri, 4 Dec 2020 02:39:01 +0800
From: John Garry <john.garry@huawei.com>
To: <joro@8bytes.org>, <will@kernel.org>
Subject: [PATCH 2/3] iommu: Stop exporting alloc_iova_mem()
Date: Fri, 4 Dec 2020 02:34:51 +0800
Message-ID: <1607020492-189471-3-git-send-email-john.garry@huawei.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1607020492-189471-1-git-send-email-john.garry@huawei.com>
References: <1607020492-189471-1-git-send-email-john.garry@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.69.192.58]
X-CFilter-Loop: Reflected
Cc: 0x7f454c46@gmail.com, linux-kernel@vger.kernel.org, linuxarm@huawei.com,
 iommu@lists.linux-foundation.org, robin.murphy@arm.com
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

It is not used outside iova.c

Signed-off-by: John Garry <john.garry@huawei.com>
---
 drivers/iommu/iova.c | 3 +--
 include/linux/iova.h | 6 ------
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/iommu/iova.c b/drivers/iommu/iova.c
index 4803bd83447d..9fed0b040747 100644
--- a/drivers/iommu/iova.c
+++ b/drivers/iommu/iova.c
@@ -243,11 +243,10 @@ static struct kmem_cache *iova_cache;
 static unsigned int iova_cache_users;
 static DEFINE_MUTEX(iova_cache_mutex);
 
-struct iova *alloc_iova_mem(void)
+static struct iova *alloc_iova_mem(void)
 {
 	return kmem_cache_zalloc(iova_cache, GFP_ATOMIC | __GFP_NOWARN);
 }
-EXPORT_SYMBOL(alloc_iova_mem);
 
 void free_iova_mem(struct iova *iova)
 {
diff --git a/include/linux/iova.h b/include/linux/iova.h
index a77add571c50..d8c011b6d4ed 100644
--- a/include/linux/iova.h
+++ b/include/linux/iova.h
@@ -136,7 +136,6 @@ static inline unsigned long iova_pfn(struct iova_domain *iovad, dma_addr_t iova)
 int iova_cache_get(void);
 void iova_cache_put(void);
 
-struct iova *alloc_iova_mem(void);
 void free_iova_mem(struct iova *iova);
 void free_iova(struct iova_domain *iovad, unsigned long pfn);
 void __free_iova(struct iova_domain *iovad, struct iova *iova);
@@ -171,11 +170,6 @@ static inline void iova_cache_put(void)
 {
 }
 
-static inline struct iova *alloc_iova_mem(void)
-{
-	return NULL;
-}
-
 static inline void free_iova_mem(struct iova *iova)
 {
 }
-- 
2.26.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
