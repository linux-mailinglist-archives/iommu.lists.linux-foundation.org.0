Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BF461B24
	for <lists.iommu@lfdr.de>; Mon,  8 Jul 2019 09:14:37 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id F32B52187;
	Mon,  8 Jul 2019 07:14:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 4D2352152
	for <iommu@lists.linux-foundation.org>;
	Mon,  8 Jul 2019 07:07:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (lhrrgout.huawei.com [185.176.76.210])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 1ADF2826
	for <iommu@lists.linux-foundation.org>;
	Mon,  8 Jul 2019 07:07:23 +0000 (UTC)
Received: from lhreml709-cah.china.huawei.com (unknown [172.18.7.107])
	by Forcepoint Email with ESMTP id A46054F40AAE701A93A0;
	Mon,  8 Jul 2019 08:07:21 +0100 (IST)
Received: from LHREML524-MBS.china.huawei.com ([169.254.2.154]) by
	lhreml709-cah.china.huawei.com ([10.201.108.32]) with mapi id
	14.03.0415.000; Mon, 8 Jul 2019 08:07:13 +0100
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Auger Eric <eric.auger@redhat.com>, "alex.williamson@redhat.com"
	<alex.williamson@redhat.com>
Subject: RE: [PATCH v7 1/6] vfio/type1: Introduce iova list and add iommu
	aperture validity check
Thread-Topic: [PATCH v7 1/6] vfio/type1: Introduce iova list and add iommu
	aperture validity check
Thread-Index: AQHVLDHPKQQdUzHkf0S0a1+iQm67I6a/QOuAgAEcSsA=
Date: Mon, 8 Jul 2019 07:07:13 +0000
Message-ID: <5FC3163CFD30C246ABAA99954A238FA83F2E19A9@lhreml524-mbs.china.huawei.com>
References: <20190626151248.11776-1-shameerali.kolothum.thodi@huawei.com>
	<20190626151248.11776-2-shameerali.kolothum.thodi@huawei.com>
	<9ae8755a-9a2a-da76-e0c1-0f36f75ec2b3@redhat.com>
In-Reply-To: <9ae8755a-9a2a-da76-e0c1-0f36f75ec2b3@redhat.com>
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

Hi Eric,

> -----Original Message-----
> From: Auger Eric [mailto:eric.auger@redhat.com]
> Sent: 07 July 2019 16:03
> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>;
> alex.williamson@redhat.com; pmorel@linux.vnet.ibm.com
> Cc: kvm@vger.kernel.org; linux-kernel@vger.kernel.org;
> iommu@lists.linux-foundation.org; Linuxarm <linuxarm@huawei.com>; John
> Garry <john.garry@huawei.com>; xuwei (O) <xuwei5@huawei.com>;
> kevin.tian@intel.com
> Subject: Re: [PATCH v7 1/6] vfio/type1: Introduce iova list and add iommu
> aperture validity check
> 
> Hi Shameer,
> 
> On 6/26/19 5:12 PM, Shameer Kolothum wrote:
> > This introduces an iova list that is valid for dma mappings. Make
> > sure the new iommu aperture window doesn't conflict with the current
> > one or with any existing dma mappings during attach.
> >
> > Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> > ---
> >  drivers/vfio/vfio_iommu_type1.c | 181
> +++++++++++++++++++++++++++++++-
> >  1 file changed, 177 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/vfio/vfio_iommu_type1.c
> b/drivers/vfio/vfio_iommu_type1.c
> > index add34adfadc7..970d1ec06aed 100644
> > --- a/drivers/vfio/vfio_iommu_type1.c
> > +++ b/drivers/vfio/vfio_iommu_type1.c
> > @@ -1,4 +1,3 @@
> > -// SPDX-License-Identifier: GPL-2.0-only
> >  /*
> >   * VFIO: IOMMU DMA mapping support for Type1 IOMMU
> >   *
> > @@ -62,6 +61,7 @@ MODULE_PARM_DESC(dma_entry_limit,
> >
> >  struct vfio_iommu {
> >  	struct list_head	domain_list;
> > +	struct list_head	iova_list;
> >  	struct vfio_domain	*external_domain; /* domain for external user */
> >  	struct mutex		lock;
> >  	struct rb_root		dma_list;
> > @@ -97,6 +97,12 @@ struct vfio_group {
> >  	bool			mdev_group;	/* An mdev group */
> >  };
> >
> > +struct vfio_iova {
> > +	struct list_head	list;
> > +	dma_addr_t		start;
> > +	dma_addr_t		end;
> > +};
> > +
> >  /*
> >   * Guest RAM pinning working set or DMA target
> >   */
> > @@ -1401,6 +1407,146 @@ static int vfio_mdev_iommu_device(struct
> device *dev, void *data)
> >  	return 0;
> >  }
> >
> > +/*
> > + * This is a helper function to insert an address range to iova list.
> > + * The list starts with a single entry corresponding to the IOMMU
> The list is initially created with a single entry ../..
> > + * domain geometry to which the device group is attached. The list
> > + * aperture gets modified when a new domain is added to the container
> > + * if the new aperture doesn't conflict with the current one or with
> > + * any existing dma mappings. The list is also modified to exclude
> > + * any reserved regions associated with the device group.
> > + */
> > +static int vfio_iommu_iova_insert(struct list_head *head,
> > +				  dma_addr_t start, dma_addr_t end)
> > +{
> > +	struct vfio_iova *region;
> > +
> > +	region = kmalloc(sizeof(*region), GFP_KERNEL);
> > +	if (!region)
> > +		return -ENOMEM;
> > +
> > +	INIT_LIST_HEAD(&region->list);
> > +	region->start = start;
> > +	region->end = end;
> > +
> > +	list_add_tail(&region->list, head);
> > +	return 0;
> > +}
> > +
> > +/*
> > + * Check the new iommu aperture conflicts with existing aper or with any
> > + * existing dma mappings.
> > + */
> > +static bool vfio_iommu_aper_conflict(struct vfio_iommu *iommu,
> > +				     dma_addr_t start, dma_addr_t end)
> > +{
> > +	struct vfio_iova *first, *last;
> > +	struct list_head *iova = &iommu->iova_list;
> > +
> > +	if (list_empty(iova))
> > +		return false;
> > +
> > +	/* Disjoint sets, return conflict */
> > +	first = list_first_entry(iova, struct vfio_iova, list);
> > +	last = list_last_entry(iova, struct vfio_iova, list);
> > +	if (start > last->end || end < first->start)
> > +		return true;
> > +
> > +	/* Check for any existing dma mappings outside the new start */
> s/outside/below
> > +	if (start > first->start) {
> > +		if (vfio_find_dma(iommu, first->start, start - first->start))
> > +			return true;
> > +	}
> > +
> > +	/* Check for any existing dma mappings outside the new end */
> s/outside/beyond
> > +	if (end < last->end) {
> > +		if (vfio_find_dma(iommu, end + 1, last->end - end))
> > +			return true;
> > +	}
> > +
> > +	return false;
> > +}
> > +
> > +/*
> > + * Resize iommu iova aperture window. This is called only if the new
> > + * aperture has no conflict with existing aperture and dma mappings.
> > + */
> > +static int vfio_iommu_aper_resize(struct list_head *iova,
> > +				  dma_addr_t start, dma_addr_t end)
> > +{
> > +	struct vfio_iova *node, *next;
> > +
> > +	if (list_empty(iova))
> > +		return vfio_iommu_iova_insert(iova, start, end);
> > +
> > +	/* Adjust iova list start */
> > +	list_for_each_entry_safe(node, next, iova, list) {
> > +		if (start < node->start)
> > +			break;
> > +		if (start >= node->start && start < node->end) {
> > +			node->start = start;
> > +			break;
> > +		}
> > +		/* Delete nodes before new start */
> > +		list_del(&node->list);
> > +		kfree(node);
> > +	}
> > +
> > +	/* Adjust iova list end */
> > +	list_for_each_entry_safe(node, next, iova, list) {
> > +		if (end > node->end)
> > +			continue;
> > +		if (end > node->start && end <= node->end) {
> > +			node->end = end;
> > +			continue;
> > +		}
> > +		/* Delete nodes after new end */
> > +		list_del(&node->list);
> > +		kfree(node);
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static void vfio_iommu_iova_free(struct list_head *iova)
> > +{
> > +	struct vfio_iova *n, *next;
> > +
> > +	list_for_each_entry_safe(n, next, iova, list) {
> > +		list_del(&n->list);
> > +		kfree(n);
> > +	}
> > +}
> > +
> > +static int vfio_iommu_iova_get_copy(struct vfio_iommu *iommu,
> > +				    struct list_head *iova_copy)
> > +{
> > +	struct list_head *iova = &iommu->iova_list;
> > +	struct vfio_iova *n;
> > +	int ret;
> > +
> > +	list_for_each_entry(n, iova, list) {
> > +		ret = vfio_iommu_iova_insert(iova_copy, n->start, n->end);
> > +		if (ret)
> > +			goto out_free;
> > +	}
> > +
> > +	return 0;
> > +
> > +out_free:
> > +	vfio_iommu_iova_free(iova_copy);
> > +	return ret;
> > +}
> > +
> > +static void vfio_iommu_iova_insert_copy(struct vfio_iommu *iommu,
> > +					struct list_head *iova_copy)
> > +{
> > +	struct list_head *iova = &iommu->iova_list;
> > +
> > +	vfio_iommu_iova_free(iova);
> > +
> > +	list_splice_tail(iova_copy, iova);
> > +}
> >  static int vfio_iommu_type1_attach_group(void *iommu_data,
> >  					 struct iommu_group *iommu_group)
> >  {
> > @@ -1411,6 +1557,8 @@ static int vfio_iommu_type1_attach_group(void
> *iommu_data,
> >  	int ret;
> >  	bool resv_msi, msi_remap;
> >  	phys_addr_t resv_msi_base;
> > +	struct iommu_domain_geometry geo;
> > +	LIST_HEAD(iova_copy);
> >
> >  	mutex_lock(&iommu->lock);
> >
> > @@ -1487,6 +1635,25 @@ static int vfio_iommu_type1_attach_group(void
> *iommu_data,
> >  	if (ret)
> >  		goto out_domain;
> >
> > +	/* Get aperture info */
> > +	iommu_domain_get_attr(domain->domain, DOMAIN_ATTR_GEOMETRY,
> &geo);
> > +
> > +	if (vfio_iommu_aper_conflict(iommu, geo.aperture_start,
> > +				     geo.aperture_end)) {
> > +		ret = -EINVAL;
> > +		goto out_detach;
> > +	}
> > +
> > +	/* Get a copy of the current iova list and work on it */
> At this stage of the reading it is not obvious why you need a copy of
> the list. rationale can be found when reading further or in the series
> history ("Use of iova list copy so that original is not altered in case
> of failure").
> 
> Adding a comment in the code would be useful I think.

Ok. That makes sense. I will address this and all other minor comments
you had on other patches in next revision.

Thanks,
Shameer

> Thanks
> 
> Eric
> 
> > +	ret = vfio_iommu_iova_get_copy(iommu, &iova_copy);
> > +	if (ret)
> > +		goto out_detach;
> > +
> > +	ret = vfio_iommu_aper_resize(&iova_copy, geo.aperture_start,
> > +				     geo.aperture_end);
> > +	if (ret)
> > +		goto out_detach;
> > +
> >  	resv_msi = vfio_iommu_has_sw_msi(iommu_group, &resv_msi_base);
> >
> >  	INIT_LIST_HEAD(&domain->group_list);
> > @@ -1520,8 +1687,7 @@ static int vfio_iommu_type1_attach_group(void
> *iommu_data,
> >  				list_add(&group->next, &d->group_list);
> >  				iommu_domain_free(domain->domain);
> >  				kfree(domain);
> > -				mutex_unlock(&iommu->lock);
> > -				return 0;
> > +				goto done;
> >  			}
> >
> >  			ret = vfio_iommu_attach_group(domain, group);
> > @@ -1544,7 +1710,9 @@ static int vfio_iommu_type1_attach_group(void
> *iommu_data,
> >  	}
> >
> >  	list_add(&domain->next, &iommu->domain_list);
> > -
> > +done:
> > +	/* Delete the old one and insert new iova list */
> > +	vfio_iommu_iova_insert_copy(iommu, &iova_copy);
> >  	mutex_unlock(&iommu->lock);
> >
> >  	return 0;
> > @@ -1553,6 +1721,7 @@ static int vfio_iommu_type1_attach_group(void
> *iommu_data,
> >  	vfio_iommu_detach_group(domain, group);
> >  out_domain:
> >  	iommu_domain_free(domain->domain);
> > +	vfio_iommu_iova_free(&iova_copy);
> >  out_free:
> >  	kfree(domain);
> >  	kfree(group);
> > @@ -1692,6 +1861,7 @@ static void *vfio_iommu_type1_open(unsigned
> long arg)
> >  	}
> >
> >  	INIT_LIST_HEAD(&iommu->domain_list);
> > +	INIT_LIST_HEAD(&iommu->iova_list);
> >  	iommu->dma_list = RB_ROOT;
> >  	iommu->dma_avail = dma_entry_limit;
> >  	mutex_init(&iommu->lock);
> > @@ -1735,6 +1905,9 @@ static void vfio_iommu_type1_release(void
> *iommu_data)
> >  		list_del(&domain->next);
> >  		kfree(domain);
> >  	}
> > +
> > +	vfio_iommu_iova_free(&iommu->iova_list);
> > +
> >  	kfree(iommu);
> >  }
> >
> >
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
