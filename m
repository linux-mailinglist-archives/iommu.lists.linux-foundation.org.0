Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id B6CAF107538
	for <lists.iommu@lfdr.de>; Fri, 22 Nov 2019 16:51:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3E65F882BE;
	Fri, 22 Nov 2019 15:51:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RPbezLbmL8Bm; Fri, 22 Nov 2019 15:51:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 57DB7882AA;
	Fri, 22 Nov 2019 15:51:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4E2D1C1DDD;
	Fri, 22 Nov 2019 15:51:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C76C5C18DA
 for <iommu@lists.linux-foundation.org>; Fri, 22 Nov 2019 15:51:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C3B03884D0
 for <iommu@lists.linux-foundation.org>; Fri, 22 Nov 2019 15:51:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 46m0xrcOp27V for <iommu@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 15:51:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by hemlock.osuosl.org (Postfix) with ESMTP id BD58387E8E
 for <iommu@lists.linux-foundation.org>; Fri, 22 Nov 2019 15:51:31 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 37BE6DA7;
 Fri, 22 Nov 2019 07:51:31 -0800 (PST)
Received: from [10.1.196.37] (e121345-lin.cambridge.arm.com [10.1.196.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B60F53F6C4;
 Fri, 22 Nov 2019 07:51:30 -0800 (PST)
Subject: Re: [PATCH v2 09/10] iommu/io-pgtable-arm: Rationalise TCR handling
To: Will Deacon <will@kernel.org>, iommu@lists.linux-foundation.org,
 linux-arm-kernel@lists.infradead.org
References: <cover.1572024119.git.robin.murphy@arm.com>
 <84e56eb993fff3660376ffad3e915b972d29b008.1572024120.git.robin.murphy@arm.com>
 <20191104191444.GI24909@willie-the-truck>
 <20191104232756.GB16446@jcrouse1-lnx.qualcomm.com>
 <20191120151142.GA26714@willie-the-truck>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <6e14584c-6942-b3b5-5691-faec4fc345f1@arm.com>
Date: Fri, 22 Nov 2019 15:51:26 +0000
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191120151142.GA26714@willie-the-truck>
Content-Language: en-GB
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

On 20/11/2019 3:11 pm, Will Deacon wrote:
> On Mon, Nov 04, 2019 at 04:27:56PM -0700, Jordan Crouse wrote:
>> On Mon, Nov 04, 2019 at 07:14:45PM +0000, Will Deacon wrote:
>>> On Fri, Oct 25, 2019 at 07:08:38PM +0100, Robin Murphy wrote:
>>>> diff --git a/drivers/iommu/qcom_iommu.c b/drivers/iommu/qcom_iommu.c
>>>> index 9a57eb6c253c..059be7e21030 100644
>>>> --- a/drivers/iommu/qcom_iommu.c
>>>> +++ b/drivers/iommu/qcom_iommu.c
>>>> @@ -271,15 +271,13 @@ static int qcom_iommu_init_domain(struct iommu_domain *domain,
>>>>   		iommu_writeq(ctx, ARM_SMMU_CB_TTBR0,
>>>>   				pgtbl_cfg.arm_lpae_s1_cfg.ttbr |
>>>>   				FIELD_PREP(TTBRn_ASID, ctx->asid));
>>>> -		iommu_writeq(ctx, ARM_SMMU_CB_TTBR1,
>>>> -				FIELD_PREP(TTBRn_ASID, ctx->asid));
>>>> +		iommu_writeq(ctx, ARM_SMMU_CB_TTBR1, 0);
>>>
>>> Are you sure it's safe to drop the ASID here? Just want to make sure there
>>> wasn't some "quirk" this was helping with.
>>
>> I was reminded of this recently. Some of our SMMU guys told me that a 0x0 in
>> TTBR1 could cause a S2 fault if a faulty transaction caused a ttbr1 lookup so
>> the "quirk" was writing the ASID so the register wasn't zero. I'm not sure if
>> this is a vendor specific blip or not.
> 
> You should be able to set EPD1 to prevent walks via TTBR1 in that case,
> though. Sticking the ASID in there is still dodgy if EPD1 is clear and
> TTBR1 points at junk (or even physical address 0x0).
> 
> That's probably something which should be folded into this patch.

Note that EPD1 was being set by io-pgtable-arm before this patch, and 
remains set by virtue of arm_smmu_lpae_tcr() afterwards, so presumably 
the brokenness might run a bit deeper than that. Either way, though, I'm 
somewhat dubious since the ASID could well be 0 anyway :/

Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
