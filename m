Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBAB455216
	for <lists.iommu@lfdr.de>; Thu, 18 Nov 2021 02:17:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29F4380D2B;
	Thu, 18 Nov 2021 01:17:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JVqGMPNeM3BI; Thu, 18 Nov 2021 01:17:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 3190A80D20;
	Thu, 18 Nov 2021 01:17:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0EF9BC0036;
	Thu, 18 Nov 2021 01:17:19 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 48F46C0012
 for <iommu@lists.linux-foundation.org>; Thu, 18 Nov 2021 01:17:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 27DAF4010B
 for <iommu@lists.linux-foundation.org>; Thu, 18 Nov 2021 01:17:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sM9AuiDN8r9H for <iommu@lists.linux-foundation.org>;
 Thu, 18 Nov 2021 01:17:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4BF93400C4
 for <iommu@lists.linux-foundation.org>; Thu, 18 Nov 2021 01:17:16 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10171"; a="220973085"
X-IronPort-AV: E=Sophos;i="5.87,243,1631602800"; d="scan'208";a="220973085"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2021 17:17:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,243,1631602800"; d="scan'208";a="495157953"
Received: from allen-box.sh.intel.com (HELO [10.239.159.118])
 ([10.239.159.118])
 by orsmga007.jf.intel.com with ESMTP; 17 Nov 2021 17:17:09 -0800
Subject: Re: [PATCH 01/11] iommu: Add device dma ownership set/release
 interfaces
To: Jason Gunthorpe <jgg@nvidia.com>
References: <20211115020552.2378167-1-baolu.lu@linux.intel.com>
 <20211115020552.2378167-2-baolu.lu@linux.intel.com>
 <YZJdJH4AS+vm0j06@infradead.org>
 <cc7ce6f4-b1ec-49ef-e245-ab6c330154c2@linux.intel.com>
 <20211116134603.GA2105516@nvidia.com>
 <d79acc01-eeaf-e6ac-0415-af498c355a00@linux.intel.com>
 <20211117133517.GJ2105516@nvidia.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <5901c54b-a6eb-b060-aa52-15de7708d703@linux.intel.com>
Date: Thu, 18 Nov 2021 09:12:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211117133517.GJ2105516@nvidia.com>
Content-Language: en-US
Cc: Kevin Tian <kevin.tian@intel.com>, Chaitanya Kulkarni <kch@nvidia.com>,
 Ashok Raj <ashok.raj@intel.com>, kvm@vger.kernel.org, rafael@kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Cornelia Huck <cohuck@redhat.com>, Will Deacon <will@kernel.org>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Christoph Hellwig <hch@infradead.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Jacob jun Pan <jacob.jun.pan@intel.com>, linux-pci@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, Diana Craciun <diana.craciun@oss.nxp.com>
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

On 11/17/21 9:35 PM, Jason Gunthorpe wrote:
> On Wed, Nov 17, 2021 at 01:22:19PM +0800, Lu Baolu wrote:
>> Hi Jason,
>>
>> On 11/16/21 9:46 PM, Jason Gunthorpe wrote:
>>> On Tue, Nov 16, 2021 at 09:57:30AM +0800, Lu Baolu wrote:
>>>> Hi Christoph,
>>>>
>>>> On 11/15/21 9:14 PM, Christoph Hellwig wrote:
>>>>> On Mon, Nov 15, 2021 at 10:05:42AM +0800, Lu Baolu wrote:
>>>>>> +enum iommu_dma_owner {
>>>>>> +	DMA_OWNER_NONE,
>>>>>> +	DMA_OWNER_KERNEL,
>>>>>> +	DMA_OWNER_USER,
>>>>>> +};
>>>>>> +
>>>>>
>>>>>> +	enum iommu_dma_owner dma_owner;
>>>>>> +	refcount_t owner_cnt;
>>>>>> +	struct file *owner_user_file;
>>>>>
>>>>> I'd just overload the ownership into owner_user_file,
>>>>>
>>>>>     NULL			-> no owner
>>>>>     (struct file *)1UL)	-> kernel
>>>>>     real pointer		-> user
>>>>>
>>>>> Which could simplify a lot of the code dealing with the owner.
>>>>>
>>>>
>>>> Yeah! Sounds reasonable. I will make this in the next version.
>>>
>>> It would be good to figure out how to make iommu_attach_device()
>>> enforce no other driver binding as a kernel user without a file *, as
>>> Robin pointed to, before optimizing this.
>>>
>>> This fixes an existing bug where iommu_attach_device() only checks the
>>> group size and is vunerable to a hot plug increasing the group size
>>> after it returns. That check should be replaced by this series's logic
>>> instead.
>>
>> As my my understanding, the essence of this problem is that only the
>> user owner of the iommu_group could attach an UNMANAGED domain to it.
>> If I understand it right, how about introducing a new interface to
>> allocate a user managed domain and storing the user file pointer in it.
> 
> For iommu_attach_device() the semantic is simple non-sharing, so there
> is no need for the file * at all, it can just be NULL.

The file * being NULL means the device is only owned by the kernel
driver. Perhaps we can check this pointer in iommu_attach_device() to
avoid using it for user domain attachment.

> 
>> Does above help here?
> 
> No, iommu_attach_device() is kernel only and should not interact with
> userspace.

The existing iommu_attach_device() allows only for singleton group. As
we have added group ownership attribute, we can enforce this interface
only for kernel domain usage.

> 
> I'm also going to see if I can learn what Tegra is doing with
> iommu_attach_group()

Okay! Thank you!

> 
> Jason
> 

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
