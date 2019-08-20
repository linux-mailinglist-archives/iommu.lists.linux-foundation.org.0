Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 47414965F8
	for <lists.iommu@lfdr.de>; Tue, 20 Aug 2019 18:12:18 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 100E4E40;
	Tue, 20 Aug 2019 16:12:16 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A15CBD7D
	for <iommu@lists.linux-foundation.org>;
	Tue, 20 Aug 2019 16:12:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id EE53912E
	for <iommu@lists.linux-foundation.org>;
	Tue, 20 Aug 2019 16:12:13 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9757A28;
	Tue, 20 Aug 2019 09:12:13 -0700 (PDT)
Received: from [10.1.197.57] (e110467-lin.cambridge.arm.com [10.1.197.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AD8433F718;
	Tue, 20 Aug 2019 09:12:12 -0700 (PDT)
Subject: Re: [PATCH 2/4] iommu/arm-smmu-v3: Rework enabling/disabling of ATS
	for PCI masters
To: Will Deacon <will@kernel.org>, iommu@lists.linux-foundation.org
References: <20190820154549.17018-1-will@kernel.org>
	<20190820154549.17018-3-will@kernel.org>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <5c9822a6-395f-3f5a-657d-ac73dd20d521@arm.com>
Date: Tue, 20 Aug 2019 17:12:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190820154549.17018-3-will@kernel.org>
Content-Language: en-GB
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On 20/08/2019 16:45, Will Deacon wrote:
> To prevent any potential issues arising from speculative Address
> Translation Requests from an ATS-enabled PCIe endpoint, rework our ATS
> enabling/disabling logic so that we enable ATS at the SMMU before we
> enable it at the endpoint, and disable things in the opposite order.
> 
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>   drivers/iommu/arm-smmu-v3.c | 44 ++++++++++++++++++++++++++------------------
>   1 file changed, 26 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/iommu/arm-smmu-v3.c b/drivers/iommu/arm-smmu-v3.c
> index 3402b1bc8e94..9096eca0c480 100644
> --- a/drivers/iommu/arm-smmu-v3.c
> +++ b/drivers/iommu/arm-smmu-v3.c
> @@ -2283,31 +2283,34 @@ static void arm_smmu_install_ste_for_dev(struct arm_smmu_master *master)
>   	}
>   }
>   
> -static int arm_smmu_enable_ats(struct arm_smmu_master *master)
> +static bool arm_smmu_ats_supported(struct arm_smmu_master *master)
>   {
> -	int ret;
> -	size_t stu;
>   	struct pci_dev *pdev;
>   	struct arm_smmu_device *smmu = master->smmu;
>   	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(master->dev);
>   
>   	if (!(smmu->features & ARM_SMMU_FEAT_ATS) || !dev_is_pci(master->dev) ||
>   	    !(fwspec->flags & IOMMU_FWSPEC_PCI_RC_ATS) || pci_ats_disabled())
> -		return -ENXIO;
> +		return false;
>   
>   	pdev = to_pci_dev(master->dev);
> -	if (pdev->untrusted)
> -		return -EPERM;
> +	return !pdev->untrusted && pdev->ats_cap;
> +}
>   
> -	/* Smallest Translation Unit: log2 of the smallest supported granule */
> -	stu = __ffs(smmu->pgsize_bitmap);
> +static void arm_smmu_enable_ats(struct arm_smmu_master *master)
> +{
> +	size_t stu;
> +	struct pci_dev *pdev;
> +	struct arm_smmu_device *smmu = master->smmu;
>   
> -	ret = pci_enable_ats(pdev, stu);
> -	if (ret)
> -		return ret;
> +	if (master->ats_enabled || !dev_is_pci(master->dev))
> +		return;
>   
> -	master->ats_enabled = true;
> -	return 0;
> +	/* Smallest Translation Unit: log2 of the smallest supported granule */
> +	stu = __ffs(smmu->pgsize_bitmap);
> +	pdev = to_pci_dev(master->dev);
> +	if (pci_enable_ats(pdev, stu))
> +		dev_err(master->dev, "Failed to enable ATS (STU %zu)\n", stu);
>   }
>   
>   static void arm_smmu_disable_ats(struct arm_smmu_master *master)
> @@ -2317,10 +2320,14 @@ static void arm_smmu_disable_ats(struct arm_smmu_master *master)
>   	if (!master->ats_enabled || !dev_is_pci(master->dev))

Hmm, while you've got the lid off, that dev_is_pci() test is clearly 
redundant.

>   		return;
>   
> +	pci_disable_ats(to_pci_dev(master->dev));
> +	/*
> +	 * Ensure ATS is disabled at the endpoint before we issue the
> +	 * ATC invalidation via the SMMU.
> +	 */
> +	wmb();
>   	arm_smmu_atc_inv_to_cmd(0, 0, 0, &cmd);
>   	arm_smmu_atc_inv_master(master, &cmd);
> -	pci_disable_ats(to_pci_dev(master->dev));
> -	master->ats_enabled = false;
>   }
>   
>   static void arm_smmu_detach_dev(struct arm_smmu_master *master)
> @@ -2335,10 +2342,10 @@ static void arm_smmu_detach_dev(struct arm_smmu_master *master)
>   	list_del(&master->domain_head);
>   	spin_unlock_irqrestore(&smmu_domain->devices_lock, flags);
>   
> +	arm_smmu_disable_ats(master);
>   	master->domain = NULL;
> +	master->ats_enabled = false;
>   	arm_smmu_install_ste_for_dev(master);
> -
> -	arm_smmu_disable_ats(master);
>   }
>   
>   static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
> @@ -2383,12 +2390,13 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
>   	spin_unlock_irqrestore(&smmu_domain->devices_lock, flags);
>   
>   	if (smmu_domain->stage != ARM_SMMU_DOMAIN_BYPASS)
> -		arm_smmu_enable_ats(master);
> +		master->ats_enabled = arm_smmu_ats_supported(master);

So for non-bypass domains we pretend ATS is already enabled iff it could 
possibly be...

>   	if (smmu_domain->stage == ARM_SMMU_DOMAIN_S1)
>   		arm_smmu_write_ctx_desc(smmu, &smmu_domain->s1_cfg);
>   
>   	arm_smmu_install_ste_for_dev(master);
> +	arm_smmu_enable_ats(master);

...which ensures this won't actually touch the PCIe cap, unless of 
course when STE.EATS == 0. Are you sure about that?

Robin.

>   out_unlock:
>   	mutex_unlock(&smmu_domain->init_mutex);
>   	return ret;
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
