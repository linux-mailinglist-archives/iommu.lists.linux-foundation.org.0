Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 055842A3291
	for <lists.iommu@lfdr.de>; Mon,  2 Nov 2020 19:10:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B043286B5C;
	Mon,  2 Nov 2020 18:10:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kSejmQgo4NbB; Mon,  2 Nov 2020 18:10:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C9CB786B4A;
	Mon,  2 Nov 2020 18:10:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A1241C0051;
	Mon,  2 Nov 2020 18:10:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 008BFC0051
 for <iommu@lists.linux-foundation.org>; Mon,  2 Nov 2020 18:10:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id D99F786A4C
 for <iommu@lists.linux-foundation.org>; Mon,  2 Nov 2020 18:10:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7fikIoFdbYUF for <iommu@lists.linux-foundation.org>;
 Mon,  2 Nov 2020 18:10:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by whitealder.osuosl.org (Postfix) with ESMTP id 766F986ABF
 for <iommu@lists.linux-foundation.org>; Mon,  2 Nov 2020 18:10:52 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A85CB139F;
 Mon,  2 Nov 2020 10:10:51 -0800 (PST)
Received: from [10.57.54.223] (unknown [10.57.54.223])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4B5BE3F719;
 Mon,  2 Nov 2020 10:10:48 -0800 (PST)
Subject: Re: [PATCH v18 1/4] iommu/arm-smmu-qcom: Add implementation for the
 adreno GPU SMMU
To: Jordan Crouse <jcrouse@codeaurora.org>, linux-arm-msm@vger.kernel.org
References: <20201102171416.654337-1-jcrouse@codeaurora.org>
 <20201102171416.654337-2-jcrouse@codeaurora.org>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <bb92e6d1-be56-576f-365f-d7b946cb948e@arm.com>
Date: Mon, 2 Nov 2020 18:10:46 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201102171416.654337-2-jcrouse@codeaurora.org>
Content-Language: en-GB
Cc: Rob Clark <robdclark@chromium.org>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Sibi Sankar <sibis@codeaurora.org>,
 Vivek Gautam <vivek.gautam@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
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

On 2020-11-02 17:14, Jordan Crouse wrote:
> Add a special implementation for the SMMU attached to most Adreno GPU
> target triggered from the qcom,adreno-smmu compatible string.
> 
> The new Adreno SMMU implementation will enable split pagetables
> (TTBR1) for the domain attached to the GPU device (SID 0) and
> hard code it context bank 0 so the GPU hardware can implement
> per-instance pagetables.
> 
> Co-developed-by: Rob Clark <robdclark@chromium.org>
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
>   drivers/iommu/arm/arm-smmu/arm-smmu-impl.c |   3 +
>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 151 ++++++++++++++++++++-
>   drivers/iommu/arm/arm-smmu/arm-smmu.h      |   1 +
>   3 files changed, 153 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
> index 88f17cc33023..d199b4bff15d 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
> @@ -223,6 +223,9 @@ struct arm_smmu_device *arm_smmu_impl_init(struct arm_smmu_device *smmu)
>   	    of_device_is_compatible(np, "qcom,sm8250-smmu-500"))
>   		return qcom_smmu_impl_init(smmu);
>   
> +	if (of_device_is_compatible(smmu->dev->of_node, "qcom,adreno-smmu"))
> +		return qcom_adreno_smmu_impl_init(smmu);
> +
>   	if (of_device_is_compatible(np, "marvell,ap806-smmu-500"))
>   		smmu->impl = &mrvl_mmu500_impl;
>   
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index be4318044f96..1e942eed2dfc 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -3,6 +3,7 @@
>    * Copyright (c) 2019, The Linux Foundation. All rights reserved.
>    */
>   
> +#include <linux/adreno-smmu-priv.h>
>   #include <linux/of_device.h>
>   #include <linux/qcom_scm.h>
>   
> @@ -12,6 +13,134 @@ struct qcom_smmu {
>   	struct arm_smmu_device smmu;
>   };
>   
> +#define QCOM_ADRENO_SMMU_GPU_SID 0
> +
> +static bool qcom_adreno_smmu_is_gpu_device(struct device *dev)
> +{
> +	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
> +	int i;
> +
> +	/*
> +	 * The GPU will always use SID 0 so that is a handy way to uniquely
> +	 * identify it and configure it for per-instance pagetables
> +	 */
> +	for (i = 0; i < fwspec->num_ids; i++) {
> +		u16 sid = FIELD_GET(ARM_SMMU_SMR_ID, fwspec->ids[i]);
> +
> +		if (sid == QCOM_ADRENO_SMMU_GPU_SID)
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
> +static const struct io_pgtable_cfg *qcom_adreno_smmu_get_ttbr1_cfg(
> +		const void *cookie)
> +{
> +	struct arm_smmu_domain *smmu_domain = (void *)cookie;
> +	struct io_pgtable *pgtable =
> +		io_pgtable_ops_to_pgtable(smmu_domain->pgtbl_ops);
> +	return &pgtable->cfg;
> +}
> +
> +/*
> + * Local implementation to configure TTBR0 with the specified pagetable config.
> + * The GPU driver will call this to enable TTBR0 when per-instance pagetables
> + * are active
> + */
> +
> +static int qcom_adreno_smmu_set_ttbr0_cfg(const void *cookie,
> +		const struct io_pgtable_cfg *pgtbl_cfg)
> +{
> +	struct arm_smmu_domain *smmu_domain = (void *)cookie;
> +	struct io_pgtable *pgtable = io_pgtable_ops_to_pgtable(smmu_domain->pgtbl_ops);
> +	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
> +	struct arm_smmu_cb *cb = &smmu_domain->smmu->cbs[cfg->cbndx];
> +
> +	/* The domain must have split pagetables already enabled */
> +	if (cb->tcr[0] & ARM_SMMU_TCR_EPD1)
> +		return -EINVAL;
> +
> +	/* If the pagetable config is NULL, disable TTBR0 */
> +	if (!pgtbl_cfg) {
> +		/* Do nothing if it is already disabled */
> +		if ((cb->tcr[0] & ARM_SMMU_TCR_EPD0))
> +			return -EINVAL;
> +
> +		/* Set TCR to the original configuration */
> +		cb->tcr[0] = arm_smmu_lpae_tcr(&pgtable->cfg);
> +		cb->ttbr[0] = FIELD_PREP(ARM_SMMU_TTBRn_ASID, cb->cfg->asid);
> +	} else {
> +		u32 tcr = cb->tcr[0];
> +
> +		/* Don't call this again if TTBR0 is already enabled */
> +		if (!(cb->tcr[0] & ARM_SMMU_TCR_EPD0))
> +			return -EINVAL;
> +
> +		tcr |= arm_smmu_lpae_tcr(pgtbl_cfg);
> +		tcr &= ~(ARM_SMMU_TCR_EPD0 | ARM_SMMU_TCR_EPD1);
> +
> +		cb->tcr[0] = tcr;
> +		cb->ttbr[0] = pgtbl_cfg->arm_lpae_s1_cfg.ttbr;
> +		cb->ttbr[0] |= FIELD_PREP(ARM_SMMU_TTBRn_ASID, cb->cfg->asid);
> +	}
> +
> +	arm_smmu_write_context_bank(smmu_domain->smmu, cb->cfg->cbndx);
> +
> +	return 0;
> +}
> +
> +static int qcom_adreno_smmu_alloc_context_bank(struct arm_smmu_domain *smmu_domain,
> +					       struct arm_smmu_device *smmu,
> +					       struct device *dev, int start)
> +{
> +	int count;
> +
> +	/*
> +	 * Assign context bank 0 to the GPU device so the GPU hardware can
> +	 * switch pagetables
> +	 */
> +	if (qcom_adreno_smmu_is_gpu_device(dev)) {
> +		start = 0;
> +		count = 1;
> +	} else {
> +		start = 1;
> +		count = smmu->num_context_banks;
> +	}
> +
> +	return __arm_smmu_alloc_bitmap(smmu->context_map, start, count);
> +}
> +static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
> +		struct io_pgtable_cfg *pgtbl_cfg, struct device *dev)
> +{
> +	struct adreno_smmu_priv *priv;
> +
> +	/* Only enable split pagetables for the GPU device (SID 0) */
> +	if (!qcom_adreno_smmu_is_gpu_device(dev))
> +		return 0;
> +
> +	/*
> +	 * All targets that use the qcom,adreno-smmu compatible string *should*
> +	 * be AARCH64 stage 1 but double check because the arm-smmu code assumes
> +	 * that is the case when the TTBR1 quirk is enabled
> +	 */
> +	if ((smmu_domain->stage == ARM_SMMU_DOMAIN_S1) &&
> +	    (smmu_domain->cfg.fmt == ARM_SMMU_CTX_FMT_AARCH64))
> +		pgtbl_cfg->quirks |= IO_PGTABLE_QUIRK_ARM_TTBR1;
> +
> +	/*
> +	 * Initialize private interface with GPU:
> +	 */
> +
> +	priv = dev_get_drvdata(dev);
> +	priv->cookie = smmu_domain;
> +	priv->get_ttbr1_cfg = qcom_adreno_smmu_get_ttbr1_cfg;
> +	priv->set_ttbr0_cfg = qcom_adreno_smmu_set_ttbr0_cfg;


I still think it would have been logical to reserve context bank 0 
outright in cfg_probe, then just swizzle cbndx/irptndx at this point 
once everything else has proven that this is to be the One Special 
Domain. I guess this way at least you don't have to intervene in 
domain_free, but by the same token that means you never get to clean up 
the dangling pointer in priv->cookie, which is a little bit yuck. Oh well...

Acked-by: Robin Murphy <robin.murphy@arm.com>

Thanks,
Robin.

> +
> +	return 0;
> +}
> +
>   static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
>   	{ .compatible = "qcom,adreno" },
>   	{ .compatible = "qcom,mdp4" },
> @@ -65,7 +194,15 @@ static const struct arm_smmu_impl qcom_smmu_impl = {
>   	.reset = qcom_smmu500_reset,
>   };
>   
> -struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu)
> +static const struct arm_smmu_impl qcom_adreno_smmu_impl = {
> +	.init_context = qcom_adreno_smmu_init_context,
> +	.def_domain_type = qcom_smmu_def_domain_type,
> +	.reset = qcom_smmu500_reset,
> +	.alloc_context_bank = qcom_adreno_smmu_alloc_context_bank,
> +};
> +
> +static struct arm_smmu_device *qcom_smmu_create(struct arm_smmu_device *smmu,
> +		const struct arm_smmu_impl *impl)
>   {
>   	struct qcom_smmu *qsmmu;
>   
> @@ -75,8 +212,18 @@ struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu)
>   
>   	qsmmu->smmu = *smmu;
>   
> -	qsmmu->smmu.impl = &qcom_smmu_impl;
> +	qsmmu->smmu.impl = impl;
>   	devm_kfree(smmu->dev, smmu);
>   
>   	return &qsmmu->smmu;
>   }
> +
> +struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu)
> +{
> +	return qcom_smmu_create(smmu, &qcom_smmu_impl);
> +}
> +
> +struct arm_smmu_device *qcom_adreno_smmu_impl_init(struct arm_smmu_device *smmu)
> +{
> +	return qcom_smmu_create(smmu, &qcom_adreno_smmu_impl);
> +}
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> index 1a746476927c..6c5ff9999eae 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> @@ -520,6 +520,7 @@ static inline void arm_smmu_writeq(struct arm_smmu_device *smmu, int page,
>   struct arm_smmu_device *arm_smmu_impl_init(struct arm_smmu_device *smmu);
>   struct arm_smmu_device *nvidia_smmu_impl_init(struct arm_smmu_device *smmu);
>   struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu);
> +struct arm_smmu_device *qcom_adreno_smmu_impl_init(struct arm_smmu_device *smmu);
>   
>   void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx);
>   int arm_mmu500_reset(struct arm_smmu_device *smmu);
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
