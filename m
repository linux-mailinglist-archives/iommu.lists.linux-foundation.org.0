Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 675664C65D1
	for <lists.iommu@lfdr.de>; Mon, 28 Feb 2022 10:42:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 044D440523;
	Mon, 28 Feb 2022 09:42:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1nCVv-BUe59V; Mon, 28 Feb 2022 09:42:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 89D804028D;
	Mon, 28 Feb 2022 09:42:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 56F61C007B;
	Mon, 28 Feb 2022 09:42:37 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 182ECC001A
 for <iommu@lists.linux-foundation.org>; Mon, 28 Feb 2022 09:42:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EFC9F81826
 for <iommu@lists.linux-foundation.org>; Mon, 28 Feb 2022 09:42:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P6EnnEFG8avt for <iommu@lists.linux-foundation.org>;
 Mon, 28 Feb 2022 09:42:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9233A817C3
 for <iommu@lists.linux-foundation.org>; Mon, 28 Feb 2022 09:42:31 +0000 (UTC)
Received: from fraeml735-chm.china.huawei.com (unknown [172.18.147.201])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4K6b456gKmz67xWk;
 Mon, 28 Feb 2022 17:41:25 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml735-chm.china.huawei.com (10.206.15.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 28 Feb 2022 10:42:27 +0100
Received: from [10.47.86.223] (10.47.86.223) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.21; Mon, 28 Feb
 2022 09:42:26 +0000
Message-ID: <6627bc5c-188c-4f50-620c-ffaa55dd6fe0@huawei.com>
Date: Mon, 28 Feb 2022 09:42:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH] iova: Remove forward declarations
To: <joro@8bytes.org>, <will@kernel.org>, <robin.murphy@arm.com>
References: <1645201711-235800-1-git-send-email-john.garry@huawei.com>
In-Reply-To: <1645201711-235800-1-git-send-email-john.garry@huawei.com>
X-Originating-IP: [10.47.86.223]
X-ClientProxiedBy: lhreml708-chm.china.huawei.com (10.201.108.57) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
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
From: John Garry via iommu <iommu@lists.linux-foundation.org>
Reply-To: John Garry <john.garry@huawei.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 18/02/2022 16:28, John Garry wrote:

Hi guys,

A friendly reminder on this one.

Cheers,
john

> Now that the FQ code has been moved to dma-iommu.c and also the rcache-
> related structures have been brought into iova.c, let's rearrange the code
> to remove all the forward declarations.
> 
> The general order is as follows:
> - RB tree code
> - iova management
> - magazine helpers
> - rcache code and "fast" APIs
> - iova domain public APIs
> 
> Rearrange prototypes in iova.h to follow the same general group ordering.
> 
> A couple of pre-existing checkpatch warnings are also remedied:
> 
> A suspect indentation is also corrected:
> WARNING: suspect code indent for conditional statements (16, 32)
>   #374: FILE: drivers/iommu/iova.c:194:
> +               } else if (overlap)
> +                               break;
> 
> WARNING: Block comments should align the * on each line
>   #1038: FILE: drivers/iommu/iova.c:787:
> + * fails too and the flush_rcache flag is set then the rcache will be flushed.
> +*/
> 
> No functional change intended.
> 
> Signed-off-by: John Garry <john.garry@huawei.com>
> 
> diff --git a/drivers/iommu/iova.c b/drivers/iommu/iova.c
> index 7e9c3a97c040..d543131025b3 100644
> --- a/drivers/iommu/iova.c
> +++ b/drivers/iommu/iova.c
> @@ -17,75 +17,40 @@
>   
>   #define IOVA_RANGE_CACHE_MAX_SIZE 6	/* log of max cached IOVA range size (in pages) */
>   
> -static bool iova_rcache_insert(struct iova_domain *iovad,
> -			       unsigned long pfn,
> -			       unsigned long size);
> -static unsigned long iova_rcache_get(struct iova_domain *iovad,
> -				     unsigned long size,
> -				     unsigned long limit_pfn);
> -static void free_cpu_cached_iovas(unsigned int cpu, struct iova_domain *iovad);
> -static void free_iova_rcaches(struct iova_domain *iovad);
> +/*
> + * Magazine caches for IOVA ranges.  For an introduction to magazines,
> + * see the USENIX 2001 paper "Magazines and Vmem: Extending the Slab
> + * Allocator to Many CPUs and Arbitrary Resources" by Bonwick and Adams.
> + * For simplicity, we use a static magazine size and don't implement the
> + * dynamic size tuning described in the paper.
> + */
>   
> -static int iova_cpuhp_dead(unsigned int cpu, struct hlist_node *node)
> -{
> -	struct iova_domain *iovad;
> +#define IOVA_MAG_SIZE 128
> +#define MAX_GLOBAL_MAGS 32	/* magazines per bin */
>   
> -	iovad = hlist_entry_safe(node, struct iova_domain, cpuhp_dead);
> +struct iova_magazine {
> +	unsigned long size;
> +	unsigned long pfns[IOVA_MAG_SIZE];
> +};
>   
> -	free_cpu_cached_iovas(cpu, iovad);
> -	return 0;
> -}
> +struct iova_cpu_rcache {
> +	spinlock_t lock;
> +	struct iova_magazine *loaded;
> +	struct iova_magazine *prev;
> +};
>   
> -static void free_global_cached_iovas(struct iova_domain *iovad);
> +struct iova_rcache {
> +	spinlock_t lock;
> +	unsigned long depot_size;
> +	struct iova_magazine *depot[MAX_GLOBAL_MAGS];
> +	struct iova_cpu_rcache __percpu *cpu_rcaches;
> +};
>   
>   static struct iova *to_iova(struct rb_node *node)
>   {
>   	return rb_entry(node, struct iova, node);
>   }
>   
> -void
> -init_iova_domain(struct iova_domain *iovad, unsigned long granule,
> -	unsigned long start_pfn)
> -{
> -	/*
> -	 * IOVA granularity will normally be equal to the smallest
> -	 * supported IOMMU page size; both *must* be capable of
> -	 * representing individual CPU pages exactly.
> -	 */
> -	BUG_ON((granule > PAGE_SIZE) || !is_power_of_2(granule));
> -
> -	spin_lock_init(&iovad->iova_rbtree_lock);
> -	iovad->rbroot = RB_ROOT;
> -	iovad->cached_node = &iovad->anchor.node;
> -	iovad->cached32_node = &iovad->anchor.node;
> -	iovad->granule = granule;
> -	iovad->start_pfn = start_pfn;
> -	iovad->dma_32bit_pfn = 1UL << (32 - iova_shift(iovad));
> -	iovad->max32_alloc_size = iovad->dma_32bit_pfn;
> -	iovad->anchor.pfn_lo = iovad->anchor.pfn_hi = IOVA_ANCHOR;
> -	rb_link_node(&iovad->anchor.node, NULL, &iovad->rbroot.rb_node);
> -	rb_insert_color(&iovad->anchor.node, &iovad->rbroot);
> -}
> -EXPORT_SYMBOL_GPL(init_iova_domain);
> -
> -static struct rb_node *
> -__get_cached_rbnode(struct iova_domain *iovad, unsigned long limit_pfn)
> -{
> -	if (limit_pfn <= iovad->dma_32bit_pfn)
> -		return iovad->cached32_node;
> -
> -	return iovad->cached_node;
> -}
> -
> -static void
> -__cached_rbnode_insert_update(struct iova_domain *iovad, struct iova *new)
> -{
> -	if (new->pfn_hi < iovad->dma_32bit_pfn)
> -		iovad->cached32_node = &new->node;
> -	else
> -		iovad->cached_node = &new->node;
> -}
> -
>   static void
>   __cached_rbnode_delete_update(struct iova_domain *iovad, struct iova *free)
>   {
> @@ -104,43 +69,6 @@ __cached_rbnode_delete_update(struct iova_domain *iovad, struct iova *free)
>   		iovad->cached_node = rb_next(&free->node);
>   }
>   
> -static struct rb_node *iova_find_limit(struct iova_domain *iovad, unsigned long limit_pfn)
> -{
> -	struct rb_node *node, *next;
> -	/*
> -	 * Ideally what we'd like to judge here is whether limit_pfn is close
> -	 * enough to the highest-allocated IOVA that starting the allocation
> -	 * walk from the anchor node will be quicker than this initial work to
> -	 * find an exact starting point (especially if that ends up being the
> -	 * anchor node anyway). This is an incredibly crude approximation which
> -	 * only really helps the most likely case, but is at least trivially easy.
> -	 */
> -	if (limit_pfn > iovad->dma_32bit_pfn)
> -		return &iovad->anchor.node;
> -
> -	node = iovad->rbroot.rb_node;
> -	while (to_iova(node)->pfn_hi < limit_pfn)
> -		node = node->rb_right;
> -
> -search_left:
> -	while (node->rb_left && to_iova(node->rb_left)->pfn_lo >= limit_pfn)
> -		node = node->rb_left;
> -
> -	if (!node->rb_left)
> -		return node;
> -
> -	next = node->rb_left;
> -	while (next->rb_right) {
> -		next = next->rb_right;
> -		if (to_iova(next)->pfn_lo >= limit_pfn) {
> -			node = next;
> -			goto search_left;
> -		}
> -	}
> -
> -	return node;
> -}
> -
>   /* Insert the iova into domain rbtree by holding writer lock */
>   static void
>   iova_insert_rbtree(struct rb_root *root, struct iova *iova,
> @@ -169,65 +97,15 @@ iova_insert_rbtree(struct rb_root *root, struct iova *iova,
>   	rb_insert_color(&iova->node, root);
>   }
>   
> -static int __alloc_and_insert_iova_range(struct iova_domain *iovad,
> -		unsigned long size, unsigned long limit_pfn,
> -			struct iova *new, bool size_aligned)
> +static int
> +__is_range_overlap(struct rb_node *node,
> +	unsigned long pfn_lo, unsigned long pfn_hi)
>   {
> -	struct rb_node *curr, *prev;
> -	struct iova *curr_iova;
> -	unsigned long flags;
> -	unsigned long new_pfn, retry_pfn;
> -	unsigned long align_mask = ~0UL;
> -	unsigned long high_pfn = limit_pfn, low_pfn = iovad->start_pfn;
> -
> -	if (size_aligned)
> -		align_mask <<= fls_long(size - 1);
> -
> -	/* Walk the tree backwards */
> -	spin_lock_irqsave(&iovad->iova_rbtree_lock, flags);
> -	if (limit_pfn <= iovad->dma_32bit_pfn &&
> -			size >= iovad->max32_alloc_size)
> -		goto iova32_full;
> -
> -	curr = __get_cached_rbnode(iovad, limit_pfn);
> -	curr_iova = to_iova(curr);
> -	retry_pfn = curr_iova->pfn_hi + 1;
> -
> -retry:
> -	do {
> -		high_pfn = min(high_pfn, curr_iova->pfn_lo);
> -		new_pfn = (high_pfn - size) & align_mask;
> -		prev = curr;
> -		curr = rb_prev(curr);
> -		curr_iova = to_iova(curr);
> -	} while (curr && new_pfn <= curr_iova->pfn_hi && new_pfn >= low_pfn);
> -
> -	if (high_pfn < size || new_pfn < low_pfn) {
> -		if (low_pfn == iovad->start_pfn && retry_pfn < limit_pfn) {
> -			high_pfn = limit_pfn;
> -			low_pfn = retry_pfn;
> -			curr = iova_find_limit(iovad, limit_pfn);
> -			curr_iova = to_iova(curr);
> -			goto retry;
> -		}
> -		iovad->max32_alloc_size = size;
> -		goto iova32_full;
> -	}
> -
> -	/* pfn_lo will point to size aligned address if size_aligned is set */
> -	new->pfn_lo = new_pfn;
> -	new->pfn_hi = new->pfn_lo + size - 1;
> -
> -	/* If we have 'prev', it's a valid place to start the insertion. */
> -	iova_insert_rbtree(&iovad->rbroot, new, prev);
> -	__cached_rbnode_insert_update(iovad, new);
> +	struct iova *iova = to_iova(node);
>   
> -	spin_unlock_irqrestore(&iovad->iova_rbtree_lock, flags);
> +	if ((pfn_lo <= iova->pfn_hi) && (pfn_hi >= iova->pfn_lo))
> +		return 1;
>   	return 0;
> -
> -iova32_full:
> -	spin_unlock_irqrestore(&iovad->iova_rbtree_lock, flags);
> -	return -ENOMEM;
>   }
>   
>   static struct kmem_cache *iova_cache;
> @@ -245,88 +123,88 @@ static void free_iova_mem(struct iova *iova)
>   		kmem_cache_free(iova_cache, iova);
>   }
>   
> -int iova_cache_get(void)
> +static inline struct iova *
> +alloc_and_init_iova(unsigned long pfn_lo, unsigned long pfn_hi)
>   {
> -	mutex_lock(&iova_cache_mutex);
> -	if (!iova_cache_users) {
> -		int ret;
> -
> -		ret = cpuhp_setup_state_multi(CPUHP_IOMMU_IOVA_DEAD, "iommu/iova:dead", NULL,
> -					iova_cpuhp_dead);
> -		if (ret) {
> -			mutex_unlock(&iova_cache_mutex);
> -			pr_err("Couldn't register cpuhp handler\n");
> -			return ret;
> -		}
> +	struct iova *iova;
>   
> -		iova_cache = kmem_cache_create(
> -			"iommu_iova", sizeof(struct iova), 0,
> -			SLAB_HWCACHE_ALIGN, NULL);
> -		if (!iova_cache) {
> -			cpuhp_remove_multi_state(CPUHP_IOMMU_IOVA_DEAD);
> -			mutex_unlock(&iova_cache_mutex);
> -			pr_err("Couldn't create iova cache\n");
> -			return -ENOMEM;
> -		}
> +	iova = alloc_iova_mem();
> +	if (iova) {
> +		iova->pfn_lo = pfn_lo;
> +		iova->pfn_hi = pfn_hi;
>   	}
>   
> -	iova_cache_users++;
> -	mutex_unlock(&iova_cache_mutex);
> +	return iova;
> +}
>   
> -	return 0;
> +static struct iova *
> +__insert_new_range(struct iova_domain *iovad,
> +	unsigned long pfn_lo, unsigned long pfn_hi)
> +{
> +	struct iova *iova;
> +
> +	iova = alloc_and_init_iova(pfn_lo, pfn_hi);
> +	if (iova)
> +		iova_insert_rbtree(&iovad->rbroot, iova, NULL);
> +
> +	return iova;
>   }
> -EXPORT_SYMBOL_GPL(iova_cache_get);
>   
> -void iova_cache_put(void)
> +static void
> +__adjust_overlap_range(struct iova *iova,
> +	unsigned long *pfn_lo, unsigned long *pfn_hi)
>   {
> -	mutex_lock(&iova_cache_mutex);
> -	if (WARN_ON(!iova_cache_users)) {
> -		mutex_unlock(&iova_cache_mutex);
> -		return;
> -	}
> -	iova_cache_users--;
> -	if (!iova_cache_users) {
> -		cpuhp_remove_multi_state(CPUHP_IOMMU_IOVA_DEAD);
> -		kmem_cache_destroy(iova_cache);
> -	}
> -	mutex_unlock(&iova_cache_mutex);
> +	if (*pfn_lo < iova->pfn_lo)
> +		iova->pfn_lo = *pfn_lo;
> +	if (*pfn_hi > iova->pfn_hi)
> +		*pfn_lo = iova->pfn_hi + 1;
>   }
> -EXPORT_SYMBOL_GPL(iova_cache_put);
>   
>   /**
> - * alloc_iova - allocates an iova
> - * @iovad: - iova domain in question
> - * @size: - size of page frames to allocate
> - * @limit_pfn: - max limit address
> - * @size_aligned: - set if size_aligned address range is required
> - * This function allocates an iova in the range iovad->start_pfn to limit_pfn,
> - * searching top-down from limit_pfn to iovad->start_pfn. If the size_aligned
> - * flag is set then the allocated address iova->pfn_lo will be naturally
> - * aligned on roundup_power_of_two(size).
> + * reserve_iova - reserves an iova in the given range
> + * @iovad: - iova domain pointer
> + * @pfn_lo: - lower page frame address
> + * @pfn_hi:- higher pfn adderss
> + * This function allocates reserves the address range from pfn_lo to pfn_hi so
> + * that this address is not dished out as part of alloc_iova.
>    */
>   struct iova *
> -alloc_iova(struct iova_domain *iovad, unsigned long size,
> -	unsigned long limit_pfn,
> -	bool size_aligned)
> +reserve_iova(struct iova_domain *iovad,
> +	unsigned long pfn_lo, unsigned long pfn_hi)
>   {
> -	struct iova *new_iova;
> -	int ret;
> +	struct rb_node *node;
> +	unsigned long flags;
> +	struct iova *iova;
> +	unsigned int overlap = 0;
>   
> -	new_iova = alloc_iova_mem();
> -	if (!new_iova)
> +	/* Don't allow nonsensical pfns */
> +	if (WARN_ON((pfn_hi | pfn_lo) > (ULLONG_MAX >> iova_shift(iovad))))
>   		return NULL;
>   
> -	ret = __alloc_and_insert_iova_range(iovad, size, limit_pfn + 1,
> -			new_iova, size_aligned);
> +	spin_lock_irqsave(&iovad->iova_rbtree_lock, flags);
> +	for (node = rb_first(&iovad->rbroot); node; node = rb_next(node)) {
> +		if (__is_range_overlap(node, pfn_lo, pfn_hi)) {
> +			iova = to_iova(node);
> +			__adjust_overlap_range(iova, &pfn_lo, &pfn_hi);
> +			if ((pfn_lo >= iova->pfn_lo) &&
> +				(pfn_hi <= iova->pfn_hi))
> +				goto finish;
> +			overlap = 1;
>   
> -	if (ret) {
> -		free_iova_mem(new_iova);
> -		return NULL;
> +		} else if (overlap)
> +			break;
>   	}
>   
> -	return new_iova;
> +	/* We are here either because this is the first reserver node
> +	 * or need to insert remaining non overlap addr range
> +	 */
> +	iova = __insert_new_range(iovad, pfn_lo, pfn_hi);
> +finish:
> +
> +	spin_unlock_irqrestore(&iovad->iova_rbtree_lock, flags);
> +	return iova;
>   }
> -EXPORT_SYMBOL_GPL(alloc_iova);
> +EXPORT_SYMBOL_GPL(reserve_iova);
>   
>   static struct iova *
>   private_find_iova(struct iova_domain *iovad, unsigned long pfn)
> @@ -356,6 +234,122 @@ static void remove_iova(struct iova_domain *iovad, struct iova *iova)
>   	rb_erase(&iova->node, &iovad->rbroot);
>   }
>   
> +static struct rb_node *
> +__get_cached_rbnode(struct iova_domain *iovad, unsigned long limit_pfn)
> +{
> +	if (limit_pfn <= iovad->dma_32bit_pfn)
> +		return iovad->cached32_node;
> +
> +	return iovad->cached_node;
> +}
> +
> +static void
> +__cached_rbnode_insert_update(struct iova_domain *iovad, struct iova *new)
> +{
> +	if (new->pfn_hi < iovad->dma_32bit_pfn)
> +		iovad->cached32_node = &new->node;
> +	else
> +		iovad->cached_node = &new->node;
> +}
> +
> +static struct rb_node *iova_find_limit(struct iova_domain *iovad, unsigned long limit_pfn)
> +{
> +	struct rb_node *node, *next;
> +	/*
> +	 * Ideally what we'd like to judge here is whether limit_pfn is close
> +	 * enough to the highest-allocated IOVA that starting the allocation
> +	 * walk from the anchor node will be quicker than this initial work to
> +	 * find an exact starting point (especially if that ends up being the
> +	 * anchor node anyway). This is an incredibly crude approximation which
> +	 * only really helps the most likely case, but is at least trivially easy.
> +	 */
> +	if (limit_pfn > iovad->dma_32bit_pfn)
> +		return &iovad->anchor.node;
> +
> +	node = iovad->rbroot.rb_node;
> +	while (to_iova(node)->pfn_hi < limit_pfn)
> +		node = node->rb_right;
> +
> +search_left:
> +	while (node->rb_left && to_iova(node->rb_left)->pfn_lo >= limit_pfn)
> +		node = node->rb_left;
> +
> +	if (!node->rb_left)
> +		return node;
> +
> +	next = node->rb_left;
> +	while (next->rb_right) {
> +		next = next->rb_right;
> +		if (to_iova(next)->pfn_lo >= limit_pfn) {
> +			node = next;
> +			goto search_left;
> +		}
> +	}
> +
> +	return node;
> +}
> +
> +static int __alloc_and_insert_iova_range(struct iova_domain *iovad,
> +		unsigned long size, unsigned long limit_pfn,
> +			struct iova *new, bool size_aligned)
> +{
> +	struct rb_node *curr, *prev;
> +	struct iova *curr_iova;
> +	unsigned long flags;
> +	unsigned long new_pfn, retry_pfn;
> +	unsigned long align_mask = ~0UL;
> +	unsigned long high_pfn = limit_pfn, low_pfn = iovad->start_pfn;
> +
> +	if (size_aligned)
> +		align_mask <<= fls_long(size - 1);
> +
> +	/* Walk the tree backwards */
> +	spin_lock_irqsave(&iovad->iova_rbtree_lock, flags);
> +	if (limit_pfn <= iovad->dma_32bit_pfn &&
> +			size >= iovad->max32_alloc_size)
> +		goto iova32_full;
> +
> +	curr = __get_cached_rbnode(iovad, limit_pfn);
> +	curr_iova = to_iova(curr);
> +	retry_pfn = curr_iova->pfn_hi + 1;
> +
> +retry:
> +	do {
> +		high_pfn = min(high_pfn, curr_iova->pfn_lo);
> +		new_pfn = (high_pfn - size) & align_mask;
> +		prev = curr;
> +		curr = rb_prev(curr);
> +		curr_iova = to_iova(curr);
> +	} while (curr && new_pfn <= curr_iova->pfn_hi && new_pfn >= low_pfn);
> +
> +	if (high_pfn < size || new_pfn < low_pfn) {
> +		if (low_pfn == iovad->start_pfn && retry_pfn < limit_pfn) {
> +			high_pfn = limit_pfn;
> +			low_pfn = retry_pfn;
> +			curr = iova_find_limit(iovad, limit_pfn);
> +			curr_iova = to_iova(curr);
> +			goto retry;
> +		}
> +		iovad->max32_alloc_size = size;
> +		goto iova32_full;
> +	}
> +
> +	/* pfn_lo will point to size aligned address if size_aligned is set */
> +	new->pfn_lo = new_pfn;
> +	new->pfn_hi = new->pfn_lo + size - 1;
> +
> +	/* If we have 'prev', it's a valid place to start the insertion. */
> +	iova_insert_rbtree(&iovad->rbroot, new, prev);
> +	__cached_rbnode_insert_update(iovad, new);
> +
> +	spin_unlock_irqrestore(&iovad->iova_rbtree_lock, flags);
> +	return 0;
> +
> +iova32_full:
> +	spin_unlock_irqrestore(&iovad->iova_rbtree_lock, flags);
> +	return -ENOMEM;
> +}
> +
>   /**
>    * find_iova - finds an iova for a given pfn
>    * @iovad: - iova domain in question.
> @@ -376,6 +370,41 @@ struct iova *find_iova(struct iova_domain *iovad, unsigned long pfn)
>   }
>   EXPORT_SYMBOL_GPL(find_iova);
>   
> +/**
> + * alloc_iova - allocates an iova
> + * @iovad: - iova domain in question
> + * @size: - size of page frames to allocate
> + * @limit_pfn: - max limit address
> + * @size_aligned: - set if size_aligned address range is required
> + * This function allocates an iova in the range iovad->start_pfn to limit_pfn,
> + * searching top-down from limit_pfn to iovad->start_pfn. If the size_aligned
> + * flag is set then the allocated address iova->pfn_lo will be naturally
> + * aligned on roundup_power_of_two(size).
> + */
> +struct iova *
> +alloc_iova(struct iova_domain *iovad, unsigned long size,
> +	unsigned long limit_pfn,
> +	bool size_aligned)
> +{
> +	struct iova *new_iova;
> +	int ret;
> +
> +	new_iova = alloc_iova_mem();
> +	if (!new_iova)
> +		return NULL;
> +
> +	ret = __alloc_and_insert_iova_range(iovad, size, limit_pfn + 1,
> +			new_iova, size_aligned);
> +
> +	if (ret) {
> +		free_iova_mem(new_iova);
> +		return NULL;
> +	}
> +
> +	return new_iova;
> +}
> +EXPORT_SYMBOL_GPL(alloc_iova);
> +
>   /**
>    * __free_iova - frees the given iova
>    * @iovad: iova domain in question.
> @@ -419,231 +448,52 @@ free_iova(struct iova_domain *iovad, unsigned long pfn)
>   }
>   EXPORT_SYMBOL_GPL(free_iova);
>   
> -/**
> - * alloc_iova_fast - allocates an iova from rcache
> - * @iovad: - iova domain in question
> - * @size: - size of page frames to allocate
> - * @limit_pfn: - max limit address
> - * @flush_rcache: - set to flush rcache on regular allocation failure
> - * This function tries to satisfy an iova allocation from the rcache,
> - * and falls back to regular allocation on failure. If regular allocation
> - * fails too and the flush_rcache flag is set then the rcache will be flushed.
> -*/
> -unsigned long
> -alloc_iova_fast(struct iova_domain *iovad, unsigned long size,
> -		unsigned long limit_pfn, bool flush_rcache)
> +static bool iova_magazine_full(struct iova_magazine *mag)
>   {
> -	unsigned long iova_pfn;
> -	struct iova *new_iova;
> -
> -	/*
> -	 * Freeing non-power-of-two-sized allocations back into the IOVA caches
> -	 * will come back to bite us badly, so we have to waste a bit of space
> -	 * rounding up anything cacheable to make sure that can't happen. The
> -	 * order of the unadjusted size will still match upon freeing.
> -	 */
> -	if (size < (1 << (IOVA_RANGE_CACHE_MAX_SIZE - 1)))
> -		size = roundup_pow_of_two(size);
> +	return (mag && mag->size == IOVA_MAG_SIZE);
> +}
>   
> -	iova_pfn = iova_rcache_get(iovad, size, limit_pfn + 1);
> -	if (iova_pfn)
> -		return iova_pfn;
> +static void iova_magazine_push(struct iova_magazine *mag, unsigned long pfn)
> +{
> +	BUG_ON(iova_magazine_full(mag));
>   
> -retry:
> -	new_iova = alloc_iova(iovad, size, limit_pfn, true);
> -	if (!new_iova) {
> -		unsigned int cpu;
> +	mag->pfns[mag->size++] = pfn;
> +}
>   
> -		if (!flush_rcache)
> -			return 0;
> +static struct iova_magazine *iova_magazine_alloc(gfp_t flags)
> +{
> +	return kzalloc(sizeof(struct iova_magazine), flags);
> +}
>   
> -		/* Try replenishing IOVAs by flushing rcache. */
> -		flush_rcache = false;
> -		for_each_online_cpu(cpu)
> -			free_cpu_cached_iovas(cpu, iovad);
> -		free_global_cached_iovas(iovad);
> -		goto retry;
> -	}
> +static void iova_magazine_free(struct iova_magazine *mag)
> +{
> +	kfree(mag);
> +}
>   
> -	return new_iova->pfn_lo;
> +static bool iova_magazine_empty(struct iova_magazine *mag)
> +{
> +	return (!mag || mag->size == 0);
>   }
> -EXPORT_SYMBOL_GPL(alloc_iova_fast);
>   
> -/**
> - * free_iova_fast - free iova pfn range into rcache
> - * @iovad: - iova domain in question.
> - * @pfn: - pfn that is allocated previously
> - * @size: - # of pages in range
> - * This functions frees an iova range by trying to put it into the rcache,
> - * falling back to regular iova deallocation via free_iova() if this fails.
> - */
> -void
> -free_iova_fast(struct iova_domain *iovad, unsigned long pfn, unsigned long size)
> -{
> -	if (iova_rcache_insert(iovad, pfn, size))
> -		return;
> -
> -	free_iova(iovad, pfn);
> -}
> -EXPORT_SYMBOL_GPL(free_iova_fast);
> -
> -static void iova_domain_free_rcaches(struct iova_domain *iovad)
> -{
> -	cpuhp_state_remove_instance_nocalls(CPUHP_IOMMU_IOVA_DEAD,
> -					    &iovad->cpuhp_dead);
> -	free_iova_rcaches(iovad);
> -}
> -
> -/**
> - * put_iova_domain - destroys the iova domain
> - * @iovad: - iova domain in question.
> - * All the iova's in that domain are destroyed.
> - */
> -void put_iova_domain(struct iova_domain *iovad)
> -{
> -	struct iova *iova, *tmp;
> -
> -	if (iovad->rcaches)
> -		iova_domain_free_rcaches(iovad);
> -
> -	rbtree_postorder_for_each_entry_safe(iova, tmp, &iovad->rbroot, node)
> -		free_iova_mem(iova);
> -}
> -EXPORT_SYMBOL_GPL(put_iova_domain);
> -
> -static int
> -__is_range_overlap(struct rb_node *node,
> -	unsigned long pfn_lo, unsigned long pfn_hi)
> -{
> -	struct iova *iova = to_iova(node);
> -
> -	if ((pfn_lo <= iova->pfn_hi) && (pfn_hi >= iova->pfn_lo))
> -		return 1;
> -	return 0;
> -}
> -
> -static inline struct iova *
> -alloc_and_init_iova(unsigned long pfn_lo, unsigned long pfn_hi)
> -{
> -	struct iova *iova;
> -
> -	iova = alloc_iova_mem();
> -	if (iova) {
> -		iova->pfn_lo = pfn_lo;
> -		iova->pfn_hi = pfn_hi;
> -	}
> -
> -	return iova;
> -}
> -
> -static struct iova *
> -__insert_new_range(struct iova_domain *iovad,
> -	unsigned long pfn_lo, unsigned long pfn_hi)
> -{
> -	struct iova *iova;
> -
> -	iova = alloc_and_init_iova(pfn_lo, pfn_hi);
> -	if (iova)
> -		iova_insert_rbtree(&iovad->rbroot, iova, NULL);
> -
> -	return iova;
> -}
> -
> -static void
> -__adjust_overlap_range(struct iova *iova,
> -	unsigned long *pfn_lo, unsigned long *pfn_hi)
> -{
> -	if (*pfn_lo < iova->pfn_lo)
> -		iova->pfn_lo = *pfn_lo;
> -	if (*pfn_hi > iova->pfn_hi)
> -		*pfn_lo = iova->pfn_hi + 1;
> -}
> -
> -/**
> - * reserve_iova - reserves an iova in the given range
> - * @iovad: - iova domain pointer
> - * @pfn_lo: - lower page frame address
> - * @pfn_hi:- higher pfn adderss
> - * This function allocates reserves the address range from pfn_lo to pfn_hi so
> - * that this address is not dished out as part of alloc_iova.
> - */
> -struct iova *
> -reserve_iova(struct iova_domain *iovad,
> -	unsigned long pfn_lo, unsigned long pfn_hi)
> +static unsigned long iova_magazine_pop(struct iova_magazine *mag,
> +				       unsigned long limit_pfn)
>   {
> -	struct rb_node *node;
> -	unsigned long flags;
> -	struct iova *iova;
> -	unsigned int overlap = 0;
> -
> -	/* Don't allow nonsensical pfns */
> -	if (WARN_ON((pfn_hi | pfn_lo) > (ULLONG_MAX >> iova_shift(iovad))))
> -		return NULL;
> -
> -	spin_lock_irqsave(&iovad->iova_rbtree_lock, flags);
> -	for (node = rb_first(&iovad->rbroot); node; node = rb_next(node)) {
> -		if (__is_range_overlap(node, pfn_lo, pfn_hi)) {
> -			iova = to_iova(node);
> -			__adjust_overlap_range(iova, &pfn_lo, &pfn_hi);
> -			if ((pfn_lo >= iova->pfn_lo) &&
> -				(pfn_hi <= iova->pfn_hi))
> -				goto finish;
> -			overlap = 1;
> -
> -		} else if (overlap)
> -				break;
> -	}
> -
> -	/* We are here either because this is the first reserver node
> -	 * or need to insert remaining non overlap addr range
> -	 */
> -	iova = __insert_new_range(iovad, pfn_lo, pfn_hi);
> -finish:
> -
> -	spin_unlock_irqrestore(&iovad->iova_rbtree_lock, flags);
> -	return iova;
> -}
> -EXPORT_SYMBOL_GPL(reserve_iova);
> -
> -/*
> - * Magazine caches for IOVA ranges.  For an introduction to magazines,
> - * see the USENIX 2001 paper "Magazines and Vmem: Extending the Slab
> - * Allocator to Many CPUs and Arbitrary Resources" by Bonwick and Adams.
> - * For simplicity, we use a static magazine size and don't implement the
> - * dynamic size tuning described in the paper.
> - */
> -
> -#define IOVA_MAG_SIZE 128
> -#define MAX_GLOBAL_MAGS 32	/* magazines per bin */
> -
> -struct iova_magazine {
> -	unsigned long size;
> -	unsigned long pfns[IOVA_MAG_SIZE];
> -};
> +	int i;
> +	unsigned long pfn;
>   
> -struct iova_cpu_rcache {
> -	spinlock_t lock;
> -	struct iova_magazine *loaded;
> -	struct iova_magazine *prev;
> -};
> +	BUG_ON(iova_magazine_empty(mag));
>   
> -struct iova_rcache {
> -	spinlock_t lock;
> -	unsigned long depot_size;
> -	struct iova_magazine *depot[MAX_GLOBAL_MAGS];
> -	struct iova_cpu_rcache __percpu *cpu_rcaches;
> -};
> +	/* Only fall back to the rbtree if we have no suitable pfns at all */
> +	for (i = mag->size - 1; mag->pfns[i] > limit_pfn; i--)
> +		if (i == 0)
> +			return 0;
>   
> -static struct iova_magazine *iova_magazine_alloc(gfp_t flags)
> -{
> -	return kzalloc(sizeof(struct iova_magazine), flags);
> -}
> +	/* Swap it to pop it */
> +	pfn = mag->pfns[i];
> +	mag->pfns[i] = mag->pfns[--mag->size];
>   
> -static void iova_magazine_free(struct iova_magazine *mag)
> -{
> -	kfree(mag);
> +	return pfn;
>   }
> -
>   static void
>   iova_magazine_free_pfns(struct iova_magazine *mag, struct iova_domain *iovad)
>   {
> @@ -670,91 +520,91 @@ iova_magazine_free_pfns(struct iova_magazine *mag, struct iova_domain *iovad)
>   	mag->size = 0;
>   }
>   
> -static bool iova_magazine_full(struct iova_magazine *mag)
> +/*
> + * free all the IOVA ranges cached by a cpu (used when cpu is unplugged)
> + */
> +static void free_cpu_cached_iovas(unsigned int cpu, struct iova_domain *iovad)
>   {
> -	return (mag && mag->size == IOVA_MAG_SIZE);
> -}
> +	struct iova_cpu_rcache *cpu_rcache;
> +	struct iova_rcache *rcache;
> +	unsigned long flags;
> +	int i;
>   
> -static bool iova_magazine_empty(struct iova_magazine *mag)
> -{
> -	return (!mag || mag->size == 0);
> +	for (i = 0; i < IOVA_RANGE_CACHE_MAX_SIZE; ++i) {
> +		rcache = &iovad->rcaches[i];
> +		cpu_rcache = per_cpu_ptr(rcache->cpu_rcaches, cpu);
> +		spin_lock_irqsave(&cpu_rcache->lock, flags);
> +		iova_magazine_free_pfns(cpu_rcache->loaded, iovad);
> +		iova_magazine_free_pfns(cpu_rcache->prev, iovad);
> +		spin_unlock_irqrestore(&cpu_rcache->lock, flags);
> +	}
>   }
>   
> -static unsigned long iova_magazine_pop(struct iova_magazine *mag,
> -				       unsigned long limit_pfn)
> +static int iova_cpuhp_dead(unsigned int cpu, struct hlist_node *node)
>   {
> -	int i;
> -	unsigned long pfn;
> -
> -	BUG_ON(iova_magazine_empty(mag));
> -
> -	/* Only fall back to the rbtree if we have no suitable pfns at all */
> -	for (i = mag->size - 1; mag->pfns[i] > limit_pfn; i--)
> -		if (i == 0)
> -			return 0;
> +	struct iova_domain *iovad;
>   
> -	/* Swap it to pop it */
> -	pfn = mag->pfns[i];
> -	mag->pfns[i] = mag->pfns[--mag->size];
> +	iovad = hlist_entry_safe(node, struct iova_domain, cpuhp_dead);
>   
> -	return pfn;
> +	free_cpu_cached_iovas(cpu, iovad);
> +	return 0;
>   }
>   
> -static void iova_magazine_push(struct iova_magazine *mag, unsigned long pfn)
> +/*
> + * free all the IOVA ranges of global cache
> + */
> +static void free_global_cached_iovas(struct iova_domain *iovad)
>   {
> -	BUG_ON(iova_magazine_full(mag));
> +	struct iova_rcache *rcache;
> +	unsigned long flags;
> +	int i, j;
>   
> -	mag->pfns[mag->size++] = pfn;
> +	for (i = 0; i < IOVA_RANGE_CACHE_MAX_SIZE; ++i) {
> +		rcache = &iovad->rcaches[i];
> +		spin_lock_irqsave(&rcache->lock, flags);
> +		for (j = 0; j < rcache->depot_size; ++j) {
> +			iova_magazine_free_pfns(rcache->depot[j], iovad);
> +			iova_magazine_free(rcache->depot[j]);
> +		}
> +		rcache->depot_size = 0;
> +		spin_unlock_irqrestore(&rcache->lock, flags);
> +	}
>   }
>   
> -int iova_domain_init_rcaches(struct iova_domain *iovad)
> +/*
> + * free rcache data structures.
> + */
> +static void free_iova_rcaches(struct iova_domain *iovad)
>   {
> +	struct iova_rcache *rcache;
> +	struct iova_cpu_rcache *cpu_rcache;
>   	unsigned int cpu;
> -	int i, ret;
> -
> -	iovad->rcaches = kcalloc(IOVA_RANGE_CACHE_MAX_SIZE,
> -				 sizeof(struct iova_rcache),
> -				 GFP_KERNEL);
> -	if (!iovad->rcaches)
> -		return -ENOMEM;
> +	int i, j;
>   
>   	for (i = 0; i < IOVA_RANGE_CACHE_MAX_SIZE; ++i) {
> -		struct iova_cpu_rcache *cpu_rcache;
> -		struct iova_rcache *rcache;
> -
>   		rcache = &iovad->rcaches[i];
> -		spin_lock_init(&rcache->lock);
> -		rcache->depot_size = 0;
> -		rcache->cpu_rcaches = __alloc_percpu(sizeof(*cpu_rcache),
> -						     cache_line_size());
> -		if (!rcache->cpu_rcaches) {
> -			ret = -ENOMEM;
> -			goto out_err;
> -		}
> -		for_each_possible_cpu(cpu) {
> -			cpu_rcache = per_cpu_ptr(rcache->cpu_rcaches, cpu);
> -
> -			spin_lock_init(&cpu_rcache->lock);
> -			cpu_rcache->loaded = iova_magazine_alloc(GFP_KERNEL);
> -			cpu_rcache->prev = iova_magazine_alloc(GFP_KERNEL);
> -			if (!cpu_rcache->loaded || !cpu_rcache->prev) {
> -				ret = -ENOMEM;
> -				goto out_err;
> -			}
> +		if (!rcache->cpu_rcaches)
> +			break;
> +		for_each_possible_cpu(cpu) {
> +			cpu_rcache = per_cpu_ptr(rcache->cpu_rcaches, cpu);
> +			iova_magazine_free(cpu_rcache->loaded);
> +			iova_magazine_free(cpu_rcache->prev);
>   		}
> +		free_percpu(rcache->cpu_rcaches);
> +		for (j = 0; j < rcache->depot_size; ++j)
> +			iova_magazine_free(rcache->depot[j]);
>   	}
>   
> -	ret = cpuhp_state_add_instance_nocalls(CPUHP_IOMMU_IOVA_DEAD,
> -					       &iovad->cpuhp_dead);
> -	if (ret)
> -		goto out_err;
> -	return 0;
> +	kfree(iovad->rcaches);
> +	iovad->rcaches = NULL;
> +}
>   
> -out_err:
> +static void iova_domain_free_rcaches(struct iova_domain *iovad)
> +{
> +	cpuhp_state_remove_instance_nocalls(CPUHP_IOMMU_IOVA_DEAD,
> +					    &iovad->cpuhp_dead);
>   	free_iova_rcaches(iovad);
> -	return ret;
>   }
> -EXPORT_SYMBOL_GPL(iova_domain_init_rcaches);
>   
>   /*
>    * Try inserting IOVA range starting with 'iova_pfn' into 'rcache', and
> @@ -877,73 +727,212 @@ static unsigned long iova_rcache_get(struct iova_domain *iovad,
>   	return __iova_rcache_get(&iovad->rcaches[log_size], limit_pfn - size);
>   }
>   
> -/*
> - * free rcache data structures.
> - */
> -static void free_iova_rcaches(struct iova_domain *iovad)
> +int iova_cache_get(void)
>   {
> -	struct iova_rcache *rcache;
> -	struct iova_cpu_rcache *cpu_rcache;
> -	unsigned int cpu;
> -	int i, j;
> +	mutex_lock(&iova_cache_mutex);
> +	if (!iova_cache_users) {
> +		int ret;
>   
> -	for (i = 0; i < IOVA_RANGE_CACHE_MAX_SIZE; ++i) {
> -		rcache = &iovad->rcaches[i];
> -		if (!rcache->cpu_rcaches)
> -			break;
> -		for_each_possible_cpu(cpu) {
> -			cpu_rcache = per_cpu_ptr(rcache->cpu_rcaches, cpu);
> -			iova_magazine_free(cpu_rcache->loaded);
> -			iova_magazine_free(cpu_rcache->prev);
> +		ret = cpuhp_setup_state_multi(CPUHP_IOMMU_IOVA_DEAD, "iommu/iova:dead", NULL,
> +					iova_cpuhp_dead);
> +		if (ret) {
> +			mutex_unlock(&iova_cache_mutex);
> +			pr_err("Couldn't register cpuhp handler\n");
> +			return ret;
> +		}
> +
> +		iova_cache = kmem_cache_create(
> +			"iommu_iova", sizeof(struct iova), 0,
> +			SLAB_HWCACHE_ALIGN, NULL);
> +		if (!iova_cache) {
> +			cpuhp_remove_multi_state(CPUHP_IOMMU_IOVA_DEAD);
> +			mutex_unlock(&iova_cache_mutex);
> +			pr_err("Couldn't create iova cache\n");
> +			return -ENOMEM;
>   		}
> -		free_percpu(rcache->cpu_rcaches);
> -		for (j = 0; j < rcache->depot_size; ++j)
> -			iova_magazine_free(rcache->depot[j]);
>   	}
>   
> -	kfree(iovad->rcaches);
> -	iovad->rcaches = NULL;
> +	iova_cache_users++;
> +	mutex_unlock(&iova_cache_mutex);
> +
> +	return 0;
>   }
> +EXPORT_SYMBOL_GPL(iova_cache_get);
>   
> -/*
> - * free all the IOVA ranges cached by a cpu (used when cpu is unplugged)
> +void iova_cache_put(void)
> +{
> +	mutex_lock(&iova_cache_mutex);
> +	if (WARN_ON(!iova_cache_users)) {
> +		mutex_unlock(&iova_cache_mutex);
> +		return;
> +	}
> +	iova_cache_users--;
> +	if (!iova_cache_users) {
> +		cpuhp_remove_multi_state(CPUHP_IOMMU_IOVA_DEAD);
> +		kmem_cache_destroy(iova_cache);
> +	}
> +	mutex_unlock(&iova_cache_mutex);
> +}
> +EXPORT_SYMBOL_GPL(iova_cache_put);
> +
> +/**
> + * alloc_iova_fast - allocates an iova from rcache
> + * @iovad: - iova domain in question
> + * @size: - size of page frames to allocate
> + * @limit_pfn: - max limit address
> + * @flush_rcache: - set to flush rcache on regular allocation failure
> + * This function tries to satisfy an iova allocation from the rcache,
> + * and falls back to regular allocation on failure. If regular allocation
> + * fails too and the flush_rcache flag is set then the rcache will be flushed.
>    */
> -static void free_cpu_cached_iovas(unsigned int cpu, struct iova_domain *iovad)
> +unsigned long
> +alloc_iova_fast(struct iova_domain *iovad, unsigned long size,
> +		unsigned long limit_pfn, bool flush_rcache)
>   {
> -	struct iova_cpu_rcache *cpu_rcache;
> -	struct iova_rcache *rcache;
> -	unsigned long flags;
> -	int i;
> +	unsigned long iova_pfn;
> +	struct iova *new_iova;
>   
> -	for (i = 0; i < IOVA_RANGE_CACHE_MAX_SIZE; ++i) {
> -		rcache = &iovad->rcaches[i];
> -		cpu_rcache = per_cpu_ptr(rcache->cpu_rcaches, cpu);
> -		spin_lock_irqsave(&cpu_rcache->lock, flags);
> -		iova_magazine_free_pfns(cpu_rcache->loaded, iovad);
> -		iova_magazine_free_pfns(cpu_rcache->prev, iovad);
> -		spin_unlock_irqrestore(&cpu_rcache->lock, flags);
> +	/*
> +	 * Freeing non-power-of-two-sized allocations back into the IOVA caches
> +	 * will come back to bite us badly, so we have to waste a bit of space
> +	 * rounding up anything cacheable to make sure that can't happen. The
> +	 * order of the unadjusted size will still match upon freeing.
> +	 */
> +	if (size < (1 << (IOVA_RANGE_CACHE_MAX_SIZE - 1)))
> +		size = roundup_pow_of_two(size);
> +
> +	iova_pfn = iova_rcache_get(iovad, size, limit_pfn + 1);
> +	if (iova_pfn)
> +		return iova_pfn;
> +
> +retry:
> +	new_iova = alloc_iova(iovad, size, limit_pfn, true);
> +	if (!new_iova) {
> +		unsigned int cpu;
> +
> +		if (!flush_rcache)
> +			return 0;
> +
> +		/* Try replenishing IOVAs by flushing rcache. */
> +		flush_rcache = false;
> +		for_each_online_cpu(cpu)
> +			free_cpu_cached_iovas(cpu, iovad);
> +		free_global_cached_iovas(iovad);
> +		goto retry;
>   	}
> +
> +	return new_iova->pfn_lo;
>   }
> +EXPORT_SYMBOL_GPL(alloc_iova_fast);
>   
> -/*
> - * free all the IOVA ranges of global cache
> +/**
> + * free_iova_fast - free iova pfn range into rcache
> + * @iovad: - iova domain in question.
> + * @pfn: - pfn that is allocated previously
> + * @size: - # of pages in range
> + * This functions frees an iova range by trying to put it into the rcache,
> + * falling back to regular iova deallocation via free_iova() if this fails.
>    */
> -static void free_global_cached_iovas(struct iova_domain *iovad)
> +void
> +free_iova_fast(struct iova_domain *iovad, unsigned long pfn, unsigned long size)
>   {
> -	struct iova_rcache *rcache;
> -	unsigned long flags;
> -	int i, j;
> +	if (iova_rcache_insert(iovad, pfn, size))
> +		return;
> +
> +	free_iova(iovad, pfn);
> +}
> +EXPORT_SYMBOL_GPL(free_iova_fast);
> +
> +int iova_domain_init_rcaches(struct iova_domain *iovad)
> +{
> +	unsigned int cpu;
> +	int i, ret;
> +
> +	iovad->rcaches = kcalloc(IOVA_RANGE_CACHE_MAX_SIZE,
> +				 sizeof(struct iova_rcache),
> +				 GFP_KERNEL);
> +	if (!iovad->rcaches)
> +		return -ENOMEM;
>   
>   	for (i = 0; i < IOVA_RANGE_CACHE_MAX_SIZE; ++i) {
> +		struct iova_cpu_rcache *cpu_rcache;
> +		struct iova_rcache *rcache;
> +
>   		rcache = &iovad->rcaches[i];
> -		spin_lock_irqsave(&rcache->lock, flags);
> -		for (j = 0; j < rcache->depot_size; ++j) {
> -			iova_magazine_free_pfns(rcache->depot[j], iovad);
> -			iova_magazine_free(rcache->depot[j]);
> -		}
> +		spin_lock_init(&rcache->lock);
>   		rcache->depot_size = 0;
> -		spin_unlock_irqrestore(&rcache->lock, flags);
> +		rcache->cpu_rcaches = __alloc_percpu(sizeof(*cpu_rcache),
> +						     cache_line_size());
> +		if (!rcache->cpu_rcaches) {
> +			ret = -ENOMEM;
> +			goto out_err;
> +		}
> +		for_each_possible_cpu(cpu) {
> +			cpu_rcache = per_cpu_ptr(rcache->cpu_rcaches, cpu);
> +
> +			spin_lock_init(&cpu_rcache->lock);
> +			cpu_rcache->loaded = iova_magazine_alloc(GFP_KERNEL);
> +			cpu_rcache->prev = iova_magazine_alloc(GFP_KERNEL);
> +			if (!cpu_rcache->loaded || !cpu_rcache->prev) {
> +				ret = -ENOMEM;
> +				goto out_err;
> +			}
> +		}
>   	}
> +
> +	ret = cpuhp_state_add_instance_nocalls(CPUHP_IOMMU_IOVA_DEAD,
> +					       &iovad->cpuhp_dead);
> +	if (ret)
> +		goto out_err;
> +	return 0;
> +
> +out_err:
> +	free_iova_rcaches(iovad);
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(iova_domain_init_rcaches);
> +
> +void
> +init_iova_domain(struct iova_domain *iovad, unsigned long granule,
> +	unsigned long start_pfn)
> +{
> +	/*
> +	 * IOVA granularity will normally be equal to the smallest
> +	 * supported IOMMU page size; both *must* be capable of
> +	 * representing individual CPU pages exactly.
> +	 */
> +	BUG_ON((granule > PAGE_SIZE) || !is_power_of_2(granule));
> +
> +	spin_lock_init(&iovad->iova_rbtree_lock);
> +	iovad->rbroot = RB_ROOT;
> +	iovad->cached_node = &iovad->anchor.node;
> +	iovad->cached32_node = &iovad->anchor.node;
> +	iovad->granule = granule;
> +	iovad->start_pfn = start_pfn;
> +	iovad->dma_32bit_pfn = 1UL << (32 - iova_shift(iovad));
> +	iovad->max32_alloc_size = iovad->dma_32bit_pfn;
> +	iovad->anchor.pfn_lo = iovad->anchor.pfn_hi = IOVA_ANCHOR;
> +	rb_link_node(&iovad->anchor.node, NULL, &iovad->rbroot.rb_node);
> +	rb_insert_color(&iovad->anchor.node, &iovad->rbroot);
> +}
> +EXPORT_SYMBOL_GPL(init_iova_domain);
> +
> +/**
> + * put_iova_domain - destroys the iova domain
> + * @iovad: - iova domain in question.
> + * All the iova's in that domain are destroyed.
> + */
> +void put_iova_domain(struct iova_domain *iovad)
> +{
> +	struct iova *iova, *tmp;
> +
> +	if (iovad->rcaches)
> +		iova_domain_free_rcaches(iovad);
> +
> +	rbtree_postorder_for_each_entry_safe(iova, tmp, &iovad->rbroot, node)
> +		free_iova_mem(iova);
>   }
> +EXPORT_SYMBOL_GPL(put_iova_domain);
> +
>   MODULE_AUTHOR("Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>");
>   MODULE_LICENSE("GPL");
> diff --git a/include/linux/iova.h b/include/linux/iova.h
> index 320a70e40233..bcb24ebcd7f2 100644
> --- a/include/linux/iova.h
> +++ b/include/linux/iova.h
> @@ -76,35 +76,26 @@ static inline unsigned long iova_pfn(struct iova_domain *iovad, dma_addr_t iova)
>   }
>   
>   #if IS_ENABLED(CONFIG_IOMMU_IOVA)
> -int iova_cache_get(void);
> -void iova_cache_put(void);
>   
>   void free_iova(struct iova_domain *iovad, unsigned long pfn);
>   void __free_iova(struct iova_domain *iovad, struct iova *iova);
>   struct iova *alloc_iova(struct iova_domain *iovad, unsigned long size,
>   	unsigned long limit_pfn,
>   	bool size_aligned);
> +struct iova *reserve_iova(struct iova_domain *iovad, unsigned long pfn_lo,
> +	unsigned long pfn_hi);
> +struct iova *find_iova(struct iova_domain *iovad, unsigned long pfn);
> +int iova_cache_get(void);
> +void iova_cache_put(void);
>   void free_iova_fast(struct iova_domain *iovad, unsigned long pfn,
>   		    unsigned long size);
>   unsigned long alloc_iova_fast(struct iova_domain *iovad, unsigned long size,
>   			      unsigned long limit_pfn, bool flush_rcache);
> -struct iova *reserve_iova(struct iova_domain *iovad, unsigned long pfn_lo,
> -	unsigned long pfn_hi);
> +int iova_domain_init_rcaches(struct iova_domain *iovad);
>   void init_iova_domain(struct iova_domain *iovad, unsigned long granule,
>   	unsigned long start_pfn);
> -int iova_domain_init_rcaches(struct iova_domain *iovad);
> -struct iova *find_iova(struct iova_domain *iovad, unsigned long pfn);
>   void put_iova_domain(struct iova_domain *iovad);
>   #else
> -static inline int iova_cache_get(void)
> -{
> -	return -ENOTSUPP;
> -}
> -
> -static inline void iova_cache_put(void)
> -{
> -}
> -
>   static inline void free_iova(struct iova_domain *iovad, unsigned long pfn)
>   {
>   }
> @@ -121,6 +112,29 @@ static inline struct iova *alloc_iova(struct iova_domain *iovad,
>   	return NULL;
>   }
>   
> +static inline struct iova *reserve_iova(struct iova_domain *iovad,
> +					unsigned long pfn_lo,
> +					unsigned long pfn_hi)
> +{
> +	return NULL;
> +}
> +
> +static inline struct iova *find_iova(struct iova_domain *iovad,
> +				     unsigned long pfn)
> +{
> +	return NULL;
> +}
> +
> +
> +static inline int iova_cache_get(void)
> +{
> +	return -ENOTSUPP;
> +}
> +
> +static inline void iova_cache_put(void)
> +{
> +}
> +
>   static inline void free_iova_fast(struct iova_domain *iovad,
>   				  unsigned long pfn,
>   				  unsigned long size)
> @@ -135,25 +149,12 @@ static inline unsigned long alloc_iova_fast(struct iova_domain *iovad,
>   	return 0;
>   }
>   
> -static inline struct iova *reserve_iova(struct iova_domain *iovad,
> -					unsigned long pfn_lo,
> -					unsigned long pfn_hi)
> -{
> -	return NULL;
> -}
> -
>   static inline void init_iova_domain(struct iova_domain *iovad,
>   				    unsigned long granule,
>   				    unsigned long start_pfn)
>   {
>   }
>   
> -static inline struct iova *find_iova(struct iova_domain *iovad,
> -				     unsigned long pfn)
> -{
> -	return NULL;
> -}
> -
>   static inline void put_iova_domain(struct iova_domain *iovad)
>   {
>   }


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu

