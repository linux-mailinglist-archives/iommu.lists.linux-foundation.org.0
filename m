Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E7134A495
	for <lists.iommu@lfdr.de>; Fri, 26 Mar 2021 10:37:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFE8484B6D;
	Fri, 26 Mar 2021 09:37:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ev5Zs3Mf6uVD; Fri, 26 Mar 2021 09:37:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id D67EF84B83;
	Fri, 26 Mar 2021 09:37:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 23A6CC0017;
	Fri, 26 Mar 2021 09:37:04 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 294E5C000A
 for <iommu@lists.linux-foundation.org>; Fri, 26 Mar 2021 09:37:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 09DDE414D1
 for <iommu@lists.linux-foundation.org>; Fri, 26 Mar 2021 09:37:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CdOvc7MAOCfd for <iommu@lists.linux-foundation.org>;
 Fri, 26 Mar 2021 09:37:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AFF4A40F87
 for <iommu@lists.linux-foundation.org>; Fri, 26 Mar 2021 09:37:00 +0000 (UTC)
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4F6GyR61PHzPn9f;
 Fri, 26 Mar 2021 17:34:23 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.498.0; Fri, 26 Mar 2021 17:36:49 +0800
From: Zhiqi Song <songzhiqi1@huawei.com>
To: <will@kernel.org>, <joro@8bytes.org>, <robin.murphy@arm.com>,
 <robdclark@gmail.com>
Subject: [PATCH 2/3] drivers: iommu/amd - coding style fix
Date: Fri, 26 Mar 2021 17:37:16 +0800
Message-ID: <1616751437-59956-3-git-send-email-songzhiqi1@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1616751437-59956-1-git-send-email-songzhiqi1@huawei.com>
References: <1616751437-59956-1-git-send-email-songzhiqi1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Cc: linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
 fanghao11@huawei.com, shenyang39@huawei.com
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

Fixed following checkpatch errors:
- code indent should use tabs where possible
- space prohibited before ','

Signed-off-by: Zhiqi Song <songzhiqi1@huawei.com>
---
 drivers/iommu/amd/init.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/amd/init.c b/drivers/iommu/amd/init.c
index 6a1f704..958fa17 100644
--- a/drivers/iommu/amd/init.c
+++ b/drivers/iommu/amd/init.c
@@ -997,7 +997,7 @@ static bool copy_device_table(void)
 				return false;
 			}

-		        old_dev_tbl_cpy[devid].data[2] = old_devtb[devid].data[2];
+			old_dev_tbl_cpy[devid].data[2] = old_devtb[devid].data[2];
 		}
 	}
 	memunmap(old_devtb);
@@ -1248,7 +1248,7 @@ static int __init init_iommu_from_acpi(struct amd_iommu *iommu,

 			devid = e->devid;
 			devid_to = e->ext >> 8;
-			set_dev_entry_from_acpi(iommu, devid   , e->flags, 0);
+			set_dev_entry_from_acpi(iommu, devid, e->flags, 0);
 			set_dev_entry_from_acpi(iommu, devid_to, e->flags, 0);
 			amd_iommu_alias_table[devid] = devid_to;
 			break;
--
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
