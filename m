Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 372E82FA1B1
	for <lists.iommu@lfdr.de>; Mon, 18 Jan 2021 14:35:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E4ECE861F4;
	Mon, 18 Jan 2021 13:34:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hMy6HoCLEVrN; Mon, 18 Jan 2021 13:34:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 795748669D;
	Mon, 18 Jan 2021 13:34:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 61BD2C0FA8;
	Mon, 18 Jan 2021 13:34:57 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D787DC013A
 for <iommu@lists.linux-foundation.org>; Mon, 18 Jan 2021 13:34:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B4E7220408
 for <iommu@lists.linux-foundation.org>; Mon, 18 Jan 2021 13:34:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PpK4VpLTRCFl for <iommu@lists.linux-foundation.org>;
 Mon, 18 Jan 2021 13:34:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by silver.osuosl.org (Postfix) with ESMTPS id 03D6B203FA
 for <iommu@lists.linux-foundation.org>; Mon, 18 Jan 2021 13:34:51 +0000 (UTC)
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4DKCRT3Mnqz7Wql;
 Mon, 18 Jan 2021 21:33:41 +0800 (CST)
Received: from [10.174.184.42] (10.174.184.42) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.498.0; Mon, 18 Jan 2021 21:34:38 +0800
Subject: Re: [PATCH 3/6] vfio/iommu_type1: Initially set the
 pinned_page_dirty_scope
To: Alex Williamson <alex.williamson@redhat.com>
References: <20210107044401.19828-1-zhukeqian1@huawei.com>
 <20210107044401.19828-4-zhukeqian1@huawei.com>
 <20210115163041.704a4e9d@omen.home.shazbot.org>
From: Keqian Zhu <zhukeqian1@huawei.com>
Message-ID: <bc343f12-e9be-7d67-f220-5da1d02038fa@huawei.com>
Date: Mon, 18 Jan 2021 21:34:36 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20210115163041.704a4e9d@omen.home.shazbot.org>
X-Originating-IP: [10.174.184.42]
X-CFilter-Loop: Reflected
Cc: Mark Rutland <mark.rutland@arm.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>, kvm@vger.kernel.org,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Marc Zyngier <maz@kernel.org>,
 Cornelia Huck <cohuck@redhat.com>, linux-kernel@vger.kernel.org,
 Alexios Zavras <alexios.zavras@intel.com>, iommu@lists.linux-foundation.org,
 James Morse <james.morse@arm.com>,
 Julien Thierry <julien.thierry.kdev@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, wanghaibin.wang@huawei.com, Thomas
 Gleixner <tglx@linutronix.de>, jiangkunkun@huawei.com, Will
 Deacon <will@kernel.org>, kvmarm@lists.cs.columbia.edu,
 linux-arm-kernel@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>



On 2021/1/16 7:30, Alex Williamson wrote:
> On Thu, 7 Jan 2021 12:43:58 +0800
> Keqian Zhu <zhukeqian1@huawei.com> wrote:
> 
>> For now there are 3 ways to promote the pinned_page_dirty_scope
>> status of vfio_iommu:
>>
>> 1. Through vfio pin interface.
>> 2. Detach a group without pinned_dirty_scope.
>> 3. Attach a group with pinned_dirty_scope.
>>
>> For point 3, the only chance to promote the pinned_page_dirty_scope
>> status is when vfio_iommu is newly created. As we can safely set
>> empty vfio_iommu to be at pinned status, then the point 3 can be
>> removed to reduce operations.
>>
>> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
>> ---
>>  drivers/vfio/vfio_iommu_type1.c | 4 +---
>>  1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
>> index 110ada24ee91..b596c482487b 100644
>> --- a/drivers/vfio/vfio_iommu_type1.c
>> +++ b/drivers/vfio/vfio_iommu_type1.c
>> @@ -2045,11 +2045,8 @@ static int vfio_iommu_type1_attach_group(void *iommu_data,
>>  			 * Non-iommu backed group cannot dirty memory directly,
>>  			 * it can only use interfaces that provide dirty
>>  			 * tracking.
>> -			 * The iommu scope can only be promoted with the
>> -			 * addition of a dirty tracking group.
>>  			 */
>>  			group->pinned_page_dirty_scope = true;
>> -			promote_pinned_page_dirty_scope(iommu);
>>  			mutex_unlock(&iommu->lock);
>>  
>>  			return 0;
>> @@ -2436,6 +2433,7 @@ static void *vfio_iommu_type1_open(unsigned long arg)
>>  	INIT_LIST_HEAD(&iommu->iova_list);
>>  	iommu->dma_list = RB_ROOT;
>>  	iommu->dma_avail = dma_entry_limit;
>> +	iommu->pinned_page_dirty_scope = true;
>>  	mutex_init(&iommu->lock);
>>  	BLOCKING_INIT_NOTIFIER_HEAD(&iommu->notifier);
>>  
> 
> This would be resolved automatically if we used the counter approach I
> mentioned on the previous patch, adding a pinned-page scope group simply
> wouldn't increment the iommu counter, which would initially be zero
> indicating no "all-dma" groups.  Thanks,
> 
Sure, I will do that, thanks.

Keqian.

> Alex
> 
> .
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
