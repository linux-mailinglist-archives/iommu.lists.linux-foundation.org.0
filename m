Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 822C1568F89
	for <lists.iommu@lfdr.de>; Wed,  6 Jul 2022 18:45:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A5ED4019B;
	Wed,  6 Jul 2022 16:45:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A5ED4019B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0zlErgECtWOR; Wed,  6 Jul 2022 16:45:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id C38D340145;
	Wed,  6 Jul 2022 16:45:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C38D340145
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7BE60C0077;
	Wed,  6 Jul 2022 16:45:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 30515C002D
 for <iommu@lists.linux-foundation.org>; Wed,  6 Jul 2022 16:45:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EB49C81882
 for <iommu@lists.linux-foundation.org>; Wed,  6 Jul 2022 16:45:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB49C81882
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xz67DoEdUCD2 for <iommu@lists.linux-foundation.org>;
 Wed,  6 Jul 2022 16:45:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C32381776
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7C32381776
 for <iommu@lists.linux-foundation.org>; Wed,  6 Jul 2022 16:45:49 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D4692106F;
 Wed,  6 Jul 2022 09:45:48 -0700 (PDT)
Received: from [10.57.86.2] (unknown [10.57.86.2])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A9D373F66F;
 Wed,  6 Jul 2022 09:45:46 -0700 (PDT)
Message-ID: <bfc9cd29-31b9-f7c2-66a7-1fb177a72daf@arm.com>
Date: Wed, 6 Jul 2022 17:45:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCHv2] iommu/arm-smmu-qcom: Add debug support for TLB sync
 timeouts
Content-Language: en-GB
To: Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
 Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>
References: <20220526041403.9984-1-quic_saipraka@quicinc.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20220526041403.9984-1-quic_saipraka@quicinc.com>
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 quic_guptap@quicinc.com, linux-arm-kernel@lists.infradead.org
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

On 2022-05-26 05:14, Sai Prakash Ranjan wrote:
> TLB sync timeouts can be due to various reasons such as TBU power down
> or pending TCU/TBU invalidation/sync and so on. Debugging these often
> require dumping of some implementation defined registers to know the
> status of TBU/TCU operations and some of these registers are not
> accessible in non-secure world such as from kernel and requires SMC
> calls to read them in the secure world. So, add this debug support
> to dump implementation defined registers for TLB sync timeout issues.
> 
> Signed-off-by: Sai Prakash Ranjan <quic_saipraka@quicinc.com>
> ---
> 
> Changes in v2:
>   * Use scm call consistently so that it works on older chipsets where
>     some of these regs are secure registers.
>   * Add device specific data to get the implementation defined register
>     offsets.
> 
> ---
>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 161 ++++++++++++++++++---
>   drivers/iommu/arm/arm-smmu/arm-smmu.c      |   2 +
>   drivers/iommu/arm/arm-smmu/arm-smmu.h      |   1 +
>   3 files changed, 146 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index 7820711c4560..bb68aa85b28b 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -5,13 +5,27 @@
>   
>   #include <linux/acpi.h>
>   #include <linux/adreno-smmu-priv.h>
> +#include <linux/delay.h>
>   #include <linux/of_device.h>
>   #include <linux/qcom_scm.h>
>   
>   #include "arm-smmu.h"
>   
> +#define QCOM_DUMMY_VAL	-1
> +
> +enum qcom_smmu_impl_reg_offset {
> +	QCOM_SMMU_TBU_PWR_STATUS,
> +	QCOM_SMMU_STATS_SYNC_INV_TBU_ACK,
> +	QCOM_SMMU_MMU2QSS_AND_SAFE_WAIT_CNTR,
> +};
> +
> +struct qcom_smmu_config {
> +	const u32 *reg_offset;
> +};
> +
>   struct qcom_smmu {
>   	struct arm_smmu_device smmu;
> +	const struct qcom_smmu_config *cfg;
>   	bool bypass_quirk;
>   	u8 bypass_cbndx;
>   	u32 stall_enabled;
> @@ -22,6 +36,56 @@ static struct qcom_smmu *to_qcom_smmu(struct arm_smmu_device *smmu)
>   	return container_of(smmu, struct qcom_smmu, smmu);
>   }
>   
> +static void qcom_smmu_tlb_sync(struct arm_smmu_device *smmu, int page,
> +				int sync, int status)
> +{
> +	int ret;
> +	unsigned int spin_cnt, delay;
> +	u32 reg, tbu_pwr_status, sync_inv_ack, sync_inv_progress;
> +	struct qcom_smmu *qsmmu = to_qcom_smmu(smmu);
> +	const struct qcom_smmu_config *cfg;
> +
> +	arm_smmu_writel(smmu, page, sync, QCOM_DUMMY_VAL);
> +	for (delay = 1; delay < TLB_LOOP_TIMEOUT; delay *= 2) {
> +		for (spin_cnt = TLB_SPIN_COUNT; spin_cnt > 0; spin_cnt--) {
> +			reg = arm_smmu_readl(smmu, page, status);
> +			if (!(reg & ARM_SMMU_sTLBGSTATUS_GSACTIVE))
> +				return;
> +			cpu_relax();
> +		}
> +		udelay(delay);
> +	}
> +
> +	dev_err_ratelimited(smmu->dev,
> +			    "TLB sync timed out -- SMMU may be deadlocked\n");

Maybe consider a single ratelimit state for the whole function so all 
the output stays together. If things go sufficiently wrong, mixed up 
bits of partial output from different events may be misleadingly 
unhelpful (and at the very least it'll be up to 5x more effective at the 
intent of limiting log spam).

> +	cfg = qsmmu->cfg;
> +	if (!cfg)
> +		return;
> +
> +	ret = qcom_scm_io_readl(smmu->ioaddr + cfg->reg_offset[QCOM_SMMU_TBU_PWR_STATUS],
> +				&tbu_pwr_status);
> +	if (ret)
> +		dev_err_ratelimited(smmu->dev,
> +				    "Failed to read TBU power status: %d\n", ret);
> +
> +	ret = qcom_scm_io_readl(smmu->ioaddr + cfg->reg_offset[QCOM_SMMU_STATS_SYNC_INV_TBU_ACK],
> +				&sync_inv_ack);
> +	if (ret)
> +		dev_err_ratelimited(smmu->dev,
> +				    "Failed to read TBU sync/inv ack status: %d\n", ret);
> +
> +	ret = qcom_scm_io_readl(smmu->ioaddr + cfg->reg_offset[QCOM_SMMU_MMU2QSS_AND_SAFE_WAIT_CNTR],
> +				&sync_inv_progress);
> +	if (ret)
> +		dev_err_ratelimited(smmu->dev,
> +				    "Failed to read TCU syn/inv progress: %d\n", ret);
> +
> +	dev_err_ratelimited(smmu->dev,
> +			    "TBU: power_status %#x sync_inv_ack %#x sync_inv_progress %#x\n",
> +			    tbu_pwr_status, sync_inv_ack, sync_inv_progress);
> +}
> +
>   static void qcom_adreno_smmu_write_sctlr(struct arm_smmu_device *smmu, int idx,
>   		u32 reg)
>   {
> @@ -374,6 +438,7 @@ static const struct arm_smmu_impl qcom_smmu_impl = {
>   	.def_domain_type = qcom_smmu_def_domain_type,
>   	.reset = qcom_smmu500_reset,
>   	.write_s2cr = qcom_smmu_write_s2cr,
> +	.tlb_sync = qcom_smmu_tlb_sync,
>   };
>   
>   static const struct arm_smmu_impl qcom_adreno_smmu_impl = {
> @@ -382,12 +447,84 @@ static const struct arm_smmu_impl qcom_adreno_smmu_impl = {
>   	.reset = qcom_smmu500_reset,
>   	.alloc_context_bank = qcom_adreno_smmu_alloc_context_bank,
>   	.write_sctlr = qcom_adreno_smmu_write_sctlr,
> +	.tlb_sync = qcom_smmu_tlb_sync,
> +};
> +
> +/* Implementation Defined Register Space 0 register offsets */
> +static const u32 qcom_smmu_impl0_reg_offset[] = {
> +	[QCOM_SMMU_TBU_PWR_STATUS]		= 0x2204,
> +	[QCOM_SMMU_STATS_SYNC_INV_TBU_ACK]	= 0x25dc,
> +	[QCOM_SMMU_MMU2QSS_AND_SAFE_WAIT_CNTR]	= 0x2670,
> +};
> +
> +static const struct qcom_smmu_config qcm2290_smmu_cfg = {
> +	.reg_offset = qcom_smmu_impl0_reg_offset,
> +};
> +
> +static const struct qcom_smmu_config sc7180_smmu_cfg = {
> +	.reg_offset = qcom_smmu_impl0_reg_offset,
> +};
> +
> +static const struct qcom_smmu_config sc7280_smmu_cfg = {
> +	.reg_offset = qcom_smmu_impl0_reg_offset,
> +};
> +
> +static const struct qcom_smmu_config sc8180x_smmu_cfg = {
> +	.reg_offset = qcom_smmu_impl0_reg_offset,
> +};
> +
> +static const struct qcom_smmu_config sc8280xp_smmu_cfg = {
> +	.reg_offset = qcom_smmu_impl0_reg_offset,
> +};
> +
> +static const struct qcom_smmu_config sm6125_smmu_cfg = {
> +	.reg_offset = qcom_smmu_impl0_reg_offset,
> +};
> +
> +static const struct qcom_smmu_config sm6350_smmu_cfg = {
> +	.reg_offset = qcom_smmu_impl0_reg_offset,
> +};
> +
> +static const struct qcom_smmu_config sm8150_smmu_cfg = {
> +	.reg_offset = qcom_smmu_impl0_reg_offset,
> +};
> +
> +static const struct qcom_smmu_config sm8250_smmu_cfg = {
> +	.reg_offset = qcom_smmu_impl0_reg_offset,
> +};
> +
> +static const struct qcom_smmu_config sm8350_smmu_cfg = {
> +	.reg_offset = qcom_smmu_impl0_reg_offset,
> +};
> +
> +static const struct qcom_smmu_config sm8450_smmu_cfg = {
> +	.reg_offset = qcom_smmu_impl0_reg_offset,
> +};
> +
> +static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
> +	{ .compatible = "qcom,msm8998-smmu-v2" },
> +	{ .compatible = "qcom,qcm2290-smmu-500", .data = &qcm2290_smmu_cfg },
> +	{ .compatible = "qcom,sc7180-smmu-500", .data = &sc7180_smmu_cfg },
> +	{ .compatible = "qcom,sc7280-smmu-500", .data = &sc7280_smmu_cfg},
> +	{ .compatible = "qcom,sc8180x-smmu-500", .data = &sc8180x_smmu_cfg },
> +	{ .compatible = "qcom,sc8280xp-smmu-500", .data = &sc8280xp_smmu_cfg },
> +	{ .compatible = "qcom,sdm630-smmu-v2" },
> +	{ .compatible = "qcom,sdm845-smmu-500" },
> +	{ .compatible = "qcom,sm6125-smmu-500", .data = &sm6125_smmu_cfg},
> +	{ .compatible = "qcom,sm6350-smmu-500", .data = &sm6350_smmu_cfg},
> +	{ .compatible = "qcom,sm8150-smmu-500", .data = &sm8150_smmu_cfg },
> +	{ .compatible = "qcom,sm8250-smmu-500", .data = &sm8250_smmu_cfg },
> +	{ .compatible = "qcom,sm8350-smmu-500", .data = &sm8350_smmu_cfg },
> +	{ .compatible = "qcom,sm8450-smmu-500", .data = &sm8450_smmu_cfg },
> +	{ }
>   };
>   
>   static struct arm_smmu_device *qcom_smmu_create(struct arm_smmu_device *smmu,
>   		const struct arm_smmu_impl *impl)
>   {
>   	struct qcom_smmu *qsmmu;
> +	const struct of_device_id *match;
> +	const struct device_node *np = smmu->dev->of_node;
>   
>   	/* Check to make sure qcom_scm has finished probing */
>   	if (!qcom_scm_is_available())
> @@ -398,28 +535,16 @@ static struct arm_smmu_device *qcom_smmu_create(struct arm_smmu_device *smmu,
>   		return ERR_PTR(-ENOMEM);
>   
>   	qsmmu->smmu.impl = impl;
> +	match = of_match_node(qcom_smmu_impl_of_match, np);
> +	if (!match)
> +		goto out;
> +
> +	qsmmu->cfg = match->data;

I haven't been the of_device_get_match_data() police for quite some time 
now, but it's never too late :)

> +out:
>   	return &qsmmu->smmu;
>   }
>   
> -static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
> -	{ .compatible = "qcom,msm8998-smmu-v2" },
> -	{ .compatible = "qcom,qcm2290-smmu-500" },
> -	{ .compatible = "qcom,sc7180-smmu-500" },
> -	{ .compatible = "qcom,sc7280-smmu-500" },
> -	{ .compatible = "qcom,sc8180x-smmu-500" },
> -	{ .compatible = "qcom,sc8280xp-smmu-500" },
> -	{ .compatible = "qcom,sdm630-smmu-v2" },
> -	{ .compatible = "qcom,sdm845-smmu-500" },
> -	{ .compatible = "qcom,sm6125-smmu-500" },
> -	{ .compatible = "qcom,sm6350-smmu-500" },
> -	{ .compatible = "qcom,sm8150-smmu-500" },
> -	{ .compatible = "qcom,sm8250-smmu-500" },
> -	{ .compatible = "qcom,sm8350-smmu-500" },
> -	{ .compatible = "qcom,sm8450-smmu-500" },
> -	{ }
> -};
> -
>   #ifdef CONFIG_ACPI
>   static struct acpi_platform_list qcom_acpi_platlist[] = {
>   	{ "LENOVO", "CB-01   ", 0x8180, ACPI_SIG_IORT, equal, "QCOM SMMU" },
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> index 2ed3594f384e..4c5b51109835 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> @@ -2099,6 +2099,8 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
>   	if (IS_ERR(smmu->base))
>   		return PTR_ERR(smmu->base);
>   	ioaddr = res->start;
> +	smmu->ioaddr = ioaddr;

It slightly bothers me to add something to the common structure that's 
only needed by some weird imp-def feature, but there's plenty of wasted 
space in there already, and I suppose it is information that the core 
driver does at least use in passing, so overall I think that's a 
resounding "meh". Maybe remove the local variable entirely to make it 
look less redundant?

Thanks,
Robin.

> +
>   	/*
>   	 * The resource size should effectively match the value of SMMU_TOP;
>   	 * stash that temporarily until we know PAGESIZE to validate it with.
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> index 2b9b42fb6f30..703fd5817ec1 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> @@ -278,6 +278,7 @@ struct arm_smmu_device {
>   	struct device			*dev;
>   
>   	void __iomem			*base;
> +	phys_addr_t			ioaddr;
>   	unsigned int			numpage;
>   	unsigned int			pgshift;
>   
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
