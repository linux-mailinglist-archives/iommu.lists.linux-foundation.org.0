Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE8E54C960
	for <lists.iommu@lfdr.de>; Wed, 15 Jun 2022 15:02:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7E1E41962;
	Wed, 15 Jun 2022 13:02:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GsiOYdimJVA3; Wed, 15 Jun 2022 13:02:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 271594195F;
	Wed, 15 Jun 2022 13:02:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E3F65C002D;
	Wed, 15 Jun 2022 13:02:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DB134C002D
 for <iommu@lists.linux-foundation.org>; Wed, 15 Jun 2022 13:02:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C958D408DA
 for <iommu@lists.linux-foundation.org>; Wed, 15 Jun 2022 13:02:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=intel.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4wP-HJruloRE for <iommu@lists.linux-foundation.org>;
 Wed, 15 Jun 2022 13:02:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 928014034B
 for <iommu@lists.linux-foundation.org>; Wed, 15 Jun 2022 13:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655298150; x=1686834150;
 h=message-id:date:mime-version:cc:subject:to:references:
 from:in-reply-to:content-transfer-encoding;
 bh=9aFgN11zv32epzY4IsX2SnErbjKpIlBDe1HikVsn+0U=;
 b=LQXTLOxF4unUQnOQYNk9Pc2R8WlDQASeZg4Gi15t15k5Vcb4YpUTUUHy
 oMI6vB8QKgpHNMXM6K9EUr09P+buvYhXDeqrV/cZiPGE8GQSb6hW3sxT9
 7S6JBP8/HxZWVPQlXITwLeyhO+DFMtrCc73XmZhrgxSlkZduLKgJEddHh
 rSz9t9bhhuxc1NdzKSMS/WmZOnIW5HcN7AO/dnOotNvG9gQOMEMZC/KsH
 lISDk+VUt7oGeNXqMgvoM9XoqxjRa4/mG+VFM+xhRDcz6346+++1DIpME
 SHmwKJIf9VwyJNHYoL/kNqrHjkIn1TbRqnitdkkO66UVoCpB13T9vVrkW w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10378"; a="279669341"
X-IronPort-AV: E=Sophos;i="5.91,302,1647327600"; d="scan'208";a="279669341"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2022 06:02:29 -0700
X-IronPort-AV: E=Sophos;i="5.91,302,1647327600"; d="scan'208";a="589103071"
Received: from leitan-mobl.ccr.corp.intel.com (HELO [10.255.31.142])
 ([10.255.31.142])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2022 06:02:27 -0700
Message-ID: <08fd79a1-0117-42bb-9105-c8ff400fb7df@linux.intel.com>
Date: Wed, 15 Jun 2022 21:02:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 01/12] iommu/vt-d: debugfs: Remove device_domain_lock
 usage
Content-Language: en-US
To: "Tian, Kevin" <kevin.tian@intel.com>, Joerg Roedel <joro@8bytes.org>,
 "Raj, Ashok" <ashok.raj@intel.com>, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@nvidia.com>
References: <20220614025137.1632762-1-baolu.lu@linux.intel.com>
 <20220614025137.1632762-2-baolu.lu@linux.intel.com>
 <BN9PR11MB527680C1957C0E29E8AE85168CAA9@BN9PR11MB5276.namprd11.prod.outlook.com>
 <4f6f7bb9-5ea4-b466-7a59-62ebd5bc2cf7@linux.intel.com>
 <BN9PR11MB52769385E96377F5FD8CE2928CAD9@BN9PR11MB5276.namprd11.prod.outlook.com>
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <BN9PR11MB52769385E96377F5FD8CE2928CAD9@BN9PR11MB5276.namprd11.prod.outlook.com>
Cc: Will Deacon <will@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, "Pan,
 Jacob jun" <jacob.jun.pan@intel.com>, Robin Murphy <robin.murphy@arm.com>
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

On 2022/6/15 14:13, Tian, Kevin wrote:
>> From: Baolu Lu<baolu.lu@linux.intel.com>
>> Sent: Wednesday, June 15, 2022 9:54 AM
>>
>> On 2022/6/14 14:43, Tian, Kevin wrote:
>>>> From: Lu Baolu<baolu.lu@linux.intel.com>
>>>> Sent: Tuesday, June 14, 2022 10:51 AM
>>>>
>>>> The domain_translation_struct debugfs node is used to dump the DMAR
>>>> page
>>>> tables for the PCI devices. It potentially races with setting domains to
>>>> devices. The existing code uses a global spinlock device_domain_lock to
>>>> avoid the races, but this is problematical as this lock is only used to
>>>> protect the device tracking lists of each domain.
>>> is it really problematic at this point? Before following patches are applied
>>> using device_domain_lock should have similar effect as holding the group
>>> lock.
>>>
>>> Here it might make more sense to just focus on removing the use of
>>> device_domain_lock outside of iommu.c. Just that using group lock is
>>> cleaner and more compatible to following cleanups.
>>>
>>> and it's worth mentioning that racing with page table updates is out
>>> of the scope of this series. Probably also add a comment in the code
>>> to clarify this point.
>>>
>> Hi Kevin,
>>
>> How do you like below updated patch?
> Yes, this is better.
> 
>>   From cecc9a0623780a11c4ea4d0a15aa6187f01541c4 Mon Sep 17 00:00:00
>> 2001
>> From: Lu Baolu<baolu.lu@linux.intel.com>
>> Date: Sun, 29 May 2022 10:18:56 +0800
>> Subject: [PATCH 1/1] iommu/vt-d: debugfs: Remove device_domain_lock
>> usage
>>
>> The domain_translation_struct debugfs node is used to dump the DMAR
>> page
>> tables for the PCI devices. It potentially races with setting domains to
>> devices. The existing code uses the global spinlock device_domain_lock to
>> avoid the races.
>>
>> This removes the use of device_domain_lock outside of iommu.c by replacing
>> it with the group mutex lock. Using the group mutex lock is cleaner and
>> more compatible to following cleanups.
>>
>> Signed-off-by: Lu Baolu<baolu.lu@linux.intel.com>
>> ---
>>    drivers/iommu/intel/debugfs.c | 42 +++++++++++++++++++++++++----------
>>    drivers/iommu/intel/iommu.c   |  2 +-
>>    drivers/iommu/intel/iommu.h   |  1 -
>>    3 files changed, 31 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/iommu/intel/debugfs.c b/drivers/iommu/intel/debugfs.c
>> index d927ef10641b..f4acd8993f60 100644
>> --- a/drivers/iommu/intel/debugfs.c
>> +++ b/drivers/iommu/intel/debugfs.c
>> @@ -342,13 +342,13 @@ static void pgtable_walk_level(struct seq_file *m,
>> struct dma_pte *pde,
>>    	}
>>    }
>>
>> -static int show_device_domain_translation(struct device *dev, void *data)
>> +static int __show_device_domain_translation(struct device *dev, void *data)
>>    {
>> -	struct device_domain_info *info = dev_iommu_priv_get(dev);
>> -	struct dmar_domain *domain = info->domain;
>> +	struct dmar_domain *domain;
>>    	struct seq_file *m = data;
>>    	u64 path[6] = { 0 };
>>
>> +	domain = to_dmar_domain(iommu_get_domain_for_dev(dev));
>>    	if (!domain)
>>    		return 0;
>>
>> @@ -359,20 +359,38 @@ static int show_device_domain_translation(struct
>> device *dev, void *data)
>>    	pgtable_walk_level(m, domain->pgd, domain->agaw + 2, 0, path);
>>    	seq_putc(m, '\n');
>>
>> -	return 0;
>> +	return 1;
>>    }
>>
>> -static int domain_translation_struct_show(struct seq_file *m, void *unused)
>> +static int show_device_domain_translation(struct device *dev, void *data)
>>    {
>> -	unsigned long flags;
>> -	int ret;
>> +	struct iommu_group *group;
>>
>> -	spin_lock_irqsave(&device_domain_lock, flags);
>> -	ret = bus_for_each_dev(&pci_bus_type, NULL, m,
>> -			       show_device_domain_translation);
>> -	spin_unlock_irqrestore(&device_domain_lock, flags);
>> +	group = iommu_group_get(dev);
>> +	if (group) {
>> +		/*
>> +		 * The group->mutex is held across the callback, which will
>> +		 * block calls to iommu_attach/detach_group/device. Hence,
>> +		 * the domain of the device will not change during traversal.
>> +		 *
>> +		 * All devices in an iommu group share a single domain,
>> hence
>> +		 * we only dump the domain of the first device. Even though,
> bus_for_each_dev() will still lead to duplicated dump in the same group
> but probably we can leave with it for a debug interface.
> 

Yes. This is what it was. Ideally we could walk the iommu groups and
dump the device names belonging to the group and it's domain mappings,
but I was not willing to add any helpers in the iommu core just for a
debugfs use.

---
Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
