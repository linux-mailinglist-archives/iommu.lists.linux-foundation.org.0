Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0F62EBECB
	for <lists.iommu@lfdr.de>; Wed,  6 Jan 2021 14:39:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 51CE9230A4;
	Wed,  6 Jan 2021 13:39:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id syQrSzw1sutZ; Wed,  6 Jan 2021 13:39:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id B70EC22D10;
	Wed,  6 Jan 2021 13:39:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5C517C013A;
	Wed,  6 Jan 2021 13:39:17 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 46A35C013A
 for <iommu@lists.linux-foundation.org>; Wed,  6 Jan 2021 13:39:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 421A684495
 for <iommu@lists.linux-foundation.org>; Wed,  6 Jan 2021 13:39:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OdF0m6s-wc49 for <iommu@lists.linux-foundation.org>;
 Wed,  6 Jan 2021 13:39:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D7A6C84476
 for <iommu@lists.linux-foundation.org>; Wed,  6 Jan 2021 13:39:11 +0000 (UTC)
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4D9r6F6RKmz7Q16;
 Wed,  6 Jan 2021 21:38:13 +0800 (CST)
Received: from localhost.localdomain (10.69.192.58) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.498.0; Wed, 6 Jan 2021 21:39:02 +0800
From: John Garry <john.garry@huawei.com>
To: <joro@8bytes.org>, <will@kernel.org>
Subject: [PATCH v2 1/6] iova: Make has_iova_flush_queue() private
Date: Wed, 6 Jan 2021 21:35:06 +0800
Message-ID: <1609940111-28563-2-git-send-email-john.garry@huawei.com>
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

Function has_iova_flush_queue() has no users outside iova.c, so make it
private.

Signed-off-by: John Garry <john.garry@huawei.com>
---
 drivers/iommu/iova.c | 2 +-
 include/linux/iova.h | 6 ------
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/iommu/iova.c b/drivers/iommu/iova.c
index 4bb3293ae4d7..0a758ec2a1c4 100644
--- a/drivers/iommu/iova.c
+++ b/drivers/iommu/iova.c
@@ -55,7 +55,7 @@ init_iova_domain(struct iova_domain *iovad, unsigned long granule,
 }
 EXPORT_SYMBOL_GPL(init_iova_domain);
 
-bool has_iova_flush_queue(struct iova_domain *iovad)
+static bool has_iova_flush_queue(struct iova_domain *iovad)
 {
 	return !!iovad->fq;
 }
diff --git a/include/linux/iova.h b/include/linux/iova.h
index 76e16ae20729..2b76e0be1c5b 100644
--- a/include/linux/iova.h
+++ b/include/linux/iova.h
@@ -153,7 +153,6 @@ struct iova *reserve_iova(struct iova_domain *iovad, unsigned long pfn_lo,
 void copy_reserved_iova(struct iova_domain *from, struct iova_domain *to);
 void init_iova_domain(struct iova_domain *iovad, unsigned long granule,
 	unsigned long start_pfn);
-bool has_iova_flush_queue(struct iova_domain *iovad);
 int init_iova_flush_queue(struct iova_domain *iovad,
 			  iova_flush_cb flush_cb, iova_entry_dtor entry_dtor);
 struct iova *find_iova(struct iova_domain *iovad, unsigned long pfn);
@@ -223,11 +222,6 @@ static inline void init_iova_domain(struct iova_domain *iovad,
 {
 }
 
-static inline bool has_iova_flush_queue(struct iova_domain *iovad)
-{
-	return false;
-}
-
 static inline int init_iova_flush_queue(struct iova_domain *iovad,
 					iova_flush_cb flush_cb,
 					iova_entry_dtor entry_dtor)
-- 
2.26.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
