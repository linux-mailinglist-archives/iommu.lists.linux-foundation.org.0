Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B964278451
	for <lists.iommu@lfdr.de>; Fri, 25 Sep 2020 11:47:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0B24586D8D;
	Fri, 25 Sep 2020 09:47:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Oz7kajbuN4gE; Fri, 25 Sep 2020 09:47:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3CB7086D89;
	Fri, 25 Sep 2020 09:47:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2531BC0859;
	Fri, 25 Sep 2020 09:47:01 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1D6E3C0859
 for <iommu@lists.linux-foundation.org>; Fri, 25 Sep 2020 09:47:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 05DCA86D83
 for <iommu@lists.linux-foundation.org>; Fri, 25 Sep 2020 09:47:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EBNaPW6spflS for <iommu@lists.linux-foundation.org>;
 Fri, 25 Sep 2020 09:46:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 by whitealder.osuosl.org (Postfix) with ESMTPS id C3AFB85C98
 for <iommu@lists.linux-foundation.org>; Fri, 25 Sep 2020 09:46:56 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id e17so2396072wme.0
 for <iommu@lists.linux-foundation.org>; Fri, 25 Sep 2020 02:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=/myEON5dKufvbqBvzUhnqSJV7sFG28096PfvL7x5iTw=;
 b=RK5YY2pui63/3DYpX1RX6BvqFJUcTkK9Y45qpRdPanLuxbDqQyYxaDc5lwphEpB0sg
 zS2lTlqOcW2fRt8p48W9U3rj4sKR4zaLVeonX4KSZrlMoxrQpk+3aagwnb0IOJh4Oe1B
 +1qVquQpOy4R/rniwJPqxa5lAvITnu8ydk7uEFmFpWxttEZwYDjOBtaIwnYa8/W0L0sP
 yF0x1YskUOZCuRww2dQswuZNYe9PfRo1iYwURI7Zd5aAUiRjhAQ4KFzKPRansP8w/SR1
 JMSDIFaLau9nfMSiJ+qM7yLsVSTZK+OcmSlC1JQLv1Uj8mZoRAWlUhX7V7uVTumkWUaw
 CJWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/myEON5dKufvbqBvzUhnqSJV7sFG28096PfvL7x5iTw=;
 b=kaGuEb/4yeDznBgnYDvcFRXoIalTYKWSzHBWbKojf80IOpsmeOK9EAKByEwWX7PlXv
 2THPUhNR4kdmd1c168jWlDg6DYfvH1HEG2uZV4NAWCEl6XIiud4AMSL/hWhL3wDUuXMG
 2xs6tnS7Rw7ia+at8dUAZmhqnkO89JuFS0Ol2XZFrKohdAsrdPi4Gy76rT4oXrhL66HS
 UxIpVLPubAq0qaG0o/LSmRkqbSDQU4pb3Z1D4vGjjfOB5ES6lAlemRIQlaZfgp3/nU7V
 l24OV9Jo1LJ20KaiL5SkPFMsWN1FJBf1rUb2Pnb6pir2T8uE1PhoR0JeYauHrvkb9Iol
 BgDA==
X-Gm-Message-State: AOAM532XBMGZg0TxLo0jHjL/bcZqAatYCA6KfZvhtNzIOuQLjo/XiQrG
 L4g36HKiXrc3j4zGnpiRfmSapw==
X-Google-Smtp-Source: ABdhPJz52l1O5tFBytsfr2wrPh65PHm2PuVUeMMjq2YXUdokNiGkVY3lYUUMH2J04j6k4THVk6TADw==
X-Received: by 2002:a1c:7418:: with SMTP id p24mr2169333wmc.123.1601027215198; 
 Fri, 25 Sep 2020 02:46:55 -0700 (PDT)
Received: from myrica ([2001:1715:4e26:a7e0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id t15sm2168166wrp.20.2020.09.25.02.46.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2020 02:46:54 -0700 (PDT)
Date: Fri, 25 Sep 2020 11:46:36 +0200
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Jacob Pan <jacob.pan.linux@gmail.com>
Subject: Re: [PATCH v11 5/6] iommu/uapi: Handle data and argsz filled by users
Message-ID: <20200925094636.GC490533@myrica>
References: <1600975460-64521-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1600975460-64521-6-git-send-email-jacob.jun.pan@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1600975460-64521-6-git-send-email-jacob.jun.pan@linux.intel.com>
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Raj Ashok <ashok.raj@intel.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-api@vger.kernel.org,
 Randy Dunlap <rdunlap@infradead.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>,
 iommu@lists.linux-foundation.org, Wu Hao <hao.wu@intel.com>,
 David Woodhouse <dwmw2@infradead.org>, Yi Sun <yi.y.sun@intel.com>
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

On Thu, Sep 24, 2020 at 12:24:19PM -0700, Jacob Pan wrote:
> IOMMU user APIs are responsible for processing user data. This patch
> changes the interface such that user pointers can be passed into IOMMU
> code directly. Separate kernel APIs without user pointers are introduced
> for in-kernel users of the UAPI functionality.
> 
> IOMMU UAPI data has a user filled argsz field which indicates the data
> length of the structure. User data is not trusted, argsz must be
> validated based on the current kernel data size, mandatory data size,
> and feature flags.
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

Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

Some comments below in case you're resending, but nothing important.

> ---
>  drivers/iommu/iommu.c      | 199 +++++++++++++++++++++++++++++++++++++++++++--
>  include/linux/iommu.h      |  28 +++++--
>  include/uapi/linux/iommu.h |   1 +
>  3 files changed, 212 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index 4ae02291ccc2..5c1b7ae48aae 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -1961,34 +1961,219 @@ int iommu_attach_device(struct iommu_domain *domain, struct device *dev)
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

nit: no need to initialize it

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

Why not use offsetofend() to avoid naming the unions?

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

Made redundant by the two checks below

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

"are mandatory", but this comment is a bit redundant.

Thanks,
Jean

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
> +			     ioasid_t pasid)
>  {
>  	if (unlikely(!domain->ops->sva_unbind_gpasid))
>  		return -ENODEV;
>  
>  	return domain->ops->sva_unbind_gpasid(dev, pasid);
>  }
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
> +	return iommu_sva_unbind_gpasid(domain, dev, data.hpasid);
> +}
>  EXPORT_SYMBOL_GPL(iommu_uapi_sva_unbind_gpasid);
>  
>  static void __iommu_detach_device(struct iommu_domain *domain,
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index 710d5d2691eb..3ca3a40fc80f 100644
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
> +				   struct device *dev, ioasid_t pasid);
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
> +					  ioasid_t pasid)
>  {
>  	return -ENODEV;
>  }
> diff --git a/include/uapi/linux/iommu.h b/include/uapi/linux/iommu.h
> index 5946779ac1f9..66d4ca40b40f 100644
> --- a/include/uapi/linux/iommu.h
> +++ b/include/uapi/linux/iommu.h
> @@ -322,6 +322,7 @@ struct iommu_gpasid_bind_data {
>  #define IOMMU_GPASID_BIND_VERSION_1	1
>  	__u32 version;
>  #define IOMMU_PASID_FORMAT_INTEL_VTD	1
> +#define IOMMU_PASID_FORMAT_LAST		2
>  	__u32 format;
>  	__u32 addr_width;
>  #define IOMMU_SVA_GPASID_VAL	(1 << 0) /* guest PASID valid */
> -- 
> 2.7.4
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
