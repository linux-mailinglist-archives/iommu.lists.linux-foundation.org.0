Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 073A74BAEBC
	for <lists.iommu@lfdr.de>; Fri, 18 Feb 2022 01:58:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 94B1C41EC6;
	Fri, 18 Feb 2022 00:58:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mZn8HOEK2UGJ; Fri, 18 Feb 2022 00:58:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 3C65641ECF;
	Fri, 18 Feb 2022 00:58:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 15901C0039;
	Fri, 18 Feb 2022 00:58:24 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 04677C000B
 for <iommu@lists.linux-foundation.org>; Fri, 18 Feb 2022 00:58:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F1C3041717
 for <iommu@lists.linux-foundation.org>; Fri, 18 Feb 2022 00:58:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=intel.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 54wsLyPHftQw for <iommu@lists.linux-foundation.org>;
 Fri, 18 Feb 2022 00:58:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D4522408E3
 for <iommu@lists.linux-foundation.org>; Fri, 18 Feb 2022 00:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645145900; x=1676681900;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uf+I8UtnZ7Y4AV3dujG6YDVo/YCtBNEl6LPfYyzEmWk=;
 b=OB9dWQ7oTKoNT8sV0tUlkuNDQh5ixCxvWNRdkps74J86XX6kVsMBH9Rf
 jAmLRfg5Eb0VnOaOMnQ2G8HFkNCT0h0RAE/ICuAtY5QnMHu5SVZ0FUf4t
 JGJFfP8vvJGMElKPI8BCDnv+GNf2tPbFO0VLXChKRAlBeg2jz6GyD52Mt
 lo4Zjy6Rmewu5PzkbSn5YXtsatNUqtRMnC9KL80O3Ggni/meRDRaKWAha
 gky25zpt60inkzWMNcpHS+GTHQ7p9/ogr8+p/pxwOPfE2WXf+XPfi3pNG
 PpaUjAYu8+LzcLZcIczC3c4qEtPSlvcyUXSoTgtAbHk8xviOBrqujxT9K Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="231001064"
X-IronPort-AV: E=Sophos;i="5.88,377,1635231600"; d="scan'208";a="231001064"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 16:56:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,377,1635231600"; d="scan'208";a="637490503"
Received: from allen-box.sh.intel.com ([10.239.159.118])
 by orsmga004.jf.intel.com with ESMTP; 17 Feb 2022 16:56:46 -0800
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Joerg Roedel <joro@8bytes.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Christoph Hellwig <hch@infradead.org>, Kevin Tian <kevin.tian@intel.com>,
 Ashok Raj <ashok.raj@intel.com>
Subject: [PATCH v6 00/11] Fix BUG_ON in vfio_iommu_group_notifier()
Date: Fri, 18 Feb 2022 08:55:10 +0800
Message-Id: <20220218005521.172832-1-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: kvm@vger.kernel.org, rafael@kernel.org, David Airlie <airlied@linux.ie>,
 linux-pci@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>, Dmitry Osipenko <digetx@gmail.com>,
 Will Deacon <will@kernel.org>, Stuart Yoder <stuyoder@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chaitanya Kulkarni <kch@nvidia.com>,
 Dan Williams <dan.j.williams@intel.com>, Cornelia Huck <cohuck@redhat.com>,
 linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>,
 iommu@lists.linux-foundation.org, Jacob jun Pan <jacob.jun.pan@intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Robin Murphy <robin.murphy@arm.com>
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

Hi folks,

The iommu group is the minimal isolation boundary for DMA. Devices in
a group can access each other's MMIO registers via peer to peer DMA
and also need share the same I/O address space.

Once the I/O address space is assigned to user control it is no longer
available to the dma_map* API, which effectively makes the DMA API
non-working.

Second, userspace can use DMA initiated by a device that it controls
to access the MMIO spaces of other devices in the group. This allows
userspace to indirectly attack any kernel owned device and it's driver.

Therefore groups must either be entirely under kernel control or
userspace control, never a mixture. Unfortunately some systems have
problems with the granularity of groups and there are a couple of
important exceptions:

 - pci_stub allows the admin to block driver binding on a device and
   make it permanently shared with userspace. Since PCI stub does not
   do DMA it is safe, however the admin must understand that using
   pci_stub allows userspace to attack whatever device it was bound
   it.

 - PCI bridges are sometimes included in groups. Typically PCI bridges
   do not use DMA, and generally do not have MMIO regions.

Generally any device that does not have any MMIO registers is a
possible candidate for an exception.

Currently vfio adopts a workaround to detect violations of the above
restrictions by monitoring the driver core BOUND event, and hardwiring
the above exceptions. Since there is no way for vfio to reject driver
binding at this point, BUG_ON() is triggered if a violation is
captured (kernel driver BOUND event on a group which already has some
devices assigned to userspace). Aside from the bad user experience
this opens a way for root userspace to crash the kernel, even in high
integrity configurations, by manipulating the module binding and
triggering the BUG_ON.

This series solves this problem by making the user/kernel ownership a
core concept at the IOMMU layer. The driver core enforces kernel
ownership while drivers are bound and violations now result in a error
codes during probe, not BUG_ON failures.

Patch partitions:
  [PATCH 1-4]: Detect DMA ownership conflicts during driver binding;
  [PATCH 5-7]: Add security context management for assigned devices;
  [PATCH 8-11]: Various cleanups.

This is also part one of three initial series for IOMMUFD:
 * Move IOMMU Group security into the iommu layer
 - Generic IOMMUFD implementation
 - VFIO ability to consume IOMMUFD

Change log:
v1: initial post
  - https://lore.kernel.org/linux-iommu/20211115020552.2378167-1-baolu.lu@linux.intel.com/

v2:
  - https://lore.kernel.org/linux-iommu/20211128025051.355578-1-baolu.lu@linux.intel.com/

  - Move kernel dma ownership auto-claiming from driver core to bus
    callback. [Greg/Christoph/Robin/Jason]
    https://lore.kernel.org/linux-iommu/20211115020552.2378167-1-baolu.lu@linux.intel.com/T/#m153706912b770682cb12e3c28f57e171aa1f9d0c

  - Code and interface refactoring for iommu_set/release_dma_owner()
    interfaces. [Jason]
    https://lore.kernel.org/linux-iommu/20211115020552.2378167-1-baolu.lu@linux.intel.com/T/#mea70ed8e4e3665aedf32a5a0a7db095bf680325e

  - [NEW]Add new iommu_attach/detach_device_shared() interfaces for
    multiple devices group. [Robin/Jason]
    https://lore.kernel.org/linux-iommu/20211115020552.2378167-1-baolu.lu@linux.intel.com/T/#mea70ed8e4e3665aedf32a5a0a7db095bf680325e

  - [NEW]Use iommu_attach/detach_device_shared() in drm/tegra drivers.

  - Refactoring and description refinement.

v3:
  - https://lore.kernel.org/linux-iommu/20211206015903.88687-1-baolu.lu@linux.intel.com/

  - Rename bus_type::dma_unconfigure to bus_type::dma_cleanup. [Greg]
    https://lore.kernel.org/linux-iommu/c3230ace-c878-39db-1663-2b752ff5384e@linux.intel.com/T/#m6711e041e47cb0cbe3964fad0a3466f5ae4b3b9b

  - Avoid _platform_dma_configure for platform_bus_type::dma_configure.
    [Greg]
    https://lore.kernel.org/linux-iommu/c3230ace-c878-39db-1663-2b752ff5384e@linux.intel.com/T/#m43fc46286611aa56a5c0eeaad99d539e5519f3f6

  - Patch "0012-iommu-Add-iommu_at-de-tach_device_shared-for-mult.patch"
    and "0018-drm-tegra-Use-the-iommu-dma_owner-mechanism.patch" have
    been tested by Dmitry Osipenko <digetx@gmail.com>.

v4:
  - https://lore.kernel.org/linux-iommu/20211217063708.1740334-1-baolu.lu@linux.intel.com/
  - Remove unnecessary tegra->domain chech in the tegra patch. (Jason)
  - Remove DMA_OWNER_NONE. (Joerg)
  - Change refcount to unsigned int. (Christoph)
  - Move mutex lock into group set_dma_owner functions. (Christoph)
  - Add kernel doc for iommu_attach/detach_domain_shared(). (Christoph)
  - Move dma auto-claim into driver core. (Jason/Christoph)

v5:
  - https://lore.kernel.org/linux-iommu/20220104015644.2294354-1-baolu.lu@linux.intel.com/
  - Move kernel dma ownership auto-claiming from driver core to bus
    callback. (Greg)
  - Refactor the iommu interfaces to make them more specific.
    (Jason/Robin)
  - Simplify the dma ownership implementation by removing the owner
    type. (Jason)
  - Commit message refactoring for PCI drivers. (Bjorn)
  - Move iommu_attach/detach_device() improvement patches into another
    series as there are a lot of code refactoring and cleanup staffs
    in various device drivers.

v6:
  - Refine comments and commit mesages.
  - Rename iommu_group_set_dma_owner() to iommu_group_claim_dma_owner().
  - Rename iommu_device_use/unuse_kernel_dma() to
    iommu_device_use/unuse_default_domain().
  - Remove unnecessary EXPORT_SYMBOL_GPL.
  - Change flag name from no_kernel_api_dma to driver_managed_dma.
  - Merge 4 "Add driver dma ownership management" patches into single
    one.

This is based on next branch of linux-iommu tree:
https://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git
and also available on github:
https://github.com/LuBaolu/intel-iommu/commits/iommu-dma-ownership-v6

Best regards,
baolu

Jason Gunthorpe (1):
  vfio: Delete the unbound_list

Lu Baolu (10):
  iommu: Add dma ownership management interfaces
  driver core: Add dma_cleanup callback in bus_type
  amba: Stop sharing platform_dma_configure()
  bus: platform,amba,fsl-mc,PCI: Add device DMA ownership management
  PCI: pci_stub: Set driver_managed_dma
  PCI: portdrv: Set driver_managed_dma
  vfio: Set DMA ownership for VFIO devices
  vfio: Remove use of vfio_group_viable()
  vfio: Remove iommu group notifier
  iommu: Remove iommu group changes notifier

 include/linux/amba/bus.h              |   8 +
 include/linux/device/bus.h            |   3 +
 include/linux/fsl/mc.h                |   8 +
 include/linux/iommu.h                 |  54 +++---
 include/linux/pci.h                   |   8 +
 include/linux/platform_device.h       |  10 +-
 drivers/amba/bus.c                    |  39 +++-
 drivers/base/dd.c                     |   5 +
 drivers/base/platform.c               |  23 ++-
 drivers/bus/fsl-mc/fsl-mc-bus.c       |  26 ++-
 drivers/iommu/iommu.c                 | 233 ++++++++++++++++--------
 drivers/pci/pci-driver.c              |  21 +++
 drivers/pci/pci-stub.c                |   1 +
 drivers/pci/pcie/portdrv_pci.c        |   2 +
 drivers/vfio/fsl-mc/vfio_fsl_mc.c     |   1 +
 drivers/vfio/pci/vfio_pci.c           |   1 +
 drivers/vfio/platform/vfio_amba.c     |   1 +
 drivers/vfio/platform/vfio_platform.c |   1 +
 drivers/vfio/vfio.c                   | 245 ++------------------------
 19 files changed, 352 insertions(+), 338 deletions(-)

-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
