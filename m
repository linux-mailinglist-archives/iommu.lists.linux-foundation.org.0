Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2102C4561
	for <lists.iommu@lfdr.de>; Wed, 25 Nov 2020 17:38:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 552AD2E1A7;
	Wed, 25 Nov 2020 16:38:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OfQeNpeMrndB; Wed, 25 Nov 2020 16:38:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 89C28203B4;
	Wed, 25 Nov 2020 16:38:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6CAC4C0052;
	Wed, 25 Nov 2020 16:38:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AA518C0052
 for <iommu@lists.linux-foundation.org>; Wed, 25 Nov 2020 16:38:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 94275872ED
 for <iommu@lists.linux-foundation.org>; Wed, 25 Nov 2020 16:38:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jPertXotlBam for <iommu@lists.linux-foundation.org>;
 Wed, 25 Nov 2020 16:38:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by whitealder.osuosl.org (Postfix) with ESMTP id 710EB872E1
 for <iommu@lists.linux-foundation.org>; Wed, 25 Nov 2020 16:38:12 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B928F31B;
 Wed, 25 Nov 2020 08:38:11 -0800 (PST)
Received: from [10.57.59.159] (unknown [10.57.59.159])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 46E283F7BB;
 Wed, 25 Nov 2020 08:38:09 -0800 (PST)
Subject: Re: [PATCH v2 2/6] iommu: Add iova and size as parameters in
 iommu_iotlb_map
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>
References: <20201119061836.15238-1-yong.wu@mediatek.com>
 <20201119061836.15238-3-yong.wu@mediatek.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <a8ae45e0-d384-c87e-946a-1c36bf889f84@arm.com>
Date: Wed, 25 Nov 2020 16:38:08 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201119061836.15238-3-yong.wu@mediatek.com>
Content-Language: en-GB
Cc: youlin.pei@mediatek.com, anan.sun@mediatek.com,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 chao.hao@mediatek.com, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, jun.wen@mediatek.com,
 Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
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

On 2020-11-19 06:18, Yong Wu wrote:
> iotlb_sync_map allow IOMMU drivers tlb sync after completing the whole
> mapping. This patch adds iova and size as the parameters in it. then the
> IOMMU driver could flush tlb with the whole range once after iova mapping
> to improve performance.

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>   drivers/iommu/iommu.c      | 6 +++---
>   drivers/iommu/tegra-gart.c | 3 ++-
>   include/linux/iommu.h      | 3 ++-
>   3 files changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index decef851fa3a..df87c8e825f7 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -2425,7 +2425,7 @@ int iommu_map(struct iommu_domain *domain, unsigned long iova,
>   	might_sleep();
>   	ret = __iommu_map(domain, iova, paddr, size, prot, GFP_KERNEL);
>   	if (ret == 0 && ops->iotlb_sync_map)
> -		ops->iotlb_sync_map(domain);
> +		ops->iotlb_sync_map(domain, iova, size);
>   
>   	return ret;
>   }
> @@ -2439,7 +2439,7 @@ int iommu_map_atomic(struct iommu_domain *domain, unsigned long iova,
>   
>   	ret = __iommu_map(domain, iova, paddr, size, prot, GFP_ATOMIC);
>   	if (ret == 0 && ops->iotlb_sync_map)
> -		ops->iotlb_sync_map(domain);
> +		ops->iotlb_sync_map(domain, iova, size);
>   
>   	return ret;
>   }
> @@ -2557,7 +2557,7 @@ static size_t __iommu_map_sg(struct iommu_domain *domain, unsigned long iova,
>   	}
>   
>   	if (ops->iotlb_sync_map)
> -		ops->iotlb_sync_map(domain);
> +		ops->iotlb_sync_map(domain, iova, mapped);
>   	return mapped;
>   
>   out_err:
> diff --git a/drivers/iommu/tegra-gart.c b/drivers/iommu/tegra-gart.c
> index fac720273889..d15d13a98ed1 100644
> --- a/drivers/iommu/tegra-gart.c
> +++ b/drivers/iommu/tegra-gart.c
> @@ -261,7 +261,8 @@ static int gart_iommu_of_xlate(struct device *dev,
>   	return 0;
>   }
>   
> -static void gart_iommu_sync_map(struct iommu_domain *domain)
> +static void gart_iommu_sync_map(struct iommu_domain *domain, unsigned long iova,
> +				size_t size)
>   {
>   	FLUSH_GART_REGS(gart_handle);
>   }
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index b95a6f8db6ff..794d4085edd3 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -244,7 +244,8 @@ struct iommu_ops {
>   	size_t (*unmap)(struct iommu_domain *domain, unsigned long iova,
>   		     size_t size, struct iommu_iotlb_gather *iotlb_gather);
>   	void (*flush_iotlb_all)(struct iommu_domain *domain);
> -	void (*iotlb_sync_map)(struct iommu_domain *domain);
> +	void (*iotlb_sync_map)(struct iommu_domain *domain, unsigned long iova,
> +			       size_t size);
>   	void (*iotlb_sync)(struct iommu_domain *domain,
>   			   struct iommu_iotlb_gather *iotlb_gather);
>   	phys_addr_t (*iova_to_phys)(struct iommu_domain *domain, dma_addr_t iova);
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
