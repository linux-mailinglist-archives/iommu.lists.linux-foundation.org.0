Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E423CB46D
	for <lists.iommu@lfdr.de>; Fri, 16 Jul 2021 10:36:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CFB01843B0;
	Fri, 16 Jul 2021 08:36:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tEZYgR_rFSVQ; Fri, 16 Jul 2021 08:36:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id DF455843B2;
	Fri, 16 Jul 2021 08:36:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B8AB9C000E;
	Fri, 16 Jul 2021 08:36:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 61A52C000E
 for <iommu@lists.linux-foundation.org>; Fri, 16 Jul 2021 08:36:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5053A843B4
 for <iommu@lists.linux-foundation.org>; Fri, 16 Jul 2021 08:36:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5eP-5rH0kvW0 for <iommu@lists.linux-foundation.org>;
 Fri, 16 Jul 2021 08:36:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 802C9843B0
 for <iommu@lists.linux-foundation.org>; Fri, 16 Jul 2021 08:36:05 +0000 (UTC)
Received: from fraeml704-chm.china.huawei.com (unknown [172.18.147.206])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4GR46T1Xzgz6H7NP;
 Fri, 16 Jul 2021 16:24:49 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml704-chm.china.huawei.com (10.206.15.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Fri, 16 Jul 2021 10:36:03 +0200
Received: from A2006125610.china.huawei.com (10.47.80.222) by
 lhreml710-chm.china.huawei.com (10.201.108.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 16 Jul 2021 09:35:56 +0100
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <linux-arm-kernel@lists.infradead.org>, <linux-acpi@vger.kernel.org>,
 <iommu@lists.linux-foundation.org>
Subject: [PATCH v6 9/9] iommu/dma: Reserve any RMR regions associated with a
 dev
Date: Fri, 16 Jul 2021 09:34:42 +0100
Message-ID: <20210716083442.1708-10-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20210716083442.1708-1-shameerali.kolothum.thodi@huawei.com>
References: <20210716083442.1708-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.47.80.222]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
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
 drivers/iommu/dma-iommu.c | 56 +++++++++++++++++++++++++++++++++++----
 1 file changed, 51 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 1b6e27475279..c1ae0c3d4b33 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -207,22 +207,68 @@ void iommu_dma_put_rmrs(struct fwnode_handle *iommu_fwnode,
 }
 EXPORT_SYMBOL(iommu_dma_put_rmrs);
 
+static bool iommu_dma_dev_has_rmr(struct iommu_fwspec *fwspec,
+				  struct iommu_resv_region *e)
+{
+	int i;
+
+	for (i = 0; i < fwspec->num_ids; i++) {
+		if (e->fw_data.rmr.sid == fwspec->ids[i])
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
+	struct iommu_resv_region *rmr, *tmp;
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
+	list_for_each_entry_safe(rmr, tmp, &rmr_list, list) {
+		if (!iommu_dma_dev_has_rmr(fwspec, rmr))
+			continue;
+
+		/* Remove from iommu RMR list and add to dev resv_regions */
+		list_del_init(&rmr->list);
+		list_add_tail(&rmr->list, list);
+	}
+
+	iommu_dma_put_rmrs(fwspec->iommu_fwnode, &rmr_list);
+}
+
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
