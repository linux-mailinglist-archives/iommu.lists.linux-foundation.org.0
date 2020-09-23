Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 879FD275BBF
	for <lists.iommu@lfdr.de>; Wed, 23 Sep 2020 17:25:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 05528228E7;
	Wed, 23 Sep 2020 15:25:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id meNQHyYLvkT7; Wed, 23 Sep 2020 15:25:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 9295D204E7;
	Wed, 23 Sep 2020 15:25:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 791EDC0051;
	Wed, 23 Sep 2020 15:25:00 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 025CDC0051
 for <iommu@lists.linux-foundation.org>; Wed, 23 Sep 2020 15:24:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id F1FB88734C
 for <iommu@lists.linux-foundation.org>; Wed, 23 Sep 2020 15:24:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SFLjtTy5Fcwv for <iommu@lists.linux-foundation.org>;
 Wed, 23 Sep 2020 15:24:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by hemlock.osuosl.org (Postfix) with ESMTP id 116068734B
 for <iommu@lists.linux-foundation.org>; Wed, 23 Sep 2020 15:24:58 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 75450113E;
 Wed, 23 Sep 2020 08:24:57 -0700 (PDT)
Received: from [10.57.48.76] (unknown [10.57.48.76])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 739473F718;
 Wed, 23 Sep 2020 08:24:55 -0700 (PDT)
Subject: Re: [PATCHv5 5/6] iommu: arm-smmu-impl: Use table to list QCOM
 implementations
To: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Jordan Crouse <jcrouse@codeaurora.org>, Rob Clark <robdclark@gmail.com>
References: <cover.1600754909.git.saiprakash.ranjan@codeaurora.org>
 <f2d079d46cee22f09f6eb7e6f874a9eaa786ec2a.1600754909.git.saiprakash.ranjan@codeaurora.org>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <d9b46e48-afa5-ceff-aee8-a75a95a3e459@arm.com>
Date: Wed, 23 Sep 2020 16:24:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <f2d079d46cee22f09f6eb7e6f874a9eaa786ec2a.1600754909.git.saiprakash.ranjan@codeaurora.org>
Content-Language: en-GB
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
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

On 2020-09-22 07:18, Sai Prakash Ranjan wrote:
> Use table and of_match_node() to match qcom implementation
> instead of multiple of_device_compatible() calls for each
> QCOM SMMU implementation.
> 
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>   drivers/iommu/arm/arm-smmu/arm-smmu-impl.c | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
> index d199b4bff15d..ce78295cfa78 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
> @@ -9,6 +9,13 @@
>   
>   #include "arm-smmu.h"
>   
> +static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
> +	{ .compatible = "qcom,sc7180-smmu-500" },
> +	{ .compatible = "qcom,sdm845-smmu-500" },
> +	{ .compatible = "qcom,sm8150-smmu-500" },
> +	{ .compatible = "qcom,sm8250-smmu-500" },
> +	{ }
> +};

Can you push the table itself into arm-smmu-qcom? That way you'll be 
free to add new SoCs willy-nilly without any possibility of conflicting 
with anything else.

Bonus points if you can fold in the Adreno variant and keep everything 
together ;)

Robin.

>   static int arm_smmu_gr0_ns(int offset)
>   {
> @@ -217,10 +224,7 @@ struct arm_smmu_device *arm_smmu_impl_init(struct arm_smmu_device *smmu)
>   	if (of_device_is_compatible(np, "nvidia,tegra194-smmu"))
>   		return nvidia_smmu_impl_init(smmu);
>   
> -	if (of_device_is_compatible(np, "qcom,sdm845-smmu-500") ||
> -	    of_device_is_compatible(np, "qcom,sc7180-smmu-500") ||
> -	    of_device_is_compatible(np, "qcom,sm8150-smmu-500") ||
> -	    of_device_is_compatible(np, "qcom,sm8250-smmu-500"))
> +	if (of_match_node(qcom_smmu_impl_of_match, np))
>   		return qcom_smmu_impl_init(smmu);
>   
>   	if (of_device_is_compatible(smmu->dev->of_node, "qcom,adreno-smmu"))
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
