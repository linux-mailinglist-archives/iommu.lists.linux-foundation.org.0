Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B44524CA24
	for <lists.iommu@lfdr.de>; Fri, 21 Aug 2020 04:17:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id D351488607;
	Fri, 21 Aug 2020 02:17:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A6-h+vWKGLNh; Fri, 21 Aug 2020 02:17:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 25D848860A;
	Fri, 21 Aug 2020 02:17:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 117B8C0889;
	Fri, 21 Aug 2020 02:17:22 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C125BC0051
 for <iommu@lists.linux-foundation.org>; Fri, 21 Aug 2020 02:17:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id BD9C086CF9
 for <iommu@lists.linux-foundation.org>; Fri, 21 Aug 2020 02:17:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WJrQurxGOumv for <iommu@lists.linux-foundation.org>;
 Fri, 21 Aug 2020 02:17:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 7F34586CEF
 for <iommu@lists.linux-foundation.org>; Fri, 21 Aug 2020 02:17:19 +0000 (UTC)
Message-Id: <20200821002948.472642859@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1597976238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=YM0Jb+0jacRYeAAEIXyvt7LyQs4eenP0P8zOev+VYEA=;
 b=XYwY5aZBZHc/cE8NoEwTRaXWx4kQ9d5LAVJKdZmLxtBDVRWBQIJ1CD55OOiD8/PaSIC/Qz
 86xyuToyG6fI0SYmZSPxwoPMnRKptHaFKEijx8ccnzdBv83L4NnYP/UaMCRLf1xPIu9QD6
 LnA+w+4x3Jkpbea1y5BQ1kxBaz1UJLA/aMDIsKy/If47+NLxbOJk4c2rnPclYU5gciOWt2
 q7yABVl1IeaRUY1SCLr5pnWVG3Lc67GbPkqqE2Np8EEdfhi2F/dQu1naD6Hi5jWT+CBefq
 9I1Ctkigd4ye/r+nFa9qaNWht25+BgwifwFgNJLDdwMDEhIbqsoywHttGKLZ8A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1597976238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=YM0Jb+0jacRYeAAEIXyvt7LyQs4eenP0P8zOev+VYEA=;
 b=SJFB1hWrc9NTcS6nWGalTM0SJUTy+5x03Z372SqiJn9+JXrx5GkSr1rUnc2/RHr+HRLf5m
 OPRQxTlNSr1y7xCA==
Date: Fri, 21 Aug 2020 02:24:56 +0200
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch RFC 32/38] x86/irq: Make most MSI ops XEN private
References: <20200821002424.119492231@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline;
 filename="x86-irq--Make-most-MSI-ops-XEN-private.patch"
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

Nothing except XEN uses the setup/teardown ops. Hide them there.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: xen-devel@lists.xenproject.org
Cc: linux-pci@vger.kernel.org
---
 arch/x86/include/asm/x86_init.h |    2 --
 arch/x86/pci/xen.c              |   23 +++++++++++++++--------
 2 files changed, 15 insertions(+), 10 deletions(-)

--- a/arch/x86/include/asm/x86_init.h
+++ b/arch/x86/include/asm/x86_init.h
@@ -276,8 +276,6 @@ struct x86_platform_ops {
 struct pci_dev;
 
 struct x86_msi_ops {
-	int (*setup_msi_irqs)(struct pci_dev *dev, int nvec, int type);
-	void (*teardown_msi_irqs)(struct pci_dev *dev);
 	void (*restore_msi_irqs)(struct pci_dev *dev);
 };
 
--- a/arch/x86/pci/xen.c
+++ b/arch/x86/pci/xen.c
@@ -156,6 +156,13 @@ static int acpi_register_gsi_xen(struct
 struct xen_pci_frontend_ops *xen_pci_frontend;
 EXPORT_SYMBOL_GPL(xen_pci_frontend);
 
+struct xen_msi_ops {
+	int (*setup_msi_irqs)(struct pci_dev *dev, int nvec, int type);
+	void (*teardown_msi_irqs)(struct pci_dev *dev);
+};
+
+static struct xen_msi_ops xen_msi_ops __ro_after_init;
+
 static int xen_setup_msi_irqs(struct pci_dev *dev, int nvec, int type)
 {
 	int irq, ret, i;
@@ -414,7 +421,7 @@ static int xen_msi_domain_alloc_irqs(str
 	else
 		type = PCI_CAP_ID_MSI;
 
-	return x86_msi.setup_msi_irqs(to_pci_dev(dev), nvec, type);
+	return xen_msi_ops.setup_msi_irqs(to_pci_dev(dev), nvec, type);
 }
 
 static void xen_msi_domain_free_irqs(struct irq_domain *domain,
@@ -423,7 +430,7 @@ static void xen_msi_domain_free_irqs(str
 	if (WARN_ON_ONCE(!dev_is_pci(dev)))
 		return;
 
-	x86_msi.teardown_msi_irqs(to_pci_dev(dev));
+	xen_msi_ops.teardown_msi_irqs(to_pci_dev(dev));
 }
 
 static struct msi_domain_ops xen_pci_msi_domain_ops = {
@@ -461,17 +468,17 @@ static __init struct irq_domain *xen_cre
 static __init void xen_setup_pci_msi(void)
 {
 	if (xen_initial_domain()) {
-		x86_msi.setup_msi_irqs = xen_initdom_setup_msi_irqs;
-		x86_msi.teardown_msi_irqs = xen_teardown_msi_irqs;
+		xen_msi_ops.setup_msi_irqs = xen_initdom_setup_msi_irqs;
+		xen_msi_ops.teardown_msi_irqs = xen_teardown_msi_irqs;
 		x86_msi.restore_msi_irqs = xen_initdom_restore_msi_irqs;
 		pci_msi_ignore_mask = 1;
 	} else if (xen_pv_domain()) {
-		x86_msi.setup_msi_irqs = xen_setup_msi_irqs;
-		x86_msi.teardown_msi_irqs = xen_pv_teardown_msi_irqs;
+		xen_msi_ops.setup_msi_irqs = xen_setup_msi_irqs;
+		xen_msi_ops.teardown_msi_irqs = xen_pv_teardown_msi_irqs;
 		pci_msi_ignore_mask = 1;
 	} else if (xen_hvm_domain()) {
-		x86_msi.setup_msi_irqs = xen_hvm_setup_msi_irqs;
-		x86_msi.teardown_msi_irqs = xen_teardown_msi_irqs;
+		xen_msi_ops.setup_msi_irqs = xen_hvm_setup_msi_irqs;
+		xen_msi_ops.teardown_msi_irqs = xen_teardown_msi_irqs;
 	} else {
 		WARN_ON_ONCE(1);
 		return;

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
