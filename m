Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 6872012DD67
	for <lists.iommu@lfdr.de>; Wed,  1 Jan 2020 03:27:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1055B870C7;
	Wed,  1 Jan 2020 02:27:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i3gn8UGyLJpa; Wed,  1 Jan 2020 02:27:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id C680787079;
	Wed,  1 Jan 2020 02:27:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C2429C077D;
	Wed,  1 Jan 2020 02:27:08 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 97BD6C18DC
 for <iommu@lists.linux-foundation.org>; Wed,  1 Jan 2020 02:27:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 8D84F204D0
 for <iommu@lists.linux-foundation.org>; Wed,  1 Jan 2020 02:27:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W-FYjZGvi8i9 for <iommu@lists.linux-foundation.org>;
 Wed,  1 Jan 2020 02:27:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by silver.osuosl.org (Postfix) with ESMTPS id 9F51C20014
 for <iommu@lists.linux-foundation.org>; Wed,  1 Jan 2020 02:27:01 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Dec 2019 18:27:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,381,1571727600"; d="scan'208";a="221068054"
Received: from unknown (HELO nsgsw-rhel7p6.lm.intel.com) ([10.232.116.83])
 by orsmga006.jf.intel.com with ESMTP; 31 Dec 2019 18:27:00 -0800
From: Jon Derrick <jonathan.derrick@intel.com>
To: <iommu@lists.linux-foundation.org>,
	<linux-pci@vger.kernel.org>
Subject: [RFC 0/5] Clean up VMD DMA Map Ops
Date: Tue, 31 Dec 2019 13:24:18 -0700
Message-Id: <1577823863-3303-1-git-send-email-jonathan.derrick@intel.com>
X-Mailer: git-send-email 1.8.3.1
Cc: Bjorn Helgaas <helgaas@kernel.org>, Keith Busch <kbusch@kernel.org>,
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

Inspired by Christoph's last set:
https://lkml.org/lkml/2019/8/28/667

VMD currently works with VT-d enabled by pointing DMA and IOMMU actions at the
VMD endpoint. The problem with this approach is that the VMD endpoint's
device-specific attributes, such as the dma mask, are used instead.

This set cleans up VMD by removing the override that redirects dma map
operations to the VMD endpoint. Instead it introduces a new dma alias mechanism
into the existing dma alias infrastructure.

Patch 1 and 2 are miscellaneous fixes discovered during development.
Patch 1 is ready, but 2 likely doesn't go far enough for proper teardown on
addition failure.

Jon Derrick (5):
  iommu: Remove device link to group on failure
  iommu/vt-d: Unlink device if failed to add to group
  x86/PCI: Expose VMD's device in pci_sysdata
  PCI: vmd: Stop overriding dma_map_ops
  x86/PCI: Remove unused X86_DEV_DMA_OPS

 arch/x86/Kconfig               |   3 -
 arch/x86/include/asm/device.h  |  10 ---
 arch/x86/include/asm/pci.h     |   4 +-
 arch/x86/pci/common.c          |  44 ++----------
 drivers/iommu/intel-iommu.c    |  26 ++++---
 drivers/iommu/iommu.c          |   1 +
 drivers/pci/controller/Kconfig |   1 -
 drivers/pci/controller/vmd.c   | 152 +----------------------------------------
 drivers/pci/pci.c              |   4 +-
 drivers/pci/search.c           |   6 ++
 include/linux/pci.h            |   1 +
 11 files changed, 37 insertions(+), 215 deletions(-)

-- 
1.8.3.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
