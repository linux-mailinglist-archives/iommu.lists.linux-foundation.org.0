Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A16D2437B2
	for <lists.iommu@lfdr.de>; Thu, 13 Aug 2020 11:31:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AFDAE86AA4;
	Thu, 13 Aug 2020 09:31:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e2ios_M_3qSi; Thu, 13 Aug 2020 09:31:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3F59386B9A;
	Thu, 13 Aug 2020 09:31:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 228D1C013C;
	Thu, 13 Aug 2020 09:31:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6BDD5C004D
 for <iommu@lists.linux-foundation.org>; Thu, 13 Aug 2020 09:31:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 5A3A588408
 for <iommu@lists.linux-foundation.org>; Thu, 13 Aug 2020 09:31:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OOku+22tguI7 for <iommu@lists.linux-foundation.org>;
 Thu, 13 Aug 2020 09:31:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id C07B7883E1
 for <iommu@lists.linux-foundation.org>; Thu, 13 Aug 2020 09:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597311062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1lxntSpI6BaDRBMsiVMpFCRTagjBSFYYwLlxyWOSChs=;
 b=XAhB5q+spyZh6cuqU0fSVHmev9v6aldeVtxkaNVk3t4iAr2G8msrhosYV95D65YcYtrEFP
 poS/cBaTyg/WW6jTJpC62FrHQewgqwnqTwf9RHEexwX3YITMXUGO/cKMPmPATaSbz1Ih9Q
 wDe23ZpoF60dkkCZUdnVtI6qNZ1tsN4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-464-UZHsFqspPDCZplC3AOfK0Q-1; Thu, 13 Aug 2020 05:31:00 -0400
X-MC-Unique: UZHsFqspPDCZplC3AOfK0Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 758EF10066FA;
 Thu, 13 Aug 2020 09:30:58 +0000 (UTC)
Received: from [10.36.113.93] (ovpn-113-93.ams2.redhat.com [10.36.113.93])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 76E615FC1B;
 Thu, 13 Aug 2020 09:30:52 +0000 (UTC)
Subject: Re: [PATCH v7 6/7] iommu/uapi: Handle data and argsz filled by users
To: "Liu, Yi L" <yi.l.liu@intel.com>,
 Jacob Pan <jacob.jun.pan@linux.intel.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Alex Williamson <alex.williamson@redhat.com>
References: <1596068467-49322-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1596068467-49322-7-git-send-email-jacob.jun.pan@linux.intel.com>
 <ee61f1d1-f581-e35f-c50a-80e10b1dd06c@redhat.com>
 <DM5PR11MB14358D98D56B22307F712D47C3430@DM5PR11MB1435.namprd11.prod.outlook.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <55dc3e4c-2717-2c96-d676-708b94e8cf1f@redhat.com>
Date: Thu, 13 Aug 2020 11:30:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <DM5PR11MB14358D98D56B22307F712D47C3430@DM5PR11MB1435.namprd11.prod.outlook.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: "Tian, Kevin" <kevin.tian@intel.com>, "Raj, Ashok" <ashok.raj@intel.com>,
 Jonathan Corbet <corbet@lwn.net>, David Woodhouse <dwmw2@infradead.org>,
 Christoph Hellwig <hch@infradead.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>
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

Hi Yi,

On 8/13/20 11:25 AM, Liu, Yi L wrote:
> Hi Eric,
> 
> 
>> From: Auger Eric <eric.auger@redhat.com>
>> Sent: Thursday, August 13, 2020 5:12 PM
>>
>> Hi Jacob,
>>
>> On 7/30/20 2:21 AM, Jacob Pan wrote:
>>> IOMMU user APIs are responsible for processing user data. This patch
>>> changes the interface such that user pointers can be passed into IOMMU
>>> code directly. Separate kernel APIs without user pointers are introduced
>>> for in-kernel users of the UAPI functionality.
>> This is just done for a single function, ie. iommu_sva_unbind_gpasid.
>>
>> If I am not wrong there is no user of this latter after applying the
>> whole series? If correct you may remove it at this stage?
> 
> the user of this function is in vfio. And it is the same with
> iommu_uapi_sva_bind/unbind_gpasid() and iommu_uapi_cache_invalidate().
> 
> https://lore.kernel.org/kvm/1595917664-33276-11-git-send-email-yi.l.liu@intel.com/
> https://lore.kernel.org/kvm/1595917664-33276-12-git-send-email-yi.l.liu@intel.com/
Yep I know ;-) But this series mostly deals with iommu uapi rework.
That's not a big deal though.

Thanks

Eric
> 
> Regards,
> Yi Liu
> 
>>>
>>> IOMMU UAPI data has a user filled argsz field which indicates the data
>>> length of the structure. User data is not trusted, argsz must be
>>> validated based on the current kernel data size, mandatory data size,
>>> and feature flags.
>>>
>>> User data may also be extended, resulting in possible argsz increase.
>>> Backward compatibility is ensured based on size and flags (or
>>> the functional equivalent fields) checking.
>>>
>>> This patch adds sanity checks in the IOMMU layer. In addition to argsz,
>>> reserved/unused fields in padding, flags, and version are also checked.
>>> Details are documented in Documentation/userspace-api/iommu.rst
>>>
>>> Signed-off-by: Liu Yi L <yi.l.liu@intel.com>
>>> Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
>>> ---
>>>  drivers/iommu/iommu.c | 201
>> ++++++++++++++++++++++++++++++++++++++++++++++++--
>>>  include/linux/iommu.h |  28 ++++---
>>>  2 files changed, 212 insertions(+), 17 deletions(-)
>>>
>>> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
>>> index 3a913ce94a3d..1ee55c4b3a3a 100644
>>> --- a/drivers/iommu/iommu.c
>>> +++ b/drivers/iommu/iommu.c
>>> @@ -1950,33 +1950,218 @@ int iommu_attach_device(struct iommu_domain
>> *domain, struct device *dev)
>>>  }
>>>  EXPORT_SYMBOL_GPL(iommu_attach_device);
>>>
>>> +/*
>>> + * Check flags and other user provided data for valid combinations. We also
>>> + * make sure no reserved fields or unused flags are set. This is to ensure
>>> + * not breaking userspace in the future when these fields or flags are used.
>>> + */
>>> +static int iommu_check_cache_invl_data(struct iommu_cache_invalidate_info
>> *info)
>>> +{
>>> +	u32 mask;
>>> +	int i;
>>> +
>>> +	if (info->version != IOMMU_CACHE_INVALIDATE_INFO_VERSION_1)
>>> +		return -EINVAL;
>>> +
>>> +	mask = (1 << IOMMU_CACHE_INV_TYPE_NR) - 1;
>>> +	if (info->cache & ~mask)
>>> +		return -EINVAL;
>>> +
>>> +	if (info->granularity >= IOMMU_INV_GRANU_NR)
>>> +		return -EINVAL;
>>> +
>>> +	switch (info->granularity) {
>>> +	case IOMMU_INV_GRANU_ADDR:
>>> +		if (info->cache & IOMMU_CACHE_INV_TYPE_PASID)
>>> +			return -EINVAL;
>>> +
>>> +		mask = IOMMU_INV_ADDR_FLAGS_PASID |
>>> +			IOMMU_INV_ADDR_FLAGS_ARCHID |
>>> +			IOMMU_INV_ADDR_FLAGS_LEAF;
>>> +
>>> +		if (info->granu.addr_info.flags & ~mask)
>>> +			return -EINVAL;
>>> +		break;
>>> +	case IOMMU_INV_GRANU_PASID:
>>> +		mask = IOMMU_INV_PASID_FLAGS_PASID |
>>> +			IOMMU_INV_PASID_FLAGS_ARCHID;
>>> +		if (info->granu.pasid_info.flags & ~mask)
>>> +			return -EINVAL;
>>> +
>>> +		break;
>>> +	case IOMMU_INV_GRANU_DOMAIN:
>>> +		if (info->cache & IOMMU_CACHE_INV_TYPE_DEV_IOTLB)
>>> +			return -EINVAL;
>>> +		break;
>>> +	default:
>>> +		return -EINVAL;
>>> +	}
>>> +
>>> +	/* Check reserved padding fields */
>>> +	for (i = 0; i < sizeof(info->padding); i++) {
>>> +		if (info->padding[i])
>>> +			return -EINVAL;
>>> +	}
>>> +
>>> +	return 0;
>>> +}
>>> +
>>>  int iommu_uapi_cache_invalidate(struct iommu_domain *domain, struct device
>> *dev,
>>> -				struct iommu_cache_invalidate_info *inv_info)
>>> +				void __user *uinfo)
>>>  {
>>> +	struct iommu_cache_invalidate_info inv_info = { 0 };
>>> +	u32 minsz;
>>> +	int ret = 0;
>>> +
>>>  	if (unlikely(!domain->ops->cache_invalidate))
>>>  		return -ENODEV;
>>>  > -	return domain->ops->cache_invalidate(domain, dev, inv_info);
>>> +	/*
>>> +	 * No new spaces can be added before the variable sized union, the
>>> +	 * minimum size is the offset to the union.
>>> +	 */
>>> +	minsz = offsetof(struct iommu_cache_invalidate_info, granu);
>>> +
>>> +	/* Copy minsz from user to get flags and argsz */
>>> +	if (copy_from_user(&inv_info, uinfo, minsz))
>>> +		return -EFAULT;
>>> +
>>> +	/* Fields before variable size union is mandatory */
>>> +	if (inv_info.argsz < minsz)
>>> +		return -EINVAL;
>>> +
>>> +	/* PASID and address granu require additional info beyond minsz */
>>> +	if (inv_info.argsz == minsz &&
>>> +	    ((inv_info.granularity == IOMMU_INV_GRANU_PASID) ||
>>> +		    (inv_info.granularity == IOMMU_INV_GRANU_ADDR)))
>>> +		return -EINVAL;
>>> +
>>> +	if (inv_info.granularity == IOMMU_INV_GRANU_PASID &&
>>> +	    inv_info.argsz < offsetofend(struct iommu_cache_invalidate_info,
>> granu.pasid_info))
>>> +		return -EINVAL;
>>> +
>>> +	if (inv_info.granularity == IOMMU_INV_GRANU_ADDR &&
>>> +	    inv_info.argsz < offsetofend(struct iommu_cache_invalidate_info,
>> granu.addr_info))
>>> +		return -EINVAL;
>>> +
>>> +	/*
>>> +	 * User might be using a newer UAPI header which has a larger data
>>> +	 * size, we shall support the existing flags within the current
>>> +	 * size. Copy the remaining user data _after_ minsz but not more
>>> +	 * than the current kernel supported size.
>>> +	 */
>>> +	if (copy_from_user((void *)&inv_info + minsz, uinfo + minsz,
>>> +			   min_t(u32, inv_info.argsz, sizeof(inv_info)) - minsz))
>>> +		return -EFAULT;
>>> +
>>> +	/* Now the argsz is validated, check the content */
>>> +	ret = iommu_check_cache_invl_data(&inv_info);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	return domain->ops->cache_invalidate(domain, dev, &inv_info);
>>>  }
>>>  EXPORT_SYMBOL_GPL(iommu_uapi_cache_invalidate);
>>>
>>> -int iommu_uapi_sva_bind_gpasid(struct iommu_domain *domain,
>>> -			       struct device *dev, struct iommu_gpasid_bind_data
>> *data)
>>> +static int iommu_check_bind_data(struct iommu_gpasid_bind_data *data)
>>> +{
>>> +	u32 mask;
>>> +	int i;
>>> +
>>> +	if (data->version != IOMMU_GPASID_BIND_VERSION_1)
>>> +		return -EINVAL;
>>> +
>>> +	/* Check the range of supported formats */
>>> +	if (data->format >= IOMMU_PASID_FORMAT_LAST)
>>> +		return -EINVAL;
>>> +
>>> +	/* Check all flags */
>>> +	mask = IOMMU_SVA_GPASID_VAL;
>>> +	if (data->flags & ~mask)
>>> +		return -EINVAL;
>>> +
>>> +	/* Check reserved padding fields */
>>> +	for (i = 0; i < sizeof(data->padding); i++) {
>>> +		if (data->padding[i])
>>> +			return -EINVAL;
>>> +	}
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int iommu_sva_prepare_bind_data(void __user *udata,
>>> +				       struct iommu_gpasid_bind_data *data)
>>>  {
>>> +	u32 minsz;
>>> +
>>> +	/*
>>> +	 * No new spaces can be added before the variable sized union, the
>>> +	 * minimum size is the offset to the union.
>>> +	 */
>>> +	minsz = offsetof(struct iommu_gpasid_bind_data, vendor);
>>> +
>>> +	/* Copy minsz from user to get flags and argsz */
>>> +	if (copy_from_user(data, udata, minsz))
>>> +		return -EFAULT;
>>> +
>>> +	/* Fields before variable size union is mandatory */
>>> +	if (data->argsz < minsz)
>>> +		return -EINVAL;
>>> +	/*
>>> +	 * User might be using a newer UAPI header, we shall let IOMMU vendor
>>> +	 * driver decide on what size it needs. Since the guest PASID bind data
>>> +	 * can be vendor specific, larger argsz could be the result of extension
>>> +	 * for one vendor but it should not affect another vendor.
>>> +	 * Copy the remaining user data _after_ minsz
>>> +	 */
>>> +	if (copy_from_user((void *)data + minsz, udata + minsz,
>>> +			   min_t(u32, data->argsz, sizeof(*data)) - minsz))
>>> +		return -EFAULT;
>>> +
>>> +	return iommu_check_bind_data(data);
>>> +}
>>> +
>>> +int iommu_uapi_sva_bind_gpasid(struct iommu_domain *domain, struct device
>> *dev,
>>> +			       void __user *udata)
>>> +{
>>> +	struct iommu_gpasid_bind_data data = { 0 };
>>> +	int ret;
>>> +
>>>  	if (unlikely(!domain->ops->sva_bind_gpasid))
>>>  		return -ENODEV;
>>>
>>> -	return domain->ops->sva_bind_gpasid(domain, dev, data);
>>> +	ret = iommu_sva_prepare_bind_data(udata, &data);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	return domain->ops->sva_bind_gpasid(domain, dev, &data);
>>>  }
>>>  EXPORT_SYMBOL_GPL(iommu_uapi_sva_bind_gpasid);
>>>
>>> -int iommu_uapi_sva_unbind_gpasid(struct iommu_domain *domain, struct device
>> *dev,
>>> -				 ioasid_t pasid)
>>> +int iommu_sva_unbind_gpasid(struct iommu_domain *domain, struct device *dev,
>>> +			    struct iommu_gpasid_bind_data *data)
>>>  {
>>>  	if (unlikely(!domain->ops->sva_unbind_gpasid))
>>>  		return -ENODEV;
>>>
>>> -	return domain->ops->sva_unbind_gpasid(dev, pasid);
>>> +	return domain->ops->sva_unbind_gpasid(dev, data->hpasid);
>>> +}
>>> +EXPORT_SYMBOL_GPL(iommu_sva_unbind_gpasid);
>>> +
>>> +int iommu_uapi_sva_unbind_gpasid(struct iommu_domain *domain, struct device
>> *dev,
>>> +				 void __user *udata)
>>> +{
>>> +	struct iommu_gpasid_bind_data data = { 0 };
>>> +	int ret;
>>> +
>>> +	if (unlikely(!domain->ops->sva_bind_gpasid))
>>> +		return -ENODEV;
>>> +
>>> +	ret = iommu_sva_prepare_bind_data(udata, &data);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	return iommu_sva_unbind_gpasid(domain, dev, &data);
>>>  }
>>>  EXPORT_SYMBOL_GPL(iommu_uapi_sva_unbind_gpasid);
>>>
>>> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
>>> index 2dcc1a33f6dc..4a02c9e09048 100644
>>> --- a/include/linux/iommu.h
>>> +++ b/include/linux/iommu.h
>>> @@ -432,11 +432,14 @@ extern void iommu_detach_device(struct
>> iommu_domain *domain,
>>>  				struct device *dev);
>>>  extern int iommu_uapi_cache_invalidate(struct iommu_domain *domain,
>>>  				       struct device *dev,
>>> -				       struct iommu_cache_invalidate_info *inv_info);
>>> +				       void __user *uinfo);
>>> +
>>>  extern int iommu_uapi_sva_bind_gpasid(struct iommu_domain *domain,
>>> -				      struct device *dev, struct
>> iommu_gpasid_bind_data *data);
>>> +				      struct device *dev, void __user *udata);
>>>  extern int iommu_uapi_sva_unbind_gpasid(struct iommu_domain *domain,
>>> -					struct device *dev, ioasid_t pasid);
>>> +					struct device *dev, void __user *udata);
>>> +extern int iommu_sva_unbind_gpasid(struct iommu_domain *domain,
>>> +				   struct device *dev, struct
>> iommu_gpasid_bind_data *data);
>>>  extern struct iommu_domain *iommu_get_domain_for_dev(struct device *dev);
>>>  extern struct iommu_domain *iommu_get_dma_domain(struct device *dev);
>>>  extern int iommu_map(struct iommu_domain *domain, unsigned long iova,
>>> @@ -1054,22 +1057,29 @@ static inline int iommu_sva_get_pasid(struct
>> iommu_sva *handle)
>>>  	return IOMMU_PASID_INVALID;
>>>  }
>>>
>>> -static inline int iommu_uapi_cache_invalidate(struct iommu_domain *domain,
>>> -					      struct device *dev,
>>> -					      struct iommu_cache_invalidate_info
>> *inv_info)
>>> +static inline int
>>> +iommu_uapi_cache_invalidate(struct iommu_domain *domain,
>>> +			    struct device *dev,
>>> +			    struct iommu_cache_invalidate_info *inv_info)
>>>  {
>>>  	return -ENODEV;
>>>  }
>>>
>>>  static inline int iommu_uapi_sva_bind_gpasid(struct iommu_domain *domain,
>>> -					     struct device *dev,
>>> -					     struct iommu_gpasid_bind_data *data)
>>> +					     struct device *dev, void __user *udata)
>>>  {
>>>  	return -ENODEV;
>>>  }
>>>
>>>  static inline int iommu_uapi_sva_unbind_gpasid(struct iommu_domain *domain,
>>> -					       struct device *dev, int pasid)
>>> +					       struct device *dev, void __user *udata)
>>> +{
>>> +	return -ENODEV;
>>> +}
>>> +
>>> +static inline int iommu_sva_unbind_gpasid(struct iommu_domain *domain,
>>> +					  struct device *dev,
>>> +					  struct iommu_gpasid_bind_data *data)
>>>  {
>>>  	return -ENODEV;
>>>  }
>>>
>> Otherwise looks good to me
>> Reviewed-by: Eric Auger <eric.auger@redhat.com>
>>
>> Thanks
>>
>> Eric
> 

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
