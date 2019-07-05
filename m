Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5DD5FE56
	for <lists.iommu@lfdr.de>; Fri,  5 Jul 2019 00:06:36 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 9F42AC51;
	Thu,  4 Jul 2019 22:06:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 56C40BE7
	for <iommu@lists.linux-foundation.org>;
	Thu,  4 Jul 2019 22:06:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (lhrrgout.huawei.com [185.176.76.210])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 86CBD87C
	for <iommu@lists.linux-foundation.org>;
	Thu,  4 Jul 2019 22:06:32 +0000 (UTC)
Received: from lhreml706-cah.china.huawei.com (unknown [172.18.7.107])
	by Forcepoint Email with ESMTP id 053BABD501BBC6932294;
	Thu,  4 Jul 2019 23:06:30 +0100 (IST)
Received: from LHREML524-MBS.china.huawei.com ([169.254.2.154]) by
	lhreml706-cah.china.huawei.com ([10.201.108.47]) with mapi id
	14.03.0415.000; Thu, 4 Jul 2019 23:06:23 +0100
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: RE: [PATCH v7 2/6] vfio/type1: Check reserve region conflict and
	update iova list
Thread-Topic: [PATCH v7 2/6] vfio/type1: Check reserve region conflict and
	update iova list
Thread-Index: AQHVLDHlfv32Tq6P8k2BSud+nbtQFqa5VEOAgAEf3kCAAJvsIA==
Date: Thu, 4 Jul 2019 22:06:23 +0000
Message-ID: <5FC3163CFD30C246ABAA99954A238FA83F2DDED5@lhreml524-mbs.china.huawei.com>
References: <20190626151248.11776-1-shameerali.kolothum.thodi@huawei.com>
	<20190626151248.11776-3-shameerali.kolothum.thodi@huawei.com>
	<20190703143427.2d63c15f@x1.home> 
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.45.141.232]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "kevin.tian@intel.com" <kevin.tian@intel.com>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
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
> From: Shameerali Kolothum Thodi
> Sent: 04 July 2019 13:51
> To: 'Alex Williamson' <alex.williamson@redhat.com>
> Cc: eric.auger@redhat.com; kvm@vger.kernel.org;
> linux-kernel@vger.kernel.org; iommu@lists.linux-foundation.org; Linuxarm
> <linuxarm@huawei.com>; John Garry <john.garry@huawei.com>; xuwei (O)
> <xuwei5@huawei.com>; kevin.tian@intel.com
> Subject: RE: [PATCH v7 2/6] vfio/type1: Check reserve region conflict and
> update iova list
> 
> 
> 
> > -----Original Message-----
> > From: kvm-owner@vger.kernel.org [mailto:kvm-owner@vger.kernel.org] On
> > Behalf Of Alex Williamson
> > Sent: 03 July 2019 21:34
> > To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> > Cc: eric.auger@redhat.com; pmorel@linux.vnet.ibm.com;
> > kvm@vger.kernel.org; linux-kernel@vger.kernel.org;
> > iommu@lists.linux-foundation.org; Linuxarm <linuxarm@huawei.com>; John
> > Garry <john.garry@huawei.com>; xuwei (O) <xuwei5@huawei.com>;
> > kevin.tian@intel.com
> > Subject: Re: [PATCH v7 2/6] vfio/type1: Check reserve region conflict and
> > update iova list
> >
> > On Wed, 26 Jun 2019 16:12:44 +0100
> > Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:
> >
> > > This retrieves the reserved regions associated with dev group and
> > > checks for conflicts with any existing dma mappings. Also update
> > > the iova list excluding the reserved regions.
> > >
> > > Reserved regions with type IOMMU_RESV_DIRECT_RELAXABLE are
> > > excluded from above checks as they are considered as directly
> > > mapped regions which are known to be relaxable.
> > >
> > > Signed-off-by: Shameer Kolothum
> <shameerali.kolothum.thodi@huawei.com>
> > > ---
> > >  drivers/vfio/vfio_iommu_type1.c | 96
> > +++++++++++++++++++++++++++++++++
> > >  1 file changed, 96 insertions(+)
> > >
> > > diff --git a/drivers/vfio/vfio_iommu_type1.c
> > b/drivers/vfio/vfio_iommu_type1.c
> > > index 970d1ec06aed..b6bfdfa16c33 100644
> > > --- a/drivers/vfio/vfio_iommu_type1.c
> > > +++ b/drivers/vfio/vfio_iommu_type1.c
> > > @@ -1559,6 +1641,7 @@ static int vfio_iommu_type1_attach_group(void
> > *iommu_data,
> > >  	phys_addr_t resv_msi_base;
> > >  	struct iommu_domain_geometry geo;
> > >  	LIST_HEAD(iova_copy);
> > > +	LIST_HEAD(group_resv_regions);
> > >
> > >  	mutex_lock(&iommu->lock);
> > >
> > > @@ -1644,6 +1727,13 @@ static int vfio_iommu_type1_attach_group(void
> > *iommu_data,
> > >  		goto out_detach;
> > >  	}
> > >
> > > +	iommu_get_group_resv_regions(iommu_group,
> &group_resv_regions);
> >
> > This can fail and should have an error case.  I assume we'd fail the
> > group attach on failure.  Thanks,
> 
> Right. I will add the check. Do you think we should do the same in
> vfio_iommu_has_sw_msi()
> as well? (In fact, it looks like iommu_get_group_resv_regions() ret is not
> checked anywhere in
> kernel).

Ah..forgot the fact that patch 6/6 should take care of vfio_iommu_has_sw_msi() 
case as we are removing the duplicate iommu_get_group_resv_regions() there. 

Thanks,
Shameer


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
