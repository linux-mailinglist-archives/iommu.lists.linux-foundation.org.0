Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 944CA25D580
	for <lists.iommu@lfdr.de>; Fri,  4 Sep 2020 11:58:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 27F16866B1;
	Fri,  4 Sep 2020 09:58:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d+ZdG+pprJDo; Fri,  4 Sep 2020 09:58:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id ED9348620B;
	Fri,  4 Sep 2020 09:58:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E26D9C0890;
	Fri,  4 Sep 2020 09:58:19 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 897E2C0051
 for <iommu@lists.linux-foundation.org>; Fri,  4 Sep 2020 09:58:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 785A1858B5
 for <iommu@lists.linux-foundation.org>; Fri,  4 Sep 2020 09:58:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0THtaf2XzluD for <iommu@lists.linux-foundation.org>;
 Fri,  4 Sep 2020 09:58:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by whitealder.osuosl.org (Postfix) with ESMTP id 6821F84854
 for <iommu@lists.linux-foundation.org>; Fri,  4 Sep 2020 09:58:17 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9D168101E;
 Fri,  4 Sep 2020 02:58:16 -0700 (PDT)
Received: from [10.57.40.122] (unknown [10.57.40.122])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AAC993F66F;
 Fri,  4 Sep 2020 02:58:15 -0700 (PDT)
Subject: Re: [PATCH] iommu/iova: Replace cmpxchg with xchg in queue_iova
To: Joerg Roedel <joro@8bytes.org>, Shaokun Zhang <zhangshaokun@hisilicon.com>
References: <1598517834-30275-1-git-send-email-zhangshaokun@hisilicon.com>
 <20200904093732.GN6714@8bytes.org>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <208d2f74-1a04-f01e-b885-c175b0480784@arm.com>
Date: Fri, 4 Sep 2020 10:58:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200904093732.GN6714@8bytes.org>
Content-Language: en-GB
Cc: Yuqi Jin <jinyuqi@huawei.com>, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org
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

Hi Joerg,

On 2020-09-04 10:37, Joerg Roedel wrote:
> Adding Robin.

Did you miss that I've reviewed this already? :)

https://lore.kernel.org/linux-iommu/3afcc7b2-0bfb-b79c-513f-1beb66c5f164@arm.com/

Robin.

> On Thu, Aug 27, 2020 at 04:43:54PM +0800, Shaokun Zhang wrote:
>> From: Yuqi Jin <jinyuqi@huawei.com>
>>
>> The performance of the atomic_xchg is better than atomic_cmpxchg because
>> no comparison is required. While the value of @fq_timer_on can only be 0
>> or 1. Let's use atomic_xchg instead of atomic_cmpxchg here because we
>> only need to check that the value changes from 0 to 1 or from 1 to 1.
>>
>> Cc: Joerg Roedel <joro@8bytes.org>
>> Signed-off-by: Yuqi Jin <jinyuqi@huawei.com>
>> Signed-off-by: Shaokun Zhang <zhangshaokun@hisilicon.com>
>> ---
>>   drivers/iommu/iova.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/iommu/iova.c b/drivers/iommu/iova.c
>> index 45a251da5453..30d969a4c5fd 100644
>> --- a/drivers/iommu/iova.c
>> +++ b/drivers/iommu/iova.c
>> @@ -579,7 +579,7 @@ void queue_iova(struct iova_domain *iovad,
>>   
>>   	/* Avoid false sharing as much as possible. */
>>   	if (!atomic_read(&iovad->fq_timer_on) &&
>> -	    !atomic_cmpxchg(&iovad->fq_timer_on, 0, 1))
>> +	    !atomic_xchg(&iovad->fq_timer_on, 1))
>>   		mod_timer(&iovad->fq_timer,
>>   			  jiffies + msecs_to_jiffies(IOVA_FQ_TIMEOUT));
>>   }
>> -- 
>> 2.7.4
> _______________________________________________
> iommu mailing list
> iommu@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/iommu
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
