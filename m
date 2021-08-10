Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F3E3DB348
	for <lists.iommu@lfdr.de>; Fri, 30 Jul 2021 08:11:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1660283AAB;
	Fri, 30 Jul 2021 06:11:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hSh1GxJYDjV8; Fri, 30 Jul 2021 06:11:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 272D683A9B;
	Fri, 30 Jul 2021 06:11:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 10D4BC000E;
	Fri, 30 Jul 2021 06:11:05 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 52EA8C000E
 for <iommu@lists.linux-foundation.org>; Fri, 30 Jul 2021 06:11:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 35C4F606EB
 for <iommu@lists.linux-foundation.org>; Fri, 30 Jul 2021 06:11:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3dPj4xcHPE7L for <iommu@lists.linux-foundation.org>;
 Fri, 30 Jul 2021 06:11:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 05F9160685
 for <iommu@lists.linux-foundation.org>; Fri, 30 Jul 2021 06:11:01 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10060"; a="211157109"
X-IronPort-AV: E=Sophos;i="5.84,281,1620716400"; d="scan'208";a="211157109"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2021 23:11:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,281,1620716400"; d="scan'208";a="465344955"
Received: from allen-box.sh.intel.com (HELO [10.239.159.118])
 ([10.239.159.118])
 by orsmga008.jf.intel.com with ESMTP; 29 Jul 2021 23:10:58 -0700
Subject: Re: [PATCH v2 14/24] iommu: Introduce explicit type for non-strict
 DMA domains
To: Robin Murphy <robin.murphy@arm.com>, joro@8bytes.org, will@kernel.org
References: <cover.1627468308.git.robin.murphy@arm.com>
 <59a4d350c32a83e21de5dcfe6f041f38b0c35b82.1627468309.git.robin.murphy@arm.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <3e9035ab-5344-acc7-9c74-32c9137aad86@linux.intel.com>
Date: Fri, 30 Jul 2021 14:08:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <59a4d350c32a83e21de5dcfe6f041f38b0c35b82.1627468309.git.robin.murphy@arm.com>
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

On 7/28/21 11:58 PM, Robin Murphy wrote:
> Promote the difference between strict and non-strict DMA domains from an
> internal detail to a distinct domain feature and type, to pave the road
> for exposing it through the sysfs default domain interface.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>   drivers/iommu/dma-iommu.c |  2 +-
>   drivers/iommu/iommu.c     |  8 ++++++--
>   include/linux/iommu.h     | 11 +++++++++++
>   3 files changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
> index e28396cea6eb..8b3545c01077 100644
> --- a/drivers/iommu/dma-iommu.c
> +++ b/drivers/iommu/dma-iommu.c
> @@ -1311,7 +1311,7 @@ void iommu_setup_dma_ops(struct device *dev, u64 dma_base, u64 dma_limit)
>   	 * The IOMMU core code allocates the default DMA domain, which the
>   	 * underlying IOMMU driver needs to support via the dma-iommu layer.
>   	 */
> -	if (domain->type == IOMMU_DOMAIN_DMA) {
> +	if (iommu_is_dma_domain(domain)) {
>   		if (iommu_dma_init_domain(domain, dma_base, dma_limit, dev))
>   			goto out_err;
>   		dev->dma_ops = &iommu_dma_ops;
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index fa8109369f74..982545234cf3 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -115,6 +115,7 @@ static const char *iommu_domain_type_str(unsigned int t)
>   	case IOMMU_DOMAIN_UNMANAGED:
>   		return "Unmanaged";
>   	case IOMMU_DOMAIN_DMA:
> +	case IOMMU_DOMAIN_DMA_FQ:
>   		return "Translated";
>   	default:
>   		return "Unknown";
> @@ -552,6 +553,9 @@ static ssize_t iommu_group_show_type(struct iommu_group *group,
>   		case IOMMU_DOMAIN_DMA:
>   			type = "DMA\n";
>   			break;
> +		case IOMMU_DOMAIN_DMA_FQ:
> +			type = "DMA-FQ\n";
> +			break;
>   		}
>   	}
>   	mutex_unlock(&group->mutex);
> @@ -765,7 +769,7 @@ static int iommu_create_device_direct_mappings(struct iommu_group *group,
>   	unsigned long pg_size;
>   	int ret = 0;
>   
> -	if (!domain || domain->type != IOMMU_DOMAIN_DMA)
> +	if (!domain || !iommu_is_dma_domain(domain))
>   		return 0;
>   
>   	BUG_ON(!domain->pgsize_bitmap);
> @@ -1947,7 +1951,7 @@ static struct iommu_domain *__iommu_domain_alloc(struct bus_type *bus,
>   	/* Assume all sizes by default; the driver may override this later */
>   	domain->pgsize_bitmap  = bus->iommu_ops->pgsize_bitmap;
>   
> -	if (type == IOMMU_DOMAIN_DMA && iommu_get_dma_cookie(domain)) {
> +	if (iommu_is_dma_domain(domain) && iommu_get_dma_cookie(domain)) {
>   		iommu_domain_free(domain);
>   		domain = NULL;
>   	}
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index 141779d76035..046ba4d54cd2 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -61,6 +61,7 @@ struct iommu_domain_geometry {
>   #define __IOMMU_DOMAIN_DMA_API	(1U << 1)  /* Domain for use in DMA-API
>   					      implementation              */
>   #define __IOMMU_DOMAIN_PT	(1U << 2)  /* Domain is identity mapped   */
> +#define __IOMMU_DOMAIN_DMA_FQ	(1U << 3)  /* DMA-API uses flush queue    */
>   
>   /*
>    * This are the possible domain-types
> @@ -73,12 +74,17 @@ struct iommu_domain_geometry {
>    *	IOMMU_DOMAIN_DMA	- Internally used for DMA-API implementations.
>    *				  This flag allows IOMMU drivers to implement
>    *				  certain optimizations for these domains
> + *	IOMMU_DOMAIN_DMA_FQ	- As above, but definitely using batched TLB
> + *				  invalidation.
>    */
>   #define IOMMU_DOMAIN_BLOCKED	(0U)
>   #define IOMMU_DOMAIN_IDENTITY	(__IOMMU_DOMAIN_PT)
>   #define IOMMU_DOMAIN_UNMANAGED	(__IOMMU_DOMAIN_PAGING)
>   #define IOMMU_DOMAIN_DMA	(__IOMMU_DOMAIN_PAGING |	\
>   				 __IOMMU_DOMAIN_DMA_API)
> +#define IOMMU_DOMAIN_DMA_FQ	(__IOMMU_DOMAIN_PAGING |	\
> +				 __IOMMU_DOMAIN_DMA_API |	\
> +				 __IOMMU_DOMAIN_DMA_FQ)
>   
>   struct iommu_domain {
>   	unsigned type;
> @@ -90,6 +96,11 @@ struct iommu_domain {
>   	struct iommu_dma_cookie *iova_cookie;
>   };
>   
> +static inline bool iommu_is_dma_domain(struct iommu_domain *domain)
> +{
> +	return domain->type & __IOMMU_DOMAIN_DMA_API;
> +}
> +
>   enum iommu_cap {
>   	IOMMU_CAP_CACHE_COHERENCY,	/* IOMMU can enforce cache coherent DMA
>   					   transactions */
> 

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
