Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4C65F894
	for <lists.iommu@lfdr.de>; Thu,  4 Jul 2019 14:52:31 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5D29F1124;
	Thu,  4 Jul 2019 12:52:30 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id EAFD61108
	for <iommu@lists.linux-foundation.org>;
	Thu,  4 Jul 2019 12:52:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (lhrrgout.huawei.com [185.176.76.210])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 7769887B
	for <iommu@lists.linux-foundation.org>;
	Thu,  4 Jul 2019 12:52:28 +0000 (UTC)
Received: from lhreml709-cah.china.huawei.com (unknown [172.18.7.107])
	by Forcepoint Email with ESMTP id E916422570C208935E2E;
	Thu,  4 Jul 2019 13:36:31 +0100 (IST)
Received: from LHREML524-MBS.china.huawei.com ([169.254.2.154]) by
	lhreml709-cah.china.huawei.com ([10.201.108.32]) with mapi id
	14.03.0415.000; Thu, 4 Jul 2019 13:36:24 +0100
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: RE: [PATCH v7 1/6] vfio/type1: Introduce iova list and add iommu
	aperture validity check
Thread-Topic: [PATCH v7 1/6] vfio/type1: Introduce iova list and add iommu
	aperture validity check
Thread-Index: AQHVLDHPKQQdUzHkf0S0a1+iQm67I6a5VDgAgAEdS/A=
Date: Thu, 4 Jul 2019 12:36:24 +0000
Message-ID: <5FC3163CFD30C246ABAA99954A238FA83F2DDB26@lhreml524-mbs.china.huawei.com>
References: <20190626151248.11776-1-shameerali.kolothum.thodi@huawei.com>
	<20190626151248.11776-2-shameerali.kolothum.thodi@huawei.com>
	<20190703143418.34a0f1c6@x1.home>
In-Reply-To: <20190703143418.34a0f1c6@x1.home>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.34.206.221]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "kevin.tian@intel.com" <kevin.tian@intel.com>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"pmorel@linux.vnet.ibm.com" <pmorel@linux.vnet.ibm.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Linuxarm <linuxarm@huawei.com>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
	"xuwei \(O\)" <xuwei5@huawei.com>
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



> -----Original Message-----
> From: Alex Williamson [mailto:alex.williamson@redhat.com]
> Sent: 03 July 2019 21:34
> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> Cc: eric.auger@redhat.com; pmorel@linux.vnet.ibm.com;
> kvm@vger.kernel.org; linux-kernel@vger.kernel.org;
> iommu@lists.linux-foundation.org; Linuxarm <linuxarm@huawei.com>; John
> Garry <john.garry@huawei.com>; xuwei (O) <xuwei5@huawei.com>;
> kevin.tian@intel.com
> Subject: Re: [PATCH v7 1/6] vfio/type1: Introduce iova list and add iommu
> aperture validity check
> 
> 
> Welcome back Shameer ;)

Thanks Alex :)

> 
> On Wed, 26 Jun 2019 16:12:43 +0100
> Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:
> 
> > This introduces an iova list that is valid for dma mappings. Make sure
> > the new iommu aperture window doesn't conflict with the current one or
> > with any existing dma mappings during attach.
> >
> > Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> > ---
> >  drivers/vfio/vfio_iommu_type1.c | 181
> > +++++++++++++++++++++++++++++++-
> >  1 file changed, 177 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/vfio/vfio_iommu_type1.c
> > b/drivers/vfio/vfio_iommu_type1.c index add34adfadc7..970d1ec06aed
> > 100644
> > --- a/drivers/vfio/vfio_iommu_type1.c
> > +++ b/drivers/vfio/vfio_iommu_type1.c
> > @@ -1,4 +1,3 @@
> > -// SPDX-License-Identifier: GPL-2.0-only
> >  /*
> >   * VFIO: IOMMU DMA mapping support for Type1 IOMMU
> >   *
> 
> Accidental merge deletion?  Thanks,
>

Yes it is. I will fix it.

Thanks,
Shameer

 
> Alex
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
