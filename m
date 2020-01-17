Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 54BC7141424
	for <lists.iommu@lfdr.de>; Fri, 17 Jan 2020 23:32:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id F34A086949;
	Fri, 17 Jan 2020 22:32:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kcRXJ0d6_f9g; Fri, 17 Jan 2020 22:32:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 64D1D8693C;
	Fri, 17 Jan 2020 22:32:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4E75AC077D;
	Fri, 17 Jan 2020 22:32:24 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C5936C077D
 for <iommu@lists.linux-foundation.org>; Fri, 17 Jan 2020 22:32:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id AE52C84D9F
 for <iommu@lists.linux-foundation.org>; Fri, 17 Jan 2020 22:32:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vq6JbWnlQ6PY for <iommu@lists.linux-foundation.org>;
 Fri, 17 Jan 2020 22:32:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by whitealder.osuosl.org (Postfix) with ESMTPS id C438384C2A
 for <iommu@lists.linux-foundation.org>; Fri, 17 Jan 2020 22:32:22 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jan 2020 14:30:27 -0800
X-IronPort-AV: E=Sophos;i="5.70,331,1574150400"; d="scan'208";a="219052190"
Received: from nsgsw-rhel7p6.lm.intel.com ([10.232.116.83])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jan 2020 14:30:27 -0800
From: Jon Derrick <jonathan.derrick@intel.com>
To: <linux-pci@vger.kernel.org>, Bjorn Helgaas <helgaas@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH v4 0/7] Clean up VMD DMA Map Ops
Date: Fri, 17 Jan 2020 09:27:22 -0700
Message-Id: <1579278449-174098-1-git-send-email-jonathan.derrick@intel.com>
X-Mailer: git-send-email 1.8.3.1
Cc: iommu@lists.linux-foundation.org, Keith Busch <kbusch@kernel.org>,
 David Woodhouse <dwmw2@infradead.org>, Christoph Hellwig <hch@lst.de>,
 Jon Derrick <jonathan.derrick@intel.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

v3 Set: https://lore.kernel.org/linux-iommu/20200113181742.GA27623@e121166-lin.cambridge.arm.com/T/#t
v2 Set: https://lore.kernel.org/linux-iommu/1578580256-3483-1-git-send-email-jonathan.derrick@intel.com/T/#t
v1 Set: https://lore.kernel.org/linux-iommu/20200107134125.GD30750@8bytes.org/T/#t

VMD currently works with VT-d enabled by pointing DMA and IOMMU actions at the
VMD endpoint. The problem with this approach is that the VMD endpoint's
device-specific attributes, such as the DMA Mask Bits, are used instead of the
child device's attributes.

This set cleans up VMD by removing the override that redirects DMA map
operations to the VMD endpoint. Instead it introduces a new DMA alias mechanism
into the existing DMA alias infrastructure. This new DMA alias mechanism allows
an architecture-specific pci_real_dma_dev() function to provide a pointer from
a pci_dev to its PCI DMA device, where by default it returns the original
pci_dev.

In addition, this set removes the sanity check that was added to prevent
assigning VMD child devices. By using the DMA alias mechanism, all child
devices are assigned the same IOMMU group as the VMD endpoint. This removes the
need for restricting VMD child devices from assignment, as the whole group
would have to be assigned, requiring unbinding the VMD driver and removing the
child device domain.

v1 added a pointer in struct pci_dev that pointed to the DMA alias' struct
pci_dev and did the necessary DMA alias and IOMMU modifications.

v2 introduced a new weak function to reference the 'Direct DMA Alias', and
removed the need to add a pointer in struct device or pci_dev. Weak functions
are generally frowned upon when it's a single architecture implementation, so I
am open to alternatives.

v3 referenced the pci_dev rather than the struct device for the PCI
'Direct DMA Alias' (pci_direct_dma_alias()). This revision also allowed
pci_for_each_dma_alias() to call any DMA aliases for the Direct DMA alias
device, though I don't expect the VMD endpoint to need intra-bus DMA aliases.

v4 changes the 'Direct DMA Alias' to instead refer to the 'Real DMA Dev', which
either returns the PCI device itself or the PCI DMA device.


Changes from v3:
Uses pci_real_dma_dev() instead of pci_direct_dma_alias()
Split IOMMU enabling, IOMMU VMD sanity check and VMD dma_map_ops cleanup into three patches

Changes from v2:
Uses struct pci_dev for PCI Device 'Direct DMA aliasing' (pci_direct_dma_alias)
Allows pci_for_each_dma_alias to iterate over the alias mask of the 'Direct DMA alias'

Changes from v1:
Removed 1/5 & 2/5 misc fix patches that were merged
Uses Christoph's staging/cleanup patches
Introduce weak function rather than including pointer in struct device or pci_dev.

Based on Bjorn's next:
https://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci.git/log/?h=next

Christoph Hellwig (2):
  x86/PCI: Add a to_pci_sysdata helper
  x86/PCI: Remove X86_DEV_DMA_OPS

Jon Derrick (5):
  x86/PCI: Expose VMD's PCI Device in pci_sysdata
  PCI: Introduce pci_real_dma_dev()
  iommu/vt-d: Use pci_real_dma_dev() for mapping
  iommu/vt-d: Remove VMD child device sanity check
  PCI: vmd: Stop overriding dma_map_ops

 arch/x86/Kconfig               |   3 -
 arch/x86/include/asm/device.h  |  10 ---
 arch/x86/include/asm/pci.h     |  31 ++++-----
 arch/x86/pci/common.c          |  48 +++----------
 drivers/iommu/intel-iommu.c    |  15 ++--
 drivers/pci/controller/Kconfig |   1 -
 drivers/pci/controller/vmd.c   | 152 +----------------------------------------
 drivers/pci/pci.c              |  19 +++++-
 drivers/pci/search.c           |   6 ++
 include/linux/pci.h            |   1 +
 10 files changed, 58 insertions(+), 228 deletions(-)

-- 
1.8.3.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
