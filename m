Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC2425BE12
	for <lists.iommu@lfdr.de>; Thu,  3 Sep 2020 11:07:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 5682622794;
	Thu,  3 Sep 2020 09:07:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gVfAtJbHPbOY; Thu,  3 Sep 2020 09:07:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id F379E230FB;
	Thu,  3 Sep 2020 09:07:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E5497C0051;
	Thu,  3 Sep 2020 09:07:10 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B321BC0051
 for <iommu@lists.linux-foundation.org>; Thu,  3 Sep 2020 09:07:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A38DE87376
 for <iommu@lists.linux-foundation.org>; Thu,  3 Sep 2020 09:07:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hcLCHk9Ik44d for <iommu@lists.linux-foundation.org>;
 Thu,  3 Sep 2020 09:07:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 87C2887367
 for <iommu@lists.linux-foundation.org>; Thu,  3 Sep 2020 09:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599124027;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1NePYOylsoUNg7FX+qEpFm7qnx+TisVB3ol0/4H6J0Q=;
 b=erfhi1dJy5wyxJrId4Oz6VOya6BgvV2YS4mSxFN0BugpiDqMBUb+12vYT9qPWpMXNVo438
 A2G4LKt/gb9SRQGTZVnN1CHq04YwbGlr9bryCMnBU/RLiP+Fr22ZWY8XGBT8V0CipFUPU9
 O03GxqjyFxzRlkkLZQuZEin46XB/Nf0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-415-M_-eGjH1OZOyRNEoB-bmPA-1; Thu, 03 Sep 2020 05:07:04 -0400
X-MC-Unique: M_-eGjH1OZOyRNEoB-bmPA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6BB1C1DE03;
 Thu,  3 Sep 2020 09:07:02 +0000 (UTC)
Received: from [10.36.112.51] (ovpn-112-51.ams2.redhat.com [10.36.112.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D13545C1C2;
 Thu,  3 Sep 2020 09:06:55 +0000 (UTC)
Subject: Re: [PATCH v8 6/7] iommu/uapi: Handle data and argsz filled by users
To: Jacob Pan <jacob.pan.linux@gmail.com>, iommu@lists.linux-foundation.org,
 LKML <linux-kernel@vger.kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Alex Williamson <alex.williamson@redhat.com>
References: <1598898300-65475-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1598898300-65475-7-git-send-email-jacob.jun.pan@linux.intel.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <25ddf853-680a-2931-1f04-73474fd54f9d@redhat.com>
Date: Thu, 3 Sep 2020 11:06:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1598898300-65475-7-git-send-email-jacob.jun.pan@linux.intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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

On 8/31/20 8:24 PM, Jacob Pan wrote:
> IOMMU user APIs are responsible for processing user data. This patch
> changes the interface such that user pointers can be passed into IOMMU
> code directly. Separate kernel APIs without user pointers are introduced
> for in-kernel users of the UAPI functionality.
> 
> IOMMU UAPI data has a user filled argsz field which indicates the data
> length of the structure. User data is not trusted, argsz must be
> validated based on the current kernel data size, mandatory data size,
> and feature flags.
If I am not wrong there is no change compared to
https://lkml.org/lkml/2020/8/13/215, besides rebase.

So despite the minor comment(s) I had,

Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric

> 
> User data may also be extended, resulting in possible argsz increase.
> Backward compatibility is ensured based on size and flags (or
> the functional equivalent fields) checking.
> 
> This patch adds sanity checks in the IOMMU layer. In addition to argsz,
> reserved/unused fields in padding, flags, and version are also checked.
> Details are documented in Documentation/userspace-api/iommu.rst
> 
> Signed-off-by: Liu Yi L <yi.l.liu@intel.com>
> Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
> ---
>  drivers/iommu/iommu.c | 201 ++++++++++++++++++++++++++++++++++++++++++++++++--
>  include/linux/iommu.h |  28 ++++---
>  2 files changed, 212 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index 4ae02291ccc2..3bc263ae31ed 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -1961,33 +1961,218 @@ int iommu_attach_device(struct iommu_domain *domain, struct device *dev)
>  }
>  EXPORT_SYMBOL_GPL(iommu_attach_device);
>  
> +/*
> + * Check flags and other user provided data for valid combinations. We also
> + * make sure no reserved fields or unused flags are set. This is to ensure
> + * not breaking userspace in the future when these fields or flags are used.
> + */
> +static int iommu_check_cache_invl_data(struct iommu_cache_invalidate_info *info)
> +{
> +	u32 mask;
> +	int i;
> +
> +	if (info->version != IOMMU_CACHE_INVALIDATE_INFO_VERSION_1)
> +		return -EINVAL;
> +
> +	mask = (1 << IOMMU_CACHE_INV_TYPE_NR) - 1;
> +	if (info->cache & ~mask)
> +		return -EINVAL;
> +
> +	if (info->granularity >= IOMMU_INV_GRANU_NR)
> +		return -EINVAL;
> +
> +	switch (info->granularity) {
> +	case IOMMU_INV_GRANU_ADDR:
> +		if (info->cache & IOMMU_CACHE_INV_TYPE_PASID)
> +			return -EINVAL;
> +
> +		mask = IOMMU_INV_ADDR_FLAGS_PASID |
> +			IOMMU_INV_ADDR_FLAGS_ARCHID |
> +			IOMMU_INV_ADDR_FLAGS_LEAF;
> +
> +		if (info->granu.addr_info.flags & ~mask)
> +			return -EINVAL;
> +		break;
> +	case IOMMU_INV_GRANU_PASID:
> +		mask = IOMMU_INV_PASID_FLAGS_PASID |
> +			IOMMU_INV_PASID_FLAGS_ARCHID;
> +		if (info->granu.pasid_info.flags & ~mask)
> +			return -EINVAL;
> +
> +		break;
> +	case IOMMU_INV_GRANU_DOMAIN:
> +		if (info->cache & IOMMU_CACHE_INV_TYPE_DEV_IOTLB)
> +			return -EINVAL;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	/* Check reserved padding fields */
> +	for (i = 0; i < sizeof(info->padding); i++) {
> +		if (info->padding[i])
> +			return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
>  int iommu_uapi_cache_invalidate(struct iommu_domain *domain, struct device *dev,
> -				struct iommu_cache_invalidate_info *inv_info)
> +				void __user *uinfo)
>  {
> +	struct iommu_cache_invalidate_info inv_info = { 0 };
> +	u32 minsz;
> +	int ret = 0;
> +
>  	if (unlikely(!domain->ops->cache_invalidate))
>  		return -ENODEV;
>  
> -	return domain->ops->cache_invalidate(domain, dev, inv_info);
> +	/*
> +	 * No new spaces can be added before the variable sized union, the
> +	 * minimum size is the offset to the union.
> +	 */
> +	minsz = offsetof(struct iommu_cache_invalidate_info, granu);
> +
> +	/* Copy minsz from user to get flags and argsz */
> +	if (copy_from_user(&inv_info, uinfo, minsz))
> +		return -EFAULT;
> +
> +	/* Fields before variable size union is mandatory */
> +	if (inv_info.argsz < minsz)
> +		return -EINVAL;
> +
> +	/* PASID and address granu require additional info beyond minsz */
> +	if (inv_info.argsz == minsz &&
> +	    ((inv_info.granularity == IOMMU_INV_GRANU_PASID) ||
> +		    (inv_info.granularity == IOMMU_INV_GRANU_ADDR)))
> +		return -EINVAL;
> +
> +	if (inv_info.granularity == IOMMU_INV_GRANU_PASID &&
> +	    inv_info.argsz < offsetofend(struct iommu_cache_invalidate_info, granu.pasid_info))
> +		return -EINVAL;
> +
> +	if (inv_info.granularity == IOMMU_INV_GRANU_ADDR &&
> +	    inv_info.argsz < offsetofend(struct iommu_cache_invalidate_info, granu.addr_info))
> +		return -EINVAL;
> +
> +	/*
> +	 * User might be using a newer UAPI header which has a larger data
> +	 * size, we shall support the existing flags within the current
> +	 * size. Copy the remaining user data _after_ minsz but not more
> +	 * than the current kernel supported size.
> +	 */
> +	if (copy_from_user((void *)&inv_info + minsz, uinfo + minsz,
> +			   min_t(u32, inv_info.argsz, sizeof(inv_info)) - minsz))
> +		return -EFAULT;
> +
> +	/* Now the argsz is validated, check the content */
> +	ret = iommu_check_cache_invl_data(&inv_info);
> +	if (ret)
> +		return ret;
> +
> +	return domain->ops->cache_invalidate(domain, dev, &inv_info);
>  }
>  EXPORT_SYMBOL_GPL(iommu_uapi_cache_invalidate);
>  
> -int iommu_uapi_sva_bind_gpasid(struct iommu_domain *domain,
> -			       struct device *dev, struct iommu_gpasid_bind_data *data)
> +static int iommu_check_bind_data(struct iommu_gpasid_bind_data *data)
> +{
> +	u32 mask;
> +	int i;
> +
> +	if (data->version != IOMMU_GPASID_BIND_VERSION_1)
> +		return -EINVAL;
> +
> +	/* Check the range of supported formats */
> +	if (data->format >= IOMMU_PASID_FORMAT_LAST)
> +		return -EINVAL;
> +
> +	/* Check all flags */
> +	mask = IOMMU_SVA_GPASID_VAL;
> +	if (data->flags & ~mask)
> +		return -EINVAL;
> +
> +	/* Check reserved padding fields */
> +	for (i = 0; i < sizeof(data->padding); i++) {
> +		if (data->padding[i])
> +			return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int iommu_sva_prepare_bind_data(void __user *udata,
> +				       struct iommu_gpasid_bind_data *data)
>  {
> +	u32 minsz;
> +
> +	/*
> +	 * No new spaces can be added before the variable sized union, the
> +	 * minimum size is the offset to the union.
> +	 */
> +	minsz = offsetof(struct iommu_gpasid_bind_data, vendor);
> +
> +	/* Copy minsz from user to get flags and argsz */
> +	if (copy_from_user(data, udata, minsz))
> +		return -EFAULT;
> +
> +	/* Fields before variable size union is mandatory */
> +	if (data->argsz < minsz)
> +		return -EINVAL;
> +	/*
> +	 * User might be using a newer UAPI header, we shall let IOMMU vendor
> +	 * driver decide on what size it needs. Since the guest PASID bind data
> +	 * can be vendor specific, larger argsz could be the result of extension
> +	 * for one vendor but it should not affect another vendor.
> +	 * Copy the remaining user data _after_ minsz
> +	 */
> +	if (copy_from_user((void *)data + minsz, udata + minsz,
> +			   min_t(u32, data->argsz, sizeof(*data)) - minsz))
> +		return -EFAULT;
> +
> +	return iommu_check_bind_data(data);
> +}
> +
> +int iommu_uapi_sva_bind_gpasid(struct iommu_domain *domain, struct device *dev,
> +			       void __user *udata)
> +{
> +	struct iommu_gpasid_bind_data data = { 0 };
> +	int ret;
> +
>  	if (unlikely(!domain->ops->sva_bind_gpasid))
>  		return -ENODEV;
>  
> -	return domain->ops->sva_bind_gpasid(domain, dev, data);
> +	ret = iommu_sva_prepare_bind_data(udata, &data);
> +	if (ret)
> +		return ret;
> +
> +	return domain->ops->sva_bind_gpasid(domain, dev, &data);
>  }
>  EXPORT_SYMBOL_GPL(iommu_uapi_sva_bind_gpasid);
>  
> -int iommu_uapi_sva_unbind_gpasid(struct iommu_domain *domain, struct device *dev,
> -				 ioasid_t pasid)
> +int iommu_sva_unbind_gpasid(struct iommu_domain *domain, struct device *dev,
> +			    struct iommu_gpasid_bind_data *data)
>  {
>  	if (unlikely(!domain->ops->sva_unbind_gpasid))
>  		return -ENODEV;
>  
> -	return domain->ops->sva_unbind_gpasid(dev, pasid);
> +	return domain->ops->sva_unbind_gpasid(dev, data->hpasid);
> +}
> +EXPORT_SYMBOL_GPL(iommu_sva_unbind_gpasid);
> +
> +int iommu_uapi_sva_unbind_gpasid(struct iommu_domain *domain, struct device *dev,
> +				 void __user *udata)
> +{
> +	struct iommu_gpasid_bind_data data = { 0 };
> +	int ret;
> +
> +	if (unlikely(!domain->ops->sva_bind_gpasid))
> +		return -ENODEV;
> +
> +	ret = iommu_sva_prepare_bind_data(udata, &data);
> +	if (ret)
> +		return ret;
> +
> +	return iommu_sva_unbind_gpasid(domain, dev, &data);
>  }
>  EXPORT_SYMBOL_GPL(iommu_uapi_sva_unbind_gpasid);
>  
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index 710d5d2691eb..c364b1c038da 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -426,11 +426,14 @@ extern void iommu_detach_device(struct iommu_domain *domain,
>  				struct device *dev);
>  extern int iommu_uapi_cache_invalidate(struct iommu_domain *domain,
>  				       struct device *dev,
> -				       struct iommu_cache_invalidate_info *inv_info);
> +				       void __user *uinfo);
> +
>  extern int iommu_uapi_sva_bind_gpasid(struct iommu_domain *domain,
> -				      struct device *dev, struct iommu_gpasid_bind_data *data);
> +				      struct device *dev, void __user *udata);
>  extern int iommu_uapi_sva_unbind_gpasid(struct iommu_domain *domain,
> -					struct device *dev, ioasid_t pasid);
> +					struct device *dev, void __user *udata);
> +extern int iommu_sva_unbind_gpasid(struct iommu_domain *domain,
> +				   struct device *dev, struct iommu_gpasid_bind_data *data);
>  extern struct iommu_domain *iommu_get_domain_for_dev(struct device *dev);
>  extern struct iommu_domain *iommu_get_dma_domain(struct device *dev);
>  extern int iommu_map(struct iommu_domain *domain, unsigned long iova,
> @@ -1032,22 +1035,29 @@ static inline int iommu_sva_get_pasid(struct iommu_sva *handle)
>  	return IOMMU_PASID_INVALID;
>  }
>  
> -static inline int iommu_uapi_cache_invalidate(struct iommu_domain *domain,
> -					      struct device *dev,
> -					      struct iommu_cache_invalidate_info *inv_info)
> +static inline int
> +iommu_uapi_cache_invalidate(struct iommu_domain *domain,
> +			    struct device *dev,
> +			    struct iommu_cache_invalidate_info *inv_info)
>  {
>  	return -ENODEV;
>  }
>  
>  static inline int iommu_uapi_sva_bind_gpasid(struct iommu_domain *domain,
> -					     struct device *dev,
> -					     struct iommu_gpasid_bind_data *data)
> +					     struct device *dev, void __user *udata)
>  {
>  	return -ENODEV;
>  }
>  
>  static inline int iommu_uapi_sva_unbind_gpasid(struct iommu_domain *domain,
> -					       struct device *dev, int pasid)
> +					       struct device *dev, void __user *udata)
> +{
> +	return -ENODEV;
> +}
> +
> +static inline int iommu_sva_unbind_gpasid(struct iommu_domain *domain,
> +					  struct device *dev,
> +					  struct iommu_gpasid_bind_data *data)
>  {
>  	return -ENODEV;
>  }
> 

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
