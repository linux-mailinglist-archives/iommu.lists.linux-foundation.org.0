Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB5018D40F
	for <lists.iommu@lfdr.de>; Fri, 20 Mar 2020 17:20:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1993D88B33;
	Fri, 20 Mar 2020 16:20:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y1q0OvjGjb7Q; Fri, 20 Mar 2020 16:20:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2677288B57;
	Fri, 20 Mar 2020 16:20:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 10AB0C07FF;
	Fri, 20 Mar 2020 16:20:00 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8805DC07FF
 for <iommu@lists.linux-foundation.org>; Fri, 20 Mar 2020 16:19:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 7F7A08836E
 for <iommu@lists.linux-foundation.org>; Fri, 20 Mar 2020 16:19:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6HzwmbAFB1C9 for <iommu@lists.linux-foundation.org>;
 Fri, 20 Mar 2020 16:19:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [63.128.21.74])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 3DBD88832D
 for <iommu@lists.linux-foundation.org>; Fri, 20 Mar 2020 16:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584721196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=S/DXlI3P2nbMXd69cOy84aTZ0SIJNFmNoyde3hKd4Ew=;
 b=ZwmBPFyi7NNjhf//bvEydqBYoSezMeP+s4B07iPZw7igmuLQU7L9csoOkHcnM9Dg6DATFf
 V4fH7WflmmehUYjwMu4Eloi5VxXuPfEFYwL2rpCU3SANUyIdEbIaEZmN25GqnI1WACMyhT
 N7FaZ4GzBaMmCkK1/jFf/CX9HEoQArM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-126-g-dTOvKOMhqkiKp88uLICg-1; Fri, 20 Mar 2020 12:19:52 -0400
X-MC-Unique: g-dTOvKOMhqkiKp88uLICg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 44A79934C59;
 Fri, 20 Mar 2020 16:19:25 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-113-142.ams2.redhat.com [10.36.113.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 487BA60BFB;
 Fri, 20 Mar 2020 16:19:13 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, kvmarm@lists.cs.columbia.edu, joro@8bytes.org,
 alex.williamson@redhat.com, jacob.jun.pan@linux.intel.com,
 yi.l.liu@intel.com, jean-philippe.brucker@arm.com, will.deacon@arm.com,
 robin.murphy@arm.com
Subject: [PATCH v10 00/11] SMMUv3 Nested Stage Setup (VFIO part)
Date: Fri, 20 Mar 2020 17:19:00 +0100
Message-Id: <20200320161911.27494-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: marc.zyngier@arm.com, peter.maydell@linaro.org
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

This series brings the VFIO part of HW nested paging support
in the SMMUv3.

This is a rebase on top of Will's arm-smmu-updates branch
(git://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git tags/arm-smmu-updates)

This is basically a resend of v9 as patches still applied.

This work has been stalled since Plumber 2019. Since then
some users expressed interest in that work and tested v9:
- https://patchwork.kernel.org/cover/11039995/#23012381
- https://patchwork.kernel.org/cover/11039995/#23197235

The series depends on:
[PATCH v10 00/13] SMMUv3 Nested Stage Setup (IOMMU part)

3 new IOCTLs are introduced that allow the userspace to
1) pass the guest stage 1 configuration
2) pass stage 1 MSI bindings
3) invalidate stage 1 related caches

They map onto the related new IOMMU API functions.

We introduce the capability to register specific interrupt
indexes (see [1]). A new DMA_FAULT interrupt index allows to register
an eventfd to be signaled whenever a stage 1 related fault
is detected at physical level. Also a specific region allows
to expose the fault records to the user space.

Best Regards

Eric

This series can be found at:
https://github.com/eauger/linux/tree/will-arm-smmu-updates-2stage-v10

It series includes Tina's patch steming from
[1] "[RFC PATCH v2 1/3] vfio: Use capability chains to handle device
specific irq" plus patches originally contributed by Yi.

History:

v9 -> v10
- rebase on top of 5.6.0-rc3 (no change versus v9)

v8 -> v9:
- introduce specific irq framework
- single fault region
- iommu_unregister_device_fault_handler failure case not handled
  yet.

v7 -> v8:
- rebase on top of v5.2-rc1 and especially
  8be39a1a04c1  iommu/arm-smmu-v3: Add a master->domain pointer
- dynamic alloc of s1_cfg/s2_cfg
- __arm_smmu_tlb_inv_asid/s1_range_nosync
- check there is no HW MSI regions
- asid invalidation using pasid extended struct (change in the uapi)
- add s1_live/s2_live checks
- move check about support of nested stages in domain finalise
- fixes in error reporting according to the discussion with Robin
- reordered the patches to have first iommu/smmuv3 patches and then
  VFIO patches

v6 -> v7:
- removed device handle from bind/unbind_guest_msi
- added "iommu/smmuv3: Nested mode single MSI doorbell per domain
  enforcement"
- added few uapi comments as suggested by Jean, Jacop and Alex

v5 -> v6:
- Fix compilation issue when CONFIG_IOMMU_API is unset

v4 -> v5:
- fix bug reported by Vincent: fault handler unregistration now happens in
  vfio_pci_release
- IOMMU_FAULT_PERM_* moved outside of struct definition + small
  uapi changes suggested by Kean-Philippe (except fetch_addr)
- iommu: introduce device fault report API: removed the PRI part.
- see individual logs for more details
- reset the ste abort flag on detach

v3 -> v4:
- took into account Alex, jean-Philippe and Robin's comments on v3
- rework of the smmuv3 driver integration
- add tear down ops for msi binding and PASID table binding
- fix S1 fault propagation
- put fault reporting patches at the beginning of the series following
  Jean-Philippe's request
- update of the cache invalidate and fault API uapis
- VFIO fault reporting rework with 2 separate regions and one mmappable
  segment for the fault queue
- moved to PATCH

v2 -> v3:
- When registering the S1 MSI binding we now store the device handle. This
  addresses Robin's comment about discimination of devices beonging to
  different S1 groups and using different physical MSI doorbells.
- Change the fault reporting API: use VFIO_PCI_DMA_FAULT_IRQ_INDEX to
  set the eventfd and expose the faults through an mmappable fault region

v1 -> v2:
- Added the fault reporting capability
- asid properly passed on invalidation (fix assignment of multiple
  devices)
- see individual change logs for more info


Eric Auger (8):
  vfio: VFIO_IOMMU_SET_MSI_BINDING
  vfio/pci: Add VFIO_REGION_TYPE_NESTED region type
  vfio/pci: Register an iommu fault handler
  vfio/pci: Allow to mmap the fault queue
  vfio: Add new IRQ for DMA fault reporting
  vfio/pci: Add framework for custom interrupt indices
  vfio/pci: Register and allow DMA FAULT IRQ signaling
  vfio: Document nested stage control

Liu, Yi L (2):
  vfio: VFIO_IOMMU_SET_PASID_TABLE
  vfio: VFIO_IOMMU_CACHE_INVALIDATE

Tina Zhang (1):
  vfio: Use capability chains to handle device specific irq

 Documentation/driver-api/vfio.rst   |  77 ++++++++
 drivers/vfio/pci/vfio_pci.c         | 283 ++++++++++++++++++++++++++--
 drivers/vfio/pci/vfio_pci_intrs.c   |  62 ++++++
 drivers/vfio/pci/vfio_pci_private.h |  24 +++
 drivers/vfio/pci/vfio_pci_rdwr.c    |  45 +++++
 drivers/vfio/vfio_iommu_type1.c     | 166 ++++++++++++++++
 include/uapi/linux/vfio.h           | 109 ++++++++++-
 7 files changed, 747 insertions(+), 19 deletions(-)

-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
