Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 013603A7C3C
	for <lists.iommu@lfdr.de>; Tue, 15 Jun 2021 12:43:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A812083981;
	Tue, 15 Jun 2021 10:43:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BBTNik1fobR0; Tue, 15 Jun 2021 10:43:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 79FC58381F;
	Tue, 15 Jun 2021 10:43:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4588EC0022;
	Tue, 15 Jun 2021 10:43:05 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8F42CC000B
 for <iommu@lists.linux-foundation.org>; Tue, 15 Jun 2021 10:43:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 64FB3402AE
 for <iommu@lists.linux-foundation.org>; Tue, 15 Jun 2021 10:43:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nHP_AK9V6Jzu for <iommu@lists.linux-foundation.org>;
 Tue, 15 Jun 2021 10:43:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5462D40025
 for <iommu@lists.linux-foundation.org>; Tue, 15 Jun 2021 10:43:02 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 74DB3D6E;
 Tue, 15 Jun 2021 03:43:01 -0700 (PDT)
Received: from [10.57.9.136] (unknown [10.57.9.136])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4DB1C3F694;
 Tue, 15 Jun 2021 03:43:00 -0700 (PDT)
Subject: Re: [PATCH v3 3/6] iommu: Improve iommu_iotlb_gather helpers
To: Nadav Amit <nadav.amit@gmail.com>, Joerg Roedel <joro@8bytes.org>
References: <20210607182541.119756-1-namit@vmware.com>
 <20210607182541.119756-4-namit@vmware.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <07969028-d807-cad1-2a01-8efc87390157@arm.com>
Date: Tue, 15 Jun 2021 11:42:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210607182541.119756-4-namit@vmware.com>
Content-Language: en-GB
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Will Deacon <will@kernel.org>, Jiajun Cao <caojiajun@vmware.com>
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

On 2021-06-07 19:25, Nadav Amit wrote:
> From: Robin Murphy <robin.murphy@arm.com>
> 
> The Mediatek driver is not the only one which might want a basic
> address-based gathering behaviour, so although it's arguably simple
> enough to open-code, let's factor it out for the sake of cleanliness.
> Let's also take this opportunity to document the intent of these
> helpers for clarity.
> 
> Cc: Joerg Roedel <joro@8bytes.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: Jiajun Cao <caojiajun@vmware.com>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: Lu Baolu <baolu.lu@linux.intel.com>
> Cc: iommu@lists.linux-foundation.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>

Nit: missing your signoff.

> ---
> 
> Changes from Robin's version:
> * Added iommu_iotlb_gather_add_range() stub !CONFIG_IOMMU_API

Out of curiosity, is there any config in which a stub is actually 
needed? Unlike iommu_iotlb_gather_init(), I would have thought that 
these helpers should only ever be called by driver code which already 
depends on IOMMU_API.

Thanks,
Robin.

> * Use iommu_iotlb_gather_add_range() in iommu_iotlb_gather_add_page()
> ---
>   drivers/iommu/mtk_iommu.c |  5 +----
>   include/linux/iommu.h     | 43 ++++++++++++++++++++++++++++++++++-----
>   2 files changed, 39 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index e06b8a0e2b56..0af4a91ac7da 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -523,10 +523,7 @@ static size_t mtk_iommu_unmap(struct iommu_domain *domain,
>   	struct mtk_iommu_domain *dom = to_mtk_domain(domain);
>   	unsigned long end = iova + size - 1;
>   
> -	if (gather->start > iova)
> -		gather->start = iova;
> -	if (gather->end < end)
> -		gather->end = end;
> +	iommu_iotlb_gather_add_range(gather, iova, size);
>   	return dom->iop->unmap(dom->iop, iova, size, gather);
>   }
>   
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index 32d448050bf7..f254c62f3720 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -497,6 +497,38 @@ static inline void iommu_iotlb_sync(struct iommu_domain *domain,
>   	iommu_iotlb_gather_init(iotlb_gather);
>   }
>   
> +/**
> + * iommu_iotlb_gather_add_range - Gather for address-based TLB invalidation
> + * @gather: TLB gather data
> + * @iova: start of page to invalidate
> + * @size: size of page to invalidate
> + *
> + * Helper for IOMMU drivers to build arbitrarily-sized invalidation commands
> + * where only the address range matters, and simply minimising intermediate
> + * syncs is preferred.
> + */
> +static inline void iommu_iotlb_gather_add_range(struct iommu_iotlb_gather *gather,
> +						unsigned long iova, size_t size)
> +{
> +	unsigned long end = iova + size - 1;
> +
> +	if (gather->start > iova)
> +		gather->start = iova;
> +	if (gather->end < end)
> +		gather->end = end;
> +}
> +
> +/**
> + * iommu_iotlb_gather_add_page - Gather for page-based TLB invalidation
> + * @domain: IOMMU domain to be invalidated
> + * @gather: TLB gather data
> + * @iova: start of page to invalidate
> + * @size: size of page to invalidate
> + *
> + * Helper for IOMMU drivers to build invalidation commands based on individual
> + * pages, or with page size/table level hints which cannot be gathered if they
> + * differ.
> + */
>   static inline void iommu_iotlb_gather_add_page(struct iommu_domain *domain,
>   					       struct iommu_iotlb_gather *gather,
>   					       unsigned long iova, size_t size)
> @@ -515,11 +547,7 @@ static inline void iommu_iotlb_gather_add_page(struct iommu_domain *domain,
>   		gather->pgsize = size;
>   	}
>   
> -	if (gather->end < end)
> -		gather->end = end;
> -
> -	if (gather->start > start)
> -		gather->start = start;
> +	iommu_iotlb_gather_add_range(gather, iova, size);
>   }
>   
>   /* PCI device grouping function */
> @@ -702,6 +730,11 @@ static inline void iommu_iotlb_sync(struct iommu_domain *domain,
>   {
>   }
>   
> +static inline void iommu_iotlb_gather_add_range(struct iommu_iotlb_gather *gather,
> +						unsigned long iova, size_t size)
> +{
> +}
> +
>   static inline phys_addr_t iommu_iova_to_phys(struct iommu_domain *domain, dma_addr_t iova)
>   {
>   	return 0;
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
