Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id B124046AC4E
	for <lists.iommu@lfdr.de>; Mon,  6 Dec 2021 23:39:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1110F404FD;
	Mon,  6 Dec 2021 22:39:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BLJlw0ziFygs; Mon,  6 Dec 2021 22:39:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id CD9BE404C5;
	Mon,  6 Dec 2021 22:39:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 992BBC0071;
	Mon,  6 Dec 2021 22:39:01 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BE2C5C0012
 for <iommu@lists.linux-foundation.org>; Mon,  6 Dec 2021 22:39:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9E071404C5
 for <iommu@lists.linux-foundation.org>; Mon,  6 Dec 2021 22:39:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qp1GJWenvsf0 for <iommu@lists.linux-foundation.org>;
 Mon,  6 Dec 2021 22:38:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4CF414015F
 for <iommu@lists.linux-foundation.org>; Mon,  6 Dec 2021 22:38:58 +0000 (UTC)
Message-ID: <20211206210307.625116253@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1638830336;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=tVxkONw1+URUxuo5QL2ocxThr7/mkfa4+qL7IuxO3Uk=;
 b=IBPmwzRmWD5mL6+e7MwJlzRwVEFnyloQOG5U1+MtcbGwWlmr/iX9fTfUI/80/wO154AnhB
 8DYtOoCiUZGZIX7xxJRto86p8RkbCzd/unh1t58dBbsJrwuPqPvrRLRXrT0esBwzHbNsNa
 qwXZqvTJre7RZQfDg4/dTnBaJ4Vn9A0GgekS+1e4Qf5kRU0iK9FpbDyilXUeeC7+VrAfb5
 IxJNcokipuIGvUWHF5lH8dowLW34B6L9V/hmTpeZhSPpHFMlpyl8w1QpGVxHjEjKadyW2W
 7U4rDr3YJC9E75LoEvXhJG05GptEAkSgVKVq9N1KE7tsTr7r8yq+qfSK1FbT+A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1638830336;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=tVxkONw1+URUxuo5QL2ocxThr7/mkfa4+qL7IuxO3Uk=;
 b=kGhsuXkAAqnqxB8SQ+Z7lY2BC9yD4sp1NOG0tpAY5Yhj/oSfoQ4S3EJ7Pv7mdUHrVMdkTQ
 yUjnayt7pKthTuCQ==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch V2 00/36] genirq/msi, PCI/MSI: Spring cleaning - Part 2
MIME-Version: 1.0
Date: Mon,  6 Dec 2021 23:38:56 +0100 (CET)
Cc: Nishanth Menon <nm@ti.com>, Mark Rutland <mark.rutland@arm.com>,
 Stuart Yoder <stuyoder@gmail.com>, linux-pci@vger.kernel.org,
 Will Deacon <will@kernel.org>, Ashok Raj <ashok.raj@intel.com>,
 Marc Zygnier <maz@kernel.org>, Sinan Kaya <okaya@kernel.org>,
 iommu@lists.linux-foundation.org, Bjorn Helgaas <helgaas@kernel.org>,
 Megha Dey <megha.dey@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
 xen-devel@lists.xenproject.org, Kevin Tian <kevin.tian@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>, Cedric Le Goater <clg@kaod.org>,
 Santosh Shilimkar <ssantosh@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Juergen Gross <jgross@suse.com>, Tero Kristo <kristo@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Vinod Koul <vkoul@kernel.org>,
 dmaengine@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>
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


This is the second part of [PCI]MSI refactoring which aims to provide the
ability of expanding MSI-X vectors after enabling MSI-X.

The first part of this work can be found here:

    https://lore.kernel.org/r/20211206210147.872865823@linutronix.de

This second part has the following important changes:

   1) Cleanup of the MSI related data in struct device

      struct device contains at the moment various MSI related parts. Some
      of them (the irq domain pointer) cannot be moved out, but the rest
      can be allocated on first use. This is in preparation of adding more
      per device MSI data later on.

   2) Consolidation of sysfs handling

      As a first step this moves the sysfs pointer from struct msi_desc
      into the new per device MSI data structure where it belongs.

      Later changes will cleanup this code further, but that's not possible
      at this point.

   3) Store per device properties in the per device MSI data to avoid
      looking up MSI descriptors and analysing their data. Cleanup all
      related use cases.

   4) Provide a function to retrieve the Linux interrupt number for a given
      MSI index similar to pci_irq_vector() and cleanup all open coded
      variants.

This second series is based on:

     git://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git msi-v2-part-1

and also available from git:

     git://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git msi-v2-part-2

For the curious who can't wait for the next part to arrive the full series
is available via:

     git://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git msi-v2-part-3

V1 of this series can be found here:

    https://lore.kernel.org/r/20211126224100.303046749@linutronix.de

Changes versus V1:

  - Fix the pci_irq_vector() thinko - Marc

  - Fix the powerpc fallout - Cedric, Andy

  - Addressed codingstyle/comments feedback - Jonathan

  - Added a MSI properties setter to prepare for later changes

  - Confined the global msi*sysfs functions to legacy code

  - Dropped the MSI lock patch as the lock has moved to struct pci_dev
    in V2 part-1 now

  - Picked up Reviewed/Tested/Acked-by tags as appropriate

Thanks,

	tglx
---
 arch/powerpc/platforms/cell/axon_msi.c              |    6 
 arch/powerpc/platforms/pseries/msi.c                |   39 +---
 arch/x86/kernel/apic/msi.c                          |    5 
 arch/x86/pci/xen.c                                  |    8 
 drivers/base/platform-msi.c                         |  152 +++++++---------
 drivers/bus/fsl-mc/dprc-driver.c                    |    8 
 drivers/bus/fsl-mc/fsl-mc-allocator.c               |    9 
 drivers/bus/fsl-mc/fsl-mc-msi.c                     |   26 +-
 drivers/dma/mv_xor_v2.c                             |   16 -
 drivers/dma/qcom/hidma.c                            |   44 ++--
 drivers/dma/ti/k3-udma-private.c                    |    6 
 drivers/dma/ti/k3-udma.c                            |   14 -
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c         |   23 --
 drivers/irqchip/irq-mbigen.c                        |    4 
 drivers/irqchip/irq-mvebu-icu.c                     |   12 -
 drivers/irqchip/irq-ti-sci-inta.c                   |    2 
 drivers/mailbox/bcm-flexrm-mailbox.c                |    9 
 drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c    |    4 
 drivers/net/ethernet/freescale/dpaa2/dpaa2-ptp.c    |    4 
 drivers/net/ethernet/freescale/dpaa2/dpaa2-switch.c |    5 
 drivers/pci/msi/irqdomain.c                         |   20 +-
 drivers/pci/msi/legacy.c                            |    6 
 drivers/pci/msi/msi.c                               |  118 ++++--------
 drivers/pci/xen-pcifront.c                          |    2 
 drivers/perf/arm_smmuv3_pmu.c                       |    5 
 drivers/soc/fsl/dpio/dpio-driver.c                  |    8 
 drivers/soc/ti/k3-ringacc.c                         |    6 
 drivers/soc/ti/ti_sci_inta_msi.c                    |   22 --
 drivers/vfio/fsl-mc/vfio_fsl_mc_intr.c              |    4 
 include/linux/device.h                              |   25 ++
 include/linux/fsl/mc.h                              |    4 
 include/linux/msi.h                                 |  112 ++++++------
 include/linux/pci.h                                 |    1 
 include/linux/soc/ti/ti_sci_inta_msi.h              |    1 
 kernel/irq/msi.c                                    |  182 +++++++++++++++-----
 35 files changed, 464 insertions(+), 448 deletions(-)
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
