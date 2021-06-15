Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7603A7E57
	for <lists.iommu@lfdr.de>; Tue, 15 Jun 2021 14:42:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47D954055E;
	Tue, 15 Jun 2021 12:42:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rfeWqx-a-KS5; Tue, 15 Jun 2021 12:42:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id D742040540;
	Tue, 15 Jun 2021 12:42:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A5A09C0022;
	Tue, 15 Jun 2021 12:42:02 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 707E0C000B
 for <iommu@lists.linux-foundation.org>; Tue, 15 Jun 2021 12:42:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 519E06080C
 for <iommu@lists.linux-foundation.org>; Tue, 15 Jun 2021 12:42:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TVO2MskXqE8i for <iommu@lists.linux-foundation.org>;
 Tue, 15 Jun 2021 12:42:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3BDCB6058A
 for <iommu@lists.linux-foundation.org>; Tue, 15 Jun 2021 12:42:00 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6EBC51063;
 Tue, 15 Jun 2021 05:41:59 -0700 (PDT)
Received: from [10.57.9.136] (unknown [10.57.9.136])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5FDAC3F719;
 Tue, 15 Jun 2021 05:41:58 -0700 (PDT)
Subject: Re: [PATCH v3 3/6] iommu: Improve iommu_iotlb_gather helpers
To: Yong Wu <yong.wu@mediatek.com>, Nadav Amit <nadav.amit@gmail.com>
References: <20210607182541.119756-1-namit@vmware.com>
 <20210607182541.119756-4-namit@vmware.com>
 <1623760166.24285.1.camel@mhfsdcap03>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <5f176808-20ab-1d51-fcae-eb2307117f5b@arm.com>
Date: Tue, 15 Jun 2021 13:41:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <1623760166.24285.1.camel@mhfsdcap03>
Content-Language: en-GB
Cc: iommu@lists.linux-foundation.org, Will Deacon <will@kernel.org>,
 linux-kernel@vger.kernel.org, Jiajun Cao <caojiajun@vmware.com>
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

On 2021-06-15 13:29, Yong Wu wrote:
> On Mon, 2021-06-07 at 11:25 -0700, Nadav Amit wrote:
>> From: Robin Murphy <robin.murphy@arm.com>
>>
>> The Mediatek driver is not the only one which might want a basic
>> address-based gathering behaviour, so although it's arguably simple
>> enough to open-code, let's factor it out for the sake of cleanliness.
>> Let's also take this opportunity to document the intent of these
>> helpers for clarity.
>>
>> Cc: Joerg Roedel <joro@8bytes.org>
>> Cc: Will Deacon <will@kernel.org>
>> Cc: Jiajun Cao <caojiajun@vmware.com>
>> Cc: Robin Murphy <robin.murphy@arm.com>
>> Cc: Lu Baolu <baolu.lu@linux.intel.com>
>> Cc: iommu@lists.linux-foundation.org
>> Cc: linux-kernel@vger.kernel.org
>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
>>
>> ---
>>
>> Changes from Robin's version:
>> * Added iommu_iotlb_gather_add_range() stub !CONFIG_IOMMU_API
>> * Use iommu_iotlb_gather_add_range() in iommu_iotlb_gather_add_page()
>> ---
>>   drivers/iommu/mtk_iommu.c |  5 +----
>>   include/linux/iommu.h     | 43 ++++++++++++++++++++++++++++++++++-----
>>   2 files changed, 39 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
>> index e06b8a0e2b56..0af4a91ac7da 100644
>> --- a/drivers/iommu/mtk_iommu.c
>> +++ b/drivers/iommu/mtk_iommu.c
>> @@ -523,10 +523,7 @@ static size_t mtk_iommu_unmap(struct iommu_domain *domain,
>>   	struct mtk_iommu_domain *dom = to_mtk_domain(domain);
>>   	unsigned long end = iova + size - 1;
> 
> Please also help delete this "end".

Yes, that was part of my original patch - not sure what happened here :/

Robin.

>>   
>> -	if (gather->start > iova)
>> -		gather->start = iova;
>> -	if (gather->end < end)
>> -		gather->end = end;
>> +	iommu_iotlb_gather_add_range(gather, iova, size);
>>   	return dom->iop->unmap(dom->iop, iova, size, gather);
>>   }
> 
> [snip]
> 
> 
> _______________________________________________
> iommu mailing list
> iommu@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/iommu
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
