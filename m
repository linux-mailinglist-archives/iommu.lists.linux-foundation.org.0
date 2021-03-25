Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CA63493FD
	for <lists.iommu@lfdr.de>; Thu, 25 Mar 2021 15:27:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6EB904056B;
	Thu, 25 Mar 2021 14:27:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hj2FZlhniJ1R; Thu, 25 Mar 2021 14:27:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 218F34058B;
	Thu, 25 Mar 2021 14:27:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F3B94C000A;
	Thu, 25 Mar 2021 14:27:46 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 43D99C000A
 for <iommu@lists.linux-foundation.org>; Thu, 25 Mar 2021 14:27:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 229574058B
 for <iommu@lists.linux-foundation.org>; Thu, 25 Mar 2021 14:27:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xls-cTCZof9Z for <iommu@lists.linux-foundation.org>;
 Thu, 25 Mar 2021 14:27:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp4.osuosl.org (Postfix) with ESMTP id F40CE4056B
 for <iommu@lists.linux-foundation.org>; Thu, 25 Mar 2021 14:27:44 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4BD9A143D;
 Thu, 25 Mar 2021 07:27:43 -0700 (PDT)
Received: from [10.57.50.37] (unknown [10.57.50.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A88173F792;
 Thu, 25 Mar 2021 07:27:41 -0700 (PDT)
Subject: Re: [PATCH 4/9] iommu/arm-smmu: Implement ->probe_finalize()
To: Thierry Reding <thierry.reding@gmail.com>, Will Deacon <will@kernel.org>, 
 Joerg Roedel <joro@8bytes.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
References: <20210325130332.778208-1-thierry.reding@gmail.com>
 <20210325130332.778208-5-thierry.reding@gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <57ffa62b-76da-c643-fa68-aed92b1e92e0@arm.com>
Date: Thu, 25 Mar 2021 14:27:34 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210325130332.778208-5-thierry.reding@gmail.com>
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
> Implement a ->probe_finalize() callback that can be used by vendor
> implementations to perform extra programming necessary after devices
> have been attached to the SMMU.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>   drivers/iommu/arm/arm-smmu/arm-smmu.c | 17 +++++++++++++++++
>   drivers/iommu/arm/arm-smmu/arm-smmu.h |  1 +
>   2 files changed, 18 insertions(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> index d8c6bfde6a61..4589e76543a8 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> @@ -1447,6 +1447,22 @@ static void arm_smmu_release_device(struct device *dev)
>   	iommu_fwspec_free(dev);
>   }
>   
> +static void arm_smmu_probe_finalize(struct device *dev)
> +{
> +	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
> +	struct arm_smmu_master_cfg *cfg;
> +	struct arm_smmu_device *smmu;
> +
> +	if (!fwspec || fwspec->ops != &arm_smmu_ops)
> +		return;

I think we can trust the IOMMU core not to call things in the wrong 
order, and if the fwspec has changed since it was validated in 
.probe_device then the world is probably on fire anyway.

Robin.

> +
> +	cfg = dev_iommu_priv_get(dev);
> +	smmu = cfg->smmu;
> +
> +	if (smmu->impl->probe_finalize)
> +		smmu->impl->probe_finalize(smmu, dev);
> +}
> +
>   static struct iommu_group *arm_smmu_device_group(struct device *dev)
>   {
>   	struct arm_smmu_master_cfg *cfg = dev_iommu_priv_get(dev);
> @@ -1630,6 +1646,7 @@ static struct iommu_ops arm_smmu_ops = {
>   	.iova_to_phys		= arm_smmu_iova_to_phys,
>   	.probe_device		= arm_smmu_probe_device,
>   	.release_device		= arm_smmu_release_device,
> +	.probe_finalize		= arm_smmu_probe_finalize,
>   	.device_group		= arm_smmu_device_group,
>   	.domain_get_attr	= arm_smmu_domain_get_attr,
>   	.domain_set_attr	= arm_smmu_domain_set_attr,
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> index d2a2d1bc58ba..6779db30cebb 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> @@ -439,6 +439,7 @@ struct arm_smmu_impl {
>   				  struct device *dev, int start);
>   	void (*write_s2cr)(struct arm_smmu_device *smmu, int idx);
>   	void (*write_sctlr)(struct arm_smmu_device *smmu, int idx, u32 reg);
> +	void (*probe_finalize)(struct arm_smmu_device *smmu, struct device *dev);
>   };
>   
>   #define INVALID_SMENDX			-1
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
