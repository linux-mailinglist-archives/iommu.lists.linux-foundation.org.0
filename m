Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id C1680252D58
	for <lists.iommu@lfdr.de>; Wed, 26 Aug 2020 14:01:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6358886FE7;
	Wed, 26 Aug 2020 12:01:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G6cl7U6BZi3O; Wed, 26 Aug 2020 12:01:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D854781DBB;
	Wed, 26 Aug 2020 12:01:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A26BEC07FF;
	Wed, 26 Aug 2020 12:01:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3EE42C07FF
 for <iommu@lists.linux-foundation.org>; Wed, 26 Aug 2020 12:01:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 05C46228E2
 for <iommu@lists.linux-foundation.org>; Wed, 26 Aug 2020 12:01:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k4FprAJqYqHX for <iommu@lists.linux-foundation.org>;
 Wed, 26 Aug 2020 12:01:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by silver.osuosl.org (Postfix) with ESMTPS id 2A3B522865
 for <iommu@lists.linux-foundation.org>; Wed, 26 Aug 2020 12:01:08 +0000 (UTC)
Message-Id: <20200826112331.530546013@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1598443266;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=u1yYqnSZZDMMoV9tW/nQF0JmP98FzCrk6ksyf7BvRgs=;
 b=kcbYH/xLrUAPJ6fWejOeJmxHcJDtKvq9rSmjVFfexK1fGAerVZEcPvhUq/Yew/wTSQUxQA
 nYDgNz2x9gVWr9YdEQXXW0/VcVXT6+SYH6p8Pyg8LMws06CpAnLkPedYCmO3f2I9OLqFZC
 16SjJaTyVMLuhEx4zWaHmggPOa/fosS1Fq7g8m+hzqpJbS1dA17hIkTlOSEM+4V1C3Wna4
 KXGIFDSYKSWp2EXIYFP8vuYyh2bqmw9EgsOEgcMI4J/Dvpl40jcQyeoFMFpF2CAHjFrcVJ
 TwP8ELN56HifujjCfZXWP2+C1SEu5/OwFOCAvmXbM99ahdOwcMZQk1h/7bsxwg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1598443266;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=u1yYqnSZZDMMoV9tW/nQF0JmP98FzCrk6ksyf7BvRgs=;
 b=iI5qSUQDjqoguOE0M0yhLqFGsfgkjHhT91vZR8ljMovSZDUawcj8oW/wubtZ3EtOdx3Jc7
 jK0U+RgVJOpYeYAg==
Date: Wed, 26 Aug 2020 13:16:37 +0200
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch V2 09/46] iommu/vt-d: Consolidate irq domain getter
References: <20200826111628.794979401@linutronix.de>
MIME-Version: 1.0
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
 Jon Derrick <jonathan.derrick@intel.com>, Juergen Gross <jgross@suse.com>,
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

From: Thomas Gleixner <tglx@linutronix.de>

The irq domain request mode is now indicated in irq_alloc_info::type.

Consolidate the two getter functions into one.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

---
 drivers/iommu/intel/irq_remapping.c |   67 ++++++++++++------------------------
 1 file changed, 24 insertions(+), 43 deletions(-)

--- a/drivers/iommu/intel/irq_remapping.c
+++ b/drivers/iommu/intel/irq_remapping.c
@@ -204,35 +204,40 @@ static int modify_irte(struct irq_2_iomm
 	return rc;
 }
 
-static struct intel_iommu *map_hpet_to_ir(u8 hpet_id)
+static struct irq_domain *map_hpet_to_ir(u8 hpet_id)
 {
 	int i;
 
-	for (i = 0; i < MAX_HPET_TBS; i++)
+	for (i = 0; i < MAX_HPET_TBS; i++) {
 		if (ir_hpet[i].id == hpet_id && ir_hpet[i].iommu)
-			return ir_hpet[i].iommu;
+			return ir_hpet[i].iommu->ir_domain;
+	}
 	return NULL;
 }
 
-static struct intel_iommu *map_ioapic_to_ir(int apic)
+static struct intel_iommu *map_ioapic_to_iommu(int apic)
 {
 	int i;
 
-	for (i = 0; i < MAX_IO_APICS; i++)
+	for (i = 0; i < MAX_IO_APICS; i++) {
 		if (ir_ioapic[i].id == apic && ir_ioapic[i].iommu)
 			return ir_ioapic[i].iommu;
+	}
 	return NULL;
 }
 
-static struct intel_iommu *map_dev_to_ir(struct pci_dev *dev)
+static struct irq_domain *map_ioapic_to_ir(int apic)
 {
-	struct dmar_drhd_unit *drhd;
+	struct intel_iommu *iommu = map_ioapic_to_iommu(apic);
 
-	drhd = dmar_find_matched_drhd_unit(dev);
-	if (!drhd)
-		return NULL;
+	return iommu ? iommu->ir_domain : NULL;
+}
+
+static struct irq_domain *map_dev_to_ir(struct pci_dev *dev)
+{
+	struct dmar_drhd_unit *drhd = dmar_find_matched_drhd_unit(dev);
 
-	return drhd->iommu;
+	return drhd ? drhd->iommu->ir_msi_domain : NULL;
 }
 
 static int clear_entries(struct irq_2_iommu *irq_iommu)
@@ -996,7 +1001,7 @@ static int __init parse_ioapics_under_ir
 
 	for (ioapic_idx = 0; ioapic_idx < nr_ioapics; ioapic_idx++) {
 		int ioapic_id = mpc_ioapic_id(ioapic_idx);
-		if (!map_ioapic_to_ir(ioapic_id)) {
+		if (!map_ioapic_to_iommu(ioapic_id)) {
 			pr_err(FW_BUG "ioapic %d has no mapping iommu, "
 			       "interrupt remapping will be disabled\n",
 			       ioapic_id);
@@ -1101,47 +1106,23 @@ static void prepare_irte(struct irte *ir
 	irte->redir_hint = 1;
 }
 
-static struct irq_domain *intel_get_ir_irq_domain(struct irq_alloc_info *info)
+static struct irq_domain *intel_get_irq_domain(struct irq_alloc_info *info)
 {
-	struct intel_iommu *iommu = NULL;
-
 	if (!info)
 		return NULL;
 
 	switch (info->type) {
 	case X86_IRQ_ALLOC_TYPE_IOAPIC_GET_PARENT:
-		iommu = map_ioapic_to_ir(info->ioapic_id);
-		break;
+		return map_ioapic_to_ir(info->ioapic_id);
 	case X86_IRQ_ALLOC_TYPE_HPET_GET_PARENT:
-		iommu = map_hpet_to_ir(info->hpet_id);
-		break;
-	default:
-		BUG_ON(1);
-		break;
-	}
-
-	return iommu ? iommu->ir_domain : NULL;
-}
-
-static struct irq_domain *intel_get_irq_domain(struct irq_alloc_info *info)
-{
-	struct intel_iommu *iommu;
-
-	if (!info)
-		return NULL;
-
-	switch (info->type) {
+		return map_hpet_to_ir(info->hpet_id);
 	case X86_IRQ_ALLOC_TYPE_PCI_MSI:
 	case X86_IRQ_ALLOC_TYPE_PCI_MSIX:
-		iommu = map_dev_to_ir(info->msi_dev);
-		if (iommu)
-			return iommu->ir_msi_domain;
-		break;
+		return map_dev_to_ir(info->msi_dev);
 	default:
-		break;
+		WARN_ON_ONCE(1);
+		return NULL;
 	}
-
-	return NULL;
 }
 
 struct irq_remap_ops intel_irq_remap_ops = {
@@ -1150,7 +1131,7 @@ struct irq_remap_ops intel_irq_remap_ops
 	.disable		= disable_irq_remapping,
 	.reenable		= reenable_irq_remapping,
 	.enable_faulting	= enable_drhd_fault_handling,
-	.get_ir_irq_domain	= intel_get_ir_irq_domain,
+	.get_ir_irq_domain	= intel_get_irq_domain,
 	.get_irq_domain		= intel_get_irq_domain,
 };
 


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
