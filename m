Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 32311206C59
	for <lists.iommu@lfdr.de>; Wed, 24 Jun 2020 08:30:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id BC68B20113;
	Wed, 24 Jun 2020 06:30:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n62PPsex+OI3; Wed, 24 Jun 2020 06:30:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id B12972051D;
	Wed, 24 Jun 2020 06:30:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 93604C016F;
	Wed, 24 Jun 2020 06:30:04 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2D26AC016F
 for <iommu@lists.linux-foundation.org>; Wed, 24 Jun 2020 06:30:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 141AD87624
 for <iommu@lists.linux-foundation.org>; Wed, 24 Jun 2020 06:30:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eqwQLcQxg8XU for <iommu@lists.linux-foundation.org>;
 Wed, 24 Jun 2020 06:30:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 46FEF87617
 for <iommu@lists.linux-foundation.org>; Wed, 24 Jun 2020 06:30:02 +0000 (UTC)
IronPort-SDR: Aq+M8j94MgS3Ihj5rlqSmE1zTwbIobF8EEp2Zh3+KTzNNaFznlNzXDf88FazUi1zI5n6Eg51cm
 PFxB3H+K3dUw==
X-IronPort-AV: E=McAfee;i="6000,8403,9661"; a="132778393"
X-IronPort-AV: E=Sophos;i="5.75,274,1589266800"; d="scan'208";a="132778393"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2020 23:30:01 -0700
IronPort-SDR: heLb5YqZ34s7Gf1o2pn7jMTrEA/w/dhHL5mZWjYGISN0S7EVZuUpysveKoBos56JldFv7oufvg
 RcmiUtbsKi7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,274,1589266800"; d="scan'208";a="423268446"
Received: from msaix-mobl2.ccr.corp.intel.com (HELO [10.255.28.245])
 ([10.255.28.245])
 by orsmga004.jf.intel.com with ESMTP; 23 Jun 2020 23:29:58 -0700
Subject: Re: [PATCH v3 3/5] iommu/uapi: Use named union for user data
To: Jacob Pan <jacob.jun.pan@linux.intel.com>,
 iommu@lists.linux-foundation.org, LKML <linux-kernel@vger.kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Alex Williamson <alex.williamson@redhat.com>
References: <1592931837-58223-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1592931837-58223-4-git-send-email-jacob.jun.pan@linux.intel.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <96f6d717-e9b3-2a6b-5cff-c38dbe97aa7c@linux.intel.com>
Date: Wed, 24 Jun 2020 14:29:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1592931837-58223-4-git-send-email-jacob.jun.pan@linux.intel.com>
Content-Language: en-US
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Hi Jacob,

On 2020/6/24 1:03, Jacob Pan wrote:
> IOMMU UAPI data size is filled by the user space which must be validated
> by ther kernel. To ensure backward compatibility, user data can only be
> extended by either re-purpose padding bytes or extend the variable sized
> union at the end. No size change is allowed before the union. Therefore,
> the minimum size is the offset of the union.
> 
> To use offsetof() on the union, we must make it named.
> 
> Link: https://lkml.org/lkml/2020/6/11/834
> Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
> ---
>   drivers/iommu/intel/iommu.c | 24 ++++++++++++------------
>   drivers/iommu/intel/svm.c   |  2 +-
>   include/uapi/linux/iommu.h  |  4 ++--
>   3 files changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
> index 50fc62413a35..59cba214ef13 100644
> --- a/drivers/iommu/intel/iommu.c
> +++ b/drivers/iommu/intel/iommu.c
> @@ -5409,8 +5409,8 @@ intel_iommu_sva_invalidate(struct iommu_domain *domain, struct device *dev,
>   
>   	/* Size is only valid in address selective invalidation */
>   	if (inv_info->granularity == IOMMU_INV_GRANU_ADDR)
> -		size = to_vtd_size(inv_info->addr_info.granule_size,
> -				   inv_info->addr_info.nb_granules);
> +		size = to_vtd_size(inv_info->granu.addr_info.granule_size,
> +				   inv_info->granu.addr_info.nb_granules);
>   
>   	for_each_set_bit(cache_type,
>   			 (unsigned long *)&inv_info->cache,
> @@ -5431,20 +5431,20 @@ intel_iommu_sva_invalidate(struct iommu_domain *domain, struct device *dev,
>   		 * granularity.
>   		 */
>   		if (inv_info->granularity == IOMMU_INV_GRANU_PASID &&
> -		    (inv_info->pasid_info.flags & IOMMU_INV_PASID_FLAGS_PASID))
> -			pasid = inv_info->pasid_info.pasid;
> +		    (inv_info->granu.pasid_info.flags & IOMMU_INV_PASID_FLAGS_PASID))
> +			pasid = inv_info->granu.pasid_info.pasid;
>   		else if (inv_info->granularity == IOMMU_INV_GRANU_ADDR &&
> -			 (inv_info->addr_info.flags & IOMMU_INV_ADDR_FLAGS_PASID))
> -			pasid = inv_info->addr_info.pasid;
> +			 (inv_info->granu.addr_info.flags & IOMMU_INV_ADDR_FLAGS_PASID))
> +			pasid = inv_info->granu.addr_info.pasid;
>   
>   		switch (BIT(cache_type)) {
>   		case IOMMU_CACHE_INV_TYPE_IOTLB:
>   			/* HW will ignore LSB bits based on address mask */
>   			if (inv_info->granularity == IOMMU_INV_GRANU_ADDR &&
>   			    size &&
> -			    (inv_info->addr_info.addr & ((BIT(VTD_PAGE_SHIFT + size)) - 1))) {
> +				(inv_info->granu.addr_info.addr & ((BIT(VTD_PAGE_SHIFT + size)) - 1))) {

Nit: Keep it aligned. With this tweaked,

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

Best regards,
baolu

>   				WARN_ONCE(1, "Address out of range, 0x%llx, size order %llu\n",
> -					  inv_info->addr_info.addr, size);
> +					  inv_info->granu.addr_info.addr, size);
>   			}
>   
>   			/*
> @@ -5452,9 +5452,9 @@ intel_iommu_sva_invalidate(struct iommu_domain *domain, struct device *dev,
>   			 * We use npages = -1 to indicate that.
>   			 */
>   			qi_flush_piotlb(iommu, did, pasid,
> -					mm_to_dma_pfn(inv_info->addr_info.addr),
> +					mm_to_dma_pfn(inv_info->granu.addr_info.addr),
>   					(granu == QI_GRAN_NONG_PASID) ? -1 : 1 << size,
> -					inv_info->addr_info.flags & IOMMU_INV_ADDR_FLAGS_LEAF);
> +					inv_info->granu.addr_info.flags & IOMMU_INV_ADDR_FLAGS_LEAF);
>   
>   			if (!info->ats_enabled)
>   				break;
> @@ -5475,13 +5475,13 @@ intel_iommu_sva_invalidate(struct iommu_domain *domain, struct device *dev,
>   				size = 64 - VTD_PAGE_SHIFT;
>   				addr = 0;
>   			} else if (inv_info->granularity == IOMMU_INV_GRANU_ADDR)
> -				addr = inv_info->addr_info.addr;
> +				addr = inv_info->granu.addr_info.addr;
>   
>   			if (info->ats_enabled)
>   				qi_flush_dev_iotlb_pasid(iommu, sid,
>   						info->pfsid, pasid,
>   						info->ats_qdep,
> -						inv_info->addr_info.addr,
> +						inv_info->granu.addr_info.addr,
>   						size);
>   			else
>   				pr_warn_ratelimited("Passdown device IOTLB flush w/o ATS!\n");
> diff --git a/drivers/iommu/intel/svm.c b/drivers/iommu/intel/svm.c
> index d386853121a2..713b3a218483 100644
> --- a/drivers/iommu/intel/svm.c
> +++ b/drivers/iommu/intel/svm.c
> @@ -338,7 +338,7 @@ int intel_svm_bind_gpasid(struct iommu_domain *domain, struct device *dev,
>   	spin_lock(&iommu->lock);
>   	ret = intel_pasid_setup_nested(iommu, dev,
>   				       (pgd_t *)(uintptr_t)data->gpgd,
> -				       data->hpasid, &data->vtd, dmar_domain,
> +				       data->hpasid, &data->vendor.vtd, dmar_domain,
>   				       data->addr_width);
>   	spin_unlock(&iommu->lock);
>   	if (ret) {
> diff --git a/include/uapi/linux/iommu.h b/include/uapi/linux/iommu.h
> index 303f148a5cd7..1afc6610b0ad 100644
> --- a/include/uapi/linux/iommu.h
> +++ b/include/uapi/linux/iommu.h
> @@ -263,7 +263,7 @@ struct iommu_cache_invalidate_info {
>   	union {
>   		struct iommu_inv_pasid_info pasid_info;
>   		struct iommu_inv_addr_info addr_info;
> -	};
> +	} granu;
>   };
>   
>   /**
> @@ -329,7 +329,7 @@ struct iommu_gpasid_bind_data {
>   	/* Vendor specific data */
>   	union {
>   		struct iommu_gpasid_bind_data_vtd vtd;
> -	};
> +	} vendor;
>   };
>   
>   #endif /* _UAPI_IOMMU_H */
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
