Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 889BA8E493
	for <lists.iommu@lfdr.de>; Thu, 15 Aug 2019 07:46:17 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 3D0C8B6D;
	Thu, 15 Aug 2019 05:46:16 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 4502C723
	for <iommu@lists.linux-foundation.org>;
	Thu, 15 Aug 2019 05:46:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 64A5A8AC
	for <iommu@lists.linux-foundation.org>;
	Thu, 15 Aug 2019 05:46:13 +0000 (UTC)
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 7A876BAD452454558B0E;
	Thu, 15 Aug 2019 13:46:10 +0800 (CST)
Received: from [127.0.0.1] (10.133.215.186) by DGGEMS411-HUB.china.huawei.com
	(10.3.19.211) with Microsoft SMTP Server id 14.3.439.0;
	Thu, 15 Aug 2019 13:46:01 +0800
Subject: Re: [PATCH] iommu/arm-smmu-v3: add nr_ats_masters to avoid
	unnecessary operations
To: Will Deacon <will@kernel.org>
References: <20190801122040.26024-1-thunder.leizhen@huawei.com>
	<20190814111402.pxlvtmv44nhuvhio@willie-the-truck>
From: "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Message-ID: <25178348-51b4-479d-87ad-391f63a26972@huawei.com>
Date: Thu, 15 Aug 2019 13:46:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190814111402.pxlvtmv44nhuvhio@willie-the-truck>
Content-Language: en-US
X-Originating-IP: [10.133.215.186]
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	iommu <iommu@lists.linux-foundation.org>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org



On 2019/8/14 19:14, Will Deacon wrote:
> Hi,
> 
> I've been struggling with the memory ordering requirements here. More below.
> 
> On Thu, Aug 01, 2019 at 08:20:40PM +0800, Zhen Lei wrote:
>> When (smmu_domain->smmu->features & ARM_SMMU_FEAT_ATS) is true, even if a
>> smmu domain does not contain any ats master, the operations of
>> arm_smmu_atc_inv_to_cmd() and lock protection in arm_smmu_atc_inv_domain()
>> are always executed. This will impact performance, especially in
>> multi-core and stress scenarios. For my FIO test scenario, about 8%
>> performance reduced.
>>
>> In fact, we can use a atomic member to record how many ats masters the
>> smmu contains. And check that without traverse the list and check all
>> masters one by one in the lock protection.
>>
>> Fixes: 9ce27afc0830 ("iommu/arm-smmu-v3: Add support for PCI ATS")
>> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
>> ---
>>  drivers/iommu/arm-smmu-v3.c | 10 ++++++++--
>>  1 file changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/iommu/arm-smmu-v3.c b/drivers/iommu/arm-smmu-v3.c
>> index a9a9fabd396804a..1b370d9aca95f94 100644
>> --- a/drivers/iommu/arm-smmu-v3.c
>> +++ b/drivers/iommu/arm-smmu-v3.c
>> @@ -631,6 +631,7 @@ struct arm_smmu_domain {
>>  
>>  	struct io_pgtable_ops		*pgtbl_ops;
>>  	bool				non_strict;
>> +	atomic_t			nr_ats_masters;
>>  
>>  	enum arm_smmu_domain_stage	stage;
>>  	union {
>> @@ -1531,7 +1532,7 @@ static int arm_smmu_atc_inv_domain(struct arm_smmu_domain *smmu_domain,
>>  	struct arm_smmu_cmdq_ent cmd;
>>  	struct arm_smmu_master *master;
>>  
>> -	if (!(smmu_domain->smmu->features & ARM_SMMU_FEAT_ATS))
>> +	if (!atomic_read(&smmu_domain->nr_ats_masters))
>>  		return 0;
> 
> This feels wrong to me: the CPU can speculate ahead of time that
> 'nr_ats_masters' is 0, but we could have a concurrent call to '->attach()'
> for an ATS-enabled device. Wouldn't it then be possible for the new device
> to populate its ATC as a result of speculative accesses for the mapping that
> we're tearing down?
> 
> The devices lock solves this problem by serialising invalidation with
> '->attach()/->detach()' operations.
> 
> John's suggestion of RCU might work better, but I think you'll need to call
> synchronize_rcu() between adding yourself to the 'devices' list and enabling
> ATS.
> 
> What do you think?

I have updated my patch and just sent, below it's my thoughts.

-	if (!(smmu_domain->smmu->features & ARM_SMMU_FEAT_ATS))
+	/*
+	 * The protectiom of spinlock(&iommu_domain->devices_lock) is omitted.
+	 * Because for a given master, its map/unmap operations should only be
+	 * happened after it has been attached and before it has been detached.
+	 * So that, if at least one master need to be atc invalidated, the
+	 * value of smmu_domain->nr_ats_masters can not be zero.
+	 *
+	 * This can alleviate performance loss in multi-core scenarios.
+	 */
+	if (!smmu_domain->nr_ats_masters)

> 
>>  	arm_smmu_atc_inv_to_cmd(ssid, iova, size, &cmd);
>> @@ -1869,6 +1870,7 @@ static int arm_smmu_enable_ats(struct arm_smmu_master *master)
>>  	size_t stu;
>>  	struct pci_dev *pdev;
>>  	struct arm_smmu_device *smmu = master->smmu;
>> +	struct arm_smmu_domain *smmu_domain = master->domain;
>>  	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(master->dev);
>>  
>>  	if (!(smmu->features & ARM_SMMU_FEAT_ATS) || !dev_is_pci(master->dev) ||
>> @@ -1887,12 +1889,15 @@ static int arm_smmu_enable_ats(struct arm_smmu_master *master)
>>  		return ret;
>>  
>>  	master->ats_enabled = true;
>> +	atomic_inc(&smmu_domain->nr_ats_masters);
> 
> Here, we need to make sure that concurrent invalidation sees the updated
> 'nr_ats_masters' value before ATS is enabled for the device, otherwise we
> could miss an ATC invalidation.
> 
> I think the code above gets this guarantee because of the way that ATS is
> enabled in the STE, which ensures that we issue invalidation commands before
> making the STE 'live'; this has the side-effect of a write barrier before
> updating PROD, which I think we also rely on for installing the CD pointer.
> 
> Put another way: writes are ordered before a subsequent command insertion.
> 
> Do you agree? If so, I'll add a comment because this is subtle and easily
> overlooked.
> 
>>  static void arm_smmu_disable_ats(struct arm_smmu_master *master)
>>  {
>>  	struct arm_smmu_cmdq_ent cmd;
>> +	struct arm_smmu_domain *smmu_domain = master->domain;
>>  
>>  	if (!master->ats_enabled || !dev_is_pci(master->dev))
>>  		return;
>> @@ -1901,6 +1906,7 @@ static void arm_smmu_disable_ats(struct arm_smmu_master *master)
>>  	arm_smmu_atc_inv_master(master, &cmd);
>>  	pci_disable_ats(to_pci_dev(master->dev));
>>  	master->ats_enabled = false;
>> +	atomic_dec(&smmu_domain->nr_ats_masters);
> 
> This part is the other way around: now we need to ensure that we don't
> decrement 'nr_ats_masters' until we've disabled ATS. This works for a
> number of reasons, none of which are obvious:
> 
>   - The control dependency from completing the prior CMD_SYNCs for tearing
>     down the STE and invalidating the ATC
> 
>   - The spinlock handover from the CMD_SYNCs above
> 
>   - The writel() when poking PCI configuration space in pci_disable_ats()
>     happens to be implemented with a write-write barrier
> 
> I suppose the control dependency is the most compelling one: we can't let
> stores out whilst we're awaiting completion of a CMD_SYNC.
> 
> Put another way: writes are ordered after the completion of a prior CMD_SYNC.
> 
> But yeah, I need to write this down.
> 
>>  static void arm_smmu_detach_dev(struct arm_smmu_master *master)
>> @@ -1915,10 +1921,10 @@ static void arm_smmu_detach_dev(struct arm_smmu_master *master)
>>  	list_del(&master->domain_head);
>>  	spin_unlock_irqrestore(&smmu_domain->devices_lock, flags);
>>  
>> -	master->domain = NULL;
>>  	arm_smmu_install_ste_for_dev(master);
>>  
>>  	arm_smmu_disable_ats(master);
>> +	master->domain = NULL;
> 
> As you mentioned, this is broken. Can you simply drop this hunk completely?
> 
> Will
> 
> .
> 

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
