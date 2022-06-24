Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC09559D14
	for <lists.iommu@lfdr.de>; Fri, 24 Jun 2022 17:13:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CEE942489;
	Fri, 24 Jun 2022 15:13:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3CEE942489
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cs8v_B21u4aB; Fri, 24 Jun 2022 15:13:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id CC02C41B81;
	Fri, 24 Jun 2022 15:13:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC02C41B81
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8D8CFC0083;
	Fri, 24 Jun 2022 15:13:05 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DD015C002D
 for <iommu@lists.linux-foundation.org>; Fri, 24 Jun 2022 15:13:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A66AB41161
 for <iommu@lists.linux-foundation.org>; Fri, 24 Jun 2022 15:13:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A66AB41161
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xx3B9QkCiXbl for <iommu@lists.linux-foundation.org>;
 Fri, 24 Jun 2022 15:13:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AAF364115E
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp2.osuosl.org (Postfix) with ESMTP id AAF364115E
 for <iommu@lists.linux-foundation.org>; Fri, 24 Jun 2022 15:13:03 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1C16B143D;
 Fri, 24 Jun 2022 08:13:03 -0700 (PDT)
Received: from [10.57.84.111] (unknown [10.57.84.111])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CAEAB3F534;
 Fri, 24 Jun 2022 08:13:01 -0700 (PDT)
Message-ID: <42679e49-4a04-4700-f420-f6ffe0f4b7d1@arm.com>
Date: Fri, 24 Jun 2022 16:12:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 1/2] vfio/type1: Simplify bus_type determination
Content-Language: en-GB
To: Alex Williamson <alex.williamson@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>
References: <b1d13cade281a7d8acbfd0f6a33dcd086207952c.1655898523.git.robin.murphy@arm.com>
 <20220622161721.469fc9eb.alex.williamson@redhat.com>
 <68263bd7-4528-7acb-b11f-6b1c6c8c72ef@arm.com>
 <20220623170044.1757267d.alex.williamson@redhat.com>
 <20220624015030.GJ4147@nvidia.com>
 <20220624081159.508baed3.alex.williamson@redhat.com>
 <20220624141836.GS4147@nvidia.com>
 <20220624082831.22de3d51.alex.williamson@redhat.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20220624082831.22de3d51.alex.williamson@redhat.com>
Cc: iommu@lists.linux.dev, cohuck@redhat.com, iommu@lists.linux-foundation.org,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org
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

On 2022-06-24 15:28, Alex Williamson wrote:
> On Fri, 24 Jun 2022 11:18:36 -0300
> Jason Gunthorpe <jgg@nvidia.com> wrote:
> 
>> On Fri, Jun 24, 2022 at 08:11:59AM -0600, Alex Williamson wrote:
>>> On Thu, 23 Jun 2022 22:50:30 -0300
>>> Jason Gunthorpe <jgg@nvidia.com> wrote:
>>>    
>>>> On Thu, Jun 23, 2022 at 05:00:44PM -0600, Alex Williamson wrote:
>>>>    
>>>>>>>> +struct vfio_device *vfio_device_get_from_iommu(struct iommu_group *iommu_group)
>>>>>>>> +{
>>>>>>>> +	struct vfio_group *group = vfio_group_get_from_iommu(iommu_group);
>>>>>>>> +	struct vfio_device *device;
>>>>>>>
>>>>>>> Check group for NULL.
>>>>>>
>>>>>> OK - FWIW in context this should only ever make sense to call with an
>>>>>> iommu_group which has already been derived from a vfio_group, and I did
>>>>>> initially consider a check with a WARN_ON(), but then decided that the
>>>>>> unguarded dereference would be a sufficiently strong message. No problem
>>>>>> with bringing that back to make it more defensive if that's what you prefer.
>>>>>
>>>>> A while down the road, that's a bit too much implicit knowledge of the
>>>>> intent and single purpose of this function just to simply avoid a test.
>>>>
>>>> I think we should just pass the 'struct vfio_group *' into the
>>>> attach_group op and have this API take that type in and forget the
>>>> vfio_group_get_from_iommu().
>>>
>>> That's essentially what I'm suggesting, the vfio_group is passed as an
>>> opaque pointer which type1 can use for a
>>> vfio_group_for_each_vfio_device() type call.  Thanks,
>>
>> I don't want to add a whole vfio_group_for_each_vfio_device()
>> machinery that isn't actually needed by anything.. This is all
>> internal, we don't need to design more than exactly what is needed.
>>
>> At this point if we change the signature of the attach then we may as
>> well just pass in the representative vfio_device, that is probably
>> less LOC overall.
> 
> That means that vfio core still needs to pick an arbitrary
> representative device, which I find in fundamental conflict to the
> nature of groups.  Type1 is the interface to the IOMMU API, if through
> the IOMMU API we can make an assumption that all devices within the
> group are equivalent for a given operation, that should be done in type1
> code, not in vfio core.  A for-each interface is commonplace and not
> significantly more code or design than already proposed.  Thanks,

It also occurred to me this morning that there's another middle-ground 
option staring out from the call-wrapping notion I mentioned yesterday - 
while I'm not keen to provide it from the IOMMU API, there's absolutely 
no reason that VFIO couldn't just use the building blocks by itself, and 
in fact it works out almost absurdly simple:

static bool vfio_device_capable(struct device *dev, void *data)
{
	return device_iommu_capable(dev, (enum iommu_cap)data);
}

bool vfio_group_capable(struct iommu_group *group, enum iommu_cap cap)
{
	return iommu_group_for_each_dev(group, (void *)cap, vfio_device_capable);
}

and much the same for iommu_domain_alloc() once I get that far. The 
locking concern neatly disappears because we're no longer holding any 
bus or device pointer that can go stale. How does that seem as a 
compromise for now, looking forward to Jason's longer-term view of 
rearranging the attach_group process such that a vfio_device falls 
naturally to hand?

Cheers,
Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
