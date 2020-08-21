Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0CA24CA1A
	for <lists.iommu@lfdr.de>; Fri, 21 Aug 2020 04:17:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 85BA722EE6;
	Fri, 21 Aug 2020 02:17:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ScjK1HKRAMI2; Fri, 21 Aug 2020 02:17:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 3D2CE22F22;
	Fri, 21 Aug 2020 02:17:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 34F39C0051;
	Fri, 21 Aug 2020 02:17:16 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6C3C2C0051
 for <iommu@lists.linux-foundation.org>; Fri, 21 Aug 2020 02:17:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 55DD686CFD
 for <iommu@lists.linux-foundation.org>; Fri, 21 Aug 2020 02:17:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ny_uwFu6HO-C for <iommu@lists.linux-foundation.org>;
 Fri, 21 Aug 2020 02:17:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 654C786D1E
 for <iommu@lists.linux-foundation.org>; Fri, 21 Aug 2020 02:17:08 +0000 (UTC)
Message-Id: <20200821002947.575838946@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1597976226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=Y75c2FVJJci494EIeksaRxPMjifWJ0ThOK2FH5FONAw=;
 b=f6q/sjt6MV1HcPa9lRMLdZeYQ0hfb23mVpk9n87dFWml+X/u456TXEL3KVxnI9CFXQFhko
 NC8PKb93dixQU/GT2j9PYVBmX4QBP58PDRpMuFC4/CYbogcggvjiWLxJSOdErUDyBu/KPq
 mNF4sNUNyvJO4nw/UvQN5UMiO2CDzKoZFl5XW5x92NHzAR8nfOrH9jQX7BVfAUOdrEd6je
 dzqKVyw8XfqUj24SmoG/O7U8+lTc2fC6HzmTWwTlNkkZepcZTm8tcbB5apCi5otJaCfTng
 43bCT4U4I3QqaaRWvEgj9R2MFib3qx1qOlIu9cQkS6iydE7TxRfJUyVWK2DeNA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1597976226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=Y75c2FVJJci494EIeksaRxPMjifWJ0ThOK2FH5FONAw=;
 b=l1NNy7AGh3T+fCtBtGLpx6A7jIa/X2MlC/NaAaOl4Otuq4j1ahRTgdkoqBSQ0xIkVdF7yy
 MYAMivWyppl1DNBA==
Date: Fri, 21 Aug 2020 02:24:47 +0200
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch RFC 23/38] x86/xen: Rework MSI teardown
References: <20200821002424.119492231@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline; filename=x86-xen--Rework-XEN-MSI-management.patch
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

XENs MSI teardown relies on default_teardown_msi_irqs() which invokes
arch_teardown_msi_irq(). default_teardown_msi_irqs() is a trivial iterator
over the msi entries associated to a device.

Implement this loop in xen_teardown_msi_irqs() to prepare for removal of
the fallbacks for X86.

This is a preparatory step to wrap XEN MSI alloc/free into a irq domain
which in turn allows to store the irq domain pointer in struct device and
to use the irq domain functions directly.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 arch/x86/pci/xen.c |   23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

--- a/arch/x86/pci/xen.c
+++ b/arch/x86/pci/xen.c
@@ -376,20 +376,31 @@ static void xen_initdom_restore_msi_irqs
 static void xen_teardown_msi_irqs(struct pci_dev *dev)
 {
 	struct msi_desc *msidesc;
+	int i;
+
+	for_each_pci_msi_entry(msidesc, dev) {
+		if (msidesc->irq) {
+			for (i = 0; i < msidesc->nvec_used; i++)
+				xen_destroy_irq(msidesc->irq + i);
+		}
+	}
+}
+
+static void xen_pv_teardown_msi_irqs(struct pci_dev *dev)
+{
+	struct msi_desc *msidesc = first_pci_msi_entry(dev);
 
-	msidesc = first_pci_msi_entry(dev);
 	if (msidesc->msi_attrib.is_msix)
 		xen_pci_frontend_disable_msix(dev);
 	else
 		xen_pci_frontend_disable_msi(dev);
 
-	/* Free the IRQ's and the msidesc using the generic code. */
-	default_teardown_msi_irqs(dev);
+	xen_teardown_msi_irqs(dev);
 }
 
 static void xen_teardown_msi_irq(unsigned int irq)
 {
-	xen_destroy_irq(irq);
+	WARN_ON_ONCE(1);
 }
 
 #endif
@@ -412,7 +423,7 @@ int __init pci_xen_init(void)
 #ifdef CONFIG_PCI_MSI
 	x86_msi.setup_msi_irqs = xen_setup_msi_irqs;
 	x86_msi.teardown_msi_irq = xen_teardown_msi_irq;
-	x86_msi.teardown_msi_irqs = xen_teardown_msi_irqs;
+	x86_msi.teardown_msi_irqs = xen_pv_teardown_msi_irqs;
 	pci_msi_ignore_mask = 1;
 #endif
 	return 0;
@@ -436,6 +447,7 @@ static void __init xen_hvm_msi_init(void
 	}
 
 	x86_msi.setup_msi_irqs = xen_hvm_setup_msi_irqs;
+	x86_msi.teardown_msi_irqs = xen_teardown_msi_irqs;
 	x86_msi.teardown_msi_irq = xen_teardown_msi_irq;
 }
 #endif
@@ -472,6 +484,7 @@ int __init pci_xen_initial_domain(void)
 #ifdef CONFIG_PCI_MSI
 	x86_msi.setup_msi_irqs = xen_initdom_setup_msi_irqs;
 	x86_msi.teardown_msi_irq = xen_teardown_msi_irq;
+	x86_msi.teardown_msi_irqs = xen_teardown_msi_irqs;
 	x86_msi.restore_msi_irqs = xen_initdom_restore_msi_irqs;
 	pci_msi_ignore_mask = 1;
 #endif

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
