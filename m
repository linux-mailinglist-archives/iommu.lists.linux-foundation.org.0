Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id C0556296ADA
	for <lists.iommu@lfdr.de>; Fri, 23 Oct 2020 10:02:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 698738709F;
	Fri, 23 Oct 2020 08:02:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QeSU6DSvyn9Y; Fri, 23 Oct 2020 08:02:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9E52F86F99;
	Fri, 23 Oct 2020 08:02:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 88A95C0052;
	Fri, 23 Oct 2020 08:02:00 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4DC6DC0051
 for <iommu@lists.linux-foundation.org>; Fri, 23 Oct 2020 06:48:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 29E58204DE
 for <iommu@lists.linux-foundation.org>; Fri, 23 Oct 2020 06:48:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tBGZcz25GyCg for <iommu@lists.linux-foundation.org>;
 Fri, 23 Oct 2020 06:48:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by silver.osuosl.org (Postfix) with ESMTPS id 85AD9204D0
 for <iommu@lists.linux-foundation.org>; Fri, 23 Oct 2020 06:48:36 +0000 (UTC)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 3CAF515D61C03B0106FB;
 Fri, 23 Oct 2020 14:48:29 +0800 (CST)
Received: from mdc.huawei.com (10.175.112.208) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.487.0; Fri, 23 Oct 2020 14:48:22 +0800
From: Chen Jun <chenjun102@huawei.com>
To: <linux-kernel@vger.kernel.org>, <iommu@lists.linux-foundation.org>
Subject: [PATCH] iommu: Modify the description of iommu_sva_unbind_device
Date: Fri, 23 Oct 2020 06:48:27 +0000
Message-ID: <20201023064827.74794-1-chenjun102@huawei.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-Originating-IP: [10.175.112.208]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 23 Oct 2020 08:01:58 +0000
Cc: rui.xiang@huawei.com, guohanjun@huawei.com
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

From: Chen Jun <c00424029@huawei.com>

iommu_sva_unbind_device has no return value.

Remove the description of the return value of the function.

Signed-off-by: Chen Jun <c00424029@huawei.com>
---
 drivers/iommu/iommu.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 8c470f4..bb51d53 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2995,8 +2995,6 @@ EXPORT_SYMBOL_GPL(iommu_sva_bind_device);
  * Put reference to a bond between device and address space. The device should
  * not be issuing any more transaction for this PASID. All outstanding page
  * requests for this PASID must have been flushed to the IOMMU.
- *
- * Returns 0 on success, or an error value
  */
 void iommu_sva_unbind_device(struct iommu_sva *handle)
 {
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
