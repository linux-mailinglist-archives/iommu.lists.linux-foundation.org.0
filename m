Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 281BD2FA20A
	for <lists.iommu@lfdr.de>; Mon, 18 Jan 2021 14:48:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9324C20466;
	Mon, 18 Jan 2021 13:48:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K2rX8RIFUGex; Mon, 18 Jan 2021 13:48:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 460DC20457;
	Mon, 18 Jan 2021 13:48:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 228BFC013A;
	Mon, 18 Jan 2021 13:48:23 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2BB67C013A
 for <iommu@lists.linux-foundation.org>; Mon, 18 Jan 2021 13:48:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 110E885B5D
 for <iommu@lists.linux-foundation.org>; Mon, 18 Jan 2021 13:48:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dz0Qxp8tv39Z for <iommu@lists.linux-foundation.org>;
 Mon, 18 Jan 2021 13:48:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by whitealder.osuosl.org (Postfix) with ESMTPS id C354485ADB
 for <iommu@lists.linux-foundation.org>; Mon, 18 Jan 2021 13:48:17 +0000 (UTC)
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DKCkZ544QzMLhC;
 Mon, 18 Jan 2021 21:46:46 +0800 (CST)
Received: from [10.174.184.42] (10.174.184.42) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.498.0; Mon, 18 Jan 2021 21:48:03 +0800
Subject: Re: [PATCH 6/6] vfio/iommu_type1: Drop parameter "pgsize" of
 update_user_bitmap
To: Alex Williamson <alex.williamson@redhat.com>
References: <20210107044401.19828-1-zhukeqian1@huawei.com>
 <20210107044401.19828-7-zhukeqian1@huawei.com>
 <20210115164409.3e7ddb28@omen.home.shazbot.org>
From: Keqian Zhu <zhukeqian1@huawei.com>
Message-ID: <279c11d9-e79b-2057-3e0c-ac12ab6d917e@huawei.com>
Date: Mon, 18 Jan 2021 21:48:02 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20210115164409.3e7ddb28@omen.home.shazbot.org>
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



On 2021/1/16 7:44, Alex Williamson wrote:
> On Thu, 7 Jan 2021 12:44:01 +0800
> Keqian Zhu <zhukeqian1@huawei.com> wrote:
> 
>> We always use the smallest supported page size of vfio_iommu as
>> pgsize. Drop parameter "pgsize" of update_user_bitmap.
>>
>> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
>> ---
>>  drivers/vfio/vfio_iommu_type1.c | 9 ++++-----
>>  1 file changed, 4 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
>> index 82649a040148..bceda5e8baaa 100644
>> --- a/drivers/vfio/vfio_iommu_type1.c
>> +++ b/drivers/vfio/vfio_iommu_type1.c
>> @@ -978,10 +978,9 @@ static void vfio_update_pgsize_bitmap(struct vfio_iommu *iommu)
>>  }
>>  
>>  static int update_user_bitmap(u64 __user *bitmap, struct vfio_iommu *iommu,
>> -			      struct vfio_dma *dma, dma_addr_t base_iova,
>> -			      size_t pgsize)
>> +			      struct vfio_dma *dma, dma_addr_t base_iova)
>>  {
>> -	unsigned long pgshift = __ffs(pgsize);
>> +	unsigned long pgshift = __ffs(iommu->pgsize_bitmap);
>>  	unsigned long nbits = dma->size >> pgshift;
>>  	unsigned long bit_offset = (dma->iova - base_iova) >> pgshift;
>>  	unsigned long copy_offset = bit_offset / BITS_PER_LONG;
>> @@ -1046,7 +1045,7 @@ static int vfio_iova_dirty_bitmap(u64 __user *bitmap, struct vfio_iommu *iommu,
>>  		if (dma->iova > iova + size - 1)
>>  			break;
>>  
>> -		ret = update_user_bitmap(bitmap, iommu, dma, iova, pgsize);
>> +		ret = update_user_bitmap(bitmap, iommu, dma, iova);
>>  		if (ret)
>>  			return ret;
>>  
>> @@ -1192,7 +1191,7 @@ static int vfio_dma_do_unmap(struct vfio_iommu *iommu,
>>  
>>  		if (unmap->flags & VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP) {
>>  			ret = update_user_bitmap(bitmap->data, iommu, dma,
>> -						 unmap->iova, pgsize);
>> +						 unmap->iova);
>>  			if (ret)
>>  				break;
>>  		}
> 
> Same as the previous, both call sites already have both pgsize and
> pgshift, pass both rather than recalculate.  Thanks,
> 
My idea is that the "pgsize" parameter goes here and there, disturbs our sight when read code.
To be frankly, the recalculate is negligible. Or we can add new fields in vfio_iommu, which are
updated in vfio_update_pgsize_bitmap().

Thanks,
Keqian



> Alex
> 
> .
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
