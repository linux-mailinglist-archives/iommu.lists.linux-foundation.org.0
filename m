Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0EF309284
	for <lists.iommu@lfdr.de>; Sat, 30 Jan 2021 08:33:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B751686DDB;
	Sat, 30 Jan 2021 07:33:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KgUNdlJLSkYb; Sat, 30 Jan 2021 07:33:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C5F6386DF3;
	Sat, 30 Jan 2021 07:33:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8EFB3C0FA7;
	Sat, 30 Jan 2021 07:33:20 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A0C1DC0FA7
 for <iommu@lists.linux-foundation.org>; Sat, 30 Jan 2021 07:33:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8840A86881
 for <iommu@lists.linux-foundation.org>; Sat, 30 Jan 2021 07:33:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dFaKioy6l0p1 for <iommu@lists.linux-foundation.org>;
 Sat, 30 Jan 2021 07:33:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 3D21285BD5
 for <iommu@lists.linux-foundation.org>; Sat, 30 Jan 2021 07:33:17 +0000 (UTC)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4DSQrr1fm0zjFDr;
 Sat, 30 Jan 2021 15:32:12 +0800 (CST)
Received: from [127.0.0.1] (10.174.176.220) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.498.0;
 Sat, 30 Jan 2021 15:33:02 +0800
Subject: Re: [PATCH v4 1/2] perf/smmuv3: Don't reserve the PMCG register spaces
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, "Mark
 Rutland" <mark.rutland@arm.com>, Joerg Roedel <joro@8bytes.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, iommu
 <iommu@lists.linux-foundation.org>, linux-kernel
 <linux-kernel@vger.kernel.org>
References: <20210130071414.1575-1-thunder.leizhen@huawei.com>
 <20210130071414.1575-2-thunder.leizhen@huawei.com>
From: "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Message-ID: <139a573b-a8ab-c494-0f4c-0fd720ce82db@huawei.com>
Date: Sat, 30 Jan 2021 15:33:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20210130071414.1575-2-thunder.leizhen@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.174.176.220]
X-CFilter-Loop: Reflected
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Hi, Robin:
  Can you review this patch again?


On 2021/1/30 15:14, Zhen Lei wrote:
> According to the SMMUv3 specification:
> Each PMCG counter group is represented by one 4KB page (Page 0) with one
> optional additional 4KB page (Page 1), both of which are at IMPLEMENTATION
> DEFINED base addresses.
> 
> This means that the PMCG register spaces may be within the 64KB pages of
> the SMMUv3 register space. When both the SMMU and PMCG drivers reserve
> their own resources, a resource conflict occurs.
> 
> To avoid this conflict, don't reserve the PMCG regions.
> 
> Suggested-by: Robin Murphy <robin.murphy@arm.com>
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> ---
>  drivers/perf/arm_smmuv3_pmu.c | 25 +++++++++++++++++++------
>  1 file changed, 19 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/perf/arm_smmuv3_pmu.c b/drivers/perf/arm_smmuv3_pmu.c
> index 74474bb322c3f26..5e894f957c7b935 100644
> --- a/drivers/perf/arm_smmuv3_pmu.c
> +++ b/drivers/perf/arm_smmuv3_pmu.c
> @@ -793,17 +793,30 @@ static int smmu_pmu_probe(struct platform_device *pdev)
>  		.capabilities	= PERF_PMU_CAP_NO_EXCLUDE,
>  	};
>  
> -	smmu_pmu->reg_base = devm_platform_get_and_ioremap_resource(pdev, 0, &res_0);
> -	if (IS_ERR(smmu_pmu->reg_base))
> -		return PTR_ERR(smmu_pmu->reg_base);
> +	/*
> +	 * The register spaces of the PMCG may be in the register space of
> +	 * other devices. For example, SMMU. Therefore, the PMCG resources are
> +	 * not reserved to avoid resource conflicts with other drivers.
> +	 */
> +	res_0 = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res_0)
> +		return ERR_PTR(-EINVAL);
> +	smmu_pmu->reg_base = devm_ioremap(dev, res_0->start, resource_size(res_0));
> +	if (!smmu_pmu->reg_base)
> +		return ERR_PTR(-ENOMEM);
>  
>  	cfgr = readl_relaxed(smmu_pmu->reg_base + SMMU_PMCG_CFGR);
>  
>  	/* Determine if page 1 is present */
>  	if (cfgr & SMMU_PMCG_CFGR_RELOC_CTRS) {
> -		smmu_pmu->reloc_base = devm_platform_ioremap_resource(pdev, 1);
> -		if (IS_ERR(smmu_pmu->reloc_base))
> -			return PTR_ERR(smmu_pmu->reloc_base);
> +		struct resource *res_1;
> +
> +		res_1 = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> +		if (!res_1)
> +			return ERR_PTR(-EINVAL);
> +		smmu_pmu->reloc_base = devm_ioremap(dev, res_1->start, resource_size(res_1));
> +		if (!smmu_pmu->reloc_base)
> +			return ERR_PTR(-ENOMEM);
>  	} else {
>  		smmu_pmu->reloc_base = smmu_pmu->reg_base;
>  	}
> 

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
