Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1C12D0F44
	for <lists.iommu@lfdr.de>; Mon,  7 Dec 2020 12:37:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0CC7686CB0;
	Mon,  7 Dec 2020 11:37:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J_7ZdEa5Ij9i; Mon,  7 Dec 2020 11:37:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8BD9E86C78;
	Mon,  7 Dec 2020 11:37:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 68299C013B;
	Mon,  7 Dec 2020 11:37:19 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 54DB1C013B
 for <iommu@lists.linux-foundation.org>; Mon,  7 Dec 2020 11:37:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 3C49686C78
 for <iommu@lists.linux-foundation.org>; Mon,  7 Dec 2020 11:37:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id feZVP43ALxGY for <iommu@lists.linux-foundation.org>;
 Mon,  7 Dec 2020 11:37:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id BA3F88614A
 for <iommu@lists.linux-foundation.org>; Mon,  7 Dec 2020 11:37:15 +0000 (UTC)
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CqLqs5J27zhmfP;
 Mon,  7 Dec 2020 19:36:41 +0800 (CST)
Received: from [10.174.187.37] (10.174.187.37) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.487.0; Mon, 7 Dec 2020 19:37:05 +0800
Subject: Re: [PATCH] iommu: Up front sanity check in the arm_lpae_map
To: Will Deacon <will@kernel.org>
References: <20201205082957.12544-1-zhukeqian1@huawei.com>
 <20201207105900.GB4198@willie-the-truck>
From: zhukeqian <zhukeqian1@huawei.com>
Message-ID: <94799248-f9d1-3a2e-6b82-23d613d4e74b@huawei.com>
Date: Mon, 7 Dec 2020 19:37:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20201207105900.GB4198@willie-the-truck>
X-Originating-IP: [10.174.187.37]
X-CFilter-Loop: Reflected
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Marc Zyngier <maz@kernel.org>,
 jiangkunkun@huawei.com, linux-kernel@vger.kernel.org,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Alexios Zavras <alexios.zavras@intel.com>, iommu@lists.linux-foundation.org,
 Mark Brown <broonie@kernel.org>, James Morse <james.morse@arm.com>,
 Julien Thierry <julien.thierry.kdev@gmail.com>, Catalin
 Marinas <catalin.marinas@arm.com>, wanghaibin.wang@huawei.com, Thomas
 Gleixner <tglx@linutronix.de>, Robin
 Murphy <robin.murphy@arm.com>, Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org
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

Hi Will,

On 2020/12/7 18:59, Will Deacon wrote:
> On Sat, Dec 05, 2020 at 04:29:57PM +0800, Keqian Zhu wrote:
>> ... then we have more chance to detect wrong code logic.
> 
> This could do with being a bit more explicit. Something like:
> 
> 	Although handling a mapping request with no permissions is a
> 	trivial no-op, defer the early return until after the size/range
> 	checks so that we are consistent with other mapping requests.
This looks well, thanks.

> 
>> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
>> ---
>>  drivers/iommu/io-pgtable-arm.c | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
>> index a7a9bc08dcd1..8ade72adab31 100644
>> --- a/drivers/iommu/io-pgtable-arm.c
>> +++ b/drivers/iommu/io-pgtable-arm.c
>> @@ -444,10 +444,6 @@ static int arm_lpae_map(struct io_pgtable_ops *ops, unsigned long iova,
>>  	arm_lpae_iopte prot;
>>  	long iaext = (s64)iova >> cfg->ias;
>>  
>> -	/* If no access, then nothing to do */
>> -	if (!(iommu_prot & (IOMMU_READ | IOMMU_WRITE)))
>> -		return 0;
>> -
>>  	if (WARN_ON(!size || (size & cfg->pgsize_bitmap) != size))
>>  		return -EINVAL;
>>  
>> @@ -456,6 +452,10 @@ static int arm_lpae_map(struct io_pgtable_ops *ops, unsigned long iova,
>>  	if (WARN_ON(iaext || paddr >> cfg->oas))
>>  		return -ERANGE;
>>  
>> +	/* If no access, then nothing to do */
>> +	if (!(iommu_prot & (IOMMU_READ | IOMMU_WRITE)))
>> +		return 0;
> 
> This looks sensible to me, but please can you make the same change for
> io-pgtable-arm-v7s.c so that the behaviour is consistent across the two
> formats?
> 
OK. I can do it right now.


Thanks,
Keqian
> Thanks,
> 
> Will
> .
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
