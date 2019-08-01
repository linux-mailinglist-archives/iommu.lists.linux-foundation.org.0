Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id CC89D7DFC1
	for <lists.iommu@lfdr.de>; Thu,  1 Aug 2019 18:08:35 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 16A256ACC;
	Thu,  1 Aug 2019 16:08:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 94A23431D
	for <iommu@lists.linux-foundation.org>;
	Thu,  1 Aug 2019 16:07:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 35FC08B0
	for <iommu@lists.linux-foundation.org>;
	Thu,  1 Aug 2019 16:07:59 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BEF84337;
	Thu,  1 Aug 2019 09:07:58 -0700 (PDT)
Received: from [10.32.8.205] (unknown [10.32.8.205])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0B6A23F694;
	Thu,  1 Aug 2019 09:07:55 -0700 (PDT)
Subject: Re: [PATCH 5/8] arm64: use ZONE_DMA on DMA addressing limited devices
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
	Catalin Marinas <catalin.marinas@arm.com>
References: <20190731154752.16557-1-nsaenzjulienne@suse.de>
	<20190731154752.16557-6-nsaenzjulienne@suse.de>
	<20190731170742.GC17773@arrakis.emea.arm.com>
	<d8b4a7cb9c06824ca88a0602a5bf38b6324b43c0.camel@suse.de>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <e35dd4a5-281b-d281-59c9-3fc7108eb8be@arm.com>
Date: Thu, 1 Aug 2019 17:07:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <d8b4a7cb9c06824ca88a0602a5bf38b6324b43c0.camel@suse.de>
Content-Language: en-GB
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: phill@raspberryi.org, devicetree@vger.kernel.org, f.fainelli@gmail.com,
	linux-mm@kvack.org, marc.zyngier@arm.com,
	Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
	eric@anholt.net, iommu@lists.linux-foundation.org,
	robh+dt@kernel.org, linux-rpi-kernel@lists.infradead.org,
	mbrugger@suse.com, akpm@linux-foundation.org,
	frowand.list@gmail.com, hch@lst.de,
	linux-arm-kernel@lists.infradead.org, wahrenst@gmx.net
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

On 2019-08-01 4:44 pm, Nicolas Saenz Julienne wrote:
> On Wed, 2019-07-31 at 18:07 +0100, Catalin Marinas wrote:
>> On Wed, Jul 31, 2019 at 05:47:48PM +0200, Nicolas Saenz Julienne wrote:
>>> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
>>> index 1c4ffabbe1cb..f5279ef85756 100644
>>> --- a/arch/arm64/mm/init.c
>>> +++ b/arch/arm64/mm/init.c
>>> @@ -50,6 +50,13 @@
>>>   s64 memstart_addr __ro_after_init = -1;
>>>   EXPORT_SYMBOL(memstart_addr);
>>>   
>>> +/*
>>> + * We might create both a ZONE_DMA and ZONE_DMA32. ZONE_DMA is needed if
>>> there
>>> + * are periferals unable to address the first naturally aligned 4GB of ram.
>>> + * ZONE_DMA32 will be expanded to cover the rest of that memory. If such
>>> + * limitations doesn't exist only ZONE_DMA32 is created.
>>> + */
>>
>> Shouldn't we instead only create ZONE_DMA to cover the whole 32-bit
>> range and leave ZONE_DMA32 empty? Can__GFP_DMA allocations fall back
>> onto ZONE_DMA32?
> 
> Hi Catalin, thanks for the review.
> 
> You're right, the GFP_DMA page allocation will fail with a nasty dmesg error if
> ZONE_DMA is configured but empty. Unsurprisingly the opposite situation is fine
> (GFP_DMA32 with an empty ZONE_DMA32).

Was that tested on something other than RPi4 with more than 4GB of RAM? 
(i.e. with a non-empty ZONE_NORMAL either way)

Robin.

> I switched to the scheme you're suggesting for the next version of the series.
> The comment will be something the likes of this:
> 
> /*
>   * We create both a ZONE_DMA and ZONE_DMA32. ZONE_DMA's size is decided based
>   * on whether the SoC's peripherals are able to address the first naturally
>   * aligned 4 GB of ram.
>   *
>   * If limited, ZONE_DMA covers that area and ZONE_DMA32 the rest of that 32 bit
>   * addressable memory.
>   *
>   * If not ZONE_DMA is expanded to cover the whole 32 bit addressable memory and
>   * ZONE_DMA32 is left empty.
>   */
> 
>   Regards,
>   Nicolas
> 
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
