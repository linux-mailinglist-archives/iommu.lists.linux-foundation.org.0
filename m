Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B4A276EE7
	for <lists.iommu@lfdr.de>; Thu, 24 Sep 2020 12:40:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CDAF486A75;
	Thu, 24 Sep 2020 10:40:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QEJ8GJ4Jd7aC; Thu, 24 Sep 2020 10:40:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 237DE86A79;
	Thu, 24 Sep 2020 10:40:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 06A88C0051;
	Thu, 24 Sep 2020 10:40:31 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 77099C0051
 for <iommu@lists.linux-foundation.org>; Thu, 24 Sep 2020 10:40:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 645D686BA6
 for <iommu@lists.linux-foundation.org>; Thu, 24 Sep 2020 10:40:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rXtKDHG7y5Gx for <iommu@lists.linux-foundation.org>;
 Thu, 24 Sep 2020 10:40:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by whitealder.osuosl.org (Postfix) with ESMTP id 3DB9086B9E
 for <iommu@lists.linux-foundation.org>; Thu, 24 Sep 2020 10:40:28 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 85F17113E;
 Thu, 24 Sep 2020 03:40:27 -0700 (PDT)
Received: from [10.57.48.76] (unknown [10.57.48.76])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5927D3F73B;
 Thu, 24 Sep 2020 03:40:25 -0700 (PDT)
Subject: Re: IOVA allocation dependency between firmware buffer and remaining
 buffers
To: Thierry Reding <thierry.reding@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
References: <CAEC9eQOX9BHX4v5aY2cfCT=T-ZHA7y0xF7aiZhW9xzG4fme36Q@mail.gmail.com>
 <CAEC9eQPaeF9=Li74x9RrSHyDgRZ6b653yBRu6EYsaU+eSj2wsQ@mail.gmail.com>
 <59cda41f-170c-a1ad-a345-bc38b9ed4d73@arm.com>
 <CGME20200424161534eucas1p29177cad5b4790d392acb69a335a3992e@eucas1p2.samsung.com>
 <CAOD6ATrWYLPT0ydz2vFhNwWhqHum_q_pyCe=oGJWOcEqjmNOqQ@mail.gmail.com>
 <11584d09-5995-6133-3bd3-8f7a0afd0e01@samsung.com>
 <20200924082830.GB27174@8bytes.org>
 <37e767b8-8ec4-ae80-ea0d-1caf3cdab8fa@samsung.com>
 <20200924101640.GE2483160@ulmo>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <bff57cbe-2247-05e1-9059-d9c66d64c407@arm.com>
Date: Thu, 24 Sep 2020 11:40:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <20200924101640.GE2483160@ulmo>
Content-Language: en-GB
Cc: jean-philippe@linaro.org, linux-mm@kvack.org,
 Linux IOMMU <iommu@lists.linux-foundation.org>,
 Ajay kumar <ajaynumb@gmail.com>, Shaik Ameer Basha <shaik.ameer@samsung.com>,
 will@kernel.org, hch@lst.de
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

On 2020-09-24 11:16, Thierry Reding wrote:
> On Thu, Sep 24, 2020 at 10:46:46AM +0200, Marek Szyprowski wrote:
>> Hi Joerg,
>>
>> On 24.09.2020 10:28, Joerg Roedel wrote:
>>> On Wed, Sep 23, 2020 at 08:48:26AM +0200, Marek Szyprowski wrote:
>>>> It allows to remap given buffer at the specific IOVA address, although
>>>> it doesn't guarantee that those specific addresses won't be later used
>>>> by the IOVA allocator. Probably it would make sense to add an API for
>>>> generic IOMMU-DMA framework to mark the given IOVA range as
>>>> reserved/unused to protect them.
>>> There is an API for that, the IOMMU driver can return IOVA reserved
>>> regions per device and the IOMMU core code will take care of mapping
>>> these regions and reserving them in the IOVA allocator, so that
>>> DMA-IOMMU code will not use it for allocations.
>>>
>>> Have a look at the iommu_ops->get_resv_regions() and
>>> iommu_ops->put_resv_regions().
>>
>> I know about the reserved regions IOMMU API, but the main problem here,
>> in case of Exynos, is that those reserved regions won't be created by
>> the IOMMU driver but by the IOMMU client device. It is just a result how
>> the media drivers manages their IOVA space. They simply have to load
>> firmware at the IOVA address lower than the any address of the used
>> buffers.
> 
> I've been working on adding a way to automatically add direct mappings
> using reserved-memory regions parsed from device tree, see:
> 
>      https://lore.kernel.org/lkml/20200904130000.691933-1-thierry.reding@gmail.com/
> 
> Perhaps this can be of use? With that you should be able to add a
> reserved-memory region somewhere in the lower range that you need for
> firmware images and have that automatically added as a direct mapping
> so that it won't be reused later on for dynamic allocations.

It can't easily be a *direct* mapping though - if the driver has to use 
the DMA masks to ensure that everything stays within the addressable 
range, then (as far as I'm aware) there's no physical memory that low 
down to equal the DMA addresses.

TBH I'm not convinced that this is a sufficiently common concern to 
justify new APIs, or even to try to make overly generic. I think just 
implementing a new DMA attribute to say "please allocate/map this 
particular request at the lowest DMA address possible" would be good 
enough. Such a thing could also serve PCI drivers that actually care 
about SAC/DAC to give us more of a chance of removing the "try a 32-bit 
mask first" trick from everyone's hotpath...

Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
