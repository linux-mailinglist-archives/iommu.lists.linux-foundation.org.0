Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id A7851356621
	for <lists.iommu@lfdr.de>; Wed,  7 Apr 2021 10:11:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A837848A1;
	Wed,  7 Apr 2021 08:11:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id THiA-OIvaloZ; Wed,  7 Apr 2021 08:11:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70CF7848EC;
	Wed,  7 Apr 2021 08:11:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 45BFEC000A;
	Wed,  7 Apr 2021 08:11:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 74024C000A
 for <iommu@lists.linux-foundation.org>; Wed,  7 Apr 2021 08:11:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5318D40227
 for <iommu@lists.linux-foundation.org>; Wed,  7 Apr 2021 08:11:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oCflVjBWJq5u for <iommu@lists.linux-foundation.org>;
 Wed,  7 Apr 2021 08:11:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EE919400BF
 for <iommu@lists.linux-foundation.org>; Wed,  7 Apr 2021 08:11:04 +0000 (UTC)
Received: from fraeml712-chm.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4FFcQr3sX9z687ng;
 Wed,  7 Apr 2021 16:05:56 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml712-chm.china.huawei.com (10.206.15.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 7 Apr 2021 10:11:02 +0200
Received: from [10.210.168.126] (10.210.168.126) by
 lhreml724-chm.china.huawei.com (10.201.108.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2106.2; Wed, 7 Apr 2021 09:11:01 +0100
Subject: Re: [PATCH 0/3] iommu/iova: Add CPU hotplug handler to flush rcaches
 to core code
To: Joerg Roedel <joro@8bytes.org>
References: <1614600741-15696-1-git-send-email-john.garry@huawei.com>
 <YG1noCU6pFQRC+yF@8bytes.org>
From: John Garry <john.garry@huawei.com>
Message-ID: <ed59d02d-e3dc-21dc-bc82-199988700d31@huawei.com>
Date: Wed, 7 Apr 2021 09:08:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <YG1noCU6pFQRC+yF@8bytes.org>
Content-Language: en-US
X-Originating-IP: [10.210.168.126]
X-ClientProxiedBy: lhreml703-chm.china.huawei.com (10.201.108.52) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
Cc: dwmw2@infradead.org, linux-kernel@vger.kernel.org, linuxarm@huawei.com,
 iommu@lists.linux-foundation.org, robin.murphy@arm.com, will@kernel.org
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

On 07/04/2021 09:04, Joerg Roedel wrote:
> On Mon, Mar 01, 2021 at 08:12:18PM +0800, John Garry wrote:
>> The Intel IOMMU driver supports flushing the per-CPU rcaches when a CPU is
>> offlined.
>>
>> Let's move it to core code, so everyone can take advantage.
>>
>> Also correct a code comment.
>>
>> Based on v5.12-rc1. Tested on arm64 only.
>>
>> John Garry (3):
>>    iova: Add CPU hotplug handler to flush rcaches
>>    iommu/vt-d: Remove IOVA domain rcache flushing for CPU offlining
>>    iova: Correct comment for free_cpu_cached_iovas()
>>
>>   drivers/iommu/intel/iommu.c | 31 -------------------------------
>>   drivers/iommu/iova.c        | 32 ++++++++++++++++++++++++++++++--
>>   include/linux/cpuhotplug.h  |  2 +-
>>   include/linux/iova.h        |  1 +
>>   4 files changed, 32 insertions(+), 34 deletions(-)
> 
> Applied, thanks.
> 
> .
> 

Thanks, but there was a v2 on this series. Not sure which you applied.

https://lore.kernel.org/linux-iommu/9aad6e94-ecb7-ca34-7f7d-3df6e43e9c42@huawei.com/T/#mbea81468782c75fa84744ad7a7801831a4c952e9

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
