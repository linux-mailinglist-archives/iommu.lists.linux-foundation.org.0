Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C32B3B1B65
	for <lists.iommu@lfdr.de>; Wed, 23 Jun 2021 15:43:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1159F605F1;
	Wed, 23 Jun 2021 13:43:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XrLyGmKcTqDd; Wed, 23 Jun 2021 13:43:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 11569605D5;
	Wed, 23 Jun 2021 13:43:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E7E67C0021;
	Wed, 23 Jun 2021 13:43:12 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 52D65C000E
 for <iommu@lists.linux-foundation.org>; Wed, 23 Jun 2021 13:43:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with UTF8SMTP id 4109082E90
 for <iommu@lists.linux-foundation.org>; Wed, 23 Jun 2021 13:43:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with UTF8SMTP id pfkQ2luL5OtR for <iommu@lists.linux-foundation.org>;
 Wed, 23 Jun 2021 13:43:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by smtp1.osuosl.org (Postfix) with UTF8SMTPS id 3CDBF82E80
 for <iommu@lists.linux-foundation.org>; Wed, 23 Jun 2021 13:43:09 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1624455790; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=wV+nd+kMY0rKltOol5zVxgEq9lFFAYRlvZph3teCol0=;
 b=VmJUOswb3L0JDtGVqyMdUFWX0ygBl9APUacBYlU4MbHwda/TwvPiJyT3JdFEaAwKTWxZGpeo
 R/6Id8iAnkPtKlInO/yWRiRdQlTkEc1X1B2TAjm4KWsP2hFUgMwUB0qd2AAu7Rrbsvc3dAWf
 yeFJu5mAEdAF8QXVn32D3IHU5os=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI3NDkwMCIsICJpb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 60d33a67dc4628fe7e2ba4bd (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 23 Jun 2021 13:43:03
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id AC565C433D3; Wed, 23 Jun 2021 13:43:02 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: saiprakash.ranjan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 763E6C433F1;
 Wed, 23 Jun 2021 13:43:01 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 23 Jun 2021 19:13:01 +0530
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCHv2 1/3] iommu/io-pgtable: Add a quirk to use
 tlb_flush_all() for partial walk flush
In-Reply-To: <015e1274-d28e-f5e3-7f96-b79cf3d56a8e@arm.com>
References: <cover.1623981933.git.saiprakash.ranjan@codeaurora.org>
 <b099af10926b34249f4a30262db37f50491bebe7.1623981933.git.saiprakash.ranjan@codeaurora.org>
 <904f283c-f8b1-ba84-d010-eacc87bb53c5@arm.com>
 <a110e58e36af207be2bed04d1331832a@codeaurora.org>
 <2b093b93-7fab-be35-59d8-4463c199719a@arm.com>
 <c0329da89bee9b51b88d907875608877@codeaurora.org>
 <015e1274-d28e-f5e3-7f96-b79cf3d56a8e@arm.com>
Message-ID: <7f2d853b9d6cf5b4781810ce86dc8ceb@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Cc: linux-arm-msm@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Thierry Reding <treding@nvidia.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org
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

Hi Robin,

On 2021-06-23 00:07, Robin Murphy wrote:
> On 2021-06-22 15:27, Sai Prakash Ranjan wrote:
>> Hi Robin,
>> 
>> On 2021-06-22 17:41, Robin Murphy wrote:
>>> On 2021-06-22 08:11, Sai Prakash Ranjan wrote:
>>>> Hi Robin,
>>>> 
>>>> On 2021-06-21 21:15, Robin Murphy wrote:
>>>>> On 2021-06-18 03:51, Sai Prakash Ranjan wrote:
>>>>>> Add a quirk IO_PGTABLE_QUIRK_TLB_INV_ALL to invalidate entire 
>>>>>> context
>>>>>> with tlb_flush_all() callback in partial walk flush to improve 
>>>>>> unmap
>>>>>> performance on select few platforms where the cost of 
>>>>>> over-invalidation
>>>>>> is less than the unmap latency.
>>>>> 
>>>>> I still think this doesn't belong anywhere near io-pgtable at all.
>>>>> It's a driver-internal decision how exactly it implements a 
>>>>> non-leaf
>>>>> invalidation, and that may be more complex than a predetermined
>>>>> boolean decision. For example, I've just realised for SMMUv3 we 
>>>>> can't
>>>>> invalidate multiple levels of table at once with a range command,
>>>>> since if we assume the whole thing is mapped at worst-case page
>>>>> granularity we may fail to invalidate any parts which are mapped as
>>>>> intermediate-level blocks. If invalidating a 1GB region (with 4KB
>>>>> granule) means having to fall back to 256K non-range commands, we 
>>>>> may
>>>>> not want to invalidate by VA then, even though doing so for a 2MB
>>>>> region is still optimal.
>>>>> 
>>>>> It's also quite feasible that drivers might want to do this for 
>>>>> leaf
>>>>> invalidations too - if you don't like issuing 512 commands to
>>>>> invalidate 2MB, do you like issuing 511 commands to invalidate 
>>>>> 2044KB?
>>>>> - and at that point the logic really has to be in the driver 
>>>>> anyway.
>>>>> 
>>>> 
>>>> Ok I will move this to tlb_flush_walk() functions in the drivers. In 
>>>> the previous
>>>> v1 thread, you suggested to make the choice in 
>>>> iommu_get_dma_strict() test,
>>>> I assume you meant the test in iommu_dma_init_domain() with a flag 
>>>> or was it
>>>> the leaf driver(ex:arm-smmu.c) test of iommu_get_dma_strict() in 
>>>> init_domain?
>>> 
>>> Yes, I meant literally inside the same condition where we currently
>>> set "pgtbl_cfg.quirks |= IO_PGTABLE_QUIRK_NON_STRICT;" in
>>> arm_smmu_init_domain_context().
>>> 
>> 
>> Ok got it, thanks.
>> 
>>>> I am still a bit confused on where this flag would be? Should this 
>>>> be a part
>>>> of struct iommu_domain?
>>> 
>>> Well, if you were to rewrite the config with an alternative set of
>>> flush_ops at that point it would be implicit. For a flag, probably
>>> either in arm_smmu_domain or arm_smmu_impl. Maybe a flag would be 
>>> less
>>> useful than generalising straight to a "maximum number of by-VA
>>> invalidations it's worth sending individually" threshold value?
>> 
>> But then we would still need some flag to make this implementation
>> specific (qcom specific for now) and this threshold would just be
>> another condition although it would have been useful if this was
>> generic enough.
> 
> Well, for that approach I assume we could do something like
> special-case 0, or if it's a mutable per-domain value maybe just
> initialise it to SIZE_MAX or whatever such that it would never be
> reached in practice. Whichever way, it was meant to be implied that
> anything at the domain level would still be subject to final
> adjustment by the init_context hook.
> 

Ok that should work, so I went ahead with another set of flush_ops
and posted out v3.

Thanks,
Sai

> 
>>> It's clear to me what overall shape and separation of responsibility 
>>> is
>>> most logical, but beyond that I don't have a particularly strong
>>> opinion on the exact implementation; I've just been chucking ideas
>>> around :)
>>> 
>> 
>> Your ideas are very informative and useful :)
>> 
>> Thanks,
>> Sai
>> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
