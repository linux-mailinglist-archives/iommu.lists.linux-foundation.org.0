Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 4645C28A0BB
	for <lists.iommu@lfdr.de>; Sat, 10 Oct 2020 17:12:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 83A2D87565;
	Sat, 10 Oct 2020 15:12:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3AcCsm3Isu6y; Sat, 10 Oct 2020 15:12:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 50F9687846;
	Sat, 10 Oct 2020 15:12:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3BF5FC0051;
	Sat, 10 Oct 2020 15:12:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5880AC0051
 for <iommu@lists.linux-foundation.org>; Sat, 10 Oct 2020 15:12:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 460E7204B2
 for <iommu@lists.linux-foundation.org>; Sat, 10 Oct 2020 15:12:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zMpucbeJ0oma for <iommu@lists.linux-foundation.org>;
 Sat, 10 Oct 2020 15:12:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by silver.osuosl.org (Postfix) with ESMTPS id 8C1E7204BC
 for <iommu@lists.linux-foundation.org>; Sat, 10 Oct 2020 15:12:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3053EB132;
 Sat, 10 Oct 2020 15:12:46 +0000 (UTC)
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: robh+dt@kernel.org, catalin.marinas@arm.com, hch@lst.de, ardb@kernel.org,
 linux-kernel@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH v2 2/5] of/address: Introduce of_dma_lower_bus_limit()
Date: Sat, 10 Oct 2020 17:12:32 +0200
Message-Id: <20201010151235.20585-3-nsaenzjulienne@suse.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201010151235.20585-1-nsaenzjulienne@suse.de>
References: <20201010151235.20585-1-nsaenzjulienne@suse.de>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, jeremy.linton@arm.com,
 iommu@lists.linux-foundation.org, linux-rpi-kernel@lists.infradead.org,
 robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org
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

The function provides the CPU physical address addressable by the most
constrained bus in the system. It might be useful in order to
dynamically set up memory zones during boot.

Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
---
 drivers/of/address.c | 34 ++++++++++++++++++++++++++++++++++
 include/linux/of.h   |  7 +++++++
 2 files changed, 41 insertions(+)

diff --git a/drivers/of/address.c b/drivers/of/address.c
index eb9ab4f1e80b..755e97b65096 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -1024,6 +1024,40 @@ int of_dma_get_range(struct device_node *np, const struct bus_dma_region **map)
 }
 #endif /* CONFIG_HAS_DMA */
 
+/**
+ * of_dma_safe_phys_limit - Get system wide DMA safe address space
+ *
+ * Gets the CPU physical address limit for safe DMA addressing system wide by
+ * searching for the most constraining dma-range. Otherwise it returns ~0ULL.
+ */
+u64 __init of_dma_safe_phys_limit(void)
+{
+	struct device_node *np = NULL;
+	struct of_range_parser parser;
+	const __be32 *ranges = NULL;
+	u64 phys_dma_limit = ~0ULL;
+	struct of_range range;
+	int len;
+
+	for_each_of_allnodes(np) {
+		dma_addr_t cpu_end = 0;
+
+		ranges = of_get_property(np, "dma-ranges", &len);
+		if (!ranges || !len)
+			continue;
+
+		of_dma_range_parser_init(&parser, np);
+		for_each_of_range(&parser, &range)
+			if (range.cpu_addr + range.size > cpu_end)
+				cpu_end = range.cpu_addr + range.size;
+
+		if (phys_dma_limit > cpu_end)
+			phys_dma_limit = cpu_end;
+	}
+
+	return phys_dma_limit;
+}
+
 /**
  * of_dma_is_coherent - Check if device is coherent
  * @np:	device node
diff --git a/include/linux/of.h b/include/linux/of.h
index 481ec0467285..958c64cffa92 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -558,6 +558,8 @@ int of_map_id(struct device_node *np, u32 id,
 	       const char *map_name, const char *map_mask_name,
 	       struct device_node **target, u32 *id_out);
 
+u64 of_dma_safe_phys_limit(void);
+
 #else /* CONFIG_OF */
 
 static inline void of_core_init(void)
@@ -995,6 +997,11 @@ static inline int of_map_id(struct device_node *np, u32 id,
 	return -EINVAL;
 }
 
+static inline u64 of_dma_safe_phys_limit(void)
+{
+	return ~0ULL;
+}
+
 #define of_match_ptr(_ptr)	NULL
 #define of_match_node(_matches, _node)	NULL
 #endif /* CONFIG_OF */
-- 
2.28.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
