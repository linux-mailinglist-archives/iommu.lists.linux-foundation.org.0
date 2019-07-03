Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 720145EDAB
	for <lists.iommu@lfdr.de>; Wed,  3 Jul 2019 22:35:04 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 2D6F7EC9;
	Wed,  3 Jul 2019 20:35:03 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 6F37EEB7
	for <iommu@lists.linux-foundation.org>;
	Wed,  3 Jul 2019 20:35:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id D17E070D
	for <iommu@lists.linux-foundation.org>;
	Wed,  3 Jul 2019 20:35:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 434955944C;
	Wed,  3 Jul 2019 20:34:55 +0000 (UTC)
Received: from x1.home (ovpn-116-83.phx2.redhat.com [10.3.116.83])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3E4FC18248;
	Wed,  3 Jul 2019 20:34:52 +0000 (UTC)
Date: Wed, 3 Jul 2019 14:34:51 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Subject: Re: [PATCH v7 3/6] vfio/type1: Update iova list on detach
Message-ID: <20190703143451.0ae4e9f7@x1.home>
In-Reply-To: <20190626151248.11776-4-shameerali.kolothum.thodi@huawei.com>
References: <20190626151248.11776-1-shameerali.kolothum.thodi@huawei.com>
	<20190626151248.11776-4-shameerali.kolothum.thodi@huawei.com>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Wed, 03 Jul 2019 20:35:00 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kevin.tian@intel.com, kvm@vger.kernel.org, pmorel@linux.vnet.ibm.com,
	linux-kernel@vger.kernel.org, xuwei5@hisilicon.com,
	linuxarm@huawei.com, iommu@lists.linux-foundation.org
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

On Wed, 26 Jun 2019 16:12:45 +0100
Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:

> Get a copy of iova list on _group_detach and try to update the list.
> On success replace the current one with the copy. Leave the list as
> it is if update fails.
> 
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
>  drivers/vfio/vfio_iommu_type1.c | 91 +++++++++++++++++++++++++++++++++
>  1 file changed, 91 insertions(+)
> 
> diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
> index b6bfdfa16c33..e872fb3a0f39 100644
> --- a/drivers/vfio/vfio_iommu_type1.c
> +++ b/drivers/vfio/vfio_iommu_type1.c
> @@ -1873,12 +1873,88 @@ static void vfio_sanity_check_pfn_list(struct vfio_iommu *iommu)
>  	WARN_ON(iommu->notifier.head);
>  }
>  
> +/*
> + * Called when a domain is removed in detach. It is possible that
> + * the removed domain decided the iova aperture window. Modify the
> + * iova aperture with the smallest window among existing domains.
> + */
> +static void vfio_iommu_aper_expand(struct vfio_iommu *iommu,
> +				   struct list_head *iova_copy)
> +{
> +	struct vfio_domain *domain;
> +	struct iommu_domain_geometry geo;
> +	struct vfio_iova *node;
> +	dma_addr_t start = 0;
> +	dma_addr_t end = (dma_addr_t)~0;
> +
> +	list_for_each_entry(domain, &iommu->domain_list, next) {
> +		iommu_domain_get_attr(domain->domain, DOMAIN_ATTR_GEOMETRY,
> +				      &geo);
> +		if (geo.aperture_start > start)
> +			start = geo.aperture_start;
> +		if (geo.aperture_end < end)
> +			end = geo.aperture_end;
> +	}
> +
> +	/* Modify aperture limits. The new aper is either same or bigger */
> +	node = list_first_entry(iova_copy, struct vfio_iova, list);
> +	node->start = start;
> +	node = list_last_entry(iova_copy, struct vfio_iova, list);
> +	node->end = end;
> +}
> +
> +/*
> + * Called when a group is detached. The reserved regions for that
> + * group can be part of valid iova now. But since reserved regions
> + * may be duplicated among groups, populate the iova valid regions
> + * list again.
> + */
> +static int vfio_iommu_resv_refresh(struct vfio_iommu *iommu,
> +				   struct list_head *iova_copy)
> +{
> +	struct vfio_domain *d;
> +	struct vfio_group *g;
> +	struct vfio_iova *node;
> +	dma_addr_t start, end;
> +	LIST_HEAD(resv_regions);
> +	int ret;
> +
> +	list_for_each_entry(d, &iommu->domain_list, next) {
> +		list_for_each_entry(g, &d->group_list, next)
> +			iommu_get_group_resv_regions(g->iommu_group,
> +						     &resv_regions);

Need to account for failure case here too.

> +	}
> +
> +	if (list_empty(&resv_regions))
> +		return 0;
> +
> +	node = list_first_entry(iova_copy, struct vfio_iova, list);
> +	start = node->start;
> +	node = list_last_entry(iova_copy, struct vfio_iova, list);
> +	end = node->end;
> +
> +	/* purge the iova list and create new one */
> +	vfio_iommu_iova_free(iova_copy);
> +
> +	ret = vfio_iommu_aper_resize(iova_copy, start, end);
> +	if (ret)
> +		goto done;
> +
> +	/* Exclude current reserved regions from iova ranges */
> +	ret = vfio_iommu_resv_exclude(iova_copy, &resv_regions);
> +done:
> +	vfio_iommu_resv_free(&resv_regions);
> +	return ret;
> +}
> +
>  static void vfio_iommu_type1_detach_group(void *iommu_data,
>  					  struct iommu_group *iommu_group)
>  {
>  	struct vfio_iommu *iommu = iommu_data;
>  	struct vfio_domain *domain;
>  	struct vfio_group *group;
> +	bool iova_copy_fail;
> +	LIST_HEAD(iova_copy);
>  
>  	mutex_lock(&iommu->lock);
>  
> @@ -1901,6 +1977,12 @@ static void vfio_iommu_type1_detach_group(void *iommu_data,
>  		}
>  	}
>  
> +	/*
> +	 * Get a copy of iova list. If success, use copy to update the
> +	 * list and to replace the current one.
> +	 */
> +	iova_copy_fail = !!vfio_iommu_iova_get_copy(iommu, &iova_copy);
> +
>  	list_for_each_entry(domain, &iommu->domain_list, next) {
>  		group = find_iommu_group(domain, iommu_group);
>  		if (!group)
> @@ -1926,10 +2008,19 @@ static void vfio_iommu_type1_detach_group(void *iommu_data,
>  			iommu_domain_free(domain->domain);
>  			list_del(&domain->next);
>  			kfree(domain);
> +			if (!iova_copy_fail && !list_empty(&iommu->domain_list))
> +				vfio_iommu_aper_expand(iommu, &iova_copy);
>  		}
>  		break;
>  	}
>  
> +	if (!iova_copy_fail && !list_empty(&iommu->domain_list)) {
> +		if (!vfio_iommu_resv_refresh(iommu, &iova_copy))
> +			vfio_iommu_iova_insert_copy(iommu, &iova_copy);
> +		else
> +			vfio_iommu_iova_free(&iova_copy);
> +	}

The iova_copy_fail and list_empty tests are rather ugly, could we avoid
them by pushing the tests to the expand and refresh functions?  ie. it
looks like vfio_iommu_aper_expand() could test list_empty(iova_copy),
the list_for_each on domain_list doesn't need special handling.  Same
for vfio_iommu_resv_refresh().  This would also fix the bug above that
I think we don't free iova_copy if domain_list becomes empty during
this operation.  Thanks,

Alex
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
