Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DAC349134
	for <lists.iommu@lfdr.de>; Thu, 25 Mar 2021 12:51:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D202360B22;
	Thu, 25 Mar 2021 11:51:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iqeimDi4_y-o; Thu, 25 Mar 2021 11:51:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1B2260B1C;
	Thu, 25 Mar 2021 11:51:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8ECB3C0012;
	Thu, 25 Mar 2021 11:51:00 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AAE26C000A
 for <iommu@lists.linux-foundation.org>; Thu, 25 Mar 2021 11:50:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 97C5240183
 for <iommu@lists.linux-foundation.org>; Thu, 25 Mar 2021 11:50:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MAM-RVFjGHwB for <iommu@lists.linux-foundation.org>;
 Thu, 25 Mar 2021 11:50:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp2.osuosl.org (Postfix) with ESMTP id F21D84016B
 for <iommu@lists.linux-foundation.org>; Thu, 25 Mar 2021 11:50:54 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 79DDE1474;
 Thu, 25 Mar 2021 04:50:53 -0700 (PDT)
Received: from [10.57.50.37] (unknown [10.57.50.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EC35C3F792;
 Thu, 25 Mar 2021 04:50:50 -0700 (PDT)
Subject: Re: [PATCH 0/3] Apple M1 DART IOMMU driver
To: Sven Peter <sven@svenpeter.dev>, Rob Herring <robh@kernel.org>,
 Mark Kettenis <mark.kettenis@xs4all.nl>
References: <20210320151903.60759-1-sven@svenpeter.dev>
 <c1bcc0609e920bc6@bloch.sibelius.xs4all.nl>
 <20210323205346.GA1283560@robh.at.kernel.org>
 <43685c67-6d9c-4e72-b320-0462c2273bf0@www.fastmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <33b3ce35-c42f-331a-79a2-e38917d588ef@arm.com>
Date: Thu, 25 Mar 2021 11:50:45 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <43685c67-6d9c-4e72-b320-0462c2273bf0@www.fastmail.com>
Content-Language: en-GB
Cc: Arnd Bergmann <arnd@kernel.org>, devicetree@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, marcan@marcan.st, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, mohamed.mediouni@caramail.com,
 will@kernel.org, linux-arm-kernel@lists.infradead.org, stan@corellium.com
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

On 2021-03-25 07:53, Sven Peter wrote:
> 
> 
> On Tue, Mar 23, 2021, at 21:53, Rob Herring wrote:
>> On Sun, Mar 21, 2021 at 05:00:50PM +0100, Mark Kettenis wrote:
>>>> Date: Sat, 20 Mar 2021 15:19:33 +0000
>>>> From: Sven Peter <sven@svenpeter.dev>
>>>> I have just noticed today though that at least the USB DWC3 controller in host
>>>> mode uses *two* darts at the same time. I'm not sure yet which parts seem to
>>>> require which DART instance.
>>>>
>>>> This means that we might need to support devices attached to two iommus
>>>> simultaneously and just create the same iova mappings. Currently this only
>>>> seems to be required for USB according to Apple's Device Tree.
>>>>
>>>> I see two options for this and would like to get feedback before
>>>> I implement either one:
>>>>
>>>>      1) Change #iommu-cells = <1>; to #iommu-cells = <2>; and use the first cell
>>>>         to identify the DART and the second one to identify the master.
>>>>         The DART DT node would then also take two register ranges that would
>>>>         correspond to the two DARTs. Both instances use the same IRQ and the
>>>>         same clocks according to Apple's device tree and my experiments.
>>>>         This would keep a single device node and the DART driver would then
>>>>         simply map iovas in both DARTs if required.
>>>>
>>>>      2) Keep #iommu-cells as-is but support
>>>>              iommus = <&usb_dart1a 1>, <&usb_dart1b 0>;
>>>>         instead.
>>>>         This would then require two devices nodes for the two DART instances and
>>>>         some housekeeping in the DART driver to support mapping iovas in both
>>>>         DARTs.
>>>>         I believe omap-iommu.c supports this setup but I will have to read
>>>>         more code to understand the details there and figure out how to implement
>>>>         this in a sane way.
>>>>
>>>> I currently prefer the first option but I don't understand enough details of
>>>> the iommu system to actually make an informed decision.
>>
>> Please don't mix what does the h/w look like and what's easy to
>> implement in Linux's IOMMU subsytem. It's pretty clear (at least
>> from the description here) that option 2 reflects the h/w.
>>
> 
> Good point, I'll keep that in mind and give option 2 a try.
> 
>>>
>>> As I mentioned before, not all DARTs support the full 32-bit aperture.
>>> In particular the PCIe DARTs support a smaller address-space.  It is
>>> not clear whether this is a restriction of the PCIe host controller or
>>> the DART, but the Apple Device Tree has "vm-base" and "vm-size"
>>> properties that encode the base address and size of the aperture.
>>> These single-cell properties which is probably why for the USB DARTs
>>> only "vm-base" is given; since "vm-base" is 0, a 32-bit number
>>> wouldn't be able to encode the full aperture size.  We could make them
>>> 64-bit numbers in the Linux device tree though and always be explicit
>>> about the size.  Older Sun SPARC machines used a single "virtual-dma"
>>> property to encode the aperture.  We could do someting similar.  You
>>> would use this property to initialize domain->geometry.aperture_start
>>> and domain->geometry.aperture_end in diff 3/3 of this series.
>>
>> 'dma-ranges' is what should be used here.
>>
> 
> The iommu binding documentation [1] mentions that
> 
>      The device tree node of the IOMMU device's parent bus must contain a valid
>      "dma-ranges" property that describes how the physical address space of the
>      IOMMU maps to memory. An empty "dma-ranges" property means that there is a
>      1:1 mapping from IOMMU to memory.
> 
> which, if I understand this correctly, means that the 'dma-ranges' for the
> parent bus of the iommu should be empty since the DART hardware can see the
> full physical address space with a 1:1 mapping.
> 
> 
> The documentation also mentions that
> 
>       When an "iommus" property is specified in a device tree node, the IOMMU
>       will be used for address translation. If a "dma-ranges" property exists
>       in the device's parent node it will be ignored.
> 
> which means that specifying a 'dma-ranges' in the parent bus of any devices
> that use the iommu will just be ignored.

I think that's just wrong and wants updating (or at least clarifying). 
The high-level view now is that we use "dma-ranges" to describe 
limitations imposed by a bridge or interconnect segment, and that can 
certainly happen upstream of an IOMMU. As it happens, I've just recently 
sent a patch for precisely that case[1].

I guess what it might have been trying to say is that "dma-ranges" 
*does* become irrelevant in terms of constraining what physical memory 
is usable for DMA, but that shouldn't imply that its meaning doesn't 
just shift to a different purpose.

> As a concrete example, the PCIe DART IOMMU only allows translations from iovas
> within 0x00100000...0x3ff00000 to the entire physical address space (though
> realistically it will only map to 16GB RAM starting at 0x800000000 on the M1).
> 
> I'm probably just confused or maybe the documentation is outdated but I don't
> see how I could specify "this device can only use DMA addresses from
> 0x00100000...0x3ff00000 but can map these via the iommu to any physical
> address" using 'dma-ranges'.
> 
> Could you maybe point me to the right direction or give me a small example?
> That would help a lot!

PCI is easy, since it's already standard practice to use "dma-ranges" to 
describe host bridge inbound windows. Even if the restriction is really 
out in the host-side interconnect rather than in the bridge itself, to 
all intents and purposes it's indistinguishable so can still be 
described the same way.

The case of a standalone device having fewer address bits wired up than 
both its output and the corresponding IOMMU input might expect is a 
little more awkward, since that often *does* require adding an extra 
level of "bus" to explicitly represent that interconnect link in the DT 
model, e.g. [2].

Robin.

[1] 
https://lore.kernel.org/linux-arm-kernel/720d0a9a42e33148fcac45cd39a727093a32bf32.1614965598.git.robin.murphy@arm.com/
[2] 
https://lore.kernel.org/linux-arm-kernel/20180926132247.10971-23-laurentiu.tudor@nxp.com/
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
