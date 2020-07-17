Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE8F223E26
	for <lists.iommu@lfdr.de>; Fri, 17 Jul 2020 16:37:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 17ABA87C8B;
	Fri, 17 Jul 2020 14:37:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rgaX5SJEImVg; Fri, 17 Jul 2020 14:37:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id CC61C87C5A;
	Fri, 17 Jul 2020 14:37:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B528BC0733;
	Fri, 17 Jul 2020 14:37:04 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E01D3C0733
 for <iommu@lists.linux-foundation.org>; Fri, 17 Jul 2020 14:37:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D6C0A86265
 for <iommu@lists.linux-foundation.org>; Fri, 17 Jul 2020 14:37:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qoi4eYFp67rF for <iommu@lists.linux-foundation.org>;
 Fri, 17 Jul 2020 14:37:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 37BBC86250
 for <iommu@lists.linux-foundation.org>; Fri, 17 Jul 2020 14:37:02 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 65B4030E;
 Fri, 17 Jul 2020 07:37:00 -0700 (PDT)
Received: from [10.57.35.46] (unknown [10.57.35.46])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7BF303F66E;
 Fri, 17 Jul 2020 07:36:59 -0700 (PDT)
Subject: Re: [PATCH v2 0/3] iommu/amd: I/O VA address limits
To: "Sironi, Filippo" <sironi@amazon.de>, "sebott@amazon.de"
 <sebott@amazon.de>, "joro@8bytes.org" <joro@8bytes.org>
References: <20200630093039.GC28824@8bytes.org>
 <20200630224634.319-1-sebott@amazon.de> <20200710123059.GF27672@8bytes.org>
 <751e403f-7095-f761-465b-9e187b423b0b@amazon.de>
 <271d67b2-482e-7a16-8fd7-1f1a6a4bdff2@arm.com>
 <2a04dcca86bdccece6e0109c30fc0262e1bf8829.camel@amazon.de>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <004a060f-823d-af4e-a34d-1ff029faa40f@arm.com>
Date: Fri, 17 Jul 2020 15:36:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <2a04dcca86bdccece6e0109c30fc0262e1bf8829.camel@amazon.de>
Content-Language: en-GB
Cc: "Serebrin, Benjamin" <serebrin@amazon.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>
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

On 2020-07-17 14:22, Sironi, Filippo wrote:
> On Fri, 2020-07-17 at 10:47 +0100, Robin Murphy wrote:
>>
>> On 2020-07-17 10:20, Sebastian Ott via iommu wrote:
>>> Hello Joerg,
>>>
>>> On 2020-07-10 14:31, Joerg Roedel wrote:
>>>> On Wed, Jul 01, 2020 at 12:46:31AM +0200, Sebastian Ott wrote:
>>>>> The IVRS ACPI table specifies maximum address sizes for I/O
>>>>> virtual
>>>>> addresses that can be handled by the IOMMUs in the system. Parse
>>>>> that
>>>>> data from the IVRS header to provide aperture information for
>>>>> DMA
>>>>> mappings and users of the iommu API.
>>>>>
>>>>> Changes for V2:
>>>>>    - use limits in iommu_setup_dma_ops()
>>>>>    - rebased to current upstream
>>>>>
>>>>> Sebastian Ott (3):
>>>>>     iommu/amd: Parse supported address sizes from IVRS
>>>>>     iommu/amd: Restrict aperture for domains to conform with IVRS
>>>>>     iommu/amd: Actually enforce geometry aperture
>>>>
>>>> Thanks for the changes. May I ask what the reason for those
>>>> changes are?
>>>> AFAIK all AMD IOMMU implementations (in hardware) support full
>>>> 64bit
>>>> address spaces, and the IVRS table might actually be wrong,
>>>> limiting the
>>>> address space in the worst case to only 32 bit.
>>>
>>> It's not the IOMMU, but we've encountered devices that are capable
>>> of
>>> more than
>>> 32- but less than 64- bit IOVA, and there's no way to express that
>>> to
>>> the IOVA
>>> allocator in the PCIe spec. Our solution was to have our platforms
>>> express an
>>> IVRS entry that says the IOMMU is capable of 48-bit, which these
>>> devices
>>> can generate.
>>> 48 bits is plenty of address space in this generation for the
>>> application we have.
>>
>> Hmm, for constraints of individual devices, it should really be their
>> drivers' job to call dma_set_mask*() with the appropriate value in the
>> first place rather than just assuming that 64 means anything >32. If
>> it's a case where the device itself technically is 64-bit capable, but
>> an upstream bridge is constraining it, then that limit can also be
>> described either by dedicated firmware properties (e.g. ACPI _DMA) or
>> with a quirk like via_no_dac().
>>
>> Robin.
> 
> You cannot rely on the device driver only because the device driver
> attach might be a generic one like vfio-pci, for instance, that doesn't
> have any device specific knowledge.

Indeed, but on the other hand a generic driver that doesn't know the 
device is highly unlikely to set up any DMA transactions by itself 
either. In the case of VFIO, it would then be the guest/userspace 
driver's responsibility to take the equivalent action to avoid 
allocating addresses the hardware can't actually use.

I'm mostly just wary that trying to fake up a per-device restriction as 
a global one is a bit crude, and has the inherent problem that whatever 
you think the lowest common denominator is, there's the potential for 
some device to be hotplugged in later and break the assumption you've 
already had to commit to.

And of course I am taking a bit of a DMA-API-centric viewpoint here - I 
think exposing per-device properties like bus_dma_limit that aren't 
easily identifiable for VFIO users to take into account is still rather 
an open problem.

Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
