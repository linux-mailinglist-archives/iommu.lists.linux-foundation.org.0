Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE7430E469
	for <lists.iommu@lfdr.de>; Wed,  3 Feb 2021 21:57:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id F286C86B27;
	Wed,  3 Feb 2021 20:57:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XfHo6u1fH1nP; Wed,  3 Feb 2021 20:57:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A801C86B6B;
	Wed,  3 Feb 2021 20:57:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 962E1C0FA7;
	Wed,  3 Feb 2021 20:57:35 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B737EC1E70
 for <iommu@lists.linux-foundation.org>; Wed,  3 Feb 2021 20:57:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A27E8871CF
 for <iommu@lists.linux-foundation.org>; Wed,  3 Feb 2021 20:57:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sYoI8EUpOuzn for <iommu@lists.linux-foundation.org>;
 Wed,  3 Feb 2021 20:57:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7BC9D871C9
 for <iommu@lists.linux-foundation.org>; Wed,  3 Feb 2021 20:57:30 +0000 (UTC)
IronPort-SDR: mG0AxDTnAZLR0Q1IGdnUYL4kdc2JAI+FqtlSWxGLP6gLr5UllwVITHnMSkIr+sOWCnp20hDbeT
 6lmcI/qlveDA==
X-IronPort-AV: E=McAfee;i="6000,8403,9884"; a="160875305"
X-IronPort-AV: E=Sophos;i="5.79,399,1602572400"; d="scan'208";a="160875305"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2021 12:57:30 -0800
IronPort-SDR: ES1Xf9ZIwk5IsL/BSza/sEsBAYTEtSL1hblroMmVJ9xn7G6oGgeA2QgbOVHLpecKZo7Kt9/4Xv
 ea6lX64WRRKA==
X-IronPort-AV: E=Sophos;i="5.79,399,1602572400"; d="scan'208";a="372510567"
Received: from megha-z97x-ud7-th.sc.intel.com ([143.183.85.154])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 03 Feb 2021 12:57:29 -0800
From: Megha Dey <megha.dey@intel.com>
To: tglx@linutronix.de
Subject: [PATCH 06/12] platform-msi: Add device MSI infrastructure
Date: Wed,  3 Feb 2021 12:56:39 -0800
Message-Id: <1612385805-3412-7-git-send-email-megha.dey@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1612385805-3412-1-git-send-email-megha.dey@intel.com>
References: <1612385805-3412-1-git-send-email-megha.dey@intel.com>
Cc: alex.williamson@redhat.com, kevin.tian@intel.com, tony.luck@intel.com,
 dave.jiang@intel.com, ashok.raj@intel.com, kvm@vger.kernel.org,
 ravi.v.shankar@intel.com, maz@kernel.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 jgg@mellanox.com, megha.dey@intel.com, linux-pci@vger.kernel.org,
 bhelgaas@google.com, dan.j.williams@intel.com, dwmw@amazon.co.uk
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

From: Thomas Gleixner <tglx@linutronix.de>

Add device specific MSI domain infrastructure for devices which have their
own resource management and interrupt chip. These devices are not related
to PCI and contrary to platform MSI they do not share a common resource and
interrupt chip. They provide their own domain specific resource management
and interrupt chip.

This utilizes the new alloc/free override in a non evil way which avoids
having yet another set of specialized alloc/free functions. Just using
msi_domain_alloc/free_irqs() is sufficient

While initially it was suggested and tried to piggyback device MSI on
platform MSI, the better variant is to reimplement platform MSI on top of
device MSI.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Megha Dey <megha.dey@intel.com>
---
 drivers/base/platform-msi.c | 131 ++++++++++++++++++++++++++++++++++++++++++++
 include/linux/irqdomain.h   |   1 +
 include/linux/msi.h         |  24 ++++++++
 kernel/irq/Kconfig          |   4 ++
 4 files changed, 160 insertions(+)

diff --git a/drivers/base/platform-msi.c b/drivers/base/platform-msi.c
index 9d9ccfc..6127b3b 100644
--- a/drivers/base/platform-msi.c
+++ b/drivers/base/platform-msi.c
@@ -419,3 +419,134 @@ int platform_msi_domain_alloc(struct irq_domain *domain, unsigned int virq,
 
 	return err;
 }
+
+#ifdef CONFIG_DEVICE_MSI
+/*
+ * Device specific MSI domain infrastructure for devices which have their
+ * own resource management and interrupt chip. These devices are not
+ * related to PCI and contrary to platform MSI they do not share a common
+ * resource and interrupt chip. They provide their own domain specific
+ * resource management and interrupt chip.
+ */
+
+static void device_msi_free_msi_entries(struct device *dev)
+{
+	struct list_head *msi_list = dev_to_msi_list(dev);
+	struct msi_desc *entry, *tmp;
+
+	list_for_each_entry_safe(entry, tmp, msi_list, list) {
+		list_del(&entry->list);
+		free_msi_entry(entry);
+	}
+}
+
+/**
+ * device_msi_free_irqs - Free MSI interrupts assigned to  a device
+ * @dev:	Pointer to the device
+ *
+ * Frees the interrupt and the MSI descriptors.
+ */
+static void device_msi_free_irqs(struct irq_domain *domain, struct device *dev)
+{
+	__msi_domain_free_irqs(domain, dev);
+	device_msi_free_msi_entries(dev);
+}
+
+/**
+ * device_msi_alloc_irqs - Allocate MSI interrupts for a device
+ * @dev:	Pointer to the device
+ * @nvec:	Number of vectors
+ *
+ * Allocates the required number of MSI descriptors and the corresponding
+ * interrupt descriptors.
+ */
+static int device_msi_alloc_irqs(struct irq_domain *domain, struct device *dev, int nvec)
+{
+	int i, ret = -ENOMEM;
+
+	for (i = 0; i < nvec; i++) {
+		struct msi_desc *entry = alloc_msi_entry(dev, 1, NULL);
+
+		if (!entry)
+			goto fail;
+		list_add_tail(&entry->list, dev_to_msi_list(dev));
+	}
+
+	ret = __msi_domain_alloc_irqs(domain, dev, nvec);
+	if (!ret)
+		return 0;
+fail:
+	device_msi_free_msi_entries(dev);
+	return ret;
+}
+
+static void device_msi_update_dom_ops(struct msi_domain_info *info)
+{
+	if (!info->ops->domain_alloc_irqs)
+		info->ops->domain_alloc_irqs = device_msi_alloc_irqs;
+	if (!info->ops->domain_free_irqs)
+		info->ops->domain_free_irqs = device_msi_free_irqs;
+	if (!info->ops->msi_prepare)
+		info->ops->msi_prepare = arch_msi_prepare;
+}
+
+/**
+ * device_msi_create_msi_irq_domain - Create an irq domain for devices
+ * @fwnode:	Firmware node of the interrupt controller
+ * @info:	MSI domain info to configure the new domain
+ * @parent:	Parent domain
+ */
+struct irq_domain *device_msi_create_irq_domain(struct fwnode_handle *fn,
+						struct msi_domain_info *info,
+						struct irq_domain *parent)
+{
+	struct irq_domain *domain;
+
+	if (info->flags & MSI_FLAG_USE_DEF_CHIP_OPS)
+		platform_msi_update_chip_ops(info);
+
+	if (info->flags & MSI_FLAG_USE_DEF_DOM_OPS)
+		device_msi_update_dom_ops(info);
+
+	msi_domain_set_default_info_flags(info);
+
+	domain = msi_create_irq_domain(fn, info, parent);
+	if (domain)
+		irq_domain_update_bus_token(domain, DOMAIN_BUS_DEVICE_MSI);
+	return domain;
+}
+
+#ifdef CONFIG_PCI
+#include <linux/pci.h>
+
+/**
+ * pci_subdevice_msi_create_irq_domain - Create an irq domain for subdevices
+ * @pdev:	Pointer to PCI device for which the subdevice domain is created
+ * @info:	MSI domain info to configure the new domain
+ */
+struct irq_domain *pci_subdevice_msi_create_irq_domain(struct pci_dev *pdev,
+						       struct msi_domain_info *info)
+{
+	struct irq_domain *domain, *pdev_msi;
+	struct fwnode_handle *fn;
+
+	/*
+	 * Retrieve the MSI domain of the underlying PCI device's MSI
+	 * domain. The PCI device domain's parent domain is also the parent
+	 * domain of the new subdevice domain.
+	 */
+	pdev_msi = dev_get_msi_domain(&pdev->dev);
+	if (!pdev_msi)
+		return NULL;
+
+	fn = irq_domain_alloc_named_fwnode(dev_name(&pdev->dev));
+	if (!fn)
+		return NULL;
+	domain = device_msi_create_irq_domain(fn, info, pdev_msi->parent);
+	if (!domain)
+		irq_domain_free_fwnode(fn);
+	return domain;
+}
+EXPORT_SYMBOL_GPL(pci_subdevice_msi_create_irq_domain);
+#endif /* CONFIG_PCI */
+#endif /* CONFIG_DEVICE_MSI */
diff --git a/include/linux/irqdomain.h b/include/linux/irqdomain.h
index 42d1968..06c88ba 100644
--- a/include/linux/irqdomain.h
+++ b/include/linux/irqdomain.h
@@ -85,6 +85,7 @@ enum irq_domain_bus_token {
 	DOMAIN_BUS_TI_SCI_INTA_MSI,
 	DOMAIN_BUS_WAKEUP,
 	DOMAIN_BUS_VMD_MSI,
+	DOMAIN_BUS_DEVICE_MSI,
 };
 
 /**
diff --git a/include/linux/msi.h b/include/linux/msi.h
index d7a7f7d..fbf2258 100644
--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -95,6 +95,18 @@ struct ti_sci_inta_msi_desc {
 };
 
 /**
+ * device_msi_desc - Device MSI specific MSI descriptor data
+ * @priv:		Pointer to device specific private data
+ * @priv_iomem:		Pointer to device specific private io memory
+ * @hwirq:		The hardware irq number in the device domain
+ */
+struct device_msi_desc {
+	void		*priv;
+	void __iomem	*priv_iomem;
+	u16		hwirq;
+};
+
+/**
  * struct msi_desc - Descriptor structure for MSI based interrupts
  * @list:	List head for management
  * @irq:	The base interrupt number
@@ -166,6 +178,7 @@ struct msi_desc {
 		struct platform_msi_desc platform;
 		struct fsl_mc_msi_desc fsl_mc;
 		struct ti_sci_inta_msi_desc inta;
+		struct device_msi_desc device_msi;
 	};
 };
 
@@ -451,6 +464,17 @@ void *platform_msi_get_host_data(struct irq_domain *domain);
 void msi_domain_set_default_info_flags(struct msi_domain_info *info);
 #endif /* CONFIG_GENERIC_MSI_IRQ_DOMAIN */
 
+#ifdef CONFIG_DEVICE_MSI
+struct irq_domain *device_msi_create_irq_domain(struct fwnode_handle *fn,
+						struct msi_domain_info *info,
+						struct irq_domain *parent);
+
+# ifdef CONFIG_PCI
+struct irq_domain *pci_subdevice_msi_create_irq_domain(struct pci_dev *pdev,
+						       struct msi_domain_info *info);
+# endif
+#endif /* CONFIG_DEVICE_MSI */
+
 #ifdef CONFIG_PCI_MSI_IRQ_DOMAIN
 void pci_msi_domain_write_msg(struct irq_data *irq_data, struct msi_msg *msg);
 struct irq_domain *pci_msi_create_irq_domain(struct fwnode_handle *fwnode,
diff --git a/kernel/irq/Kconfig b/kernel/irq/Kconfig
index d79ef24..7223327 100644
--- a/kernel/irq/Kconfig
+++ b/kernel/irq/Kconfig
@@ -89,6 +89,10 @@ config GENERIC_MSI_IRQ_DOMAIN
 	select IRQ_DOMAIN_HIERARCHY
 	select GENERIC_MSI_IRQ
 
+config DEVICE_MSI
+	bool
+	select GENERIC_MSI_IRQ_DOMAIN
+
 config IRQ_MSI_IOMMU
 	bool
 
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
