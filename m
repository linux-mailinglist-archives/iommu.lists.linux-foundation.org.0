Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C95F329ECE
	for <lists.iommu@lfdr.de>; Tue,  2 Mar 2021 13:36:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C7F16071D;
	Tue,  2 Mar 2021 12:36:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NYWpBAZu4JYB; Tue,  2 Mar 2021 12:36:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE4516F64A;
	Tue,  2 Mar 2021 12:36:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B08A0C0001;
	Tue,  2 Mar 2021 12:36:51 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B4C67C0001
 for <iommu@lists.linux-foundation.org>; Tue,  2 Mar 2021 12:36:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A33F443118
 for <iommu@lists.linux-foundation.org>; Tue,  2 Mar 2021 12:36:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PkAfRbi1sJpg for <iommu@lists.linux-foundation.org>;
 Tue,  2 Mar 2021 12:36:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 74ED7430A5
 for <iommu@lists.linux-foundation.org>; Tue,  2 Mar 2021 12:36:48 +0000 (UTC)
IronPort-SDR: LnIBCZtBIu2IPTvNmnSaWsIjI6/HsL2Ls5iw5/p8O9OffIL7XRw4bMjMeOdc2u/TZ/yalTBHS5
 XuDElw4dwz6w==
X-IronPort-AV: E=McAfee;i="6000,8403,9910"; a="174429424"
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; d="scan'208";a="174429424"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 04:36:47 -0800
IronPort-SDR: /P+Qc/iEKgAQks6WSjR7kEqlqYljDwvgWcGDkQl4X/J8RtV0FH1TNS4nMoqLEy2E0DNSOVfSYm
 MbkLpwsVgXMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; d="scan'208";a="427471978"
Received: from yiliu-dev.bj.intel.com (HELO dual-ub.bj.intel.com)
 ([10.238.156.135])
 by fmsmga004.fm.intel.com with ESMTP; 02 Mar 2021 04:36:42 -0800
From: Liu Yi L <yi.l.liu@intel.com>
To: alex.williamson@redhat.com, eric.auger@redhat.com,
 baolu.lu@linux.intel.com, joro@8bytes.org
Subject: [Patch v8 00/10] vfio: expose virtual Shared Virtual Addressing to VMs
Date: Wed,  3 Mar 2021 04:35:35 +0800
Message-Id: <20210302203545.436623-1-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: jean-philippe@linaro.org, kevin.tian@intel.com, ashok.raj@intel.com,
 kvm@vger.kernel.org, stefanha@gmail.com, jun.j.tian@intel.com,
 iommu@lists.linux-foundation.org, vivek.gautam@arm.com, yi.y.sun@intel.com,
 jgg@nvidia.com, Lingshan.Zhu@intel.com, jasowang@redhat.com, hao.wu@intel.com
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

Shared Virtual Addressing (SVA), a.k.a, Shared Virtual Memory (SVM) on
Intel platforms allows address space sharing between device DMA and
applications. SVA can reduce programming complexity and enhance security.

This VFIO series is intended to expose SVA usage to VMs. i.e. Sharing
guest application address space with passthru devices. This is called
vSVA in this series. The whole vSVA enabling requires QEMU/VFIO/IOMMU
changes. For IOMMU and QEMU changes, they are in separate series (listed
in the "Related series").

The high-level architecture for SVA virtualization is as below, the key
design of vSVA support is to utilize the dual-stage IOMMU translation (
also known as IOMMU nesting translation) capability in host IOMMU.


    .-------------.  .---------------------------.
    |   vIOMMU    |  | Guest process CR3, FL only|
    |             |  '---------------------------'
    .----------------/
    | PASID Entry |--- PASID cache flush -
    '-------------'                       |
    |             |                       V
    |             |                CR3 in GPA
    '-------------'
Guest
------| Shadow |--------------------------|--------
      v        v                          v
Host
    .-------------.  .----------------------.
    |   pIOMMU    |  | Bind FL for GVA-GPA  |
    |             |  '----------------------'
    .----------------/  |
    | PASID Entry |     V (Nested xlate)
    '----------------\.------------------------------.
    |             |   |SL for GPA-HPA, default domain|
    |             |   '------------------------------'
    '-------------'
Where:
 - FL = First level/stage one page tables
 - SL = Second level/stage two page tables

This patch series has been updated regards to the disscussion around PASID
allocation in v7 [1]. This series has removed the PASID allocation, and
adapted to the /dev/ioasid solution [2]. Therefore the patches in this series
has been re-ordered. And the Patch Overview is as below:

 1. reports IOMMU nesting info to userspace ( patch 0001, 0002, 0003, 0010)
 2. vfio support for binding guest page table to host (patch 0004)
 3. vfio support for IOMMU cache invalidation from VMs (patch 0005)
 4. vfio support for vSVA usage on IOMMU-backed mdevs (patch 0006, 0007)
 5. expose PASID capability to VM (patch 0008)
 6. add doc for VFIO dual stage control (patch 0009)

The complete vSVA kernel upstream patches are divided into three phases:
    1. Common APIs and PCI device direct assignment
    2. IOMMU-backed Mediated Device assignment
    3. Page Request Services (PRS) support

This patchset is aiming for the phase 1 and phase 2. And it has dependency on IOASID
extension from Jacobd Pan [3]. Complete set for current vSVA kernel and QEMU can be
found in [4] and [5].

[1] https://lore.kernel.org/kvm/DM5PR11MB14351121729909028D6EB365C31D0@DM5PR11MB1435.namprd11.prod.outlook.com/
[2] https://lore.kernel.org/linux-iommu/1614463286-97618-19-git-send-email-jacob.jun.pan@linux.intel.com/
[3] https://lore.kernel.org/linux-iommu/1614463286-97618-1-git-send-email-jacob.jun.pan@linux.intel.com/
[4] https://github.com/jacobpan/linux/tree/vsva-linux-5.12-rc1-v8
[5] https://github.com/luxis1999/qemu/tree/vsva_5.12_rc1_qemu_rfcv11

Regards,
Yi Liu

Changelog:
	- Patch v7 -> Patch v8:
	  a) removed the PASID allocation out of this series, it is covered by below patch:
	     https://lore.kernel.org/linux-iommu/1614463286-97618-19-git-send-email-jacob.jun.pan@linux.intel.com/
	  Patch v7: https://lore.kernel.org/kvm/1599734733-6431-1-git-send-email-yi.l.liu@intel.com/

	- Patch v6 -> Patch v7:
	  a) drop [PATCH v6 01/15] of v6 as it's merged by Alex.
	  b) rebase on Jacob's v8 IOMMU uapi enhancement and v2 IOASID extension patchset.
	  c) Address comments against v6 from Alex and Eric.
	  Patch v6: https://lore.kernel.org/kvm/1595917664-33276-1-git-send-email-yi.l.liu@intel.com/

	- Patch v5 -> Patch v6:
	  a) Address comments against v5 from Eric.
	  b) rebase on Jacob's v6 IOMMU uapi enhancement
	  Patch v5: https://lore.kernel.org/kvm/1594552870-55687-1-git-send-email-yi.l.liu@intel.com/

	- Patch v4 -> Patch v5:
	  a) Address comments against v4
	  Patch v4: https://lore.kernel.org/kvm/1593861989-35920-1-git-send-email-yi.l.liu@intel.com/

	- Patch v3 -> Patch v4:
	  a) Address comments against v3
	  b) Add rb from Stefan on patch 14/15
	  Patch v3: https://lore.kernel.org/kvm/1592988927-48009-1-git-send-email-yi.l.liu@intel.com/

	- Patch v2 -> Patch v3:
	  a) Rebase on top of Jacob's v3 iommu uapi patchset
	  b) Address comments from Kevin and Stefan Hajnoczi
	  c) Reuse DOMAIN_ATTR_NESTING to get iommu nesting info
	  d) Drop [PATCH v2 07/15] iommu/uapi: Add iommu_gpasid_unbind_data
	  Patch v2: https://lore.kernel.org/kvm/1591877734-66527-1-git-send-email-yi.l.liu@intel.com/

	- Patch v1 -> Patch v2:
	  a) Refactor vfio_iommu_type1_ioctl() per suggestion from Christoph
	     Hellwig.
	  b) Re-sequence the patch series for better bisect support.
	  c) Report IOMMU nesting cap info in detail instead of a format in
	     v1.
	  d) Enforce one group per nesting type container for vfio iommu type1
	     driver.
	  e) Build the vfio_mm related code from vfio.c to be a separate
	     vfio_pasid.ko.
	  f) Add PASID ownership check in IOMMU driver.
	  g) Adopted to latest IOMMU UAPI design. Removed IOMMU UAPI version
	     check. Added iommu_gpasid_unbind_data for unbind requests from
	     userspace.
	  h) Define a single ioctl:VFIO_IOMMU_NESTING_OP for bind/unbind_gtbl
	     and cahce_invld.
	  i) Document dual stage control in vfio.rst.
	  Patch v1: https://lore.kernel.org/kvm/1584880325-10561-1-git-send-email-yi.l.liu@intel.com/

	- RFC v3 -> Patch v1:
	  a) Address comments to the PASID request(alloc/free) path
	  b) Report PASID alloc/free availabitiy to user-space
	  c) Add a vfio_iommu_type1 parameter to support pasid quota tuning
	  d) Adjusted to latest ioasid code implementation. e.g. remove the
	     code for tracking the allocated PASIDs as latest ioasid code
	     will track it, VFIO could use ioasid_free_set() to free all
	     PASIDs.
	  RFC v3: https://lore.kernel.org/kvm/1580299912-86084-1-git-send-email-yi.l.liu@intel.com/

	- RFC v2 -> v3:
	  a) Refine the whole patchset to fit the roughly parts in this series
	  b) Adds complete vfio PASID management framework. e.g. pasid alloc,
	  free, reclaim in VM crash/down and per-VM PASID quota to prevent
	  PASID abuse.
	  c) Adds IOMMU uAPI version check and page table format check to ensure
	  version compatibility and hardware compatibility.
	  d) Adds vSVA vfio support for IOMMU-backed mdevs.
	  RFC v2: https://lore.kernel.org/kvm/1571919983-3231-1-git-send-email-yi.l.liu@intel.com/

	- RFC v1 -> v2:
	  Dropped vfio: VFIO_IOMMU_ATTACH/DETACH_PASID_TABLE.
	  RFC v1: https://lore.kernel.org/kvm/1562324772-3084-1-git-send-email-yi.l.liu@intel.com/

---
Eric Auger (1):
  vfio: Document dual stage control

Liu Yi L (8):
  iommu: Report domain nesting info
  iommu/smmu: Report empty domain nesting info
  vfio/type1: Report iommu nesting info to userspace
  vfio/type1: Support binding guest page tables to PASID
  vfio/type1: Allow invalidating first-level/stage IOMMU cache
  vfio/type1: Add vSVA support for IOMMU-backed mdevs
  vfio/pci: Expose PCIe PASID capability to userspace
  iommu/vt-d: Support reporting nesting capability info

Yi Sun (1):
  iommu: Pass domain to sva_unbind_gpasid()

 Documentation/driver-api/vfio.rst           |  77 +++++
 Documentation/userspace-api/iommu.rst       |   5 +-
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c |  29 +-
 drivers/iommu/arm/arm-smmu/arm-smmu.c       |  29 +-
 drivers/iommu/intel/cap_audit.h             |   7 +
 drivers/iommu/intel/iommu.c                 |  68 ++++-
 drivers/iommu/intel/svm.c                   |   3 +-
 drivers/iommu/iommu.c                       |   2 +-
 drivers/vfio/pci/vfio_pci_config.c          |   2 +-
 drivers/vfio/vfio_iommu_type1.c             | 321 +++++++++++++++++++-
 include/linux/intel-iommu.h                 |   3 +-
 include/linux/iommu.h                       |   3 +-
 include/uapi/linux/iommu.h                  |  72 +++++
 include/uapi/linux/vfio.h                   |  57 ++++
 14 files changed, 651 insertions(+), 27 deletions(-)

-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
