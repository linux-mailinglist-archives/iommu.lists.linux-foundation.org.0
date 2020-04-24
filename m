Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D191B7994
	for <lists.iommu@lfdr.de>; Fri, 24 Apr 2020 17:30:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 7C300203B1;
	Fri, 24 Apr 2020 15:30:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rrfVzV4h5j2W; Fri, 24 Apr 2020 15:30:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 0079D2041D;
	Fri, 24 Apr 2020 15:29:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E4EF3C0175;
	Fri, 24 Apr 2020 15:29:59 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 02A6FC0175
 for <iommu@lists.linux-foundation.org>; Fri, 24 Apr 2020 15:29:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id E4C1F86D0F
 for <iommu@lists.linux-foundation.org>; Fri, 24 Apr 2020 15:29:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VqpGueN7O1Nn for <iommu@lists.linux-foundation.org>;
 Fri, 24 Apr 2020 15:29:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by fraxinus.osuosl.org (Postfix) with ESMTP id F115986D03
 for <iommu@lists.linux-foundation.org>; Fri, 24 Apr 2020 15:29:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4A84131B;
 Fri, 24 Apr 2020 08:29:56 -0700 (PDT)
Received: from [10.57.33.170] (unknown [10.57.33.170])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B82223F68F;
 Fri, 24 Apr 2020 08:29:53 -0700 (PDT)
Subject: Re: IOVA allocation dependency between firmware buffer and remaining
 buffers
To: Ajay kumar <ajaynumb@gmail.com>, iommu@lists.linux-foundation.org,
 linux-mm@kvack.org, joro@8bytes.org,
 Marek Szyprowski <m.szyprowski@samsung.com>, Rob Clark
 <robdclark@gmail.com>, Thierry Reding <thierry.reding@gmail.com>,
 jean-philippe@linaro.org, will@kernel.org, hch@lst.de,
 baolu.lu@linux.intel.com
References: <CAEC9eQOX9BHX4v5aY2cfCT=T-ZHA7y0xF7aiZhW9xzG4fme36Q@mail.gmail.com>
 <CAEC9eQPaeF9=Li74x9RrSHyDgRZ6b653yBRu6EYsaU+eSj2wsQ@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <59cda41f-170c-a1ad-a345-bc38b9ed4d73@arm.com>
Date: Fri, 24 Apr 2020 16:29:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAEC9eQPaeF9=Li74x9RrSHyDgRZ6b653yBRu6EYsaU+eSj2wsQ@mail.gmail.com>
Content-Language: en-GB
Cc: shaik.ameer@samsung.com
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

On 2020-04-24 4:04 pm, Ajay kumar wrote:
> Can someone check this?
> 
> On Mon, Apr 20, 2020 at 9:24 PM Ajay kumar <ajaynumb@gmail.com> wrote:
>>
>> Hi All,
>>
>> I have an IOMMU master which has limitations as mentioned below:
>> 1) The IOMMU master internally executes a firmware, and the firmware memory
>> is allocated by the same master driver.
>> The firmware buffer address should be of the lowest range than other address
>> allocated by the device, or in other words, all the remaining buffer addresses
>> should always be in a higher range than the firmware address.
>> 2) None of the buffer addresses should go beyond 0xC000_0000

That particular constraint could (and perhaps should) be expressed as a 
DMA mask/limit for the device, but if you have specific requirements to 
place buffers at particular addresses then you might be better off 
managing your own IOMMU domain like some other (mostly DRM) drivers do. 
The DMA APIs don't offer any guarantees about what addresses you'll get 
other than that they won't exceed the appropriate mask.

>> example:
>> If firmware buffer address is buf_fw = 0x8000_5000;
>> All other addresses given to the device should be greater than
>> (0x8000_5000 + firmware size) and less than 0xC000_0000

Out of curiosity, how do you control that in the no-IOMMU or IOMMU 
passthrough cases?

Robin.

>> Currently, this is being handled with one of the below hacks:
>> 1) By keeping dma_mask in lower range while allocating firmware buffer,
>> and then increasing the dma_mask to higher range for other buffers.
>> 2) By reserving IOVA for firmware at the lowest range and creating direct mappings for the same.
>>
>> I want to know if there is a better way this can be handled with current framework,
>> or if anybody is facing similar problems with their devices,
>> please share how it is taken care.
>>
>> I also think there should be some way the masters can specify the IOVA
>> range they want to limit to for current allocation.
>> Something like a new iommu_ops callback like below:
>> limit_iova_alloc_range(dev, iova_start, iova_end)
>>
>> And, in my driver, the sequence will be:
>> limit_iova_alloc_range(dev, 0x0000_0000, 0x1000_0000); /* via helpers */
>> alloc( ) firmware buffer using DMA API
>> limit_iova_alloc_range(dev, 0x1000_0000, 0xC000_0000); /* via helpers */
>> alloc( ) other buffers using DMA API
>>
>> Thanks,
>> Ajay Kumar
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
