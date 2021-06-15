Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id CC16E3A7D9B
	for <lists.iommu@lfdr.de>; Tue, 15 Jun 2021 13:51:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73C3F404B9;
	Tue, 15 Jun 2021 11:51:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vjm9jh3eISF0; Tue, 15 Jun 2021 11:51:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 323184055E;
	Tue, 15 Jun 2021 11:51:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1A924C000B;
	Tue, 15 Jun 2021 11:51:47 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AD021C000B
 for <iommu@lists.linux-foundation.org>; Tue, 15 Jun 2021 11:51:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A8C36402E0
 for <iommu@lists.linux-foundation.org>; Tue, 15 Jun 2021 11:51:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LuktJv3FOz00 for <iommu@lists.linux-foundation.org>;
 Tue, 15 Jun 2021 11:51:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp2.osuosl.org (Postfix) with ESMTP id CE1BC402AE
 for <iommu@lists.linux-foundation.org>; Tue, 15 Jun 2021 11:51:44 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1D31F31B;
 Tue, 15 Jun 2021 04:51:44 -0700 (PDT)
Received: from [10.57.9.136] (unknown [10.57.9.136])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 44C533F719;
 Tue, 15 Jun 2021 04:51:43 -0700 (PDT)
Subject: Re: [PATCH 1/1] iommu/arm-smmu-v3: remove unnecessary oom message
To: Will Deacon <will@kernel.org>,
 "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
References: <20210609125438.14369-1-thunder.leizhen@huawei.com>
 <20210611103220.GB15274@willie-the-truck>
 <2a0b7f37-156a-775f-ade4-015cade472c6@huawei.com>
 <20210615113417.GA20598@willie-the-truck>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <ab17a9d3-fe8b-dcd8-1a69-81f5604cfe81@arm.com>
Date: Tue, 15 Jun 2021 12:51:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210615113417.GA20598@willie-the-truck>
Content-Language: en-GB
Cc: iommu <iommu@lists.linux-foundation.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
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

On 2021-06-15 12:34, Will Deacon wrote:
> On Tue, Jun 15, 2021 at 07:22:10PM +0800, Leizhen (ThunderTown) wrote:
>>
>>
>> On 2021/6/11 18:32, Will Deacon wrote:
>>> On Wed, Jun 09, 2021 at 08:54:38PM +0800, Zhen Lei wrote:
>>>> Fixes scripts/checkpatch.pl warning:
>>>> WARNING: Possible unnecessary 'out of memory' message
>>>>
>>>> Remove it can help us save a bit of memory.
>>>>
>>>> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
>>>> ---
>>>>   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 8 ++------
>>>>   1 file changed, 2 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
>>>> index 2ddc3cd5a7d1..fd7c55b44881 100644
>>>> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
>>>> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
>>>> @@ -2787,10 +2787,8 @@ static int arm_smmu_init_l1_strtab(struct arm_smmu_device *smmu)
>>>>   	void *strtab = smmu->strtab_cfg.strtab;
>>>>   
>>>>   	cfg->l1_desc = devm_kzalloc(smmu->dev, size, GFP_KERNEL);
>>>> -	if (!cfg->l1_desc) {
>>>> -		dev_err(smmu->dev, "failed to allocate l1 stream table desc\n");
>>>> +	if (!cfg->l1_desc)
>>>
>>> What error do you get if devm_kzalloc() fails? I'd like to make sure it's
>>> easy to track down _which_ allocation failed in that case -- does it give
>>> you a line number, for example?
>>
>> When devm_kzalloc() fails, the OOM information is printed. No line number information, but the
>> size(order) and call stack is printed. It doesn't matter which allocation failed, the failure
>> is caused by insufficient system memory rather than the fault of the SMMU driver. Therefore,
>> the current printing is not helpful for locating the problem of insufficient memory. After all,
>> when memory allocation fails, the SMMU driver cannot work at a lower specification.
> 
> I don't entirely agree. Another reason for the failure is because the driver
> might be asking for a huge (or negative) allocation, in which case it might
> be instructive to have a look at the actual caller, particularly if the
> size is derived from hardware or firmware properties.

Agreed - other than deliberately-contrived situations I don't think I've 
ever hit a genuine OOM, but I definitely have debugged attempts to 
allocate -1 of something. If the driver-specific message actually calls 
out the critical information, e.g. "failed to allocate %d stream table 
entries", it gives debugging a head start since the miscalculation is 
obvious, but a static message that only identifies the callsite really 
only saves a quick trip to scripts/faddr2line, and personally I've never 
found that particularly valuable.

Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
