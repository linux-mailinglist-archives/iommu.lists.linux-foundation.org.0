Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DD418DD74
	for <lists.iommu@lfdr.de>; Sat, 21 Mar 2020 02:32:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BB6CD8733E;
	Sat, 21 Mar 2020 01:32:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id STNfzP1exzB1; Sat, 21 Mar 2020 01:32:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4D22C872D3;
	Sat, 21 Mar 2020 01:32:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 28350C07FF;
	Sat, 21 Mar 2020 01:32:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E2440C07FF
 for <iommu@lists.linux-foundation.org>; Sat, 21 Mar 2020 01:32:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id DE1A38733E
 for <iommu@lists.linux-foundation.org>; Sat, 21 Mar 2020 01:32:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lj0GnvqWWkkN for <iommu@lists.linux-foundation.org>;
 Sat, 21 Mar 2020 01:32:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id BF6E2872D3
 for <iommu@lists.linux-foundation.org>; Sat, 21 Mar 2020 01:32:49 +0000 (UTC)
IronPort-SDR: JM3L/MptMC0tZzBPqdO2bBa+hkPJERsZfTzygw3dcjCgamx1cSm/tFjQ2eXv4oD4pgymH+XSZz
 vtvT+CA8fcJw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2020 18:32:48 -0700
IronPort-SDR: bXMDXjJLJZodiuHPyhNhLQnhRC3EAGO3pLsdO9Vn0wH5EGRPtbOjHaj5g71r+Uft+ETIZad4+i
 hYzFwvRA5JCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,286,1580803200"; d="scan'208";a="249051243"
Received: from blu2-mobl3.ccr.corp.intel.com (HELO [10.254.211.188])
 ([10.254.211.188])
 by orsmga006.jf.intel.com with ESMTP; 20 Mar 2020 18:32:45 -0700
Subject: Re: [PATCH 1/3] iommu/vt-d: Remove redundant IOTLB flush
To: Jacob Pan <jacob.jun.pan@linux.intel.com>
References: <1584678751-43169-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1584678751-43169-2-git-send-email-jacob.jun.pan@linux.intel.com>
 <26ab1917-f087-aafa-e861-6a2478000a6f@linux.intel.com>
 <20200320092047.4a4cf551@jacob-builder>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <06c9751a-417d-3c32-65af-0788593f811a@linux.intel.com>
Date: Sat, 21 Mar 2020 09:32:45 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200320092047.4a4cf551@jacob-builder>
Content-Language: en-US
Cc: Raj Ashok <ashok.raj@intel.com>, LKML <linux-kernel@vger.kernel.org>,
 iommu@lists.linux-foundation.org, David Woodhouse <dwmw2@infradead.org>
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

On 2020/3/21 0:20, Jacob Pan wrote:
> On Fri, 20 Mar 2020 21:45:26 +0800
> Lu Baolu <baolu.lu@linux.intel.com> wrote:
> 
>> On 2020/3/20 12:32, Jacob Pan wrote:
>>> IOTLB flush already included in the PASID tear down process. There
>>> is no need to flush again.
>>
>> It seems that intel_pasid_tear_down_entry() doesn't flush the pasid
>> based device TLB?
>>
> I saw this code in intel_pasid_tear_down_entry(). Isn't the last line
> flush the devtlb? Not in guest of course since the passdown tlb flush
> is inclusive.
> 
> 	pasid_cache_invalidation_with_pasid(iommu, did, pasid);
> 	iotlb_invalidation_with_pasid(iommu, did, pasid);
> 
> 	/* Device IOTLB doesn't need to be flushed in caching mode. */
> 	if (!cap_caching_mode(iommu->cap))
> 		devtlb_invalidation_with_pasid(iommu, dev, pasid);
> 

But devtlb_invalidation_with_pasid() doesn't do the right thing, it
flushes the device tlb, instead of pasid-based device tlb.

static void
devtlb_invalidation_with_pasid(struct intel_iommu *iommu,
                                struct device *dev, int pasid)
{
         struct device_domain_info *info;
         u16 sid, qdep, pfsid;

         info = dev->archdata.iommu;
         if (!info || !info->ats_enabled)
                 return;

         sid = info->bus << 8 | info->devfn;
         qdep = info->ats_qdep;
         pfsid = info->pfsid;

         qi_flush_dev_iotlb(iommu, sid, pfsid, qdep, 0, 64 - 
VTD_PAGE_SHIFT);
}

Best regards,
baolu

>> Best regards,
>> baolu
>>
>>>
>>> Cc: Lu Baolu <baolu.lu@linux.intel.com>
>>> Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
>>> ---
>>>    drivers/iommu/intel-svm.c | 6 ++----
>>>    1 file changed, 2 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/iommu/intel-svm.c b/drivers/iommu/intel-svm.c
>>> index 8f42d717d8d7..1483f1845762 100644
>>> --- a/drivers/iommu/intel-svm.c
>>> +++ b/drivers/iommu/intel-svm.c
>>> @@ -268,10 +268,9 @@ static void intel_mm_release(struct
>>> mmu_notifier *mn, struct mm_struct *mm)
>>>    	 * *has* to handle gracefully without affecting other
>>> processes. */
>>>    	rcu_read_lock();
>>> -	list_for_each_entry_rcu(sdev, &svm->devs, list) {
>>> +	list_for_each_entry_rcu(sdev, &svm->devs, list)
>>>    		intel_pasid_tear_down_entry(svm->iommu,
>>> sdev->dev, svm->pasid);
>>> -		intel_flush_svm_range_dev(svm, sdev, 0, -1, 0);
>>> -	}
>>> +
>>>    	rcu_read_unlock();
>>>    
>>>    }
>>> @@ -731,7 +730,6 @@ int intel_svm_unbind_mm(struct device *dev, int
>>> pasid)
>>>    			 * large and has to be physically
>>> contiguous. So it's
>>>    			 * hard to be as defensive as we might
>>> like. */ intel_pasid_tear_down_entry(iommu, dev, svm->pasid);
>>> -			intel_flush_svm_range_dev(svm, sdev, 0,
>>> -1, 0); kfree_rcu(sdev, rcu);
>>>    
>>>    			if (list_empty(&svm->devs)) {
>>>    
> 
> [Jacob Pan]
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
