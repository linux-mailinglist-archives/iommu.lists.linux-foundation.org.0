Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A253DEDBE
	for <lists.iommu@lfdr.de>; Tue,  3 Aug 2021 14:17:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 869D74048B;
	Tue,  3 Aug 2021 12:17:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qR-TzSe4SORt; Tue,  3 Aug 2021 12:17:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id B804E40494;
	Tue,  3 Aug 2021 12:17:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 94785C000E;
	Tue,  3 Aug 2021 12:17:23 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 93149C000E
 for <iommu@lists.linux-foundation.org>; Tue,  3 Aug 2021 12:17:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 839624048B
 for <iommu@lists.linux-foundation.org>; Tue,  3 Aug 2021 12:17:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QDRifhJh5mjT for <iommu@lists.linux-foundation.org>;
 Tue,  3 Aug 2021 12:17:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F07A040485
 for <iommu@lists.linux-foundation.org>; Tue,  3 Aug 2021 12:17:20 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 39D54580889;
 Tue,  3 Aug 2021 08:17:20 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Tue, 03 Aug 2021 08:17:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=2kD8s9TVSp6ll
 C5vOd+fVneEaZOe5xYcW3OdDLTkADk=; b=sTJRlkj4CgbAvPfcFjtdygxaJupkj
 HpNhft9IpA0hfhKlztOsIFaaPtgcytSgASSAjQRgDboEyGyC/68DkOGG+32MTRBq
 vtcU9GuaxKnVVGx8NDoJj1uaRCqaLaU3yQFYc8yzhX0zlLBk2I45bB+pVVGRjlTR
 ZE1ZWQgj+R+IHLnTJBk65A7hnOWPlvkXKK8QlJtYlP+EQh/YNU0/nSDfALk8YX0H
 5SToFMDBCmaa4kR9m4fl25lEDISvDaX3W+kV0MfD5xxWFzksoOzT4e4V6tqVOLP7
 GRwvU+0z8bQRG0PcaiqZi9tu0ORSHlJiTCqJz48f2CSupQgcdn2DeU4IQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=2kD8s9TVSp6llC5vOd+fVneEaZOe5xYcW3OdDLTkADk=; b=VMQBi8pe
 1NbHf57CTgL2FmFc9XtweBUopRfRvHxT7+P0h9ejcYag465Oh94+qhm1JsVi92Rq
 PQZuZQt2gnME9bZDfWRkIH+CwNyiiH4jjsCjG/T3eycuv8EjzEXlXJgG6iTlIfcN
 sX18X70hCZ95i6gN3xdZzEEZolsKLRr7tTU73iuC7H7hraY90CUzSyhgyD3Wg1M2
 tvsrjAGoeyey8H0yonDYGb3BR4hy9cSNUA+nv7Mx4CwtGFfU/ml0JIEYmBIhu28c
 0DekdRseI5MrBSpHzG7+3dHvYLmAZ1qrAGMvhKuPUmXNdilKLE9Fek70Y+m7zWVT
 LodsWO4wm7BuVw==
X-ME-Sender: <xms:0DMJYV2_DG9KzUUY6lmtKTuNWntHkVd8xeESaDoDGhzV-mEpeT54jA>
 <xme:0DMJYcEkDRR4MZb1X0HuXHhfO_FPY41A2ndw0qd-48TwR3mbBUFUo0SsaMyaw-Dap
 GtCVSO6CHVmzuRN-JQ>
X-ME-Received: <xmr:0DMJYV5k6o9n3I_eMPNvsxExv6HIsp8wY1Aem-1Qob4XdH6bsokl5Qk6niqykNsTxdt3ysWecCDXzUTtQSEvYm1LZvSvPlNPhnBPR0jt2TQ6dul1KWdls1k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrieeggdegkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufhvvghnucfr
 vghtvghruceoshhvvghnsehsvhgvnhhpvghtvghrrdguvghvqeenucggtffrrghtthgvrh
 hnpeetvdekteeluefffffhkeetteffgefggfevheeileeufedvtdeuffevveelhfefjeen
 ucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehsvhgvnh
 esshhvvghnphgvthgvrhdruggvvh
X-ME-Proxy: <xmx:0DMJYS2chCzJhzKlvG7qQibeYEfboBvMkDNsMlCz8nuPyTa0DkqftQ>
 <xmx:0DMJYYGxhlTvqrvnrC1gRqn5lE1AOo2ZOdrFgpC2grPbYpVUqFyqPw>
 <xmx:0DMJYT8WpgJjFAg2YyTVzLy1HYd2cRh77zalprL1uMD0GJdD_zF57A>
 <xmx:0DMJYdKTP9lXqHdWfRM0ZOUtI7KcFKSQ2BmzAS-rrzG0FcpDiOe3PQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Aug 2021 08:17:17 -0400 (EDT)
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>
Subject: [PATCH v5 3/3] iommu/dart: Add DART iommu driver
Date: Tue,  3 Aug 2021 14:16:51 +0200
Message-Id: <20210803121651.61594-4-sven@svenpeter.dev>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20210803121651.61594-1-sven@svenpeter.dev>
References: <20210803121651.61594-1-sven@svenpeter.dev>
MIME-Version: 1.0
Cc: Arnd Bergmann <arnd@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 r.czerwinski@pengutronix.de, devicetree@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, Hector Martin <marcan@marcan.st>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, Alexander Graf <graf@amazon.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Mohamed Mediouni <mohamed.mediouni@caramail.com>,
 Mark Kettenis <mark.kettenis@xs4all.nl>, linux-arm-kernel@lists.infradead.org,
 Stan Skowronek <stan@corellium.com>
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
From: Sven Peter via iommu <iommu@lists.linux-foundation.org>
Reply-To: Sven Peter <sven@svenpeter.dev>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Apple's new SoCs use iommus for almost all peripherals. These Device
Address Resolution Tables must be setup before these peripherals can
act as DMA masters.

Tested-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
 MAINTAINERS                |   1 +
 drivers/iommu/Kconfig      |  14 +
 drivers/iommu/Makefile     |   1 +
 drivers/iommu/apple-dart.c | 923 +++++++++++++++++++++++++++++++++++++
 4 files changed, 939 insertions(+)
 create mode 100644 drivers/iommu/apple-dart.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 0f450f7d5336..5f3ef4298594 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1267,6 +1267,7 @@ M:	Sven Peter <sven@svenpeter.dev>
 L:	iommu@lists.linux-foundation.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/iommu/apple,dart.yaml
+F:	drivers/iommu/apple-dart.c
 
 APPLE SMC DRIVER
 M:	Henrik Rydberg <rydberg@bitmath.org>
diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index c84da8205be7..dfe81da483e9 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -290,6 +290,20 @@ config SPAPR_TCE_IOMMU
 	  Enables bits of IOMMU API required by VFIO. The iommu_ops
 	  is not implemented as it is not necessary for VFIO.
 
+config APPLE_DART
+	tristate "Apple DART IOMMU Support"
+	depends on ARM64 || (COMPILE_TEST && !GENERIC_ATOMIC64)
+	select IOMMU_API
+	select IOMMU_IO_PGTABLE_LPAE
+	default ARCH_APPLE
+	help
+	  Support for Apple DART (Device Address Resolution Table) IOMMUs
+	  found in Apple ARM SoCs like the M1.
+	  This IOMMU is required for most peripherals using DMA to access
+	  the main memory.
+
+	  Say Y here if you are using an Apple SoC.
+
 # ARM IOMMU support
 config ARM_SMMU
 	tristate "ARM Ltd. System MMU (SMMU) Support"
diff --git a/drivers/iommu/Makefile b/drivers/iommu/Makefile
index c0fb0ba88143..bc7f730edbb0 100644
--- a/drivers/iommu/Makefile
+++ b/drivers/iommu/Makefile
@@ -29,3 +29,4 @@ obj-$(CONFIG_HYPERV_IOMMU) += hyperv-iommu.o
 obj-$(CONFIG_VIRTIO_IOMMU) += virtio-iommu.o
 obj-$(CONFIG_IOMMU_SVA_LIB) += iommu-sva-lib.o io-pgfault.o
 obj-$(CONFIG_SPRD_IOMMU) += sprd-iommu.o
+obj-$(CONFIG_APPLE_DART) += apple-dart.o
diff --git a/drivers/iommu/apple-dart.c b/drivers/iommu/apple-dart.c
new file mode 100644
index 000000000000..559db9259e65
--- /dev/null
+++ b/drivers/iommu/apple-dart.c
@@ -0,0 +1,923 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Apple DART (Device Address Resolution Table) IOMMU driver
+ *
+ * Copyright (C) 2021 The Asahi Linux Contributors
+ *
+ * Based on arm/arm-smmu/arm-ssmu.c and arm/arm-smmu-v3/arm-smmu-v3.c
+ *  Copyright (C) 2013 ARM Limited
+ *  Copyright (C) 2015 ARM Limited
+ * and on exynos-iommu.c
+ *  Copyright (c) 2011,2016 Samsung Electronics Co., Ltd.
+ */
+
+#include <linux/atomic.h>
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/dev_printk.h>
+#include <linux/dma-iommu.h>
+#include <linux/dma-mapping.h>
+#include <linux/err.h>
+#include <linux/interrupt.h>
+#include <linux/io-pgtable.h>
+#include <linux/iommu.h>
+#include <linux/iopoll.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_iommu.h>
+#include <linux/of_platform.h>
+#include <linux/pci.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/swab.h>
+#include <linux/types.h>
+
+#define DART_MAX_STREAMS 16
+#define DART_MAX_TTBR 4
+#define MAX_DARTS_PER_DEVICE 2
+
+#define DART_STREAM_ALL 0xffff
+
+#define DART_PARAMS1 0x00
+#define DART_PARAMS_PAGE_SHIFT GENMASK(27, 24)
+
+#define DART_PARAMS2 0x04
+#define DART_PARAMS_BYPASS_SUPPORT BIT(0)
+
+#define DART_STREAM_COMMAND 0x20
+#define DART_STREAM_COMMAND_BUSY BIT(2)
+#define DART_STREAM_COMMAND_INVALIDATE BIT(20)
+
+#define DART_STREAM_SELECT 0x34
+
+#define DART_ERROR 0x40
+#define DART_ERROR_STREAM GENMASK(27, 24)
+#define DART_ERROR_CODE GENMASK(11, 0)
+#define DART_ERROR_FLAG BIT(31)
+
+#define DART_ERROR_READ_FAULT BIT(4)
+#define DART_ERROR_WRITE_FAULT BIT(3)
+#define DART_ERROR_NO_PTE BIT(2)
+#define DART_ERROR_NO_PMD BIT(1)
+#define DART_ERROR_NO_TTBR BIT(0)
+
+#define DART_CONFIG 0x60
+#define DART_CONFIG_LOCK BIT(15)
+
+#define DART_STREAM_COMMAND_BUSY_TIMEOUT 100
+
+#define DART_ERROR_ADDR_HI 0x54
+#define DART_ERROR_ADDR_LO 0x50
+
+#define DART_TCR(sid) (0x100 + 4 * (sid))
+#define DART_TCR_TRANSLATE_ENABLE BIT(7)
+#define DART_TCR_BYPASS0_ENABLE BIT(8)
+#define DART_TCR_BYPASS1_ENABLE BIT(12)
+
+#define DART_TTBR(sid, idx) (0x200 + 16 * (sid) + 4 * (idx))
+#define DART_TTBR_VALID BIT(31)
+#define DART_TTBR_SHIFT 12
+
+/*
+ * Private structure associated with each DART device.
+ *
+ * @dev: device struct
+ * @regs: mapped MMIO region
+ * @irq: interrupt number, can be shared with other DARTs
+ * @clks: clocks associated with this DART
+ * @num_clks: number of @clks
+ * @lock: lock for hardware operations involving this dart
+ * @pgsize: pagesize supported by this DART
+ * @supports_bypass: indicates if this DART supports bypass mode
+ * @force_bypass: force bypass mode due to pagesize mismatch?
+ * @sid2group: maps stream ids to iommu_groups
+ * @iommu: iommu core device
+ */
+struct apple_dart {
+	struct device *dev;
+
+	void __iomem *regs;
+
+	int irq;
+	struct clk_bulk_data *clks;
+	int num_clks;
+
+	spinlock_t lock;
+
+	u32 pgsize;
+	u32 supports_bypass : 1;
+	u32 force_bypass : 1;
+
+	struct iommu_group *sid2group[DART_MAX_STREAMS];
+	struct iommu_device iommu;
+};
+
+/*
+ * Convenience struct to identify streams.
+ *
+ * The normal variant is used inside apple_dart_master_cfg which isn't written
+ * to concurrently.
+ * The atomic variant is used inside apple_dart_domain where we have to guard
+ * against races from potential parallel calls to attach/detach_device.
+ * Note that even inside the atomic variant the apple_dart pointer is not
+ * protected: This pointer is initialized once under the domain init mutex
+ * and never changed again afterwards. Devices with different dart pointers
+ * cannot be attached to the same domain.
+ *
+ * @dart dart pointer
+ * @sid stream id bitmap
+ */
+struct apple_dart_stream_map {
+	struct apple_dart *dart;
+	unsigned long sidmap;
+};
+struct apple_dart_atomic_stream_map {
+	struct apple_dart *dart;
+	atomic64_t sidmap;
+};
+
+/*
+ * This structure is attached to each iommu domain handled by a DART.
+ *
+ * @pgtbl_ops: pagetable ops allocated by io-pgtable
+ * @finalized: true if the domain has been completely initialized
+ * @init_lock: protects domain initialization
+ * @stream_maps: streams attached to this domain (valid for DMA/UNMANAGED only)
+ * @domain: core iommu domain pointer
+ */
+struct apple_dart_domain {
+	struct io_pgtable_ops *pgtbl_ops;
+
+	bool finalized;
+	struct mutex init_lock;
+	struct apple_dart_atomic_stream_map stream_maps[MAX_DARTS_PER_DEVICE];
+
+	struct iommu_domain domain;
+};
+
+/*
+ * This structure is attached to devices with dev_iommu_priv_set() on of_xlate
+ * and contains a list of streams bound to this device.
+ * So far the worst case seen is a single device with two streams
+ * from different darts, such that this simple static array is enough.
+ *
+ * @streams: streams for this device
+ */
+struct apple_dart_master_cfg {
+	struct apple_dart_stream_map stream_maps[MAX_DARTS_PER_DEVICE];
+};
+
+/*
+ * Helper macro to iterate over apple_dart_master_cfg.stream_maps and
+ * apple_dart_domain.stream_maps
+ *
+ * @i int used as loop variable
+ * @base pointer to base struct (apple_dart_master_cfg or apple_dart_domain)
+ * @stream pointer to the apple_dart_streams struct for each loop iteration
+ */
+#define for_each_stream_map(i, base, stream_map)                               \
+	for (i = 0, stream_map = &(base)->stream_maps[0];                      \
+	     i < MAX_DARTS_PER_DEVICE && stream_map->dart;                     \
+	     stream_map = &(base)->stream_maps[++i])
+
+static struct platform_driver apple_dart_driver;
+static const struct iommu_ops apple_dart_iommu_ops;
+static const struct iommu_flush_ops apple_dart_tlb_ops;
+
+static struct apple_dart_domain *to_dart_domain(struct iommu_domain *dom)
+{
+	return container_of(dom, struct apple_dart_domain, domain);
+}
+
+static void
+apple_dart_hw_enable_translation(struct apple_dart_stream_map *stream_map)
+{
+	int sid;
+
+	for_each_set_bit(sid, &stream_map->sidmap, DART_MAX_STREAMS)
+		writel(DART_TCR_TRANSLATE_ENABLE,
+		       stream_map->dart->regs + DART_TCR(sid));
+}
+
+static void apple_dart_hw_disable_dma(struct apple_dart_stream_map *stream_map)
+{
+	int sid;
+
+	for_each_set_bit(sid, &stream_map->sidmap, DART_MAX_STREAMS)
+		writel(0, stream_map->dart->regs + DART_TCR(sid));
+}
+
+static void
+apple_dart_hw_enable_bypass(struct apple_dart_stream_map *stream_map)
+{
+	int sid;
+
+	WARN_ON(!stream_map->dart->supports_bypass);
+	for_each_set_bit(sid, &stream_map->sidmap, DART_MAX_STREAMS)
+		writel(DART_TCR_BYPASS0_ENABLE | DART_TCR_BYPASS1_ENABLE,
+		       stream_map->dart->regs + DART_TCR(sid));
+}
+
+static void apple_dart_hw_set_ttbr(struct apple_dart_stream_map *stream_map,
+				   u8 idx, phys_addr_t paddr)
+{
+	int sid;
+
+	WARN_ON(paddr & ((1 << DART_TTBR_SHIFT) - 1));
+	for_each_set_bit(sid, &stream_map->sidmap, DART_MAX_STREAMS)
+		writel(DART_TTBR_VALID | (paddr >> DART_TTBR_SHIFT),
+		       stream_map->dart->regs + DART_TTBR(sid, idx));
+}
+
+static void apple_dart_hw_clear_ttbr(struct apple_dart_stream_map *stream_map,
+				     u8 idx)
+{
+	int sid;
+
+	for_each_set_bit(sid, &stream_map->sidmap, DART_MAX_STREAMS)
+		writel(0, stream_map->dart->regs + DART_TTBR(sid, idx));
+}
+
+static void
+apple_dart_hw_clear_all_ttbrs(struct apple_dart_stream_map *stream_map)
+{
+	int i;
+
+	for (i = 0; i < DART_MAX_TTBR; ++i)
+		apple_dart_hw_clear_ttbr(stream_map, i);
+}
+
+static int
+apple_dart_hw_stream_command(struct apple_dart_stream_map *stream_map,
+			     u32 command)
+{
+	unsigned long flags;
+	int ret;
+	u32 command_reg;
+
+	spin_lock_irqsave(&stream_map->dart->lock, flags);
+
+	writel(stream_map->sidmap, stream_map->dart->regs + DART_STREAM_SELECT);
+	writel(command, stream_map->dart->regs + DART_STREAM_COMMAND);
+
+	ret = readl_poll_timeout_atomic(
+		stream_map->dart->regs + DART_STREAM_COMMAND, command_reg,
+		!(command_reg & DART_STREAM_COMMAND_BUSY), 1,
+		DART_STREAM_COMMAND_BUSY_TIMEOUT);
+
+	spin_unlock_irqrestore(&stream_map->dart->lock, flags);
+
+	if (ret) {
+		dev_err(stream_map->dart->dev,
+			"busy bit did not clear after command %x for streams %lx\n",
+			command, stream_map->sidmap);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int
+apple_dart_hw_invalidate_tlb(struct apple_dart_stream_map *stream_map)
+{
+	return apple_dart_hw_stream_command(stream_map,
+					    DART_STREAM_COMMAND_INVALIDATE);
+}
+
+static int apple_dart_hw_reset(struct apple_dart *dart)
+{
+	u32 config;
+	struct apple_dart_stream_map stream_map;
+
+	config = readl(dart->regs + DART_CONFIG);
+	if (config & DART_CONFIG_LOCK) {
+		dev_err(dart->dev, "DART is locked down until reboot: %08x\n",
+			config);
+		return -EINVAL;
+	}
+
+	stream_map.dart = dart;
+	stream_map.sidmap = DART_STREAM_ALL;
+	apple_dart_hw_disable_dma(&stream_map);
+	apple_dart_hw_clear_all_ttbrs(&stream_map);
+
+	/* clear any pending errors before the interrupt is unmasked */
+	writel(readl(dart->regs + DART_ERROR), dart->regs + DART_ERROR);
+
+	return apple_dart_hw_invalidate_tlb(&stream_map);
+}
+
+static void apple_dart_domain_flush_tlb(struct apple_dart_domain *domain)
+{
+	int i;
+	struct apple_dart_atomic_stream_map *domain_stream_map;
+	struct apple_dart_stream_map stream_map;
+
+	for_each_stream_map(i, domain, domain_stream_map) {
+		stream_map.dart = domain_stream_map->dart;
+		stream_map.sidmap = atomic64_read(&domain_stream_map->sidmap);
+		apple_dart_hw_invalidate_tlb(&stream_map);
+	}
+}
+
+static void apple_dart_flush_iotlb_all(struct iommu_domain *domain)
+{
+	apple_dart_domain_flush_tlb(to_dart_domain(domain));
+}
+
+static void apple_dart_iotlb_sync(struct iommu_domain *domain,
+				  struct iommu_iotlb_gather *gather)
+{
+	apple_dart_domain_flush_tlb(to_dart_domain(domain));
+}
+
+static void apple_dart_iotlb_sync_map(struct iommu_domain *domain,
+				      unsigned long iova, size_t size)
+{
+	apple_dart_domain_flush_tlb(to_dart_domain(domain));
+}
+
+static void apple_dart_tlb_flush_all(void *cookie)
+{
+	apple_dart_domain_flush_tlb(cookie);
+}
+
+static void apple_dart_tlb_flush_walk(unsigned long iova, size_t size,
+				      size_t granule, void *cookie)
+{
+	apple_dart_domain_flush_tlb(cookie);
+}
+
+static const struct iommu_flush_ops apple_dart_tlb_ops = {
+	.tlb_flush_all = apple_dart_tlb_flush_all,
+	.tlb_flush_walk = apple_dart_tlb_flush_walk,
+};
+
+static phys_addr_t apple_dart_iova_to_phys(struct iommu_domain *domain,
+					   dma_addr_t iova)
+{
+	struct apple_dart_domain *dart_domain = to_dart_domain(domain);
+	struct io_pgtable_ops *ops = dart_domain->pgtbl_ops;
+
+	if (!ops)
+		return 0;
+
+	return ops->iova_to_phys(ops, iova);
+}
+
+static int apple_dart_map_pages(struct iommu_domain *domain, unsigned long iova,
+				phys_addr_t paddr, size_t pgsize,
+				size_t pgcount, int prot, gfp_t gfp,
+				size_t *mapped)
+{
+	struct apple_dart_domain *dart_domain = to_dart_domain(domain);
+	struct io_pgtable_ops *ops = dart_domain->pgtbl_ops;
+
+	if (!ops)
+		return -ENODEV;
+
+	return ops->map_pages(ops, iova, paddr, pgsize, pgcount, prot, gfp,
+			      mapped);
+}
+
+static size_t apple_dart_unmap_pages(struct iommu_domain *domain,
+				     unsigned long iova, size_t pgsize,
+				     size_t pgcount,
+				     struct iommu_iotlb_gather *gather)
+{
+	struct apple_dart_domain *dart_domain = to_dart_domain(domain);
+	struct io_pgtable_ops *ops = dart_domain->pgtbl_ops;
+
+	return ops->unmap_pages(ops, iova, pgsize, pgcount, gather);
+}
+
+static void
+apple_dart_setup_translation(struct apple_dart_domain *domain,
+			     struct apple_dart_stream_map *stream_map)
+{
+	int i;
+	struct io_pgtable_cfg *pgtbl_cfg =
+		&io_pgtable_ops_to_pgtable(domain->pgtbl_ops)->cfg;
+
+	for (i = 0; i < pgtbl_cfg->apple_dart_cfg.n_ttbrs; ++i)
+		apple_dart_hw_set_ttbr(stream_map, i,
+				       pgtbl_cfg->apple_dart_cfg.ttbr[i]);
+	for (; i < DART_MAX_TTBR; ++i)
+		apple_dart_hw_clear_ttbr(stream_map, i);
+
+	apple_dart_hw_enable_translation(stream_map);
+	apple_dart_hw_invalidate_tlb(stream_map);
+}
+
+static int apple_dart_finalize_domain(struct iommu_domain *domain,
+				      struct apple_dart_master_cfg *cfg)
+{
+	struct apple_dart_domain *dart_domain = to_dart_domain(domain);
+	struct apple_dart *dart = cfg->stream_maps[0].dart;
+	struct io_pgtable_cfg pgtbl_cfg;
+	int ret = 0;
+	int i;
+
+	mutex_lock(&dart_domain->init_lock);
+
+	if (dart_domain->finalized)
+		goto done;
+
+	for (i = 0; i < MAX_DARTS_PER_DEVICE; ++i) {
+		dart_domain->stream_maps[i].dart = cfg->stream_maps[i].dart;
+		atomic64_set(&dart_domain->stream_maps[i].sidmap,
+			     cfg->stream_maps[i].sidmap);
+	}
+
+	pgtbl_cfg = (struct io_pgtable_cfg){
+		.pgsize_bitmap = dart->pgsize,
+		.ias = 32,
+		.oas = 36,
+		.coherent_walk = 1,
+		.tlb = &apple_dart_tlb_ops,
+		.iommu_dev = dart->dev,
+	};
+
+	dart_domain->pgtbl_ops =
+		alloc_io_pgtable_ops(APPLE_DART, &pgtbl_cfg, domain);
+	if (!dart_domain->pgtbl_ops) {
+		ret = -ENOMEM;
+		goto done;
+	}
+
+	domain->pgsize_bitmap = pgtbl_cfg.pgsize_bitmap;
+	domain->geometry.aperture_start = 0;
+	domain->geometry.aperture_end = DMA_BIT_MASK(32);
+	domain->geometry.force_aperture = true;
+
+	dart_domain->finalized = true;
+
+done:
+	mutex_unlock(&dart_domain->init_lock);
+	return ret;
+}
+
+static int
+apple_dart_mod_streams(struct apple_dart_atomic_stream_map *domain_maps,
+		       struct apple_dart_stream_map *master_maps,
+		       bool add_streams)
+{
+	int i;
+
+	for (i = 0; i < MAX_DARTS_PER_DEVICE; ++i) {
+		if (domain_maps[i].dart != master_maps[i].dart)
+			return -EINVAL;
+	}
+
+	for (i = 0; i < MAX_DARTS_PER_DEVICE; ++i) {
+		if (!domain_maps[i].dart)
+			break;
+		if (add_streams)
+			atomic64_or(master_maps[i].sidmap,
+				    &domain_maps[i].sidmap);
+		else
+			atomic64_and(~master_maps[i].sidmap,
+				     &domain_maps[i].sidmap);
+	}
+
+	return 0;
+}
+
+static int apple_dart_domain_add_streams(struct apple_dart_domain *domain,
+					 struct apple_dart_master_cfg *cfg)
+{
+	return apple_dart_mod_streams(domain->stream_maps, cfg->stream_maps,
+				      true);
+}
+
+static int apple_dart_domain_remove_streams(struct apple_dart_domain *domain,
+					    struct apple_dart_master_cfg *cfg)
+{
+	return apple_dart_mod_streams(domain->stream_maps, cfg->stream_maps,
+				      false);
+}
+
+static int apple_dart_attach_dev(struct iommu_domain *domain,
+				 struct device *dev)
+{
+	int ret, i;
+	struct apple_dart_stream_map *stream_map;
+	struct apple_dart_master_cfg *cfg = dev_iommu_priv_get(dev);
+	struct apple_dart_domain *dart_domain = to_dart_domain(domain);
+
+	if (cfg->stream_maps[0].dart->force_bypass &&
+	    domain->type != IOMMU_DOMAIN_IDENTITY)
+		return -EINVAL;
+	if (!cfg->stream_maps[0].dart->supports_bypass &&
+	    domain->type == IOMMU_DOMAIN_IDENTITY)
+		return -EINVAL;
+
+	ret = apple_dart_finalize_domain(domain, cfg);
+	if (ret)
+		return ret;
+
+	switch (domain->type) {
+	case IOMMU_DOMAIN_DMA:
+	case IOMMU_DOMAIN_UNMANAGED:
+		ret = apple_dart_domain_add_streams(dart_domain, cfg);
+		if (ret)
+			return ret;
+
+		for_each_stream_map(i, cfg, stream_map)
+			apple_dart_setup_translation(dart_domain, stream_map);
+		break;
+	case IOMMU_DOMAIN_BLOCKED:
+		for_each_stream_map(i, cfg, stream_map)
+			apple_dart_hw_disable_dma(stream_map);
+		break;
+	case IOMMU_DOMAIN_IDENTITY:
+		for_each_stream_map(i, cfg, stream_map)
+			apple_dart_hw_enable_bypass(stream_map);
+		break;
+	}
+
+	return ret;
+}
+
+static void apple_dart_detach_dev(struct iommu_domain *domain,
+				  struct device *dev)
+{
+	int i;
+	struct apple_dart_stream_map *stream_map;
+	struct apple_dart_master_cfg *cfg = dev_iommu_priv_get(dev);
+	struct apple_dart_domain *dart_domain = to_dart_domain(domain);
+
+	for_each_stream_map(i, cfg, stream_map)
+		apple_dart_hw_disable_dma(stream_map);
+
+	if (domain->type == IOMMU_DOMAIN_DMA ||
+	    domain->type == IOMMU_DOMAIN_UNMANAGED)
+		apple_dart_domain_remove_streams(dart_domain, cfg);
+}
+
+static struct iommu_device *apple_dart_probe_device(struct device *dev)
+{
+	struct apple_dart_master_cfg *cfg = dev_iommu_priv_get(dev);
+	struct apple_dart_stream_map *stream_map;
+	int i;
+
+	if (!cfg)
+		return ERR_PTR(-ENODEV);
+
+	for_each_stream_map(i, cfg, stream_map)
+		device_link_add(
+			dev, stream_map->dart->dev,
+			DL_FLAG_PM_RUNTIME | DL_FLAG_AUTOREMOVE_SUPPLIER);
+
+	return &cfg->stream_maps[0].dart->iommu;
+}
+
+static void apple_dart_release_device(struct device *dev)
+{
+	struct apple_dart_master_cfg *cfg = dev_iommu_priv_get(dev);
+
+	if (!cfg)
+		return;
+
+	dev_iommu_priv_set(dev, NULL);
+	kfree(cfg);
+}
+
+static struct iommu_domain *apple_dart_domain_alloc(unsigned int type)
+{
+	struct apple_dart_domain *dart_domain;
+
+	if (type != IOMMU_DOMAIN_DMA && type != IOMMU_DOMAIN_UNMANAGED &&
+	    type != IOMMU_DOMAIN_IDENTITY && type != IOMMU_DOMAIN_BLOCKED)
+		return NULL;
+
+	dart_domain = kzalloc(sizeof(*dart_domain), GFP_KERNEL);
+	if (!dart_domain)
+		return NULL;
+
+	iommu_get_dma_cookie(&dart_domain->domain);
+	mutex_init(&dart_domain->init_lock);
+
+	/* no need to allocate pgtbl_ops or do any other finalization steps */
+	if (type == IOMMU_DOMAIN_IDENTITY || type == IOMMU_DOMAIN_BLOCKED)
+		dart_domain->finalized = true;
+
+	return &dart_domain->domain;
+}
+
+static void apple_dart_domain_free(struct iommu_domain *domain)
+{
+	struct apple_dart_domain *dart_domain = to_dart_domain(domain);
+
+	if (dart_domain->pgtbl_ops)
+		free_io_pgtable_ops(dart_domain->pgtbl_ops);
+
+	kfree(dart_domain);
+}
+
+static int apple_dart_of_xlate(struct device *dev, struct of_phandle_args *args)
+{
+	struct apple_dart_master_cfg *cfg = dev_iommu_priv_get(dev);
+	struct platform_device *iommu_pdev = of_find_device_by_node(args->np);
+	struct apple_dart *dart = platform_get_drvdata(iommu_pdev);
+	struct apple_dart *cfg_dart;
+	int i, sid;
+
+	if (args->args_count != 1)
+		return -EINVAL;
+	sid = args->args[0];
+
+	if (!cfg)
+		cfg = kzalloc(sizeof(*cfg), GFP_KERNEL);
+	if (!cfg)
+		return -ENOMEM;
+	dev_iommu_priv_set(dev, cfg);
+
+	cfg_dart = cfg->stream_maps[0].dart;
+	if (cfg_dart) {
+		if (cfg_dart->supports_bypass != dart->supports_bypass)
+			return -EINVAL;
+		if (cfg_dart->force_bypass != dart->force_bypass)
+			return -EINVAL;
+		if (cfg_dart->pgsize != dart->pgsize)
+			return -EINVAL;
+	}
+
+	for (i = 0; i < MAX_DARTS_PER_DEVICE; ++i) {
+		if (cfg->stream_maps[i].dart == dart) {
+			cfg->stream_maps[i].sidmap |= 1 << sid;
+			return 0;
+		}
+	}
+	for (i = 0; i < MAX_DARTS_PER_DEVICE; ++i) {
+		if (!cfg->stream_maps[i].dart) {
+			cfg->stream_maps[i].dart = dart;
+			cfg->stream_maps[i].sidmap = 1 << sid;
+			return 0;
+		}
+	}
+
+	return -EINVAL;
+}
+
+static struct iommu_group *apple_dart_device_group(struct device *dev)
+{
+	static DEFINE_MUTEX(lock);
+	int i, sid;
+	struct apple_dart_master_cfg *cfg = dev_iommu_priv_get(dev);
+	struct apple_dart_stream_map *stream_map;
+	struct iommu_group *group = NULL;
+	struct iommu_group *res = ERR_PTR(-EINVAL);
+
+	mutex_lock(&lock);
+
+	for_each_stream_map(i, cfg, stream_map) {
+		for_each_set_bit(sid, &stream_map->sidmap, DART_MAX_STREAMS) {
+			struct iommu_group *stream_group =
+				stream_map->dart->sid2group[sid];
+
+			if (group && group != stream_group) {
+				res = ERR_PTR(-EINVAL);
+				goto out;
+			}
+
+			group = stream_group;
+		}
+	}
+
+	if (group) {
+		res = iommu_group_ref_get(group);
+		goto out;
+	}
+
+#ifdef CONFIG_PCI
+	if (dev_is_pci(dev))
+		group = pci_device_group(dev);
+	else
+#endif
+		group = generic_device_group(dev);
+
+	for_each_stream_map(i, cfg, stream_map)
+		for_each_set_bit(sid, &stream_map->sidmap, DART_MAX_STREAMS)
+			stream_map->dart->sid2group[sid] = group;
+
+	res = group;
+
+out:
+	mutex_unlock(&lock);
+	return res;
+}
+
+static int apple_dart_def_domain_type(struct device *dev)
+{
+	struct apple_dart_master_cfg *cfg = dev_iommu_priv_get(dev);
+
+	if (cfg->stream_maps[0].dart->force_bypass)
+		return IOMMU_DOMAIN_IDENTITY;
+	if (!cfg->stream_maps[0].dart->supports_bypass)
+		return IOMMU_DOMAIN_DMA;
+
+	return 0;
+}
+
+static const struct iommu_ops apple_dart_iommu_ops = {
+	.domain_alloc = apple_dart_domain_alloc,
+	.domain_free = apple_dart_domain_free,
+	.attach_dev = apple_dart_attach_dev,
+	.detach_dev = apple_dart_detach_dev,
+	.map_pages = apple_dart_map_pages,
+	.unmap_pages = apple_dart_unmap_pages,
+	.flush_iotlb_all = apple_dart_flush_iotlb_all,
+	.iotlb_sync = apple_dart_iotlb_sync,
+	.iotlb_sync_map = apple_dart_iotlb_sync_map,
+	.iova_to_phys = apple_dart_iova_to_phys,
+	.probe_device = apple_dart_probe_device,
+	.release_device = apple_dart_release_device,
+	.device_group = apple_dart_device_group,
+	.of_xlate = apple_dart_of_xlate,
+	.def_domain_type = apple_dart_def_domain_type,
+	.pgsize_bitmap = -1UL, /* Restricted during dart probe */
+};
+
+static irqreturn_t apple_dart_irq(int irq, void *dev)
+{
+	struct apple_dart *dart = dev;
+	const char *fault_name = NULL;
+	u32 error = readl(dart->regs + DART_ERROR);
+	u32 error_code = FIELD_GET(DART_ERROR_CODE, error);
+	u32 addr_lo = readl(dart->regs + DART_ERROR_ADDR_LO);
+	u32 addr_hi = readl(dart->regs + DART_ERROR_ADDR_HI);
+	u64 addr = addr_lo | (((u64)addr_hi) << 32);
+	u8 stream_idx = FIELD_GET(DART_ERROR_STREAM, error);
+
+	if (!(error & DART_ERROR_FLAG))
+		return IRQ_NONE;
+
+	/* there should only be a single bit set but let's use == to be sure */
+	if (error_code == DART_ERROR_READ_FAULT)
+		fault_name = "READ FAULT";
+	else if (error_code == DART_ERROR_WRITE_FAULT)
+		fault_name = "WRITE FAULT";
+	else if (error_code == DART_ERROR_NO_PTE)
+		fault_name = "NO PTE FOR IOVA";
+	else if (error_code == DART_ERROR_NO_PMD)
+		fault_name = "NO PMD FOR IOVA";
+	else if (error_code == DART_ERROR_NO_TTBR)
+		fault_name = "NO TTBR FOR IOVA";
+	else
+		fault_name = "unknown";
+
+	dev_err_ratelimited(
+		dart->dev,
+		"translation fault: status:0x%x stream:%d code:0x%x (%s) at 0x%llx",
+		error, stream_idx, error_code, fault_name, addr);
+
+	writel(error, dart->regs + DART_ERROR);
+	return IRQ_HANDLED;
+}
+
+static int apple_dart_set_bus_ops(const struct iommu_ops *ops)
+{
+	int ret;
+
+	if (!iommu_present(&platform_bus_type)) {
+		ret = bus_set_iommu(&platform_bus_type, ops);
+		if (ret)
+			return ret;
+	}
+#ifdef CONFIG_PCI
+	if (!iommu_present(&pci_bus_type)) {
+		ret = bus_set_iommu(&pci_bus_type, ops);
+		if (ret) {
+			bus_set_iommu(&platform_bus_type, NULL);
+			return ret;
+		}
+	}
+#endif
+	return 0;
+}
+
+static int apple_dart_probe(struct platform_device *pdev)
+{
+	int ret;
+	u32 dart_params[2];
+	struct resource *res;
+	struct apple_dart *dart;
+	struct device *dev = &pdev->dev;
+
+	dart = devm_kzalloc(dev, sizeof(*dart), GFP_KERNEL);
+	if (!dart)
+		return -ENOMEM;
+
+	dart->dev = dev;
+	spin_lock_init(&dart->lock);
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (resource_size(res) < 0x4000) {
+		dev_err(dev, "MMIO region too small (%pr)\n", res);
+		return -EINVAL;
+	}
+
+	dart->regs = devm_ioremap_resource(dev, res);
+	if (IS_ERR(dart->regs))
+		return PTR_ERR(dart->regs);
+
+	dart->irq = platform_get_irq(pdev, 0);
+	if (dart->irq < 0)
+		return -ENODEV;
+
+	ret = devm_clk_bulk_get_all(dev, &dart->clks);
+	if (ret < 0)
+		return ret;
+	dart->num_clks = ret;
+
+	ret = clk_bulk_prepare_enable(dart->num_clks, dart->clks);
+	if (ret)
+		return ret;
+
+	ret = apple_dart_hw_reset(dart);
+	if (ret)
+		goto err_clk_disable;
+
+	dart_params[0] = readl(dart->regs + DART_PARAMS1);
+	dart_params[1] = readl(dart->regs + DART_PARAMS2);
+	dart->pgsize = 1 << FIELD_GET(DART_PARAMS_PAGE_SHIFT, dart_params[0]);
+	dart->supports_bypass = dart_params[1] & DART_PARAMS_BYPASS_SUPPORT;
+	dart->force_bypass = dart->pgsize > PAGE_SIZE;
+
+	ret = request_irq(dart->irq, apple_dart_irq, IRQF_SHARED,
+			  "apple-dart fault handler", dart);
+	if (ret)
+		goto err_clk_disable;
+
+	platform_set_drvdata(pdev, dart);
+
+	ret = apple_dart_set_bus_ops(&apple_dart_iommu_ops);
+	if (ret)
+		goto err_free_irq;
+
+	ret = iommu_device_sysfs_add(&dart->iommu, dev, NULL, "apple-dart.%s",
+				     dev_name(&pdev->dev));
+	if (ret)
+		goto err_remove_bus_ops;
+
+	ret = iommu_device_register(&dart->iommu, &apple_dart_iommu_ops, dev);
+	if (ret)
+		goto err_sysfs_remove;
+
+	dev_info(
+		&pdev->dev,
+		"DART [pagesize %x, bypass support: %d, bypass forced: %d] initialized\n",
+		dart->pgsize, dart->supports_bypass, dart->force_bypass);
+	return 0;
+
+err_sysfs_remove:
+	iommu_device_sysfs_remove(&dart->iommu);
+err_remove_bus_ops:
+	apple_dart_set_bus_ops(NULL);
+err_free_irq:
+	free_irq(dart->irq, dart);
+err_clk_disable:
+	clk_bulk_disable_unprepare(dart->num_clks, dart->clks);
+
+	return ret;
+}
+
+static int apple_dart_remove(struct platform_device *pdev)
+{
+	struct apple_dart *dart = platform_get_drvdata(pdev);
+
+	apple_dart_hw_reset(dart);
+	free_irq(dart->irq, dart);
+	apple_dart_set_bus_ops(NULL);
+
+	iommu_device_unregister(&dart->iommu);
+	iommu_device_sysfs_remove(&dart->iommu);
+
+	clk_bulk_disable_unprepare(dart->num_clks, dart->clks);
+
+	return 0;
+}
+
+static const struct of_device_id apple_dart_of_match[] = {
+	{ .compatible = "apple,t8103-dart", .data = NULL },
+	{},
+};
+MODULE_DEVICE_TABLE(of, apple_dart_of_match);
+
+static struct platform_driver apple_dart_driver = {
+	.driver	= {
+		.name			= "apple-dart",
+		.of_match_table		= apple_dart_of_match,
+		.suppress_bind_attrs    = true,
+	},
+	.probe	= apple_dart_probe,
+	.remove	= apple_dart_remove,
+};
+
+module_platform_driver(apple_dart_driver);
+
+MODULE_DESCRIPTION("IOMMU API for Apple's DART");
+MODULE_AUTHOR("Sven Peter <sven@svenpeter.dev>");
+MODULE_LICENSE("GPL v2");
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
