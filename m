Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9B72E336D
	for <lists.iommu@lfdr.de>; Mon, 28 Dec 2020 02:26:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 37AD0860F8;
	Mon, 28 Dec 2020 01:26:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wyPVKyE2WAQi; Mon, 28 Dec 2020 01:26:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BA98E860F6;
	Mon, 28 Dec 2020 01:26:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9EC95C1D9F;
	Mon, 28 Dec 2020 01:26:25 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2EDF2C0891
 for <iommu@lists.linux-foundation.org>; Mon, 28 Dec 2020 01:26:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 14361860F2
 for <iommu@lists.linux-foundation.org>; Mon, 28 Dec 2020 01:26:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bl74aogLwdVK for <iommu@lists.linux-foundation.org>;
 Mon, 28 Dec 2020 01:26:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id AFD68860F6
 for <iommu@lists.linux-foundation.org>; Mon, 28 Dec 2020 01:26:22 +0000 (UTC)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4D40Gz4rHgz7Lsy;
 Mon, 28 Dec 2020 09:25:31 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.498.0; Mon, 28 Dec 2020 09:26:13 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <dwmw2@infradead.org>, <baolu.lu@linux.intel.com>, <joro@8bytes.org>,
 <will@kernel.org>
Subject: [PATCH] iommu/vt-d: Fix duplicate included linux/dma-map-ops.h
Date: Mon, 28 Dec 2020 09:26:14 +0800
Message-ID: <1609118774-10083-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Cc: iommu@lists.linux-foundation.org
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

linux/dma-map-ops.h is included more than once, Remove the one that
isn't necessary.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/iommu/intel/iommu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index 788119c..e6c8cc7 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -38,7 +38,6 @@
 #include <linux/dmi.h>
 #include <linux/pci-ats.h>
 #include <linux/memblock.h>
-#include <linux/dma-map-ops.h>
 #include <linux/dma-direct.h>
 #include <linux/crash_dump.h>
 #include <linux/numa.h>
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
