Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9B724CA25
	for <lists.iommu@lfdr.de>; Fri, 21 Aug 2020 04:17:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3BC9D8869E;
	Fri, 21 Aug 2020 02:17:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8fa1tvEYl-bS; Fri, 21 Aug 2020 02:17:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id D86DC886C2;
	Fri, 21 Aug 2020 02:17:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D00C6C0051;
	Fri, 21 Aug 2020 02:17:16 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E5F37C0051
 for <iommu@lists.linux-foundation.org>; Fri, 21 Aug 2020 02:17:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id D52B4885F6
 for <iommu@lists.linux-foundation.org>; Fri, 21 Aug 2020 02:17:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 22dLpj7IQc8I for <iommu@lists.linux-foundation.org>;
 Fri, 21 Aug 2020 02:17:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 42A4F885E7
 for <iommu@lists.linux-foundation.org>; Fri, 21 Aug 2020 02:17:13 +0000 (UTC)
Message-Id: <20200821002947.976983300@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1597976231;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=SGz3jtzA9Q1y95hnVuLxxhCEaendeRp/03jNV4aYAm8=;
 b=N2+U2u4I8yJg8VF+uL4FQq9guu91mSkYx2sWqM85NBILITb3QcvFgm3DFxyihU8cdO6L2r
 tjLGN4ImjBGwPeuIZo27Ukf2dhXy/slZLMN6IOkVCA2U0KMUQrtgLJy8hFf3CWnR8A6uYW
 t8Xgtgt7favibCuGa/mRXiQLNak7Xxj6xhZkiFkDTWwNRR0WIAnA6TMAGlUKDPc9uZoeM3
 dCXAofwGcByhVxrZT++YN5qD88X6DPgym6vieG2bSZeSDJHGp+nyRpxD4houiQjBvXz9DH
 gIJbh4Od3qhPa5HhYgTwFJo9kwDaUZ3hm5hVrna8JJwUYVfrgVppvdByPkSgmQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1597976231;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=SGz3jtzA9Q1y95hnVuLxxhCEaendeRp/03jNV4aYAm8=;
 b=ca4eWdnEIOSuKlOGPK+65FKofe5JXsumdjO2jo0sJX45NwsOG0Tk62i1rXRTSyUBmVAOfx
 wHjKYSP2PINyZoCA==
Date: Fri, 21 Aug 2020 02:24:51 +0200
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch RFC 27/38] iommm/vt-d: Store irq domain in struct device
References: <20200821002424.119492231@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline;
 filename="iommm-vt-d--Store-irq-domain-in-struct-device.patch"
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

As a first step to make X86 utilize the direct MSI irq domain operations
store the irq domain pointer in the device struct when a device is probed.

This is done from dmar_pci_bus_add_dev() because it has to work even when
DMA remapping is disabled. It only overrides the irqdomain of devices which
are handled by a regular PCI/MSI irq domain which protects PCI devices
behind special busses like VMD which have their own irq domain.

No functional change. It just avoids the redirection through
arch_*_msi_irqs() and allows the PCI/MSI core to directly invoke the irq
domain alloc/free functions instead of having to look up the irq domain for
every single MSI interupt.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Joerg Roedel <joro@8bytes.org>
Cc: iommu@lists.linux-foundation.org
Cc: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/iommu/intel/dmar.c          |    3 +++
 drivers/iommu/intel/irq_remapping.c |   16 ++++++++++++++++
 include/linux/intel-iommu.h         |    5 +++++
 3 files changed, 24 insertions(+)

--- a/drivers/iommu/intel/dmar.c
+++ b/drivers/iommu/intel/dmar.c
@@ -316,6 +316,9 @@ static int dmar_pci_bus_add_dev(struct d
 	if (ret < 0 && dmar_dev_scope_status == 0)
 		dmar_dev_scope_status = ret;
 
+	if (ret >= 0)
+		intel_irq_remap_add_device(info);
+
 	return ret;
 }
 
--- a/drivers/iommu/intel/irq_remapping.c
+++ b/drivers/iommu/intel/irq_remapping.c
@@ -1086,6 +1086,22 @@ static int reenable_irq_remapping(int ei
 	return -1;
 }
 
+/*
+ * Store the MSI remapping domain pointer in the device if enabled.
+ *
+ * This is called from dmar_pci_bus_add_dev() so it works even when DMA
+ * remapping is disabled. Only update the pointer if the device is not
+ * already handled by a non default PCI/MSI interrupt domain. This protects
+ * e.g. VMD devices.
+ */
+void intel_irq_remap_add_device(struct dmar_pci_notify_info *info)
+{
+	if (!irq_remapping_enabled || pci_dev_has_special_msi_domain(info->dev))
+		return;
+
+	dev_set_msi_domain(&info->dev->dev, map_dev_to_ir(info->dev));
+}
+
 static void prepare_irte(struct irte *irte, int vector, unsigned int dest)
 {
 	memset(irte, 0, sizeof(*irte));
--- a/include/linux/intel-iommu.h
+++ b/include/linux/intel-iommu.h
@@ -439,6 +439,11 @@ struct ir_table {
 	struct irte *base;
 	unsigned long *bitmap;
 };
+
+void intel_irq_remap_add_device(struct dmar_pci_notify_info *info);
+#else
+static inline void
+intel_irq_remap_add_device(struct dmar_pci_notify_info *info) { }
 #endif
 
 struct iommu_flush {

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
