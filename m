Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 5855D520A91
	for <lists.iommu@lfdr.de>; Tue, 10 May 2022 03:16:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0B05414C1;
	Tue, 10 May 2022 01:16:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9u0N4xqMnBgJ; Tue, 10 May 2022 01:16:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 2107841578;
	Tue, 10 May 2022 01:16:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 37CDBC0084;
	Tue, 10 May 2022 01:16:36 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3EF28C002D
 for <iommu@lists.linux-foundation.org>; Tue, 10 May 2022 01:16:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2A8F840907
 for <iommu@lists.linux-foundation.org>; Tue, 10 May 2022 01:16:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OMimDg63mBfn for <iommu@lists.linux-foundation.org>;
 Tue, 10 May 2022 01:16:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 15906414C1
 for <iommu@lists.linux-foundation.org>; Tue, 10 May 2022 01:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652145391; x=1683681391;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=+Ruqm3+0fGIIuggqvQ6ClDXEoBd07gxr4rP4iwgEIeA=;
 b=lUQTwrVd/BCEOoS8+33CTJOEldnLI6m/v2ljfN2oFezjIllnd/iUp9yI
 GGYkZ+RhyzkjxKP9eEO2WeUjH7Du3W/EsKMzNV6j550qkY5csgkEn9GDG
 +JJFqa6FTBjUUSQgRYGkNhCkcO8AU/ysM70HdXTewuhMLk/5H9TBhppaB
 hGjxQjAp93XIr9ZrWIVfKqZRG2NraDk23UWls2znjtDh1MTaxHm0OycFt
 MefPbhTP4B1r8UZlH0nnmUNIMw55BNNNHVqlfWE+9DY1sfDdDEgv6odyh
 yIE0r8G06hD3/UcRr7kgeYHSQlKlvhBFmEV0uBSj1w/Pw9Psm9dNg6cei Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="266810628"
X-IronPort-AV: E=Sophos;i="5.91,213,1647327600"; d="scan'208";a="266810628"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 18:16:30 -0700
X-IronPort-AV: E=Sophos;i="5.91,213,1647327600"; d="scan'208";a="593185256"
Received: from qihu-mobl.ccr.corp.intel.com (HELO [10.255.29.74])
 ([10.255.29.74])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 18:16:28 -0700
Message-ID: <2f279564-633b-fe93-5ffd-34b3e8f1c6fc@linux.intel.com>
Date: Tue, 10 May 2022 09:16:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v4 2/4] iommu/vt-d: Check domain force_snooping against
 attached devices
Content-Language: en-US
To: "Tian, Kevin" <kevin.tian@intel.com>, Joerg Roedel <joro@8bytes.org>,
 Jason Gunthorpe <jgg@nvidia.com>,
 Alex Williamson <alex.williamson@redhat.com>
References: <20220508123525.1973626-1-baolu.lu@linux.intel.com>
 <20220508123525.1973626-3-baolu.lu@linux.intel.com>
 <BN9PR11MB52764D8783A4C9F742A76BC88CC99@BN9PR11MB5276.namprd11.prod.outlook.com>
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <BN9PR11MB52764D8783A4C9F742A76BC88CC99@BN9PR11MB5276.namprd11.prod.outlook.com>
Cc: "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, "Pan,
 Jacob jun" <jacob.jun.pan@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

On 2022/5/10 08:51, Tian, Kevin wrote:
>> From: Lu Baolu <baolu.lu@linux.intel.com>
>> Sent: Sunday, May 8, 2022 8:35 PM
>>
>> As domain->force_snooping only impacts the devices attached with the
>> domain, there's no need to check against all IOMMU units. On the other
>> hand, force_snooping could be set on a domain no matter whether it has
>> been attached or not, and once set it is an immutable flag. If no
>> device attached, the operation always succeeds. Then this empty domain
>> can be only attached to a device of which the IOMMU supports snoop
>> control.
>>
>> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> 
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>

Thank you, Kevin. I will queue this series for v5.19.

Best regards,
baolu

> 
>> ---
>>   include/linux/intel-iommu.h |  1 +
>>   drivers/iommu/intel/pasid.h |  2 ++
>>   drivers/iommu/intel/iommu.c | 53
>> ++++++++++++++++++++++++++++++++++---
>>   drivers/iommu/intel/pasid.c | 42 +++++++++++++++++++++++++++++
>>   4 files changed, 95 insertions(+), 3 deletions(-)
>>
>> diff --git a/include/linux/intel-iommu.h b/include/linux/intel-iommu.h
>> index 72e5d7900e71..4f29139bbfc3 100644
>> --- a/include/linux/intel-iommu.h
>> +++ b/include/linux/intel-iommu.h
>> @@ -540,6 +540,7 @@ struct dmar_domain {
>>   	u8 has_iotlb_device: 1;
>>   	u8 iommu_coherency: 1;		/* indicate coherency of
>> iommu access */
>>   	u8 force_snooping : 1;		/* Create IOPTEs with snoop control
>> */
>> +	u8 set_pte_snp:1;
>>
>>   	struct list_head devices;	/* all devices' list */
>>   	struct iova_domain iovad;	/* iova's that belong to this domain
>> */
>> diff --git a/drivers/iommu/intel/pasid.h b/drivers/iommu/intel/pasid.h
>> index ab4408c824a5..583ea67fc783 100644
>> --- a/drivers/iommu/intel/pasid.h
>> +++ b/drivers/iommu/intel/pasid.h
>> @@ -123,4 +123,6 @@ void intel_pasid_tear_down_entry(struct
>> intel_iommu *iommu,
>>   				 bool fault_ignore);
>>   int vcmd_alloc_pasid(struct intel_iommu *iommu, u32 *pasid);
>>   void vcmd_free_pasid(struct intel_iommu *iommu, u32 pasid);
>> +void intel_pasid_setup_page_snoop_control(struct intel_iommu *iommu,
>> +					  struct device *dev, u32 pasid);
>>   #endif /* __INTEL_PASID_H */
>> diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
>> index b4802f4055a0..048ebfbd5fcb 100644
>> --- a/drivers/iommu/intel/iommu.c
>> +++ b/drivers/iommu/intel/iommu.c
>> @@ -2459,7 +2459,7 @@ static int domain_setup_first_level(struct
>> intel_iommu *iommu,
>>   	if (level == 5)
>>   		flags |= PASID_FLAG_FL5LP;
>>
>> -	if (domain->domain.type == IOMMU_DOMAIN_UNMANAGED)
>> +	if (domain->force_snooping)
>>   		flags |= PASID_FLAG_PAGE_SNOOP;
>>
>>   	return intel_pasid_setup_first_level(iommu, dev, (pgd_t *)pgd, pasid,
>> @@ -4444,7 +4444,7 @@ static int intel_iommu_map(struct iommu_domain
>> *domain,
>>   		prot |= DMA_PTE_READ;
>>   	if (iommu_prot & IOMMU_WRITE)
>>   		prot |= DMA_PTE_WRITE;
>> -	if (dmar_domain->force_snooping)
>> +	if (dmar_domain->set_pte_snp)
>>   		prot |= DMA_PTE_SNP;
>>
>>   	max_addr = iova + size;
>> @@ -4567,13 +4567,60 @@ static phys_addr_t
>> intel_iommu_iova_to_phys(struct iommu_domain *domain,
>>   	return phys;
>>   }
>>
>> +static bool domain_support_force_snooping(struct dmar_domain *domain)
>> +{
>> +	struct device_domain_info *info;
>> +	bool support = true;
>> +
>> +	assert_spin_locked(&device_domain_lock);
>> +	list_for_each_entry(info, &domain->devices, link) {
>> +		if (!ecap_sc_support(info->iommu->ecap)) {
>> +			support = false;
>> +			break;
>> +		}
>> +	}
>> +
>> +	return support;
>> +}
>> +
>> +static void domain_set_force_snooping(struct dmar_domain *domain)
>> +{
>> +	struct device_domain_info *info;
>> +
>> +	assert_spin_locked(&device_domain_lock);
>> +
>> +	/*
>> +	 * Second level page table supports per-PTE snoop control. The
>> +	 * iommu_map() interface will handle this by setting SNP bit.
>> +	 */
>> +	if (!domain_use_first_level(domain)) {
>> +		domain->set_pte_snp = true;
>> +		return;
>> +	}
>> +
>> +	list_for_each_entry(info, &domain->devices, link)
>> +		intel_pasid_setup_page_snoop_control(info->iommu, info-
>>> dev,
>> +						     PASID_RID2PASID);
>> +}
>> +
>>   static bool intel_iommu_enforce_cache_coherency(struct iommu_domain
>> *domain)
>>   {
>>   	struct dmar_domain *dmar_domain = to_dmar_domain(domain);
>> +	unsigned long flags;
>>
>> -	if (!domain_update_iommu_snooping(NULL))
>> +	if (dmar_domain->force_snooping)
>> +		return true;
>> +
>> +	spin_lock_irqsave(&device_domain_lock, flags);
>> +	if (!domain_support_force_snooping(dmar_domain)) {
>> +		spin_unlock_irqrestore(&device_domain_lock, flags);
>>   		return false;
>> +	}
>> +
>> +	domain_set_force_snooping(dmar_domain);
>>   	dmar_domain->force_snooping = true;
>> +	spin_unlock_irqrestore(&device_domain_lock, flags);
>> +
>>   	return true;
>>   }
>>
>> diff --git a/drivers/iommu/intel/pasid.c b/drivers/iommu/intel/pasid.c
>> index f8d215d85695..d19dd66a670c 100644
>> --- a/drivers/iommu/intel/pasid.c
>> +++ b/drivers/iommu/intel/pasid.c
>> @@ -762,3 +762,45 @@ int intel_pasid_setup_pass_through(struct
>> intel_iommu *iommu,
>>
>>   	return 0;
>>   }
>> +
>> +/*
>> + * Set the page snoop control for a pasid entry which has been set up.
>> + */
>> +void intel_pasid_setup_page_snoop_control(struct intel_iommu *iommu,
>> +					  struct device *dev, u32 pasid)
>> +{
>> +	struct pasid_entry *pte;
>> +	u16 did;
>> +
>> +	spin_lock(&iommu->lock);
>> +	pte = intel_pasid_get_entry(dev, pasid);
>> +	if (WARN_ON(!pte || !pasid_pte_is_present(pte))) {
>> +		spin_unlock(&iommu->lock);
>> +		return;
>> +	}
>> +
>> +	pasid_set_pgsnp(pte);
>> +	did = pasid_get_domain_id(pte);
>> +	spin_unlock(&iommu->lock);
>> +
>> +	if (!ecap_coherent(iommu->ecap))
>> +		clflush_cache_range(pte, sizeof(*pte));
>> +
>> +	/*
>> +	 * VT-d spec 3.4 table23 states guides for cache invalidation:
>> +	 *
>> +	 * - PASID-selective-within-Domain PASID-cache invalidation
>> +	 * - PASID-selective PASID-based IOTLB invalidation
>> +	 * - If (pasid is RID_PASID)
>> +	 *    - Global Device-TLB invalidation to affected functions
>> +	 *   Else
>> +	 *    - PASID-based Device-TLB invalidation (with S=1 and
>> +	 *      Addr[63:12]=0x7FFFFFFF_FFFFF) to affected functions
>> +	 */
>> +	pasid_cache_invalidation_with_pasid(iommu, did, pasid);
>> +	qi_flush_piotlb(iommu, did, pasid, 0, -1, 0);
>> +
>> +	/* Device IOTLB doesn't need to be flushed in caching mode. */
>> +	if (!cap_caching_mode(iommu->cap))
>> +		devtlb_invalidation_with_pasid(iommu, dev, pasid);
>> +}
>> --
>> 2.25.1
> 

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
