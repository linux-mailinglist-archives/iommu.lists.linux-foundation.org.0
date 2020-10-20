Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id BD01C2928BD
	for <lists.iommu@lfdr.de>; Mon, 19 Oct 2020 16:03:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 6248E2CD96;
	Mon, 19 Oct 2020 14:03:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rjRgbjKpeoYe; Mon, 19 Oct 2020 14:03:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 91A8C274AA;
	Mon, 19 Oct 2020 14:03:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 67310C0051;
	Mon, 19 Oct 2020 14:03:20 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E0533C0051
 for <iommu@lists.linux-foundation.org>; Mon, 19 Oct 2020 14:03:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B60282C35C
 for <iommu@lists.linux-foundation.org>; Mon, 19 Oct 2020 14:03:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XsmrzD+iZ1DA for <iommu@lists.linux-foundation.org>;
 Mon, 19 Oct 2020 14:03:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by silver.osuosl.org (Postfix) with ESMTP id 99DC4274AA
 for <iommu@lists.linux-foundation.org>; Mon, 19 Oct 2020 14:03:16 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 083A4D6E;
 Mon, 19 Oct 2020 07:03:16 -0700 (PDT)
Received: from [10.57.19.34] (unknown [10.57.19.34])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2E3343F66E;
 Mon, 19 Oct 2020 07:03:14 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v4 2/3] iommu/arm-smmu-qcom: Read back stream mappings
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jordan Crouse <jcrouse@codeaurora.org>, Thierry Reding <treding@nvidia.com>,
 Rob Clark <robdclark@chromium.org>
References: <20201017043907.2656013-1-bjorn.andersson@linaro.org>
 <20201017043907.2656013-3-bjorn.andersson@linaro.org>
Message-ID: <5eeecd0e-e3f3-f805-12d5-633284a29074@arm.com>
Date: Mon, 19 Oct 2020 15:03:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.3.3
MIME-Version: 1.0
In-Reply-To: <20201017043907.2656013-3-bjorn.andersson@linaro.org>
Content-Language: en-GB
Cc: linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

On 2020-10-17 05:39, Bjorn Andersson wrote:
> The Qualcomm boot loader configures stream mapping for the peripherals
> that it accesses and in particular it sets up the stream mapping for the
> display controller to be allowed to scan out a splash screen or EFI
> framebuffer.
> 
> Read back the stream mappings during initialization and make the
> arm-smmu driver maintain the streams in bypass mode.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v3:
> - Extracted from different patch in v3.
> - Now configures the stream as BYPASS, rather than translate, which should work
>    for platforms with working S2CR handling as well.
> 
>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 24 ++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index be4318044f96..0089048342dd 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -23,6 +23,29 @@ static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
>   	{ }
>   };
>   
> +static int qcom_smmu_cfg_probe(struct arm_smmu_device *smmu)
> +{
> +	u32 smr;
> +	int i;
> +
> +	for (i = 0; i < smmu->num_mapping_groups; i++) {
> +		smr = arm_smmu_gr0_read(smmu, ARM_SMMU_GR0_SMR(i));
> +
> +		if (FIELD_GET(ARM_SMMU_SMR_VALID, smr)) {
> +			smmu->smrs[i].id = FIELD_GET(ARM_SMMU_SMR_ID, smr);
> +			smmu->smrs[i].mask = FIELD_GET(ARM_SMMU_SMR_MASK, smr);
> +			smmu->smrs[i].valid = true;
> +
> +			smmu->s2crs[i].type = S2CR_TYPE_BYPASS;
> +			smmu->s2crs[i].privcfg = S2CR_PRIVCFG_DEFAULT;
> +			smmu->s2crs[i].cbndx = 0xff;
> +			smmu->s2crs[i].count++;

FWIW I don't think you actually need to adjust the count here - the SMR 
being valid should already prevent the whole SME from being reassigned 
until the display probes, at which point it should "take over" the SMR 
based on matching values and claim the "initial" refcount. After that 
you're back into the standard flow. It might be a little unintuitive to 
have something in a valid but "unused" state, but arguably it's entirely 
accurate in terms of the software abstraction here.

Otherwise, you end up making boot-time SMRs - so potentially all SMRs 
after a kexec - effectively immutable, since even after Linux has taken 
control of the whole system such that they *could* be reassigned safely, 
there's still this undroppable refcount hanging around preventing it.

That said, for a mobile SoC use-case if you have enough SMRs for all 
your stream IDs and don't have any kind of device hotplug, that 
restriction shouldn't make much difference in practice, so I'm not too 
concerned either way. Otherwise this is as nice and tidy as I'd hoped :)

Robin.

> +		}
> +	}
> +
> +	return 0;
> +}
> +
>   static int qcom_smmu_def_domain_type(struct device *dev)
>   {
>   	const struct of_device_id *match =
> @@ -61,6 +84,7 @@ static int qcom_smmu500_reset(struct arm_smmu_device *smmu)
>   }
>   
>   static const struct arm_smmu_impl qcom_smmu_impl = {
> +	.cfg_probe = qcom_smmu_cfg_probe,
>   	.def_domain_type = qcom_smmu_def_domain_type,
>   	.reset = qcom_smmu500_reset,
>   };
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
