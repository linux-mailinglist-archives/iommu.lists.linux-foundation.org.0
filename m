Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6A2E0F2F
	for <lists.iommu@lfdr.de>; Wed, 23 Oct 2019 02:27:58 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 809E3B8A;
	Wed, 23 Oct 2019 00:27:54 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 1AB36B65
	for <iommu@lists.linux-foundation.org>;
	Wed, 23 Oct 2019 00:27:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 6AC8587B
	for <iommu@lists.linux-foundation.org>;
	Wed, 23 Oct 2019 00:27:52 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Oct 2019 17:27:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,218,1569308400"; d="scan'208";a="372712860"
Received: from otc-nc-03.jf.intel.com (HELO otc-nc-03) ([10.54.39.145])
	by orsmga005.jf.intel.com with ESMTP; 22 Oct 2019 17:27:51 -0700
Date: Tue, 22 Oct 2019 17:27:51 -0700
From: "Raj, Ashok" <ashok.raj@intel.com>
To: Jacob Pan <jacob.jun.pan@linux.intel.com>
Subject: Re: [PATCH v6 00/10] Nested Shared Virtual Address (SVA) VT-d support
Message-ID: <20191023002751.GA100970@otc-nc-03>
References: <1571788403-42095-1-git-send-email-jacob.jun.pan@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1571788403-42095-1-git-send-email-jacob.jun.pan@linux.intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Ashok Raj <ashok.raj@intel.com>,
	David Woodhouse <dwmw2@infradead.org>, iommu@lists.linux-foundation.org,
	LKML <linux-kernel@vger.kernel.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.com>,
	Jonathan Cameron <jic23@kernel.org>
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

Hi Jacob

On Tue, Oct 22, 2019 at 04:53:13PM -0700, Jacob Pan wrote:
> Shared virtual address (SVA), a.k.a, Shared virtual memory (SVM) on Intel
> platforms allow address space sharing between device DMA and applications.
> SVA can reduce programming complexity and enhance security.
> This series is intended to enable SVA virtualization, i.e. shared guest
> application address space and physical device DMA address. Only IOMMU portion

Last line "i.e shared guest application address space and physical device 
DMA address" doesn't read well. 

Simply rephrase as "enable use of SVA within a guest user application"

> of the changes are included in this series. Additional support is needed in
> VFIO and QEMU (will be submitted separately) to complete this functionality.
> 
> To make incremental changes and reduce the size of each patchset. This series
> does not inlcude support for page request services.
> 
> In VT-d implementation, PASID table is per device and maintained in the host.
> Guest PASID table is shadowed in VMM where virtual IOMMU is emulated.
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

is the SL for GPA-HPA default domain? When you assign a device to 
Guest, this isn't default domain right?

> Where:
>  - FL = First level/stage one page tables
>  - SL = Second level/stage two page tables
> 
> This is the remaining VT-d only portion of V5 since the uAPIs and IOASID common
> code have been applied to Joerg's IOMMU core branch.
> (https://lkml.org/lkml/2019/10/2/833)
> 
> The complete set with VFIO patches are here:
> https://github.com/jacobpan/linux.git:siov_sva
> 
> The complete nested SVA upstream patches are divided into three phases:
>     1. Common APIs and PCI device direct assignment
>     2. Page Request Services (PRS) support
>     3. Mediated device assignment
> 
> With this set and the accompanied VFIO code, we will achieve phase #1.
> 
> Thanks,
> 
> Jacob
> 
> ChangeLog:
> 	- V6
> 	  - Rebased on top of Joerg's core branch
> 	  (git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git core)
> 	  - Adapt to new uAPIs and IOASID allocators
> 
> 	- V5
> 	  Rebased on v5.3-rc4 which has some of the IOMMU fault APIs merged.
>  	  Addressed v4 review comments from Eric Auger, Baolu Lu, and
> 	    Jonathan Cameron. Specific changes are as follows:
> 	  - Refined custom IOASID allocator to support multiple vIOMMU, hotplug
> 	    cases.
> 	  - Extracted vendor data from IOMMU guest PASID bind data, for VT-d
> 	    will support all necessary guest PASID entry fields for PASID
> 	    bind.
> 	  - Support non-identity host-guest PASID mapping
> 	  - Exception handling in various cases
> 
> 	- V4
> 	  - Redesigned IOASID allocator such that it can support custom
> 	  allocators with shared helper functions. Use separate XArray
> 	  to store IOASIDs per allocator. Took advice from Eric Auger to
> 	  have default allocator use the generic allocator structure.
> 	  Combined into one patch in that the default allocator is just
> 	  "another" allocator now. Can be built as a module in case of
> 	  driver use without IOMMU.
> 	  - Extended bind guest PASID data to support SMMU and non-identity
> 	  guest to host PASID mapping https://lkml.org/lkml/2019/5/21/802
> 	  - Rebased on Jean's sva/api common tree, new patches starts with
> 	   [PATCH v4 10/22]
> 
> 	- V3
> 	  - Addressed thorough review comments from Eric Auger (Thank you!)
> 	  - Moved IOASID allocator from driver core to IOMMU code per
> 	    suggestion by Christoph Hellwig
> 	    (https://lkml.org/lkml/2019/4/26/462)
> 	  - Rebased on top of Jean's SVA API branch and Eric's v7[1]
> 	    (git://linux-arm.org/linux-jpb.git sva/api)
> 	  - All IOMMU APIs are unmodified (except the new bind guest PASID
> 	    call in patch 9/16)
> 
> 	- V2
> 	  - Rebased on Joerg's IOMMU x86/vt-d branch v5.1-rc4
> 	  - Integrated with Eric Auger's new v7 series for common APIs
> 	  (https://github.com/eauger/linux/tree/v5.1-rc3-2stage-v7)
> 	  - Addressed review comments from Andy Shevchenko and Alex Williamson on
> 	    IOASID custom allocator.
> 	  - Support multiple custom IOASID allocators (vIOMMUs) and dynamic
> 	    registration.
> 
> 
> Jacob Pan (9):
>   iommu/vt-d: Add custom allocator for IOASID
>   iommu/vt-d: Replace Intel specific PASID allocator with IOASID
>   iommu/vt-d: Move domain helper to header
>   iommu/vt-d: Avoid duplicated code for PASID setup
>   iommu/vt-d: Add nested translation helper function
>   iommu/vt-d: Misc macro clean up for SVM
>   iommu/vt-d: Add bind guest PASID support
>   iommu/vt-d: Support flushing more translation cache types
>   iommu/vt-d: Add svm/sva invalidate function
> 
> Lu Baolu (1):
>   iommu/vt-d: Enlightened PASID allocation
> 
>  drivers/iommu/Kconfig       |   1 +
>  drivers/iommu/dmar.c        |  46 ++++++
>  drivers/iommu/intel-iommu.c | 259 +++++++++++++++++++++++++++++++--
>  drivers/iommu/intel-pasid.c | 343 +++++++++++++++++++++++++++++++++++++-------
>  drivers/iommu/intel-pasid.h |  25 +++-
>  drivers/iommu/intel-svm.c   | 298 ++++++++++++++++++++++++++++++--------
>  include/linux/intel-iommu.h |  39 ++++-
>  include/linux/intel-svm.h   |  17 +++
>  8 files changed, 904 insertions(+), 124 deletions(-)
> 
> -- 
> 2.7.4
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
