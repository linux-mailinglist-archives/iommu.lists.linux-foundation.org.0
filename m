Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A901D0AE6
	for <lists.iommu@lfdr.de>; Wed, 13 May 2020 10:33:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 6F394204CE;
	Wed, 13 May 2020 08:33:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xjk8tT6uBoYv; Wed, 13 May 2020 08:33:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id B514A204CF;
	Wed, 13 May 2020 08:33:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9B5ADC016F;
	Wed, 13 May 2020 08:33:19 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6FCBFC016F
 for <iommu@lists.linux-foundation.org>; Wed, 13 May 2020 08:33:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 5CF1C8616A
 for <iommu@lists.linux-foundation.org>; Wed, 13 May 2020 08:33:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2IkmBEtukRnA for <iommu@lists.linux-foundation.org>;
 Wed, 13 May 2020 08:33:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id C9F0286166
 for <iommu@lists.linux-foundation.org>; Wed, 13 May 2020 08:33:16 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 6BC8F3C3; Wed, 13 May 2020 10:33:11 +0200 (CEST)
Date: Wed, 13 May 2020 10:33:08 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Ajay Kumar <ajaykumar.rs@samsung.com>, Robin Murphy <robin.murphy@arm.com>
Subject: Re: [RFC PATCH] drivers: iommu: reset cached node if dma_mask is
 changed
Message-ID: <20200513083308.GA9820@8bytes.org>
References: <CGME20200504185042epcas5p11447ae722d33bd00c7d002a9d1b8d6c1@epcas5p1.samsung.com>
 <20200504183759.42924-1-ajaykumar.rs@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200504183759.42924-1-ajaykumar.rs@samsung.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Sathyam Panda <sathya.panda@samsung.com>, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org, shaik.ameer@samsung.com,
 robin.murphy@arm.com
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

Adding Robin.

On Tue, May 05, 2020 at 12:07:59AM +0530, Ajay Kumar wrote:
> The current IOVA allocation code stores a cached copy of the
> first allocated IOVA address node, and all the subsequent allocations
> have no way to get past(higher than) the first allocated IOVA range.
> 
> This causes issue when dma_mask for the master device is changed.
> Though the DMA window is increased, the allocation code unaware of
> the change, goes ahead allocating IOVA address lower than the
> first allocated IOVA address.
> 
> This patch adds a check for dma_mask change in the IOVA allocation
> function and resets the cached IOVA node to anchor node everytime
> the dma_mask change is observed.
> 
> NOTE:
>  This patch is needed to address the issue discussed in below thread:
>  https://www.spinics.net/lists/iommu/msg43586.html
> 
> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> Signed-off-by: Sathyam Panda <sathya.panda@samsung.com>
> ---
>  drivers/iommu/iova.c | 17 ++++++++++++++++-
>  include/linux/iova.h |  1 +
>  2 files changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/iova.c b/drivers/iommu/iova.c
> index 41c605b0058f..0e99975036ae 100644
> --- a/drivers/iommu/iova.c
> +++ b/drivers/iommu/iova.c
> @@ -44,6 +44,7 @@ init_iova_domain(struct iova_domain *iovad, unsigned long granule,
>  	iovad->granule = granule;
>  	iovad->start_pfn = start_pfn;
>  	iovad->dma_32bit_pfn = 1UL << (32 - iova_shift(iovad));
> +	iovad->curr_limit_pfn = iovad->dma_32bit_pfn;
>  	iovad->max32_alloc_size = iovad->dma_32bit_pfn;
>  	iovad->flush_cb = NULL;
>  	iovad->fq = NULL;
> @@ -116,9 +117,20 @@ EXPORT_SYMBOL_GPL(init_iova_flush_queue);
>  static struct rb_node *
>  __get_cached_rbnode(struct iova_domain *iovad, unsigned long limit_pfn)
>  {
> -	if (limit_pfn <= iovad->dma_32bit_pfn)
> +	if (limit_pfn <= iovad->dma_32bit_pfn) {
> +		/* re-init cached node if DMA limit has changed */
> +		if (limit_pfn != iovad->curr_limit_pfn) {
> +			iovad->cached32_node = &iovad->anchor.node;
> +			iovad->curr_limit_pfn = limit_pfn;
> +		}
>  		return iovad->cached32_node;
> +	}
>  
> +	/* re-init cached node if DMA limit has changed */
> +	if (limit_pfn != iovad->curr_limit_pfn) {
> +		iovad->cached_node = &iovad->anchor.node;
> +		iovad->curr_limit_pfn = limit_pfn;
> +	}
>  	return iovad->cached_node;
>  }
>  
> @@ -190,6 +202,9 @@ static int __alloc_and_insert_iova_range(struct iova_domain *iovad,
>  	if (size_aligned)
>  		align_mask <<= fls_long(size - 1);
>  
> +	if (limit_pfn != iovad->curr_limit_pfn)
> +		iovad->max32_alloc_size = iovad->dma_32bit_pfn;
> +
>  	/* Walk the tree backwards */
>  	spin_lock_irqsave(&iovad->iova_rbtree_lock, flags);
>  	if (limit_pfn <= iovad->dma_32bit_pfn &&
> diff --git a/include/linux/iova.h b/include/linux/iova.h
> index a0637abffee8..be2220c096ef 100644
> --- a/include/linux/iova.h
> +++ b/include/linux/iova.h
> @@ -73,6 +73,7 @@ struct iova_domain {
>  	unsigned long	granule;	/* pfn granularity for this domain */
>  	unsigned long	start_pfn;	/* Lower limit for this domain */
>  	unsigned long	dma_32bit_pfn;
> +	unsigned long	curr_limit_pfn;	/* Current max limit for this domain */
>  	unsigned long	max32_alloc_size; /* Size of last failed allocation */
>  	struct iova_fq __percpu *fq;	/* Flush Queue */
>  
> -- 
> 2.17.1
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
