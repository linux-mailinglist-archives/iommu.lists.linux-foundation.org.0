Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BA71CA036
	for <lists.iommu@lfdr.de>; Fri,  8 May 2020 03:42:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B60BA87570;
	Fri,  8 May 2020 01:42:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0CxlYeJd2Duu; Fri,  8 May 2020 01:42:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1A5D987463;
	Fri,  8 May 2020 01:42:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0834BC0890;
	Fri,  8 May 2020 01:42:43 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 222F7C07FF
 for <iommu@lists.linux-foundation.org>; Fri,  8 May 2020 01:42:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 149FC87553
 for <iommu@lists.linux-foundation.org>; Fri,  8 May 2020 01:42:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1TNWOAPuKMTh for <iommu@lists.linux-foundation.org>;
 Fri,  8 May 2020 01:42:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D7BE987463
 for <iommu@lists.linux-foundation.org>; Fri,  8 May 2020 01:42:40 +0000 (UTC)
IronPort-SDR: 30+AYr8qkMzWzOQgdloFMxq58brtY8hjVzNS8QcKBwrllqgJmbzCWHJvZSIqN5sjLEFibDFsgG
 PcE3RVqmAvig==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2020 18:42:39 -0700
IronPort-SDR: 6GpZO+gW4OH6LS1UMq12TtONG1C91mHtsFKgYYmsktsvd1pIW662D2u/nmBWnfmoD8iXQ8UScS
 pXAz4jP+jOEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,366,1583222400"; d="scan'208";a="278794707"
Received: from allen-box.sh.intel.com (HELO [10.239.159.139])
 ([10.239.159.139])
 by orsmga002.jf.intel.com with ESMTP; 07 May 2020 18:42:37 -0700
Subject: Re: [PATCH v4 3/5] iommu/vt-d: Disable non-recoverable fault
 processing before unbind
To: Jacob Pan <jacob.jun.pan@linux.intel.com>
References: <20200507005534.3080-1-baolu.lu@linux.intel.com>
 <20200507005534.3080-4-baolu.lu@linux.intel.com>
 <20200507095522.3863b197@jacob-builder>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <f282cb12-3bda-44c9-d8dc-6074aa251cf1@linux.intel.com>
Date: Fri, 8 May 2020 09:39:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200507095522.3863b197@jacob-builder>
Content-Language: en-US
Cc: kevin.tian@intel.com, ashok.raj@intel.com, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org
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

On 5/8/20 12:55 AM, Jacob Pan wrote:
> On Thu,  7 May 2020 08:55:32 +0800
> Lu Baolu <baolu.lu@linux.intel.com> wrote:
> 
>> When a PASID is used for SVA by the device, it's possible that the
>> PASID entry is cleared before the device flushes all ongoing DMA
>> requests. The IOMMU should ignore the non-recoverable faults caused
>> by these requests.
> Perhaps be more specific, only untranslated requests causes UR.

Yes. Sure!

> 
>> Intel VT-d provides such function through the FPD
>> bit of the PASID entry. This sets FPD bit when PASID entry is cleared
>> in the mm notifier and clear it when the pasid is unbound.
>>
>> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
>> ---
>>   drivers/iommu/intel-iommu.c |  4 ++--
>>   drivers/iommu/intel-pasid.c | 26 +++++++++++++++++++++-----
>>   drivers/iommu/intel-pasid.h |  3 ++-
>>   drivers/iommu/intel-svm.c   |  9 ++++++---
>>   4 files changed, 31 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
>> index d1866c0905b1..7811422b5a68 100644
>> --- a/drivers/iommu/intel-iommu.c
>> +++ b/drivers/iommu/intel-iommu.c
>> @@ -5352,7 +5352,7 @@ static void __dmar_remove_one_dev_info(struct
>> device_domain_info *info) if (info->dev) {
>>   		if (dev_is_pci(info->dev) && sm_supported(iommu))
>>   			intel_pasid_tear_down_entry(iommu, info->dev,
>> -					PASID_RID2PASID);
>> +					PASID_RID2PASID, false);
>>   
>>   		iommu_disable_dev_iotlb(info);
>>   		domain_context_clear(iommu, info->dev);
>> @@ -5587,7 +5587,7 @@ static void aux_domain_remove_dev(struct
>> dmar_domain *domain, auxiliary_unlink_device(domain, dev);
>>   
>>   	spin_lock(&iommu->lock);
>> -	intel_pasid_tear_down_entry(iommu, dev,
>> domain->default_pasid);
>> +	intel_pasid_tear_down_entry(iommu, dev,
>> domain->default_pasid, false); domain_detach_iommu(domain, iommu);
>>   	spin_unlock(&iommu->lock);
>>   
>> diff --git a/drivers/iommu/intel-pasid.c b/drivers/iommu/intel-pasid.c
>> index 7969e3dac2ad..11aef6c12972 100644
>> --- a/drivers/iommu/intel-pasid.c
>> +++ b/drivers/iommu/intel-pasid.c
>> @@ -292,7 +292,20 @@ static inline void pasid_clear_entry(struct
>> pasid_entry *pe) WRITE_ONCE(pe->val[7], 0);
>>   }
>>   
>> -static void intel_pasid_clear_entry(struct device *dev, int pasid)
>> +static inline void pasid_clear_entry_with_fpd(struct pasid_entry *pe)
>> +{
>> +	WRITE_ONCE(pe->val[0], PASID_PTE_FPD);
>> +	WRITE_ONCE(pe->val[1], 0);
>> +	WRITE_ONCE(pe->val[2], 0);
>> +	WRITE_ONCE(pe->val[3], 0);
>> +	WRITE_ONCE(pe->val[4], 0);
>> +	WRITE_ONCE(pe->val[5], 0);
>> +	WRITE_ONCE(pe->val[6], 0);
>> +	WRITE_ONCE(pe->val[7], 0);
>> +}
>> +
>> +static void
>> +intel_pasid_clear_entry(struct device *dev, int pasid, bool
>> pf_ignore) {
>>   	struct pasid_entry *pe;
>>   
>> @@ -300,7 +313,10 @@ static void intel_pasid_clear_entry(struct
>> device *dev, int pasid) if (WARN_ON(!pe))
>>   		return;
>>   
>> -	pasid_clear_entry(pe);
>> +	if (pf_ignore)
>> +		pasid_clear_entry_with_fpd(pe);
>> +	else
>> +		pasid_clear_entry(pe);
>>   }
>>   
>>   static inline void pasid_set_bits(u64 *ptr, u64 mask, u64 bits)
>> @@ -533,8 +549,8 @@ devtlb_invalidation_with_pasid(struct intel_iommu
>> *iommu, qi_flush_dev_iotlb(iommu, sid, pfsid, qdep, 0, 64 -
>> VTD_PAGE_SHIFT); }
>>   
>> -void intel_pasid_tear_down_entry(struct intel_iommu *iommu,
>> -				 struct device *dev, int pasid)
>> +void intel_pasid_tear_down_entry(struct intel_iommu *iommu, struct
>> device *dev,
>> +				 int pasid, bool pf_ignore)
>>   {
>>   	struct pasid_entry *pte;
>>   	u16 did;
>> @@ -544,7 +560,7 @@ void intel_pasid_tear_down_entry(struct
>> intel_iommu *iommu, return;
>>   
>>   	did = pasid_get_domain_id(pte);
>> -	intel_pasid_clear_entry(dev, pasid);
>> +	intel_pasid_clear_entry(dev, pasid, pf_ignore);
>>   
>>   	if (!ecap_coherent(iommu->ecap))
>>   		clflush_cache_range(pte, sizeof(*pte));
>> diff --git a/drivers/iommu/intel-pasid.h b/drivers/iommu/intel-pasid.h
>> index a41b09b3ffde..e6dd95ffe381 100644
>> --- a/drivers/iommu/intel-pasid.h
>> +++ b/drivers/iommu/intel-pasid.h
>> @@ -15,6 +15,7 @@
>>   #define PASID_MAX			0x100000
>>   #define PASID_PTE_MASK			0x3F
>>   #define PASID_PTE_PRESENT		1
>> +#define PASID_PTE_FPD			2
>>   #define PDE_PFN_MASK			PAGE_MASK
>>   #define PASID_PDE_SHIFT			6
>>   #define MAX_NR_PASID_BITS		20
>> @@ -120,7 +121,7 @@ int intel_pasid_setup_nested(struct intel_iommu
>> *iommu, struct iommu_gpasid_bind_data_vtd *pasid_data,
>>   			     struct dmar_domain *domain, int
>> addr_width); void intel_pasid_tear_down_entry(struct intel_iommu
>> *iommu,
>> -				 struct device *dev, int pasid);
>> +				 struct device *dev, int pasid, bool
>> pf_ignore); int vcmd_alloc_pasid(struct intel_iommu *iommu, unsigned
>> int *pasid); void vcmd_free_pasid(struct intel_iommu *iommu, unsigned
>> int pasid); #endif /* __INTEL_PASID_H */
>> diff --git a/drivers/iommu/intel-svm.c b/drivers/iommu/intel-svm.c
>> index 83dc4319f661..9561ba59a170 100644
>> --- a/drivers/iommu/intel-svm.c
>> +++ b/drivers/iommu/intel-svm.c
>> @@ -207,7 +207,8 @@ static void intel_mm_release(struct mmu_notifier
>> *mn, struct mm_struct *mm) */
>>   	rcu_read_lock();
>>   	list_for_each_entry_rcu(sdev, &svm->devs, list) {
>> -		intel_pasid_tear_down_entry(svm->iommu, sdev->dev,
>> svm->pasid);
>> +		intel_pasid_tear_down_entry(svm->iommu, sdev->dev,
>> +					    svm->pasid, true);
>>   		intel_flush_svm_range_dev(svm, sdev, 0, -1, 0);
>>   	}
>>   	rcu_read_unlock();
>> @@ -400,7 +401,8 @@ int intel_svm_unbind_gpasid(struct device *dev,
>> int pasid) sdev->users--;
>>   		if (!sdev->users) {
>>   			list_del_rcu(&sdev->list);
>> -			intel_pasid_tear_down_entry(iommu, dev,
>> svm->pasid);
>> +			intel_pasid_tear_down_entry(iommu, dev,
>> +						    svm->pasid,
>> false); intel_flush_svm_range_dev(svm, sdev, 0, -1, 0);
>>   			/* TODO: Drain in flight PRQ for the PASID
>> since it
>>   			 * may get reused soon, we don't want to
>> @@ -643,7 +645,8 @@ int intel_svm_unbind_mm(struct device *dev, int
>> pasid)
>>   			 * to use. We have a *shared* PASID table,
>> because it's
>>   			 * large and has to be physically
>> contiguous. So it's
>>   			 * hard to be as defensive as we might like.
>> */
>> -			intel_pasid_tear_down_entry(iommu, dev,
>> svm->pasid);
>> +			intel_pasid_tear_down_entry(iommu, dev,
>> +						    svm->pasid,
>> false); intel_flush_svm_range_dev(svm, sdev, 0, -1, 0);
>>   			kfree_rcu(sdev, rcu);
>>   
> Reviewed-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
> 

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
