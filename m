Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E45454C58E
	for <lists.iommu@lfdr.de>; Wed, 15 Jun 2022 12:12:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9616340C56;
	Wed, 15 Jun 2022 10:12:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IFYKjWjm4AiF; Wed, 15 Jun 2022 10:12:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 07F1340C17;
	Wed, 15 Jun 2022 10:12:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CCD40C002D;
	Wed, 15 Jun 2022 10:12:11 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 18DD9C0083
 for <iommu@lists.linux-foundation.org>; Wed, 15 Jun 2022 10:12:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B7EAB40BCC
 for <iommu@lists.linux-foundation.org>; Wed, 15 Jun 2022 10:11:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0EgfXy8eREKU for <iommu@lists.linux-foundation.org>;
 Wed, 15 Jun 2022 10:11:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AE2DA40BCB
 for <iommu@lists.linux-foundation.org>; Wed, 15 Jun 2022 10:11:52 +0000 (UTC)
Received: from fraeml736-chm.china.huawei.com (unknown [172.18.147.201])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4LNLgh0hgjz6GDDV;
 Wed, 15 Jun 2022 18:11:44 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml736-chm.china.huawei.com (10.206.15.217) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 15 Jun 2022 12:11:49 +0200
Received: from A2006125610.china.huawei.com (10.202.227.178) by
 lhreml710-chm.china.huawei.com (10.201.108.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 15 Jun 2022 11:11:42 +0100
To: <linux-arm-kernel@lists.infradead.org>, <linux-acpi@vger.kernel.org>,
 <iommu@lists.linux-foundation.org>
Subject: [PATCH v13 2/9] ACPI/IORT: Make iort_iommu_msi_get_resv_regions()
 return void
Date: Wed, 15 Jun 2022 11:10:37 +0100
Message-ID: <20220615101044.1972-3-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20220615101044.1972-1-shameerali.kolothum.thodi@huawei.com>
References: <20220615101044.1972-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.202.227.178]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Cc: robin.murphy@arm.com, jon@solid-run.com, linuxarm@huawei.com,
 steven.price@arm.com, hch@infradead.org, guohanjun@huawei.com,
 Sami.Mujawar@arm.com, will@kernel.org, wanghuiqiang@huawei.com
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
From: Shameer Kolothum via iommu <iommu@lists.linux-foundation.org>
Reply-To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

At present iort_iommu_msi_get_resv_regions() returns the number of
MSI reserved regions on success and there are no users for this.
The reserved region list will get populated anyway for platforms
that require the HW MSI region reservation. Hence, change the
function to return void instead.

Reviewed-by: Christoph Hellwig <hch@lst.de>
Tested-by: Steven Price <steven.price@arm.com>
Tested-by: Laurentiu Tudor <laurentiu.tudor@nxp.com>
Reviewed-by: Hanjun Guo <guohanjun@huawei.com>
Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 drivers/acpi/arm64/iort.c | 25 +++++++++----------------
 include/linux/acpi_iort.h |  6 +++---
 2 files changed, 12 insertions(+), 19 deletions(-)

diff --git a/drivers/acpi/arm64/iort.c b/drivers/acpi/arm64/iort.c
index f2f8f05662de..213f61cae176 100644
--- a/drivers/acpi/arm64/iort.c
+++ b/drivers/acpi/arm64/iort.c
@@ -811,22 +811,19 @@ static struct acpi_iort_node *iort_get_msi_resv_iommu(struct device *dev)
  * @dev: Device from iommu_get_resv_regions()
  * @head: Reserved region list from iommu_get_resv_regions()
  *
- * Returns: Number of msi reserved regions on success (0 if platform
- *          doesn't require the reservation or no associated msi regions),
- *          appropriate error value otherwise. The ITS interrupt translation
- *          spaces (ITS_base + SZ_64K, SZ_64K) associated with the device
- *          are the msi reserved regions.
+ * The ITS interrupt translation spaces (ITS_base + SZ_64K, SZ_64K)
+ * associated with the device are the HW MSI reserved regions.
  */
-int iort_iommu_msi_get_resv_regions(struct device *dev, struct list_head *head)
+void iort_iommu_msi_get_resv_regions(struct device *dev, struct list_head *head)
 {
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
 	struct acpi_iort_its_group *its;
 	struct acpi_iort_node *iommu_node, *its_node = NULL;
-	int i, resv = 0;
+	int i;
 
 	iommu_node = iort_get_msi_resv_iommu(dev);
 	if (!iommu_node)
-		return 0;
+		return;
 
 	/*
 	 * Current logic to reserve ITS regions relies on HW topologies
@@ -846,7 +843,7 @@ int iort_iommu_msi_get_resv_regions(struct device *dev, struct list_head *head)
 	}
 
 	if (!its_node)
-		return 0;
+		return;
 
 	/* Move to ITS specific data */
 	its = (struct acpi_iort_its_group *)its_node->node_data;
@@ -860,14 +857,10 @@ int iort_iommu_msi_get_resv_regions(struct device *dev, struct list_head *head)
 
 			region = iommu_alloc_resv_region(base + SZ_64K, SZ_64K,
 							 prot, IOMMU_RESV_MSI);
-			if (region) {
+			if (region)
 				list_add_tail(&region->list, head);
-				resv++;
-			}
 		}
 	}
-
-	return (resv == its->its_count) ? resv : -ENODEV;
 }
 
 static inline bool iort_iommu_driver_enabled(u8 type)
@@ -1034,8 +1027,8 @@ int iort_iommu_configure_id(struct device *dev, const u32 *id_in)
 }
 
 #else
-int iort_iommu_msi_get_resv_regions(struct device *dev, struct list_head *head)
-{ return 0; }
+void iort_iommu_msi_get_resv_regions(struct device *dev, struct list_head *head)
+{ }
 int iort_iommu_configure_id(struct device *dev, const u32 *input_id)
 { return -ENODEV; }
 #endif
diff --git a/include/linux/acpi_iort.h b/include/linux/acpi_iort.h
index f1f0842a2cb2..a8198b83753d 100644
--- a/include/linux/acpi_iort.h
+++ b/include/linux/acpi_iort.h
@@ -36,7 +36,7 @@ int iort_pmsi_get_dev_id(struct device *dev, u32 *dev_id);
 /* IOMMU interface */
 int iort_dma_get_ranges(struct device *dev, u64 *size);
 int iort_iommu_configure_id(struct device *dev, const u32 *id_in);
-int iort_iommu_msi_get_resv_regions(struct device *dev, struct list_head *head);
+void iort_iommu_msi_get_resv_regions(struct device *dev, struct list_head *head);
 phys_addr_t acpi_iort_dma_get_max_cpu_address(void);
 #else
 static inline void acpi_iort_init(void) { }
@@ -52,8 +52,8 @@ static inline int iort_dma_get_ranges(struct device *dev, u64 *size)
 static inline int iort_iommu_configure_id(struct device *dev, const u32 *id_in)
 { return -ENODEV; }
 static inline
-int iort_iommu_msi_get_resv_regions(struct device *dev, struct list_head *head)
-{ return 0; }
+void iort_iommu_msi_get_resv_regions(struct device *dev, struct list_head *head)
+{ }
 
 static inline phys_addr_t acpi_iort_dma_get_max_cpu_address(void)
 { return PHYS_ADDR_MAX; }
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
