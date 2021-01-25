Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id F31253022D0
	for <lists.iommu@lfdr.de>; Mon, 25 Jan 2021 09:30:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A5E3D2010A;
	Mon, 25 Jan 2021 08:30:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AMw5+NJDn45a; Mon, 25 Jan 2021 08:30:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 593C3272E0;
	Mon, 25 Jan 2021 08:30:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3FF05C013A;
	Mon, 25 Jan 2021 08:30:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 953B5C013A
 for <iommu@lists.linux-foundation.org>; Mon, 25 Jan 2021 08:30:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 826D120509
 for <iommu@lists.linux-foundation.org>; Mon, 25 Jan 2021 08:30:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9KcBbXa1ufLL for <iommu@lists.linux-foundation.org>;
 Mon, 25 Jan 2021 08:30:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by silver.osuosl.org (Postfix) with ESMTPS id 7ABC02010A
 for <iommu@lists.linux-foundation.org>; Mon, 25 Jan 2021 08:30:52 +0000 (UTC)
IronPort-SDR: hfiJFaepNjEQQ9Xpdjy/dlGYq2pREfnpjppBR1UeNe10l9G0xNOQ2x/u1vD7lhhuCug4oEj18Z
 oUfv8xplef+w==
X-IronPort-AV: E=McAfee;i="6000,8403,9874"; a="176173552"
X-IronPort-AV: E=Sophos;i="5.79,373,1602572400"; d="scan'208";a="176173552"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2021 00:30:46 -0800
IronPort-SDR: g+0sRwh72EjCtadnOwMv0x3ysX2nnnQAeIFDPcMGQRoJJn1gcqNDTDz4dTeni5jRvYhAAGQJh5
 WI6af5RlG7Xw==
X-IronPort-AV: E=Sophos;i="5.79,373,1602572400"; d="scan'208";a="387241797"
Received: from blu2-mobl3.ccr.corp.intel.com (HELO [10.255.29.249])
 ([10.255.29.249])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2021 00:30:44 -0800
Subject: Re: [PATCH 1/3] iommu/vt-d: Add rate limited information when PRQ
 overflows
To: "Tian, Kevin" <kevin.tian@intel.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>
References: <20210121014505.1659166-1-baolu.lu@linux.intel.com>
 <20210121014505.1659166-2-baolu.lu@linux.intel.com>
 <MWHPR11MB18862D2EA5BD432BF22D99A48CA09@MWHPR11MB1886.namprd11.prod.outlook.com>
 <da341e11-0923-9127-3385-c2eab9e0db2b@linux.intel.com>
 <MWHPR11MB188688A4C436B318AB0CDCB98CBD9@MWHPR11MB1886.namprd11.prod.outlook.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <1a04f6c2-0c82-1693-c7e5-1333d3fced17@linux.intel.com>
Date: Mon, 25 Jan 2021 16:30:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <MWHPR11MB188688A4C436B318AB0CDCB98CBD9@MWHPR11MB1886.namprd11.prod.outlook.com>
Content-Language: en-US
Cc: "Raj, Ashok" <ashok.raj@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>
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

Hi Kevin,

On 2021/1/25 16:16, Tian, Kevin wrote:
>> From: Lu Baolu <baolu.lu@linux.intel.com>
>> Sent: Monday, January 25, 2021 2:29 PM
>>
>> Hi Kevin,
>>
>> On 2021/1/22 14:38, Tian, Kevin wrote:
>>>> From: Lu Baolu <baolu.lu@linux.intel.com>
>>>> Sent: Thursday, January 21, 2021 9:45 AM
>>>>
>>>> So that the uses could get chances to know what happened.
>>>>
>>>> Suggested-by: Ashok Raj <ashok.raj@intel.com>
>>>> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
>>>> ---
>>>>    drivers/iommu/intel/svm.c | 10 ++++++++--
>>>>    1 file changed, 8 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/iommu/intel/svm.c b/drivers/iommu/intel/svm.c
>>>> index 033b25886e57..f49fe715477b 100644
>>>> --- a/drivers/iommu/intel/svm.c
>>>> +++ b/drivers/iommu/intel/svm.c
>>>> @@ -895,6 +895,7 @@ static irqreturn_t prq_event_thread(int irq, void
>> *d)
>>>>    	struct intel_iommu *iommu = d;
>>>>    	struct intel_svm *svm = NULL;
>>>>    	int head, tail, handled = 0;
>>>> +	struct page_req_dsc *req;
>>>>
>>>>    	/* Clear PPR bit before reading head/tail registers, to
>>>>    	 * ensure that we get a new interrupt if needed. */
>>>> @@ -904,7 +905,6 @@ static irqreturn_t prq_event_thread(int irq, void
>> *d)
>>>>    	head = dmar_readq(iommu->reg + DMAR_PQH_REG) &
>>>> PRQ_RING_MASK;
>>>>    	while (head != tail) {
>>>>    		struct vm_area_struct *vma;
>>>> -		struct page_req_dsc *req;
>>>>    		struct qi_desc resp;
>>>>    		int result;
>>>>    		vm_fault_t ret;
>>>> @@ -1042,8 +1042,14 @@ static irqreturn_t prq_event_thread(int irq,
>> void
>>>> *d)
>>>>    	 * Clear the page request overflow bit and wake up all threads that
>>>>    	 * are waiting for the completion of this handling.
>>>>    	 */
>>>> -	if (readl(iommu->reg + DMAR_PRS_REG) & DMA_PRS_PRO)
>>>> +	if (readl(iommu->reg + DMAR_PRS_REG) & DMA_PRS_PRO) {
>>>> +		head = dmar_readq(iommu->reg + DMAR_PQH_REG) &
>>>> PRQ_RING_MASK;
>>>> +		req = &iommu->prq[head / sizeof(*req)];
>>>> +		pr_warn_ratelimited("IOMMU: %s: Page request overflow:
>>>> HEAD: %08llx %08llx",
>>>> +				    iommu->name, ((unsigned long long
>>>> *)req)[0],
>>>> +				    ((unsigned long long *)req)[1]);
>>>>    		writel(DMA_PRS_PRO, iommu->reg + DMAR_PRS_REG);
>>>> +	}
>>>>
>>>
>>> Not about rate limiting but I think we may have a problem in above
>>> logic. It is incorrect to always clear PRO when it's set w/o first checking
>>> whether the overflow condition has been cleared. This code assumes
>>> that if an overflow condition occurs it must have been cleared by earlier
>>> loop when hitting this check. However since this code runs in a threaded
>>> context, the overflow condition could occur even after you reset the head
>>> to the tail (under some extreme condition). To be sane I think we'd better
>>> read both head/tail again after seeing a pending PRO here and only clear
>>> PRO when it becomes a false indicator based on latest head/tail.
>>>
>>
>> Yes, agreed. We can check the head and tail and clear the overflow bit
>> until the queue is empty. The finial code looks like:
>>
>>           /*
>>            * Clear the page request overflow bit and wake up all threads that
>>            * are waiting for the completion of this handling.
>>            */
>>           if (readl(iommu->reg + DMAR_PRS_REG) & DMA_PRS_PRO) {
>>                   head = dmar_readq(iommu->reg + DMAR_PQH_REG) &
>> PRQ_RING_MASK;
>>                   tail = dmar_readq(iommu->reg + DMAR_PQT_REG) &
>> PRQ_RING_MASK;
>>                   if (head == tail) {
>>                           req = &iommu->prq[head / sizeof(*req)];
>>                           pr_warn_ratelimited("IOMMU: %s: Page request
>> overflow cleared: HEAD: %08llx %08llx",
>>                                               iommu->name, ((unsigned
>> long long *)req)[0],
>>                                               ((unsigned long long
>> *)req)[1]);
>>                           writel(DMA_PRS_PRO, iommu->reg + DMAR_PRS_REG);
>>                   }
>>           }
>>
>> Thought?
>>
> 
> Just a small comment. Is it useful to also print a warning in the true
> overflow condition which has to wait for next interrupt to be cleared?
> 

That's fine. :-)

> Thanks
> Kevin
> 

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
