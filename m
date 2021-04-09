Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id E480935917A
	for <lists.iommu@lfdr.de>; Fri,  9 Apr 2021 03:31:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58EE884A50;
	Fri,  9 Apr 2021 01:31:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L9V6mQ3qt7Lp; Fri,  9 Apr 2021 01:31:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7323284A70;
	Fri,  9 Apr 2021 01:31:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 53B70C0011;
	Fri,  9 Apr 2021 01:31:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 03A46C000A
 for <iommu@lists.linux-foundation.org>; Fri,  9 Apr 2021 01:31:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D254C40133
 for <iommu@lists.linux-foundation.org>; Fri,  9 Apr 2021 01:31:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KqdoAmOgyDo3 for <iommu@lists.linux-foundation.org>;
 Fri,  9 Apr 2021 01:31:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9BF6A400FA
 for <iommu@lists.linux-foundation.org>; Fri,  9 Apr 2021 01:31:18 +0000 (UTC)
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FGgXP6xHJzlW2Z;
 Fri,  9 Apr 2021 09:29:25 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.498.0; Fri, 9 Apr 2021 09:31:03 +0800
From: Shaokun Zhang <zhangshaokun@hisilicon.com>
To: <iommu@lists.linux-foundation.org>
Subject: [PATCH] iommu/amd: Remove duplicate check of devid
Date: Fri, 9 Apr 2021 09:31:19 +0800
Message-ID: <1617931879-33139-1-git-send-email-zhangshaokun@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Cc: Shaokun Zhang <zhangshaokun@hisilicon.com>, Will Deacon <will@kernel.org>
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

'devid' has been checked in function check_device, no need to double
check and clean up this.

Cc: Joerg Roedel <joro@8bytes.org>
Cc: Will Deacon <will@kernel.org>
Signed-off-by: Shaokun Zhang <zhangshaokun@hisilicon.com>
---
 drivers/iommu/amd/iommu.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
index b4fa94a97446..4130df7c30c6 100644
--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -1676,10 +1676,6 @@ static struct iommu_device *amd_iommu_probe_device(struct device *dev)
 	if (!check_device(dev))
 		return ERR_PTR(-ENODEV);
 
-	devid = get_device_id(dev);
-	if (devid < 0)
-		return ERR_PTR(devid);
-
 	iommu = amd_iommu_rlookup_table[devid];
 
 	if (dev_iommu_priv_get(dev))
@@ -1967,10 +1963,6 @@ static void amd_iommu_detach_device(struct iommu_domain *dom,
 	if (!check_device(dev))
 		return;
 
-	devid = get_device_id(dev);
-	if (devid < 0)
-		return;
-
 	if (dev_data->domain != NULL)
 		detach_device(dev);
 
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
