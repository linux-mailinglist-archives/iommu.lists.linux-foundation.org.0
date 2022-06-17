Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 657DF54EF6B
	for <lists.iommu@lfdr.de>; Fri, 17 Jun 2022 05:20:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 913AA840D0;
	Fri, 17 Jun 2022 03:20:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 913AA840D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tXImZsc7EY-i; Fri, 17 Jun 2022 03:20:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 1937D8405D;
	Fri, 17 Jun 2022 03:20:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1937D8405D
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C017EC0081;
	Fri, 17 Jun 2022 03:20:16 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DCF3CC002D
 for <iommu@lists.linux-foundation.org>; Fri, 17 Jun 2022 02:06:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A75D241856
 for <iommu@lists.linux-foundation.org>; Fri, 17 Jun 2022 02:06:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A75D241856
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6HFRcMF9ptlc for <iommu@lists.linux-foundation.org>;
 Fri, 17 Jun 2022 02:06:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84080417E0
Received: from unicom145.biz-email.net (unicom145.biz-email.net
 [210.51.26.145])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 84080417E0
 for <iommu@lists.linux-foundation.org>; Fri, 17 Jun 2022 02:06:04 +0000 (UTC)
Received: from ([60.208.111.195])
 by unicom145.biz-email.net ((D)) with ASMTP (SSL) id LYX00100;
 Fri, 17 Jun 2022 10:06:00 +0800
Received: from localhost.localdomain (10.200.104.97) by
 jtjnmail201602.home.langchao.com (10.100.2.2) with Microsoft SMTP Server id
 15.1.2308.27; Fri, 17 Jun 2022 10:05:59 +0800
From: Bo Liu <liubo03@inspur.com>
To: <joro@8bytes.org>, <will@kernel.org>
Subject: [PATCH] iommu: Remove usage of the deprecated ida_simple_xxx API
Date: Thu, 16 Jun 2022 22:05:55 -0400
Message-ID: <20220617020555.2361-1-liubo03@inspur.com>
X-Mailer: git-send-email 2.18.2
MIME-Version: 1.0
X-Originating-IP: [10.200.104.97]
tUid: 2022617100600453ddd2e082b575ad03dc12b7589ef45
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
X-Mailman-Approved-At: Fri, 17 Jun 2022 03:20:16 +0000
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 Bo Liu <liubo03@inspur.com>
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

Use ida_alloc_xxx()/ida_free() instead of
ida_simple_get()/ida_simple_remove().
The latter is deprecated and more verbose.

Signed-off-by: Bo Liu <liubo03@inspur.com>
---
 drivers/iommu/iommu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 847ad47a2dfd..cdc86c39954e 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -600,7 +600,7 @@ static void iommu_group_release(struct kobject *kobj)
 	if (group->iommu_data_release)
 		group->iommu_data_release(group->iommu_data);
 
-	ida_simple_remove(&iommu_group_ida, group->id);
+	ida_free(&iommu_group_ida, group->id);
 
 	if (group->default_domain)
 		iommu_domain_free(group->default_domain);
@@ -641,7 +641,7 @@ struct iommu_group *iommu_group_alloc(void)
 	INIT_LIST_HEAD(&group->devices);
 	INIT_LIST_HEAD(&group->entry);
 
-	ret = ida_simple_get(&iommu_group_ida, 0, 0, GFP_KERNEL);
+	ret = ida_alloc(&iommu_group_ida, GFP_KERNEL);
 	if (ret < 0) {
 		kfree(group);
 		return ERR_PTR(ret);
@@ -651,7 +651,7 @@ struct iommu_group *iommu_group_alloc(void)
 	ret = kobject_init_and_add(&group->kobj, &iommu_group_ktype,
 				   NULL, "%d", group->id);
 	if (ret) {
-		ida_simple_remove(&iommu_group_ida, group->id);
+		ida_free(&iommu_group_ida, group->id);
 		kobject_put(&group->kobj);
 		return ERR_PTR(ret);
 	}
-- 
2.27.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
