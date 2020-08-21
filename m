Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 858BB24CA17
	for <lists.iommu@lfdr.de>; Fri, 21 Aug 2020 04:17:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 408F2886CC;
	Fri, 21 Aug 2020 02:17:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s0FZpqVggRLi; Fri, 21 Aug 2020 02:17:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1BBEC8869F;
	Fri, 21 Aug 2020 02:17:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F18D6C0051;
	Fri, 21 Aug 2020 02:17:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B671AC0895
 for <iommu@lists.linux-foundation.org>; Fri, 21 Aug 2020 02:17:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id AE3818869F
 for <iommu@lists.linux-foundation.org>; Fri, 21 Aug 2020 02:17:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YKbXX+lTW3du for <iommu@lists.linux-foundation.org>;
 Fri, 21 Aug 2020 02:17:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by whitealder.osuosl.org (Postfix) with ESMTPS id BC8F888693
 for <iommu@lists.linux-foundation.org>; Fri, 21 Aug 2020 02:17:09 +0000 (UTC)
Message-Id: <20200821002947.667887608@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1597976228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=1YWqXAQnhLaq8z2CTV2oQb1to3QrIXhgk3UQ/jt5/4s=;
 b=T+XyenMQhcXwPIrAu6+LQdPHrNvuw6KfRX7AbWzfUKPX+hEn+5sG8IsIQ4sPd1gIZp9rS2
 1z0os/DOeDTB8EgUHw/ZlCKmz3rqSSPuz0Yxd/0oKGizSrWuR1tfOM85EMjS2LH6svSPnK
 9dz26OnNJBmrC4FmWysE0OFjxccQiPYTOOVA9m98VOm0dZ6zq1b2K6+vvzGBMtom5Qi3/o
 Kauv/W6SUDvroSg/SDb5zRjrZuG6DSllS1aAK31+DAI0vJaWLzAbkr96jlVOMISyHyz9eL
 wxGXFOb+ZUMpUpCqyqDxA1/t6dYRwnf9+ZGmSW5cBfyrdhZpWf/TFxH6TVKnfg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1597976228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=1YWqXAQnhLaq8z2CTV2oQb1to3QrIXhgk3UQ/jt5/4s=;
 b=4zx9C0E2ONuN3fSkvo8o1EUOUY+K6g22buI8VrqG0z3/BsjfzJ4sqkv9pFO3QOZ/xtSAQU
 Vnk/lWNXZvciVGAw==
Date: Fri, 21 Aug 2020 02:24:48 +0200
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch RFC 24/38] x86/xen: Consolidate XEN-MSI init
References: <20200821002424.119492231@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline; filename=x86-xen--Consolidate-XEN-MSI-init.patch
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

X86 cannot store the irq domain pointer in struct device without breaking
XEN because the irq domain pointer takes precedence over arch_*_msi_irqs()
fallbacks.

To achieve this XEN MSI interrupt management needs to be wrapped into an
irq domain.

Move the x86_msi ops setup into a single function to prepare for this.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 arch/x86/pci/xen.c |   51 ++++++++++++++++++++++++++++++++-------------------
 1 file changed, 32 insertions(+), 19 deletions(-)

--- a/arch/x86/pci/xen.c
+++ b/arch/x86/pci/xen.c
@@ -371,7 +371,10 @@ static void xen_initdom_restore_msi_irqs
 		WARN(ret && ret != -ENOSYS, "restore_msi -> %d\n", ret);
 	}
 }
-#endif
+#else /* CONFIG_XEN_DOM0 */
+#define xen_initdom_setup_msi_irqs	NULL
+#define xen_initdom_restore_msi_irqs	NULL
+#endif /* !CONFIG_XEN_DOM0 */
 
 static void xen_teardown_msi_irqs(struct pci_dev *dev)
 {
@@ -403,7 +406,31 @@ static void xen_teardown_msi_irq(unsigne
 	WARN_ON_ONCE(1);
 }
 
-#endif
+static __init void xen_setup_pci_msi(void)
+{
+	if (xen_initial_domain()) {
+		x86_msi.setup_msi_irqs = xen_initdom_setup_msi_irqs;
+		x86_msi.teardown_msi_irqs = xen_teardown_msi_irqs;
+		x86_msi.restore_msi_irqs = xen_initdom_restore_msi_irqs;
+		pci_msi_ignore_mask = 1;
+	} else if (xen_pv_domain()) {
+		x86_msi.setup_msi_irqs = xen_setup_msi_irqs;
+		x86_msi.teardown_msi_irqs = xen_pv_teardown_msi_irqs;
+		pci_msi_ignore_mask = 1;
+	} else if (xen_hvm_domain()) {
+		x86_msi.setup_msi_irqs = xen_hvm_setup_msi_irqs;
+		x86_msi.teardown_msi_irqs = xen_teardown_msi_irqs;
+	} else {
+		WARN_ON_ONCE(1);
+		return;
+	}
+
+	x86_msi.teardown_msi_irq = xen_teardown_msi_irq;
+}
+
+#else /* CONFIG_PCI_MSI */
+static inline void xen_setup_pci_msi(void) { }
+#endif /* CONFIG_PCI_MSI */
 
 int __init pci_xen_init(void)
 {
@@ -420,12 +447,7 @@ int __init pci_xen_init(void)
 	/* Keep ACPI out of the picture */
 	acpi_noirq_set();
 
-#ifdef CONFIG_PCI_MSI
-	x86_msi.setup_msi_irqs = xen_setup_msi_irqs;
-	x86_msi.teardown_msi_irq = xen_teardown_msi_irq;
-	x86_msi.teardown_msi_irqs = xen_pv_teardown_msi_irqs;
-	pci_msi_ignore_mask = 1;
-#endif
+	xen_setup_pci_msi();
 	return 0;
 }
 
@@ -445,10 +467,7 @@ static void __init xen_hvm_msi_init(void
 		    ((eax & XEN_HVM_CPUID_APIC_ACCESS_VIRT) && boot_cpu_has(X86_FEATURE_APIC)))
 			return;
 	}
-
-	x86_msi.setup_msi_irqs = xen_hvm_setup_msi_irqs;
-	x86_msi.teardown_msi_irqs = xen_teardown_msi_irqs;
-	x86_msi.teardown_msi_irq = xen_teardown_msi_irq;
+	xen_setup_pci_msi();
 }
 #endif
 
@@ -481,13 +500,7 @@ int __init pci_xen_initial_domain(void)
 {
 	int irq;
 
-#ifdef CONFIG_PCI_MSI
-	x86_msi.setup_msi_irqs = xen_initdom_setup_msi_irqs;
-	x86_msi.teardown_msi_irq = xen_teardown_msi_irq;
-	x86_msi.teardown_msi_irqs = xen_teardown_msi_irqs;
-	x86_msi.restore_msi_irqs = xen_initdom_restore_msi_irqs;
-	pci_msi_ignore_mask = 1;
-#endif
+	xen_setup_pci_msi();
 	__acpi_register_gsi = acpi_register_gsi_xen;
 	__acpi_unregister_gsi = NULL;
 	/*

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
