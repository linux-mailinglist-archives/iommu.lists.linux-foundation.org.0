Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 2995B3B03E2
	for <lists.iommu@lfdr.de>; Tue, 22 Jun 2021 14:11:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6C2C6077A;
	Tue, 22 Jun 2021 12:11:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JZSpFAbjsDnR; Tue, 22 Jun 2021 12:11:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id A446660778;
	Tue, 22 Jun 2021 12:11:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 71AACC0022;
	Tue, 22 Jun 2021 12:11:24 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 14EE7C000E
 for <iommu@lists.linux-foundation.org>; Tue, 22 Jun 2021 12:11:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E270F83938
 for <iommu@lists.linux-foundation.org>; Tue, 22 Jun 2021 12:11:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rXWSm3fn_KL5 for <iommu@lists.linux-foundation.org>;
 Tue, 22 Jun 2021 12:11:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp1.osuosl.org (Postfix) with ESMTP id E6987837EC
 for <iommu@lists.linux-foundation.org>; Tue, 22 Jun 2021 12:11:20 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D5853ED1;
 Tue, 22 Jun 2021 05:11:19 -0700 (PDT)
Received: from [10.57.9.136] (unknown [10.57.9.136])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 73A493F694;
 Tue, 22 Jun 2021 05:11:18 -0700 (PDT)
Subject: Re: [PATCHv2 1/3] iommu/io-pgtable: Add a quirk to use
 tlb_flush_all() for partial walk flush
To: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
References: <cover.1623981933.git.saiprakash.ranjan@codeaurora.org>
 <b099af10926b34249f4a30262db37f50491bebe7.1623981933.git.saiprakash.ranjan@codeaurora.org>
 <904f283c-f8b1-ba84-d010-eacc87bb53c5@arm.com>
 <a110e58e36af207be2bed04d1331832a@codeaurora.org>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <2b093b93-7fab-be35-59d8-4463c199719a@arm.com>
Date: Tue, 22 Jun 2021 13:11:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <a110e58e36af207be2bed04d1331832a@codeaurora.org>
Content-Language: en-GB
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

On 2021-06-22 08:11, Sai Prakash Ranjan wrote:
> Hi Robin,
> 
> On 2021-06-21 21:15, Robin Murphy wrote:
>> On 2021-06-18 03:51, Sai Prakash Ranjan wrote:
>>> Add a quirk IO_PGTABLE_QUIRK_TLB_INV_ALL to invalidate entire context
>>> with tlb_flush_all() callback in partial walk flush to improve unmap
>>> performance on select few platforms where the cost of over-invalidation
>>> is less than the unmap latency.
>>
>> I still think this doesn't belong anywhere near io-pgtable at all.
>> It's a driver-internal decision how exactly it implements a non-leaf
>> invalidation, and that may be more complex than a predetermined
>> boolean decision. For example, I've just realised for SMMUv3 we can't
>> invalidate multiple levels of table at once with a range command,
>> since if we assume the whole thing is mapped at worst-case page
>> granularity we may fail to invalidate any parts which are mapped as
>> intermediate-level blocks. If invalidating a 1GB region (with 4KB
>> granule) means having to fall back to 256K non-range commands, we may
>> not want to invalidate by VA then, even though doing so for a 2MB
>> region is still optimal.
>>
>> It's also quite feasible that drivers might want to do this for leaf
>> invalidations too - if you don't like issuing 512 commands to
>> invalidate 2MB, do you like issuing 511 commands to invalidate 2044KB?
>> - and at that point the logic really has to be in the driver anyway.
>>
> 
> Ok I will move this to tlb_flush_walk() functions in the drivers. In the 
> previous
> v1 thread, you suggested to make the choice in iommu_get_dma_strict() test,
> I assume you meant the test in iommu_dma_init_domain() with a flag or 
> was it
> the leaf driver(ex:arm-smmu.c) test of iommu_get_dma_strict() in 
> init_domain?

Yes, I meant literally inside the same condition where we currently set 
"pgtbl_cfg.quirks |= IO_PGTABLE_QUIRK_NON_STRICT;" in 
arm_smmu_init_domain_context().

> I am still a bit confused on where this flag would be? Should this be a 
> part
> of struct iommu_domain?

Well, if you were to rewrite the config with an alternative set of 
flush_ops at that point it would be implicit. For a flag, probably 
either in arm_smmu_domain or arm_smmu_impl. Maybe a flag would be less 
useful than generalising straight to a "maximum number of by-VA 
invalidations it's worth sending individually" threshold value? It's 
clear to me what overall shape and separation of responsibility is most 
logical, but beyond that I don't have a particularly strong opinion on 
the exact implementation; I've just been chucking ideas around :)

Cheers,
Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
