Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B4B26FF23
	for <lists.iommu@lfdr.de>; Fri, 18 Sep 2020 15:51:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 2776A2E1FF;
	Fri, 18 Sep 2020 13:51:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pyyzjZT67d-F; Fri, 18 Sep 2020 13:51:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id EBA5B20109;
	Fri, 18 Sep 2020 13:51:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D9465C0051;
	Fri, 18 Sep 2020 13:51:39 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 059BCC0051
 for <iommu@lists.linux-foundation.org>; Fri, 18 Sep 2020 13:51:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 00F3F8714D
 for <iommu@lists.linux-foundation.org>; Fri, 18 Sep 2020 13:51:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X0SI1niJHNAh for <iommu@lists.linux-foundation.org>;
 Fri, 18 Sep 2020 13:51:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 257658712E
 for <iommu@lists.linux-foundation.org>; Fri, 18 Sep 2020 13:51:35 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3797330E;
 Fri, 18 Sep 2020 06:51:34 -0700 (PDT)
Received: from [10.57.47.84] (unknown [10.57.47.84])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 603C83F718;
 Fri, 18 Sep 2020 06:51:33 -0700 (PDT)
Subject: Re: [PATCH] Handle init_iova_flush_queue failure in dma-iommu path
To: Joerg Roedel <joro@8bytes.org>, Tom Murphy <murphyt7@tcd.ie>
References: <20200910122539.3662-1-murphyt7@tcd.ie>
 <20200918085501.GJ31590@8bytes.org>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <82d5f9c9-1001-3ed3-05f2-1a3b87ca023d@arm.com>
Date: Fri, 18 Sep 2020 14:51:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <20200918085501.GJ31590@8bytes.org>
Content-Language: en-GB
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
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

On 2020-09-18 09:55, Joerg Roedel wrote:
> On Thu, Sep 10, 2020 at 01:25:38PM +0100, Tom Murphy wrote:
>> init_iova_flush_queue can fail if we run out of memory. Fall back to noflush
>>   queue if it fails.
>>
>> Signed-off-by: Tom Murphy <murphyt7@tcd.ie>
>> ---
>>   drivers/iommu/dma-iommu.c | 7 +++++--
>>   1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
>> index 4959f5df21bd..5f69126f3e91 100644
>> --- a/drivers/iommu/dma-iommu.c
>> +++ b/drivers/iommu/dma-iommu.c
>> @@ -343,8 +343,11 @@ static int iommu_dma_init_domain(struct iommu_domain *domain, dma_addr_t base,
>>   
>>   	if (!cookie->fq_domain && !iommu_domain_get_attr(domain,
>>   			DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE, &attr) && attr) {
>> -		cookie->fq_domain = domain;
>> -		init_iova_flush_queue(iovad, iommu_dma_flush_iotlb_all, NULL);
>> +		if (init_iova_flush_queue(iovad, iommu_dma_flush_iotlb_all,
>> +					NULL))
>> +			pr_warn("iova flush queue initialization failed\n");
>> +		else
>> +			cookie->fq_domain = domain;
>>   	}
>>   
>>   	if (!dev)
> 
> Looks good to me, but Robin should also have a look.

Yup, seems reasonable, thanks Tom!

Reviewed-by: Robin Murphy <robin.murphy@arm.com>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
