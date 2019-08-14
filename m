Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 2212B8D1DC
	for <lists.iommu@lfdr.de>; Wed, 14 Aug 2019 13:14:12 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id BFE21FDE;
	Wed, 14 Aug 2019 11:14:09 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B9262FCD
	for <iommu@lists.linux-foundation.org>;
	Wed, 14 Aug 2019 11:14:08 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 99CDB67F
	for <iommu@lists.linux-foundation.org>;
	Wed, 14 Aug 2019 11:14:07 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 0FF04208C2;
	Wed, 14 Aug 2019 11:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1565781247;
	bh=nobFxGW2wMhzHUSXVoVKvl67jb1UOwZPyAe0of615GY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JxaWGEyeYVhR+sAZck72HvYqmGOMZCps/SgR0Rdz0yTpb2tqESLxtmCVg1IctTofy
	Kjvf9YyDktzs0lKSVZeCejf13frY3ufB4pbQR/PVFsGYPBjJ+2xp1YhvUjBzJdJ0J8
	yFfdzaT1LJ/5eIuQpc4MlSQXoZVejAxegdlEV+Vo=
Date: Wed, 14 Aug 2019 12:14:02 +0100
From: Will Deacon <will@kernel.org>
To: Zhen Lei <thunder.leizhen@huawei.com>
Subject: Re: [PATCH] iommu/arm-smmu-v3: add nr_ats_masters to avoid
	unnecessary operations
Message-ID: <20190814111402.pxlvtmv44nhuvhio@willie-the-truck>
References: <20190801122040.26024-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190801122040.26024-1-thunder.leizhen@huawei.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
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

Hi,

I've been struggling with the memory ordering requirements here. More below.

On Thu, Aug 01, 2019 at 08:20:40PM +0800, Zhen Lei wrote:
> When (smmu_domain->smmu->features & ARM_SMMU_FEAT_ATS) is true, even if a
> smmu domain does not contain any ats master, the operations of
> arm_smmu_atc_inv_to_cmd() and lock protection in arm_smmu_atc_inv_domain()
> are always executed. This will impact performance, especially in
> multi-core and stress scenarios. For my FIO test scenario, about 8%
> performance reduced.
> 
> In fact, we can use a atomic member to record how many ats masters the
> smmu contains. And check that without traverse the list and check all
> masters one by one in the lock protection.
> 
> Fixes: 9ce27afc0830 ("iommu/arm-smmu-v3: Add support for PCI ATS")
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> ---
>  drivers/iommu/arm-smmu-v3.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/arm-smmu-v3.c b/drivers/iommu/arm-smmu-v3.c
> index a9a9fabd396804a..1b370d9aca95f94 100644
> --- a/drivers/iommu/arm-smmu-v3.c
> +++ b/drivers/iommu/arm-smmu-v3.c
> @@ -631,6 +631,7 @@ struct arm_smmu_domain {
>  
>  	struct io_pgtable_ops		*pgtbl_ops;
>  	bool				non_strict;
> +	atomic_t			nr_ats_masters;
>  
>  	enum arm_smmu_domain_stage	stage;
>  	union {
> @@ -1531,7 +1532,7 @@ static int arm_smmu_atc_inv_domain(struct arm_smmu_domain *smmu_domain,
>  	struct arm_smmu_cmdq_ent cmd;
>  	struct arm_smmu_master *master;
>  
> -	if (!(smmu_domain->smmu->features & ARM_SMMU_FEAT_ATS))
> +	if (!atomic_read(&smmu_domain->nr_ats_masters))
>  		return 0;

This feels wrong to me: the CPU can speculate ahead of time that
'nr_ats_masters' is 0, but we could have a concurrent call to '->attach()'
for an ATS-enabled device. Wouldn't it then be possible for the new device
to populate its ATC as a result of speculative accesses for the mapping that
we're tearing down?

The devices lock solves this problem by serialising invalidation with
'->attach()/->detach()' operations.

John's suggestion of RCU might work better, but I think you'll need to call
synchronize_rcu() between adding yourself to the 'devices' list and enabling
ATS.

What do you think?

>  	arm_smmu_atc_inv_to_cmd(ssid, iova, size, &cmd);
> @@ -1869,6 +1870,7 @@ static int arm_smmu_enable_ats(struct arm_smmu_master *master)
>  	size_t stu;
>  	struct pci_dev *pdev;
>  	struct arm_smmu_device *smmu = master->smmu;
> +	struct arm_smmu_domain *smmu_domain = master->domain;
>  	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(master->dev);
>  
>  	if (!(smmu->features & ARM_SMMU_FEAT_ATS) || !dev_is_pci(master->dev) ||
> @@ -1887,12 +1889,15 @@ static int arm_smmu_enable_ats(struct arm_smmu_master *master)
>  		return ret;
>  
>  	master->ats_enabled = true;
> +	atomic_inc(&smmu_domain->nr_ats_masters);

Here, we need to make sure that concurrent invalidation sees the updated
'nr_ats_masters' value before ATS is enabled for the device, otherwise we
could miss an ATC invalidation.

I think the code above gets this guarantee because of the way that ATS is
enabled in the STE, which ensures that we issue invalidation commands before
making the STE 'live'; this has the side-effect of a write barrier before
updating PROD, which I think we also rely on for installing the CD pointer.

Put another way: writes are ordered before a subsequent command insertion.

Do you agree? If so, I'll add a comment because this is subtle and easily
overlooked.

>  static void arm_smmu_disable_ats(struct arm_smmu_master *master)
>  {
>  	struct arm_smmu_cmdq_ent cmd;
> +	struct arm_smmu_domain *smmu_domain = master->domain;
>  
>  	if (!master->ats_enabled || !dev_is_pci(master->dev))
>  		return;
> @@ -1901,6 +1906,7 @@ static void arm_smmu_disable_ats(struct arm_smmu_master *master)
>  	arm_smmu_atc_inv_master(master, &cmd);
>  	pci_disable_ats(to_pci_dev(master->dev));
>  	master->ats_enabled = false;
> +	atomic_dec(&smmu_domain->nr_ats_masters);

This part is the other way around: now we need to ensure that we don't
decrement 'nr_ats_masters' until we've disabled ATS. This works for a
number of reasons, none of which are obvious:

  - The control dependency from completing the prior CMD_SYNCs for tearing
    down the STE and invalidating the ATC

  - The spinlock handover from the CMD_SYNCs above

  - The writel() when poking PCI configuration space in pci_disable_ats()
    happens to be implemented with a write-write barrier

I suppose the control dependency is the most compelling one: we can't let
stores out whilst we're awaiting completion of a CMD_SYNC.

Put another way: writes are ordered after the completion of a prior CMD_SYNC.

But yeah, I need to write this down.

>  static void arm_smmu_detach_dev(struct arm_smmu_master *master)
> @@ -1915,10 +1921,10 @@ static void arm_smmu_detach_dev(struct arm_smmu_master *master)
>  	list_del(&master->domain_head);
>  	spin_unlock_irqrestore(&smmu_domain->devices_lock, flags);
>  
> -	master->domain = NULL;
>  	arm_smmu_install_ste_for_dev(master);
>  
>  	arm_smmu_disable_ats(master);
> +	master->domain = NULL;

As you mentioned, this is broken. Can you simply drop this hunk completely?

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
