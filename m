Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC373E9516
	for <lists.iommu@lfdr.de>; Wed, 11 Aug 2021 17:53:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DED5340163;
	Wed, 11 Aug 2021 15:53:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K1SzJ7dSFLBt; Wed, 11 Aug 2021 15:53:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id D3CFF40432;
	Wed, 11 Aug 2021 15:53:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B9F35C001F;
	Wed, 11 Aug 2021 15:53:31 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2308EC000E
 for <iommu@lists.linux-foundation.org>; Wed, 11 Aug 2021 15:53:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2081140570
 for <iommu@lists.linux-foundation.org>; Wed, 11 Aug 2021 15:53:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X92uWdvZh1-5 for <iommu@lists.linux-foundation.org>;
 Wed, 11 Aug 2021 15:53:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B1B940553
 for <iommu@lists.linux-foundation.org>; Wed, 11 Aug 2021 15:53:29 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CCA36106F;
 Wed, 11 Aug 2021 08:53:28 -0700 (PDT)
Received: from [10.57.36.146] (unknown [10.57.36.146])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 00EEA3F718;
 Wed, 11 Aug 2021 08:53:26 -0700 (PDT)
Subject: Re: [PATCHv4] iommu/arm-smmu: Optimize ->tlb_flush_walk() for qcom
 implementation
To: Will Deacon <will@kernel.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
References: <20210811060725.25221-1-saiprakash.ranjan@codeaurora.org>
 <20210811103011.GD4426@willie-the-truck>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <7be65300-632a-8626-e5da-13bc9e276763@arm.com>
Date: Wed, 11 Aug 2021 16:53:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210811103011.GD4426@willie-the-truck>
Content-Language: en-GB
Cc: linux-arm-msm@vger.kernel.org, Doug Anderson <dianders@chromium.org>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Thierry Reding <treding@nvidia.com>, linux-arm-kernel@lists.infradead.org
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

On 2021-08-11 11:30, Will Deacon wrote:
> On Wed, Aug 11, 2021 at 11:37:25AM +0530, Sai Prakash Ranjan wrote:
>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> index f7da8953afbe..3904b598e0f9 100644
>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> @@ -327,9 +327,16 @@ static void arm_smmu_tlb_inv_range_s2(unsigned long iova, size_t size,
>>   static void arm_smmu_tlb_inv_walk_s1(unsigned long iova, size_t size,
>>   				     size_t granule, void *cookie)
>>   {
>> -	arm_smmu_tlb_inv_range_s1(iova, size, granule, cookie,
>> -				  ARM_SMMU_CB_S1_TLBIVA);
>> -	arm_smmu_tlb_sync_context(cookie);
>> +	struct arm_smmu_domain *smmu_domain = cookie;
>> +	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
>> +
>> +	if (cfg->flush_walk_prefer_tlbiasid) {
>> +		arm_smmu_tlb_inv_context_s1(cookie);
> 
> Hmm, this introduces an unconditional wmb() if tlbiasid is preferred. I
> think that should be predicated on ARM_SMMU_FEAT_COHERENT_WALK like it is
> for the by-VA ops. Worth doing as a separate patch.
> 
>> +	} else {
>> +		arm_smmu_tlb_inv_range_s1(iova, size, granule, cookie,
>> +					  ARM_SMMU_CB_S1_TLBIVA);
>> +		arm_smmu_tlb_sync_context(cookie);
>> +	}
>>   }
>>   
>>   static void arm_smmu_tlb_add_page_s1(struct iommu_iotlb_gather *gather,
>> @@ -765,8 +772,10 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
>>   		.iommu_dev	= smmu->dev,
>>   	};
>>   
>> -	if (!iommu_get_dma_strict(domain))
>> +	if (!iommu_get_dma_strict(domain)) {
>>   		pgtbl_cfg.quirks |= IO_PGTABLE_QUIRK_NON_STRICT;
>> +		cfg->flush_walk_prefer_tlbiasid = true;
> 
> This is going to interact badly with Robin's series to allow dynamic
> transition to non-strict mode, as we don't have a mechanism to switch
> over to the by-ASID behaviour. Yes, it should _work_, but it's ugly having
> different TLBI behaviour just because of the how the domain became
> non-strict.
> 
> Robin -- I think this originated from your idea at [1]. Any idea how to make
> it work with your other series, or shall we drop this part for now and leave
> the TLB invalidation behaviour the same for now?

Yeah, I'd say drop it - I'm currently half an hour into a first attempt 
at removing io_pgtable_tlb_flush_walk() entirely, which would make it 
moot for non-strict anyway.

Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
