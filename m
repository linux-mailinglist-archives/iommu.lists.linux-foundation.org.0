Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B7F4C03A7
	for <lists.iommu@lfdr.de>; Tue, 22 Feb 2022 22:18:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8314F80B73;
	Tue, 22 Feb 2022 21:18:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T4_cagMkQhDq; Tue, 22 Feb 2022 21:18:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id E9983812F5;
	Tue, 22 Feb 2022 21:18:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AEFAAC0073;
	Tue, 22 Feb 2022 21:18:39 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1C319C0011
 for <iommu@lists.linux-foundation.org>; Tue, 22 Feb 2022 21:18:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 034FF401E8
 for <iommu@lists.linux-foundation.org>; Tue, 22 Feb 2022 21:18:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iTW2F5UjhBZd for <iommu@lists.linux-foundation.org>;
 Tue, 22 Feb 2022 21:18:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp4.osuosl.org (Postfix) with ESMTP id A7B38401E4
 for <iommu@lists.linux-foundation.org>; Tue, 22 Feb 2022 21:18:37 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9C670139F;
 Tue, 22 Feb 2022 13:18:36 -0800 (PST)
Received: from [10.57.40.147] (unknown [10.57.40.147])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6E55F3F70D;
 Tue, 22 Feb 2022 13:18:32 -0800 (PST)
Message-ID: <3d4c3bf1-fed6-f640-dc20-36d667de7461@arm.com>
Date: Tue, 22 Feb 2022 21:18:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v6 02/11] driver core: Add dma_cleanup callback in bus_type
Content-Language: en-GB
To: Jason Gunthorpe <jgg@nvidia.com>
References: <20220218005521.172832-1-baolu.lu@linux.intel.com>
 <20220218005521.172832-3-baolu.lu@linux.intel.com>
 <YhCdEmC2lYStmUSL@infradead.org>
 <1d8004d3-1887-4fc7-08d2-0e2ee6b5fdcb@arm.com>
 <20220221234837.GA10061@nvidia.com>
 <1acb8748-8d44-688d-2380-f39ec820776f@arm.com>
 <20220222151632.GB10061@nvidia.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20220222151632.GB10061@nvidia.com>
Cc: kvm@vger.kernel.org, rafael@kernel.org, David Airlie <airlied@linux.ie>,
 linux-pci@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>, Dmitry Osipenko <digetx@gmail.com>,
 Will Deacon <will@kernel.org>, Ashok Raj <ashok.raj@intel.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Christoph Hellwig <hch@infradead.org>,
 Stuart Yoder <stuyoder@gmail.com>, Kevin Tian <kevin.tian@intel.com>,
 Chaitanya Kulkarni <kch@nvidia.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Dan Williams <dan.j.williams@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Cornelia Huck <cohuck@redhat.com>, linux-kernel@vger.kernel.org,
 Li Yang <leoyang.li@nxp.com>, iommu@lists.linux-foundation.org,
 Jacob jun Pan <jacob.jun.pan@intel.com>, Daniel Vetter <daniel@ffwll.ch>
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

On 2022-02-22 15:16, Jason Gunthorpe wrote:
> On Tue, Feb 22, 2022 at 10:58:37AM +0000, Robin Murphy wrote:
>> On 2022-02-21 23:48, Jason Gunthorpe wrote:
>>> On Mon, Feb 21, 2022 at 08:43:33PM +0000, Robin Murphy wrote:
>>>> On 2022-02-19 07:32, Christoph Hellwig wrote:
>>>>> So we are back to the callback madness instead of the nice and simple
>>>>> flag?  Sigh.
>>>>
>>>> TBH, I *think* this part could be a fair bit simpler. It looks like this
>>>> whole callback mess is effectively just to decrement
>>>> group->owner_cnt, but
>>>
>>> Right, the new callback is because of Greg's push to put all the work
>>> into the existing bus callback. Having symetrical callbacks is
>>> cleaner.
>>
>> I'll continue to disagree that having tons more code purely for the sake of
>> it is cleaner. The high-level requirements are fundamentally asymmetrical -
>> ownership has to be actively claimed by the bus code at a point during probe
>> where it can block probing if necessary, but it can be released anywhere at
>> all during remove since that cannot fail. I don't personally see the value
>> in a bunch of code bloat for no reason other than trying to pretend that an
>> asymmetrical thing isn't.
> 
> Then we should put this in the share core code like most of us want.
> 
> If we are doing this distorted thing then it may as well make some
> kind of self consistent sense with a configure/unconfigure op pair.
> 
>> group->owner?  Walking the list would only have to be done for *releasing*
>> ownership and I'm pretty sure all the races there are benign - only
>> probe/remove of the driver (or DMA API token) matching a current non-NULL
>> owner matter; if two removes race, the first might end up releasing
>> ownership "early", but the second is waiting to do that anyway so it's OK;
>> if a remove races with a probe, the remove may end up leaving the owner set,
>> but the probe is waiting to do that anyway so it's OK.
> 
> With a lockless algorithm the race is probably wrongly releasing an
> ownership that probe just set in the multi-device group case.
> 
> Still not sure I see what you are thinking though..

What part of "How hard is it to hold group->mutex when reading or 
writing group->owner?" sounded like "complex lockless algorithm", exactly?

To spell it out, the scheme I'm proposing looks like this:

probe/claim:
	void *owner = driver_or_DMA_API_token(dev);//oversimplification!
	if (owner) {
		mutex_lock(group->mutex);
		if (!group->owner)
			group->owner = owner;
		else if (group->owner != owner);
			ret = -EBUSY;
		mutex_unlock(group->mutex);
	}

remove:
	bool still_owned = false;
	mutex_lock(group->mutex);
	list_for_each_entry(tmp, &group->devices, list) {
		void *owner = driver_or_DMA_API_token(tmp);
		if (tmp == dev || !owner || owner != group->owner)
			continue;
		still_owned = true;
		break;
	}
	if (!still_owned)
		group->owner = NULL;
	mutex_unlock(group->mutex);

Of course now that I've made it more concrete I realise that the remove 
hook does need to run *after* dev->driver is cleared, so not quite 
"anywhere at all", but the main point remains: as long as actual changes 
of ownership are always serialised, even if the list walk in the remove 
hook sees "future" information WRT other devices' drivers, at worst it 
should merely short-cut to a corresponding pending reclaim of ownership.

> How did we get from adding a few simple lines to dd.c into building
> some complex lockless algorithm and hoping we did it right?

Because the current alternative to adding a few simple lines to dd.c is 
adding loads of lines all over the place to end up calling back into 
common IOMMU code, to do something I'm 99% certain the common IOMMU code 
could do for itself in private. That said, having worked through the 
above, it does start looking like a bit of a big change for this series 
at this point, so I'm happy to keep it on the back burner for when I 
have to rip .dma_configure to pieces anyway.

According to lockdep, I think I've solved the VFIO locking issue 
provided vfio_group_viable() goes away, so I'm certainly keen not to 
delay that for another cycle!

>>>> It has to be s It should be pretty straightforward for
>>>> iommu_bus_notifier to clear group->owner automatically upon an
>>>> unbind of the matching driver when it's no longer bound to any other
>>>> devices in the group either.
>>>
>>> That not_bound/unbind notifier isn't currently triggred during
>>> necessary failure paths of really_probe().
>>
>> Eh? Just look at the context of patch #2, let alone the rest of the
>> function, and tell me how, if we can't rely on BUS_NOTIFY_DRIVER_NOT_BOUND,
>> calling .dma_cleanup *from the exact same place* is somehow more reliable?
> 
> Yeah, OK
> 
>> AFAICS, a notifier handling both BUS_NOTIFY_UNBOUND_DRIVER and
>> BUS_NOTIFY_DRIVER_NOT_BOUND would be directly equivalent to the callers of
>> .dma_cleanup here.
> 
> Yes, but why hide this in a notifier, it is still spaghetti

Quick quiz!

1: The existing IOMMU group management has spent the last 10 years being 
driven from:

   A - All over random bits of bus code and the driver core
   B - A private bus notifier


2: The functionality that this series replaces and improves upon was 
split between VFIO and...

   A - Random bits of bus code and the driver core
   B - The same private bus notifier

>>>> use-case) then it should be up to VFIO to decide when it's finally
>>>> finished with the whole group, rather than pretending we can keep
>>>> track of nested ownership claims from inside the API.
>>>
>>> What nesting?
>>
>> The current implementation of iommu_group_claim_dma_owner() allows owner_cnt
>> to increase beyond 1, and correspondingly requires
>> iommu_group_release_dma_owner() to be called the same number of times. It
>> doesn't appear that VFIO needs that, and I'm not sure I'd trust any other
>> potential users to get it right either.
> 
> That isn't for "nesting" it is keeping track of multi-device
> groups. Each count represents a device, not a nest.

I was originally going to say "recursion", but then thought that might 
carry too much risk of misinterpretation, oh well. Hold your favourite 
word for "taking a mutual-exclusion token that you already hold" in mind 
and read my paragraph quoted above again. I'm not talking about 
automatic DMA API claiming, that clearly happens per-device; I'm talking 
about explicit callers of iommu_group_claim_dma_owner(). Does VFIO call 
that multiple times for individual devices? No. Should it? No. Is it 
reasonable that any other future callers should need to? I don't think 
so. Would things be easier to reason about if we just disallowed it 
outright? For sure.

>>>> FWIW I have some ideas for re-converging .dma_configure in future
>>>> which I think should probably be able to subsume this into a
>>>> completely generic common path, given a common flag.
>>>
>>> This would be great!
>>
>> Indeed, so if we're enthusiastic about future cleanup that necessitates a
>> generic flag, why not make the flag generic to start with?
> 
> Maybe when someone has patches to delete the bus ops completely they
> can convince Greg. The good news is that it isn't much work to flip
> the flag, Lu has already done it 3 times in the previous versions..
> 
> It has already been 8 weeks on this point, lets just move on please.

Sure, if it was rc7 with the merge window looming I'd be saying "this is 
close enough, let's get it in now and fix the small stuff next cycle". 
However while there's still potentially time to get things right first 
time, I for one am going to continue to point them out because I'm not a 
fan of avoidable churn. I'm sorry I haven't had a chance to look 
properly at this series between v1 and v6, but that's just how things 
have been.

Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
