Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CBBFD711F
	for <lists.iommu@lfdr.de>; Tue, 15 Oct 2019 10:35:38 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A0945B7D;
	Tue, 15 Oct 2019 08:35:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 89A86B7D
	for <iommu@lists.linux-foundation.org>;
	Tue, 15 Oct 2019 08:35:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 1B48514D
	for <iommu@lists.linux-foundation.org>;
	Tue, 15 Oct 2019 08:35:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 37B23793C9;
	Tue, 15 Oct 2019 08:35:32 +0000 (UTC)
Received: from [10.36.116.245] (ovpn-116-245.ams2.redhat.com [10.36.116.245])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EE03C60C5D;
	Tue, 15 Oct 2019 08:35:22 +0000 (UTC)
Subject: Re: [PATCH v4 0/4] User API for nested shared virtual address (SVA)
To: Jacob Pan <jacob.jun.pan@linux.intel.com>,
	iommu@lists.linux-foundation.org, LKML <linux-kernel@vger.kernel.org>, 
	Joerg Roedel <joro@8bytes.org>, David Woodhouse <dwmw2@infradead.org>, 
	Alex Williamson <alex.williamson@redhat.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.com>
References: <1570045363-24856-1-git-send-email-jacob.jun.pan@linux.intel.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <57400ea9-607d-5502-8e77-3ad2b5f9a35e@redhat.com>
Date: Tue, 15 Oct 2019 10:35:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <1570045363-24856-1-git-send-email-jacob.jun.pan@linux.intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Tue, 15 Oct 2019 08:35:32 +0000 (UTC)
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

Hi,

On 10/2/19 9:42 PM, Jacob Pan wrote:
> This set consists of IOMMU APIs to support SVA in the guest, a.k.a nested
> SVA. As the complete SVA support is complex, we break down the enabling
> effort into three stages:
> 1. PCI device direct assignment
> 2. Fault handling, especially page request service support
> 3. Mediated device assignment
> 
> Each stage includes common API and vendor specific IOMMU driver changes. This
> series is the common uAPI for stage #1. It is intended to build consensus on
> the interface which all vendors reply on.
> 
> This series is extracted from the complete stage1 set which includes VT-d code.
> https://lkml.org/lkml/2019/8/15/951
> 
> Changes:
>  - Use spinlock instead of mutex to protect ioasid custom allocators. This is
>    to support callers in atomic context
>  - Added more padding to guest PASID bind data for future extensions, suggested
>    by Joerg.
> After much thinking, I did not do name change from PASID to IOASID in the uAPI,
> considering we have been using PASID in the rest of uAPIs. IOASID will remain
> used within the kernel.
> 
> For more discussions lead to this series, checkout LPC 2019 VFIO/IOMMU/PCI
> microconference materials.
> https://linuxplumbersconf.org/event/4/sessions/66/#20190909
> 
> 
> Change log:
> v4:    - minor patch regroup and fixes based on review from Jean
> v3:    - include errno.h in ioasid.h to fix compile error
>        - rebased to v5.4-rc1, no change
>  
> v2:
> 	- Addressed review comments by Jean on IOASID custom allocators, locking
> 	fix, misc control flow fix.
> 	- Fixed a compile error with missing header errno.h
> 	- Updated Jean-Philiippe's new email and updateded reviewed-by tag
> 
> Jacob Pan (2):
>   iommu/ioasid: Add custom allocators
>   iommu: Introduce guest PASID bind function
> 
> Jean-Philippe Brucker (1):
>   iommu: Add I/O ASID allocator
> 
> Yi L Liu (1):
>   iommu: Introduce cache_invalidate API
> 
>  drivers/iommu/Kconfig      |   4 +
>  drivers/iommu/Makefile     |   1 +
>  drivers/iommu/ioasid.c     | 422 +++++++++++++++++++++++++++++++++++++++++++++
>  drivers/iommu/iommu.c      |  30 ++++
>  include/linux/ioasid.h     |  76 ++++++++
>  include/linux/iommu.h      |  36 ++++
>  include/uapi/linux/iommu.h | 169 ++++++++++++++++++
>  7 files changed, 738 insertions(+)
>  create mode 100644 drivers/iommu/ioasid.c
>  create mode 100644 include/linux/ioasid.h

For the whole series,
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric

> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
