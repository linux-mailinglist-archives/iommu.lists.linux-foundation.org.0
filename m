Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBE53423F1
	for <lists.iommu@lfdr.de>; Fri, 19 Mar 2021 19:04:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1647D40163;
	Fri, 19 Mar 2021 18:04:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UTv3GxWzZ_Cn; Fri, 19 Mar 2021 18:04:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5DD2B4015D;
	Fri, 19 Mar 2021 18:04:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 33493C0010;
	Fri, 19 Mar 2021 18:04:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8885EC0001
 for <iommu@lists.linux-foundation.org>; Fri, 19 Mar 2021 18:04:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 803134EE42
 for <iommu@lists.linux-foundation.org>; Fri, 19 Mar 2021 18:04:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vTmBr51UrgWT for <iommu@lists.linux-foundation.org>;
 Fri, 19 Mar 2021 18:04:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B87924EE52
 for <iommu@lists.linux-foundation.org>; Fri, 19 Mar 2021 18:04:17 +0000 (UTC)
Received: from fraeml707-chm.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4F2BVc5JBFz681CR;
 Sat, 20 Mar 2021 01:59:36 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml707-chm.china.huawei.com (10.206.15.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Fri, 19 Mar 2021 19:04:14 +0100
Received: from [10.47.10.104] (10.47.10.104) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Fri, 19 Mar
 2021 18:04:13 +0000
Subject: Re: [PATCH 5/6] dma-mapping/iommu: Add dma_set_max_opt_size()
To: Robin Murphy <robin.murphy@arm.com>, <joro@8bytes.org>, <will@kernel.org>, 
 <jejb@linux.ibm.com>, <martin.petersen@oracle.com>, <hch@lst.de>,
 <m.szyprowski@samsung.com>
References: <1616160348-29451-1-git-send-email-john.garry@huawei.com>
 <1616160348-29451-6-git-send-email-john.garry@huawei.com>
 <9ecb6980-7f40-0333-572f-f9d4b8238353@arm.com>
From: John Garry <john.garry@huawei.com>
Message-ID: <e45a649f-f133-1f80-554a-3c5e955148e3@huawei.com>
Date: Fri, 19 Mar 2021 18:02:02 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <9ecb6980-7f40-0333-572f-f9d4b8238353@arm.com>
Content-Language: en-US
X-Originating-IP: [10.47.10.104]
X-ClientProxiedBy: lhreml717-chm.china.huawei.com (10.201.108.68) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 linux-scsi@vger.kernel.org, linuxarm@huawei.com
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

On 19/03/2021 17:00, Robin Murphy wrote:
> On 2021-03-19 13:25, John Garry wrote:
>> Add a function to allow the max size which we want to optimise DMA 
>> mappings
>> for.
> 
> It seems neat in theory - particularly for packet-based interfaces that 
> might have a known fixed size of data unit that they're working on at 
> any given time - but aren't there going to be many cases where the 
> driver has no idea because it depends on whatever size(s) of request 
> userspace happens to throw at it? Even if it does know the absolute 
> maximum size of thing it could ever transfer, that could be 
> impractically large in areas like video/AI/etc., so it could still be 
> hard to make a reasonable decision.

So if you consider the SCSI stack, which is my interest, we know the max 
segment size and we know the max number of segments per request, so we 
should know the theoretical upper limit of the actual IOVA length we can 
get.

Indeed, from my experiment on my SCSI host, max IOVA len is found to be 
507904, which is PAGE_SIZE * 124 (that is max sg ents there). 
Incidentally that means that we want RCACHE RANGE MAX of 8, not 6.

> 
> Being largely workload-dependent is why I still think this should be a 
> command-line or sysfs tuneable - we could set the default based on how 
> much total memory is available, but ultimately it's the end user who 
> knows what the workload is going to be and what they care about 
> optimising for.

If that hardware is only found in a server, then the extra memory cost 
would be trivial, so setting to max is standard approach.

> 
> Another thought (which I'm almost reluctant to share) is that I would 
> *love* to try implementing a self-tuning strategy that can detect high 
> contention on particular allocation sizes and adjust the caches on the 
> fly, but I can easily imagine that having enough inherent overhead to 
> end up being an impractical (but fun) waste of time.
> 

For now, I just want to recover the performance lost recently :)

Thanks,
John
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
