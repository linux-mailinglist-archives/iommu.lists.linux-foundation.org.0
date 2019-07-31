Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 930177C7F4
	for <lists.iommu@lfdr.de>; Wed, 31 Jul 2019 18:00:05 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 182FA3EB6;
	Wed, 31 Jul 2019 15:59:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 499243AA5
	for <iommu@lists.linux-foundation.org>;
	Wed, 31 Jul 2019 15:48:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 89E67E7
	for <iommu@lists.linux-foundation.org>;
	Wed, 31 Jul 2019 15:48:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id 01F74AFE4;
	Wed, 31 Jul 2019 15:48:04 +0000 (UTC)
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: catalin.marinas@arm.com, hch@lst.de, wahrenst@gmx.net,
	marc.zyngier@arm.com, Robin Murphy <robin.murphy@arm.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	iommu@lists.linux-foundation.org, linux-mm@kvack.org,
	Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH 3/8] of/fdt: add function to get the SoC wide DMA addressable
	memory size
Date: Wed, 31 Jul 2019 17:47:46 +0200
Message-Id: <20190731154752.16557-4-nsaenzjulienne@suse.de>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190731154752.16557-1-nsaenzjulienne@suse.de>
References: <20190731154752.16557-1-nsaenzjulienne@suse.de>
MIME-Version: 1.0
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: phill@raspberryi.org, f.fainelli@gmail.com, linux-kernel@vger.kernel.org,
	eric@anholt.net, mbrugger@suse.com,
	linux-rpi-kernel@lists.infradead.org, akpm@linux-foundation.org,
	will@kernel.org, nsaenzjulienne@suse.de
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

Some SoCs might have multiple interconnects each with their own DMA
addressing limitations. This function parses the 'dma-ranges' on each of
them and tries to guess the maximum SoC wide DMA addressable memory
size.

This is specially useful for arch code in order to properly setup CMA
and memory zones.

Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
---

 drivers/of/fdt.c       | 72 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/of_fdt.h |  2 ++
 2 files changed, 74 insertions(+)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 9cdf14b9aaab..f2444c61a136 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -953,6 +953,78 @@ int __init early_init_dt_scan_chosen_stdout(void)
 }
 #endif
 
+/**
+ * early_init_dt_dma_zone_size - Look at all 'dma-ranges' and provide the
+ * maximum common dmable memory size.
+ *
+ * Some devices might have multiple interconnects each with their own DMA
+ * addressing limitations. For example the Raspberry Pi 4 has the following:
+ *
+ * soc {
+ *	dma-ranges = <0xc0000000  0x0 0x00000000  0x3c000000>;
+ *	[...]
+ * }
+ *
+ * v3dbus {
+ *	dma-ranges = <0x00000000  0x0 0x00000000  0x3c000000>;
+ *	[...]
+ * }
+ *
+ * scb {
+ *	dma-ranges = <0x0 0x00000000  0x0 0x00000000  0xfc000000>;
+ *	[...]
+ * }
+ *
+ * Here the area addressable by all devices is [0x00000000-0x3bffffff]. Hence
+ * the function will write in 'data' a size of 0x3c000000.
+ *
+ * Note that the implementation assumes all interconnects have the same physical
+ * memory view and that the mapping always start at the beginning of RAM.
+ */
+int __init early_init_dt_dma_zone_size(unsigned long node, const char *uname,
+				       int depth, void *data)
+{
+	const char *type = of_get_flat_dt_prop(node, "device_type", NULL);
+	u64 phys_addr, dma_addr, size;
+	u64 *dma_zone_size = data;
+	int dma_addr_cells;
+	const __be32 *reg;
+	const void *prop;
+	int len;
+
+	if (depth == 0)
+		*dma_zone_size = 0;
+
+	/*
+	 * We avoid pci host controllers as they have their own way of using
+	 * 'dma-ranges'.
+	 */
+	if (type && !strcmp(type, "pci"))
+		return 0;
+
+	reg = of_get_flat_dt_prop(node, "dma-ranges", &len);
+	if (!reg)
+		return 0;
+
+	prop = of_get_flat_dt_prop(node, "#address-cells", NULL);
+	if (prop)
+		dma_addr_cells = be32_to_cpup(prop);
+	else
+		dma_addr_cells = 1; /* arm64's default addr_cell size */
+
+	if (len < (dma_addr_cells + dt_root_addr_cells + dt_root_size_cells))
+		return 0;
+
+	dma_addr = dt_mem_next_cell(dma_addr_cells, &reg);
+	phys_addr = dt_mem_next_cell(dt_root_addr_cells, &reg);
+	size = dt_mem_next_cell(dt_root_size_cells, &reg);
+
+	if (!*dma_zone_size || *dma_zone_size > size)
+		*dma_zone_size = size;
+
+	return 0;
+}
+
 /**
  * early_init_dt_scan_root - fetch the top level address and size cells
  */
diff --git a/include/linux/of_fdt.h b/include/linux/of_fdt.h
index acf820e88952..2ad36b7bd4fa 100644
--- a/include/linux/of_fdt.h
+++ b/include/linux/of_fdt.h
@@ -72,6 +72,8 @@ extern int early_init_dt_reserve_memory_arch(phys_addr_t base, phys_addr_t size,
 					     bool no_map);
 extern u64 dt_mem_next_cell(int s, const __be32 **cellp);
 
+extern int early_init_dt_dma_zone_size(unsigned long node, const char *uname,
+				       int depth, void *data);
 /* Early flat tree scan hooks */
 extern int early_init_dt_scan_root(unsigned long node, const char *uname,
 				   int depth, void *data);
-- 
2.22.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
