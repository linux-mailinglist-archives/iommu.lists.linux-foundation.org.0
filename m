Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id CA272545C13
	for <lists.iommu@lfdr.de>; Fri, 10 Jun 2022 08:05:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 26E0A840A4;
	Fri, 10 Jun 2022 06:05:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8WYGnucd-IwU; Fri, 10 Jun 2022 06:05:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 178CE823E3;
	Fri, 10 Jun 2022 06:05:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DC73FC002D;
	Fri, 10 Jun 2022 06:05:45 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E401FC002D
 for <iommu@lists.linux-foundation.org>; Fri, 10 Jun 2022 06:05:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BEF2F402A8
 for <iommu@lists.linux-foundation.org>; Fri, 10 Jun 2022 06:05:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=intel.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jcd9ZVGpjmk7 for <iommu@lists.linux-foundation.org>;
 Fri, 10 Jun 2022 06:05:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AFF3A40195
 for <iommu@lists.linux-foundation.org>; Fri, 10 Jun 2022 06:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654841142; x=1686377142;
 h=message-id:date:mime-version:cc:subject:to:references:
 from:in-reply-to:content-transfer-encoding;
 bh=eo+xtNQ4i2z7QGjeoSzqRoqCbvEk7b9xZryoSlqN2EQ=;
 b=lXxFLEXKndW70aDCt8X8xgjb8cg1ijneEr0ZL2ZXoJ3qXMjL0E+kB3+P
 dQafBjpGNYjpm1YbkxayiXjcsUCBgfMdf3exgsFgGSK0Ss7otHQrNGRiz
 gBBGhNeN+hzbF6Eq8XpRKcvxW5Zc4L6HBKVIZzDd0EE0vAogUHImv095F
 zdLBtVYndrzXhi9sGTSyTzztu4kuPSXfJRpQmWz6fp46z7tYpKIWiAcbs
 6bHvutCsLtwFiCTCtyIHYUR1LbOwKBBkaAvv/rAYB6O/xjsRXGsaJyn4Q
 mNkE402Iowk92PT5BAmCGM3dGElbj255jKvZYGQDAyTIevmKsE7/KhMc6 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="277559612"
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; d="scan'208";a="277559612"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2022 23:05:42 -0700
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; d="scan'208";a="637955004"
Received: from chengxu1-mobl2.ccr.corp.intel.com (HELO [10.249.169.148])
 ([10.249.169.148])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2022 23:05:39 -0700
Message-ID: <2ada3a4f-3c2a-f46f-4e39-5c60912cc386@linux.intel.com>
Date: Fri, 10 Jun 2022 14:05:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RFC PATCHES 1/2] iommu: Add RCU-protected page free support
Content-Language: en-US
To: "Raj, Ashok" <ashok.raj@intel.com>
References: <20220609070811.902868-1-baolu.lu@linux.intel.com>
 <20220609170644.GA33363@araj-dh-work>
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <20220609170644.GA33363@araj-dh-work>
Cc: Kevin Tian <kevin.tian@intel.com>, Will Deacon <will@kernel.org>,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 iommu@lists.linux-foundation.org, Jason Gunthorpe <jgg@nvidia.com>,
 Joao Martins <joao.m.martins@oracle.com>, Robin Murphy <robin.murphy@arm.com>
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

On 2022/6/10 01:06, Raj, Ashok wrote:
> On Thu, Jun 09, 2022 at 03:08:10PM +0800, Lu Baolu wrote:
>> The IOMMU page tables are updated using iommu_map/unmap() interfaces.
>> Currently, there is no mandatory requirement for drivers to use locks
>> to ensure concurrent updates to page tables, because it's assumed that
>> overlapping IOVA ranges do not have concurrent updates. Therefore the
>> IOMMU drivers only need to take care of concurrent updates to level
>> page table entries.
> 
> The last part doesn't read well..
> s/updates to level page table entries/ updates to page-table entries at the
> same level
> 
>>
>> But enabling new features challenges this assumption. For example, the
>> hardware assisted dirty page tracking feature requires scanning page
>> tables in interfaces other than mapping and unmapping. This might result
>> in a use-after-free scenario in which a level page table has been freed
>> by the unmap() interface, while another thread is scanning the next level
>> page table.
>>
>> This adds RCU-protected page free support so that the pages are really
>> freed and reused after a RCU grace period. Hence, the page tables are
>> safe for scanning within a rcu_read_lock critical region. Considering
>> that scanning the page table is a rare case, this also adds a domain
>> flag and the RCU-protected page free is only used when this flat is set.
> 
> s/flat/flag

Above updated. Thank you!

>>
>> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
>> ---
>>   include/linux/iommu.h |  9 +++++++++
>>   drivers/iommu/iommu.c | 23 +++++++++++++++++++++++
>>   2 files changed, 32 insertions(+)
>>
>> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
>> index 5e1afe169549..6f68eabb8567 100644
>> --- a/include/linux/iommu.h
>> +++ b/include/linux/iommu.h
>> @@ -95,6 +95,7 @@ struct iommu_domain {
>>   	void *handler_token;
>>   	struct iommu_domain_geometry geometry;
>>   	struct iommu_dma_cookie *iova_cookie;
>> +	unsigned long concurrent_traversal:1;
> 
> Does this need to be a bitfield? Even though you are needing just one bit
> now, you can probably make have maskbits?
> 

As discussed in another reply, I am about to drop the driver opt-in and
wrapper the helper around the iommu_iotlb_gather.

> 
>>   };
>>   
>>   static inline bool iommu_is_dma_domain(struct iommu_domain *domain)
>> @@ -657,6 +658,12 @@ static inline void dev_iommu_priv_set(struct device *dev, void *priv)
>>   	dev->iommu->priv = priv;
>>   }
>>   
>> +static inline void domain_set_concurrent_traversal(struct iommu_domain *domain,
>> +						   bool value)
>> +{
>> +	domain->concurrent_traversal = value;
>> +}
>> +
>>   int iommu_probe_device(struct device *dev);
>>   void iommu_release_device(struct device *dev);
>>   
>> @@ -677,6 +684,8 @@ int iommu_group_claim_dma_owner(struct iommu_group *group, void *owner);
>>   void iommu_group_release_dma_owner(struct iommu_group *group);
>>   bool iommu_group_dma_owner_claimed(struct iommu_group *group);
>>   
>> +void iommu_free_pgtbl_pages(struct iommu_domain *domain,
>> +			    struct list_head *pages);
>>   #else /* CONFIG_IOMMU_API */
>>   
>>   struct iommu_ops {};
>> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
>> index 847ad47a2dfd..ceeb97ebe3e2 100644
>> --- a/drivers/iommu/iommu.c
>> +++ b/drivers/iommu/iommu.c
>> @@ -3252,3 +3252,26 @@ bool iommu_group_dma_owner_claimed(struct iommu_group *group)
>>   	return user;
>>   }
>>   EXPORT_SYMBOL_GPL(iommu_group_dma_owner_claimed);
>> +
>> +static void pgtble_page_free_rcu(struct rcu_head *rcu)
> 
> maybe the names can be consistent? pgtble_ vs pgtbl below.
> 
> vote to drop the 'e' :-)

Updated.

> 
>> +{
>> +	struct page *page = container_of(rcu, struct page, rcu_head);
>> +
>> +	__free_pages(page, 0);
>> +}
>> +
>> +void iommu_free_pgtbl_pages(struct iommu_domain *domain,
>> +			    struct list_head *pages)
>> +{
>> +	struct page *page, *next;
>> +
>> +	if (!domain->concurrent_traversal) {
>> +		put_pages_list(pages);
>> +		return;
>> +	}
>> +
>> +	list_for_each_entry_safe(page, next, pages, lru) {
>> +		list_del(&page->lru);
>> +		call_rcu(&page->rcu_head, pgtble_page_free_rcu);
>> +	}
>> +}
>> -- 
>> 2.25.1
>>

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
