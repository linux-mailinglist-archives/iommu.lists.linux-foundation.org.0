Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id BE87C3E959F
	for <lists.iommu@lfdr.de>; Wed, 11 Aug 2021 18:12:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69C49608A5;
	Wed, 11 Aug 2021 16:12:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a6KU8wj4yj15; Wed, 11 Aug 2021 16:12:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 4344F60890;
	Wed, 11 Aug 2021 16:12:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 22AAEC000E;
	Wed, 11 Aug 2021 16:12:44 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 459F3C000E
 for <iommu@lists.linux-foundation.org>; Wed, 11 Aug 2021 16:12:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with UTF8SMTP id 40D17400D2
 for <iommu@lists.linux-foundation.org>; Wed, 11 Aug 2021 16:12:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with UTF8SMTP id qOwSww86mHvI for <iommu@lists.linux-foundation.org>;
 Wed, 11 Aug 2021 16:12:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by smtp2.osuosl.org (Postfix) with UTF8SMTPS id 5B6D2400FC
 for <iommu@lists.linux-foundation.org>; Wed, 11 Aug 2021 16:12:26 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1628698358; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=qxumipKKm/JchP+aeDIrrd0PRFUUHFLvRR6b646nQno=;
 b=CcgfNUCuL0E9uBQTPQVt6hef7HakiOe8X78UuTX8B/kcMaml3Zv7CfVHuVXi6zEHoFZJQVXy
 a9qCgzyNomNn2HHWaRYkvJQKhWUNOhdNhFfnbR5KAmw/qopfQ0SWxpvvDXBQ+MEV0ClqLUxI
 ttdSIFgQBhwdEHsZNUvHlrujdFM=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI3NDkwMCIsICJpb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 6113f57791487ad5206fcd9f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 11 Aug 2021 16:06:15
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id DD1A1C433D3; Wed, 11 Aug 2021 16:06:14 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: saiprakash.ranjan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id DC676C433F1;
 Wed, 11 Aug 2021 16:06:12 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 11 Aug 2021 21:36:12 +0530
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCHv4] iommu/arm-smmu: Optimize ->tlb_flush_walk() for qcom
 implementation
In-Reply-To: <7be65300-632a-8626-e5da-13bc9e276763@arm.com>
References: <20210811060725.25221-1-saiprakash.ranjan@codeaurora.org>
 <20210811103011.GD4426@willie-the-truck>
 <7be65300-632a-8626-e5da-13bc9e276763@arm.com>
Message-ID: <746c64bffa60e18b34075f09881946e0@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
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

On 2021-08-11 21:23, Robin Murphy wrote:
> On 2021-08-11 11:30, Will Deacon wrote:
>> On Wed, Aug 11, 2021 at 11:37:25AM +0530, Sai Prakash Ranjan wrote:
>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c 
>>> b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>> index f7da8953afbe..3904b598e0f9 100644
>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>> @@ -327,9 +327,16 @@ static void arm_smmu_tlb_inv_range_s2(unsigned 
>>> long iova, size_t size,
>>>   static void arm_smmu_tlb_inv_walk_s1(unsigned long iova, size_t 
>>> size,
>>>   				     size_t granule, void *cookie)
>>>   {
>>> -	arm_smmu_tlb_inv_range_s1(iova, size, granule, cookie,
>>> -				  ARM_SMMU_CB_S1_TLBIVA);
>>> -	arm_smmu_tlb_sync_context(cookie);
>>> +	struct arm_smmu_domain *smmu_domain = cookie;
>>> +	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
>>> +
>>> +	if (cfg->flush_walk_prefer_tlbiasid) {
>>> +		arm_smmu_tlb_inv_context_s1(cookie);
>> 
>> Hmm, this introduces an unconditional wmb() if tlbiasid is preferred. 
>> I
>> think that should be predicated on ARM_SMMU_FEAT_COHERENT_WALK like it 
>> is
>> for the by-VA ops. Worth doing as a separate patch.
>> 
>>> +	} else {
>>> +		arm_smmu_tlb_inv_range_s1(iova, size, granule, cookie,
>>> +					  ARM_SMMU_CB_S1_TLBIVA);
>>> +		arm_smmu_tlb_sync_context(cookie);
>>> +	}
>>>   }
>>>     static void arm_smmu_tlb_add_page_s1(struct iommu_iotlb_gather 
>>> *gather,
>>> @@ -765,8 +772,10 @@ static int arm_smmu_init_domain_context(struct 
>>> iommu_domain *domain,
>>>   		.iommu_dev	= smmu->dev,
>>>   	};
>>>   -	if (!iommu_get_dma_strict(domain))
>>> +	if (!iommu_get_dma_strict(domain)) {
>>>   		pgtbl_cfg.quirks |= IO_PGTABLE_QUIRK_NON_STRICT;
>>> +		cfg->flush_walk_prefer_tlbiasid = true;
>> 
>> This is going to interact badly with Robin's series to allow dynamic
>> transition to non-strict mode, as we don't have a mechanism to switch
>> over to the by-ASID behaviour. Yes, it should _work_, but it's ugly 
>> having
>> different TLBI behaviour just because of the how the domain became
>> non-strict.
>> 
>> Robin -- I think this originated from your idea at [1]. Any idea how 
>> to make
>> it work with your other series, or shall we drop this part for now and 
>> leave
>> the TLB invalidation behaviour the same for now?
> 
> Yeah, I'd say drop it - I'm currently half an hour into a first
> attempt at removing io_pgtable_tlb_flush_walk() entirely, which would
> make it moot for non-strict anyway.
> 

I have dropped it and sent a v5.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
