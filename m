Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 9959A4F9BED
	for <lists.iommu@lfdr.de>; Fri,  8 Apr 2022 19:44:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F98C4031B;
	Fri,  8 Apr 2022 17:44:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pK1jwgaQBOEJ; Fri,  8 Apr 2022 17:44:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id F292040425;
	Fri,  8 Apr 2022 17:44:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C0B8AC002C;
	Fri,  8 Apr 2022 17:44:47 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E0F3EC002C
 for <iommu@lists.linux-foundation.org>; Fri,  8 Apr 2022 17:44:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D9DC940425
 for <iommu@lists.linux-foundation.org>; Fri,  8 Apr 2022 17:44:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z8HSctnWCEaZ for <iommu@lists.linux-foundation.org>;
 Fri,  8 Apr 2022 17:44:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp4.osuosl.org (Postfix) with ESMTP id 70B3F4031B
 for <iommu@lists.linux-foundation.org>; Fri,  8 Apr 2022 17:44:45 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 78DD71042;
 Fri,  8 Apr 2022 10:44:44 -0700 (PDT)
Received: from [10.57.41.19] (unknown [10.57.41.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8FBDF3F5A1;
 Fri,  8 Apr 2022 10:44:42 -0700 (PDT)
Message-ID: <a8371724-2864-a316-439d-5aa7a8bb5739@arm.com>
Date: Fri, 8 Apr 2022 18:44:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 0/4] Make the iommu driver no-snoop block feature
 consistent
Content-Language: en-GB
To: Jason Gunthorpe <jgg@nvidia.com>
References: <0-v2-f090ae795824+6ad-intel_no_snoop_jgg@nvidia.com>
 <f5acf507-b4ef-b393-159c-05ca04feb43d@arm.com>
 <20220407174326.GR2120790@nvidia.com>
 <77482321-2e39-fc7c-09b6-e929a851a80f@arm.com>
 <20220407190824.GS2120790@nvidia.com>
 <4cc084a5-7d25-8e81-bdc1-1501c3346a0c@arm.com>
 <20220408121845.GT2120790@nvidia.com>
 <4f93d16d-9606-bd1c-a82b-e4b00ae2364f@arm.com>
 <20220408133523.GX2120790@nvidia.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20220408133523.GX2120790@nvidia.com>
Cc: "Tian, Kevin" <kevin.tian@intel.com>, kvm@vger.kernel.org,
 Will Deacon <will@kernel.org>, Cornelia Huck <cohuck@redhat.com>,
 iommu@lists.linux-foundation.org, Alex Williamson <alex.williamson@redhat.com>,
 David Woodhouse <dwmw2@infradead.org>, Christoph Hellwig <hch@lst.de>
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

On 2022-04-08 14:35, Jason Gunthorpe wrote:
> On Fri, Apr 08, 2022 at 02:11:10PM +0100, Robin Murphy wrote:
> 
>>> However, this creates an oddball situation where the vfio_device and
>>> it's struct device could become unplugged from the system while the
>>> domain that the struct device spawned continues to exist and remains
>>> attached to other devices in the same group. ie the iommu driver has
>>> to be careful not to retain the struct device input..
>>
>> Oh, I rather assumed that VFIO might automatically tear down the
>> container/domain when the last real user disappears.
> 
> It does, that isn't quite what I mean..
> 
> Lets say a simple case with two groups and two devices.
> 
> Open a VFIO container FD
> 
> We open group A and SET_CONTAINER it. This results in an
>     domain_A = iommu_domain_alloc(device_A)
>     iommu_attach_group(domain_A, device_A->group)
> 
> We open group B and SET_CONTAINER it. Using the sharing logic we end
> up doing
>     iommu_attach_group(domain_A, device_B->group)
> 
> Now we close group A FD, detatch device_A->group from domain_A and the
> driver core hot-unplugs device A completely from the system.
> 
> However, domain_A remains in the system used by group B's open FD.
> 
> It is a bit funny at least.. I think it is just something to document
> and be aware of for iommu driver writers that they probably shouldn't
> try to store the allocation device in their domain struct.
> 
> IHMO the only purpose of the allocation device is to crystalize the
> configuration of the iommu_domain at allocation time.

Oh, for sure. When I implement the API switch, I can certainly try to 
document it as clearly as possible that the device argument is only for 
resolving the correct IOMMU ops and target instance, and the resulting 
domain is still not in any way tied to that specific device.

I hadn't thought about how it might look to future developers who aren't 
already familiar with all the history here, so thanks for the nudge!

>> as long as we take care not to release DMA ownership until that point also.
>> As you say, it just looks a bit funny.
> 
> The DMA ownership should be OK as we take ownership on each group FD
> open
>   
>>> I suppose that is inevitable to have sharing of domains across
>>> devices, so the iommu drivers will have to accommodate this.
>>
>> I think domain lifecycle management is already entirely up to the users and
>> not something that IOMMU drivers need to worry about. Drivers should only
>> need to look at per-device data in attach/detach (and, once I've finished,
>> alloc) from the device argument which can be assumed to be valid at that
>> point. Otherwise, all the relevant internal data for domain ops should
>> belong to the domain already.
> 
> Making attach/detach take a struct device would be nice - but I would
> expect the attach/detatch to use a strictly paired struct device and I
> don't think this trick of selecting an arbitary vfio_device will
> achieve that.
> 
> So, I suppose VFIO would want to attach/detatch on every vfio_device
> individually and it would iterate over the group instead of doing a
> list_first_entry() like above. This would not be hard to do in VFIO.

It feels like we've already beaten that discussion to death in other 
threads; regardless of what exact argument the iommu_attach/detach 
operations end up taking, they have to operate on the whole (explicit or 
implicit) iommu_group at once, because doing anything else would defeat 
the point of isolation groups, and be impossible for alias groups.

> Not sure what the iommu layer would have to do to accommodate this..

If it's significantly easier for VFIO to just run through a whole list 
of devices and attach each one without having to keep track of whether 
they might share an iommu_group which has already been attached, then we 
can probably relax the API a little such that attaching to a domain 
which is already the current domain becomes a no-op instead of returning 
-EBUSY, but I'd rather not create an expectation that anyone *has* to do 
that. For any other callers that would be forcing *more* iommu_group 
implementation details onto them, when we all want less.

Cheers,
Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
