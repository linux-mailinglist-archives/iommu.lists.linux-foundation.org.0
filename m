Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 5741925486B
	for <lists.iommu@lfdr.de>; Thu, 27 Aug 2020 17:07:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EAE0686A5D;
	Thu, 27 Aug 2020 15:07:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dQOzVQCH4jMk; Thu, 27 Aug 2020 15:07:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4D94386A33;
	Thu, 27 Aug 2020 15:07:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 27BBFC089E;
	Thu, 27 Aug 2020 15:07:06 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8B3A0C0051
 for <iommu@lists.linux-foundation.org>; Thu, 27 Aug 2020 15:07:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 6A8C920763
 for <iommu@lists.linux-foundation.org>; Thu, 27 Aug 2020 15:07:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ltMifwY6VexO for <iommu@lists.linux-foundation.org>;
 Thu, 27 Aug 2020 15:07:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by silver.osuosl.org (Postfix) with ESMTPS id 9D56D203B4
 for <iommu@lists.linux-foundation.org>; Thu, 27 Aug 2020 15:07:00 +0000 (UTC)
IronPort-SDR: 6REVB8mufcda6dIYWADBZ6cjBzL5OvQ+Zi2VST1Ap8TO6IXNU/LQLnjtk/CRzEeq+zEB7FrJnF
 wuuZ60iDk7ww==
X-IronPort-AV: E=McAfee;i="6000,8403,9726"; a="144175668"
X-IronPort-AV: E=Sophos;i="5.76,359,1592895600"; d="scan'208";a="144175668"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2020 08:06:58 -0700
IronPort-SDR: 6bpsNRwbBa8hDXesEvRdw4u9jyb9Xo630cD/eYkcft8/Wov3gCis+TgTdFX1ui+NSNjvX+rvgn
 BSX6oOu++SvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,359,1592895600"; d="scan'208";a="332212840"
Received: from romley-ivt3.sc.intel.com ([172.25.110.60])
 by fmsmga002.fm.intel.com with ESMTP; 27 Aug 2020 08:06:58 -0700
From: Fenghua Yu <fenghua.yu@intel.com>
To: "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>, "H Peter Anvin" <hpa@zytor.com>,
 "Andy Lutomirski" <luto@kernel.org>,
 "Jean-Philippe Brucker" <jean-philippe@linaro.org>,
 "Christoph Hellwig" <hch@infradead.org>,
 "Peter Zijlstra" <peterz@infradead.org>,
 "David Woodhouse" <dwmw2@infradead.org>,
 "Lu Baolu" <baolu.lu@linux.intel.com>,
 "Dave Hansen" <dave.hansen@intel.com>, "Tony Luck" <tony.luck@intel.com>,
 "Ashok Raj" <ashok.raj@intel.com>,
 "Jacob Jun Pan" <jacob.jun.pan@intel.com>,
 "Dave Jiang" <dave.jiang@intel.com>, "Sohil Mehta" <sohil.mehta@intel.com>,
 "Ravi V Shankar" <ravi.v.shankar@intel.com>
Subject: [PATCH v7 0/9] x86: tag application address space for devices
Date: Thu, 27 Aug 2020 08:06:25 -0700
Message-Id: <1598540794-132666-1-git-send-email-fenghua.yu@intel.com>
X-Mailer: git-send-email 2.5.0
Cc: Fenghua Yu <fenghua.yu@intel.com>, iommu@lists.linux-foundation.org,
 x86 <x86@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
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

Typical hardware devices require a driver stack to translate application
buffers to hardware addresses, and a kernel-user transition to notify the
hardware of new work. What if both the translation and transition overhead
could be eliminated? This is what Shared Virtual Address (SVA) and ENQCMD
enabled hardware like Data Streaming Accelerator (DSA) aims to achieve.
Applications map portals in their local-address-space and directly submit
work to them using a new instruction.

This series enables ENQCMD and associated management of the new MSR
(MSR_IA32_PASID). This new MSR allows an application address space to be
associated with what the PCIe spec calls a Process Address Space ID (PASID).
This PASID tag is carried along with all requests between applications and
devices and allows devices to interact with the process address space.

SVA and ENQCMD enabled device drivers need this series. The phase 2 DSA
patches with SVA and ENQCMD support was released on the top of this series:
https://lore.kernel.org/patchwork/cover/1244060/

This series only provides simple and basic support for ENQCMD and the MSR:
1. Clean up type definitions (patch 1-2). These patches can be in a
   separate series.
   - Define "pasid" as "u32" consistently
   - Define "flags" as "unsigned int"
2. Explain different various technical terms used in the series (patch 3).
3. Enumerate support for ENQCMD in the processor (patch 4).
4. Handle FPU PASID state and the MSR during context switch (patches 5-6).
5. Define "pasid" in mm_struct (patch 7).
5. Clear PASID state for new mm and forked and cloned thread (patch 8-9).
6. Allocate and free PASID for a process (patch 10).
7. Fix up the PASID MSR in #GP handler when one thread in a process
   executes ENQCMD for the first time (patches 11-12).

This patch series and the DSA phase 2 series are in
https://github.com/intel/idxd-driver/tree/idxd-stage2

References:
1. Detailed information on the ENQCMD/ENQCMDS instructions and the
IA32_PASID MSR can be found in Intel Architecture Instruction Set
Extensions and Future Features Programming Reference:
https://software.intel.com/sites/default/files/managed/c5/15/architecture-instruction-set-extensions-programming-reference.pdf

2. Detailed information on DSA can be found in DSA specification:
https://software.intel.com/en-us/download/intel-data-streaming-accelerator-preliminary-architecture-specification

Chang log:
v7:
- Don't fix up PASID in #GP. Instead, update the PASID MSR by IPI and
  context switch after PASID allocation and free. Inherit PASID from
  parent. (Andy)

v6:
- Change return type to u32 for kfd_pasid_alloc() in patch 1 (Felix)

v5:
- Mark ENQCMD disabled when configured out and use cpu_feature_enabled()
  to simplify the feature checking code in patch 10 and 12 (PeterZ and
  Dave Hansen)
- Add Reviewed-by: Lu Baolu to patch 1, 2, 10, and 12.

v4:
- Define PASID as "u32" instead of "unsigned int" in patch 1, 7, 10, 12.
  (Christoph)
- Drop v3 patch 2 which changes PASID type in ocxl because it's not related
  to x86 and was rejected by ocxl maintainer Frederic Barrat
- A split patch which changes PASID type to u32 in crypto/hisilicon/qm.c
  was released separately to linux-crypto mailing list because it's not
  related to x86 and is a standalone patch:

v3:
- Change names of bind_mm() and unbind_mm() to match to new APIs in
  patch 4 (Baolu)
- Change CONFIG_PCI_PASID to CONFIG_IOMMU_SUPPORT because non-PCI device
  can have PASID in ARM in patch 8 (Jean)
- Add a few sanity checks in __free_pasid() and alloc_pasid() in
  patch 11 (Baolu)
- Add patch 12 to define a new flag "has_valid_pasid" for a task and
  use the flag to identify if the task has a valid PASID MSR (PeterZ)
- Add fpu__pasid_write() to update the MSR in fixup() in patch 13
- Check if mm->pasid can be found in fixup() in patch 13

v2:
- Add patches 1-3 to define "pasid" and "flags" as "unsigned int"
  consistently (Thomas)
  (these 3 patches could be in a separate patch set)
- Add patch 8 to move "pasid" to generic mm_struct (Christoph).
  Jean-Philippe Brucker released a virtually same patch. Upstream only
  needs one of the two.
- Add patch 9 to initialize PASID in a new mm.
- Plus other changes described in each patch (Thomas)

Ashok Raj (1):
  docs: x86: Add documentation for SVA (Shared Virtual Addressing)

Fenghua Yu (7):
  iommu: Change type of pasid to u32
  iommu/vt-d: Change flags type to unsigned int in binding mm
  x86/cpufeatures: Enumerate ENQCMD and ENQCMDS instructions
  x86/msr-index: Define IA32_PASID MSR
  mm: Define pasid in mm
  x86/cpufeatures: Mark ENQCMD as disabled when configured out
  x86/mmu: Allocate/free PASID

Yu-cheng Yu (1):
  x86/fpu/xstate: Add supervisor PASID state for ENQCMD feature

 Documentation/x86/index.rst                   |   1 +
 Documentation/x86/sva.rst                     | 254 ++++++++++++++++++
 arch/x86/include/asm/cpufeatures.h            |   1 +
 arch/x86/include/asm/disabled-features.h      |   9 +-
 arch/x86/include/asm/fpu/api.h                |  12 +
 arch/x86/include/asm/fpu/internal.h           |   2 +
 arch/x86/include/asm/fpu/types.h              |  11 +-
 arch/x86/include/asm/fpu/xstate.h             |   2 +-
 arch/x86/include/asm/msr-index.h              |   3 +
 arch/x86/kernel/cpu/cpuid-deps.c              |   1 +
 arch/x86/kernel/fpu/xstate.c                  |  62 ++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |   4 +-
 .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c    |   2 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v7.c |   2 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v8.c |   2 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c |   2 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h |   2 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c       |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.h       |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c       |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h        |   8 +-
 .../gpu/drm/amd/amdkfd/cik_event_interrupt.c  |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_dbgdev.c       |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_dbgmgr.h       |   2 +-
 .../drm/amd/amdkfd/kfd_device_queue_manager.c |   7 +-
 drivers/gpu/drm/amd/amdkfd/kfd_events.c       |   8 +-
 drivers/gpu/drm/amd/amdkfd/kfd_events.h       |   4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_iommu.c        |   6 +-
 drivers/gpu/drm/amd/amdkfd/kfd_pasid.c        |   4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h         |  20 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c      |   2 +-
 .../gpu/drm/amd/include/kgd_kfd_interface.h   |   2 +-
 drivers/iommu/amd/amd_iommu.h                 |  10 +-
 drivers/iommu/amd/iommu.c                     |  31 +--
 drivers/iommu/amd/iommu_v2.c                  |  20 +-
 drivers/iommu/intel/dmar.c                    |   7 +-
 drivers/iommu/intel/iommu.c                   |   4 +-
 drivers/iommu/intel/pasid.c                   |  31 ++-
 drivers/iommu/intel/pasid.h                   |  24 +-
 drivers/iommu/intel/svm.c                     |  47 +++-
 drivers/iommu/iommu.c                         |   2 +-
 drivers/misc/uacce/uacce.c                    |   2 +-
 include/linux/amd-iommu.h                     |   8 +-
 include/linux/intel-iommu.h                   |  14 +-
 include/linux/intel-svm.h                     |   2 +-
 include/linux/iommu.h                         |  10 +-
 include/linux/mm_types.h                      |   4 +
 include/linux/uacce.h                         |   2 +-
 50 files changed, 531 insertions(+), 150 deletions(-)
 create mode 100644 Documentation/x86/sva.rst

-- 
2.19.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
