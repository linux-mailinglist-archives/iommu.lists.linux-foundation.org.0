Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 52EC576F86
	for <lists.iommu@lfdr.de>; Fri, 26 Jul 2019 19:10:01 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A5003DC8;
	Fri, 26 Jul 2019 17:09:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id BA920D13
	for <iommu@lists.linux-foundation.org>;
	Fri, 26 Jul 2019 17:09:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 37B3C8A0
	for <iommu@lists.linux-foundation.org>;
	Fri, 26 Jul 2019 17:09:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B16F25AFD9;
	Fri, 26 Jul 2019 17:09:50 +0000 (UTC)
Received: from [10.36.116.102] (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F2771711C;
	Fri, 26 Jul 2019 17:09:44 +0000 (UTC)
Subject: Re: [PATCH v8 2/6] vfio/type1: Check reserved region conflict and
	update iova list
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	alex.williamson@redhat.com
References: <20190723160637.8384-1-shameerali.kolothum.thodi@huawei.com>
	<20190723160637.8384-3-shameerali.kolothum.thodi@huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <f8cf7545-2f8c-d1d9-dc51-e787c1a881fb@redhat.com>
Date: Fri, 26 Jul 2019 19:09:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190723160637.8384-3-shameerali.kolothum.thodi@huawei.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Fri, 26 Jul 2019 17:09:50 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kevin.tian@intel.com, kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
	xuwei5@hisilicon.com, linuxarm@huawei.com, iommu@lists.linux-foundation.org
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

Hi Shameer,

On 7/23/19 6:06 PM, Shameer Kolothum wrote:
> This retrieves the reserved regions associated with dev group and
> checks for conflicts with any existing dma mappings. Also update
> the iova list excluding the reserved regions.
> 
> Reserved regions with type IOMMU_RESV_DIRECT_RELAXABLE are
> excluded from above checks as they are considered as directly
> mapped regions which are known to be relaxable.
> 
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
> ---
> v7-->v8
>  -Added check for iommu_get_group_resv_regions() error ret.
> 
> ---
>  drivers/vfio/vfio_iommu_type1.c | 98 +++++++++++++++++++++++++++++++++
>  1 file changed, 98 insertions(+)
> 
> diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
> index 6a69652b406b..a3c9794ccf83 100644
> --- a/drivers/vfio/vfio_iommu_type1.c
> +++ b/drivers/vfio/vfio_iommu_type1.c
> @@ -1496,6 +1496,88 @@ static int vfio_iommu_aper_resize(struct list_head *iova,
>  	return 0;
>  }
>  
> +/*
> + * Check reserved region conflicts with existing dma mappings
> + */
> +static bool vfio_iommu_resv_conflict(struct vfio_iommu *iommu,
> +				     struct list_head *resv_regions)
> +{
> +	struct iommu_resv_region *region;
> +
> +	/* Check for conflict with existing dma mappings */
> +	list_for_each_entry(region, resv_regions, list) {
> +		if (region->type == IOMMU_RESV_DIRECT_RELAXABLE)
> +			continue;
> +
> +		if (vfio_find_dma(iommu, region->start, region->length))
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
> +/*
> + * Check iova region overlap with  reserved regions and
> + * exclude them from the iommu iova range
> + */
> +static int vfio_iommu_resv_exclude(struct list_head *iova,
> +				   struct list_head *resv_regions)
> +{
> +	struct iommu_resv_region *resv;
> +	struct vfio_iova *n, *next;
> +
> +	list_for_each_entry(resv, resv_regions, list) {
> +		phys_addr_t start, end;
> +
> +		if (resv->type == IOMMU_RESV_DIRECT_RELAXABLE)
> +			continue;
> +
> +		start = resv->start;
> +		end = resv->start + resv->length - 1;
> +
> +		list_for_each_entry_safe(n, next, iova, list) {
> +			int ret = 0;
> +
> +			/* No overlap */
> +			if (start > n->end || end < n->start)
> +				continue;
> +			/*
> +			 * Insert a new node if current node overlaps with the
> +			 * reserve region to exlude that from valid iova range.
> +			 * Note that, new node is inserted before the current
> +			 * node and finally the current node is deleted keeping
> +			 * the list updated and sorted.
> +			 */
> +			if (start > n->start)
> +				ret = vfio_iommu_iova_insert(&n->list, n->start,
> +							     start - 1);
> +			if (!ret && end < n->end)
> +				ret = vfio_iommu_iova_insert(&n->list, end + 1,
> +							     n->end);
> +			if (ret)
> +				return ret;
> +
> +			list_del(&n->list);
> +			kfree(n);
> +		}
> +	}
> +
> +	if (list_empty(iova))
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static void vfio_iommu_resv_free(struct list_head *resv_regions)
> +{
> +	struct iommu_resv_region *n, *next;
> +
> +	list_for_each_entry_safe(n, next, resv_regions, list) {
> +		list_del(&n->list);
> +		kfree(n);
> +	}
> +}
> +
>  static void vfio_iommu_iova_free(struct list_head *iova)
>  {
>  	struct vfio_iova *n, *next;
> @@ -1547,6 +1629,7 @@ static int vfio_iommu_type1_attach_group(void *iommu_data,
>  	phys_addr_t resv_msi_base;
>  	struct iommu_domain_geometry geo;
>  	LIST_HEAD(iova_copy);
> +	LIST_HEAD(group_resv_regions);
>  
>  	mutex_lock(&iommu->lock);
>  
> @@ -1632,6 +1715,15 @@ static int vfio_iommu_type1_attach_group(void *iommu_data,
>  		goto out_detach;
>  	}
>  
> +	ret = iommu_get_group_resv_regions(iommu_group, &group_resv_regions);
> +	if (ret)
> +		goto out_detach;
> +
> +	if (vfio_iommu_resv_conflict(iommu, &group_resv_regions)) {
> +		ret = -EINVAL;
> +		goto out_detach;
> +	}
> +
>  	/*
>  	 * We don't want to work on the original iova list as the list
>  	 * gets modified and in case of failure we have to retain the
> @@ -1646,6 +1738,10 @@ static int vfio_iommu_type1_attach_group(void *iommu_data,
>  	if (ret)
>  		goto out_detach;
>  
> +	ret = vfio_iommu_resv_exclude(&iova_copy, &group_resv_regions);
> +	if (ret)
> +		goto out_detach;
> +
>  	resv_msi = vfio_iommu_has_sw_msi(iommu_group, &resv_msi_base);
>  
>  	INIT_LIST_HEAD(&domain->group_list);
> @@ -1706,6 +1802,7 @@ static int vfio_iommu_type1_attach_group(void *iommu_data,
>  	/* Delete the old one and insert new iova list */
>  	vfio_iommu_iova_insert_copy(iommu, &iova_copy);
>  	mutex_unlock(&iommu->lock);
> +	vfio_iommu_resv_free(&group_resv_regions);
>  
>  	return 0;
>  
> @@ -1714,6 +1811,7 @@ static int vfio_iommu_type1_attach_group(void *iommu_data,
>  out_domain:
>  	iommu_domain_free(domain->domain);
>  	vfio_iommu_iova_free(&iova_copy);
> +	vfio_iommu_resv_free(&group_resv_regions);
>  out_free:
>  	kfree(domain);
>  	kfree(group);
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
