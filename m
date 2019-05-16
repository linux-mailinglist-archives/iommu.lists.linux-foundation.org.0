Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CDB20722
	for <lists.iommu@lfdr.de>; Thu, 16 May 2019 14:43:48 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 7DF71DC2;
	Thu, 16 May 2019 12:43:46 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 3C8DB92F
	for <iommu@lists.linux-foundation.org>;
	Thu, 16 May 2019 12:43:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id A7A5B5E4
	for <iommu@lists.linux-foundation.org>;
	Thu, 16 May 2019 12:43:43 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 364101715;
	Thu, 16 May 2019 05:43:43 -0700 (PDT)
Received: from [10.1.196.129] (ostrya.cambridge.arm.com [10.1.196.129])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 444AB3F703;
	Thu, 16 May 2019 05:43:41 -0700 (PDT)
Subject: Re: [PATCH v3 6/7] iommu: Introduce IOMMU_RESV_DIRECT_RELAXABLE
	reserved memory regions
To: Auger Eric <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
	joro@8bytes.org, iommu@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org, dwmw2@infradead.org,
	lorenzo.pieralisi@arm.com, robin.murphy@arm.com, will.deacon@arm.com,
	hanjun.guo@linaro.org, sudeep.holla@arm.com
References: <20190516100817.12076-1-eric.auger@redhat.com>
	<20190516100817.12076-7-eric.auger@redhat.com>
	<3e21e370-135e-2eab-dd99-50e19cd53b86@arm.com>
	<403897e7-2af9-3fa9-2264-f66dfeda6fd7@redhat.com>
From: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
Message-ID: <214a20d2-9cb5-c23d-ad38-8a0dea729e00@arm.com>
Date: Thu, 16 May 2019 13:43:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <403897e7-2af9-3fa9-2264-f66dfeda6fd7@redhat.com>
Content-Language: en-US
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: alex.williamson@redhat.com
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On 16/05/2019 12:45, Auger Eric wrote:
> Hi Jean-Philippe,
> 
> On 5/16/19 1:16 PM, Jean-Philippe Brucker wrote:
>> On 16/05/2019 11:08, Eric Auger wrote:
>>> Note: At the moment the sysfs ABI is not changed. However I wonder
>>> whether it wouldn't be preferable to report the direct region as
>>> "direct_relaxed" there. At the moment, in case the same direct
>>> region is used by 2 devices, one USB/GFX and another not belonging
>>> to the previous categories, the direct region will be output twice
>>> with "direct" type.
>>>
>>> This would unblock Shameer's series:
>>> [PATCH v6 0/7] vfio/type1: Add support for valid iova list management
>>> https://patchwork.kernel.org/patch/10425309/
>>
>> Thanks for doing this!
>>
>>> which failed to get pulled for 4.18 merge window due to IGD
>>> device assignment regression.
>>>
>>> v2 -> v3:
>>> - fix direct type check
>>> ---
>>>  drivers/iommu/iommu.c | 12 +++++++-----
>>>  include/linux/iommu.h |  6 ++++++
>>>  2 files changed, 13 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
>>> index ae4ea5c0e6f9..28c3d6351832 100644
>>> --- a/drivers/iommu/iommu.c
>>> +++ b/drivers/iommu/iommu.c
>>> @@ -73,10 +73,11 @@ struct iommu_group_attribute {
>>>  };
>>>  
>>>  static const char * const iommu_group_resv_type_string[] = {
>>> -	[IOMMU_RESV_DIRECT]	= "direct",
>>> -	[IOMMU_RESV_RESERVED]	= "reserved",
>>> -	[IOMMU_RESV_MSI]	= "msi",
>>> -	[IOMMU_RESV_SW_MSI]	= "msi",
>>> +	[IOMMU_RESV_DIRECT]			= "direct",
>>> +	[IOMMU_RESV_DIRECT_RELAXABLE]		= "direct",
>>> +	[IOMMU_RESV_RESERVED]			= "reserved",
>>> +	[IOMMU_RESV_MSI]			= "msi",
>>> +	[IOMMU_RESV_SW_MSI]			= "msi",
>>>  };
>>>  
>>>  #define IOMMU_GROUP_ATTR(_name, _mode, _show, _store)		\
>>> @@ -573,7 +574,8 @@ static int iommu_group_create_direct_mappings(struct iommu_group *group,
>>>  		start = ALIGN(entry->start, pg_size);
>>>  		end   = ALIGN(entry->start + entry->length, pg_size);
>>>  
>>> -		if (entry->type != IOMMU_RESV_DIRECT)
>>> +		if (entry->type != IOMMU_RESV_DIRECT &&
>>> +		    entry->type != IOMMU_RESV_DIRECT_RELAXABLE)
>>
>> I'm trying to understand why you need to create direct mappings at all
>> for these relaxable regions. In the host the region is needed for legacy
>> device features, which are disabled (and cannot be re-enabled) when
>> assigning the device to a guest?
> This follows Kevin's comment in the thread below:
> https://patchwork.kernel.org/patch/10449103/#21957279
> 
> In normal DMA API host path, those regions need to be 1-1 mapped. They
> are likely to be accessed by the driver or FW at early boot phase or
> even during execution, depending on features being used.
> 
> That's the reason, according to Kevin we couldn't hide them.
> 
> We just know that, in general, they are not used anymore when assigning
> the device or if accesses are attempted this generally does not block
> the assignment use case. For example, it is said in
> https://github.com/qemu/qemu/blob/master/docs/igd-assign.txt that in
> legacy IGD assignment use case, there may be "a small numbers of DMAR
> faults when initially assigned".

Hmm, fair enough. That doesn't sound too good, if the device might
perform arbitrary writes into guest memory once new IOMMU mappings are
in place. I was wondering if we could report some IOVA ranges as
"available but avoid if possible". If the guest has a vIOMMU, they are
easy to avoid. But I doubt they would ever get used, since probably no
one is going to instantiate a vIOMMU for a graphics device in legacy mode.

Thanks,
Jean
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
