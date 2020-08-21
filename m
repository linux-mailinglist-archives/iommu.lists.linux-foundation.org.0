Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCEA24CA31
	for <lists.iommu@lfdr.de>; Fri, 21 Aug 2020 04:17:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 72A13886B2;
	Fri, 21 Aug 2020 02:17:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2jbqxiTptMyL; Fri, 21 Aug 2020 02:17:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B8698886AA;
	Fri, 21 Aug 2020 02:17:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A025AC0051;
	Fri, 21 Aug 2020 02:17:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2FE7CC0051
 for <iommu@lists.linux-foundation.org>; Fri, 21 Aug 2020 02:17:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 14D3422F05
 for <iommu@lists.linux-foundation.org>; Fri, 21 Aug 2020 02:17:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zt-1QM3BQo0W for <iommu@lists.linux-foundation.org>;
 Fri, 21 Aug 2020 02:17:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by silver.osuosl.org (Postfix) with ESMTPS id 12CE322E94
 for <iommu@lists.linux-foundation.org>; Fri, 21 Aug 2020 02:17:17 +0000 (UTC)
Message-Id: <20200821002948.285988229@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1597976235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=d5usA7gDCS+QKjQgidurX7gwz02tPHrPNFlTsx8P5CI=;
 b=RVJ7jdg6yqLy3EH2woulQ/AnGnunH5RkP7bQGtS5XdVI4K+27I8sW5KQ4bwKh7oxBPDPSq
 PUAD2IdzXQ1/gMpjYAGgnWRBlD1ug/Nr7V4kDQsNmxx72PzHQqt0VRrzXGsgMHEHo/aEqw
 +5fPifkdsVz8w6lRpGdG5PB9Fql0LO1o1vs8GcIV1+SDwG+UmYqCCRUcsk40XG7tyVb416
 TjQv0KlmwkyZO0egvzwn9A695hiD80Gh8xwRU56V/Fv+L0ugIMvBKuG/bfvsYr6kKvaGy0
 XSylhJX9fuJ9fV7CIc03ykAgm+YWeklO8G4yCLGBhLNRjd5a6/SJVV5GeynM3w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1597976235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=d5usA7gDCS+QKjQgidurX7gwz02tPHrPNFlTsx8P5CI=;
 b=N5lZvRWFmQopSinQmJpoCZ2W17bx8ilN26GTqyVqlLtYE8S2UtjUuGKTBPXITNNvSpH5Qz
 0bEjgomf8T1Os3BA==
Date: Fri, 21 Aug 2020 02:24:54 +0200
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch RFC 30/38] PCI/MSI: Allow to disable arch fallbacks
References: <20200821002424.119492231@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline;
 filename="PCI-MSI--Allow-to-disable-arch-fallbacks.patch"
Cc: Dimitri Sivanich <sivanich@hpe.com>, linux-hyperv@vger.kernel.org,
 Steve Wahl <steve.wahl@hpe.com>, linux-pci@vger.kernel.org,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Dan Williams <dan.j.williams@intel.com>, Wei Liu <wei.liu@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, Baolu Lu <baolu.lu@intel.com>,
 Marc Zyngier <maz@kernel.org>, x86@kernel.org,
 Jason Gunthorpe <jgg@mellanox.com>, Megha Dey <megha.dey@intel.com>,
 xen-devel@lists.xenproject.org, Kevin Tian <kevin.tian@intel.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Dave Jiang <dave.jiang@intel.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
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

If an architecture does not require the MSI setup/teardown fallback
functions, then allow them to be replaced by stub functions which emit a
warning.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org
---
 drivers/pci/Kconfig |    3 +++
 drivers/pci/msi.c   |    3 ++-
 include/linux/msi.h |   31 ++++++++++++++++++++++++++-----
 3 files changed, 31 insertions(+), 6 deletions(-)

--- a/drivers/pci/Kconfig
+++ b/drivers/pci/Kconfig
@@ -56,6 +56,9 @@ config PCI_MSI_IRQ_DOMAIN
 	depends on PCI_MSI
 	select GENERIC_MSI_IRQ_DOMAIN
 
+config PCI_MSI_DISABLE_ARCH_FALLBACKS
+	bool
+
 config PCI_QUIRKS
 	default y
 	bool "Enable PCI quirk workarounds" if EXPERT
--- a/drivers/pci/msi.c
+++ b/drivers/pci/msi.c
@@ -58,8 +58,8 @@ static void pci_msi_teardown_msi_irqs(st
 #define pci_msi_teardown_msi_irqs	arch_teardown_msi_irqs
 #endif
 
+#ifndef CONFIG_PCI_MSI_DISABLE_ARCH_FALLBACKS
 /* Arch hooks */
-
 int __weak arch_setup_msi_irq(struct pci_dev *dev, struct msi_desc *desc)
 {
 	struct msi_controller *chip = dev->bus->msi;
@@ -132,6 +132,7 @@ void __weak arch_teardown_msi_irqs(struc
 {
 	return default_teardown_msi_irqs(dev);
 }
+#endif /* !CONFIG_PCI_MSI_DISABLE_ARCH_FALLBACKS */
 
 static void default_restore_msi_irq(struct pci_dev *dev, int irq)
 {
--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -193,17 +193,38 @@ void pci_msi_mask_irq(struct irq_data *d
 void pci_msi_unmask_irq(struct irq_data *data);
 
 /*
- * The arch hooks to setup up msi irqs. Those functions are
- * implemented as weak symbols so that they /can/ be overriden by
- * architecture specific code if needed.
+ * The arch hooks to setup up msi irqs. Default functions are implemented
+ * as weak symbols so that they /can/ be overriden by architecture specific
+ * code if needed.
+ *
+ * They can be replaced by stubs with warnings via
+ * CONFIG_PCI_MSI_DISABLE_ARCH_FALLBACKS when the architecture fully
+ * utilizes direct irqdomain based setup.
  */
+#ifndef CONFIG_PCI_MSI_DISABLE_ARCH_FALLBACKS
 int arch_setup_msi_irq(struct pci_dev *dev, struct msi_desc *desc);
 void arch_teardown_msi_irq(unsigned int irq);
 int arch_setup_msi_irqs(struct pci_dev *dev, int nvec, int type);
 void arch_teardown_msi_irqs(struct pci_dev *dev);
-void arch_restore_msi_irqs(struct pci_dev *dev);
-
 void default_teardown_msi_irqs(struct pci_dev *dev);
+#else
+static inline int arch_setup_msi_irqs(struct pci_dev *dev, int nvec, int type)
+{
+	WARN_ON_ONCE(1);
+	return -ENODEV;
+}
+
+static inline void arch_teardown_msi_irqs(struct pci_dev *dev)
+{
+	WARN_ON_ONCE(1);
+}
+#endif
+
+/*
+ * The restore hooks are still available as they are useful even
+ * for fully irq domain based setups. Courtesy to XEN/X86.
+ */
+void arch_restore_msi_irqs(struct pci_dev *dev);
 void default_restore_msi_irqs(struct pci_dev *dev);
 
 struct msi_controller {

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
