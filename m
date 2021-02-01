Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D47530AD94
	for <lists.iommu@lfdr.de>; Mon,  1 Feb 2021 18:18:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8A02D84F76;
	Mon,  1 Feb 2021 17:18:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UPKo-sPHG1uM; Mon,  1 Feb 2021 17:18:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 842E88633B;
	Mon,  1 Feb 2021 17:18:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 67482C013A;
	Mon,  1 Feb 2021 17:18:27 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 608E4C013A
 for <iommu@lists.linux-foundation.org>; Mon,  1 Feb 2021 17:18:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 58D1F85930
 for <iommu@lists.linux-foundation.org>; Mon,  1 Feb 2021 17:18:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w3RcNqlWQfve for <iommu@lists.linux-foundation.org>;
 Mon,  1 Feb 2021 17:18:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by hemlock.osuosl.org (Postfix) with ESMTPS id EAD9984F76
 for <iommu@lists.linux-foundation.org>; Mon,  1 Feb 2021 17:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612199903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wS5AbE8UUXpvZT+xdf5rjlY9gVtmvkVMDf6aSsa+WaE=;
 b=NCMiAVsmy7rdho/hs/6ElKUhc9R0Q1n+BvishhblIW9iG25R1D/ErN/r/CZ84uUUUzbXxh
 9lFGRW47SgqjajAgzBNNfSPTDhHpcgr/TCK7a/y6t0RP9NtGT7nD4Jz0Ko80EqmBaznXJ4
 h2fibslcrZkAv8gO/qtcboLXKywReig=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-97-Tf4lJ9pKNIyDHgZCfLpXYA-1; Mon, 01 Feb 2021 12:18:20 -0500
X-MC-Unique: Tf4lJ9pKNIyDHgZCfLpXYA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C7141005586;
 Mon,  1 Feb 2021 17:18:17 +0000 (UTC)
Received: from [10.36.113.43] (ovpn-113-43.ams2.redhat.com [10.36.113.43])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CC2425C1A1;
 Mon,  1 Feb 2021 17:18:10 +0000 (UTC)
Subject: Re: [PATCH v13 01/15] iommu: Introduce attach/detach_pasid_table API
To: Keqian Zhu <zhukeqian1@huawei.com>, eric.auger.pro@gmail.com,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, kvmarm@lists.cs.columbia.edu, will@kernel.org,
 joro@8bytes.org, maz@kernel.org, robin.murphy@arm.com,
 alex.williamson@redhat.com
References: <20201118112151.25412-1-eric.auger@redhat.com>
 <20201118112151.25412-2-eric.auger@redhat.com>
 <529d39a0-acf1-9132-b6ae-d7cbd57ba1e5@huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <31cf2f6c-8a18-3ed2-1420-35b3fd939770@redhat.com>
Date: Mon, 1 Feb 2021 18:18:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <529d39a0-acf1-9132-b6ae-d7cbd57ba1e5@huawei.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: jean-philippe@linaro.org, vivek.gautam@arm.com, zhangfei.gao@linaro.org
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

Hi Keqian,

On 2/1/21 12:27 PM, Keqian Zhu wrote:
> Hi Eric,
> 
> On 2020/11/18 19:21, Eric Auger wrote:
>> In virtualization use case, when a guest is assigned
>> a PCI host device, protected by a virtual IOMMU on the guest,
>> the physical IOMMU must be programmed to be consistent with
>> the guest mappings. If the physical IOMMU supports two
>> translation stages it makes sense to program guest mappings
>> onto the first stage/level (ARM/Intel terminology) while the host
>> owns the stage/level 2.
>>
>> In that case, it is mandated to trap on guest configuration
>> settings and pass those to the physical iommu driver.
>>
>> This patch adds a new API to the iommu subsystem that allows
>> to set/unset the pasid table information.
>>
>> A generic iommu_pasid_table_config struct is introduced in
>> a new iommu.h uapi header. This is going to be used by the VFIO
>> user API.
>>
>> Signed-off-by: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
>> Signed-off-by: Liu, Yi L <yi.l.liu@linux.intel.com>
>> Signed-off-by: Ashok Raj <ashok.raj@intel.com>
>> Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> ---
>>
>> v12 -> v13:
>> - Fix config check
>>
>> v11 -> v12:
>> - add argsz, name the union
>> ---
>>  drivers/iommu/iommu.c      | 68 ++++++++++++++++++++++++++++++++++++++
>>  include/linux/iommu.h      | 21 ++++++++++++
>>  include/uapi/linux/iommu.h | 54 ++++++++++++++++++++++++++++++
>>  3 files changed, 143 insertions(+)
>>
>> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
>> index b53446bb8c6b..978fe34378fb 100644
>> --- a/drivers/iommu/iommu.c
>> +++ b/drivers/iommu/iommu.c
>> @@ -2171,6 +2171,74 @@ int iommu_uapi_sva_unbind_gpasid(struct iommu_domain *domain, struct device *dev
>>  }
>>  EXPORT_SYMBOL_GPL(iommu_uapi_sva_unbind_gpasid);
>>  
>> +int iommu_attach_pasid_table(struct iommu_domain *domain,
>> +			     struct iommu_pasid_table_config *cfg)
>> +{
>> +	if (unlikely(!domain->ops->attach_pasid_table))
>> +		return -ENODEV;
>> +
>> +	return domain->ops->attach_pasid_table(domain, cfg);
>> +}
> miss export symbol?
yes we do
> 
>> +
>> +int iommu_uapi_attach_pasid_table(struct iommu_domain *domain,
>> +				  void __user *uinfo)
>> +{
>> +	struct iommu_pasid_table_config pasid_table_data = { 0 };
>> +	u32 minsz;
>> +
>> +	if (unlikely(!domain->ops->attach_pasid_table))
>> +		return -ENODEV;
>> +
>> +	/*
>> +	 * No new spaces can be added before the variable sized union, the
>> +	 * minimum size is the offset to the union.
>> +	 */
>> +	minsz = offsetof(struct iommu_pasid_table_config, vendor_data);
>> +
>> +	/* Copy minsz from user to get flags and argsz */
>> +	if (copy_from_user(&pasid_table_data, uinfo, minsz))
>> +		return -EFAULT;
>> +
>> +	/* Fields before the variable size union are mandatory */
>> +	if (pasid_table_data.argsz < minsz)
>> +		return -EINVAL;
>> +
>> +	/* PASID and address granu require additional info beyond minsz */
>> +	if (pasid_table_data.version != PASID_TABLE_CFG_VERSION_1)
>> +		return -EINVAL;
>> +	if (pasid_table_data.format == IOMMU_PASID_FORMAT_SMMUV3 &&
>> +	    pasid_table_data.argsz <
>> +		offsetofend(struct iommu_pasid_table_config, vendor_data.smmuv3))
>> +		return -EINVAL;
>> +
>> +	/*
>> +	 * User might be using a newer UAPI header which has a larger data
>> +	 * size, we shall support the existing flags within the current
>> +	 * size. Copy the remaining user data _after_ minsz but not more
>> +	 * than the current kernel supported size.
>> +	 */
>> +	if (copy_from_user((void *)&pasid_table_data + minsz, uinfo + minsz,
>> +			   min_t(u32, pasid_table_data.argsz, sizeof(pasid_table_data)) - minsz))
>> +		return -EFAULT;
>> +
>> +	/* Now the argsz is validated, check the content */
>> +	if (pasid_table_data.config < IOMMU_PASID_CONFIG_TRANSLATE ||
>> +	    pasid_table_data.config > IOMMU_PASID_CONFIG_ABORT)
>> +		return -EINVAL;
>> +
>> +	return domain->ops->attach_pasid_table(domain, &pasid_table_data);
>> +}
>> +EXPORT_SYMBOL_GPL(iommu_uapi_attach_pasid_table);
>> +
>> +void iommu_detach_pasid_table(struct iommu_domain *domain)
>> +{
>> +	if (unlikely(!domain->ops->detach_pasid_table))
>> +		return;
>> +
>> +	domain->ops->detach_pasid_table(domain);
>> +}
>> +EXPORT_SYMBOL_GPL(iommu_detach_pasid_table);
>> +
>>  static void __iommu_detach_device(struct iommu_domain *domain,
>>  				  struct device *dev)
>>  {
>> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
>> index b95a6f8db6ff..464fcbecf841 100644
>> --- a/include/linux/iommu.h
>> +++ b/include/linux/iommu.h
>> @@ -223,6 +223,8 @@ struct iommu_iotlb_gather {
>>   * @cache_invalidate: invalidate translation caches
>>   * @sva_bind_gpasid: bind guest pasid and mm
>>   * @sva_unbind_gpasid: unbind guest pasid and mm
>> + * @attach_pasid_table: attach a pasid table
>> + * @detach_pasid_table: detach the pasid table
>>   * @def_domain_type: device default domain type, return value:
>>   *		- IOMMU_DOMAIN_IDENTITY: must use an identity domain
>>   *		- IOMMU_DOMAIN_DMA: must use a dma domain
>> @@ -287,6 +289,9 @@ struct iommu_ops {
>>  				      void *drvdata);
>>  	void (*sva_unbind)(struct iommu_sva *handle);
>>  	u32 (*sva_get_pasid)(struct iommu_sva *handle);
>> +	int (*attach_pasid_table)(struct iommu_domain *domain,
>> +				  struct iommu_pasid_table_config *cfg);
>> +	void (*detach_pasid_table)(struct iommu_domain *domain);
>>  
>>  	int (*page_response)(struct device *dev,
>>  			     struct iommu_fault_event *evt,
>> @@ -434,6 +439,11 @@ extern int iommu_uapi_sva_unbind_gpasid(struct iommu_domain *domain,
>>  					struct device *dev, void __user *udata);
>>  extern int iommu_sva_unbind_gpasid(struct iommu_domain *domain,
>>  				   struct device *dev, ioasid_t pasid);
>> +extern int iommu_attach_pasid_table(struct iommu_domain *domain,
>> +				    struct iommu_pasid_table_config *cfg);
>> +extern int iommu_uapi_attach_pasid_table(struct iommu_domain *domain,
>> +					 void __user *udata);
>> +extern void iommu_detach_pasid_table(struct iommu_domain *domain);
>>  extern struct iommu_domain *iommu_get_domain_for_dev(struct device *dev);
>>  extern struct iommu_domain *iommu_get_dma_domain(struct device *dev);
>>  extern int iommu_map(struct iommu_domain *domain, unsigned long iova,
>> @@ -639,6 +649,7 @@ struct iommu_sva *iommu_sva_bind_device(struct device *dev,
>>  void iommu_sva_unbind_device(struct iommu_sva *handle);
>>  u32 iommu_sva_get_pasid(struct iommu_sva *handle);
>>  
>> +
> extra blank line.
yup
> 
>>  #else /* CONFIG_IOMMU_API */
>>  
>>  struct iommu_ops {};
>> @@ -1020,6 +1031,16 @@ iommu_aux_get_pasid(struct iommu_domain *domain, struct device *dev)
>>  	return -ENODEV;
>>  }
>>  
>> +static inline
>> +int iommu_attach_pasid_table(struct iommu_domain *domain,
>> +			     struct iommu_pasid_table_config *cfg)
>> +{
>> +	return -ENODEV;
>> +}
> 
> miss dummy iommu_uapi_attach_pasid_table?
yes we do
> 
>> +
>> +static inline
>> +void iommu_detach_pasid_table(struct iommu_domain *domain) {}
>> +
>>  static inline struct iommu_sva *
>>  iommu_sva_bind_device(struct device *dev, struct mm_struct *mm, void *drvdata)
>>  {
>> diff --git a/include/uapi/linux/iommu.h b/include/uapi/linux/iommu.h
>> index e1d9e75f2c94..082d758dd016 100644
>> --- a/include/uapi/linux/iommu.h
>> +++ b/include/uapi/linux/iommu.h
>> @@ -338,4 +338,58 @@ struct iommu_gpasid_bind_data {
>>  	} vendor;
>>  };
>>  
>> +/**
>> + * struct iommu_pasid_smmuv3 - ARM SMMUv3 Stream Table Entry stage 1 related
>> + *     information
>> + * @version: API version of this structure
>> + * @s1fmt: STE s1fmt (format of the CD table: single CD, linear table
>> + *         or 2-level table)
>> + * @s1dss: STE s1dss (specifies the behavior when @pasid_bits != 0
>> + *         and no PASID is passed along with the incoming transaction)
>> + * @padding: reserved for future use (should be zero)
>> + *
>> + * The PASID table is referred to as the Context Descriptor (CD) table on ARM
>> + * SMMUv3. Please refer to the ARM SMMU 3.x spec (ARM IHI 0070A) for full
>> + * details.
>> + */
>> +struct iommu_pasid_smmuv3 {
>> +#define PASID_TABLE_SMMUV3_CFG_VERSION_1 1
>> +	__u32	version;
>> +	__u8	s1fmt;
>> +	__u8	s1dss;
>> +	__u8	padding[2];
>> +};
>> +
>> +/**
>> + * struct iommu_pasid_table_config - PASID table data used to bind guest PASID
>> + *     table to the host IOMMU
>> + * @argsz: User filled size of this data
>> + * @version: API version to prepare for future extensions
>> + * @format: format of the PASID table
>> + * @base_ptr: guest physical address of the PASID table
>> + * @pasid_bits: number of PASID bits used in the PASID table
>> + * @config: indicates whether the guest translation stage must
>> + *          be translated, bypassed or aborted.
>> + * @padding: reserved for future use (should be zero)
>> + * @vendor_data.smmuv3: table information when @format is
>> + * %IOMMU_PASID_FORMAT_SMMUV3
>> + */
>> +struct iommu_pasid_table_config {
>> +	__u32	argsz;
>> +#define PASID_TABLE_CFG_VERSION_1 1
>> +	__u32	version;
>> +#define IOMMU_PASID_FORMAT_SMMUV3	1
>> +	__u32	format;
>> +	__u64	base_ptr;
> put @base_ptr between @version and @format can save some memory.
yes. This padding issue was also reported by Jacob. I will swap both
format and base_ptr.
> 
>> +	__u8	pasid_bits;
>> +#define IOMMU_PASID_CONFIG_TRANSLATE	1
>> +#define IOMMU_PASID_CONFIG_BYPASS	2
>> +#define IOMMU_PASID_CONFIG_ABORT	3
>> +	__u8	config;
>> +	__u8    padding[2];
>> +	union {
>> +		struct iommu_pasid_smmuv3 smmuv3;
>> +	} vendor_data;
>> +};
>> +
>>  #endif /* _UAPI_IOMMU_H */
>>
> 
> Thanks,
> Keqian
> 
Thanks!

Eric

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
