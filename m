Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D55B239D5C
	for <lists.iommu@lfdr.de>; Mon,  3 Aug 2020 04:02:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id C6BB885810;
	Mon,  3 Aug 2020 02:02:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ATS4ALDZKyi5; Mon,  3 Aug 2020 02:02:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7CB3F86974;
	Mon,  3 Aug 2020 02:02:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5FC66C004C;
	Mon,  3 Aug 2020 02:02:32 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 45813C004C
 for <iommu@lists.linux-foundation.org>; Mon,  3 Aug 2020 02:02:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 29CC285BEC
 for <iommu@lists.linux-foundation.org>; Mon,  3 Aug 2020 02:02:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R78NEKt-0dJl for <iommu@lists.linux-foundation.org>;
 Mon,  3 Aug 2020 02:02:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 8FDFA85BAE
 for <iommu@lists.linux-foundation.org>; Mon,  3 Aug 2020 02:02:29 +0000 (UTC)
IronPort-SDR: +xZfq+ns98C3f3WNdf6UonF5R/JogC03zSrOdnKMgPEZN5Gf4NHNw8wMM7GSTz7g24gEzMZWqE
 7MljmKbzEdlg==
X-IronPort-AV: E=McAfee;i="6000,8403,9701"; a="131598485"
X-IronPort-AV: E=Sophos;i="5.75,428,1589266800"; d="scan'208";a="131598485"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2020 19:02:28 -0700
IronPort-SDR: ljepv2Eh78IstXl+1Q0xhZ21vaoTSa0CNzm22yFD7Al/VtvAgAe9NQxyssDy2gZyel+YkRQC8m
 5bKEA7bf7UJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,428,1589266800"; d="scan'208";a="395906051"
Received: from allen-box.sh.intel.com (HELO [10.239.159.139])
 ([10.239.159.139])
 by fmsmga001.fm.intel.com with ESMTP; 02 Aug 2020 19:02:23 -0700
Subject: Re: [PATCH v3 2/4] iommu: Add iommu_aux_at(de)tach_group()
To: Alex Williamson <alex.williamson@redhat.com>
References: <20200714055703.5510-1-baolu.lu@linux.intel.com>
 <20200714055703.5510-3-baolu.lu@linux.intel.com>
 <20200714093909.1ab93c9e@jacob-builder>
 <b5b22e01-4a51-8dfe-9ba4-aeca783740f1@linux.intel.com>
 <20200715090114.50a459d4@jacob-builder>
 <435a2014-c2e8-06b9-3c9a-4afbf6607ffe@linux.intel.com>
 <20200729140336.09d2bfe7@x1.home>
 <MWHPR11MB16454283959A365ED7964C488C700@MWHPR11MB1645.namprd11.prod.outlook.com>
 <20200730134658.44c57a67@x1.home>
 <3e252771-b1ed-a9fc-b179-97c8f280c526@linux.intel.com>
 <20200731120537.2e1d8916@x1.home>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <9ee76708-f50c-adb1-0b3f-67871c799cab@linux.intel.com>
Date: Mon, 3 Aug 2020 09:57:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200731120537.2e1d8916@x1.home>
Content-Language: en-US
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, "Tian,
 Kevin" <kevin.tian@intel.com>, "Jiang, Dave" <dave.jiang@intel.com>, "Raj,
 Ashok" <ashok.raj@intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Cornelia Huck <cohuck@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Robin Murphy <robin.murphy@arm.com>
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

Hi Alex,

On 8/1/20 2:05 AM, Alex Williamson wrote:
> On Fri, 31 Jul 2020 13:47:57 +0800
> Lu Baolu <baolu.lu@linux.intel.com> wrote:
> 
>> Hi Alex,
>>
>> On 2020/7/31 3:46, Alex Williamson wrote:
>>> On Wed, 29 Jul 2020 23:34:40 +0000
>>> "Tian, Kevin" <kevin.tian@intel.com> wrote:
>>>    
>>>>> From: Alex Williamson <alex.williamson@redhat.com>
>>>>> Sent: Thursday, July 30, 2020 4:04 AM
>>>>>
>>>>> On Thu, 16 Jul 2020 09:07:46 +0800
>>>>> Lu Baolu <baolu.lu@linux.intel.com> wrote:
>>>>>       
>>>>>> Hi Jacob,
>>>>>>
>>>>>> On 7/16/20 12:01 AM, Jacob Pan wrote:
>>>>>>> On Wed, 15 Jul 2020 08:47:36 +0800
>>>>>>> Lu Baolu <baolu.lu@linux.intel.com> wrote:
>>>>>>>      
>>>>>>>> Hi Jacob,
>>>>>>>>
>>>>>>>> On 7/15/20 12:39 AM, Jacob Pan wrote:
>>>>>>>>> On Tue, 14 Jul 2020 13:57:01 +0800
>>>>>>>>> Lu Baolu<baolu.lu@linux.intel.com>  wrote:
>>>>>>>>>      
>>>>>>>>>> This adds two new aux-domain APIs for a use case like vfio/mdev
>>>>>>>>>> where sub-devices derived from an aux-domain capable device are
>>>>>>>>>> created and put in an iommu_group.
>>>>>>>>>>
>>>>>>>>>> /**
>>>>>>>>>>      * iommu_aux_attach_group - attach an aux-domain to an
>>>>> iommu_group
>>>>>>>>>> which
>>>>>>>>>>      *                          contains sub-devices (for example
>>>>>>>>>> mdevs) derived
>>>>>>>>>>      *                          from @dev.
>>>>>>>>>>      * @domain: an aux-domain;
>>>>>>>>>>      * @group:  an iommu_group which contains sub-devices derived
>>>>> from
>>>>>>>>>> @dev;
>>>>>>>>>>      * @dev:    the physical device which supports
>>>>> IOMMU_DEV_FEAT_AUX.
>>>>>>>>>>      *
>>>>>>>>>>      * Returns 0 on success, or an error value.
>>>>>>>>>>      */
>>>>>>>>>> int iommu_aux_attach_group(struct iommu_domain *domain,
>>>>>>>>>>                                struct iommu_group *group,
>>>>>>>>>>                                struct device *dev)
>>>>>>>>>>
>>>>>>>>>> /**
>>>>>>>>>>      * iommu_aux_detach_group - detach an aux-domain from an
>>>>>>>>>> iommu_group *
>>>>>>>>>>      * @domain: an aux-domain;
>>>>>>>>>>      * @group:  an iommu_group which contains sub-devices derived
>>>>> from
>>>>>>>>>> @dev;
>>>>>>>>>>      * @dev:    the physical device which supports
>>>>> IOMMU_DEV_FEAT_AUX.
>>>>>>>>>>      *
>>>>>>>>>>      * @domain must have been attached to @group via
>>>>>>>>>> iommu_aux_attach_group(). */
>>>>>>>>>> void iommu_aux_detach_group(struct iommu_domain *domain,
>>>>>>>>>>                                 struct iommu_group *group,
>>>>>>>>>>                                 struct device *dev)
>>>>>>>>>>
>>>>>>>>>> It also adds a flag in the iommu_group data structure to identify
>>>>>>>>>> an iommu_group with aux-domain attached from those normal ones.
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Lu Baolu<baolu.lu@linux.intel.com>
>>>>>>>>>> ---
>>>>>>>>>>      drivers/iommu/iommu.c | 58
>>>>>>>>>> +++++++++++++++++++++++++++++++++++++++++++
>>>>> include/linux/iommu.h |
>>>>>>>>>> 17 +++++++++++++ 2 files changed, 75 insertions(+)
>>>>>>>>>>
>>>>>>>>>> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
>>>>>>>>>> index e1fdd3531d65..cad5a19ebf22 100644
>>>>>>>>>> --- a/drivers/iommu/iommu.c
>>>>>>>>>> +++ b/drivers/iommu/iommu.c
>>>>>>>>>> @@ -45,6 +45,7 @@ struct iommu_group {
>>>>>>>>>>      	struct iommu_domain *default_domain;
>>>>>>>>>>      	struct iommu_domain *domain;
>>>>>>>>>>      	struct list_head entry;
>>>>>>>>>> +	unsigned int aux_domain_attached:1;
>>>>>>>>>>      };
>>>>>>>>>>
>>>>>>>>>>      struct group_device {
>>>>>>>>>> @@ -2759,6 +2760,63 @@ int iommu_aux_get_pasid(struct
>>>>> iommu_domain
>>>>>>>>>> *domain, struct device *dev) }
>>>>>>>>>>      EXPORT_SYMBOL_GPL(iommu_aux_get_pasid);
>>>>>>>>>>
>>>>>>>>>> +/**
>>>>>>>>>> + * iommu_aux_attach_group - attach an aux-domain to an
>>>>> iommu_group
>>>>>>>>>> which
>>>>>>>>>> + *                          contains sub-devices (for example
>>>>>>>>>> mdevs) derived
>>>>>>>>>> + *                          from @dev.
>>>>>>>>>> + * @domain: an aux-domain;
>>>>>>>>>> + * @group:  an iommu_group which contains sub-devices derived
>>>>> from
>>>>>>>>>> @dev;
>>>>>>>>>> + * @dev:    the physical device which supports
>>>>> IOMMU_DEV_FEAT_AUX.
>>>>>>>>>> + *
>>>>>>>>>> + * Returns 0 on success, or an error value.
>>>>>>>>>> + */
>>>>>>>>>> +int iommu_aux_attach_group(struct iommu_domain *domain,
>>>>>>>>>> +			   struct iommu_group *group, struct
>>>>>>>>>> device *dev) +{
>>>>>>>>>> +	int ret = -EBUSY;
>>>>>>>>>> +
>>>>>>>>>> +	mutex_lock(&group->mutex);
>>>>>>>>>> +	if (group->domain)
>>>>>>>>>> +		goto out_unlock;
>>>>>>>>>> +
>>>>>>>>> Perhaps I missed something but are we assuming only one mdev per
>>>>>>>>> mdev group? That seems to change the logic where vfio does:
>>>>>>>>> iommu_group_for_each_dev()
>>>>>>>>> 	iommu_aux_attach_device()
>>>>>>>>>      
>>>>>>>>
>>>>>>>> It has been changed in PATCH 4/4:
>>>>>>>>
>>>>>>>> static int vfio_iommu_attach_group(struct vfio_domain *domain,
>>>>>>>>                                        struct vfio_group *group)
>>>>>>>> {
>>>>>>>>             if (group->mdev_group)
>>>>>>>>                     return iommu_aux_attach_group(domain->domain,
>>>>>>>>                                                   group->iommu_group,
>>>>>>>>                                                   group->iommu_device);
>>>>>>>>             else
>>>>>>>>                     return iommu_attach_group(domain->domain,
>>>>>>>> group->iommu_group);
>>>>>>>> }
>>>>>>>>
>>>>>>>> So, for both normal domain and aux-domain, we use the same concept:
>>>>>>>> attach a domain to a group.
>>>>>>>>      
>>>>>>> I get that, but don't you have to attach all the devices within the
>>>>>>
>>>>>> This iommu_group includes only mediated devices derived from an
>>>>>> IOMMU_DEV_FEAT_AUX-capable device. Different from
>>>>> iommu_attach_group(),
>>>>>> iommu_aux_attach_group() doesn't need to attach the domain to each
>>>>>> device in group, instead it only needs to attach the domain to the
>>>>>> physical device where the mdev's were created from.
>>>>>>      
>>>>>>> group? Here you see the group already has a domain and exit.
>>>>>>
>>>>>> If the (group->domain) has been set, that means a domain has already
>>>>>> attached to the group, so it returns -EBUSY.
>>>>>
>>>>> I agree with Jacob, singleton groups should not be built into the IOMMU
>>>>> API, we're not building an interface just for mdevs or current
>>>>> limitations of mdevs.  This also means that setting a flag on the group
>>>>> and passing a device that's assumed to be common for all devices within
>>>>> the group, don't really make sense here.  Thanks,
>>>>>
>>>>> Alex
>>>>
>>>> Baolu and I discussed about this assumption before. The assumption is
>>>> not based on singleton groups. We do consider multiple mdevs in one
>>>> group. But our feeling at the moment is that all mdevs (or other AUX
>>>> derivatives) in the same group should come from the same parent
>>>> device, thus comes with above design. Does it sound a reasonable
>>>> assumption to you?
>>>
>>> No, the approach in this series doesn't really make sense to me.  We
>>> currently have the following workflow as Baolu notes in the cover
>>> letter:
>>>
>>> 	domain = iommu_domain_alloc(bus);
>>>
>>> 	iommu_group_for_each_dev(group...
>>>
>>> 		iommu_device = mdev-magic()
>>>
>>> 		if (iommu_dev_feature_enabled(iommu_device,
>>> 						IOMMU_DEV_FEAT_AUX))
>>> 			iommu_aux_attach_device(domain, iommu_device);
>>>
>>> And we want to convert this to a group function, like we have for
>>> non-aux domains:
>>>
>>> 	domain = iommu_domain_alloc(bus);
>>>
>>> 	iommu_device = mdev-magic()
>>>
>>> 	iommu_aux_attach_group(domain, group, iommu_device);
>>>
>>> And I think we want to do that largely because iommu_group.domain is
>>> private to iommu.c (therefore vfio code cannot set it), but we need it
>>> set in order for iommu_get_domain_for_dev() to work with a group
>>> attached to an aux domain.  Passing an iommu_device avoids the problem
>>> that IOMMU API code doesn't know how to derive an iommu_device for each
>>> device in the group, but while doing so it ignores the fundamental
>>> nature of a group as being a set of one or more devices.  Even if we
>>> can make the leap that all devices within the group would use the same
>>> iommu_device, an API that sets and aux domain for a group while
>>> entirely ignoring the devices within the group seems very broken.
>>
>> Agreed. We couldn't assume that all devices in an iommu group shares a
>> same iommu_device, especially when it comes to PF/VF wrapped mediated
>> device case.
>>
>>>
>>> So, barring adding an abstraction at struct device where an IOMMU API
>>> could retrieve the iommu_device backing anther device (which seems a
>>> very abstract concept for the base class), why not have the caller
>>> provide a lookup function?  Ex:
>>>
>>> int iommu_aux_attach_group(struct iommu_domain *domain,
>>> 			   struct iommu_group *group,
>>> 			   struct device *(*iommu_device_lookup)(
>>> 				struct device *dev));
>>>
>>> Thus vfio could could simply provide &vfio_mdev_get_iommu_device and
>>> we'd have equivalent functionality to what we have currently, but with
>>> the domain pointer set in the iommu_group.
>>
>> This looks good to me.
>>
>>>
>>> This also however highlights that our VF backed mdevs will have the
>>> same issue, so maybe this new IOMMU API interface should mimic
>>> vfio_mdev_attach_domain() more directly, testing whether the resulting
>>> device supports IOMMU_DEV_FEAT_AUX and using an aux vs non-aux attach.
>>> I'm not sure what the name of this combined function should be,
>>> iommu_attach_group_with_lookup()?  This could be the core
>>> implementation of iommu_attach_group() where the existing function
>>> simply wraps the call with a NULL function pointer.
>>>
>>> Anyway, I think there are ways to implement this that are more in line
>>> with the spirit of groups.
>>
>> Another possible implementation, just for discussion purpose:
>>
>> 1. Add a member in group_device to save the iommu_device if it exists:
>>
>> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
>> index b6858adc4f17..6474e82cf4b4 100644
>> --- a/drivers/iommu/iommu.c
>> +++ b/drivers/iommu/iommu.c
>> @@ -47,9 +47,16 @@ struct iommu_group {
>>           struct list_head entry;
>>    };
>>
>> +/*
>> + * dma_alias: The device put in this group might depends on another
>> + *            physical device to do the DMA remapping. At(de)taching
>> + *            the domain to/from @dma_alias instead of @dev if
>> + *            @dma_alias is set.
>> + */
>>    struct group_device {
>>           struct list_head list;
>>           struct device *dev;
>> +       struct device *dma_alias;
>>           char *name;
>>    };
>>
>> 2. Pass in the iommu_device when calling iommu_group_add_device().
>>
>> int iommu_group_add_device(struct iommu_group *group,
>>                              struct device *dev,
>>                              struct device *dma_alias)
>>
>> Hence, the iommu core could get a chance to set the iommu_device in the
>> group device.
>>
>> 3. Mimic vfio_mdev_attach_domain() logic in iommu_group_do_attach_device():
>>
>> if (group->dma_alias) {
>> 	if (iommu_dev_feature_enabled(group->dma_alias, IOMMU_DEV_FEAT_AUX))
>> 		iommu_aux_attach_device(domain, group->dma_alias);
>> 	else
>> 		__iommu_attach_device(domain, group->dma_alias);
>> } else {
>> 	__iommu_attach_device(domain, dev);
>> }
>>
>> One limitation is that the driver should call mdev_set_iommu_device()
>> before the mdev_probe() get called.
> 
> That's an option, but DMA aliases are an existing thing within our
> IOMMU/PCI constructs, so I'd steer away from "dma_alias" terminology.  I
> thought the callback was a little less invasive to the IOMMU layer for
> now as aux domains are still a rather unique use case, and I'm not sure
> we can justify the hack of otherwise IOMMU backed mdevs formally within
> the IOMMU API.

Fair enough. I will start with lookup callback solution.

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
