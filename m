Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2FF3AC9AE
	for <lists.iommu@lfdr.de>; Fri, 18 Jun 2021 13:19:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3186560011;
	Fri, 18 Jun 2021 11:19:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x-0cTIfPokOx; Fri, 18 Jun 2021 11:19:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 337E3605F1;
	Fri, 18 Jun 2021 11:19:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D3718C0022;
	Fri, 18 Jun 2021 11:19:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0BEBCC000B;
 Fri, 18 Jun 2021 11:19:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DDC464042F;
 Fri, 18 Jun 2021 11:19:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3Rzr7vzEvYQg; Fri, 18 Jun 2021 11:19:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8AF3A40326;
 Fri, 18 Jun 2021 11:19:13 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AF4DF13A1;
 Fri, 18 Jun 2021 04:19:12 -0700 (PDT)
Received: from [10.57.9.136] (unknown [10.57.9.136])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 05C003F719;
 Fri, 18 Jun 2021 04:19:09 -0700 (PDT)
Subject: Re: [PATCH v4 5/6] iommu/dma: Simplify calls to iommu_setup_dma_ops()
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20210610075130.67517-1-jean-philippe@linaro.org>
 <20210610075130.67517-6-jean-philippe@linaro.org>
 <6ce5fecb-fc81-5bf1-3577-6a09437b243e@arm.com> <YMx6Z8aWBOrFiEcV@myrica>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <f72b9fcd-b839-fac1-f35a-6907a9c66aed@arm.com>
Date: Fri, 18 Jun 2021 12:19:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YMx6Z8aWBOrFiEcV@myrica>
Content-Language: en-GB
Cc: kevin.tian@intel.com, mst@redhat.com, catalin.marinas@arm.com,
 sudeep.holla@arm.com, rjw@rjwysocki.net,
 virtualization@lists.linux-foundation.org, linux-acpi@vger.kernel.org,
 iommu@lists.linux-foundation.org, sebastien.boeuf@intel.com,
 guohanjun@huawei.com, will@kernel.org, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org, lenb@kernel.org
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

On 2021-06-18 11:50, Jean-Philippe Brucker wrote:
> On Wed, Jun 16, 2021 at 06:02:39PM +0100, Robin Murphy wrote:
>>> diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
>>> index c62e19bed302..175f8eaeb5b3 100644
>>> --- a/drivers/iommu/dma-iommu.c
>>> +++ b/drivers/iommu/dma-iommu.c
>>> @@ -1322,7 +1322,9 @@ void iommu_setup_dma_ops(struct device *dev, u64 dma_base, u64 dma_limit)
>>>    	if (domain->type == IOMMU_DOMAIN_DMA) {
>>>    		if (iommu_dma_init_domain(domain, dma_base, dma_limit, dev))
>>>    			goto out_err;
>>> -		dev->dma_ops = &iommu_dma_ops;
>>> +		set_dma_ops(dev, &iommu_dma_ops);
>>> +	} else {
>>> +		set_dma_ops(dev, NULL);
>>
>> I'm not keen on moving this here, since iommu-dma only knows that its own
>> ops are right for devices it *is* managing; it can't assume any particular
>> ops are appropriate for devices it isn't. The idea here is that
>> arch_setup_dma_ops() may have already set the appropriate ops for the
>> non-IOMMU case, so if the default domain type is passthrough then we leave
>> those in place.
>>
>> For example, I do still plan to revisit my conversion of arch/arm someday,
>> at which point I'd have to undo this for that reason.
> 
> Makes sense, I'll remove this bit.
> 
>> Simplifying the base and size arguments is of course fine, but TBH I'd say
>> rip the whole bloody lot out of the arch_setup_dma_ops() flow now. It's a
>> considerable faff passing them around for nothing but a tenuous sanity check
>> in iommu_dma_init_domain(), and now that dev->dma_range_map is a common
>> thing we should expect that to give us any relevant limitations if we even
>> still care.
> 
> So I started working on this but it gets too bulky for a preparatory
> patch. Dropping the parameters from arch_setup_dma_ops() seems especially
> complicated because arm32 does need the size parameter for IOMMU mappings
> and that value falls back to the bus DMA mask or U32_MAX in the absence of
> dma-ranges. I could try to dig into this for a separate series.
> 
> Even only dropping the parameters from iommu_setup_dma_ops() isn't
> completely trivial (8 files changed, 55 insertions(+), 36 deletions(-)
> because we still need the lower IOVA limit from dma_range_map), so I'd
> rather send it separately and have it sit in -next for a while.

Oh, sure, I didn't mean to imply that the whole cleanup should be within 
the scope of this series, just that we can shave off as much as we *do* 
need to touch here (which TBH is pretty much what you're doing already), 
and mainly to start taking the attitude that these arguments are now 
superseded and increasingly vestigial.

I expected the cross-arch cleanup to be a bit fiddly, but I'd forgotten 
that arch/arm was still actively using these values, so maybe I can 
revisit this when I pick up my iommu-dma conversion again (I swear it's 
not dead, just resting!)

Cheers,
Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
