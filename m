Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id A895A24CA11
	for <lists.iommu@lfdr.de>; Fri, 21 Aug 2020 04:17:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 59FB488691;
	Fri, 21 Aug 2020 02:17:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id To4nYUun6XJb; Fri, 21 Aug 2020 02:17:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id ABB968869F;
	Fri, 21 Aug 2020 02:17:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A3A5CC0051;
	Fri, 21 Aug 2020 02:17:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 589ADC0889
 for <iommu@lists.linux-foundation.org>; Fri, 21 Aug 2020 02:17:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 47C24885E7
 for <iommu@lists.linux-foundation.org>; Fri, 21 Aug 2020 02:17:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2Rx+W3CRHd3E for <iommu@lists.linux-foundation.org>;
 Fri, 21 Aug 2020 02:17:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by hemlock.osuosl.org (Postfix) with ESMTPS id A93F2877B3
 for <iommu@lists.linux-foundation.org>; Fri, 21 Aug 2020 02:17:04 +0000 (UTC)
Message-Id: <20200821002947.263753263@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1597976223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=xhbFdhsCsQ5VSYCUiVy99pvX2yN4idfA0I7XlvTQakE=;
 b=ZHPMzYaPzfOECo836sQFsUmCX7TFv2uj13sv98D4bI8o6iI6WKZs1U7pYv9brD8a4az4fs
 NyW2wBNkPya+ae9bCFjp09So5OeSSAX52C6juW+HKgm4ymvYeCx/IfVgaDhjbZBDHJN2Y7
 N3Ga0P6rEMZqQTiiVOkR3j0KsFCD4vhJzcH9tjRPhCUvVfZb3FJIfpw8yH5bG9MqEf/Vfx
 HtYfBOCZj0F8653MC9JjGiUq1BCATOsRuRbgl0R92oj6nP6xijsr8QEAN3xNC7i6G9hIwj
 93+5AhgyK99DgKHmu6NAF2r5clFidEeEDceyitr+J6fyYTJp9z6GKMouFgvM/g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1597976223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=xhbFdhsCsQ5VSYCUiVy99pvX2yN4idfA0I7XlvTQakE=;
 b=JYv5Wl4UiPVl3hvzKT1TU9FbgMyvxpUxxeVQ/q1ta3fiBXM7WdZyhJVHsfCIDihr82ihZJ
 mZtv6aJHBV8/OEAQ==
Date: Fri, 21 Aug 2020 02:24:44 +0200
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch RFC 20/38] PCI: vmd: Mark VMD irqdomain with DOMAIN_BUS_VMD_MSI
References: <20200821002424.119492231@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline;
 filename="PCI--vmd--Mark-VMD-irqdomain-with-DOMAIN_BUS_VMD_PCI.patch"
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

Devices on the VMD bus use their own MSI irq domain, but it is not
distinguishable from regular PCI/MSI irq domains. This is required
to exclude VMD devices from getting the irq domain pointer set by
interrupt remapping.

Override the default bus token.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Jonathan Derrick <jonathan.derrick@intel.com>
Cc: linux-pci@vger.kernel.org
---
 drivers/pci/controller/vmd.c |    6 ++++++
 1 file changed, 6 insertions(+)

--- a/drivers/pci/controller/vmd.c
+++ b/drivers/pci/controller/vmd.c
@@ -579,6 +579,12 @@ static int vmd_enable_domain(struct vmd_
 		return -ENODEV;
 	}
 
+	/*
+	 * Override the irq domain bus token so the domain can be distinguished
+	 * from a regular PCI/MSI domain.
+	 */
+	irq_domain_update_bus_token(vmd->irq_domain, DOMAIN_BUS_VMD_MSI);
+
 	pci_add_resource(&resources, &vmd->resources[0]);
 	pci_add_resource_offset(&resources, &vmd->resources[1], offset[0]);
 	pci_add_resource_offset(&resources, &vmd->resources[2], offset[1]);

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
