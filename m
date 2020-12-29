Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 1341C2E70EB
	for <lists.iommu@lfdr.de>; Tue, 29 Dec 2020 14:40:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 2E50B203DA;
	Tue, 29 Dec 2020 13:40:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4+3LNh3DM6EH; Tue, 29 Dec 2020 13:40:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 04450203D1;
	Tue, 29 Dec 2020 13:40:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DA230C088B;
	Tue, 29 Dec 2020 13:40:24 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B1156C0174
 for <iommu@lists.linux-foundation.org>; Tue, 29 Dec 2020 13:40:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A0401855BE
 for <iommu@lists.linux-foundation.org>; Tue, 29 Dec 2020 13:40:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Iuv7YUc2eAPN for <iommu@lists.linux-foundation.org>;
 Tue, 29 Dec 2020 13:40:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id F03CF8557E
 for <iommu@lists.linux-foundation.org>; Tue, 29 Dec 2020 13:40:21 +0000 (UTC)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4D4wW701LPzMBDJ;
 Tue, 29 Dec 2020 21:39:15 +0800 (CST)
Received: from DESKTOP-8RFUVS3.china.huawei.com (10.174.185.179) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.498.0; Tue, 29 Dec 2020 21:40:08 +0800
From: Zenghui Yu <yuzenghui@huawei.com>
To: <linux-kernel@vger.kernel.org>, <iommu@lists.linux-foundation.org>,
 <hch@lst.de>, <m.szyprowski@samsung.com>, <robin.murphy@arm.com>
Subject: [PATCH] dma-debug: Delete outdated comment of the hash function
Date: Tue, 29 Dec 2020 21:40:06 +0800
Message-ID: <20201229134006.1691-1-yuzenghui@huawei.com>
X-Mailer: git-send-email 2.23.0.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.174.185.179]
X-CFilter-Loop: Reflected
Cc: wanghaibin.wang@huawei.com
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

We actually use dev_addr[26:13] as the index into dma_entry_hash. Given
that the code itself is clear enough, let's drop the hardcoded comment so
that we won't need to revisit it every time HASH_FN_{SHIFT,MASK} gets
updated.

Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
---
 kernel/dma/debug.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/kernel/dma/debug.c b/kernel/dma/debug.c
index 14de1271463f..d89341162d35 100644
--- a/kernel/dma/debug.c
+++ b/kernel/dma/debug.c
@@ -235,10 +235,7 @@ static bool driver_filter(struct device *dev)
  */
 static int hash_fn(struct dma_debug_entry *entry)
 {
-	/*
-	 * Hash function is based on the dma address.
-	 * We use bits 20-27 here as the index into the hash
-	 */
+	/* Hash function is based on the dma address. */
 	return (entry->dev_addr >> HASH_FN_SHIFT) & HASH_FN_MASK;
 }
 
-- 
2.19.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
