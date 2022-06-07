Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 62EB9533597
	for <lists.iommu@lfdr.de>; Wed, 25 May 2022 05:05:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C2C382CE5;
	Wed, 25 May 2022 03:05:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nn_VRZL1LZJM; Wed, 25 May 2022 03:05:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id C4D0A83E95;
	Wed, 25 May 2022 03:05:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BBF9EC0089;
	Wed, 25 May 2022 03:05:53 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CC841C002D
 for <iommu@lists.linux-foundation.org>; Wed, 25 May 2022 02:14:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A86FC41A2C
 for <iommu@lists.linux-foundation.org>; Wed, 25 May 2022 02:14:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ES2Edyco6ZgD for <iommu@lists.linux-foundation.org>;
 Wed, 25 May 2022 02:14:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mo-csw-fb.securemx.jp (mo-csw-fb1116.securemx.jp
 [210.130.202.175])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 085C841825
 for <iommu@lists.linux-foundation.org>; Wed, 25 May 2022 02:14:09 +0000 (UTC)
Received: by mo-csw-fb.securemx.jp (mx-mo-csw-fb1116) id 24P1WgAf030259;
 Wed, 25 May 2022 10:32:42 +0900
Received: by mo-csw.securemx.jp (mx-mo-csw1116) id 24P1W7Th014821;
 Wed, 25 May 2022 10:32:07 +0900
X-Iguazu-Qid: 2wHHHyKX0lbFiMi8LA
X-Iguazu-QSIG: v=2; s=0; t=1653442327; q=2wHHHyKX0lbFiMi8LA;
 m=S8PfbmJQXHhgrjiAJLK0y3OE7Y40IWRMiFuRZYu1Dso=
Received: from imx12-a.toshiba.co.jp (imx12-a.toshiba.co.jp [61.202.160.135])
 by relay.securemx.jp (mx-mr1110) id 24P1W6Qs016219
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 25 May 2022 10:32:06 +0900
From: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 1/3] iommu: Add Visconti5 IOMMU driver
Date: Wed, 25 May 2022 10:31:45 +0900
X-TSB-HOP2: ON
Message-Id: <20220525013147.2215355-2-nobuhiro1.iwamatsu@toshiba.co.jp>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220525013147.2215355-1-nobuhiro1.iwamatsu@toshiba.co.jp>
References: <20220525013147.2215355-1-nobuhiro1.iwamatsu@toshiba.co.jp>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 25 May 2022 03:05:51 +0000
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 yuji2.ishikawa@toshiba.co.jp, linux-arm-kernel@lists.infradead.org
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

Add IOMMU (ATU) driver can bse used for Visconti5's multimedia IPs, such as
DCNN (Deep Convolutional Neural Network), VIIF(Video Input), VOIF(Video
output), and others.

Signed-off-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
---
 drivers/iommu/Kconfig        |   7 +
 drivers/iommu/Makefile       |   1 +
 drivers/iommu/visconti-atu.c | 426 +++++++++++++++++++++++++++++++++++
 3 files changed, 434 insertions(+)
 create mode 100644 drivers/iommu/visconti-atu.c

diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index c79a0df090c0..8a4351020b7f 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -486,4 +486,11 @@ config SPRD_IOMMU
 
 	  Say Y here if you want to use the multimedia devices listed above.
 
+config VISCONTI_ATU
+	tristate "Toshiba Visconti5 IOMMU Support"
+	depends on ARCH_VISCONTI || COMPILE_TEST
+	select IOMMU_API
+	help
+	  Support for the IOMMU API for Toshiba Visconti5 ARM SoCs.
+
 endif # IOMMU_SUPPORT
diff --git a/drivers/iommu/Makefile b/drivers/iommu/Makefile
index 44475a9b3eea..077189f908ea 100644
--- a/drivers/iommu/Makefile
+++ b/drivers/iommu/Makefile
@@ -30,3 +30,4 @@ obj-$(CONFIG_VIRTIO_IOMMU) += virtio-iommu.o
 obj-$(CONFIG_IOMMU_SVA) += iommu-sva-lib.o io-pgfault.o
 obj-$(CONFIG_SPRD_IOMMU) += sprd-iommu.o
 obj-$(CONFIG_APPLE_DART) += apple-dart.o
+obj-$(CONFIG_VISCONTI_ATU) += visconti-atu.o
diff --git a/drivers/iommu/visconti-atu.c b/drivers/iommu/visconti-atu.c
new file mode 100644
index 000000000000..269c912ad4c9
--- /dev/null
+++ b/drivers/iommu/visconti-atu.c
@@ -0,0 +1,426 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Toshiba Visconti5 IOMMU (ATU) driver
+ *
+ * (C) Copyright 2022 Toshiba Electronic Devices & Storage Corporation
+ * (C) Copyright 2022 Toshiba CORPORATION
+ *
+ * Author: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
+ */
+
+#include <linux/dma-iommu.h>
+#include <linux/dma-mapping.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/sizes.h>
+#include <linux/slab.h>
+
+/* Regsiter address */
+#define ATU_AT_EN		0x0000
+#define ATU_AT_ENTRY_EN		0x0020
+
+#define ATU_AT_BLADDR		0x0030
+#define ATU_AT_ELADDR		0x0038
+#define ATU_AT_BGADDR0		0x0040
+#define ATU_AT_BGADDR1		0x0044
+#define ATU_AT_CONF		0x0048
+#define ATU_AT_REG(n, reg)	(0x20 * n + reg)
+
+#define ATU_INT_START		0x0440
+#define ATU_INT_MASKED_STAT	0x0444
+#define ATU_INT_MASK		0x0448
+#define ATU_RP_CONF		0x0450
+#define ATU_ERR_ADDR		0x0454
+#define ATU_ERR_CLR		0x045C
+#define ATU_STAT		0x0460
+
+#define ATU_BGADDR_MASK GENMASK(31, 0)
+
+#define ATU_IOMMU_PGSIZE_BITMAP	0x7ffff000 /* SZ_1G - SZ_4K */
+#define ATU_MAX_IOMMU_ENTRY	32
+
+struct visconti_atu_device {
+	struct device *dev;
+	void __iomem *base;
+	struct iommu_device iommu;
+	struct iommu_group *group;
+
+	unsigned int num_entry;
+	unsigned int num_map_entry;
+	unsigned int enable_entry;
+	unsigned long iova[ATU_MAX_IOMMU_ENTRY];
+	phys_addr_t paddr[ATU_MAX_IOMMU_ENTRY];
+	size_t size[ATU_MAX_IOMMU_ENTRY];
+
+	spinlock_t lock;
+};
+
+struct visconti_atu_domain {
+	struct visconti_atu_device *atu;
+	struct iommu_domain io_domain;
+	struct mutex mutex;
+};
+
+static const struct iommu_ops visconti_atu_ops;
+
+static struct visconti_atu_domain *to_atu_domain(struct iommu_domain *domain)
+{
+	return container_of(domain, struct visconti_atu_domain, io_domain);
+}
+
+static inline void visconti_atu_write(struct visconti_atu_device *atu, u32 reg,
+				      u32 val)
+{
+	writel_relaxed(val, atu->base + reg);
+}
+
+static inline u32 visconti_atu_read(struct visconti_atu_device *atu, u32 reg)
+{
+	return readl_relaxed(atu->base + reg);
+}
+
+static void visconti_atu_enable_entry(struct visconti_atu_device *atu,
+				      int num)
+{
+	dev_dbg(atu->dev, "enable ATU: %d\n", atu->enable_entry);
+
+	visconti_atu_write(atu, ATU_AT_EN, 0);
+	if (atu->enable_entry & BIT(num)) {
+		visconti_atu_write(atu,
+				   ATU_AT_REG(num, ATU_AT_BLADDR),
+				   atu->iova[num]);
+		visconti_atu_write(atu,
+				   ATU_AT_REG(num, ATU_AT_ELADDR),
+				   atu->iova[num] + atu->size[num] - 1);
+		visconti_atu_write(atu,
+				   ATU_AT_REG(num, ATU_AT_BGADDR0),
+				   atu->iova[num] & ATU_BGADDR_MASK);
+		visconti_atu_write(atu,
+				   ATU_AT_REG(num, ATU_AT_BGADDR1),
+				   (atu->iova[num] >> 32) & ATU_BGADDR_MASK);
+	}
+	visconti_atu_write(atu, ATU_AT_ENTRY_EN, atu->enable_entry);
+	visconti_atu_write(atu, ATU_AT_EN, 1);
+}
+
+static void visconti_atu_disable_entry(struct visconti_atu_device *atu)
+{
+	dev_dbg(atu->dev, "disable ATU: %d\n", atu->enable_entry);
+
+	visconti_atu_write(atu, ATU_AT_EN, 0);
+	visconti_atu_write(atu, ATU_AT_ENTRY_EN, atu->enable_entry);
+	visconti_atu_write(atu, ATU_AT_EN, 1);
+}
+
+static int visconti_atu_attach_device(struct iommu_domain *io_domain,
+				      struct device *dev)
+{
+	struct visconti_atu_domain *domain = to_atu_domain(io_domain);
+	struct visconti_atu_device *atu = dev_iommu_priv_get(dev);
+	int ret = 0;
+
+	if (!atu) {
+		dev_err(dev, "Cannot attach to ATU\n");
+		return -ENXIO;
+	}
+
+	mutex_lock(&domain->mutex);
+
+	if (!domain->atu) {
+		domain->atu = atu;
+	} else if (domain->atu != atu) {
+		dev_err(dev, "Can't attach ATU %s to domain on ATU %s\n",
+			dev_name(atu->dev), dev_name(domain->atu->dev));
+		ret = -EINVAL;
+	} else {
+		dev_warn(dev, "Reusing ATU context\n");
+	}
+
+	mutex_unlock(&domain->mutex);
+
+	return ret;
+}
+
+static void visconti_atu_detach_device(struct iommu_domain *io_domain,
+				       struct device *dev)
+{
+	struct visconti_atu_domain *domain = to_atu_domain(io_domain);
+	struct visconti_atu_device *atu = dev_iommu_priv_get(dev);
+
+	if (domain->atu != atu)
+		return;
+
+	domain->atu = NULL;
+}
+
+static int visconti_atu_map(struct iommu_domain *io_domain,
+			    unsigned long iova,
+			    phys_addr_t paddr,
+			    size_t size, int prot, gfp_t gfp)
+{
+	struct visconti_atu_domain *domain = to_atu_domain(io_domain);
+	struct visconti_atu_device *atu = domain->atu;
+	unsigned long flags;
+	unsigned int i;
+
+	if (!domain)
+		return -ENODEV;
+
+	spin_lock_irqsave(&atu->lock, flags);
+	for (i = 0; i < atu->num_map_entry; i++) {
+		if (!(atu->enable_entry & BIT(i))) {
+			atu->enable_entry |= BIT(i);
+			atu->iova[i] = iova;
+			atu->paddr[i] = paddr;
+			atu->size[i] = size;
+
+			visconti_atu_enable_entry(atu, i);
+			break;
+		}
+	}
+	spin_unlock_irqrestore(&atu->lock, flags);
+
+	if (i == atu->num_map_entry) {
+		dev_err(atu->dev, "map: not enough entry.\n");
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
+static size_t visconti_atu_unmap(struct iommu_domain *io_domain,
+				 unsigned long iova,
+				 size_t size,
+				 struct iommu_iotlb_gather *iotlb_gather)
+{
+	struct visconti_atu_domain *domain = to_atu_domain(io_domain);
+	struct visconti_atu_device *atu = domain->atu;
+	size_t tmp_size = size;
+	unsigned long flags;
+	unsigned int i;
+
+	spin_lock_irqsave(&atu->lock, flags);
+
+	while (tmp_size != 0) {
+		for (i = 0; i < atu->num_map_entry; i++) {
+			if (atu->iova[i] != iova)
+				continue;
+
+			atu->enable_entry &= ~BIT(i);
+			iova += atu->size[i];
+			tmp_size -= atu->size[i];
+
+			visconti_atu_disable_entry(atu);
+
+			break;
+		}
+		if (i == atu->num_map_entry) {
+			dev_err(atu->dev, "unmap: not found entry.\n");
+			size = 0;
+			goto out;
+		}
+	}
+
+	if (!atu->num_map_entry)
+		visconti_atu_write(atu, ATU_AT_EN, 0);
+out:
+	spin_unlock_irqrestore(&atu->lock, flags);
+	return size;
+}
+
+static phys_addr_t visconti_atu_iova_to_phys(struct iommu_domain *io_domain,
+					     dma_addr_t iova)
+{
+	struct visconti_atu_domain *domain = to_atu_domain(io_domain);
+	struct visconti_atu_device *atu = domain->atu;
+	phys_addr_t paddr = 0;
+	unsigned int i;
+
+	for (i = 0; i < atu->num_map_entry; i++) {
+		if (!(atu->enable_entry & BIT(i)))
+			continue;
+		if (atu->iova[i] <= iova && iova < (atu->iova[i] + atu->size[i])) {
+			paddr = atu->paddr[i];
+			paddr += iova & (atu->size[i] - 1);
+			break;
+		}
+	}
+
+	dev_dbg(atu->dev, "iova_to_phys: %llx -> %llx\n", iova, paddr);
+
+	return paddr;
+}
+
+static int visconti_atu_of_xlate(struct device *dev, struct of_phandle_args *args)
+{
+	if (!dev_iommu_priv_get(dev)) {
+		struct platform_device *pdev;
+
+		pdev = of_find_device_by_node(args->np);
+		dev_iommu_priv_set(dev, platform_get_drvdata(pdev));
+		platform_device_put(pdev);
+	}
+
+	return 0;
+}
+
+static struct iommu_domain *visconti_atu_domain_alloc(unsigned int type)
+{
+	struct visconti_atu_domain *domain;
+
+	if (type != IOMMU_DOMAIN_UNMANAGED && type != IOMMU_DOMAIN_DMA)
+		return NULL;
+
+	domain = kzalloc(sizeof(*domain), GFP_KERNEL);
+	if (!domain)
+		return NULL;
+
+	mutex_init(&domain->mutex);
+
+	domain->io_domain.geometry.aperture_start = 0;
+	domain->io_domain.geometry.aperture_end = DMA_BIT_MASK(32);
+	domain->io_domain.geometry.force_aperture = true;
+
+	return &domain->io_domain;
+}
+
+static void visconti_atu_domain_free(struct iommu_domain *io_domain)
+{
+	struct visconti_atu_domain *domain = to_atu_domain(io_domain);
+
+	kfree(domain);
+}
+
+static struct iommu_device *visconti_atu_probe_device(struct device *dev)
+{
+	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
+	struct visconti_atu_device *atu;
+
+	if (!fwspec || fwspec->ops != &visconti_atu_ops)
+		return ERR_PTR(-ENODEV);
+
+	atu = dev_iommu_priv_get(dev);
+	return &atu->iommu;
+}
+
+static void visconti_atu_release_device(struct device *dev)
+{
+	struct visconti_atu_device *atu = dev_iommu_priv_get(dev);
+
+	if (!atu)
+		return;
+
+	iommu_fwspec_free(dev);
+}
+
+static const struct iommu_ops visconti_atu_ops = {
+	.domain_alloc = visconti_atu_domain_alloc,
+	.probe_device = visconti_atu_probe_device,
+	.release_device = visconti_atu_release_device,
+	.device_group = generic_device_group,
+	.of_xlate = visconti_atu_of_xlate,
+	.pgsize_bitmap = ATU_IOMMU_PGSIZE_BITMAP,
+	.default_domain_ops = &(const struct iommu_domain_ops) {
+		.attach_dev = visconti_atu_attach_device,
+		.detach_dev = visconti_atu_detach_device,
+		.map = visconti_atu_map,
+		.unmap = visconti_atu_unmap,
+		.iova_to_phys = visconti_atu_iova_to_phys,
+		.free = visconti_atu_domain_free,
+	}
+};
+
+static int visconti_atu_probe(struct platform_device *pdev)
+{
+	struct visconti_atu_device *atu;
+	struct device *dev = &pdev->dev;
+	struct resource *res;
+	u32 reserved_entry;
+	int ret;
+
+	atu = devm_kzalloc(&pdev->dev, sizeof(*atu), GFP_KERNEL);
+	if (!atu)
+		return -ENOMEM;
+
+	ret = of_property_read_u32(dev->of_node, "toshiba,max-entry",
+				   &atu->num_entry);
+	if (ret < 0) {
+		dev_err(dev, "cannot get max-entry data\n");
+		return ret;
+	}
+
+	ret = of_property_read_u32(dev->of_node, "toshiba,reserved-entry",
+				   &reserved_entry);
+	if (ret < 0)
+		reserved_entry = 0;
+
+	if (atu->num_entry < reserved_entry)
+		return -EINVAL;
+
+	atu->num_map_entry = atu->num_entry - reserved_entry;
+	atu->enable_entry = 0;
+	atu->dev = dev;
+
+	atu->group = iommu_group_alloc();
+	if (IS_ERR(atu->group)) {
+		ret = PTR_ERR(atu->group);
+		goto out;
+	}
+
+	spin_lock_init(&atu->lock);
+
+	atu->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
+	if (IS_ERR(atu->base)) {
+		ret = PTR_ERR(atu->base);
+		goto out;
+	}
+
+	ret = iommu_device_sysfs_add(&atu->iommu, dev, NULL, dev_name(dev));
+	if (ret)
+		goto out;
+
+	ret = iommu_device_register(&atu->iommu, &visconti_atu_ops, dev);
+	if (ret)
+		goto remove_sysfs;
+
+	if (!iommu_present(&platform_bus_type))
+		bus_set_iommu(&platform_bus_type, &visconti_atu_ops);
+	platform_set_drvdata(pdev, atu);
+
+	return 0;
+
+remove_sysfs:
+	iommu_device_sysfs_remove(&atu->iommu);
+out:
+	return ret;
+}
+
+static int visconti_atu_remove(struct platform_device *pdev)
+{
+	struct visconti_atu_device *atu = platform_get_drvdata(pdev);
+
+	iommu_device_sysfs_remove(&atu->iommu);
+	iommu_device_unregister(&atu->iommu);
+
+	return 0;
+}
+
+static const struct of_device_id visconti_atu_of_match[] = {
+	{ .compatible = "toshiba,visconti-atu", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, visconti_atu_of_match);
+
+static struct platform_driver visconti_atu_driver = {
+	.driver = {
+		.name = "visconti-atu",
+		.of_match_table = visconti_atu_of_match,
+		.suppress_bind_attrs = true,
+	},
+	.probe = visconti_atu_probe,
+	.remove = visconti_atu_remove,
+};
+
+builtin_platform_driver(visconti_atu_driver);
-- 
2.36.0


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
