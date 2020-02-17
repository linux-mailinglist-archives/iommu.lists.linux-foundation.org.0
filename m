Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 781611616F2
	for <lists.iommu@lfdr.de>; Mon, 17 Feb 2020 17:04:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 11EED85465;
	Mon, 17 Feb 2020 16:04:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EzjqsupkA7Y3; Mon, 17 Feb 2020 16:04:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9CF0E853C5;
	Mon, 17 Feb 2020 16:04:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8DF10C013E;
	Mon, 17 Feb 2020 16:04:01 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 23CCCC013E
 for <iommu@lists.linux-foundation.org>; Mon, 17 Feb 2020 16:03:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 050D38506A
 for <iommu@lists.linux-foundation.org>; Mon, 17 Feb 2020 16:03:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B9PVWkAUmqan for <iommu@lists.linux-foundation.org>;
 Mon, 17 Feb 2020 16:03:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C107484FB0
 for <iommu@lists.linux-foundation.org>; Mon, 17 Feb 2020 16:03:57 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AFF4B30E;
 Mon, 17 Feb 2020 08:03:56 -0800 (PST)
Received: from [10.1.196.37] (e121345-lin.cambridge.arm.com [10.1.196.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D73A33F68F;
 Mon, 17 Feb 2020 08:03:55 -0800 (PST)
Subject: Re: [RFC PATCH] iommu/iova: Add a best-fit algorithm
To: "Isaac J. Manjarres" <isaacm@codeaurora.org>,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
References: <1581721602-17010-1-git-send-email-isaacm@codeaurora.org>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <b9d31aa9-fb57-ad31-52e4-1a5c21e5e0de@arm.com>
Date: Mon, 17 Feb 2020 16:03:54 +0000
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1581721602-17010-1-git-send-email-isaacm@codeaurora.org>
Content-Language: en-GB
Cc: pratikp@codeaurora.org, kernel-team@android.com,
 Liam Mark <lmark@codeaurora.org>
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

On 14/02/2020 11:06 pm, Isaac J. Manjarres wrote:
> From: Liam Mark <lmark@codeaurora.org>
> 
> Using the best-fit algorithm, instead of the first-fit
> algorithm, may reduce fragmentation when allocating
> IOVAs.

What kind of pathological allocation patterns make that a serious 
problem? Is there any scope for simply changing the order of things in 
the callers? Do these drivers also run under other DMA API backends 
(e.g. 32-bit Arm)?

More generally, if a driver knows enough to want to second-guess a 
generic DMA API allocator, that's a reasonable argument that it should 
perhaps be properly IOMMU-aware and managing its own address space 
anyway. Perhaps this effort might be better spent finishing off the DMA 
ops bypass stuff to make that approach more robust and welcoming.

Robin.

> Signed-off-by: Isaac J. Manjarres <isaacm@codeaurora.org>
> ---
>   drivers/iommu/dma-iommu.c | 17 +++++++++++
>   drivers/iommu/iova.c      | 73 +++++++++++++++++++++++++++++++++++++++++++++--
>   include/linux/dma-iommu.h |  7 +++++
>   include/linux/iova.h      |  1 +
>   4 files changed, 96 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
> index a2e96a5..af08770 100644
> --- a/drivers/iommu/dma-iommu.c
> +++ b/drivers/iommu/dma-iommu.c
> @@ -364,9 +364,26 @@ static int iommu_dma_deferred_attach(struct device *dev,
>   	if (unlikely(ops->is_attach_deferred &&
>   			ops->is_attach_deferred(domain, dev)))
>   		return iommu_attach_device(domain, dev);
> +	return 0;
> +}
> +
> +/*
> + * Should be called prior to using dma-apis.
> + */
> +int iommu_dma_enable_best_fit_algo(struct device *dev)
> +{
> +	struct iommu_domain *domain;
> +	struct iova_domain *iovad;
> +
> +	domain = iommu_get_domain_for_dev(dev);
> +	if (!domain || !domain->iova_cookie)
> +		return -EINVAL;
>   
> +	iovad = &((struct iommu_dma_cookie *)domain->iova_cookie)->iovad;
> +	iovad->best_fit = true;
>   	return 0;
>   }
> +EXPORT_SYMBOL(iommu_dma_enable_best_fit_algo);
>   
>   /**
>    * dma_info_to_prot - Translate DMA API directions and attributes to IOMMU API
> diff --git a/drivers/iommu/iova.c b/drivers/iommu/iova.c
> index 0e6a953..716b05f 100644
> --- a/drivers/iommu/iova.c
> +++ b/drivers/iommu/iova.c
> @@ -50,6 +50,7 @@ static unsigned long iova_rcache_get(struct iova_domain *iovad,
>   	iovad->anchor.pfn_lo = iovad->anchor.pfn_hi = IOVA_ANCHOR;
>   	rb_link_node(&iovad->anchor.node, NULL, &iovad->rbroot.rb_node);
>   	rb_insert_color(&iovad->anchor.node, &iovad->rbroot);
> +	iovad->best_fit = false;
>   	init_iova_rcaches(iovad);
>   }
>   EXPORT_SYMBOL_GPL(init_iova_domain);
> @@ -227,6 +228,69 @@ static int __alloc_and_insert_iova_range(struct iova_domain *iovad,
>   	return -ENOMEM;
>   }
>   
> +static int __alloc_and_insert_iova_best_fit(struct iova_domain *iovad,
> +		unsigned long size, unsigned long limit_pfn,
> +			struct iova *new, bool size_aligned)
> +{
> +	struct rb_node *curr, *prev;
> +	struct iova *curr_iova, *prev_iova;
> +	unsigned long flags;
> +	unsigned long align_mask = ~0UL;
> +	struct rb_node *candidate_rb_parent;
> +	unsigned long new_pfn, candidate_pfn = ~0UL;
> +	unsigned long gap, candidate_gap = ~0UL;
> +
> +	if (size_aligned)
> +		align_mask <<= limit_align(iovad, fls_long(size - 1));
> +
> +	/* Walk the tree backwards */
> +	spin_lock_irqsave(&iovad->iova_rbtree_lock, flags);
> +	curr = &iovad->anchor.node;
> +	prev = rb_prev(curr);
> +	for (; prev; curr = prev, prev = rb_prev(curr)) {
> +		curr_iova = rb_entry(curr, struct iova, node);
> +		prev_iova = rb_entry(prev, struct iova, node);
> +
> +		limit_pfn = min(limit_pfn, curr_iova->pfn_lo);
> +		new_pfn = (limit_pfn - size) & align_mask;
> +		gap = curr_iova->pfn_lo - prev_iova->pfn_hi - 1;
> +		if ((limit_pfn >= size) && (new_pfn > prev_iova->pfn_hi)
> +				&& (gap < candidate_gap)) {
> +			candidate_gap = gap;
> +			candidate_pfn = new_pfn;
> +			candidate_rb_parent = curr;
> +			if (gap == size)
> +				goto insert;
> +		}
> +	}
> +
> +	curr_iova = rb_entry(curr, struct iova, node);
> +	limit_pfn = min(limit_pfn, curr_iova->pfn_lo);
> +	new_pfn = (limit_pfn - size) & align_mask;
> +	gap = curr_iova->pfn_lo - iovad->start_pfn;
> +	if (limit_pfn >= size && new_pfn >= iovad->start_pfn &&
> +			gap < candidate_gap) {
> +		candidate_gap = gap;
> +		candidate_pfn = new_pfn;
> +		candidate_rb_parent = curr;
> +	}
> +
> +insert:
> +	if (candidate_pfn == ~0UL) {
> +		spin_unlock_irqrestore(&iovad->iova_rbtree_lock, flags);
> +		return -ENOMEM;
> +	}
> +
> +	/* pfn_lo will point to size aligned address if size_aligned is set */
> +	new->pfn_lo = candidate_pfn;
> +	new->pfn_hi = new->pfn_lo + size - 1;
> +
> +	/* If we have 'prev', it's a valid place to start the insertion. */
> +	iova_insert_rbtree(&iovad->rbroot, new, candidate_rb_parent);
> +	spin_unlock_irqrestore(&iovad->iova_rbtree_lock, flags);
> +	return 0;
> +}
> +
>   static struct kmem_cache *iova_cache;
>   static unsigned int iova_cache_users;
>   static DEFINE_MUTEX(iova_cache_mutex);
> @@ -302,8 +366,13 @@ struct iova *
>   	if (!new_iova)
>   		return NULL;
>   
> -	ret = __alloc_and_insert_iova_range(iovad, size, limit_pfn + 1,
> -			new_iova, size_aligned);
> +	if (iovad->best_fit) {
> +		ret = __alloc_and_insert_iova_best_fit(iovad, size,
> +				limit_pfn + 1, new_iova, size_aligned);
> +	} else {
> +		ret = __alloc_and_insert_iova_range(iovad, size, limit_pfn + 1,
> +				new_iova, size_aligned);
> +	}
>   
>   	if (ret) {
>   		free_iova_mem(new_iova);
> diff --git a/include/linux/dma-iommu.h b/include/linux/dma-iommu.h
> index 2112f21..b01a31a 100644
> --- a/include/linux/dma-iommu.h
> +++ b/include/linux/dma-iommu.h
> @@ -37,6 +37,8 @@ void iommu_dma_compose_msi_msg(struct msi_desc *desc,
>   
>   void iommu_dma_get_resv_regions(struct device *dev, struct list_head *list);
>   
> +int iommu_dma_enable_best_fit_algo(struct device *dev);
> +
>   #else /* CONFIG_IOMMU_DMA */
>   
>   struct iommu_domain;
> @@ -78,5 +80,10 @@ static inline void iommu_dma_get_resv_regions(struct device *dev, struct list_he
>   {
>   }
>   
> +static inline int iommu_dma_enable_best_fit_algo(struct device *dev)
> +{
> +	return -ENODEV;
> +}
> +
>   #endif	/* CONFIG_IOMMU_DMA */
>   #endif	/* __DMA_IOMMU_H */
> diff --git a/include/linux/iova.h b/include/linux/iova.h
> index a0637ab..58713bb 100644
> --- a/include/linux/iova.h
> +++ b/include/linux/iova.h
> @@ -95,6 +95,7 @@ struct iova_domain {
>   						   flush-queues */
>   	atomic_t fq_timer_on;			/* 1 when timer is active, 0
>   						   when not */
> +	bool best_fit;
>   };
>   
>   static inline unsigned long iova_size(struct iova *iova)
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
