Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8BE452E2B
	for <lists.iommu@lfdr.de>; Tue, 16 Nov 2021 10:39:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 748FE607E2;
	Tue, 16 Nov 2021 09:39:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id svilL7VUhN5O; Tue, 16 Nov 2021 09:39:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 8E5A1607D9;
	Tue, 16 Nov 2021 09:39:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4E98EC0032;
	Tue, 16 Nov 2021 09:39:27 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4A23DC0012
 for <iommu@lists.linux-foundation.org>; Tue, 16 Nov 2021 09:09:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1F0C3403F6
 for <iommu@lists.linux-foundation.org>; Tue, 16 Nov 2021 09:09:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fMmr24zhmo_l for <iommu@lists.linux-foundation.org>;
 Tue, 16 Nov 2021 09:09:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D5D93400C9
 for <iommu@lists.linux-foundation.org>; Tue, 16 Nov 2021 09:09:12 +0000 (UTC)
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4HtgGT3hNbz918F;
 Tue, 16 Nov 2021 17:08:49 +0800 (CST)
Received: from dggema772-chm.china.huawei.com (10.1.198.214) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.20; Tue, 16 Nov 2021 17:09:09 +0800
Received: from localhost.localdomain (10.67.165.2) by
 dggema772-chm.china.huawei.com (10.1.198.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.20; Tue, 16 Nov 2021 17:09:09 +0800
To: <gregkh@linuxfoundation.org>, <helgaas@kernel.org>,
 <alexander.shishkin@linux.intel.com>, <lorenzo.pieralisi@arm.com>,
 <will@kernel.org>, <mark.rutland@arm.com>, <mathieu.poirier@linaro.org>,
 <suzuki.poulose@arm.com>, <mike.leach@linaro.org>, <leo.yan@linaro.org>,
 <jonathan.cameron@huawei.com>, <daniel.thompson@linaro.org>,
 <joro@8bytes.org>, <john.garry@huawei.com>,
 <shameerali.kolothum.thodi@huawei.com>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <coresight@lists.linaro.org>,
 <linux-pci@vger.kernel.org>, <linux-perf-users@vger.kernel.org>,
 <iommu@lists.linux-foundation.org>
Subject: [PATCH v2 1/6] iommu: Export iommu_{get,put}_resv_regions()
Date: Tue, 16 Nov 2021 17:06:20 +0800
Message-ID: <20211116090625.53702-2-yangyicong@hisilicon.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20211116090625.53702-1-yangyicong@hisilicon.com>
References: <20211116090625.53702-1-yangyicong@hisilicon.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.165.2]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggema772-chm.china.huawei.com (10.1.198.214)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 16 Nov 2021 09:39:26 +0000
Cc: prime.zeng@huawei.com, linuxarm@huawei.com, yangyicong@hisilicon.com,
 zhangshaokun@hisilicon.com, liuqi115@huawei.com
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
From: Yicong Yang via iommu <iommu@lists.linux-foundation.org>
Reply-To: Yicong Yang <yangyicong@hisilicon.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Export iommu_{get,put}_resv_regions() to the modules so that the driver
can retrieve and use the reserved regions of the device.

Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 drivers/iommu/iommu.c | 2 ++
 include/linux/iommu.h | 4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index dd7863e453a5..e96711eee965 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2792,6 +2792,7 @@ void iommu_get_resv_regions(struct device *dev, struct list_head *list)
 	if (ops && ops->get_resv_regions)
 		ops->get_resv_regions(dev, list);
 }
+EXPORT_SYMBOL_GPL(iommu_get_resv_regions);
 
 void iommu_put_resv_regions(struct device *dev, struct list_head *list)
 {
@@ -2800,6 +2801,7 @@ void iommu_put_resv_regions(struct device *dev, struct list_head *list)
 	if (ops && ops->put_resv_regions)
 		ops->put_resv_regions(dev, list);
 }
+EXPORT_SYMBOL_GPL(iommu_put_resv_regions);
 
 /**
  * generic_iommu_put_resv_regions - Reserved region driver helper
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index d2f3435e7d17..1b7b0f370e28 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -450,8 +450,8 @@ extern phys_addr_t iommu_iova_to_phys(struct iommu_domain *domain, dma_addr_t io
 extern void iommu_set_fault_handler(struct iommu_domain *domain,
 			iommu_fault_handler_t handler, void *token);
 
-extern void iommu_get_resv_regions(struct device *dev, struct list_head *list);
-extern void iommu_put_resv_regions(struct device *dev, struct list_head *list);
+void iommu_get_resv_regions(struct device *dev, struct list_head *list);
+void iommu_put_resv_regions(struct device *dev, struct list_head *list);
 extern void generic_iommu_put_resv_regions(struct device *dev,
 					   struct list_head *list);
 extern void iommu_set_default_passthrough(bool cmd_line);
-- 
2.33.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
