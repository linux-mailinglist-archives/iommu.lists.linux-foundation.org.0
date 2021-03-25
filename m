Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C4C3493FF
	for <lists.iommu@lfdr.de>; Thu, 25 Mar 2021 15:27:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CD0E405F9;
	Thu, 25 Mar 2021 14:27:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UkGOcFvsOu8V; Thu, 25 Mar 2021 14:27:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5942040594;
	Thu, 25 Mar 2021 14:27:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3767EC000A;
	Thu, 25 Mar 2021 14:27:57 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4B9B5C000A
 for <iommu@lists.linux-foundation.org>; Thu, 25 Mar 2021 14:27:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2E3364054B
 for <iommu@lists.linux-foundation.org>; Thu, 25 Mar 2021 14:27:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tub4qR6nwDlo for <iommu@lists.linux-foundation.org>;
 Thu, 25 Mar 2021 14:27:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5CB5A40534
 for <iommu@lists.linux-foundation.org>; Thu, 25 Mar 2021 14:27:55 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C119D1476;
 Thu, 25 Mar 2021 07:27:54 -0700 (PDT)
Received: from [10.57.50.37] (unknown [10.57.50.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9C9983F792;
 Thu, 25 Mar 2021 07:27:52 -0700 (PDT)
Subject: Re: [PATCH 7/9] iommu/arm-smmu: Use Tegra implementation on Tegra186
To: Thierry Reding <thierry.reding@gmail.com>, Will Deacon <will@kernel.org>, 
 Joerg Roedel <joro@8bytes.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
References: <20210325130332.778208-1-thierry.reding@gmail.com>
 <20210325130332.778208-8-thierry.reding@gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <4df4edff-9aa6-a742-8f6b-87a86f7eaba6@arm.com>
Date: Thu, 25 Mar 2021 14:27:47 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210325130332.778208-8-thierry.reding@gmail.com>
Content-Language: en-GB
Cc: iommu@lists.linux-foundation.org, Jon Hunter <jonathanh@nvidia.com>,
 Nicolin Chen <nicolinc@nvidia.com>, linux-tegra@vger.kernel.org,
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

On 2021-03-25 13:03, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Tegra186 requires the same SID override programming as Tegra194 in order
> to seamlessly transition from the firmware framebuffer to the Linux
> framebuffer, so the Tegra implementation needs to be used on Tegra186
> devices as well.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>   drivers/iommu/arm/arm-smmu/arm-smmu-impl.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
> index 136872e77195..9f465e146799 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
> @@ -211,7 +211,8 @@ struct arm_smmu_device *arm_smmu_impl_init(struct arm_smmu_device *smmu)
>   	if (of_property_read_bool(np, "calxeda,smmu-secure-config-access"))
>   		smmu->impl = &calxeda_impl;
>   
> -	if (of_device_is_compatible(np, "nvidia,tegra194-smmu"))
> +	if (of_device_is_compatible(np, "nvidia,tegra194-smmu") ||
> +	    of_device_is_compatible(np, "nvidia,tegra186-smmu"))

Binding update?

Robin.

>   		return nvidia_smmu_impl_init(smmu);
>   
>   	smmu = qcom_smmu_impl_init(smmu);
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
