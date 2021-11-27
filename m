Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 71AB645F89A
	for <lists.iommu@lfdr.de>; Sat, 27 Nov 2021 02:21:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24C5582CA5;
	Sat, 27 Nov 2021 01:21:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kb9IDYHGTS2N; Sat, 27 Nov 2021 01:21:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 2A54E82D04;
	Sat, 27 Nov 2021 01:21:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 055BAC003E;
	Sat, 27 Nov 2021 01:21:51 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A0758C000A
 for <iommu@lists.linux-foundation.org>; Sat, 27 Nov 2021 01:21:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9022682D04
 for <iommu@lists.linux-foundation.org>; Sat, 27 Nov 2021 01:21:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yR29r2_n_8SV for <iommu@lists.linux-foundation.org>;
 Sat, 27 Nov 2021 01:21:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 94D9182CFA
 for <iommu@lists.linux-foundation.org>; Sat, 27 Nov 2021 01:21:48 +0000 (UTC)
Message-ID: <20211126230525.016223236@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1637976106;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=fkSRZAFKOg49WRvcaWCK3eXzS4tUTHUaar/EP1a26n8=;
 b=DoOKl/TsnNlvvjn/xJfebNuCXzkuoUNBf7Y5MKkmZRV/XqHqQiDGgeTeUEw8hWP8lIYf6A
 DTndX4xDMHlR/CCZ5QD3JY2beloRroRkA6rfwDYTYfi311OopnZhQhVUJY90EIpVStmxP/
 eFW8Se8XVj9E8SflKMRWgvSnVkHeIjiLc5gopKN+cfrWz3ZTC5BZV7n2+eEmvleMaAX5pB
 FKwhT2uoN8+nhpITISgUxRtKfeLXn7/rnz7lbLkDEKtFj2X3tU5uC+qLFSGd+JolNkv2xP
 Cwa7VLgvRi/jcxY6UgQUaAYn4cw8dlqCQlcW0v0twvOV7My2nzxEwCsjkxRWBA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1637976106;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=fkSRZAFKOg49WRvcaWCK3eXzS4tUTHUaar/EP1a26n8=;
 b=j5KC/iwbsnlunBQ1GyTSP1bWKYa97v4VL9Ct+ceZqtmnRmJDt+RJ11gEin/8XS1KNq7CXz
 szJwxmDjdhZhMIBw==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch 18/37] PCI/MSI: Use msi_desc::msi_index
References: <20211126224100.303046749@linutronix.de>
MIME-Version: 1.0
Date: Sat, 27 Nov 2021 02:21:46 +0100 (CET)
Cc: Nishanth Menon <nm@ti.com>, Mark Rutland <mark.rutland@arm.com>,
 Stuart Yoder <stuyoder@gmail.com>, linux-pci@vger.kernel.org,
 Will Deacon <will@kernel.org>, Ashok Raj <ashok.raj@intel.com>,
 Marc Zygnier <maz@kernel.org>, x86@kernel.org, Sinan Kaya <okaya@kernel.org>,
 iommu@lists.linux-foundation.org, Bjorn Helgaas <helgaas@kernel.org>,
 Megha Dey <megha.dey@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Kevin Tian <kevin.tian@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Santosh Shilimkar <ssantosh@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Tero Kristo <kristo@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Vinod Koul <vkoul@kernel.org>,
 dmaengine@vger.kernel.org
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

The usage of msi_desc::pci::entry_nr is confusing at best. It's the index
into the MSI[X] descriptor table.

Use msi_desc::msi_index which is shared between all MSI incarnations
instead of having a PCI specific storage for no value.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 arch/powerpc/platforms/pseries/msi.c |    4 ++--
 arch/x86/pci/xen.c                   |    2 +-
 drivers/pci/msi/irqdomain.c          |    2 +-
 drivers/pci/msi/msi.c                |   20 ++++++++------------
 drivers/pci/xen-pcifront.c           |    2 +-
 include/linux/msi.h                  |    2 --
 6 files changed, 13 insertions(+), 19 deletions(-)

--- a/arch/powerpc/platforms/pseries/msi.c
+++ b/arch/powerpc/platforms/pseries/msi.c
@@ -332,7 +332,7 @@ static int check_msix_entries(struct pci
 
 	expected = 0;
 	for_each_pci_msi_entry(entry, pdev) {
-		if (entry->pci.msi_attrib.entry_nr != expected) {
+		if (entry->msi_index != expected) {
 			pr_debug("rtas_msi: bad MSI-X entries.\n");
 			return -EINVAL;
 		}
@@ -580,7 +580,7 @@ static int pseries_irq_domain_alloc(stru
 	int hwirq;
 	int i, ret;
 
-	hwirq = rtas_query_irq_number(pci_get_pdn(pdev), desc->pci.msi_attrib.entry_nr);
+	hwirq = rtas_query_irq_number(pci_get_pdn(pdev), desc->msi_index);
 	if (hwirq < 0) {
 		dev_err(&pdev->dev, "Failed to query HW IRQ: %d\n", hwirq);
 		return hwirq;
--- a/arch/x86/pci/xen.c
+++ b/arch/x86/pci/xen.c
@@ -306,7 +306,7 @@ static int xen_initdom_setup_msi_irqs(st
 				return -EINVAL;
 
 			map_irq.table_base = pci_resource_start(dev, bir);
-			map_irq.entry_nr = msidesc->pci.msi_attrib.entry_nr;
+			map_irq.entry_nr = msidesc->msi_index;
 		}
 
 		ret = -EINVAL;
--- a/drivers/pci/msi/irqdomain.c
+++ b/drivers/pci/msi/irqdomain.c
@@ -57,7 +57,7 @@ static irq_hw_number_t pci_msi_domain_ca
 {
 	struct pci_dev *dev = msi_desc_to_pci_dev(desc);
 
-	return (irq_hw_number_t)desc->pci.msi_attrib.entry_nr |
+	return (irq_hw_number_t)desc->msi_index |
 		pci_dev_id(dev) << 11 |
 		(pci_domain_nr(dev->bus) & 0xFFFFFFFF) << 27;
 }
--- a/drivers/pci/msi/msi.c
+++ b/drivers/pci/msi/msi.c
@@ -44,7 +44,7 @@ static inline void pci_msi_unmask(struct
 
 static inline void __iomem *pci_msix_desc_addr(struct msi_desc *desc)
 {
-	return desc->pci.mask_base + desc->pci.msi_attrib.entry_nr * PCI_MSIX_ENTRY_SIZE;
+	return desc->pci.mask_base + desc->msi_index * PCI_MSIX_ENTRY_SIZE;
 }
 
 /*
@@ -354,13 +354,10 @@ msi_setup_entry(struct pci_dev *dev, int
 	if (dev->dev_flags & PCI_DEV_FLAGS_HAS_MSI_MASKING)
 		control |= PCI_MSI_FLAGS_MASKBIT;
 
-	entry->pci.msi_attrib.is_msix	= 0;
-	entry->pci.msi_attrib.is_64		= !!(control & PCI_MSI_FLAGS_64BIT);
-	entry->pci.msi_attrib.is_virtual    = 0;
-	entry->pci.msi_attrib.entry_nr	= 0;
+	entry->pci.msi_attrib.is_64	= !!(control & PCI_MSI_FLAGS_64BIT);
 	entry->pci.msi_attrib.can_mask	= !pci_msi_ignore_mask &&
 					  !!(control & PCI_MSI_FLAGS_MASKBIT);
-	entry->pci.msi_attrib.default_irq	= dev->irq;	/* Save IOAPIC IRQ */
+	entry->pci.msi_attrib.default_irq = dev->irq;
 	entry->pci.msi_attrib.multi_cap	= (control & PCI_MSI_FLAGS_QMASK) >> 1;
 	entry->pci.msi_attrib.multiple	= ilog2(__roundup_pow_of_two(nvec));
 
@@ -494,12 +491,11 @@ static int msix_setup_entries(struct pci
 		entry->pci.msi_attrib.is_64	= 1;
 
 		if (entries)
-			entry->pci.msi_attrib.entry_nr = entries[i].entry;
+			entry->msi_index = entries[i].entry;
 		else
-			entry->pci.msi_attrib.entry_nr = i;
+			entry->msi_index = i;
 
-		entry->pci.msi_attrib.is_virtual =
-			entry->pci.msi_attrib.entry_nr >= vec_count;
+		entry->pci.msi_attrib.is_virtual = entry->msi_index >= vec_count;
 
 		entry->pci.msi_attrib.can_mask	= !pci_msi_ignore_mask &&
 						  !entry->pci.msi_attrib.is_virtual;
@@ -1025,7 +1021,7 @@ int pci_irq_vector(struct pci_dev *dev,
 		struct msi_desc *entry;
 
 		for_each_pci_msi_entry(entry, dev) {
-			if (entry->pci.msi_attrib.entry_nr == nr)
+			if (entry->msi_index == nr)
 				return entry->irq;
 		}
 		WARN_ON_ONCE(1);
@@ -1057,7 +1053,7 @@ const struct cpumask *pci_irq_get_affini
 		struct msi_desc *entry;
 
 		for_each_pci_msi_entry(entry, dev) {
-			if (entry->pci.msi_attrib.entry_nr == nr)
+			if (entry->msi_index == nr)
 				return &entry->affinity->mask;
 		}
 		WARN_ON_ONCE(1);
--- a/drivers/pci/xen-pcifront.c
+++ b/drivers/pci/xen-pcifront.c
@@ -263,7 +263,7 @@ static int pci_frontend_enable_msix(stru
 
 	i = 0;
 	for_each_pci_msi_entry(entry, dev) {
-		op.msix_entries[i].entry = entry->pci.msi_attrib.entry_nr;
+		op.msix_entries[i].entry = entry->msi_index;
 		/* Vector is useless at this point. */
 		op.msix_entries[i].vector = -1;
 		i++;
--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -79,7 +79,6 @@ typedef void (*irq_write_msi_msg_t)(stru
  * @multi_cap:	[PCI MSI/X] log2 num of messages supported
  * @can_mask:	[PCI MSI/X] Masking supported?
  * @is_64:	[PCI MSI/X] Address size: 0=32bit 1=64bit
- * @entry_nr:	[PCI MSI/X] Entry which is described by this descriptor
  * @default_irq:[PCI MSI/X] The default pre-assigned non-MSI irq
  * @mask_pos:	[PCI MSI]   Mask register position
  * @mask_base:	[PCI MSI-X] Mask register base address
@@ -96,7 +95,6 @@ struct pci_msi_desc {
 		u8	can_mask	: 1;
 		u8	is_64		: 1;
 		u8	is_virtual	: 1;
-		u16	entry_nr;
 		unsigned default_irq;
 	} msi_attrib;
 	union {

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
