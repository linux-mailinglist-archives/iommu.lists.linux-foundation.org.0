Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CC5348795
	for <lists.iommu@lfdr.de>; Thu, 25 Mar 2021 04:42:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1F9E40EFC;
	Thu, 25 Mar 2021 03:42:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 55CCbadVlEkU; Thu, 25 Mar 2021 03:42:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBD7440EEF;
	Thu, 25 Mar 2021 03:42:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AE4F9C000A;
	Thu, 25 Mar 2021 03:42:48 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5250EC000A
 for <iommu@lists.linux-foundation.org>; Thu, 25 Mar 2021 03:42:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 400C760AD6
 for <iommu@lists.linux-foundation.org>; Thu, 25 Mar 2021 03:42:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HA3ividB98IX for <iommu@lists.linux-foundation.org>;
 Thu, 25 Mar 2021 03:42:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BC47060725
 for <iommu@lists.linux-foundation.org>; Thu, 25 Mar 2021 03:42:44 +0000 (UTC)
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4F5W9B0HJRzkfX3;
 Thu, 25 Mar 2021 11:41:02 +0800 (CST)
Received: from localhost.localdomain (10.69.192.58) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.498.0; Thu, 25 Mar 2021 11:42:30 +0800
From: chenxiang <chenxiang66@hisilicon.com>
To: <yong.wu@mediatek.com>, <robin.murphy@arm.com>, <will@kernel.org>
Subject: [PATCH] iommu: Fix a boundary issue to avoid performance drop
Date: Thu, 25 Mar 2021 11:38:24 +0800
Message-ID: <1616643504-120688-1-git-send-email-chenxiang66@hisilicon.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
X-Originating-IP: [10.69.192.58]
X-CFilter-Loop: Reflected
Cc: iommu@lists.linux-foundation.org, linuxarm@openeuler.org
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

After the change of patch ("iommu: Switch gather->end to the 
inclusive end"), the performace drops from 1600+K IOPS to 1200K in our 
kunpeng ARM64 platform.
We find that the range [start1, end1) actually is joint from the range
[end1, end2), but it is considered as disjoint after the change,
so it needs more times of TLB sync, and spends more time on it.
So fix the boundary issue to avoid performance drop.

Fixes: 862c3715de8f ("iommu: Switch gather->end to the inclusive end")
Signed-off-by: Xiang Chen <chenxiang66@hisilicon.com>
---
 include/linux/iommu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index ae8eddd..4d5bcc2 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -547,7 +547,7 @@ static inline void iommu_iotlb_gather_add_page(struct iommu_domain *domain,
 	 * structure can be rewritten.
 	 */
 	if (gather->pgsize != size ||
-	    end < gather->start || start > gather->end) {
+	    end + 1 < gather->start || start > gather->end + 1) {
 		if (gather->pgsize)
 			iommu_iotlb_sync(domain, gather);
 		gather->pgsize = size;
-- 
2.8.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
