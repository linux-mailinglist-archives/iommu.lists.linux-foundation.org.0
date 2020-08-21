Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A00824CA41
	for <lists.iommu@lfdr.de>; Fri, 21 Aug 2020 04:17:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 177BD885F6;
	Fri, 21 Aug 2020 02:17:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lG4a8VaDBbzJ; Fri, 21 Aug 2020 02:17:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5671588606;
	Fri, 21 Aug 2020 02:17:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5058CC0051;
	Fri, 21 Aug 2020 02:17:31 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EA548C0051
 for <iommu@lists.linux-foundation.org>; Fri, 21 Aug 2020 02:17:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E6CF488603
 for <iommu@lists.linux-foundation.org>; Fri, 21 Aug 2020 02:17:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1VxaQXX8jYdK for <iommu@lists.linux-foundation.org>;
 Fri, 21 Aug 2020 02:17:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 82EB1885F6
 for <iommu@lists.linux-foundation.org>; Fri, 21 Aug 2020 02:17:27 +0000 (UTC)
Message-Id: <20200821002949.049867339@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1597976245;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=UZL8Vrdl0kfkPDF5SaQDsWiCtREqKSzkO7Z4G3k5ULk=;
 b=l/wu+Pva8knpMeliQg3p05zViowZHU+QrYhimvAjTlzTvj7Rq0o3z0fgDwioZqT5n3RmXm
 F0aNCytWXBt3Xlz7oezNwVDUjuMreDqNU6oeR2pPLOwNnd9pgXGfQt3QBAF+3GQ8wBXp/c
 gV8PrEsxwldr4Cmq+FjlkWmPQ6dwED9J9p6AR1ww3KUj2t4wDbNLU+i7YFgCfTSbuyXl2e
 XPlsK/VEgMFEDIHDRKu23aCsekWuzHSirgeg2lkkswLfA3QKQ5cuDL8yMnocgM1nxYZy4c
 34+5mV2GLxrkckJysmQbmOMx08+XZIVMbmVkHxO9Iq3pB69jMzKnzkc54L7F8Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1597976245;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=UZL8Vrdl0kfkPDF5SaQDsWiCtREqKSzkO7Z4G3k5ULk=;
 b=7kh3fLmij9PvpFN53Wn8ekuPhx6wjhRLqyiDFbeUfbbAIiSuYbaAqZpnLbGxdxX22bkT3C
 oRRfQnxb9WWfMzDw==
Date: Fri, 21 Aug 2020 02:25:02 +0200
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch RFC 38/38] irqchip: Add IMS array driver - NOT FOR MERGING
References: <20200821002424.119492231@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline; filename=irqchip--Add-IMS-array-driver.patch
Cc: Dimitri Sivanich <sivanich@hpe.com>, linux-hyperv@vger.kernel.org,
 Steve Wahl <steve.wahl@hpe.com>, linux-pci@vger.kernel.org,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Wei Liu <wei.liu@kernel.org>,
 Dave Jiang <dave.jiang@intel.com>, Baolu Lu <baolu.lu@intel.com>,
 Marc Zyngier <maz@kernel.org>, x86@kernel.org,
 Jason Gunthorpe <jgg@mellanox.com>, Megha Dey <megha.dey@intel.com>,
 xen-devel@lists.xenproject.org, Kevin Tian <kevin.tian@intel.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Jonathan Derrick <jonathan.derrick@intel.com>, Juergen Gross <jgross@suse.com>,
 Russ Anderson <rja@hpe.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 iommu@lists.linux-foundation.org, Jacob Pan <jacob.jun.pan@intel.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>
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

A generic IMS irq chip and irq domain implementation for IMS based devices
which utilize a MSI message store array on chip.

Allows IMS devices with a MSI message store array to reuse this code for
different array sizes.

Allocation and freeing of interrupts happens via the generic
msi_domain_alloc/free_irqs() interface. No special purpose IMS magic
required as long as the interrupt domain is stored in the underlying device
struct.

Completely untested of course and mostly for illustration and educational
purpose. This should of course be a modular irq chip, but adding that
support is left as an exercise for the people who care about this deeply.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Megha Dey <megha.dey@intel.com>
Cc: Jason Gunthorpe <jgg@mellanox.com>
Cc: Dave Jiang <dave.jiang@intel.com>
Cc: Alex Williamson <alex.williamson@redhat.com>
Cc: Jacob Pan <jacob.jun.pan@intel.com>
Cc: Baolu Lu <baolu.lu@intel.com>
Cc: Kevin Tian <kevin.tian@intel.com>
Cc: Dan Williams <dan.j.williams@intel.com>
---
 drivers/irqchip/Kconfig             |    8 +
 drivers/irqchip/Makefile            |    1 
 drivers/irqchip/irq-ims-msi.c       |  169 ++++++++++++++++++++++++++++++++++++
 include/linux/irqchip/irq-ims-msi.h |   41 ++++++++
 4 files changed, 219 insertions(+)

--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -571,4 +571,12 @@ config LOONGSON_PCH_MSI
 	help
 	  Support for the Loongson PCH MSI Controller.
 
+config IMS_MSI
+	bool "IMS Interrupt Message Store MSI controller"
+	depends on PCI
+	select DEVICE_MSI
+	help
+	  Support for IMS Interrupt Message Store MSI controller
+	  with IMS slot storage in a slot array
+
 endmenu
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -111,3 +111,4 @@ obj-$(CONFIG_LOONGSON_HTPIC)		+= irq-loo
 obj-$(CONFIG_LOONGSON_HTVEC)		+= irq-loongson-htvec.o
 obj-$(CONFIG_LOONGSON_PCH_PIC)		+= irq-loongson-pch-pic.o
 obj-$(CONFIG_LOONGSON_PCH_MSI)		+= irq-loongson-pch-msi.o
+obj-$(CONFIG_IMS_MSI)			+= irq-ims-msi.o
--- /dev/null
+++ b/drivers/irqchip/irq-ims-msi.c
@@ -0,0 +1,169 @@
+// SPDX-License-Identifier: GPL-2.0
+// (C) Copyright 2020 Thomas Gleixner <tglx@linutronix.de>
+/*
+ * Shared interrupt chip and irq domain for Intel IMS devices
+ */
+#include <linux/device.h>
+#include <linux/slab.h>
+#include <linux/msi.h>
+#include <linux/irq.h>
+
+#include <linux/irqchip/irq-ims-msi.h>
+
+struct ims_data {
+	struct ims_array_info	info;
+	unsigned long		map[0];
+};
+
+static void ims_mask_irq(struct irq_data *data)
+{
+	struct msi_desc *desc = irq_data_get_msi_desc(data);
+	struct ims_array_slot __iomem *slot = desc->device_msi.priv_iomem;
+	u32 __iomem *ctrl = &slot->ctrl;
+
+	iowrite32(ioread32(ctrl) & ~IMS_VECTOR_CTRL_UNMASK, ctrl);
+}
+
+static void ims_unmask_irq(struct irq_data *data)
+{
+	struct msi_desc *desc = irq_data_get_msi_desc(data);
+	struct ims_array_slot __iomem *slot = desc->device_msi.priv_iomem;
+	u32 __iomem *ctrl = &slot->ctrl;
+
+	iowrite32(ioread32(ctrl) | IMS_VECTOR_CTRL_UNMASK, ctrl);
+}
+
+static void ims_write_msi_msg(struct irq_data *data, struct msi_msg *msg)
+{
+	struct msi_desc *desc = irq_data_get_msi_desc(data);
+	struct ims_array_slot __iomem *slot = desc->device_msi.priv_iomem;
+
+	iowrite32(msg->address_lo, &slot->address_lo);
+	iowrite32(msg->address_hi, &slot->address_hi);
+	iowrite32(msg->data, &slot->data);
+}
+
+static const struct irq_chip ims_msi_controller = {
+	.name			= "IMS",
+	.irq_mask		= ims_mask_irq,
+	.irq_unmask		= ims_unmask_irq,
+	.irq_write_msi_msg	= ims_write_msi_msg,
+	.irq_retrigger		= irq_chip_retrigger_hierarchy,
+	.flags			= IRQCHIP_SKIP_SET_WAKE,
+};
+
+static void ims_reset_slot(struct ims_array_slot __iomem *slot)
+{
+	iowrite32(0, &slot->address_lo);
+	iowrite32(0, &slot->address_hi);
+	iowrite32(0, &slot->data);
+	iowrite32(0, &slot->ctrl);
+}
+
+static void ims_free_msi_store(struct irq_domain *domain, struct device *dev)
+{
+	struct msi_domain_info *info = domain->host_data;
+	struct ims_data *ims = info->data;
+	struct msi_desc *entry;
+
+	for_each_msi_entry(entry, dev) {
+		if (entry->device_msi.priv_iomem) {
+			clear_bit(entry->device_msi.hwirq, ims->map);
+			ims_reset_slot(entry->device_msi.priv_iomem);
+			entry->device_msi.priv_iomem = NULL;
+			entry->device_msi.hwirq = 0;
+		}
+	}
+}
+
+static int ims_alloc_msi_store(struct irq_domain *domain, struct device *dev,
+			       int nvec)
+{
+	struct msi_domain_info *info = domain->host_data;
+	struct ims_data *ims = info->data;
+	struct msi_desc *entry;
+
+	for_each_msi_entry(entry, dev) {
+		unsigned int idx;
+
+		idx = find_first_zero_bit(ims->map, ims->info.max_slots);
+		if (idx >= ims->info.max_slots)
+			goto fail;
+		set_bit(idx, ims->map);
+		entry->device_msi.priv_iomem = &ims->info.slots[idx];
+		entry->device_msi.hwirq = idx;
+	}
+	return 0;
+
+fail:
+	ims_free_msi_store(domain, dev);
+	return -ENOSPC;
+}
+
+struct ims_domain_template {
+	struct msi_domain_ops	ops;
+	struct msi_domain_info	info;
+};
+
+static const struct ims_domain_template ims_domain_template = {
+	.ops = {
+		.msi_alloc_store	= ims_alloc_msi_store,
+		.msi_free_store		= ims_free_msi_store,
+	},
+	.info = {
+		.flags		= MSI_FLAG_USE_DEF_DOM_OPS |
+				  MSI_FLAG_USE_DEF_CHIP_OPS,
+		.handler	= handle_edge_irq,
+		.handler_name	= "edge",
+	},
+};
+
+struct irq_domain *
+pci_ims_create_msi_irq_domain(struct pci_dev *pdev,
+			      struct ims_array_info *ims_info)
+{
+	struct ims_domain_template *info;
+	struct irq_domain *domain;
+	struct irq_chip *chip;
+	struct ims_data *data;
+	unsigned int size;
+
+	/* Allocate new domain storage */
+	info = kmemdup(&ims_domain_template, sizeof(ims_domain_template),
+		       GFP_KERNEL);
+	if (!info)
+		return NULL;
+	/* Link the ops */
+	info->info.ops = &info->ops;
+
+	/* Allocate ims_info along with the bitmap */
+	size = sizeof(*data);
+	size += BITS_TO_LONGS(ims_info->max_slots) * sizeof(unsigned long);
+	data = kzalloc(size, GFP_KERNEL);
+	if (!data)
+		goto err_info;
+
+	data->info = *ims_info;
+	info->info.data = data;
+
+	chip = kmemdup(&ims_msi_controller, sizeof(ims_msi_controller),
+		       GFP_KERNEL);
+	if (!chip)
+		goto err_data;
+	info->info.chip = chip;
+
+	domain = pci_subdevice_msi_create_irq_domain(pdev, &info->info);
+	if (!domain)
+		goto err_chip;
+
+	return domain;
+
+err_chip:
+	kfree(chip);
+err_data:
+	kfree(data);
+err_info:
+	kfree(info);
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(pci_ims_create_msi_irq_domain);
--- /dev/null
+++ b/include/linux/irqchip/irq-ims-msi.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* (C) Copyright 2020 Thomas Gleixner <tglx@linutronix.de> */
+
+#ifndef _LINUX_IRQCHIP_IRQ_IMS_MSI_H
+#define _LINUX_IRQCHIP_IRQ_IMS_MSI_H
+
+#include <linux/types.h>
+
+struct ims_array_slot {
+	u32	address_lo;
+	u32	address_hi;
+	u32	data;
+	u32	ctrl;
+};
+
+/* Bit to unmask the interrupt in slot->ctrl */
+#define IMS_VECTOR_CTRL_UNMASK	0x01
+
+struct ims_array_info {
+	struct ims_array_slot	__iomem *slots;
+	unsigned int		max_slots;
+};
+
+/* Dummy forward declaration for illustration */
+struct ims_queue_slot;
+
+/**
+ * ims_msi_store - Interrupt Message Store descriptor data
+ * @array_slot:	Pointer to a on device IMS storage array slot
+ * @queue_slot:	Pointer to storage embedded in queue data
+ * @hw_irq:	Index of the slot or queue. Also hardware irq number
+ */
+struct ims_msi_store {
+	union {
+		struct ims_array_slot __iomem	*array_slot;
+		struct ims_queue_slot		*queue_slot;
+	};
+	unsigned int				hw_irq;
+};
+
+#endif

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
