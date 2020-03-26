Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 8105C193EA8
	for <lists.iommu@lfdr.de>; Thu, 26 Mar 2020 13:09:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 32F8B227FF;
	Thu, 26 Mar 2020 12:09:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7syLZR6JAint; Thu, 26 Mar 2020 12:09:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 2ED9326150;
	Thu, 26 Mar 2020 12:09:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 17B75C1DC9;
	Thu, 26 Mar 2020 12:09:42 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 10308C1D7F;
 Thu, 26 Mar 2020 12:09:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0C86A890D5;
 Thu, 26 Mar 2020 12:09:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dv9lK4BDWq+l; Thu, 26 Mar 2020 12:09:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by hemlock.osuosl.org (Postfix) with ESMTP id 3F373890BA;
 Thu, 26 Mar 2020 12:09:39 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A7BC130E;
 Thu, 26 Mar 2020 05:09:38 -0700 (PDT)
Received: from [10.57.61.73] (unknown [10.57.61.73])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B11703F71F;
 Thu, 26 Mar 2020 05:09:37 -0700 (PDT)
Subject: Re: [PATCH v2 2/3] iommu/virtio: Fix freeing of incomplete domains
To: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 iommu@lists.linux-foundation.org
References: <20200326093558.2641019-1-jean-philippe@linaro.org>
 <20200326093558.2641019-3-jean-philippe@linaro.org>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <9d5f4c7d-e4ce-6351-fcd3-520eb7d5a963@arm.com>
Date: Thu, 26 Mar 2020 12:09:32 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200326093558.2641019-3-jean-philippe@linaro.org>
Content-Language: en-GB
Cc: bbhushan2@marvell.com, virtualization@lists.linux-foundation.org,
 jasowang@redhat.com, mst@redhat.com
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 2020-03-26 9:35 am, Jean-Philippe Brucker wrote:
> Calling viommu_domain_free() on a domain that hasn't been finalised (not
> attached to any device, for example) can currently cause an Oops,
> because we attempt to call ida_free() on ID 0, which may either be
> unallocated or used by another domain.
> 
> Only initialise the vdomain->viommu pointer, which denotes a finalised
> domain, at the end of a successful viommu_domain_finalise().

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Fixes: edcd69ab9a32 ("iommu: Add virtio-iommu driver")
> Reported-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>   drivers/iommu/virtio-iommu.c | 16 +++++++++-------
>   1 file changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/iommu/virtio-iommu.c b/drivers/iommu/virtio-iommu.c
> index cce329d71fba..5eed75cd121f 100644
> --- a/drivers/iommu/virtio-iommu.c
> +++ b/drivers/iommu/virtio-iommu.c
> @@ -613,18 +613,20 @@ static int viommu_domain_finalise(struct viommu_dev *viommu,
>   	int ret;
>   	struct viommu_domain *vdomain = to_viommu_domain(domain);
>   
> -	vdomain->viommu		= viommu;
> -	vdomain->map_flags	= viommu->map_flags;
> +	ret = ida_alloc_range(&viommu->domain_ids, viommu->first_domain,
> +			      viommu->last_domain, GFP_KERNEL);
> +	if (ret < 0)
> +		return ret;
> +
> +	vdomain->id		= (unsigned int)ret;
>   
>   	domain->pgsize_bitmap	= viommu->pgsize_bitmap;
>   	domain->geometry	= viommu->geometry;
>   
> -	ret = ida_alloc_range(&viommu->domain_ids, viommu->first_domain,
> -			      viommu->last_domain, GFP_KERNEL);
> -	if (ret >= 0)
> -		vdomain->id = (unsigned int)ret;
> +	vdomain->map_flags	= viommu->map_flags;
> +	vdomain->viommu		= viommu;
>   
> -	return ret > 0 ? 0 : ret;
> +	return 0;
>   }
>   
>   static void viommu_domain_free(struct iommu_domain *domain)
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
