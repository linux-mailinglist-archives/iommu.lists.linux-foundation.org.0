Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AFBCD8BA7
	for <lists.iommu@lfdr.de>; Wed, 16 Oct 2019 10:48:09 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id E64B4A7F;
	Wed, 16 Oct 2019 08:48:05 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 162B541C
	for <iommu@lists.linux-foundation.org>;
	Wed, 16 Oct 2019 08:48:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 7BE8C5D3
	for <iommu@lists.linux-foundation.org>;
	Wed, 16 Oct 2019 08:48:03 +0000 (UTC)
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id 8F356CBF38CF2F34D498;
	Wed, 16 Oct 2019 16:47:59 +0800 (CST)
Received: from [127.0.0.1] (10.202.227.179) by DGGEMS412-HUB.china.huawei.com
	(10.3.19.212) with Microsoft SMTP Server id 14.3.439.0;
	Wed, 16 Oct 2019 16:47:53 +0800
Subject: Re: [RFC PATCH 0/6] SMMUv3 PMCG IMP DEF event support
To: Robin Murphy <robin.murphy@arm.com>, <lorenzo.pieralisi@arm.com>,
	<guohanjun@huawei.com>, <sudeep.holla@arm.com>, <mark.rutland@arm.com>, 
	<will@kernel.org>
References: <1569854031-237636-1-git-send-email-john.garry@huawei.com>
	<66a3ce9f-d3cd-110f-7353-46e6eaf25b7c@arm.com>
From: John Garry <john.garry@huawei.com>
Message-ID: <1d546b4b-a2ad-49da-b532-951232093a9f@huawei.com>
Date: Wed, 16 Oct 2019 09:47:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <66a3ce9f-d3cd-110f-7353-46e6eaf25b7c@arm.com>
X-Originating-IP: [10.202.227.179]
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=unavailable version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: nleeder@codeaurora.org, rjw@rjwysocki.net, linux-kernel@vger.kernel.org,
	linuxarm@huawei.com, iommu@lists.linux-foundation.org,
	linux-arm-kernel@lists.infradead.org, lenb@kernel.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On 15/10/2019 19:00, Robin Murphy wrote:
> Hi John,
>
> On 30/09/2019 15:33, John Garry wrote:
>> This patchset adds IMP DEF event support for the SMMUv3 PMCG.
>>
>> It is marked as an RFC as the method to identify the PMCG implementation
>> may be a quite disliked. And, in general, the series is somewhat
>> incomplete.
>>
>> So the background is that the PMCG supports IMP DEF events, yet we
>> have no
>> method to identify the PMCG to know the IMP DEF events.
>>
>> A method for identifying the PMCG implementation could be using
>> PMDEVARCH, but we cannot rely on this being set properly, as whether this
>> is implemented is not defined in SMMUv3 spec.
>>
>> Another method would be perf event aliasing, but this method of event
>> matching is based on CPU id, which would not guarantee same
>> uniqueness as PMCG implementation.
>>
>> Yet another method could be to continue using ACPI OEM ID in the IORT
>> code, but this does not scale. And it is not suitable if we ever add DT
>> support to the PMCG driver.
>>
>> The method used in this series is based on matching on the parent SMMUv3
>> IIDR. We store this IIDR contents in the arm smmu structure as the first
>> element, which means that we don't have to expose SMMU APIs - this is
>> the part which may be disliked.
>>
>> The final two patches switch the pre-existing PMCG model identification
>> from ACPI OEM ID to the same parent SMMUv3 IIDR matching.
>>
>> For now, we only consider SMMUv3' nodes being the associated node for
>> PMCG.
>

Hi Robin,

> Two significant concerns right off the bat:
>
> - It seems more common than not for silicon designers to fail to
> implement IIDR correctly, so it's only a matter of time before
> inevitably needing to bring back some firmware-level identifier
> abstraction (if not already - does Hi161x have PMCGs?)

Maybe there's a way that we can switch to this method, and leave the 
door open for an easy way to support firmware-level identifier again, if 
ever needed. I'm not too pushed - this was secondary to just allowing 
the PMCG driver know the associated SMMU model.

And, no, hi161x does not have any PMCGs.

>
> - This seems like a step in entirely the wrong direction for supporting
>.

So to support PMCGs that reference a Named Component or Root Complex, I 
thought that the IORT parsing code would have to do some secondary 
lookup to the associated SMMU, through the Named Component or Root 
Complex node.

What was your idea here?

Note: I do acknowledge that an overall issue is that we assume all PMCG 
IMP DEF events are same for a given SMMU model.

>
> Interpreting the Node Reference is definitely a welcome improvement over
> matching table headers, but absent a truly compelling argument to the
> contrary, I'd rather retain the "PMCG model" abstraction in between that
> and the driver itself (especially since those can trivially be hung off
> compatibles once it comes to DT support).

For DT, I would assume that we just use compatible strings would allow 
us to identify the PMCG model.

On a related matter, is there still a need to deal with scenarios of the 
PMCG being located within the SMMU register map? As you may remember, we 
did have this issue but relocated the PMCG to outside the SMMU register 
map in a later chip rev.

Cheers,
John

>
> Thanks,
> Robin.
>
>>
>> John Garry (6):
>>    ACPI/IORT: Set PMCG device parent
>>    iommu/arm-smmu-v3: Record IIDR in arm_smmu_device structure
>>    perf/smmuv3: Retrieve parent SMMUv3 IIDR
>>    perf/smmuv3: Support HiSilicon hip08 (hi1620) IMP DEF events
>>    perf/smmuv3: Match implementation options based on parent SMMU IIDR
>>    ACPI/IORT: Drop code to set the PMCG software-defined model
>>
>>   drivers/acpi/arm64/iort.c     | 69 ++++++++++++++--------------
>>   drivers/iommu/arm-smmu-v3.c   |  5 +++
>>   drivers/perf/arm_smmuv3_pmu.c | 84 ++++++++++++++++++++++++++++++-----
>>   include/linux/acpi_iort.h     |  8 ----
>>   4 files changed, 112 insertions(+), 54 deletions(-)
>>
>
> .
>


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
