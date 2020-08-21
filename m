Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id D05C624CA12
	for <lists.iommu@lfdr.de>; Fri, 21 Aug 2020 04:17:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 87E8D886A9;
	Fri, 21 Aug 2020 02:17:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aJrRfEuaNMkT; Fri, 21 Aug 2020 02:17:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C8AE0886A7;
	Fri, 21 Aug 2020 02:17:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B5921C0051;
	Fri, 21 Aug 2020 02:17:10 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 66B27C0895
 for <iommu@lists.linux-foundation.org>; Fri, 21 Aug 2020 02:17:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 4F8C623042
 for <iommu@lists.linux-foundation.org>; Fri, 21 Aug 2020 02:17:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EaEllfXWJybh for <iommu@lists.linux-foundation.org>;
 Fri, 21 Aug 2020 02:17:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by silver.osuosl.org (Postfix) with ESMTPS id DCB8222E94
 for <iommu@lists.linux-foundation.org>; Fri, 21 Aug 2020 02:17:00 +0000 (UTC)
Message-Id: <20200821002946.982695529@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1597976219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=mCqKSi3fy8ExwYtATAttVbUTM8VvxHS3vlXvJsftOtw=;
 b=aKS5lAGS5ICSii2yx/d+iI9vMr1TvMV6r1bAMpnFaLBPzLpprqV5C2sjipiRq2dRuzhRiY
 Az6dslm3aVt4hPbEyKkI/D9eWyVHd27CLerF0Ton1pdq5TwNkWnNGd/kJISan8R49Ot7ZB
 sWJoFZLYcCFpjGGPo7Jcov0/WMrmV8a45snuLmRBKEneXpuNC6PulemnGlTOjvmH52PJwN
 P6J37XWmZ1FnqSkWFS4YJ5HsiRXDbni3J5QlKfWYvwc6g0xqojb7tE8NdT9asatHPJ1Rvm
 BX9whaNMTWkolxgA+W6rN9UBEQ5UGb11Zi1AOgw7iX0qzCnAt9bA7MYUBjmGDA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1597976219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=mCqKSi3fy8ExwYtATAttVbUTM8VvxHS3vlXvJsftOtw=;
 b=WDwJDz3XYNRtoThpdQR9sTE4mZZIR7w9oJFDzo4JCrHmGb/5G0PJkUtPZlyqOmPU4yudO2
 OY/aUoq64F7uSMDw==
Date: Fri, 21 Aug 2020 02:24:41 +0200
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch RFC 17/38] x86/pci: Reducde #ifdeffery in PCI init code
References: <20200821002424.119492231@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline;
 filename="x86-pci--Reducde-#ifdeffery-in-PCI-init-code.patch"
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

Adding a function call before the first #ifdef in arch_pci_init() triggers
a 'mixed declarations and code' warning if PCI_DIRECT is enabled.

Use stub functions and move the #ifdeffery to the header file where it is
not in the way.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-pci@vger.kernel.org
---
 arch/x86/include/asm/pci_x86.h |   11 +++++++++++
 arch/x86/pci/init.c            |   10 +++-------
 2 files changed, 14 insertions(+), 7 deletions(-)

--- a/arch/x86/include/asm/pci_x86.h
+++ b/arch/x86/include/asm/pci_x86.h
@@ -114,9 +114,20 @@ extern const struct pci_raw_ops pci_dire
 extern bool port_cf9_safe;
 
 /* arch_initcall level */
+#ifdef CONFIG_PCI_DIRECT
 extern int pci_direct_probe(void);
 extern void pci_direct_init(int type);
+#else
+static inline int pci_direct_probe(void) { return -1; }
+static inline  void pci_direct_init(int type) { }
+#endif
+
+#ifdef CONFIG_PCI_BIOS
 extern void pci_pcbios_init(void);
+#else
+static inline void pci_pcbios_init(void) { }
+#endif
+
 extern void __init dmi_check_pciprobe(void);
 extern void __init dmi_check_skip_isa_align(void);
 
--- a/arch/x86/pci/init.c
+++ b/arch/x86/pci/init.c
@@ -8,11 +8,9 @@
    in the right sequence from here. */
 static __init int pci_arch_init(void)
 {
-#ifdef CONFIG_PCI_DIRECT
-	int type = 0;
+	int type;
 
 	type = pci_direct_probe();
-#endif
 
 	if (!(pci_probe & PCI_PROBE_NOEARLY))
 		pci_mmcfg_early_init();
@@ -20,18 +18,16 @@ static __init int pci_arch_init(void)
 	if (x86_init.pci.arch_init && !x86_init.pci.arch_init())
 		return 0;
 
-#ifdef CONFIG_PCI_BIOS
 	pci_pcbios_init();
-#endif
+
 	/*
 	 * don't check for raw_pci_ops here because we want pcbios as last
 	 * fallback, yet it's needed to run first to set pcibios_last_bus
 	 * in case legacy PCI probing is used. otherwise detecting peer busses
 	 * fails.
 	 */
-#ifdef CONFIG_PCI_DIRECT
 	pci_direct_init(type);
-#endif
+
 	if (!raw_pci_ops && !raw_pci_ext_ops)
 		printk(KERN_ERR
 		"PCI: Fatal: No config space access function found\n");

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
