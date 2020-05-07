Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id C87161C9961
	for <lists.iommu@lfdr.de>; Thu,  7 May 2020 20:33:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 793268961A;
	Thu,  7 May 2020 18:33:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p3B1iyuUGToK; Thu,  7 May 2020 18:33:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id CF87B8965E;
	Thu,  7 May 2020 18:33:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B2D89C0890;
	Thu,  7 May 2020 18:33:54 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0912DC07FF
 for <iommu@lists.linux-foundation.org>; Thu,  7 May 2020 18:33:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id EABF48965E
 for <iommu@lists.linux-foundation.org>; Thu,  7 May 2020 18:33:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FKzqbrb955qG for <iommu@lists.linux-foundation.org>;
 Thu,  7 May 2020 18:33:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by hemlock.osuosl.org (Postfix) with ESMTP id C68768961A
 for <iommu@lists.linux-foundation.org>; Thu,  7 May 2020 18:33:51 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 32AC730E;
 Thu,  7 May 2020 11:33:51 -0700 (PDT)
Received: from [10.57.36.85] (unknown [10.57.36.85])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0FCD63F305;
 Thu,  7 May 2020 11:33:49 -0700 (PDT)
Subject: Re: [PATCH] iommu/iova: Retry from last rb tree node if iova search
 fails
To: Ajay kumar <ajaynumb@gmail.com>
References: <1588795317-20879-1-git-send-email-vjitta@codeaurora.org>
 <d9bfde9f-8f16-bf1b-311b-ea6c2b8ab93d@arm.com>
 <CAEC9eQMKc0dK9jGqOjeOQ3LT0fkJtYjgScb+ZF6MNagLERC7Jw@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <099cb855-62c7-6f58-6836-d910466afd4d@arm.com>
Date: Thu, 7 May 2020 19:33:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAEC9eQMKc0dK9jGqOjeOQ3LT0fkJtYjgScb+ZF6MNagLERC7Jw@mail.gmail.com>
Content-Language: en-GB
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 vinmenon@codeaurora.org, vjitta@codeaurora.org, kernel-team@android.com
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

On 2020-05-07 7:22 pm, Ajay kumar wrote:
> On 5/7/20, Robin Murphy <robin.murphy@arm.com> wrote:
>> On 2020-05-06 9:01 pm, vjitta@codeaurora.org wrote:
>>> From: Vijayanand Jitta <vjitta@codeaurora.org>
>>>
>>> When ever a new iova alloc request comes iova is always searched
>>> from the cached node and the nodes which are previous to cached
>>> node. So, even if there is free iova space available in the nodes
>>> which are next to the cached node iova allocation can still fail
>>> because of this approach.
>>>
>>> Consider the following sequence of iova alloc and frees on
>>> 1GB of iova space
>>>
>>> 1) alloc - 500MB
>>> 2) alloc - 12MB
>>> 3) alloc - 499MB
>>> 4) free -  12MB which was allocated in step 2
>>> 5) alloc - 13MB
>>>
>>> After the above sequence we will have 12MB of free iova space and
>>> cached node will be pointing to the iova pfn of last alloc of 13MB
>>> which will be the lowest iova pfn of that iova space. Now if we get an
>>> alloc request of 2MB we just search from cached node and then look
>>> for lower iova pfn's for free iova and as they aren't any, iova alloc
>>> fails though there is 12MB of free iova space.
>>
>> Yup, this could definitely do with improving. Unfortunately I think this
>> particular implementation is slightly flawed...
>>
>>> To avoid such iova search failures do a retry from the last rb tree node
>>> when iova search fails, this will search the entire tree and get an iova
>>> if its available
>>>
>>> Signed-off-by: Vijayanand Jitta <vjitta@codeaurora.org>
>>> ---
>>>    drivers/iommu/iova.c | 11 +++++++++++
>>>    1 file changed, 11 insertions(+)
>>>
>>> diff --git a/drivers/iommu/iova.c b/drivers/iommu/iova.c
>>> index 0e6a953..2985222 100644
>>> --- a/drivers/iommu/iova.c
>>> +++ b/drivers/iommu/iova.c
>>> @@ -186,6 +186,7 @@ static int __alloc_and_insert_iova_range(struct
>>> iova_domain *iovad,
>>>    	unsigned long flags;
>>>    	unsigned long new_pfn;
>>>    	unsigned long align_mask = ~0UL;
>>> +	bool retry = false;
>>>
>>>    	if (size_aligned)
>>>    		align_mask <<= fls_long(size - 1);
>>> @@ -198,6 +199,8 @@ static int __alloc_and_insert_iova_range(struct
>>> iova_domain *iovad,
>>>
>>>    	curr = __get_cached_rbnode(iovad, limit_pfn);
>>>    	curr_iova = rb_entry(curr, struct iova, node);
>>> +
>>> +retry_search:
>>>    	do {
>>>    		limit_pfn = min(limit_pfn, curr_iova->pfn_lo);
>>>    		new_pfn = (limit_pfn - size) & align_mask;
>>> @@ -207,6 +210,14 @@ static int __alloc_and_insert_iova_range(struct
>>> iova_domain *iovad,
>>>    	} while (curr && new_pfn <= curr_iova->pfn_hi);
>>>
>>>    	if (limit_pfn < size || new_pfn < iovad->start_pfn) {
>>> +		if (!retry) {
>>> +			curr = rb_last(&iovad->rbroot);
>>
>> Why walk when there's an anchor node there already? However...
> +1
>>
>>> +			curr_iova = rb_entry(curr, struct iova, node);
>>> +			limit_pfn = curr_iova->pfn_lo;
>>
>> ...this doesn't look right, as by now we've lost the original limit_pfn
>> supplied by the caller, so are highly likely to allocate beyond the
>> range our caller asked for. In fact AFAICS we'd start allocating from
>> directly directly below the anchor node, beyond the end of the entire
>> address space.
> +1
>>
>> The logic I was imagining we want here was something like the rapidly
>> hacked up (and untested) diff below.
>>
>> Thanks,
>> Robin.
>>
>> ----->8-----
>> diff --git a/drivers/iommu/iova.c b/drivers/iommu/iova.c
>> index 0e6a9536eca6..3574c19272d6 100644
>> --- a/drivers/iommu/iova.c
>> +++ b/drivers/iommu/iova.c
>> @@ -186,6 +186,7 @@ static int __alloc_and_insert_iova_range(struct
>> iova_domain *iovad,
>>           unsigned long flags;
>>           unsigned long new_pfn;
>>           unsigned long align_mask = ~0UL;
>> +       unsigned long alloc_hi, alloc_lo;
>>
>>           if (size_aligned)
>>                   align_mask <<= fls_long(size - 1);
>> @@ -196,17 +197,27 @@ static int __alloc_and_insert_iova_range(struct
>> iova_domain *iovad,
>>                           size >= iovad->max32_alloc_size)
>>                   goto iova32_full;
>>
>> +       alloc_hi = IOVA_ANCHOR;
>> +       alloc_lo = iovad->start_pfn;
>> +retry:
>>           curr = __get_cached_rbnode(iovad, limit_pfn);
>>           curr_iova = rb_entry(curr, struct iova, node);
>> +       if (alloc_hi < curr_iova->pfn_hi) {
>> +               alloc_lo = curr_iova->pfn_hi;
>> +               alloc_hi = limit_pfn;
>> +       }
>> +
>>           do {
>> -               limit_pfn = min(limit_pfn, curr_iova->pfn_lo);
>> -               new_pfn = (limit_pfn - size) & align_mask;
>> +               alloc_hi = min(alloc_hi, curr_iova->pfn_lo);
> During retry case, the curr and curr_iova is not updated. Kindly check it.

Right, after we've used the cached node to set the lower limit for the 
retry pass, we also need to search the tree for the next node above 
limit_pfn for the actual starting point.

Did I mention this was a completely untested brain-dump? :D

Thanks,
Robin.

> Ajay
>> +               new_pfn = (alloc_hi - size) & align_mask;
>>                   prev = curr;
>>                   curr = rb_prev(curr);
>>                   curr_iova = rb_entry(curr, struct iova, node);
>>           } while (curr && new_pfn <= curr_iova->pfn_hi);
>>
>> -       if (limit_pfn < size || new_pfn < iovad->start_pfn) {
>> +       if (limit_pfn < size || new_pfn < alloc_lo) {
>> +               if (alloc_lo == iovad->start_pfn)
>> +                       goto retry;
>>                   iovad->max32_alloc_size = size;
>>                   goto iova32_full;
>>           }
>> _______________________________________________
>> iommu mailing list
>> iommu@lists.linux-foundation.org
>> https://lists.linuxfoundation.org/mailman/listinfo/iommu
>>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
