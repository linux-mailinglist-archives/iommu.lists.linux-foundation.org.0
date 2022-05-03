Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBF75184F0
	for <lists.iommu@lfdr.de>; Tue,  3 May 2022 15:04:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 974F2416C2;
	Tue,  3 May 2022 13:04:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ALvowkOKZ_SD; Tue,  3 May 2022 13:04:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 45ACB414CA;
	Tue,  3 May 2022 13:04:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 143C2C002D;
	Tue,  3 May 2022 13:04:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3D755C002D
 for <iommu@lists.linux-foundation.org>; Tue,  3 May 2022 13:04:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2865A416C2
 for <iommu@lists.linux-foundation.org>; Tue,  3 May 2022 13:04:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xH2YV-tXr2IT for <iommu@lists.linux-foundation.org>;
 Tue,  3 May 2022 13:04:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A34B414CA
 for <iommu@lists.linux-foundation.org>; Tue,  3 May 2022 13:04:45 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 95D8C1042;
 Tue,  3 May 2022 06:04:44 -0700 (PDT)
Received: from [10.57.80.111] (unknown [10.57.80.111])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CCE073F774;
 Tue,  3 May 2022 06:04:42 -0700 (PDT)
Message-ID: <8b3d31ef-caf7-da92-fa95-0df378d5b091@arm.com>
Date: Tue, 3 May 2022 14:04:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [RESEND PATCH v8 00/11] Fix BUG_ON in vfio_iommu_group_notifier()
Content-Language: en-GB
To: Jason Gunthorpe <jgg@nvidia.com>, Qian Cai <quic_qiancai@quicinc.com>
References: <20220418005000.897664-1-baolu.lu@linux.intel.com>
 <20220502161204.GA22@qian> <20220502164216.GP8364@nvidia.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20220502164216.GP8364@nvidia.com>
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Kevin Tian <kevin.tian@intel.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org
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

On 2022-05-02 17:42, Jason Gunthorpe wrote:
> On Mon, May 02, 2022 at 12:12:04PM -0400, Qian Cai wrote:
>> On Mon, Apr 18, 2022 at 08:49:49AM +0800, Lu Baolu wrote:
>>> Hi Joerg,
>>>
>>> This is a resend version of v8 posted here:
>>> https://lore.kernel.org/linux-iommu/20220308054421.847385-1-baolu.lu@linux.intel.com/
>>> as we discussed in this thread:
>>> https://lore.kernel.org/linux-iommu/Yk%2Fq1BGN8pC5HVZp@8bytes.org/
>>>
>>> All patches can be applied perfectly except this one:
>>>   - [PATCH v8 02/11] driver core: Add dma_cleanup callback in bus_type
>>> It conflicts with below refactoring commit:
>>>   - 4b775aaf1ea99 "driver core: Refactor sysfs and drv/bus remove hooks"
>>> The conflict has been fixed in this post.
>>>
>>> No functional changes in this series. I suppress cc-ing this series to
>>> all v8 reviewers in order to avoid spam.
>>>
>>> Please consider it for your iommu tree.
>>
>> Reverting this series fixed an user-after-free while doing SR-IOV.
>>
>>   BUG: KASAN: use-after-free in __lock_acquire
>>   Read of size 8 at addr ffff080279825d78 by task qemu-system-aar/22429
>>   CPU: 24 PID: 22429 Comm: qemu-system-aar Not tainted 5.18.0-rc5-next-20220502 #69
>>   Call trace:
>>    dump_backtrace
>>    show_stack
>>    dump_stack_lvl
>>    print_address_description.constprop.0
>>    print_report
>>    kasan_report
>>    __asan_report_load8_noabort
>>    __lock_acquire
>>    lock_acquire.part.0
>>    lock_acquire
>>    _raw_spin_lock_irqsave
>>    arm_smmu_detach_dev
>>    arm_smmu_detach_dev at drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:2377
>>    arm_smmu_attach_dev
> 
> Hum.
> 
> So what has happened is that VFIO does this sequence:
> 
>   iommu_detach_group()
>   iommu_domain_free()
>   iommu_group_release_dma_owner()
> 
> Which, I think should be valid, API wise.
> 
>  From what I can see reading the code SMMUv3 blows up above because it
> doesn't have a detach_dev op:
> 
> 	.default_domain_ops = &(const struct iommu_domain_ops) {
> 		.attach_dev		= arm_smmu_attach_dev,
> 		.map_pages		= arm_smmu_map_pages,
> 		.unmap_pages		= arm_smmu_unmap_pages,
> 		.flush_iotlb_all	= arm_smmu_flush_iotlb_all,
> 		.iotlb_sync		= arm_smmu_iotlb_sync,
> 		.iova_to_phys		= arm_smmu_iova_to_phys,
> 		.enable_nesting		= arm_smmu_enable_nesting,
> 		.free			= arm_smmu_domain_free,
> 	}
> 
> But it is internally tracking the domain inside the master - so when
> the next domain is attached it does this:
> 
> static void arm_smmu_detach_dev(struct arm_smmu_master *master)
> {
> 	struct arm_smmu_domain *smmu_domain = master->domain;
> 
> 	spin_lock_irqsave(&smmu_domain->devices_lock, flags);
> 
> And explodes as the domain has been freed but master->domain was not
> NULL'd.
> 
> It worked before because iommu_detach_group() used to attach the
> default group and that was before the domain was freed in the above
> sequence.

Oof, I totally overlooked the significance of that little subtlety in 
review :(

> I'm guessing SMMU3 needs to call it's arm_smmu_detach_dev(master) from
> the detach_dev op and null it's cached copy of the domain, but I don't
> know this driver.. Robin?

The original intent was that .detach_dev is deprecated in favour of 
default domains, and when the latter are in use, a device is always 
attached *somewhere* once probed (i.e. group->domain is never NULL). At 
face value, the neatest fix IMO would probably be for SMMUv3's 
.domain_free to handle smmu_domain->devices being non-empty and detach 
them at that point. However that wouldn't be viable for virtio-iommu or 
anyone else keeping an internal one-way association of devices to their 
current domains.

If we're giving up entirely on that notion of .detach_dev going away 
then all default-domain-supporting drivers probably want checking to 
make sure that path hasn't bitrotted; both Arm SMMU drivers had it 
proactively removed 6 years ago; virtio-iommu never had it at all; newer 
drivers like apple-dart have some code there, but it won't have ever run 
until now.

We *could* stay true to the original paradigm by introducing some real 
usage of IOMMU_DOMAIN_BLOCKED, such that we could keep one or more of 
those around to actively attach to instead of having groups in this 
unattached limbo state, but that's a bigger job involving adding support 
to drivers as well; too much for a quick fix now...

Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
