Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFC8D6805
	for <lists.iommu@lfdr.de>; Mon, 14 Oct 2019 19:09:58 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 075582739;
	Mon, 14 Oct 2019 17:09:54 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 630C72732
	for <iommu@lists.linux-foundation.org>;
	Mon, 14 Oct 2019 17:09:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 473988A8
	for <iommu@lists.linux-foundation.org>;
	Mon, 14 Oct 2019 17:09:51 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Oct 2019 10:09:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,296,1566889200"; d="scan'208";a="189079736"
Received: from jacob-builder.jf.intel.com (HELO jacob-builder) ([10.7.199.155])
	by orsmga008.jf.intel.com with ESMTP; 14 Oct 2019 10:09:49 -0700
Date: Mon, 14 Oct 2019 10:14:05 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: iommu@lists.linux-foundation.org, LKML <linux-kernel@vger.kernel.org>,
	Joerg Roedel <joro@8bytes.org>, David Woodhouse <dwmw2@infradead.org>, Alex
	Williamson <alex.williamson@redhat.com>, Jean-Philippe Brucker
	<jean-philippe@linaro.com>
Subject: Re: [PATCH v4 0/4] User API for nested shared virtual address (SVA)
Message-ID: <20191014101405.5429571b@jacob-builder>
In-Reply-To: <20191007123912.60c19a79@jacob-builder>
References: <1570045363-24856-1-git-send-email-jacob.jun.pan@linux.intel.com>
	<20191007123912.60c19a79@jacob-builder>
Organization: OTC
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Raj Ashok <ashok.raj@intel.com>,
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

Hi Joerg,

Just another gentle reminder. I think we have reached consensus in this
common code. Jean and Eric can confirm.

Thanks,

Jacob

On Mon, 7 Oct 2019 12:39:12 -0700
Jacob Pan <jacob.jun.pan@linux.intel.com> wrote:

> Hi Joerg and all,
> 
> Just wondering if you have more comments on this series.
> 
> Thanks,
> 
> Jacob
> 
> On Wed,  2 Oct 2019 12:42:39 -0700
> Jacob Pan <jacob.jun.pan@linux.intel.com> wrote:
> 
> > This set consists of IOMMU APIs to support SVA in the guest, a.k.a
> > nested SVA. As the complete SVA support is complex, we break down
> > the enabling effort into three stages:
> > 1. PCI device direct assignment
> > 2. Fault handling, especially page request service support
> > 3. Mediated device assignment
> > 
> > Each stage includes common API and vendor specific IOMMU driver
> > changes. This series is the common uAPI for stage #1. It is intended
> > to build consensus on the interface which all vendors reply on.
> > 
> > This series is extracted from the complete stage1 set which includes
> > VT-d code. https://lkml.org/lkml/2019/8/15/951
> > 
> > Changes:
> >  - Use spinlock instead of mutex to protect ioasid custom
> > allocators. This is to support callers in atomic context
> >  - Added more padding to guest PASID bind data for future
> > extensions, suggested by Joerg.
> > After much thinking, I did not do name change from PASID to IOASID
> > in the uAPI, considering we have been using PASID in the rest of
> > uAPIs. IOASID will remain used within the kernel.
> > 
> > For more discussions lead to this series, checkout LPC 2019
> > VFIO/IOMMU/PCI microconference materials.
> > https://linuxplumbersconf.org/event/4/sessions/66/#20190909
> > 
> > 
> > Change log:
> > v4:    - minor patch regroup and fixes based on review from Jean
> > v3:    - include errno.h in ioasid.h to fix compile error
> >        - rebased to v5.4-rc1, no change
> >  
> > v2:
> > 	- Addressed review comments by Jean on IOASID custom
> > allocators, locking fix, misc control flow fix.
> > 	- Fixed a compile error with missing header errno.h
> > 	- Updated Jean-Philiippe's new email and updateded
> > reviewed-by tag
> > 
> > Jacob Pan (2):
> >   iommu/ioasid: Add custom allocators
> >   iommu: Introduce guest PASID bind function
> > 
> > Jean-Philippe Brucker (1):
> >   iommu: Add I/O ASID allocator
> > 
> > Yi L Liu (1):
> >   iommu: Introduce cache_invalidate API
> > 
> >  drivers/iommu/Kconfig      |   4 +
> >  drivers/iommu/Makefile     |   1 +
> >  drivers/iommu/ioasid.c     | 422
> > +++++++++++++++++++++++++++++++++++++++++++++
> > drivers/iommu/iommu.c      |  30 ++++ include/linux/ioasid.h     |
> > 76 ++++++++ include/linux/iommu.h      |  36 ++++
> >  include/uapi/linux/iommu.h | 169 ++++++++++++++++++
> >  7 files changed, 738 insertions(+)
> >  create mode 100644 drivers/iommu/ioasid.c
> >  create mode 100644 include/linux/ioasid.h
> >   
> 
> [Jacob Pan]

[Jacob Pan]
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
