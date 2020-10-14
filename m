Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8A928E6F4
	for <lists.iommu@lfdr.de>; Wed, 14 Oct 2020 21:12:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 78C7E880D1;
	Wed, 14 Oct 2020 19:12:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PLaGz2U9KOIt; Wed, 14 Oct 2020 19:12:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 643EB8785B;
	Wed, 14 Oct 2020 19:12:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4F9F0C1AD4;
	Wed, 14 Oct 2020 19:12:27 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 564A4C0051
 for <iommu@lists.linux-foundation.org>; Wed, 14 Oct 2020 19:12:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 471A62E51C
 for <iommu@lists.linux-foundation.org>; Wed, 14 Oct 2020 19:12:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IWStTo8hGyri for <iommu@lists.linux-foundation.org>;
 Wed, 14 Oct 2020 19:12:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by silver.osuosl.org (Postfix) with ESMTPS id AF7E32E284
 for <iommu@lists.linux-foundation.org>; Wed, 14 Oct 2020 19:12:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 109F1B29A;
 Wed, 14 Oct 2020 19:12:20 +0000 (UTC)
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: robh+dt@kernel.org, catalin.marinas@arm.com, hch@lst.de, ardb@kernel.org,
 linux-kernel@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH v3 3/8] of/address: Introduce of_dma_get_max_cpu_address()
Date: Wed, 14 Oct 2020 21:12:05 +0200
Message-Id: <20201014191211.27029-4-nsaenzjulienne@suse.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201014191211.27029-1-nsaenzjulienne@suse.de>
References: <20201014191211.27029-1-nsaenzjulienne@suse.de>
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

Introduce of_dma_get_max_cpu_address(), which provides the highest CPU
physical address addressable by all DMA masters in the system. It's
specially useful for setting memory zones sizes at early boot time.

Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>

---

Changes since v2:
 - Use PHYS_ADDR_MAX
 - return phys_dma_t
 - Rename function
 - Correct subject
 - Add support to start parsing from an arbitrary device node in order
   for the function to work with unit tests

 drivers/of/address.c | 42 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/of.h   |  7 +++++++
 2 files changed, 49 insertions(+)

diff --git a/drivers/of/address.c b/drivers/of/address.c
index eb9ab4f1e80b..b5a9695aaf82 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -1024,6 +1024,48 @@ int of_dma_get_range(struct device_node *np, const struct bus_dma_region **map)
 }
 #endif /* CONFIG_HAS_DMA */
 
+/**
+ * of_dma_get_max_cpu_address - Gets highest CPU address suitable for DMA
+ * @np: The node to start searching from or NULL to start from the root
+ *
+ * Gets the highest CPU physical address that is addressable by all DMA masters
+ * in the system (or subtree when np is non-NULL). If no DMA constrained device
+ * is found, it returns PHYS_ADDR_MAX.
+ */
+phys_addr_t __init of_dma_get_max_cpu_address(struct device_node *np)
+{
+	phys_addr_t max_cpu_addr = PHYS_ADDR_MAX;
+	struct of_range_parser parser;
+	phys_addr_t subtree_max_addr;
+	struct device_node *child;
+	phys_addr_t cpu_end = 0;
+	struct of_range range;
+	const __be32 *ranges;
+	int len;
+
+	if (!np)
+		np = of_root;
+
+	ranges = of_get_property(np, "dma-ranges", &len);
+	if (ranges && len) {
+		of_dma_range_parser_init(&parser, np);
+		for_each_of_range(&parser, &range)
+			if (range.cpu_addr + range.size > cpu_end)
+				cpu_end = range.cpu_addr + range.size;
+
+		if (max_cpu_addr > cpu_end)
+			max_cpu_addr = cpu_end;
+	}
+
+	for_each_available_child_of_node(np, child) {
+		subtree_max_addr = of_dma_get_max_cpu_address(child);
+		if (max_cpu_addr > subtree_max_addr)
+			max_cpu_addr = subtree_max_addr;
+	}
+
+	return max_cpu_addr;
+}
+
 /**
  * of_dma_is_coherent - Check if device is coherent
  * @np:	device node
diff --git a/include/linux/of.h b/include/linux/of.h
index 481ec0467285..db8db8f2c967 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -558,6 +558,8 @@ int of_map_id(struct device_node *np, u32 id,
 	       const char *map_name, const char *map_mask_name,
 	       struct device_node **target, u32 *id_out);
 
+phys_addr_t of_dma_get_max_cpu_address(struct device_node *np);
+
 #else /* CONFIG_OF */
 
 static inline void of_core_init(void)
@@ -995,6 +997,11 @@ static inline int of_map_id(struct device_node *np, u32 id,
 	return -EINVAL;
 }
 
+static inline phys_addr_t of_dma_get_max_cpu_address(struct device_node *np)
+{
+	return PHYS_ADDR_MAX;
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
