Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7BB161434
	for <lists.iommu@lfdr.de>; Mon, 17 Feb 2020 15:10:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 432AA857B0;
	Mon, 17 Feb 2020 14:10:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cUHiiFjXfmvr; Mon, 17 Feb 2020 14:10:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B807F85660;
	Mon, 17 Feb 2020 14:10:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A17A8C08A0;
	Mon, 17 Feb 2020 14:10:32 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7E0B4C013E;
 Mon, 17 Feb 2020 14:10:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 6BC5C86D73;
 Mon, 17 Feb 2020 14:10:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ngc5RcpYYCjy; Mon, 17 Feb 2020 14:10:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7AE7186D11;
 Mon, 17 Feb 2020 14:10:30 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C2C7D30E;
 Mon, 17 Feb 2020 06:10:29 -0800 (PST)
Received: from [10.1.196.37] (e121345-lin.cambridge.arm.com [10.1.196.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4A66A3F703;
 Mon, 17 Feb 2020 06:10:28 -0800 (PST)
Subject: Re: [PATCH 3/3] iommu/virtio: Enable x86 support
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20200214160413.1475396-1-jean-philippe@linaro.org>
 <20200214160413.1475396-4-jean-philippe@linaro.org>
 <311a1885-c619-3c8d-29dd-14fbfbf74898@arm.com>
 <20200216045006-mutt-send-email-mst@kernel.org>
 <20200217090107.GA1650092@myrica>
 <20200217080129-mutt-send-email-mst@kernel.org>
 <915044ae-6972-e0eb-43e8-d071af848fe3@arm.com>
 <20200217083112-mutt-send-email-mst@kernel.org>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <057a460a-4b8e-54ca-0181-a5e5c16d7206@arm.com>
Date: Mon, 17 Feb 2020 14:10:27 +0000
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200217083112-mutt-send-email-mst@kernel.org>
Content-Language: en-GB
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, kevin.tian@intel.com,
 linux-pci@vger.kernel.org, jasowang@redhat.com,
 virtualization@lists.linux-foundation.org, iommu@lists.linux-foundation.org,
 sebastien.boeuf@intel.com, jacob.jun.pan@intel.com, bhelgaas@google.com
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

On 17/02/2020 1:31 pm, Michael S. Tsirkin wrote:
> On Mon, Feb 17, 2020 at 01:22:44PM +0000, Robin Murphy wrote:
>> On 17/02/2020 1:01 pm, Michael S. Tsirkin wrote:
>>> On Mon, Feb 17, 2020 at 10:01:07AM +0100, Jean-Philippe Brucker wrote:
>>>> On Sun, Feb 16, 2020 at 04:50:33AM -0500, Michael S. Tsirkin wrote:
>>>>> On Fri, Feb 14, 2020 at 04:57:11PM +0000, Robin Murphy wrote:
>>>>>> On 14/02/2020 4:04 pm, Jean-Philippe Brucker wrote:
>>>>>>> With the built-in topology description in place, x86 platforms can now
>>>>>>> use the virtio-iommu.
>>>>>>>
>>>>>>> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
>>>>>>> ---
>>>>>>>     drivers/iommu/Kconfig | 3 ++-
>>>>>>>     1 file changed, 2 insertions(+), 1 deletion(-)
>>>>>>>
>>>>>>> diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
>>>>>>> index 068d4e0e3541..adcbda44d473 100644
>>>>>>> --- a/drivers/iommu/Kconfig
>>>>>>> +++ b/drivers/iommu/Kconfig
>>>>>>> @@ -508,8 +508,9 @@ config HYPERV_IOMMU
>>>>>>>     config VIRTIO_IOMMU
>>>>>>>     	bool "Virtio IOMMU driver"
>>>>>>>     	depends on VIRTIO=y
>>>>>>> -	depends on ARM64
>>>>>>> +	depends on (ARM64 || X86)
>>>>>>>     	select IOMMU_API
>>>>>>> +	select IOMMU_DMA
>>>>>>
>>>>>> Can that have an "if X86" for clarity? AIUI it's not necessary for
>>>>>> virtio-iommu itself (and really shouldn't be), but is merely to satisfy the
>>>>>> x86 arch code's expectation that IOMMU drivers bring their own DMA ops,
>>>>>> right?
>>>>>>
>>>>>> Robin.
>>>>>
>>>>> In fact does not this work on any platform now?
>>>>
>>>> There is ongoing work to use the generic IOMMU_DMA ops on X86. AMD IOMMU
>>>> has been converted recently [1] but VT-d still implements its own DMA ops
>>>> (conversion patches are on the list [2]). On Arm the arch Kconfig selects
>>>> IOMMU_DMA, and I assume we'll have the same on X86 once Tom's work is
>>>> complete. Until then I can add a "if X86" here for clarity.
>>>>
>>>> Thanks,
>>>> Jean
>>>>
>>>> [1] https://lore.kernel.org/linux-iommu/20190613223901.9523-1-murphyt7@tcd.ie/
>>>> [2] https://lore.kernel.org/linux-iommu/20191221150402.13868-1-murphyt7@tcd.ie/
>>>
>>> What about others? E.g. PPC?
>>
>> That was the point I was getting at - while iommu-dma should build just fine
>> for the likes of PPC, s390, 32-bit Arm, etc., they have no architecture code
>> to correctly wire up iommu_dma_ops to devices. Thus there's currently no
>> point pulling it in and pretending it's anything more than a waste of space
>> for architectures other than arm64 and x86. It's merely a historical
>> artefact of the x86 DMA API implementation that when the IOMMU drivers were
>> split out to form drivers/iommu they took some of their relevant arch code
>> with them.
>>
>> Robin.
> 
> 
> Rather than white-listing architectures, how about making the
> architectures in question set some kind of symbol, and depend on it?

Umm, that's basically what we have already? Architectures that use 
iommu_dma_ops select IOMMU_DMA.

The only issue is the oddity of x86 treating IOMMU drivers as part of 
its arch code, which has never come up against a cross-architecture 
driver until now. Hence the options of either maintaining that paradigm 
and having the 'x86 arch code' aspect of this driver "select IOMMU_DMA 
if x86" such that it works out equivalent to AMD_IOMMU, or a more 
involved cleanup to move that responsibility out of 
drivers/iommu/Kconfig entirely and have arch/x86/Kconfig do something 
like "select IOMMU_DMA if IOMMU_API", as Jean suggested up-thread.

In the specific context of IOMMU_DMA we're not talking about any kind of 
white-list, merely a one-off special case for one particular architecture.

Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
