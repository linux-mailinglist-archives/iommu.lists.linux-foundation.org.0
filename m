Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A45E1F89F
	for <lists.iommu@lfdr.de>; Wed, 15 May 2019 18:28:24 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B919CCCE;
	Wed, 15 May 2019 16:28:22 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id AB6309EE
	for <iommu@lists.linux-foundation.org>;
	Wed, 15 May 2019 16:28:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E38FD8D
	for <iommu@lists.linux-foundation.org>;
	Wed, 15 May 2019 16:28:20 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 May 2019 09:28:20 -0700
X-ExtLoop1: 1
Received: from jacob-builder.jf.intel.com (HELO jacob-builder) ([10.7.199.155])
	by orsmga001.jf.intel.com with ESMTP; 15 May 2019 09:28:20 -0700
Date: Wed, 15 May 2019 09:31:14 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: iommu@lists.linux-foundation.org, LKML <linux-kernel@vger.kernel.org>,
	Joerg Roedel <joro@8bytes.org>, David Woodhouse <dwmw2@infradead.org>, Eric
	Auger <eric.auger@redhat.com>, Alex Williamson
	<alex.williamson@redhat.com>, Jean-Philippe Brucker
	<jean-philippe.brucker@arm.com>
Subject: Re: [PATCH v3 00/16] Shared virtual address IOMMU and VT-d support
Message-ID: <20190515093114.520fe627@jacob-builder>
In-Reply-To: <1556922737-76313-1-git-send-email-jacob.jun.pan@linux.intel.com>
References: <1556922737-76313-1-git-send-email-jacob.jun.pan@linux.intel.com>
Organization: OTC
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Raj Ashok <ashok.raj@intel.com>,
	Andriy Shevchenko <andriy.shevchenko@linux.intel.com>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

Hi all,
Just wondering if you have any more feedbacks other than the cache
invalidate API change for archid?
I plan to do the next version on top of Jean's sva/api branch (common
iommu APIs) with minor tweak to support non-identity guest-host PASID
mapping. It would be great if I can address additional comments
together.

Thanks!

Jacob

On Fri,  3 May 2019 15:32:01 -0700
Jacob Pan <jacob.jun.pan@linux.intel.com> wrote:

> Shared virtual address (SVA), a.k.a, Shared virtual memory (SVM) on
> Intel platforms allow address space sharing between device DMA and
> applications. SVA can reduce programming complexity and enhance
> security. This series is intended to enable SVA virtualization, i.e.
> shared guest application address space and physical device DMA
> address. Only IOMMU portion of the changes are included in this
> series. Additional support is needed in VFIO and QEMU (will be
> submitted separately) to complete this functionality.
> 
> To make incremental changes and reduce the size of each patchset.
> This series does not inlcude support for page request services.
> 
> In VT-d implementation, PASID table is per device and maintained in
> the host. Guest PASID table is shadowed in VMM where virtual IOMMU is
> emulated.
> 
>     .-------------.  .---------------------------.
>     |   vIOMMU    |  | Guest process CR3, FL only|
>     |             |  '---------------------------'
>     .----------------/
>     | PASID Entry |--- PASID cache flush -
>     '-------------'                       |
>     |             |                       V
>     |             |                CR3 in GPA
>     '-------------'
> Guest
> ------| Shadow |--------------------------|--------
>       v        v                          v
> Host
>     .-------------.  .----------------------.
>     |   pIOMMU    |  | Bind FL for GVA-GPA  |
>     |             |  '----------------------'
>     .----------------/  |
>     | PASID Entry |     V (Nested xlate)
>     '----------------\.------------------------------.
>     |             |   |SL for GPA-HPA, default domain|
>     |             |   '------------------------------'
>     '-------------'
> Where:
>  - FL = First level/stage one page tables
>  - SL = Second level/stage two page tables
> 
> 
> This work is based on collaboration with other developers on the IOMMU
> mailing list. Notably,
> 
> [1] [PATCH v6 00/22] SMMUv3 Nested Stage Setup by Eric Auger
> https://lkml.org/lkml/2019/3/17/124
> 
> [2] [RFC PATCH 2/6] drivers core: Add I/O ASID allocator by
> Jean-Philippe Brucker
> https://www.spinics.net/lists/iommu/msg30639.html
> 
> [3] [RFC PATCH 0/5] iommu: APIs for paravirtual PASID allocation by
> Lu Baolu https://lkml.org/lkml/2018/11/12/1921
> 
> [4] [PATCH v5 00/23] IOMMU and VT-d driver support for Shared Virtual
>     Address (SVA)
>     https://lwn.net/Articles/754331/
> 
> There are roughly three parts:
> 1. Generic PASID allocator [1] with extension to support custom
> allocator 2. IOMMU cache invalidation passdown from guest to host
> 3. Guest PASID bind for nested translation
> 
> All generic IOMMU APIs are reused from [1], which has a v7 just
> published with no real impact to the patches used here. It is worth
> noting that unlike sMMU nested stage setup, where PASID table is
> owned by the guest, VT-d PASID table is owned by the host, individual
> PASIDs are bound instead of the PASID table.
> 
> This series is based on the new VT-d 3.0 Specification
> (https://software.intel.com/sites/default/files/managed/c5/15/vt-directed-io-spec.pdf).
> This is different than the older series in [4] which was based on the
> older specification that does not have scalable mode.
> 
> 
> ChangeLog:
> 	- V3
> 	  - Addressed thorough review comments from Eric Auger (Thank
> you!)
> 	  - Moved IOASID allocator from driver core to IOMMU code per
> 	    suggestion by Christoph Hellwig
> 	    (https://lkml.org/lkml/2019/4/26/462)
> 	  - Rebased on top of Jean's SVA API branch and Eric's v7[1]
> 	    (git://linux-arm.org/linux-jpb.git sva/api)
> 	  - All IOMMU APIs are unmodified (except the new bind guest
> PASID call in patch 9/16)
> 
> 	- V2
> 	  - Rebased on Joerg's IOMMU x86/vt-d branch v5.1-rc4
> 	  - Integrated with Eric Auger's new v7 series for common APIs
> 	  (https://github.com/eauger/linux/tree/v5.1-rc3-2stage-v7)
> 	  - Addressed review comments from Andy Shevchenko and Alex
> Williamson on IOASID custom allocator.
> 	  - Support multiple custom IOASID allocators (vIOMMUs) and
> dynamic registration.
> 
> 
> Jacob Pan (13):
>   iommu: Introduce attach/detach_pasid_table API
>   ioasid: Add custom IOASID allocator
>   iommu/vt-d: Add custom allocator for IOASID
>   iommu/vtd: Optimize tlb invalidation for vIOMMU
>   iommu/vt-d: Replace Intel specific PASID allocator with IOASID
>   iommu: Introduce guest PASID bind function
>   iommu/vt-d: Move domain helper to header
>   iommu/vt-d: Avoid duplicated code for PASID setup
>   iommu/vt-d: Add nested translation helper function
>   iommu/vt-d: Clean up for SVM device list
>   iommu/vt-d: Add bind guest PASID support
>   iommu/vt-d: Support flushing more translation cache types
>   iommu/vt-d: Add svm/sva invalidate function
> 
> Jean-Philippe Brucker (1):
>   iommu: Add I/O ASID allocator
> 
> Liu, Yi L (1):
>   iommu: Introduce cache_invalidate API
> 
> Lu Baolu (1):
>   iommu/vt-d: Enlightened PASID allocation
> 
>  drivers/iommu/Kconfig       |   7 ++
>  drivers/iommu/Makefile      |   1 +
>  drivers/iommu/dmar.c        |  50 ++++++++
>  drivers/iommu/intel-iommu.c | 241
> ++++++++++++++++++++++++++++++++++-- drivers/iommu/intel-pasid.c |
> 223 +++++++++++++++++++++++++-------- drivers/iommu/intel-pasid.h |
> 24 +++- drivers/iommu/intel-svm.c   | 293
> +++++++++++++++++++++++++++++++++++---------
> drivers/iommu/ioasid.c      | 265
> +++++++++++++++++++++++++++++++++++++++ drivers/iommu/iommu.c
> |  53 ++++++++ include/linux/intel-iommu.h |  41 ++++++-
> include/linux/intel-svm.h   |   7 ++ include/linux/ioasid.h      |
> 67 ++++++++++ include/linux/iommu.h       |  43 ++++++-
>  include/uapi/linux/iommu.h  | 140 +++++++++++++++++++++
>  14 files changed, 1328 insertions(+), 127 deletions(-)
>  create mode 100644 drivers/iommu/ioasid.c
>  create mode 100644 include/linux/ioasid.h
> 

[Jacob Pan]
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
