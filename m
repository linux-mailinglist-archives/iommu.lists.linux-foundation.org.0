Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F0A24CA07
	for <lists.iommu@lfdr.de>; Fri, 21 Aug 2020 04:17:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4261486CC1;
	Fri, 21 Aug 2020 02:17:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uHlQMnWEQytR; Fri, 21 Aug 2020 02:17:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BF9AC86CD4;
	Fri, 21 Aug 2020 02:17:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ADF5FC0889;
	Fri, 21 Aug 2020 02:17:02 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 96847C0051
 for <iommu@lists.linux-foundation.org>; Fri, 21 Aug 2020 02:17:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 854808869C
 for <iommu@lists.linux-foundation.org>; Fri, 21 Aug 2020 02:17:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B8F7V8N4iuo6 for <iommu@lists.linux-foundation.org>;
 Fri, 21 Aug 2020 02:16:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 9560A88691
 for <iommu@lists.linux-foundation.org>; Fri, 21 Aug 2020 02:16:59 +0000 (UTC)
Message-Id: <20200821002946.779723926@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1597976218;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=d8EPioWtx5drJqrcXnN7xcWjcEFvzbwtUk0NCHv0h4o=;
 b=Rsv1T8F/5id3E2QlMxxoUYNs9OrQBiJXcdBWv+VUDTaLWtAd3zGdtL2TgS/zxGfcSo2sdk
 s/3Nys6r5NkcPDwEIDudSphnlW5ek9FfWWGra7vP8r3S9Ko9RdsogSQsMdaNqOL5G4nr1b
 mgh18ADIgpivQp44XrdHu7qbFz0CLMcTz5p6e2CXH81FYKmF8ubeE32KoI9SxDMrHH57zc
 0zVkj56GrnvfVLlmm7ENGGosWtnUqi7u3Yv6XbTwtiAw5h8l9sliGu8hdD/SRC6N/7r5ZQ
 H/1oePq3VSz+QkOSrnU6+PD4ELo6cRfPODfe8VWXCDci3DJz9vCbwi0frf3U5w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1597976218;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=d8EPioWtx5drJqrcXnN7xcWjcEFvzbwtUk0NCHv0h4o=;
 b=b9OJ97C9AmXxu38Qx9+yLOswWlewjRXers9iQg2+nezGb8zb/+p2RX3IXe/2SnyX1Q314M
 9rB9ovwHoTsGx+Aw==
Date: Fri, 21 Aug 2020 02:24:39 +0200
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch RFC 15/38] x86/msi: Use generic MSI domain ops
References: <20200821002424.119492231@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline;
 filename="x86-msi--Use-generic-MSI-domain-ops.patch"
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

pci_msi_get_hwirq() and pci_msi_set_desc are not longer special. Enable the
generic MSI domain ops in the core and PCI MSI code unconditionally and get
rid of the x86 specific implementations in the X86 MSI code and in the
hyperv PCI driver.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Wei Liu <wei.liu@kernel.org>
Cc: Stephen Hemminger <sthemmin@microsoft.com>
Cc: Haiyang Zhang <haiyangz@microsoft.com>
Cc: linux-pci@vger.kernel.org
Cc: linux-hyperv@vger.kernel.org
---
 arch/x86/include/asm/msi.h          |    2 --
 arch/x86/kernel/apic/msi.c          |   15 ---------------
 drivers/pci/controller/pci-hyperv.c |    8 --------
 drivers/pci/msi.c                   |    4 ----
 kernel/irq/msi.c                    |    6 ------
 5 files changed, 35 deletions(-)

--- a/arch/x86/include/asm/msi.h
+++ b/arch/x86/include/asm/msi.h
@@ -9,6 +9,4 @@ typedef struct irq_alloc_info msi_alloc_
 int pci_msi_prepare(struct irq_domain *domain, struct device *dev, int nvec,
 		    msi_alloc_info_t *arg);
 
-void pci_msi_set_desc(msi_alloc_info_t *arg, struct msi_desc *desc);
-
 #endif /* _ASM_X86_MSI_H */
--- a/arch/x86/kernel/apic/msi.c
+++ b/arch/x86/kernel/apic/msi.c
@@ -204,12 +204,6 @@ void native_teardown_msi_irq(unsigned in
 	irq_domain_free_irqs(irq, 1);
 }
 
-static irq_hw_number_t pci_msi_get_hwirq(struct msi_domain_info *info,
-					 msi_alloc_info_t *arg)
-{
-	return arg->hwirq;
-}
-
 int pci_msi_prepare(struct irq_domain *domain, struct device *dev, int nvec,
 		    msi_alloc_info_t *arg)
 {
@@ -228,17 +222,8 @@ int pci_msi_prepare(struct irq_domain *d
 }
 EXPORT_SYMBOL_GPL(pci_msi_prepare);
 
-void pci_msi_set_desc(msi_alloc_info_t *arg, struct msi_desc *desc)
-{
-	arg->desc = desc;
-	arg->hwirq = pci_msi_domain_calc_hwirq(desc);
-}
-EXPORT_SYMBOL_GPL(pci_msi_set_desc);
-
 static struct msi_domain_ops pci_msi_domain_ops = {
-	.get_hwirq	= pci_msi_get_hwirq,
 	.msi_prepare	= pci_msi_prepare,
-	.set_desc	= pci_msi_set_desc,
 };
 
 static struct msi_domain_info pci_msi_domain_info = {
--- a/drivers/pci/controller/pci-hyperv.c
+++ b/drivers/pci/controller/pci-hyperv.c
@@ -1531,16 +1531,8 @@ static struct irq_chip hv_msi_irq_chip =
 	.irq_unmask		= hv_irq_unmask,
 };
 
-static irq_hw_number_t hv_msi_domain_ops_get_hwirq(struct msi_domain_info *info,
-						   msi_alloc_info_t *arg)
-{
-	return arg->hwirq;
-}
-
 static struct msi_domain_ops hv_msi_ops = {
-	.get_hwirq	= hv_msi_domain_ops_get_hwirq,
 	.msi_prepare	= pci_msi_prepare,
-	.set_desc	= pci_msi_set_desc,
 	.msi_free	= hv_msi_free,
 };
 
--- a/drivers/pci/msi.c
+++ b/drivers/pci/msi.c
@@ -1401,16 +1401,12 @@ static int pci_msi_domain_handle_error(s
 	return error;
 }
 
-#ifdef GENERIC_MSI_DOMAIN_OPS
 static void pci_msi_domain_set_desc(msi_alloc_info_t *arg,
 				    struct msi_desc *desc)
 {
 	arg->desc = desc;
 	arg->hwirq = pci_msi_domain_calc_hwirq(desc);
 }
-#else
-#define pci_msi_domain_set_desc		NULL
-#endif
 
 static struct msi_domain_ops pci_msi_domain_ops_default = {
 	.set_desc	= pci_msi_domain_set_desc,
--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -187,7 +187,6 @@ static const struct irq_domain_ops msi_d
 	.deactivate	= msi_domain_deactivate,
 };
 
-#ifdef GENERIC_MSI_DOMAIN_OPS
 static irq_hw_number_t msi_domain_ops_get_hwirq(struct msi_domain_info *info,
 						msi_alloc_info_t *arg)
 {
@@ -206,11 +205,6 @@ static void msi_domain_ops_set_desc(msi_
 {
 	arg->desc = desc;
 }
-#else
-#define msi_domain_ops_get_hwirq	NULL
-#define msi_domain_ops_prepare		NULL
-#define msi_domain_ops_set_desc		NULL
-#endif /* !GENERIC_MSI_DOMAIN_OPS */
 
 static int msi_domain_ops_init(struct irq_domain *domain,
 			       struct msi_domain_info *info,

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
