Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC1B2BABA1
	for <lists.iommu@lfdr.de>; Fri, 20 Nov 2020 15:07:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 22421871BD;
	Fri, 20 Nov 2020 14:07:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sg7mAA2yAm-d; Fri, 20 Nov 2020 14:07:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7A57C871C3;
	Fri, 20 Nov 2020 14:07:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5763CC0891;
	Fri, 20 Nov 2020 14:07:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 04324C0891
 for <iommu@lists.linux-foundation.org>; Fri, 20 Nov 2020 14:07:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id C61E62E0E6
 for <iommu@lists.linux-foundation.org>; Fri, 20 Nov 2020 14:07:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q7CDWskDuAOQ for <iommu@lists.linux-foundation.org>;
 Fri, 20 Nov 2020 14:07:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by silver.osuosl.org (Postfix) with ESMTP id A6ED22E0EC
 for <iommu@lists.linux-foundation.org>; Fri, 20 Nov 2020 14:07:51 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A2B8611D4;
 Fri, 20 Nov 2020 06:07:50 -0800 (PST)
Received: from [10.57.59.159] (unknown [10.57.59.159])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B3F923F718;
 Fri, 20 Nov 2020 06:07:49 -0800 (PST)
Subject: Re: [PATCH] iommu: Check return of __iommu_attach_device()
To: Will Deacon <will@kernel.org>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
References: <20201119165846.34180-1-shameerali.kolothum.thodi@huawei.com>
 <20201120111503.GB6151@willie-the-truck>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <337ffd34-a606-4fb1-adb0-49367c136170@arm.com>
Date: Fri, 20 Nov 2020 14:07:26 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201120111503.GB6151@willie-the-truck>
Content-Language: en-GB
Cc: iommu@lists.linux-foundation.org, linuxarm@huawei.com,
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 2020-11-20 11:15, Will Deacon wrote:
> On Thu, Nov 19, 2020 at 04:58:46PM +0000, Shameer Kolothum wrote:
>> Currently iommu_create_device_direct_mappings() is called
>> without checking the return of __iommu_attach_device(). This
>> may result in failures in iommu driver if dev attach returns
>> error.
>>
>> Fixes: ce574c27ae27("iommu: Move iommu_group_create_direct_mappings() out of iommu_group_add_device()")
>> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
>> ---
>> Crash log:
>> [   31.353605] hns3 0000:7d:00.3: Adding to iommu group 10
>> [   31.358822] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000018
>> [   31.367567] Mem abort info:
>> [   31.370350]   ESR = 0x96000004
>> [   31.373391]   EC = 0x25: DABT (current EL), IL = 32 bits
>> [   31.378680]   SET = 0, FnV = 0
>> [   31.381720]   EA = 0, S1PTW = 0
>> [   31.384847] Data abort info:
>> [   31.387716]   ISV = 0, ISS = 0x00000004
>> [   31.391535]   CM = 0, WnR = 0
>> [   31.394491] [0000000000000018] user address but active_mm is swapper
>> [   31.400818] Internal error: Oops: 96000004 [#1] PREEMPT SMP
>> [   31.406365] Modules linked in:
>> [   31.409409] CPU: 21 PID: 1 Comm: swapper/0 Not tainted 5.10.0-rc4-00008-gdd5aba9d719-dirty #79
>> [   31.417980] Hardware name: Huawei TaiShan 200 (Model 2280)/BC82AMDD, BIOS 2280-V2 CS V3.B220.01 03/19/2020
>> [   31.427588] pstate: 00c00009 (nzcv daif +PAN +UAO -TCO BTYPE=--)
>> [   31.433566] pc : arm_smmu_tlb_inv_range+0x178/0x1f0
>> [   31.438422] lr : arm_smmu_tlb_inv_range+0x5c/0x1f0
>> [   31.443190] sp : ffff80001043b4e0
>> ...
>> [   31.531175] Call trace:
>> [   31.533613]  arm_smmu_tlb_inv_range+0x178/0x1f0
>> [   31.538122]  arm_smmu_iotlb_sync+0x2c/0x38
>> [   31.542200]  iommu_unmap+0x60/0x90
>> [   31.545585]  __iommu_map+0x110/0x1f0
>> [   31.549144]  iommu_create_device_direct_mappings.isra.34+0x1ac/0x250
>> [   31.555468]  iommu_probe_device+0x6c/0x110
>> [   31.559551]  iort_iommu_configure_id+0x114/0x218
>> [   31.564148]  acpi_dma_configure_id+0x94/0xe0
>> [   31.568402]  pci_dma_configure+0xc8/0xf0
>> [   31.572310]  really_probe+0xd4/0x3e0
>> [   31.575871]  driver_probe_device+0x5c/0xc0
>>
>> ---
>>   drivers/iommu/iommu.c | 10 ++++++----
>>   1 file changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
>> index b53446bb8c6b..0f4dc25d46c9 100644
>> --- a/drivers/iommu/iommu.c
>> +++ b/drivers/iommu/iommu.c
>> @@ -264,16 +264,18 @@ int iommu_probe_device(struct device *dev)
>>   	 */
>>   	iommu_alloc_default_domain(group, dev);
>>   
>> -	if (group->default_domain)
>> +	if (group->default_domain) {
>>   		ret = __iommu_attach_device(group->default_domain, dev);
>> +		if (ret) {
>> +			iommu_group_put(group);
>> +			goto err_release;
>> +		}
>> +	}
> 
> This looks sensible to me, but what I don't understand is where that
> NULL pointer is coming from in the first place. iommu_map() operates
> on the domain, so why does it matter if the attach fails? What is being
> accessed at arm_smmu_tlb_inv_range+0x178/0x1f0 ?

Probably because the domain is a hollow fake until the first successful 
attach - even TLB maintenance depends on having decided a pagetable format.

Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
