Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 8499221D7BC
	for <lists.iommu@lfdr.de>; Mon, 13 Jul 2020 16:02:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 26023226F3;
	Mon, 13 Jul 2020 14:02:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yI9aGh+E4eyb; Mon, 13 Jul 2020 14:02:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id B02EA23244;
	Mon, 13 Jul 2020 14:02:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 849D6C0733;
	Mon, 13 Jul 2020 14:02:35 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E7263C0733
 for <iommu@lists.linux-foundation.org>; Mon, 13 Jul 2020 14:02:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D617886F7D
 for <iommu@lists.linux-foundation.org>; Mon, 13 Jul 2020 14:02:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0MsI8plK8M7J for <iommu@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 14:02:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by fraxinus.osuosl.org (Postfix) with ESMTP id BD0ED86FE2
 for <iommu@lists.linux-foundation.org>; Mon, 13 Jul 2020 14:02:32 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DE97530E;
 Mon, 13 Jul 2020 07:02:31 -0700 (PDT)
Received: from [10.57.62.178] (unknown [10.57.62.178])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 08FA73F7BB;
 Mon, 13 Jul 2020 07:02:28 -0700 (PDT)
Subject: Re: [PATCH v10 2/5] iommu/arm-smmu: ioremap smmu mmio region before
 implementation init
To: Krishna Reddy <vdumpa@nvidia.com>, joro@8bytes.org, will@kernel.org,
 robh+dt@kernel.org, treding@nvidia.com, jonathanh@nvidia.com
References: <20200708050017.31563-1-vdumpa@nvidia.com>
 <20200708050017.31563-3-vdumpa@nvidia.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <49c222ce-e889-937a-6f05-eb1b46739306@arm.com>
Date: Mon, 13 Jul 2020 15:02:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200708050017.31563-3-vdumpa@nvidia.com>
Content-Language: en-GB
Cc: snikam@nvidia.com, devicetree@vger.kernel.org, mperttunen@nvidia.com,
 bhuntsman@nvidia.com, yhsu@nvidia.com, linux-kernel@vger.kernel.org,
 talho@nvidia.com, iommu@lists.linux-foundation.org, nicolinc@nvidia.com,
 linux-tegra@vger.kernel.org, praithatha@nvidia.com,
 linux-arm-kernel@lists.infradead.org, bbiswas@nvidia.com
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

On 2020-07-08 06:00, Krishna Reddy wrote:
> ioremap smmu mmio region before calling into implementation init.
> This is necessary to allow mapped address available during vendor
> specific implementation init.

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Signed-off-by: Krishna Reddy <vdumpa@nvidia.com>
> ---
>   drivers/iommu/arm-smmu.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
> index d2054178df35..e03e873d3bca 100644
> --- a/drivers/iommu/arm-smmu.c
> +++ b/drivers/iommu/arm-smmu.c
> @@ -2120,10 +2120,6 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
>   	if (err)
>   		return err;
>   
> -	smmu = arm_smmu_impl_init(smmu);
> -	if (IS_ERR(smmu))
> -		return PTR_ERR(smmu);
> -
>   	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>   	ioaddr = res->start;
>   	smmu->base = devm_ioremap_resource(dev, res);
> @@ -2135,6 +2131,10 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
>   	 */
>   	smmu->numpage = resource_size(res);
>   
> +	smmu = arm_smmu_impl_init(smmu);
> +	if (IS_ERR(smmu))
> +		return PTR_ERR(smmu);
> +
>   	num_irqs = 0;
>   	while ((res = platform_get_resource(pdev, IORESOURCE_IRQ, num_irqs))) {
>   		num_irqs++;
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
