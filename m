Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 15328223D4C
	for <lists.iommu@lfdr.de>; Fri, 17 Jul 2020 15:50:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id BF1328805B;
	Fri, 17 Jul 2020 13:50:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ayUFuwsQI9hr; Fri, 17 Jul 2020 13:50:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2435D8805A;
	Fri, 17 Jul 2020 13:50:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 02C81C0733;
	Fri, 17 Jul 2020 13:50:13 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CD00DC0733
 for <iommu@lists.linux-foundation.org>; Fri, 17 Jul 2020 13:50:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C288686403
 for <iommu@lists.linux-foundation.org>; Fri, 17 Jul 2020 13:50:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NvqMewkSPjbW for <iommu@lists.linux-foundation.org>;
 Fri, 17 Jul 2020 13:50:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0E554863FF
 for <iommu@lists.linux-foundation.org>; Fri, 17 Jul 2020 13:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594993809;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dcHL5Gwf2cNMmUnAC8MA2309ICcr5tCWf4feov7XWtY=;
 b=VaLmuHUGvjecndC25aMdExKS+m4ddFwgdImTJjZ909bujK/roGm9hVY5+c+lsLJcvjHYea
 o6t+FVplT9Lx2qfvvLqCqPHjdkHYNFLrbDnmn4KD7l0U0fczuogwItVVFdWRoPCzLvJZ3/
 EtvSDhWDoQCgHyqgHVFNDgisqbvDV/E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-445-AjpvzSP6N-mgvvxTIcmhEw-1; Fri, 17 Jul 2020 09:50:06 -0400
X-MC-Unique: AjpvzSP6N-mgvvxTIcmhEw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B73211080;
 Fri, 17 Jul 2020 13:50:04 +0000 (UTC)
Received: from [10.36.115.54] (ovpn-115-54.ams2.redhat.com [10.36.115.54])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0CCAE78A45;
 Fri, 17 Jul 2020 13:49:58 +0000 (UTC)
Subject: Re: [PATCH v5 3/5] iommu/uapi: Use named union for user data
To: Jacob Pan <jacob.jun.pan@linux.intel.com>,
 iommu@lists.linux-foundation.org, LKML <linux-kernel@vger.kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Alex Williamson <alex.williamson@redhat.com>
References: <1594925117-64892-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1594925117-64892-4-git-send-email-jacob.jun.pan@linux.intel.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <6eb6a528-0786-7554-47a6-a50ed2804977@redhat.com>
Date: Fri, 17 Jul 2020 15:49:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1594925117-64892-4-git-send-email-jacob.jun.pan@linux.intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Raj Ashok <ashok.raj@intel.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>,
 Christoph Hellwig <hch@infradead.org>, David Woodhouse <dwmw2@infradead.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Hi Jacob,

On 7/16/20 8:45 PM, Jacob Pan wrote:
> IOMMU UAPI data size is filled by the user space which must be validated
> by ther kernel. To ensure backward compatibility, user data can only be
s/ther/the
> extended by either re-purpose padding bytes or extend the variable sized
> union at the end. No size change is allowed before the union. Therefore,
> the minimum size is the offset of the union.
> 
> To use offsetof() on the union, we must make it named.
> 
> Link: https://lore.kernel.org/linux-iommu/20200611145518.0c2817d6@x1.home/
> Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
> ---
>  drivers/iommu/intel/iommu.c | 24 ++++++++++++------------
>  drivers/iommu/intel/svm.c   |  2 +-
>  include/uapi/linux/iommu.h  |  4 ++--
>  3 files changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
> index 6ad8b6f20235..f3a6ca88cf95 100644
> --- a/drivers/iommu/intel/iommu.c
> +++ b/drivers/iommu/intel/iommu.c
> @@ -5409,8 +5409,8 @@ intel_iommu_sva_invalidate(struct iommu_domain *domain, struct device *dev,
>  
>  	/* Size is only valid in address selective invalidation */
>  	if (inv_info->granularity == IOMMU_INV_GRANU_ADDR)
> -		size = to_vtd_size(inv_info->addr_info.granule_size,
> -				   inv_info->addr_info.nb_granules);
> +		size = to_vtd_size(inv_info->granu.addr_info.granule_size,
> +				   inv_info->granu.addr_info.nb_granules);
>  
>  	for_each_set_bit(cache_type,
>  			 (unsigned long *)&inv_info->cache,
> @@ -5432,20 +5432,20 @@ intel_iommu_sva_invalidate(struct iommu_domain *domain, struct device *dev,
>  		 * granularity.
>  		 */
>  		if (inv_info->granularity == IOMMU_INV_GRANU_PASID &&
> -		    (inv_info->pasid_info.flags & IOMMU_INV_PASID_FLAGS_PASID))
> -			pasid = inv_info->pasid_info.pasid;
> +		    (inv_info->granu.pasid_info.flags & IOMMU_INV_PASID_FLAGS_PASID))
> +			pasid = inv_info->granu.pasid_info.pasid;
>  		else if (inv_info->granularity == IOMMU_INV_GRANU_ADDR &&
> -			 (inv_info->addr_info.flags & IOMMU_INV_ADDR_FLAGS_PASID))
> -			pasid = inv_info->addr_info.pasid;
> +			 (inv_info->granu.addr_info.flags & IOMMU_INV_ADDR_FLAGS_PASID))
> +			pasid = inv_info->granu.addr_info.pasid;
>  
>  		switch (BIT(cache_type)) {
>  		case IOMMU_CACHE_INV_TYPE_IOTLB:
>  			/* HW will ignore LSB bits based on address mask */
>  			if (inv_info->granularity == IOMMU_INV_GRANU_ADDR &&
>  			    size &&
> -			    (inv_info->addr_info.addr & ((BIT(VTD_PAGE_SHIFT + size)) - 1))) {
> +			    (inv_info->granu.addr_info.addr & ((BIT(VTD_PAGE_SHIFT + size)) - 1))) {
>  				WARN_ONCE(1, "Address out of range, 0x%llx, size order %llu\n",
> -					  inv_info->addr_info.addr, size);
> +					  inv_info->granu.addr_info.addr, size);
>  			}
>  
>  			/*
> @@ -5453,9 +5453,9 @@ intel_iommu_sva_invalidate(struct iommu_domain *domain, struct device *dev,
>  			 * We use npages = -1 to indicate that.
>  			 */
>  			qi_flush_piotlb(iommu, did, pasid,
> -					mm_to_dma_pfn(inv_info->addr_info.addr),
> +					mm_to_dma_pfn(inv_info->granu.addr_info.addr),
>  					(granu == QI_GRAN_NONG_PASID) ? -1 : 1 << size,
> -					inv_info->addr_info.flags & IOMMU_INV_ADDR_FLAGS_LEAF);
> +					inv_info->granu.addr_info.flags & IOMMU_INV_ADDR_FLAGS_LEAF);
>  
>  			if (!info->ats_enabled)
>  				break;
> @@ -5476,13 +5476,13 @@ intel_iommu_sva_invalidate(struct iommu_domain *domain, struct device *dev,
>  				size = 64 - VTD_PAGE_SHIFT;
>  				addr = 0;
>  			} else if (inv_info->granularity == IOMMU_INV_GRANU_ADDR)
> -				addr = inv_info->addr_info.addr;
> +				addr = inv_info->granu.addr_info.addr;
>  
>  			if (info->ats_enabled)
>  				qi_flush_dev_iotlb_pasid(iommu, sid,
>  						info->pfsid, pasid,
>  						info->ats_qdep,
> -						inv_info->addr_info.addr,
> +						inv_info->granu.addr_info.addr,
>  						size);
>  			else
>  				pr_warn_ratelimited("Passdown device IOTLB flush w/o ATS!\n");
> diff --git a/drivers/iommu/intel/svm.c b/drivers/iommu/intel/svm.c
> index d386853121a2..713b3a218483 100644
> --- a/drivers/iommu/intel/svm.c
> +++ b/drivers/iommu/intel/svm.c
> @@ -338,7 +338,7 @@ int intel_svm_bind_gpasid(struct iommu_domain *domain, struct device *dev,
>  	spin_lock(&iommu->lock);
>  	ret = intel_pasid_setup_nested(iommu, dev,
>  				       (pgd_t *)(uintptr_t)data->gpgd,
> -				       data->hpasid, &data->vtd, dmar_domain,
> +				       data->hpasid, &data->vendor.vtd, dmar_domain,
>  				       data->addr_width);
>  	spin_unlock(&iommu->lock);
>  	if (ret) {
> diff --git a/include/uapi/linux/iommu.h b/include/uapi/linux/iommu.h
> index d5e9014f690e..7c8e075c2b29 100644
> --- a/include/uapi/linux/iommu.h
> +++ b/include/uapi/linux/iommu.h
> @@ -263,7 +263,7 @@ struct iommu_cache_invalidate_info {
>  	union {
>  		struct iommu_inv_pasid_info pasid_info;
>  		struct iommu_inv_addr_info addr_info;
> -	};
> +	} granu;
>  };
>  
>  /**
> @@ -329,7 +329,7 @@ struct iommu_gpasid_bind_data {
>  	/* Vendor specific data */
>  	union {
>  		struct iommu_gpasid_bind_data_vtd vtd;
> -	};
> +	} vendor;
>  };
>  
>  #endif /* _UAPI_IOMMU_H */
> 

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
