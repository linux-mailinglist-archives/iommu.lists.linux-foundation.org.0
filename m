Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BC637F914
	for <lists.iommu@lfdr.de>; Thu, 13 May 2021 15:47:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB00640F0C;
	Thu, 13 May 2021 13:47:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VdpjypbfEhbq; Thu, 13 May 2021 13:47:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B781403EF;
	Thu, 13 May 2021 13:47:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 61858C0001;
	Thu, 13 May 2021 13:47:19 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9105DC0001
 for <iommu@lists.linux-foundation.org>; Thu, 13 May 2021 13:47:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F909403EF
 for <iommu@lists.linux-foundation.org>; Thu, 13 May 2021 13:47:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yWUyvh_uBZOF for <iommu@lists.linux-foundation.org>;
 Thu, 13 May 2021 13:47:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 576A340FAD
 for <iommu@lists.linux-foundation.org>; Thu, 13 May 2021 13:47:16 +0000 (UTC)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FgtD70GSdzqSrx;
 Thu, 13 May 2021 21:43:51 +0800 (CST)
Received: from A2006125610.china.huawei.com (10.47.81.63) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.498.0; Thu, 13 May 2021 21:47:06 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <linux-arm-kernel@lists.infradead.org>, <linux-acpi@vger.kernel.org>,
 <iommu@lists.linux-foundation.org>
Subject: [PATCH v4 8/8] iommu/dma: Reserve any RMR regions associated with a
 dev
Date: Thu, 13 May 2021 14:45:50 +0100
Message-ID: <20210513134550.2117-9-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20210513134550.2117-1-shameerali.kolothum.thodi@huawei.com>
References: <20210513134550.2117-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.47.81.63]
X-CFilter-Loop: Reflected
Cc: jon@solid-run.com, linuxarm@huawei.com, steven.price@arm.com,
 guohanjun@huawei.com, yangyicong@huawei.com, Sami.Mujawar@arm.com,
 robin.murphy@arm.com, wanghuiqiang@huawei.com
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

Get ACPI IORT RMR regions associated with a dev reserved
so that there is a unity mapping for them in SMMU.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 drivers/iommu/dma-iommu.c | 66 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 61 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 2d9caf548a32..6838caf3e8ff 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -174,22 +174,78 @@ void iommu_put_dma_cookie(struct iommu_domain *domain)
 }
 EXPORT_SYMBOL(iommu_put_dma_cookie);
 
+static bool iommu_dma_dev_has_rmr(struct iommu_fwspec *fwspec,
+				  struct iommu_rmr *e)
+{
+	int i;
+
+	for (i = 0; i < fwspec->num_ids; i++) {
+		if (e->sid == fwspec->ids[i])
+			return true;
+	}
+
+	return false;
+}
+
+static void iommu_dma_get_rmr_resv_regions(struct device *dev,
+					   struct list_head *list)
+{
+	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
+	struct list_head rmr_list;
+	struct iommu_rmr *rmr;
+
+	INIT_LIST_HEAD(&rmr_list);
+	if (iommu_dma_get_rmrs(fwspec->iommu_fwnode, &rmr_list))
+		return;
+
+	if (dev_is_pci(dev)) {
+		struct pci_dev *pdev = to_pci_dev(dev);
+		struct pci_host_bridge *host = pci_find_host_bridge(pdev->bus);
+
+		if (!host->preserve_config)
+			return;
+	}
+
+	list_for_each_entry(rmr, &rmr_list, list) {
+		int prot = IOMMU_READ | IOMMU_WRITE | IOMMU_NOEXEC | IOMMU_MMIO;
+		struct iommu_resv_region *region;
+		enum iommu_resv_type type;
+
+		if (!iommu_dma_dev_has_rmr(fwspec, rmr))
+			continue;
+
+		if (rmr->flags & IOMMU_RMR_REMAP_PERMITTED)
+			type = IOMMU_RESV_DIRECT_RELAXABLE;
+		else
+			type = IOMMU_RESV_DIRECT;
+
+		region = iommu_alloc_resv_region(rmr->base_address,
+						 rmr->length, prot,
+						 type);
+		if (!region)
+			return;
+
+		list_add_tail(&region->list, list);
+	}
+}
 /**
  * iommu_dma_get_resv_regions - Reserved region driver helper
  * @dev: Device from iommu_get_resv_regions()
  * @list: Reserved region list from iommu_get_resv_regions()
  *
  * IOMMU drivers can use this to implement their .get_resv_regions callback
- * for general non-IOMMU-specific reservations. Currently, this covers GICv3
- * ITS region reservation on ACPI based ARM platforms that may require HW MSI
- * reservation.
+ * for general non-IOMMU-specific reservations. Currently this covers,
+ *  -GICv3 ITS region reservation on ACPI based ARM platforms that may
+ *   require HW MSI reservation.
+ *  -Any ACPI IORT RMR memory range reservations (IORT spec rev E.b)
  */
 void iommu_dma_get_resv_regions(struct device *dev, struct list_head *list)
 {
 
-	if (!is_of_node(dev_iommu_fwspec_get(dev)->iommu_fwnode))
+	if (!is_of_node(dev_iommu_fwspec_get(dev)->iommu_fwnode)) {
 		iort_iommu_msi_get_resv_regions(dev, list);
-
+		iommu_dma_get_rmr_resv_regions(dev, list);
+	}
 }
 EXPORT_SYMBOL(iommu_dma_get_resv_regions);
 
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
