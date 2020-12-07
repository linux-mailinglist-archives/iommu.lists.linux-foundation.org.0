Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id C75ED2D10CC
	for <lists.iommu@lfdr.de>; Mon,  7 Dec 2020 13:46:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 35D682E16B;
	Mon,  7 Dec 2020 12:46:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q5W8xjiyU8f8; Mon,  7 Dec 2020 12:46:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 1368F275A6;
	Mon,  7 Dec 2020 12:46:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E9F37C013B;
	Mon,  7 Dec 2020 12:46:51 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F3CC7C013B
 for <iommu@lists.linux-foundation.org>; Mon,  7 Dec 2020 12:46:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id DD338275A6
 for <iommu@lists.linux-foundation.org>; Mon,  7 Dec 2020 12:46:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lF0YWItdu80P for <iommu@lists.linux-foundation.org>;
 Mon,  7 Dec 2020 12:46:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by silver.osuosl.org (Postfix) with ESMTP id 4B11227266
 for <iommu@lists.linux-foundation.org>; Mon,  7 Dec 2020 12:46:48 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B6B401042;
 Mon,  7 Dec 2020 04:46:47 -0800 (PST)
Received: from [10.57.61.6] (unknown [10.57.61.6])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5403D3F718;
 Mon,  7 Dec 2020 04:46:45 -0800 (PST)
Subject: Re: [PATCH] iommu: Up front sanity check in the arm_lpae_map
To: zhukeqian <zhukeqian1@huawei.com>, Will Deacon <will@kernel.org>
References: <20201205082957.12544-1-zhukeqian1@huawei.com>
 <b85e98c8-0117-49c5-97ad-896ff88f7b88@arm.com>
 <20201207120527.GA4474@willie-the-truck>
 <2b0ec25b-0fa4-65ca-7c1b-109ce766197f@huawei.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <9a6f31d7-3471-c045-368b-42ece5a2d34d@arm.com>
Date: Mon, 7 Dec 2020 12:46:44 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <2b0ec25b-0fa4-65ca-7c1b-109ce766197f@huawei.com>
Content-Language: en-GB
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Marc Zyngier <maz@kernel.org>,
 jiangkunkun@huawei.com, linux-kernel@vger.kernel.org,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Alexios Zavras <alexios.zavras@intel.com>, iommu@lists.linux-foundation.org,
 Mark Brown <broonie@kernel.org>, James Morse <james.morse@arm.com>,
 linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, wanghaibin.wang@huawei.com,
 Thomas Gleixner <tglx@linutronix.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 Julien Thierry <julien.thierry.kdev@gmail.com>
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

On 2020-12-07 12:15, zhukeqian wrote:
> Hi,
> 
> On 2020/12/7 20:05, Will Deacon wrote:
>> On Mon, Dec 07, 2020 at 12:01:09PM +0000, Robin Murphy wrote:
>>> On 2020-12-05 08:29, Keqian Zhu wrote:
>>>> ... then we have more chance to detect wrong code logic.
>>>
>>> I don't follow that justification - it's still the same check with the same
>>> outcome, so how does moving it have any effect on the chance to detect
>>> errors?
> 
>>>
>>> AFAICS the only difference it would make is to make some errors *less*
>>> obvious - if a sufficiently broken caller passes an empty prot value
>>> alongside an invalid size or already-mapped address, this will now quietly
>>> hide the warnings from the more serious condition(s).
>>>
>>> Yes, it will bail out a bit faster in the specific case where the prot value
>>> is the only thing wrong, but since when do we optimise for fundamentally
>>> incorrect API usage?
>>
>> I thought it was the other way round -- doesn't this patch move the "empty
>> prot" check later, so we have a chance to check the size and addresses
>> first?
> 
> Yes, this is my original idea.
> For that we treat iommu_prot with no permission as success at early start, defer
> this early return can expose hidden errors.

...oh dear, my apologies. I've just had a week off and apparently in 
that time I lost the ability to read :(

I was somehow convinced that the existing check happened at the point 
where we go to install the PTE, and this patch was moving it earlier. 
Looking at the whole code in context now I see I got it completely 
backwards. Sorry for being an idiot.

I guess that only goes to show that a more descriptive commit message 
would definitely be a good thing :)

Robin.

> 
> Thanks,
> Keqian
>>
>> Will
>>
>>>> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
>>>> ---
>>>>    drivers/iommu/io-pgtable-arm.c | 8 ++++----
>>>>    1 file changed, 4 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
>>>> index a7a9bc08dcd1..8ade72adab31 100644
>>>> --- a/drivers/iommu/io-pgtable-arm.c
>>>> +++ b/drivers/iommu/io-pgtable-arm.c
>>>> @@ -444,10 +444,6 @@ static int arm_lpae_map(struct io_pgtable_ops *ops, unsigned long iova,
>>>>    	arm_lpae_iopte prot;
>>>>    	long iaext = (s64)iova >> cfg->ias;
>>>> -	/* If no access, then nothing to do */
>>>> -	if (!(iommu_prot & (IOMMU_READ | IOMMU_WRITE)))
>>>> -		return 0;
>>>> -
>>>>    	if (WARN_ON(!size || (size & cfg->pgsize_bitmap) != size))
>>>>    		return -EINVAL;
>>>> @@ -456,6 +452,10 @@ static int arm_lpae_map(struct io_pgtable_ops *ops, unsigned long iova,
>>>>    	if (WARN_ON(iaext || paddr >> cfg->oas))
>>>>    		return -ERANGE;
>>>> +	/* If no access, then nothing to do */
>>>> +	if (!(iommu_prot & (IOMMU_READ | IOMMU_WRITE)))
>>>> +		return 0;
>>>> +
>>>>    	prot = arm_lpae_prot_to_pte(data, iommu_prot);
>>>>    	ret = __arm_lpae_map(data, iova, paddr, size, prot, lvl, ptep, gfp);
>>>>    	/*
>>>>
>> .
>>
> _______________________________________________
> iommu mailing list
> iommu@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/iommu
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
