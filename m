Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 4028271131
	for <lists.iommu@lfdr.de>; Tue, 23 Jul 2019 07:28:11 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1EC5ACC4;
	Tue, 23 Jul 2019 05:27:58 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 55441CB1
	for <iommu@lists.linux-foundation.org>;
	Tue, 23 Jul 2019 05:27:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
	[210.160.252.171])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 6B02D224
	for <iommu@lists.linux-foundation.org>;
	Tue, 23 Jul 2019 05:27:54 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,297,1559487600"; d="scan'208";a="22145536"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
	by relmlie5.idc.renesas.com with ESMTP; 23 Jul 2019 14:27:52 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 1BF7041E40B1;
	Tue, 23 Jul 2019 14:27:52 +0900 (JST)
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: ulf.hansson@linaro.org, hch@lst.de, m.szyprowski@samsung.com,
	robin.murphy@arm.com, joro@8bytes.org, axboe@kernel.dk
Subject: [PATCH v8 1/5] dma: Introduce dma_get_merge_boundary()
Date: Tue, 23 Jul 2019 14:26:44 +0900
Message-Id: <1563859608-19456-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563859608-19456-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1563859608-19456-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-renesas-soc@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-block@vger.kernel.org, wsa+renesas@sang-engineering.com,
	iommu@lists.linux-foundation.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

This patch adds a new DMA API "dma_get_merge_boundary". This function
returns the DMA merge boundary if the DMA layer can merge the segments.
This patch also adds the implementation for a new dma_map_ops pointer.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 Documentation/DMA-API.txt   |  8 ++++++++
 include/linux/dma-mapping.h |  6 ++++++
 kernel/dma/mapping.c        | 11 +++++++++++
 3 files changed, 25 insertions(+)

diff --git a/Documentation/DMA-API.txt b/Documentation/DMA-API.txt
index e47c63b..9c4dd3d 100644
--- a/Documentation/DMA-API.txt
+++ b/Documentation/DMA-API.txt
@@ -204,6 +204,14 @@ Returns the maximum size of a mapping for the device. The size parameter
 of the mapping functions like dma_map_single(), dma_map_page() and
 others should not be larger than the returned value.
 
+::
+
+	unsigned long
+	dma_get_merge_boundary(struct device *dev);
+
+Returns the DMA merge boundary. If the device cannot merge any the DMA address
+segments, the function returns 0.
+
 Part Id - Streaming DMA mappings
 --------------------------------
 
diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index e11b115..f700f8a 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -131,6 +131,7 @@ struct dma_map_ops {
 	int (*dma_supported)(struct device *dev, u64 mask);
 	u64 (*get_required_mask)(struct device *dev);
 	size_t (*max_mapping_size)(struct device *dev);
+	unsigned long (*get_merge_boundary)(struct device *dev);
 };
 
 #define DMA_MAPPING_ERROR		(~(dma_addr_t)0)
@@ -467,6 +468,7 @@ int dma_set_mask(struct device *dev, u64 mask);
 int dma_set_coherent_mask(struct device *dev, u64 mask);
 u64 dma_get_required_mask(struct device *dev);
 size_t dma_max_mapping_size(struct device *dev);
+unsigned long dma_get_merge_boundary(struct device *dev);
 #else /* CONFIG_HAS_DMA */
 static inline dma_addr_t dma_map_page_attrs(struct device *dev,
 		struct page *page, size_t offset, size_t size,
@@ -572,6 +574,10 @@ static inline size_t dma_max_mapping_size(struct device *dev)
 {
 	return 0;
 }
+static inline unsigned long dma_get_merge_boundary(struct device *dev)
+{
+	return 0;
+}
 #endif /* CONFIG_HAS_DMA */
 
 static inline dma_addr_t dma_map_single_attrs(struct device *dev, void *ptr,
diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index 1f628e7..e8da02e 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -379,3 +379,14 @@ size_t dma_max_mapping_size(struct device *dev)
 	return size;
 }
 EXPORT_SYMBOL_GPL(dma_max_mapping_size);
+
+unsigned long dma_get_merge_boundary(struct device *dev)
+{
+	const struct dma_map_ops *ops = get_dma_ops(dev);
+
+	if (!ops || !ops->get_merge_boundary)
+		return 0;	/* can't merge */
+
+	return ops->get_merge_boundary(dev);
+}
+EXPORT_SYMBOL_GPL(dma_get_merge_boundary);
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
