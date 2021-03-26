Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id D00AB34ADA8
	for <lists.iommu@lfdr.de>; Fri, 26 Mar 2021 18:34:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 218C6405E4;
	Fri, 26 Mar 2021 17:34:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OsmWZpCCSWEK; Fri, 26 Mar 2021 17:34:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 309E0405FF;
	Fri, 26 Mar 2021 17:34:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EFECFC000A;
	Fri, 26 Mar 2021 17:34:17 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9A109C000A
 for <iommu@lists.linux-foundation.org>; Fri, 26 Mar 2021 17:34:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8082C60D77
 for <iommu@lists.linux-foundation.org>; Fri, 26 Mar 2021 17:34:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 51kWGbLhkSfj for <iommu@lists.linux-foundation.org>;
 Fri, 26 Mar 2021 17:34:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp3.osuosl.org (Postfix) with ESMTP id 510BA60D72
 for <iommu@lists.linux-foundation.org>; Fri, 26 Mar 2021 17:34:15 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7A2FB1476;
 Fri, 26 Mar 2021 10:34:14 -0700 (PDT)
Received: from [10.57.27.121] (unknown [10.57.27.121])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 130703F7D7;
 Fri, 26 Mar 2021 10:34:11 -0700 (PDT)
Subject: Re: [PATCH 0/3] Apple M1 DART IOMMU driver
To: Mark Kettenis <mark.kettenis@xs4all.nl>, Arnd Bergmann <arnd@kernel.org>
References: <20210320151903.60759-1-sven@svenpeter.dev>
 <c1bcc0609e920bc6@bloch.sibelius.xs4all.nl>
 <20210323205346.GA1283560@robh.at.kernel.org>
 <43685c67-6d9c-4e72-b320-0462c2273bf0@www.fastmail.com>
 <CAK8P3a0fvnYLrG=cGiOQ6u8aZnriTeM0R=MW7FX=94mO13Rq0w@mail.gmail.com>
 <c1bcd90d344c2b68@bloch.sibelius.xs4all.nl>
 <9f06872d-f0ec-43c3-9b53-d144337100b3@www.fastmail.com>
 <CAK8P3a2b7k6JkxecW=yu-NF+fkNCxJ3Ja36nQ7LK8hsuO=4=sw@mail.gmail.com>
 <c1bcd9821a8f8c05@bloch.sibelius.xs4all.nl>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <e03833b1-1368-c5c3-424b-59e34bef19f3@arm.com>
Date: Fri, 26 Mar 2021 17:34:05 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <c1bcd9821a8f8c05@bloch.sibelius.xs4all.nl>
Content-Language: en-GB
Cc: robh@kernel.org, sven@svenpeter.dev, devicetree@vger.kernel.org,
 maz@kernel.org, marcan@marcan.st, linux-kernel@vger.kernel.org,
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

On 2021-03-26 17:26, Mark Kettenis wrote:
>> From: Arnd Bergmann <arnd@kernel.org>
>> Date: Fri, 26 Mar 2021 17:38:24 +0100
>>
>> On Fri, Mar 26, 2021 at 5:10 PM Sven Peter <sven@svenpeter.dev> wrote:
>>> On Fri, Mar 26, 2021, at 16:59, Mark Kettenis wrote:
>>>> Some of the DARTs provide a bypass facility.  That code make using the
>>>> standard "dma-ranges" property tricky.  That property would need to
>>>> contain the bypass address range.  But that would mean that if the
>>>> DART driver needs to look at that property to figure out the address
>>>> range that supports translation it will need to be able to distinguish
>>>> between the translatable address range and the bypass address range.
>>>
>>> Do we understand if and why we even need to bypass certain streams?
>>
>> My guess is that this is a performance optimization.
>>
>> There are generally three reasons to want an iommu in the first place:
>>   - Pass a device down to a guest or user process without giving
>>     access to all of memory
>>   - Avoid problems with limitations in the device, typically when it
>> only supports
>>     32-bit bus addressing, but the installed memory is larger than 4GB
>>   - Protect kernel memory from broken drivers
>>
>> If you care about none of the above, but you do care about data transfer
>> speed, you are better off just leaving the IOMMU in bypass mode.
>> I don't think we have to support it if the IOMMU works reliably, but it's
>> something that users might want.
> 
> Another reason might be that a device needs access to large amounts of
> physical memory at the same time and the 32-bit address space that the
> DART provides is too tight.
> 
> In U-Boot I might want to use bypass where it works since there is no
> proper IOMMU support in U-Boot.  Generally speaking, the goal is to
> keep the code size down in U-Boot.  In OpenBSD I'll probably avoid
> bypass mode if I can.
> 
> I haven't figured out how the bypass stuff really works.  Corellium
> added support for it in their codebase when they added support for
> Thunderbolt, and some of the DARTs that seem to be related to
> Thunderbolt do indeed have a "bypass" property.  But it is unclear to
> me how the different puzzle pieces fit together for Thunderbolt.
> 
> Anyway, from my viewpoint having the information about the IOVA
> address space sit on the devices makes little sense.  This information
> is needed by the DART driver, and there is no direct cnnection from
> the DART to the individual devices in the devicetree.  The "iommus"
> property makes a connection in the opposite direction.

What still seems unclear is whether these addressing limitations are a 
property of the DART input interface, the device output interface, or 
the interconnect between them. Although the observable end result 
appears more or less the same either way, they are conceptually 
different things which we have different abstractions to deal with.

Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
