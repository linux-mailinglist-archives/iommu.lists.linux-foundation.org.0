Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D4D470D36
	for <lists.iommu@lfdr.de>; Fri, 10 Dec 2021 23:19:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 186CD61B5C;
	Fri, 10 Dec 2021 22:19:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x-DSxNiLh1Ff; Fri, 10 Dec 2021 22:19:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 276D161B4A;
	Fri, 10 Dec 2021 22:19:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 77502C0074;
	Fri, 10 Dec 2021 22:19:20 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3BEB0C0012
 for <iommu@lists.linux-foundation.org>; Fri, 10 Dec 2021 22:19:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23656418DA
 for <iommu@lists.linux-foundation.org>; Fri, 10 Dec 2021 22:19:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linutronix.de header.b="q/pBw8Ll";
 dkim=neutral reason="invalid (unsupported algorithm ed25519-sha256)"
 header.d=linutronix.de header.b="6IVODbVD"
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 52YsT275xyvA for <iommu@lists.linux-foundation.org>;
 Fri, 10 Dec 2021 22:19:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 221E3418EC
 for <iommu@lists.linux-foundation.org>; Fri, 10 Dec 2021 22:19:18 +0000 (UTC)
Message-ID: <20211210221814.477386185@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1639174756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=dh2RlNUmAwoYjA9eTFF60aCLEohqcxOki/Se5jBNtvk=;
 b=q/pBw8LlYFFFU88TeeIJvEppe38MJYUOaegEt/6+kHbknlFz4hqC28pzkrcpz+rdZBH7Ct
 cpIao/Ojr+R6AhAU4S+g3dU9sxTrWInVNawKyo/5M0hDBcPOzYmXMGvoNYb/E/BRYK8AbE
 Jd5fBAThZII1tD00/tV2qPSz7ri4loVPKk5zdok3KSWYmtyvpbXduRDfB9WvyMuyy2kSKS
 YBUFmgpMtUuwAt8ClNM4DiGIjFsZPR5MwdIozMRpGbXOjm768Nd5uNtLBB7XFbQCr9VMYN
 v44+6amAej3NWNewWJB+7MJ66zDGM2lzzpqGH6JFmH6f765owfcCx2bXaseS0A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1639174756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=dh2RlNUmAwoYjA9eTFF60aCLEohqcxOki/Se5jBNtvk=;
 b=6IVODbVD2gQWqrMzoxlyFeT/FyksUxmc33xNNKlBBReHQFt0yfS0alvLSk8dq213HdtOYU
 U81rzfIpvPjBIhBA==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch V3 21/35] bus: fsl-mc-msi: Use msi_desc::msi_index
References: <20211210221642.869015045@linutronix.de>
MIME-Version: 1.0
Date: Fri, 10 Dec 2021 23:19:15 +0100 (CET)
Cc: Nishanth Menon <nm@ti.com>, Mark Rutland <mark.rutland@arm.com>,
 Stuart Yoder <stuyoder@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Will Deacon <will@kernel.org>, Ashok Raj <ashok.raj@intel.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Jassi Brar <jassisinghbrar@gmail.com>,
 Sinan Kaya <okaya@kernel.org>, iommu@lists.linux-foundation.org,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>, Bjorn Helgaas <helgaas@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Jason Gunthorpe <jgg@nvidia.com>,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Kevin Tian <kevin.tian@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Robin Murphy <robin.murphy@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>, Cedric Le Goater <clg@kaod.org>,
 Santosh Shilimkar <ssantosh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Megha Dey <megha.dey@intel.com>, Juergen Gross <jgross@suse.com>,
 Tero Kristo <kristo@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Vinod Koul <vkoul@kernel.org>,
 Marc Zygnier <maz@kernel.org>, dmaengine@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
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

Use the common msi_index member and get rid of the pointless wrapper struct.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Cc: Stuart Yoder <stuyoder@gmail.com>
Cc: Laurentiu Tudor <laurentiu.tudor@nxp.com>
---
 drivers/bus/fsl-mc/fsl-mc-allocator.c |    2 +-
 drivers/bus/fsl-mc/fsl-mc-msi.c       |    6 +++---
 include/linux/msi.h                   |   10 ----------
 3 files changed, 4 insertions(+), 14 deletions(-)

--- a/drivers/bus/fsl-mc/fsl-mc-allocator.c
+++ b/drivers/bus/fsl-mc/fsl-mc-allocator.c
@@ -393,7 +393,7 @@ int fsl_mc_populate_irq_pool(struct fsl_
 	}
 
 	for_each_msi_entry(msi_desc, &mc_bus_dev->dev) {
-		mc_dev_irq = &irq_resources[msi_desc->fsl_mc.msi_index];
+		mc_dev_irq = &irq_resources[msi_desc->msi_index];
 		mc_dev_irq->msi_desc = msi_desc;
 		mc_dev_irq->resource.id = msi_desc->irq;
 	}
--- a/drivers/bus/fsl-mc/fsl-mc-msi.c
+++ b/drivers/bus/fsl-mc/fsl-mc-msi.c
@@ -29,7 +29,7 @@ static irq_hw_number_t fsl_mc_domain_cal
 	 * Make the base hwirq value for ICID*10000 so it is readable
 	 * as a decimal value in /proc/interrupts.
 	 */
-	return (irq_hw_number_t)(desc->fsl_mc.msi_index + (dev->icid * 10000));
+	return (irq_hw_number_t)(desc->msi_index + (dev->icid * 10000));
 }
 
 static void fsl_mc_msi_set_desc(msi_alloc_info_t *arg,
@@ -122,7 +122,7 @@ static void fsl_mc_msi_write_msg(struct
 	struct fsl_mc_device *mc_bus_dev = to_fsl_mc_device(msi_desc->dev);
 	struct fsl_mc_bus *mc_bus = to_fsl_mc_bus(mc_bus_dev);
 	struct fsl_mc_device_irq *mc_dev_irq =
-		&mc_bus->irq_resources[msi_desc->fsl_mc.msi_index];
+		&mc_bus->irq_resources[msi_desc->msi_index];
 
 	msi_desc->msg = *msg;
 
@@ -235,7 +235,7 @@ static int fsl_mc_msi_alloc_descs(struct
 			goto cleanup_msi_descs;
 		}
 
-		msi_desc->fsl_mc.msi_index = i;
+		msi_desc->msi_index = i;
 		INIT_LIST_HEAD(&msi_desc->list);
 		list_add_tail(&msi_desc->list, dev_to_msi_list(dev));
 	}
--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -107,14 +107,6 @@ struct pci_msi_desc {
 };
 
 /**
- * fsl_mc_msi_desc - FSL-MC device specific msi descriptor data
- * @msi_index:		The index of the MSI descriptor
- */
-struct fsl_mc_msi_desc {
-	u16				msi_index;
-};
-
-/**
  * ti_sci_inta_msi_desc - TISCI based INTA specific msi descriptor data
  * @dev_index: TISCI device index
  */
@@ -137,7 +129,6 @@ struct ti_sci_inta_msi_desc {
  *
  * @msi_index:	Index of the msi descriptor
  * @pci:	[PCI]	    PCI speficic msi descriptor data
- * @fsl_mc:	[fsl-mc]    FSL MC device specific msi descriptor data
  * @inta:	[INTA]	    TISCI based INTA specific msi descriptor data
  */
 struct msi_desc {
@@ -158,7 +149,6 @@ struct msi_desc {
 	u16				msi_index;
 	union {
 		struct pci_msi_desc		pci;
-		struct fsl_mc_msi_desc		fsl_mc;
 		struct ti_sci_inta_msi_desc	inta;
 	};
 };

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
