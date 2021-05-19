Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E160388D37
	for <lists.iommu@lfdr.de>; Wed, 19 May 2021 13:48:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43071606DD;
	Wed, 19 May 2021 11:48:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J2agFH3TkjJc; Wed, 19 May 2021 11:48:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BEF96066E;
	Wed, 19 May 2021 11:48:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 280D0C0001;
	Wed, 19 May 2021 11:48:22 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4F78FC0001
 for <iommu@lists.linux-foundation.org>; Wed, 19 May 2021 11:48:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2A87540633
 for <iommu@lists.linux-foundation.org>; Wed, 19 May 2021 11:48:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5OxQYilQtrUc for <iommu@lists.linux-foundation.org>;
 Wed, 19 May 2021 11:48:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp4.osuosl.org (Postfix) with ESMTP id C9FE740620
 for <iommu@lists.linux-foundation.org>; Wed, 19 May 2021 11:48:19 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 09267101E;
 Wed, 19 May 2021 04:48:19 -0700 (PDT)
Received: from [10.57.66.179] (unknown [10.57.66.179])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 077393F719;
 Wed, 19 May 2021 04:48:16 -0700 (PDT)
Subject: Re: [PATCH v4 2/8] iommu/dma: Introduce generic helper to retrieve
 RMR info
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Joerg Roedel <joro@8bytes.org>
References: <20210513134550.2117-1-shameerali.kolothum.thodi@huawei.com>
 <20210513134550.2117-3-shameerali.kolothum.thodi@huawei.com>
 <YKN/ocoHvOdbH43j@8bytes.org> <503068eb5f184639a75d7d1ef929b4c6@huawei.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <4047b1ef-5f6e-c3b8-e701-1cfa68acfd69@arm.com>
Date: Wed, 19 May 2021 12:48:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <503068eb5f184639a75d7d1ef929b4c6@huawei.com>
Content-Language: en-GB
Cc: "jon@solid-run.com" <jon@solid-run.com>, Linuxarm <linuxarm@huawei.com>,
 "steven.price@arm.com" <steven.price@arm.com>,
 "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "Guohanjun \(Hanjun Guo\)" <guohanjun@huawei.com>,
 yangyicong <yangyicong@huawei.com>,
 "Sami.Mujawar@arm.com" <Sami.Mujawar@arm.com>,
 wanghuiqiang <wanghuiqiang@huawei.com>
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

On 2021-05-19 10:30, Shameerali Kolothum Thodi wrote:
> 
> 
>> -----Original Message-----
>> From: Joerg Roedel [mailto:joro@8bytes.org]
>> Sent: 18 May 2021 09:50
>> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
>> Cc: linux-arm-kernel@lists.infradead.org; linux-acpi@vger.kernel.org;
>> iommu@lists.linux-foundation.org; Linuxarm <linuxarm@huawei.com>;
>> lorenzo.pieralisi@arm.com; robin.murphy@arm.com; wanghuiqiang
>> <wanghuiqiang@huawei.com>; Guohanjun (Hanjun Guo)
>> <guohanjun@huawei.com>; steven.price@arm.com; Sami.Mujawar@arm.com;
>> jon@solid-run.com; eric.auger@redhat.com; yangyicong
>> <yangyicong@huawei.com>
>> Subject: Re: [PATCH v4 2/8] iommu/dma: Introduce generic helper to retrieve
>> RMR info
>>
>> On Thu, May 13, 2021 at 02:45:44PM +0100, Shameer Kolothum wrote:
>>> +/**
>>> + * struct iommu_rmr - Reserved Memory Region details per IOMMU
>>> + * @list: Linked list pointers to hold RMR region info
>>> + * @base_address: base address of Reserved Memory Region
>>> + * @length: length of memory region
>>> + * @sid: associated stream id
>>> + * @flags: flags that apply to the RMR node
>>> + */
>>> +struct iommu_rmr {
>>> +	struct list_head	list;
>>> +	phys_addr_t		base_address;
>>> +	u64			length;
>>> +	u32			sid;
>>> +	u32			flags;
>>> +};
>>> +
>>> +/* RMR Remap permitted */
>>> +#define IOMMU_RMR_REMAP_PERMITTED	(1 << 0)
>>> +
>>
>> This struct has lots of overlap with 'struct iommu_resv_region'. Any
>> reason the existing struct can't be used here?
>>
> 
> Hmm..main reason is "sid". RMRs are associated with stream ids and
> that is used to install bypass STEs/SMRs in SMMU drivers and also to check
> whether a dev has any RMR regions associated with it.
> 
> I think we could add sid/dev_id to 'struct iommu_resv_region', and modify
> iommu_alloc_resv_region() accordingly. That can get rid of the above struct
> and iommu_dma_alloc_rmr() fn. Not sure this will complicate things as
> the dev_id is only valid for RMR reservation region cases.
> 
> Please let me know your thoughts.

Maybe add a union for FW-specific data to struct resv_region, so that it 
could eventually subsume AMD's struct unity_map_entry and Intel's struct 
dmar_rmrr_unit as well? They're essentially doing the same dance.

We might still have to create copies of the firmware-allocated entries 
to actually assign to domains (certainly where one entry covers multiple 
devices), but kmemdup() is still a lot neater than various translations 
from private formats.

Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
