Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 122741C08E7
	for <lists.iommu@lfdr.de>; Thu, 30 Apr 2020 23:12:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9D24025265;
	Thu, 30 Apr 2020 21:12:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t9yBEAagN+1u; Thu, 30 Apr 2020 21:12:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 8662225279;
	Thu, 30 Apr 2020 21:12:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 68554C016F;
	Thu, 30 Apr 2020 21:12:17 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7AC13C016F
 for <iommu@lists.linux-foundation.org>; Thu, 30 Apr 2020 21:12:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 54DC525279
 for <iommu@lists.linux-foundation.org>; Thu, 30 Apr 2020 21:12:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gxdgoL24Wg9m for <iommu@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 21:12:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by silver.osuosl.org (Postfix) with ESMTPS id 65ECC25265
 for <iommu@lists.linux-foundation.org>; Thu, 30 Apr 2020 21:12:14 +0000 (UTC)
IronPort-SDR: a8b0Tw9+D9VTN+cpaNcUhoQI31Pq1fjSd67c3ULCA6WtRfDlyFAzPiP5nSMdav8jXzk5uiOokV
 K7RSg0Eh2GPQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2020 14:12:13 -0700
IronPort-SDR: LVHsRMgJ7GdSWX064ocXY72QKgePGf1G+/dA+XVa/E+wyPTuvCryaG2DXe8fDKuW9WtKlwUhjb
 MeYme43Pk+/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,337,1583222400"; d="scan'208";a="460080601"
Received: from jacob-builder.jf.intel.com (HELO jacob-builder) ([10.7.199.155])
 by fmsmga006.fm.intel.com with ESMTP; 30 Apr 2020 14:12:13 -0700
Date: Thu, 30 Apr 2020 14:18:16 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v6 00/25] iommu: Shared Virtual Addressing for SMMUv3
Message-ID: <20200430141816.595b758f@jacob-builder>
In-Reply-To: <20200430143424.2787566-1-jean-philippe@linaro.org>
References: <20200430143424.2787566-1-jean-philippe@linaro.org>
Organization: OTC
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, kevin.tian@intel.com, jgg@ziepe.ca,
 linux-pci@vger.kernel.org, robin.murphy@arm.com, fenghua.yu@intel.com,
 hch@infradead.org, linux-mm@kvack.org, iommu@lists.linux-foundation.org,
 zhangfei.gao@linaro.org, catalin.marinas@arm.com, felix.kuehling@amd.com,
 will@kernel.org, christian.koenig@amd.com,
 linux-arm-kernel@lists.infradead.org
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

On Thu, 30 Apr 2020 16:33:59 +0200
Jean-Philippe Brucker <jean-philippe@linaro.org> wrote:

> Shared Virtual Addressing (SVA) allows to share process page tables
> with devices using the IOMMU, PASIDs and I/O page faults. Add SVA
> support to the Arm SMMUv3 driver.
> 
> Since v5 [1]:
> 
> * Added patches 1-3. Patch 1 adds a PASID field to mm_struct as
>   discussed in [1] and [2]. This is also needed for Intel ENQCMD.
> Patch 2 adds refcounts to IOASID and patch 3 adds a couple of helpers
> to allocate the PASID.
> 
> * Dropped most of iommu-sva.c. After getting rid of io_mm following
>   review of v5, there wasn't enough generic code left to justify the
>   indirect branch overhead of io_mm_ops in the MMU notifiers. I ended
> up with more glue than useful code, and couldn't find an easy way to
> deal with domains in the SMMU driver (we keep PASID tables per domain,
>   while x86 keeps them per device). The direct approach in patch 17 is
>   nicer and a little easier to read. The SMMU driver only gained 160
>   lines, while iommu-sva lost 470 lines.
> 
>   As a result I dropped the MMU notifier patch.
> 
>   Jacob, one upside of this rework is that we now free ioasids in
>   blocking context, which might help with your addition of notifiers
> to ioasid.c
> 
Thanks for the note. It does make notifier much easier, plus the
refcount can alleviate the constraint on ordering.

I guess we don't share mmu notifier code for now :)

> * Simplified io-pgfault a bit, since flush() isn't called from mm exit
>   path anymore.
> 
> * Fixed a bug in patch 17 (don't clear the stall bit when stall is
>   forced).
> 
> You can find the latest version on https://jpbrucker.net/git/linux
> branch sva/current, and sva/zip-devel for the Hisilicon zip
> accelerator.
> 
> [1]
> https://lore.kernel.org/linux-iommu/20200414170252.714402-1-jean-philippe@linaro.org/
> [2]
> https://lore.kernel.org/linux-iommu/1585596788-193989-6-git-send-email-fenghua.yu@intel.com/
> 
> Jean-Philippe Brucker (25):
>   mm: Add a PASID field to mm_struct
>   iommu/ioasid: Add ioasid references
>   iommu/sva: Add PASID helpers
>   iommu: Add a page fault handler
>   iommu/iopf: Handle mm faults
>   arm64: mm: Add asid_gen_match() helper
>   arm64: mm: Pin down ASIDs for sharing mm with devices
>   iommu/io-pgtable-arm: Move some definitions to a header
>   iommu/arm-smmu-v3: Manage ASIDs with xarray
>   arm64: cpufeature: Export symbol read_sanitised_ftr_reg()
>   iommu/arm-smmu-v3: Share process page tables
>   iommu/arm-smmu-v3: Seize private ASID
>   iommu/arm-smmu-v3: Add support for VHE
>   iommu/arm-smmu-v3: Enable broadcast TLB maintenance
>   iommu/arm-smmu-v3: Add SVA feature checking
>   iommu/arm-smmu-v3: Add SVA device feature
>   iommu/arm-smmu-v3: Implement iommu_sva_bind/unbind()
>   iommu/arm-smmu-v3: Hook up ATC invalidation to mm ops
>   iommu/arm-smmu-v3: Add support for Hardware Translation Table Update
>   iommu/arm-smmu-v3: Maintain a SID->device structure
>   dt-bindings: document stall property for IOMMU masters
>   iommu/arm-smmu-v3: Add stall support for platform devices
>   PCI/ATS: Add PRI stubs
>   PCI/ATS: Export PRI functions
>   iommu/arm-smmu-v3: Add support for PRI
> 
>  drivers/iommu/Kconfig                         |   11 +
>  drivers/iommu/Makefile                        |    2 +
>  .../devicetree/bindings/iommu/iommu.txt       |   18 +
>  arch/arm64/include/asm/mmu.h                  |    1 +
>  arch/arm64/include/asm/mmu_context.h          |   11 +-
>  drivers/iommu/io-pgtable-arm.h                |   30 +
>  drivers/iommu/iommu-sva.h                     |   15 +
>  include/linux/ioasid.h                        |   10 +-
>  include/linux/iommu.h                         |   53 +
>  include/linux/mm_types.h                      |    4 +
>  include/linux/pci-ats.h                       |    8 +
>  arch/arm64/kernel/cpufeature.c                |    1 +
>  arch/arm64/mm/context.c                       |  103 +-
>  drivers/iommu/arm-smmu-v3.c                   | 1554
> +++++++++++++++-- drivers/iommu/io-pgfault.c                    |
> 458 +++++ drivers/iommu/io-pgtable-arm.c                |   27 +-
>  drivers/iommu/ioasid.c                        |   30 +-
>  drivers/iommu/iommu-sva.c                     |   85 +
>  drivers/iommu/of_iommu.c                      |    5 +-
>  drivers/pci/ats.c                             |    4 +
>  MAINTAINERS                                   |    3 +-
>  21 files changed, 2275 insertions(+), 158 deletions(-)
>  create mode 100644 drivers/iommu/io-pgtable-arm.h
>  create mode 100644 drivers/iommu/iommu-sva.h
>  create mode 100644 drivers/iommu/io-pgfault.c
>  create mode 100644 drivers/iommu/iommu-sva.c
> 

[Jacob Pan]
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
