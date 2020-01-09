Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C191361DA
	for <lists.iommu@lfdr.de>; Thu,  9 Jan 2020 21:33:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 44B46204A0;
	Thu,  9 Jan 2020 20:33:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nr37Q4JUJ+PH; Thu,  9 Jan 2020 20:33:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id E13182156B;
	Thu,  9 Jan 2020 20:33:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CD1DBC18DC;
	Thu,  9 Jan 2020 20:33:45 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5416EC0881
 for <iommu@lists.linux-foundation.org>; Thu,  9 Jan 2020 20:33:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 3CC0A868D0
 for <iommu@lists.linux-foundation.org>; Thu,  9 Jan 2020 20:33:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YFtuG6f7DdKc for <iommu@lists.linux-foundation.org>;
 Thu,  9 Jan 2020 20:33:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 9AE07868A8
 for <iommu@lists.linux-foundation.org>; Thu,  9 Jan 2020 20:33:43 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Jan 2020 12:33:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,414,1571727600"; d="scan'208";a="396206715"
Received: from unknown (HELO nsgsw-rhel7p6.lm.intel.com) ([10.232.116.226])
 by orsmga005.jf.intel.com with ESMTP; 09 Jan 2020 12:33:42 -0800
From: Jon Derrick <jonathan.derrick@intel.com>
To: <iommu@lists.linux-foundation.org>,
	<linux-pci@vger.kernel.org>
Subject: [PATCH v2 3/5] PCI: Introduce direct dma alias
Date: Thu,  9 Jan 2020 07:30:54 -0700
Message-Id: <1578580256-3483-4-git-send-email-jonathan.derrick@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1578580256-3483-1-git-send-email-jonathan.derrick@intel.com>
References: <1578580256-3483-1-git-send-email-jonathan.derrick@intel.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Keith Busch <kbusch@kernel.org>,
 David Woodhouse <dwmw2@infradead.org>, Christoph Hellwig <hch@lst.de>,
 Jon Derrick <jonathan.derrick@intel.com>
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

The current dma alias implementation requires the aliased device be on
the same bus as the dma parent. This introduces an arch-specific
mechanism to point to an arbitrary struct device when doing mapping and
pci alias search.

Signed-off-by: Jon Derrick <jonathan.derrick@intel.com>
---
 arch/x86/pci/common.c |  7 +++++++
 drivers/pci/pci.c     | 17 ++++++++++++++++-
 drivers/pci/search.c  |  9 +++++++++
 include/linux/pci.h   |  1 +
 4 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/arch/x86/pci/common.c b/arch/x86/pci/common.c
index 1e59df0..565cc17 100644
--- a/arch/x86/pci/common.c
+++ b/arch/x86/pci/common.c
@@ -736,3 +736,10 @@ int pci_ext_cfg_avail(void)
 	else
 		return 0;
 }
+
+#if IS_ENABLED(CONFIG_VMD)
+struct device *pci_direct_dma_alias(struct pci_dev *dev)
+{
+	return to_pci_sysdata(dev->bus)->vmd_dev;
+}
+#endif
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index ad746d9..e4269e9 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -6034,7 +6034,9 @@ bool pci_devs_are_dma_aliases(struct pci_dev *dev1, struct pci_dev *dev2)
 	return (dev1->dma_alias_mask &&
 		test_bit(dev2->devfn, dev1->dma_alias_mask)) ||
 	       (dev2->dma_alias_mask &&
-		test_bit(dev1->devfn, dev2->dma_alias_mask));
+		test_bit(dev1->devfn, dev2->dma_alias_mask)) ||
+	       (pci_direct_dma_alias(dev1) == &dev2->dev) ||
+	       (pci_direct_dma_alias(dev2) == &dev1->dev);
 }
 
 bool pci_device_is_present(struct pci_dev *pdev)
@@ -6058,6 +6060,19 @@ void pci_ignore_hotplug(struct pci_dev *dev)
 }
 EXPORT_SYMBOL_GPL(pci_ignore_hotplug);
 
+/**
+ * pci_direct_dma_alias - Get dma alias for pci device
+ * @dev: the PCI device that may have a dma alias
+ *
+ * Permits the platform to provide architecture-specific functionality to
+ * devices needing to alias dma to another device. This is the default
+ * implementation. Architecture implementations can override this.
+ */
+struct device __weak *pci_direct_dma_alias(struct pci_dev *dev)
+{
+	return NULL;
+}
+
 resource_size_t __weak pcibios_default_alignment(void)
 {
 	return 0;
diff --git a/drivers/pci/search.c b/drivers/pci/search.c
index bade140..6d61209 100644
--- a/drivers/pci/search.c
+++ b/drivers/pci/search.c
@@ -32,6 +32,15 @@ int pci_for_each_dma_alias(struct pci_dev *pdev,
 	struct pci_bus *bus;
 	int ret;
 
+	if (unlikely(pci_direct_dma_alias(pdev))) {
+		struct device *dev = pci_direct_dma_alias(pdev);
+
+		if (dev_is_pci(dev))
+			pdev = to_pci_dev(dev);
+		return fn(pdev, PCI_DEVID(pdev->bus->number, pdev->devfn),
+			  data);
+	}
+
 	ret = fn(pdev, pci_dev_id(pdev), data);
 	if (ret)
 		return ret;
diff --git a/include/linux/pci.h b/include/linux/pci.h
index c393dff..82494d3 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1202,6 +1202,7 @@ u32 pcie_bandwidth_available(struct pci_dev *dev, struct pci_dev **limiting_dev,
 int pci_select_bars(struct pci_dev *dev, unsigned long flags);
 bool pci_device_is_present(struct pci_dev *pdev);
 void pci_ignore_hotplug(struct pci_dev *dev);
+struct device *pci_direct_dma_alias(struct pci_dev *dev);
 
 int __printf(6, 7) pci_request_irq(struct pci_dev *dev, unsigned int nr,
 		irq_handler_t handler, irq_handler_t thread_fn, void *dev_id,
-- 
1.8.3.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
