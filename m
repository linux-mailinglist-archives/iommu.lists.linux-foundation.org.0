Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8C521A03C
	for <lists.iommu@lfdr.de>; Thu,  9 Jul 2020 14:49:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3CC0C89219;
	Thu,  9 Jul 2020 12:49:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FlYTv94Url+b; Thu,  9 Jul 2020 12:49:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1B63D88C49;
	Thu,  9 Jul 2020 12:49:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 04A30C016F;
	Thu,  9 Jul 2020 12:49:17 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6D63FC016F
 for <iommu@lists.linux-foundation.org>; Thu,  9 Jul 2020 12:49:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 5831920119
 for <iommu@lists.linux-foundation.org>; Thu,  9 Jul 2020 12:49:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A9cvyj3hTz6P for <iommu@lists.linux-foundation.org>;
 Thu,  9 Jul 2020 12:49:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by silver.osuosl.org (Postfix) with ESMTPS id 29C7C2000D
 for <iommu@lists.linux-foundation.org>; Thu,  9 Jul 2020 12:49:10 +0000 (UTC)
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 6541FE4150B6AE26B07F;
 Thu,  9 Jul 2020 20:48:54 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.33) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.487.0; Thu, 9 Jul 2020
 20:48:53 +0800
Subject: Re: [PATCH v2 01/12] ACPI/IORT: Make iort_match_node_callback walk
 the ACPI namespace for NC
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
References: <20200521130008.8266-1-lorenzo.pieralisi@arm.com>
 <20200619082013.13661-1-lorenzo.pieralisi@arm.com>
 <20200619082013.13661-2-lorenzo.pieralisi@arm.com>
 <718cae1f-2f33-f6d9-f278-157300b73116@huawei.com>
 <20200629090551.GA28873@e121166-lin.cambridge.arm.com>
 <765078e7-b3ec-af5d-0405-7834ba0f120a@huawei.com>
 <20200630102454.GA17556@e121166-lin.cambridge.arm.com>
 <4817d766-0437-5356-a0b9-97b111d4cae2@huawei.com>
 <952a6720-f401-1441-5548-5b40cfc76d3a@arm.com>
 <0cbd1da8-e283-7e13-d2b3-4d14775fd870@huawei.com>
 <20200709092156.GB18149@e121166-lin.cambridge.arm.com>
From: Hanjun Guo <guohanjun@huawei.com>
Message-ID: <04f3d761-6ee0-6062-1970-3d5f506d8305@huawei.com>
Date: Thu, 9 Jul 2020 20:48:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200709092156.GB18149@e121166-lin.cambridge.arm.com>
Content-Language: en-GB
X-Originating-IP: [10.174.179.33]
X-CFilter-Loop: Reflected
Cc: devicetree@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>, Marc
 Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
 linux-pci@vger.kernel.org, Diana Craciun <diana.craciun@oss.nxp.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, iommu@lists.linux-foundation.org,
 linux-acpi@vger.kernel.org, Makarand Pawagi <makarand.pawagi@nxp.com>,
 Rob Herring <robh+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Robin Murphy <robin.murphy@arm.com>,
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

On 2020/7/9 17:21, Lorenzo Pieralisi wrote:
> On Thu, Jul 02, 2020 at 04:22:00PM +0800, Hanjun Guo wrote:
>> Hi Robin,
>>
>> On 2020/7/2 0:12, Robin Murphy wrote:
>>> On 2020-06-30 14:04, Hanjun Guo wrote:
>>>> On 2020/6/30 18:24, Lorenzo Pieralisi wrote:
>>>>> On Tue, Jun 30, 2020 at 11:06:41AM +0800, Hanjun Guo wrote:
>>>>>
>>>>> [...]
>>>>>
>>>>>>> For devices that aren't described in the DSDT - IORT translations
>>>>>>> are determined by their ACPI parent device. Do you see/Have you
>>>>>>> found any issue with this approach ?
>>>>>>
>>>>>> The spec says "Describes the IO relationships between devices
>>>>>> represented in the ACPI namespace.", and in section 3.1.1.3 Named
>>>>>> component node, it says:
>>>>>
>>>>> PCI devices aren't necessarily described in the ACPI namespace and we
>>>>> still use IORT to describe them - through the RC node.
>>>>>
>>>>>> "Named component nodes are used to describe devices that are also
>>>>>> included in the Differentiated System Description Table (DSDT). See
>>>>>> [ACPI]."
>>>>>>
>>>>>> So from my understanding, the IORT spec for now, can only do ID
>>>>>> translations for devices in the DSDT.
>>>>>
>>>>> I think you can read this multiple ways but this patch does not
>>>>> change this concept. What changes, is applying parent's node IORT
>>>>> mapping to child nodes with no associated DSDT nodes, it is the
>>>>> same thing we do with PCI and the _DMA method - we could update
>>>>> the wording in the specs if that clarifies but I don't think this
>>>>> deliberately disregards the specifications.
>>>>
>>>> I agree, but it's better to update the wording of the spec.
>>>>
>>>>>
>>>>>>>> For a platform device, if I use its parent's full path name for
>>>>>>>> its named component entry, then it will match, but this will violate
>>>>>>>> the IORT spec.
>>>>>>>
>>>>>>> Can you elaborate on this please I don't get the point you
>>>>>>> are making.
>>>>>>
>>>>>> For example, device A is not described in DSDT so can't represent
>>>>>> as a NC node in IORT. Device B can be described in DSDT and it
>>>>>> is the parent of device A, so device B can be represented in IORT
>>>>>> with memory access properties and node flags with Substream width
>>>>>> and Stall supported info.
>>>>>>
>>>>>> When we trying to translate device A's ID, we reuse all the memory
>>>>>> access properties and node flags from its parent (device B), but
>>>>>> will it the same?
>>>>>
>>>>> I assume so why wouldn't it be ? Why would be describe them in
>>>>> a parent-child relationship if that's not how the system looks like
>>>>> in HW ?
>>>>
>>>> The point I'm making is that I'm not sure all the memory access and
>>>> stall properties are the same for the parent and the device itself.
>>>
>>> Is that even a valid case though? The principal thing we want to
>>> accommodate here is when device B *is* the one accessing memory, either
>>> because it is a bridge with device A sat behind it, or because device A
>>> is actually just some logical function or subset of physical device B.
>>
>> Thanks for the clarify, for CCA attributes, child device should be the
>> same as its parent and that was written in the ACPI spec, so it's better
>> to make it clear for other properties in the spec as well.
>>
>>>
>>> If the topology is such that device A is a completely independent device
>>> with its own path to memory such that it could have different
>>> properties, I would expect that it *should* be described in DSDT, and I
>>> can't easily think of a good reason why it wouldn't be. I'm also
>>> struggling to imagine how it might even have an ID that had to be
>>> interpreted in the context of device B if it wasn't one of the cases
>>> above :/
>>>
>>> I don't doubt that people could - or maybe even have - come up with crap
>>> DSDT bindings that don't represent the hardware sufficiently accurately,
>>> but I'm not sure that should be IORT's problem...
>>
>> As I said in previous email, I'm not against this patch, and seems
>> have no regressions for platforms that using named component node
>> such as D05/D06 (I will test it shortly to make sure), but it's better
>> to update the wording of the spec (even after this patch set is merged).
> 
> Have you managed to test this series ?

Sorry, I forgot to reply the email after the testing, adding this patch
set on top of 5.8-rc3 and test it on D06, it worked well, and I printed
every match device's name to confirm that there are no regressions.

Thanks
Hanjun

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
