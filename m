Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B81F265B84
	for <lists.iommu@lfdr.de>; Fri, 11 Sep 2020 10:26:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 09D75871C7;
	Fri, 11 Sep 2020 08:26:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ekrH1byLIuLj; Fri, 11 Sep 2020 08:25:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 79AB1871C1;
	Fri, 11 Sep 2020 08:25:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 602AAC0051;
	Fri, 11 Sep 2020 08:25:59 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E70DBC0051
 for <iommu@lists.linux-foundation.org>; Fri, 11 Sep 2020 08:25:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id A4E062050F
 for <iommu@lists.linux-foundation.org>; Fri, 11 Sep 2020 08:25:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IwEov56neoL8 for <iommu@lists.linux-foundation.org>;
 Fri, 11 Sep 2020 08:25:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from a27-55.smtp-out.us-west-2.amazonses.com
 (a27-55.smtp-out.us-west-2.amazonses.com [54.240.27.55])
 by silver.osuosl.org (Postfix) with ESMTPS id AA0D020488
 for <iommu@lists.linux-foundation.org>; Fri, 11 Sep 2020 08:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1599812747;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID;
 bh=yX4fvAPceX5+/piaZQeXdCCWrW97OFOzIlS8MV7usjE=;
 b=bydfYaDkaj4QSwKnbFmHonx9wMLX1phhPblG18+Q7tQyRtXElQvm56CDvfjPgqKP
 llC+UBiH6ZM+v/FzvjDtq5VzfnWZhYwxDdDHQD092Z48SQPV+VOD1P1+bLxt2I21W+M
 AhhZzJ3h7E7sr4Urtn60E69JtJkO5IbF3R9qZl2U=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599812747;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:Feedback-ID;
 bh=yX4fvAPceX5+/piaZQeXdCCWrW97OFOzIlS8MV7usjE=;
 b=I0nV9YYthjUW3dizqECkD7Hu0Euwsh9RRc4D4eY2QFF2eybaL1HflUC9fwZNBUWN
 FlEqfKClGXgT3fWEZmhaHll1iO/HJoKFRbOJZf3yf4O2PwCe+ClLGhH1kQg9m12J0PJ
 xv+q6DzdyeHGYeTuKSoyGBrOnzpph5xzf5CwkVuU=
MIME-Version: 1.0
Date: Fri, 11 Sep 2020 08:25:47 +0000
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 4/8] iommu/arm-smmu-qcom: Emulate bypass by using
 context banks
In-Reply-To: <20200904155513.282067-5-bjorn.andersson@linaro.org>
References: <20200904155513.282067-1-bjorn.andersson@linaro.org>
 <20200904155513.282067-5-bjorn.andersson@linaro.org>
Message-ID: <010101747c453f9c-7d5e96e4-c626-4acc-8aad-a43d665bd1d5-000000@us-west-2.amazonses.com>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-SES-Outgoing: 2020.09.11-54.240.27.55
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Cc: Rob Clark <robdclark@chromium.org>, Will Deacon <will@kernel.org>,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 Sibi Sankar <sibis@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
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

On 2020-09-04 21:25, Bjorn Andersson wrote:
> Some firmware found on various Qualcomm platforms traps writes to S2CR
> of type BYPASS and writes FAULT into the register. In particular, this
> prevents us from marking the streams for the display controller as
> BYPASS to allow continued scanout of the screen through the
> initialization of the ARM SMMU.
> 
> This adds a Qualcomm specific cfg_probe function, which probes for the
> broken behavior of the S2CR registers and implements a custom
> alloc_context_bank() that when necessary allocates a context bank
> (without translation) for these domains as well.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v2:
> - Move quirk from arm_smmudevice to qcom_smmu, as we localize the quirk
>   handling to the Qualcomm specific implemntation.
> 
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 52 ++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index 229fc8ff8cea..284761a1cd8e 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -11,8 +11,14 @@
> 
>  struct qcom_smmu {
>  	struct arm_smmu_device smmu;
> +	bool bypass_broken;
>  };
> 
> +static struct qcom_smmu *to_qcom_smmu(struct arm_smmu_device *smmu)
> +{
> +	return container_of(smmu, struct qcom_smmu, smmu);
> +}
> +
>  #define QCOM_ADRENO_SMMU_GPU_SID 0
> 
>  static bool qcom_adreno_smmu_is_gpu_device(struct device *dev)
> @@ -162,6 +168,50 @@ static const struct of_device_id
> qcom_smmu_client_of_match[] __maybe_unused = {
>  	{ }
>  };
> 
> +static int qcom_smmu_alloc_context_bank(struct arm_smmu_domain 
> *smmu_domain,
> +					struct arm_smmu_device *smmu,
> +					struct device *dev, int start)
> +{
> +	struct iommu_domain *domain = &smmu_domain->domain;
> +	struct qcom_smmu *qsmmu = to_qcom_smmu(smmu);
> +
> +	/* Keep identity domains as bypass, unless bypass is broken */
> +	if (domain->type == IOMMU_DOMAIN_IDENTITY && !qsmmu->bypass_broken)
> +		return ARM_SMMU_CBNDX_BYPASS;
> +
> +	/*
> +	 * The identity domain to emulate bypass is the only domain without a
> +	 * dev, use the last context bank for this to avoid collisions with
> +	 * active contexts during initialization.
> +	 */
> +	if (!dev)
> +		start = smmu->num_context_banks - 1;
> +
> +	return __arm_smmu_alloc_bitmap(smmu->context_map, start,
> smmu->num_context_banks);
> +}
> +
> +static int qcom_smmu_cfg_probe(struct arm_smmu_device *smmu)
> +{
> +	unsigned int last_s2cr = ARM_SMMU_GR0_S2CR(smmu->num_mapping_groups - 
> 1);
> +	struct qcom_smmu *qsmmu = to_qcom_smmu(smmu);
> +	u32 reg;
> +
> +	/*
> +	 * With some firmware writes to S2CR of type FAULT are ignored, and
> +	 * writing BYPASS will end up as FAULT in the register. Perform a 
> write
> +	 * to S2CR to detect if this is the case with the current firmware.
> +	 */
> +	reg = FIELD_PREP(ARM_SMMU_S2CR_TYPE, S2CR_TYPE_BYPASS) |
> +	      FIELD_PREP(ARM_SMMU_S2CR_CBNDX, 0xff) |
> +	      FIELD_PREP(ARM_SMMU_S2CR_PRIVCFG, S2CR_PRIVCFG_DEFAULT);
> +	arm_smmu_gr0_write(smmu, last_s2cr, reg);
> +	reg = arm_smmu_gr0_read(smmu, last_s2cr);
> +	if (FIELD_GET(ARM_SMMU_S2CR_TYPE, reg) != S2CR_TYPE_BYPASS)
> +		qsmmu->bypass_broken = true;
> +

Clever :)

Reviewed-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Tested-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
