Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D713296AB
	for <lists.iommu@lfdr.de>; Tue,  2 Mar 2021 08:42:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9CE083ED4;
	Tue,  2 Mar 2021 07:42:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DVlHwftA6ztv; Tue,  2 Mar 2021 07:42:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A72183ED5;
	Tue,  2 Mar 2021 07:42:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6AA60C0001;
	Tue,  2 Mar 2021 07:42:36 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DFD66C0001
 for <iommu@lists.linux-foundation.org>; Tue,  2 Mar 2021 07:42:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC7996F65A
 for <iommu@lists.linux-foundation.org>; Tue,  2 Mar 2021 07:42:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ay9wbJLmq9AV for <iommu@lists.linux-foundation.org>;
 Tue,  2 Mar 2021 07:42:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ECBEE6F646
 for <iommu@lists.linux-foundation.org>; Tue,  2 Mar 2021 07:42:30 +0000 (UTC)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DqTZP1nWGz16FVl;
 Tue,  2 Mar 2021 15:40:45 +0800 (CST)
Received: from [10.174.184.42] (10.174.184.42) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.498.0; Tue, 2 Mar 2021 15:42:18 +0800
Subject: Re: [RFC PATCH 01/11] iommu/arm-smmu-v3: Add feature detection for
 HTTU
To: Robin Murphy <robin.murphy@arm.com>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <kvm@vger.kernel.org>,
 <kvmarm@lists.cs.columbia.edu>, <iommu@lists.linux-foundation.org>, "Will
 Deacon" <will@kernel.org>, Alex Williamson <alex.williamson@redhat.com>,
 "Marc Zyngier" <maz@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>
References: <20210128151742.18840-1-zhukeqian1@huawei.com>
 <20210128151742.18840-2-zhukeqian1@huawei.com>
 <f8be5718-d4d9-0565-eaf0-b5a128897d15@arm.com>
From: Keqian Zhu <zhukeqian1@huawei.com>
Message-ID: <3b347f75-2e53-1f89-a76d-1f328766cf5f@huawei.com>
Date: Tue, 2 Mar 2021 15:42:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <f8be5718-d4d9-0565-eaf0-b5a128897d15@arm.com>
X-Originating-IP: [10.174.184.42]
X-CFilter-Loop: Reflected
Cc: Mark Rutland <mark.rutland@arm.com>, jiangkunkun@huawei.com, Suzuki K
 Poulose <suzuki.poulose@arm.com>, Cornelia Huck <cohuck@redhat.com>,
 lushenming@huawei.com, Kirti Wankhede <kwankhede@nvidia.com>,
 James Morse <james.morse@arm.com>, wanghaibin.wang@huawei.com
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

Hi Robin,

I am going to send v2 at next week, to addresses these issues reported by you. Many thanks!
And do you have any further comments on patch #4 #5 and #6?

Thanks,
Keqian

On 2021/2/5 3:50, Robin Murphy wrote:
> On 2021-01-28 15:17, Keqian Zhu wrote:
>> From: jiangkunkun <jiangkunkun@huawei.com>
>>
>> The SMMU which supports HTTU (Hardware Translation Table Update) can
>> update the access flag and the dirty state of TTD by hardware. It is
>> essential to track dirty pages of DMA.
>>
>> This adds feature detection, none functional change.
>>
>> Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
>> Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
>> ---
>>   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 16 ++++++++++++++++
>>   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |  8 ++++++++
>>   include/linux/io-pgtable.h                  |  1 +
>>   3 files changed, 25 insertions(+)
>>
>> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
>> index 8ca7415d785d..0f0fe71cc10d 100644
>> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
>> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
>> @@ -1987,6 +1987,7 @@ static int arm_smmu_domain_finalise(struct iommu_domain *domain,
>>           .pgsize_bitmap    = smmu->pgsize_bitmap,
>>           .ias        = ias,
>>           .oas        = oas,
>> +        .httu_hd    = smmu->features & ARM_SMMU_FEAT_HTTU_HD,
>>           .coherent_walk    = smmu->features & ARM_SMMU_FEAT_COHERENCY,
>>           .tlb        = &arm_smmu_flush_ops,
>>           .iommu_dev    = smmu->dev,
>> @@ -3224,6 +3225,21 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
>>       if (reg & IDR0_HYP)
>>           smmu->features |= ARM_SMMU_FEAT_HYP;
>>   +    switch (FIELD_GET(IDR0_HTTU, reg)) {
> 
> We need to accommodate the firmware override as well if we need this to be meaningful. Jean-Philippe is already carrying a suitable patch in the SVA stack[1].
> 
>> +    case IDR0_HTTU_NONE:
>> +        break;
>> +    case IDR0_HTTU_HA:
>> +        smmu->features |= ARM_SMMU_FEAT_HTTU_HA;
>> +        break;
>> +    case IDR0_HTTU_HAD:
>> +        smmu->features |= ARM_SMMU_FEAT_HTTU_HA;
>> +        smmu->features |= ARM_SMMU_FEAT_HTTU_HD;
>> +        break;
>> +    default:
>> +        dev_err(smmu->dev, "unknown/unsupported HTTU!\n");
>> +        return -ENXIO;
>> +    }
>> +
>>       /*
>>        * The coherency feature as set by FW is used in preference to the ID
>>        * register, but warn on mismatch.
>> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
>> index 96c2e9565e00..e91bea44519e 100644
>> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
>> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
>> @@ -33,6 +33,10 @@
>>   #define IDR0_ASID16            (1 << 12)
>>   #define IDR0_ATS            (1 << 10)
>>   #define IDR0_HYP            (1 << 9)
>> +#define IDR0_HTTU            GENMASK(7, 6)
>> +#define IDR0_HTTU_NONE            0
>> +#define IDR0_HTTU_HA            1
>> +#define IDR0_HTTU_HAD            2
>>   #define IDR0_COHACC            (1 << 4)
>>   #define IDR0_TTF            GENMASK(3, 2)
>>   #define IDR0_TTF_AARCH64        2
>> @@ -286,6 +290,8 @@
>>   #define CTXDESC_CD_0_TCR_TBI0        (1ULL << 38)
>>     #define CTXDESC_CD_0_AA64        (1UL << 41)
>> +#define CTXDESC_CD_0_HD            (1UL << 42)
>> +#define CTXDESC_CD_0_HA            (1UL << 43)
>>   #define CTXDESC_CD_0_S            (1UL << 44)
>>   #define CTXDESC_CD_0_R            (1UL << 45)
>>   #define CTXDESC_CD_0_A            (1UL << 46)
>> @@ -604,6 +610,8 @@ struct arm_smmu_device {
>>   #define ARM_SMMU_FEAT_RANGE_INV        (1 << 15)
>>   #define ARM_SMMU_FEAT_BTM        (1 << 16)
>>   #define ARM_SMMU_FEAT_SVA        (1 << 17)
>> +#define ARM_SMMU_FEAT_HTTU_HA        (1 << 18)
>> +#define ARM_SMMU_FEAT_HTTU_HD        (1 << 19)
>>       u32                features;
>>     #define ARM_SMMU_OPT_SKIP_PREFETCH    (1 << 0)
>> diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
>> index ea727eb1a1a9..1a00ea8562c7 100644
>> --- a/include/linux/io-pgtable.h
>> +++ b/include/linux/io-pgtable.h
>> @@ -97,6 +97,7 @@ struct io_pgtable_cfg {
>>       unsigned long            pgsize_bitmap;
>>       unsigned int            ias;
>>       unsigned int            oas;
>> +    bool                httu_hd;
> 
> This is very specific to the AArch64 stage 1 format, not a generic capability - I think it should be a quirk flag rather than a common field.
> 
> Robin.
> 
> [1] https://jpbrucker.net/git/linux/commit/?h=sva/current&id=1ef7d512fb9082450dfe0d22ca4f7e35625a097b
> 
>>       bool                coherent_walk;
>>       const struct iommu_flush_ops    *tlb;
>>       struct device            *iommu_dev;
>>
> .
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
