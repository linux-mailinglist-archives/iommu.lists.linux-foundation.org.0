Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 430631EA5BB
	for <lists.iommu@lfdr.de>; Mon,  1 Jun 2020 16:24:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D8EE885EA5;
	Mon,  1 Jun 2020 14:24:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id faHSbHBv3f2D; Mon,  1 Jun 2020 14:24:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8D1C385E93;
	Mon,  1 Jun 2020 14:24:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 71BDBC0895;
	Mon,  1 Jun 2020 14:24:48 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4B2C2C0176
 for <iommu@lists.linux-foundation.org>; Mon,  1 Jun 2020 08:11:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 3A4C489484
 for <iommu@lists.linux-foundation.org>; Mon,  1 Jun 2020 08:11:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AcFf9oQ1AAxn for <iommu@lists.linux-foundation.org>;
 Mon,  1 Jun 2020 08:11:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from out30-130.freemail.mail.aliyun.com
 (out30-130.freemail.mail.aliyun.com [115.124.30.130])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 523CD8777B
 for <iommu@lists.linux-foundation.org>; Mon,  1 Jun 2020 08:11:41 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R151e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e01358;
 MF=baolin.wang@linux.alibaba.com; NM=1; PH=DS; RN=4; SR=0;
 TI=SMTPD_---0U-BjZZW_1590999096; 
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com
 fp:SMTPD_---0U-BjZZW_1590999096) by smtp.aliyun-inc.com(127.0.0.1);
 Mon, 01 Jun 2020 16:11:37 +0800
From: Baolin Wang <baolin.wang@linux.alibaba.com>
To: joro@8bytes.org
Subject: [PATCH] iommu: Optimize the error handling when allocating an iommu
 group
Date: Mon,  1 Jun 2020 16:11:06 +0800
Message-Id: <1590999066-92237-1-git-send-email-baolin.wang@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
X-Mailman-Approved-At: Mon, 01 Jun 2020 14:24:47 +0000
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 baolin.wang@linux.alibaba.com
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Optimize the error handling to free the resources correctly when
failed to allocate an iommu group.

Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
 drivers/iommu/iommu.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 03d6a26..ac91024 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -529,12 +529,18 @@ struct iommu_group *iommu_group_alloc(void)
 
 	ret = iommu_group_create_file(group,
 				      &iommu_group_attr_reserved_regions);
-	if (ret)
+	if (ret) {
+		kobject_put(group->devices_kobj);
 		return ERR_PTR(ret);
+	}
 
 	ret = iommu_group_create_file(group, &iommu_group_attr_type);
-	if (ret)
+	if (ret) {
+		iommu_group_remove_file(group,
+					&iommu_group_attr_reserved_regions);
+		kobject_put(group->devices_kobj);
 		return ERR_PTR(ret);
+	}
 
 	pr_debug("Allocated group %d\n", group->id);
 
-- 
1.8.3.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
