Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7AA3D451C
	for <lists.iommu@lfdr.de>; Sat, 24 Jul 2021 07:29:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6B37F400E0;
	Sat, 24 Jul 2021 05:29:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yc0ywW0EEufO; Sat, 24 Jul 2021 05:29:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 79F80400AE;
	Sat, 24 Jul 2021 05:29:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4B3BDC000E;
	Sat, 24 Jul 2021 05:29:41 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E48C1C000E
 for <iommu@lists.linux-foundation.org>; Sat, 24 Jul 2021 05:29:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DE2CA405D0
 for <iommu@lists.linux-foundation.org>; Sat, 24 Jul 2021 05:29:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F-X1snaffyuG for <iommu@lists.linux-foundation.org>;
 Sat, 24 Jul 2021 05:29:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 102B2405C9
 for <iommu@lists.linux-foundation.org>; Sat, 24 Jul 2021 05:29:38 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10054"; a="297565386"
X-IronPort-AV: E=Sophos;i="5.84,265,1620716400"; d="scan'208";a="297565386"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2021 22:29:38 -0700
X-IronPort-AV: E=Sophos;i="5.84,265,1620716400"; d="scan'208";a="502966562"
Received: from yuhaipen-mobl.ccr.corp.intel.com (HELO [10.254.209.247])
 ([10.254.209.247])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2021 22:29:36 -0700
Subject: Re: [PATCH 18/23] iommu: Express DMA strictness via the domain type
To: Robin Murphy <robin.murphy@arm.com>, joro@8bytes.org, will@kernel.org
References: <cover.1626888444.git.robin.murphy@arm.com>
 <37708e21b55e17eb074ef145afc2157cd0192abe.1626888445.git.robin.murphy@arm.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <f5e902ce-54a2-af7b-b42e-f61f7f96c68e@linux.intel.com>
Date: Sat, 24 Jul 2021 13:29:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <37708e21b55e17eb074ef145afc2157cd0192abe.1626888445.git.robin.murphy@arm.com>
Content-Language: en-US
Cc: linux-kernel@vger.kernel.org, dianders@chromium.org,
 iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org
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

Hi Robin,

On 2021/7/22 2:20, Robin Murphy wrote:
> Eliminate the iommu_get_dma_strict() indirection and pipe the
> information through the domain type from the beginning. Besides
> the flow simplification this also has several nice side-effects:
> 
>   - Automatically implies strict mode for untrusted devices by
>     virtue of their IOMMU_DOMAIN_DMA override.
>   - Ensures that we only ends up using flush queues for drivers
>     which are aware of them and can actually benefit.

Is this expressed by vendor iommu driver has ops->flush_iotlb_all?

>   - Allows us to handle flush queue init failure by falling back
>     to strict mode instead of leaving it to possibly blow up later.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c |  2 +-
>   drivers/iommu/arm/arm-smmu/arm-smmu.c       |  2 +-
>   drivers/iommu/dma-iommu.c                   | 10 ++++++----
>   drivers/iommu/iommu.c                       | 14 ++++----------
>   include/linux/iommu.h                       |  1 -
>   5 files changed, 12 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index fa41026d272e..260b560d0075 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -2175,7 +2175,7 @@ static int arm_smmu_domain_finalise(struct iommu_domain *domain,
>   		.iommu_dev	= smmu->dev,
>   	};
>   
> -	if (!iommu_get_dma_strict(domain))
> +	if (domain->type == IOMMU_DOMAIN_DMA_FQ)
>   		pgtbl_cfg.quirks |= IO_PGTABLE_QUIRK_NON_STRICT;
>   
>   	pgtbl_ops = alloc_io_pgtable_ops(fmt, &pgtbl_cfg, smmu_domain);
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> index dbc14c265b15..2c717f3be056 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> @@ -765,7 +765,7 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
>   		.iommu_dev	= smmu->dev,
>   	};
>   
> -	if (!iommu_get_dma_strict(domain))
> +	if (domain->type == IOMMU_DOMAIN_DMA_FQ)
>   		pgtbl_cfg.quirks |= IO_PGTABLE_QUIRK_NON_STRICT;
>   
>   	if (smmu->impl && smmu->impl->init_context) {
> diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
> index b1af1ff324c5..a114a7ad88ec 100644
> --- a/drivers/iommu/dma-iommu.c
> +++ b/drivers/iommu/dma-iommu.c
> @@ -363,13 +363,15 @@ static int iommu_dma_init_domain(struct iommu_domain *domain, dma_addr_t base,
>   
>   	init_iova_domain(iovad, 1UL << order, base_pfn);
>   
> -	if (!cookie->fq_domain && !dev_is_untrusted(dev) &&
> -	    domain->ops->flush_iotlb_all && !iommu_get_dma_strict(domain)) {
> +	if (domain->type == IOMMU_DOMAIN_DMA_FQ && !cookie->fq_domain &&
> +	    domain->ops->flush_iotlb_all) {
>   		if (init_iova_flush_queue(iovad, iommu_dma_flush_iotlb_all,
> -					  iommu_dma_entry_dtor))
> +					  iommu_dma_entry_dtor)) {
>   			pr_warn("iova flush queue initialization failed\n");
> -		else
> +			domain->type = IOMMU_DOMAIN_DMA;
> +		} else {
>   			cookie->fq_domain = domain;
> +		}
>   	}
>   
>   	return iova_reserve_iommu_regions(dev, domain);
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index 8333c334891e..d7eaacae0944 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -135,6 +135,9 @@ static int __init iommu_subsys_init(void)
>   		}
>   	}
>   
> +	if (!iommu_default_passthrough() && !iommu_dma_strict)
> +		iommu_def_domain_type = IOMMU_DOMAIN_DMA_FQ;
> +
>   	pr_info("Default domain type: %s %s\n",
>   		iommu_domain_type_str(iommu_def_domain_type),
>   		(iommu_cmd_line & IOMMU_CMD_LINE_DMA_API) ?
> @@ -352,15 +355,6 @@ void iommu_set_dma_strict(bool strict)
>   		iommu_dma_strict = strict;
>   }
>   
> -bool iommu_get_dma_strict(struct iommu_domain *domain)
> -{
> -	/* only allow lazy flushing for DMA domains */
> -	if (domain->type == IOMMU_DOMAIN_DMA)
> -		return iommu_dma_strict;
> -	return true;
> -}
> -EXPORT_SYMBOL_GPL(iommu_get_dma_strict);
> -
>   static ssize_t iommu_group_attr_show(struct kobject *kobj,
>   				     struct attribute *__attr, char *buf)
>   {
> @@ -764,7 +758,7 @@ static int iommu_create_device_direct_mappings(struct iommu_group *group,
>   	unsigned long pg_size;
>   	int ret = 0;
>   
> -	if (!domain || domain->type != IOMMU_DOMAIN_DMA)
> +	if (!domain || !(domain->type & __IOMMU_DOMAIN_DMA_API))

Nit: probably move above change to patch 14?

>   		return 0;
>   
>   	BUG_ON(!domain->pgsize_bitmap);
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index 56519110d43f..557c4c12e2cf 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -484,7 +484,6 @@ int iommu_set_pgtable_quirks(struct iommu_domain *domain,
>   		unsigned long quirks);
>   
>   void iommu_set_dma_strict(bool val);
> -bool iommu_get_dma_strict(struct iommu_domain *domain);
>   
>   extern int report_iommu_fault(struct iommu_domain *domain, struct device *dev,
>   			      unsigned long iova, int flags);
> 

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
