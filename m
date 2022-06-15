Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F40B54C695
	for <lists.iommu@lfdr.de>; Wed, 15 Jun 2022 12:58:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F2131408C9;
	Wed, 15 Jun 2022 10:57:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WL6L8DtE1Mhw; Wed, 15 Jun 2022 10:57:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id D65C440489;
	Wed, 15 Jun 2022 10:57:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A6AF6C0081;
	Wed, 15 Jun 2022 10:57:57 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BBACEC002D
 for <iommu@lists.linux-foundation.org>; Wed, 15 Jun 2022 10:57:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A7CE7418DE
 for <iommu@lists.linux-foundation.org>; Wed, 15 Jun 2022 10:57:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dv1FAdVzPuWL for <iommu@lists.linux-foundation.org>;
 Wed, 15 Jun 2022 10:57:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0D71F418DB
 for <iommu@lists.linux-foundation.org>; Wed, 15 Jun 2022 10:57:53 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 43DBA152B;
 Wed, 15 Jun 2022 03:57:53 -0700 (PDT)
Received: from [10.57.82.209] (unknown [10.57.82.209])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 75E743F66F;
 Wed, 15 Jun 2022 03:57:51 -0700 (PDT)
Message-ID: <54159102-42f8-e5dc-5099-1d5d4dbbfc65@arm.com>
Date: Wed, 15 Jun 2022 11:57:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [RESEND PATCH v8 01/11] iommu: Add DMA ownership management
 interfaces
Content-Language: en-GB
To: Steven Price <steven.price@arm.com>, Lu Baolu <baolu.lu@linux.intel.com>, 
 Joerg Roedel <joro@8bytes.org>
References: <20220418005000.897664-1-baolu.lu@linux.intel.com>
 <20220418005000.897664-2-baolu.lu@linux.intel.com>
 <10eaa3b1-4cf7-a7b6-a7f6-111a486a343a@arm.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <10eaa3b1-4cf7-a7b6-a7f6-111a486a343a@arm.com>
Cc: Kevin Tian <kevin.tian@intel.com>, iommu@lists.linux-foundation.org,
 Jason Gunthorpe <jgg@nvidia.com>, linux-kernel@vger.kernel.org
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

On 2022-06-15 10:53, Steven Price wrote:
> On 18/04/2022 01:49, Lu Baolu wrote:
>> Multiple devices may be placed in the same IOMMU group because they
>> cannot be isolated from each other. These devices must either be
>> entirely under kernel control or userspace control, never a mixture.
>>
>> This adds dma ownership management in iommu core and exposes several
>> interfaces for the device drivers and the device userspace assignment
>> framework (i.e. VFIO), so that any conflict between user and kernel
>> controlled dma could be detected at the beginning.
>>
>> The device driver oriented interfaces are,
>>
>> 	int iommu_device_use_default_domain(struct device *dev);
>> 	void iommu_device_unuse_default_domain(struct device *dev);
>>
>> By calling iommu_device_use_default_domain(), the device driver tells
>> the iommu layer that the device dma is handled through the kernel DMA
>> APIs. The iommu layer will manage the IOVA and use the default domain
>> for DMA address translation.
>>
>> The device user-space assignment framework oriented interfaces are,
>>
>> 	int iommu_group_claim_dma_owner(struct iommu_group *group,
>> 					void *owner);
>> 	void iommu_group_release_dma_owner(struct iommu_group *group);
>> 	bool iommu_group_dma_owner_claimed(struct iommu_group *group);
>>
>> The device userspace assignment must be disallowed if the DMA owner
>> claiming interface returns failure.
>>
>> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
>> Signed-off-by: Kevin Tian <kevin.tian@intel.com>
>> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
>> Reviewed-by: Robin Murphy <robin.murphy@arm.com>
> 
> I'm seeing a regression that I've bisected to this commit on a Firefly
> RK3288 board. The display driver fails to probe properly because
> __iommu_attach_group() returns -EBUSY. This causes long hangs and splats
> as the display flips timeout.
> 
> The call stack to __iommu_attach_group() is:
> 
>   __iommu_attach_group from iommu_attach_device+0x64/0xb4
>   iommu_attach_device from rockchip_drm_dma_attach_device+0x20/0x50
>   rockchip_drm_dma_attach_device from vop_crtc_atomic_enable+0x10c/0xa64
>   vop_crtc_atomic_enable from drm_atomic_helper_commit_modeset_enables+0xa8/0x290
>   drm_atomic_helper_commit_modeset_enables from drm_atomic_helper_commit_tail_rpm+0x44/0x8c
>   drm_atomic_helper_commit_tail_rpm from commit_tail+0x9c/0x180
>   commit_tail from drm_atomic_helper_commit+0x164/0x18c
>   drm_atomic_helper_commit from drm_atomic_commit+0xac/0xe4
>   drm_atomic_commit from drm_client_modeset_commit_atomic+0x23c/0x284
>   drm_client_modeset_commit_atomic from drm_client_modeset_commit_locked+0x60/0x1c8
>   drm_client_modeset_commit_locked from drm_client_modeset_commit+0x24/0x40
>   drm_client_modeset_commit from drm_fb_helper_set_par+0xb8/0xf8
>   drm_fb_helper_set_par from drm_fb_helper_hotplug_event.part.0+0xa8/0xc0
>   drm_fb_helper_hotplug_event.part.0 from output_poll_execute+0xb8/0x224
> 
>> @@ -2109,7 +2115,7 @@ static int __iommu_attach_group(struct iommu_domain *domain,
>>   {
>>   	int ret;
>>   
>> -	if (group->default_domain && group->domain != group->default_domain)
>> +	if (group->domain && group->domain != group->default_domain)
>>   		return -EBUSY;
>>   
>>   	ret = __iommu_group_for_each_dev(group, domain,
> 
> Reverting this 'fixes' the problem for me. The follow up 0286300e6045
> ("iommu: iommu_group_claim_dma_owner() must always assign a domain")
> doesn't help.
> 
> Adding some debug printks I can see that domain is a valid pointer, but
> both default_domain and blocking_domain are NULL.
> 
> I'm using the DTB from the kernel tree (rk3288-firefly.dtb).
> 
> Any ideas?

Hmm, TBH I'm not sure how that worked previously... it'll be complaining 
because the ARM DMA domain is still attached, but even when the attach 
goes ahead and replaces the ARM domain with the driver's new one, it's 
not using the special arm_iommu_detach_device() interface anywhere so 
the device would still be left with the wrong DMA ops :/

I guess the most pragmatic option is probably to give rockchip-drm a 
similar bodge to exynos and tegra, to explicitly remove the ARM domain 
before attaching its own.

Thanks,
Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
