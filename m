Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF2B3267EE
	for <lists.iommu@lfdr.de>; Fri, 26 Feb 2021 21:11:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EB364F0A2;
	Fri, 26 Feb 2021 20:11:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QpVXSA1xt_mI; Fri, 26 Feb 2021 20:11:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B2B94F0AC;
	Fri, 26 Feb 2021 20:11:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 80AD1C0001;
	Fri, 26 Feb 2021 20:11:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 96895C000A
 for <iommu@lists.linux-foundation.org>; Fri, 26 Feb 2021 20:11:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 235A24F08E
 for <iommu@lists.linux-foundation.org>; Fri, 26 Feb 2021 20:11:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pjz37UR7SMB5 for <iommu@lists.linux-foundation.org>;
 Fri, 26 Feb 2021 20:11:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A054F4B799
 for <iommu@lists.linux-foundation.org>; Fri, 26 Feb 2021 20:11:15 +0000 (UTC)
IronPort-SDR: iI0rj0xfqLQEW4Y/jKxpFEcdm65wJ20KuHm7/TW7uJeoe7VpHVHyYNCKXaXs4siG9K5DEbyw/a
 HiZ9KsFcU7lw==
X-IronPort-AV: E=McAfee;i="6000,8403,9907"; a="186039457"
X-IronPort-AV: E=Sophos;i="5.81,209,1610438400"; d="scan'208";a="186039457"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2021 12:11:15 -0800
IronPort-SDR: d0LLJg1ArWXOKwUxAiPZ8RCNzTf7Ec5+LCtjEmO6U747TtgfiW/vVzXIWGwZRI01sN168zI4KC
 S8Tlwk/AG/4g==
X-IronPort-AV: E=Sophos;i="5.81,209,1610438400"; d="scan'208";a="405109456"
Received: from megha-z97x-ud7-th.sc.intel.com ([143.183.85.154])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 26 Feb 2021 12:11:14 -0800
From: Megha Dey <megha.dey@intel.com>
To: tglx@linutronix.de
Subject: [Patch V2 11/13] platform-msi: Add platform check for subdevice irq
 domain
Date: Fri, 26 Feb 2021 12:11:15 -0800
Message-Id: <1614370277-23235-12-git-send-email-megha.dey@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614370277-23235-1-git-send-email-megha.dey@intel.com>
References: <1614370277-23235-1-git-send-email-megha.dey@intel.com>
Cc: alex.williamson@redhat.com, kevin.tian@intel.com, tony.luck@intel.com,
 dave.jiang@intel.com, ashok.raj@intel.com, kvm@vger.kernel.org,
 ravi.v.shankar@intel.com, maz@kernel.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 jgg@mellanox.com, megha.dey@intel.com, linux-pci@vger.kernel.org,
 bhelgaas@google.com, dan.j.williams@intel.com,
 Leon Romanovsky <leon@kernel.org>, dwmw@amazon.co.uk
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

From: Lu Baolu <baolu.lu@linux.intel.com>

The pci_subdevice_msi_create_irq_domain() should fail if the underlying
platform is not able to support IMS (Interrupt Message Storage). Otherwise,
the isolation of interrupt is not guaranteed.

For x86, IMS is only supported on bare metal for now. We could enable it
in the virtualization environments in the future if interrupt HYPERCALL
domain is supported or the hardware has the capability of interrupt
isolation for subdevices.

Cc: David Woodhouse <dwmw@amazon.co.uk>
Cc: Leon Romanovsky <leon@kernel.org>
Cc: Kevin Tian <kevin.tian@intel.com>
Suggested-by: Thomas Gleixner <tglx@linutronix.de>
Link: https://lore.kernel.org/linux-pci/87pn4nk7nn.fsf@nanos.tec.linutronix.de/
Link: https://lore.kernel.org/linux-pci/877dqrnzr3.fsf@nanos.tec.linutronix.de/
Link: https://lore.kernel.org/linux-pci/877dqqmc2h.fsf@nanos.tec.linutronix.de/
Reviewed-by: Tony Luck <tony.luck@intel.com>
Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
Signed-off-by: Megha Dey <megha.dey@intel.com>
---
 arch/x86/pci/common.c       | 72 +++++++++++++++++++++++++++++++++++++++++++++
 drivers/base/platform-msi.c |  8 +++++
 include/linux/msi.h         |  2 ++
 3 files changed, 82 insertions(+)

diff --git a/arch/x86/pci/common.c b/arch/x86/pci/common.c
index 3507f45..64daa6a 100644
--- a/arch/x86/pci/common.c
+++ b/arch/x86/pci/common.c
@@ -12,6 +12,8 @@
 #include <linux/init.h>
 #include <linux/dmi.h>
 #include <linux/slab.h>
+#include <linux/iommu.h>
+#include <linux/msi.h>
 
 #include <asm/acpi.h>
 #include <asm/segment.h>
@@ -724,3 +726,73 @@ struct pci_dev *pci_real_dma_dev(struct pci_dev *dev)
 	return dev;
 }
 #endif
+
+/*
+ * We want to figure out which context we are running in. But the hardware
+ * does not introduce a reliable way (instruction, CPUID leaf, MSR, whatever)
+ * which can be manipulated by the VMM to let the OS figure out where it runs.
+ * So we go with the below probably on_bare_metal() function as a replacement
+ * for definitely on_bare_metal() to go forward only for the very simple reason
+ * that this is the only option we have.
+ */
+static const char * const vmm_vendor_name[] = {
+	"QEMU", "Bochs", "KVM", "Xen", "VMware", "VMW", "VMware Inc.",
+	"innotek GmbH", "Oracle Corporation", "Parallels", "BHYVE"
+};
+
+static void read_type0_virtual_machine(const struct dmi_header *dm, void *p)
+{
+	u8 *data = (u8 *)dm + 0x13;
+
+	/* BIOS Information (Type 0) */
+	if (dm->type != 0 || dm->length < 0x14)
+		return;
+
+	/* Bit 4 of BIOS Characteristics Extension Byte 2*/
+	if (*data & BIT(4))
+		*((bool *)p) = true;
+}
+
+static bool smbios_virtual_machine(void)
+{
+	bool bit_present = false;
+
+	dmi_walk(read_type0_virtual_machine, &bit_present);
+
+	return bit_present;
+}
+
+static bool on_bare_metal(struct device *dev)
+{
+	int i;
+
+	if (boot_cpu_has(X86_FEATURE_HYPERVISOR))
+		return false;
+
+	if (smbios_virtual_machine())
+		return false;
+
+	if (iommu_capable(dev->bus, IOMMU_CAP_VIOMMU_HINT))
+		return false;
+
+	for (i = 0; i < ARRAY_SIZE(vmm_vendor_name); i++)
+		if (dmi_match(DMI_SYS_VENDOR, vmm_vendor_name[i]))
+			return false;
+
+	pr_info("System running on bare metal, report to bugzilla.kernel.org if not the case.");
+
+	return true;
+}
+
+bool arch_support_pci_device_msi(struct pci_dev *pdev)
+{
+	/*
+	 * When we are running in a VMM context, the device IMS could only be
+	 * enabled when the underlying hardware supports interrupt isolation
+	 * of the subdevice, or any mechanism (trap, hypercall) is added so
+	 * that changes in the interrupt message store could be managed by the
+	 * VMM. For now, we only support the device IMS when we are running on
+	 * the bare metal.
+	 */
+	return on_bare_metal(&pdev->dev);
+}
diff --git a/drivers/base/platform-msi.c b/drivers/base/platform-msi.c
index 6127b3b..c4a0d9c 100644
--- a/drivers/base/platform-msi.c
+++ b/drivers/base/platform-msi.c
@@ -519,6 +519,11 @@ struct irq_domain *device_msi_create_irq_domain(struct fwnode_handle *fn,
 #ifdef CONFIG_PCI
 #include <linux/pci.h>
 
+bool __weak arch_support_pci_device_msi(struct pci_dev *pdev)
+{
+	return false;
+}
+
 /**
  * pci_subdevice_msi_create_irq_domain - Create an irq domain for subdevices
  * @pdev:	Pointer to PCI device for which the subdevice domain is created
@@ -530,6 +535,9 @@ struct irq_domain *pci_subdevice_msi_create_irq_domain(struct pci_dev *pdev,
 	struct irq_domain *domain, *pdev_msi;
 	struct fwnode_handle *fn;
 
+	if (!arch_support_pci_device_msi(pdev))
+		return NULL;
+
 	/*
 	 * Retrieve the MSI domain of the underlying PCI device's MSI
 	 * domain. The PCI device domain's parent domain is also the parent
diff --git a/include/linux/msi.h b/include/linux/msi.h
index e915932..24abec0 100644
--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -489,6 +489,8 @@ struct irq_domain *pci_subdevice_msi_create_irq_domain(struct pci_dev *pdev,
 # endif
 #endif /* CONFIG_DEVICE_MSI */
 
+bool arch_support_pci_device_msi(struct pci_dev *pdev);
+
 #ifdef CONFIG_PCI_MSI_IRQ_DOMAIN
 void pci_msi_domain_write_msg(struct irq_data *irq_data, struct msi_msg *msg);
 struct irq_domain *pci_msi_create_irq_domain(struct fwnode_handle *fwnode,
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
