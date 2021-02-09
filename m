Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id AA033314EA8
	for <lists.iommu@lfdr.de>; Tue,  9 Feb 2021 13:09:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 66DFC862C1;
	Tue,  9 Feb 2021 12:09:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vytB_wy8Fdhq; Tue,  9 Feb 2021 12:09:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CBD6F84465;
	Tue,  9 Feb 2021 12:09:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C496AC013A;
	Tue,  9 Feb 2021 12:09:00 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4405EC013A
 for <iommu@lists.linux-foundation.org>; Tue,  9 Feb 2021 12:08:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 3341D861C7
 for <iommu@lists.linux-foundation.org>; Tue,  9 Feb 2021 12:08:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y_xsX99VLSxA for <iommu@lists.linux-foundation.org>;
 Tue,  9 Feb 2021 12:08:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 28E5584465
 for <iommu@lists.linux-foundation.org>; Tue,  9 Feb 2021 12:08:58 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8CC8CED1;
 Tue,  9 Feb 2021 04:08:57 -0800 (PST)
Received: from [10.57.49.26] (unknown [10.57.49.26])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7B4693F73B;
 Tue,  9 Feb 2021 04:08:54 -0800 (PST)
Subject: Re: [RFC PATCH 10/11] vfio/iommu_type1: Optimize dirty bitmap
 population based on iommu HWDBM
To: Yi Sun <yi.y.sun@linux.intel.com>, Keqian Zhu <zhukeqian1@huawei.com>
References: <20210128151742.18840-1-zhukeqian1@huawei.com>
 <20210128151742.18840-11-zhukeqian1@huawei.com>
 <20210207095630.GA28580@yi.y.sun>
 <407d28db-1f86-8d4f-ab15-3c3ac56bbe7f@huawei.com>
 <20210209115744.GB28580@yi.y.sun>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <b137db1d-a31b-3a81-08fa-24d7a8c290e9@arm.com>
Date: Tue, 9 Feb 2021 12:08:48 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210209115744.GB28580@yi.y.sun>
Content-Language: en-GB
Cc: Mark Rutland <mark.rutland@arm.com>, kevin.tian@intel.com,
 Cornelia Huck <cohuck@redhat.com>, yan.y.zhao@intel.com, kvm@vger.kernel.org,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, jiangkunkun@huawei.com,
 Alex Williamson <alex.williamson@redhat.com>, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, lushenming@huawei.com,
 Kirti Wankhede <kwankhede@nvidia.com>, James Morse <james.morse@arm.com>,
 Marc Zyngier <maz@kernel.org>, wanghaibin.wang@huawei.com,
 Will Deacon <will@kernel.org>, kvmarm@lists.cs.columbia.edu,
 linux-arm-kernel@lists.infradead.org
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

On 2021-02-09 11:57, Yi Sun wrote:
> On 21-02-07 18:40:36, Keqian Zhu wrote:
>> Hi Yi,
>>
>> On 2021/2/7 17:56, Yi Sun wrote:
>>> Hi,
>>>
>>> On 21-01-28 23:17:41, Keqian Zhu wrote:
>>>
>>> [...]
>>>
>>>> +static void vfio_dma_dirty_log_start(struct vfio_iommu *iommu,
>>>> +				     struct vfio_dma *dma)
>>>> +{
>>>> +	struct vfio_domain *d;
>>>> +
>>>> +	list_for_each_entry(d, &iommu->domain_list, next) {
>>>> +		/* Go through all domain anyway even if we fail */
>>>> +		iommu_split_block(d->domain, dma->iova, dma->size);
>>>> +	}
>>>> +}
>>>
>>> This should be a switch to prepare for dirty log start. Per Intel
>>> Vtd spec, there is SLADE defined in Scalable-Mode PASID Table Entry.
>>> It enables Accessed/Dirty Flags in second-level paging entries.
>>> So, a generic iommu interface here is better. For Intel iommu, it
>>> enables SLADE. For ARM, it splits block.
>> Indeed, a generic interface name is better.
>>
>> The vendor iommu driver plays vendor's specific actions to start dirty log, and Intel iommu and ARM smmu may differ. Besides, we may add more actions in ARM smmu driver in future.
>>
>> One question: Though I am not familiar with Intel iommu, I think it also should split block mapping besides enable SLADE. Right?
>>
> I am not familiar with ARM smmu. :) So I want to clarify if the block
> in smmu is big page, e.g. 2M page? Intel Vtd manages the memory per
> page, 4KB/2MB/1GB.

Indeed, what you call large pages, we call blocks :)

Robin.

> There are two ways to manage dirty pages.
> 1. Keep default granularity. Just set SLADE to enable the dirty track.
> 2. Split big page to 4KB to get finer granularity.
> 
> But question about the second solution is if it can benefit the user
> space, e.g. live migration. If my understanding about smmu block (i.e.
> the big page) is correct, have you collected some performance data to
> prove that the split can improve performance? Thanks!
> 
>> Thanks,
>> Keqian
> _______________________________________________
> iommu mailing list
> iommu@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/iommu
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
