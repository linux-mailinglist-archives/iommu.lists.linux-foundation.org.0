Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id AB42A37F902
	for <lists.iommu@lfdr.de>; Thu, 13 May 2021 15:46:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A860606C1;
	Thu, 13 May 2021 13:46:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cf65A7xOVBAu; Thu, 13 May 2021 13:46:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F9A0608F1;
	Thu, 13 May 2021 13:46:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 28C0BC0001;
	Thu, 13 May 2021 13:46:40 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EC4ECC0001
 for <iommu@lists.linux-foundation.org>; Thu, 13 May 2021 13:46:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DBE738449C
 for <iommu@lists.linux-foundation.org>; Thu, 13 May 2021 13:46:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DZiqGGASeYcE for <iommu@lists.linux-foundation.org>;
 Thu, 13 May 2021 13:46:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7718F8444D
 for <iommu@lists.linux-foundation.org>; Thu, 13 May 2021 13:46:36 +0000 (UTC)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FgtD86xGHz16Njp;
 Thu, 13 May 2021 21:43:52 +0800 (CST)
Received: from A2006125610.china.huawei.com (10.47.81.63) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.498.0; Thu, 13 May 2021 21:46:27 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <linux-arm-kernel@lists.infradead.org>, <linux-acpi@vger.kernel.org>,
 <iommu@lists.linux-foundation.org>
Subject: [PATCH v4 2/8] iommu/dma: Introduce generic helper to retrieve RMR
 info
Date: Thu, 13 May 2021 14:45:44 +0100
Message-ID: <20210513134550.2117-3-shameerali.kolothum.thodi@huawei.com>
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

Reserved Memory Regions(RMR) associated with an IOMMU can be
described through ACPI IORT tables in systems with devices
that require a unity mapping or bypass for those
regions.

Introduce a generic interface so that IOMMU drivers can retrieve
and set up necessary mappings.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 drivers/iommu/dma-iommu.c | 33 +++++++++++++++++++++++++++++++++
 include/linux/dma-iommu.h | 10 ++++++++++
 include/linux/iommu.h     | 19 +++++++++++++++++++
 3 files changed, 62 insertions(+)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 7bcdd1205535..674bd8815159 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -193,6 +193,39 @@ void iommu_dma_get_resv_regions(struct device *dev, struct list_head *list)
 }
 EXPORT_SYMBOL(iommu_dma_get_resv_regions);
 
+/**
+ * iommu_dma_get_rmrs - Retrieve Reserved Memory Regions(RMRs) associated
+ *                      with a given IOMMU
+ * @iommu_fwnode: fwnode associated with IOMMU
+ * @list: RMR list to be populated
+ *
+ */
+int iommu_dma_get_rmrs(struct fwnode_handle *iommu_fwnode,
+		       struct list_head *list)
+{
+	return -EINVAL;
+}
+EXPORT_SYMBOL(iommu_dma_get_rmrs);
+
+struct iommu_rmr *iommu_dma_alloc_rmr(u64 base, u64 length, u32 sid,
+				      u32 flags)
+{
+	struct iommu_rmr *rmr;
+
+	rmr = kzalloc(sizeof(*rmr), GFP_KERNEL);
+	if (!rmr)
+		return NULL;
+
+	INIT_LIST_HEAD(&rmr->list);
+	rmr->base_address = base;
+	rmr->length = length;
+	rmr->sid = sid;
+	rmr->flags = flags;
+
+	return rmr;
+}
+EXPORT_SYMBOL(iommu_dma_alloc_rmr);
+
 static int cookie_init_hw_msi_region(struct iommu_dma_cookie *cookie,
 		phys_addr_t start, phys_addr_t end)
 {
diff --git a/include/linux/dma-iommu.h b/include/linux/dma-iommu.h
index 6e75a2d689b4..319f332c279f 100644
--- a/include/linux/dma-iommu.h
+++ b/include/linux/dma-iommu.h
@@ -42,12 +42,17 @@ void iommu_dma_free_cpu_cached_iovas(unsigned int cpu,
 
 extern bool iommu_dma_forcedac;
 
+int iommu_dma_get_rmrs(struct fwnode_handle *iommu, struct list_head *list);
+struct iommu_rmr *iommu_dma_alloc_rmr(u64 base, u64 length, u32 sid, u32 flags);
+
 #else /* CONFIG_IOMMU_DMA */
 
 struct iommu_domain;
 struct msi_desc;
 struct msi_msg;
 struct device;
+struct fwnode_handle;
+struct iommu_rmr;
 
 static inline void iommu_setup_dma_ops(struct device *dev, u64 dma_base,
 		u64 size)
@@ -83,5 +88,10 @@ static inline void iommu_dma_get_resv_regions(struct device *dev, struct list_he
 {
 }
 
+int iommu_dma_get_rmrs(struct fwnode_handle *iommu, struct list_head *list)
+{
+	return -ENODEV;
+}
+
 #endif	/* CONFIG_IOMMU_DMA */
 #endif	/* __DMA_IOMMU_H */
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 32d448050bf7..73cd2831cb45 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -555,6 +555,25 @@ struct iommu_sva {
 	struct device			*dev;
 };
 
+/**
+ * struct iommu_rmr - Reserved Memory Region details per IOMMU
+ * @list: Linked list pointers to hold RMR region info
+ * @base_address: base address of Reserved Memory Region
+ * @length: length of memory region
+ * @sid: associated stream id
+ * @flags: flags that apply to the RMR node
+ */
+struct iommu_rmr {
+	struct list_head	list;
+	phys_addr_t		base_address;
+	u64			length;
+	u32			sid;
+	u32			flags;
+};
+
+/* RMR Remap permitted */
+#define IOMMU_RMR_REMAP_PERMITTED	(1 << 0)
+
 int iommu_fwspec_init(struct device *dev, struct fwnode_handle *iommu_fwnode,
 		      const struct iommu_ops *ops);
 void iommu_fwspec_free(struct device *dev);
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
