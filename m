Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE51351727
	for <lists.iommu@lfdr.de>; Thu,  1 Apr 2021 19:19:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C426B405A8;
	Thu,  1 Apr 2021 17:19:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E5QretaQz_UQ; Thu,  1 Apr 2021 17:19:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9B90A405A6;
	Thu,  1 Apr 2021 17:19:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6DDBDC000A;
	Thu,  1 Apr 2021 17:19:41 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F3CDAC000A
 for <iommu@lists.linux-foundation.org>; Thu,  1 Apr 2021 17:19:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E16DB60BE8
 for <iommu@lists.linux-foundation.org>; Thu,  1 Apr 2021 17:19:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0s06kHDZH-V1 for <iommu@lists.linux-foundation.org>;
 Thu,  1 Apr 2021 17:19:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp3.osuosl.org (Postfix) with ESMTP id 93EC760BE5
 for <iommu@lists.linux-foundation.org>; Thu,  1 Apr 2021 17:19:38 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6B9F811D4;
 Thu,  1 Apr 2021 10:19:37 -0700 (PDT)
Received: from [10.57.24.208] (unknown [10.57.24.208])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 84FCC3F792;
 Thu,  1 Apr 2021 10:19:36 -0700 (PDT)
Subject: Re: [RFC PATCH 4/5] iommu/io-pgtable-arm: Implement
 arm_lpae_unmap_pages()
To: "Isaac J. Manjarres" <isaacm@codeaurora.org>,
 iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org
References: <20210331030042.13348-1-isaacm@codeaurora.org>
 <20210331030042.13348-5-isaacm@codeaurora.org>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <b93fa0b1-e2a4-1aad-8b88-4d0dfecdfef7@arm.com>
Date: Thu, 1 Apr 2021 18:19:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210331030042.13348-5-isaacm@codeaurora.org>
Content-Language: en-GB
Cc: pratikp@codeaurora.org, will@kernel.org
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

On 2021-03-31 04:00, Isaac J. Manjarres wrote:
> Implement the unmap_pages() callback for the ARM LPAE io-pgtable
> format.
> 
> Signed-off-by: Isaac J. Manjarres <isaacm@codeaurora.org>
> Suggested-by: Will Deacon <will@kernel.org>
> ---
>   drivers/iommu/io-pgtable-arm.c | 114 +++++++++++++++++++++++++++------
>   1 file changed, 94 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
> index 87def58e79b5..6eccebf1744d 100644
> --- a/drivers/iommu/io-pgtable-arm.c
> +++ b/drivers/iommu/io-pgtable-arm.c
> @@ -248,10 +248,26 @@ static void __arm_lpae_set_pte(arm_lpae_iopte *ptep, arm_lpae_iopte pte,
>   		__arm_lpae_sync_pte(ptep, cfg);
>   }
>   
> +static void __arm_lpae_sync_ptes(arm_lpae_iopte *ptep, size_t num_ptes,
> +				 struct io_pgtable_cfg *cfg)
> +{
> +	dma_sync_single_for_device(cfg->iommu_dev, __arm_lpae_dma_addr(ptep),
> +				   sizeof(*ptep) * num_ptes, DMA_TO_DEVICE);
> +}
> +
> +static void __arm_lpae_clear_ptes(arm_lpae_iopte *ptep, size_t num_ptes,
> +				  struct io_pgtable_cfg *cfg)
> +{
> +	memset(ptep, 0, sizeof(*ptep) * num_ptes);
> +
> +	if (!cfg->coherent_walk)
> +		__arm_lpae_sync_ptes(ptep, num_ptes, cfg);
> +}
> +

It seesm like overkill to add separate functions - the existing ones 
could easily just take an extra argument, like we do for the v7s format.

>   static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
>   			       struct iommu_iotlb_gather *gather,
> -			       unsigned long iova, size_t size, int lvl,
> -			       arm_lpae_iopte *ptep);
> +			       unsigned long iova, size_t size, size_t pgcount,
> +			       int lvl, arm_lpae_iopte *ptep);
>   
>   static void __arm_lpae_init_pte(struct arm_lpae_io_pgtable *data,
>   				phys_addr_t paddr, arm_lpae_iopte prot,
> @@ -289,7 +305,7 @@ static int arm_lpae_init_pte(struct arm_lpae_io_pgtable *data,
>   		size_t sz = ARM_LPAE_BLOCK_SIZE(lvl, data);
>   
>   		tblp = ptep - ARM_LPAE_LVL_IDX(iova, lvl, data);
> -		if (__arm_lpae_unmap(data, NULL, iova, sz, lvl, tblp) != sz) {
> +		if (__arm_lpae_unmap(data, NULL, iova, sz, 1, lvl, tblp) != sz) {
>   			WARN_ON(1);
>   			return -EINVAL;
>   		}
> @@ -516,14 +532,14 @@ static size_t arm_lpae_split_blk_unmap(struct arm_lpae_io_pgtable *data,
>   				       struct iommu_iotlb_gather *gather,
>   				       unsigned long iova, size_t size,
>   				       arm_lpae_iopte blk_pte, int lvl,
> -				       arm_lpae_iopte *ptep)
> +				       arm_lpae_iopte *ptep, size_t pgcount)
>   {
>   	struct io_pgtable_cfg *cfg = &data->iop.cfg;
>   	arm_lpae_iopte pte, *tablep;
>   	phys_addr_t blk_paddr;
>   	size_t tablesz = ARM_LPAE_GRANULE(data);
>   	size_t split_sz = ARM_LPAE_BLOCK_SIZE(lvl, data);
> -	int i, unmap_idx = -1;
> +	int i, unmap_idx_start = -1;
>   
>   	if (WARN_ON(lvl == ARM_LPAE_MAX_LEVELS))
>   		return 0;
> @@ -533,14 +549,14 @@ static size_t arm_lpae_split_blk_unmap(struct arm_lpae_io_pgtable *data,
>   		return 0; /* Bytes unmapped */
>   
>   	if (size == split_sz)
> -		unmap_idx = ARM_LPAE_LVL_IDX(iova, lvl, data);
> +		unmap_idx_start = ARM_LPAE_LVL_IDX(iova, lvl, data);
>   
>   	blk_paddr = iopte_to_paddr(blk_pte, data);
>   	pte = iopte_prot(blk_pte);
>   
>   	for (i = 0; i < tablesz / sizeof(pte); i++, blk_paddr += split_sz) {
>   		/* Unmap! */
> -		if (i == unmap_idx)
> +		if (i >= unmap_idx_start && i < (unmap_idx_start + pgcount))
>   			continue;
>   
>   		__arm_lpae_init_pte(data, blk_paddr, pte, lvl, &tablep[i]);
> @@ -558,20 +574,24 @@ static size_t arm_lpae_split_blk_unmap(struct arm_lpae_io_pgtable *data,
>   			return 0;
>   
>   		tablep = iopte_deref(pte, data);
> -	} else if (unmap_idx >= 0) {
> -		io_pgtable_tlb_add_page(&data->iop, gather, iova, size);
> -		return size;
> +	} else if (unmap_idx_start >= 0) {
> +		for (i = 0; i < pgcount; i++) {
> +			io_pgtable_tlb_add_page(&data->iop, gather, iova, size);
> +			iova += size;
> +		}
> +		return pgcount * size;
>   	}
>   
> -	return __arm_lpae_unmap(data, gather, iova, size, lvl, tablep);
> +	return __arm_lpae_unmap(data, gather, iova, size, pgcount, lvl, tablep);
>   }
>   
>   static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
>   			       struct iommu_iotlb_gather *gather,
> -			       unsigned long iova, size_t size, int lvl,
> -			       arm_lpae_iopte *ptep)
> +			       unsigned long iova, size_t size, size_t pgcount,
> +			       int lvl, arm_lpae_iopte *ptep)
>   {
>   	arm_lpae_iopte pte;
> +	size_t i;
>   	struct io_pgtable *iop = &data->iop;
>   
>   	/* Something went horribly wrong and we ran out of page table */
> @@ -585,11 +605,11 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
>   
>   	/* If the size matches this level, we're in the right place */
>   	if (size == ARM_LPAE_BLOCK_SIZE(lvl, data)) {
> -		__arm_lpae_set_pte(ptep, 0, &iop->cfg);
> +		__arm_lpae_clear_ptes(ptep, pgcount, &iop->cfg);
>   
>   		if (!iopte_leaf(pte, lvl, iop->fmt)) {
>   			/* Also flush any partial walks */
> -			io_pgtable_tlb_flush_walk(iop, iova, size,
> +			io_pgtable_tlb_flush_walk(iop, iova, pgcount * size,
>   						  ARM_LPAE_GRANULE(data));
>   			ptep = iopte_deref(pte, data);
>   			__arm_lpae_free_pgtable(data, lvl + 1, ptep);
> @@ -601,22 +621,25 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
>   			 */
>   			smp_wmb();
>   		} else {
> -			io_pgtable_tlb_add_page(iop, gather, iova, size);
> +			for (i = 0; i < pgcount; i++) {
> +				io_pgtable_tlb_add_page(iop, gather, iova, size);
> +				iova += size;
> +			}
>   		}
>   
> -		return size;
> +		return pgcount * size;
>   	} else if (iopte_leaf(pte, lvl, iop->fmt)) {
>   		/*
>   		 * Insert a table at the next level to map the old region,
>   		 * minus the part we want to unmap
>   		 */
>   		return arm_lpae_split_blk_unmap(data, gather, iova, size, pte,
> -						lvl + 1, ptep);
> +						lvl + 1, ptep, pgcount);
>   	}
>   
>   	/* Keep on walkin' */
>   	ptep = iopte_deref(pte, data);
> -	return __arm_lpae_unmap(data, gather, iova, size, lvl + 1, ptep);
> +	return __arm_lpae_unmap(data, gather, iova, size, pgcount, lvl + 1, ptep);
>   }
>   
>   static size_t arm_lpae_unmap(struct io_pgtable_ops *ops, unsigned long iova,
> @@ -635,7 +658,57 @@ static size_t arm_lpae_unmap(struct io_pgtable_ops *ops, unsigned long iova,
>   	if (WARN_ON(iaext))
>   		return 0;
>   
> -	return __arm_lpae_unmap(data, gather, iova, size, data->start_level, ptep);
> +	return __arm_lpae_unmap(data, gather, iova, size, 1, data->start_level, ptep);
> +}
> +
> +static size_t arm_lpae_unmap_pages(struct io_pgtable_ops *ops, unsigned long iova,
> +				   size_t pgsize, size_t pgcount,
> +				   struct iommu_iotlb_gather *gather)
> +{
> +	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
> +	struct io_pgtable_cfg *cfg = &data->iop.cfg;
> +	arm_lpae_iopte *ptep = data->pgd;
> +	long iaext = (s64)iova >> cfg->ias;
> +	size_t unmapped = 0, unmapped_page;
> +	int last_lvl = data->start_level;
> +	size_t table_size, pages, tbl_offset, max_entries;
> +
> +	if (WARN_ON(!pgsize || (pgsize & cfg->pgsize_bitmap) != pgsize || !pgcount))
> +		return 0;
> +
> +	if (cfg->quirks & IO_PGTABLE_QUIRK_ARM_TTBR1)
> +		iaext = ~iaext;
> +	if (WARN_ON(iaext))
> +		return 0;
> +
> +	/*
> +	 * Calculating the page table size here helps avoid situations where
> +	 * a page range that is being unmapped may be mapped at the same level
> +	 * but not mapped by the same tables. Allowing such a scenario to
> +	 * occur can complicate the logic in arm_lpae_split_blk_unmap().
> +	 */
> +	while (ARM_LPAE_BLOCK_SIZE(last_lvl, data) != pgsize)
> +		last_lvl++;
> +
> +	table_size = last_lvl == data->start_level ? ARM_LPAE_PGD_SIZE(data) :
> +		ARM_LPAE_GRANULE(data);
> +	max_entries = table_size / sizeof(*ptep);

I'm really struggling to understand what's going on here :/

When would table_size ever not be equal to page_size? (In a way that 
matters - manipulating top-level block entries in a concatenated stage 2 
table is hardly going to be common enough to deserve specific optimisation)

> +	while (pgcount) {
> +		tbl_offset = ARM_LPAE_LVL_IDX(iova, last_lvl, data);
> +		pages = min_t(size_t, pgcount, max_entries - tbl_offset);
> +		unmapped_page = __arm_lpae_unmap(data, gather, iova, pgsize,
> +						 pages, data->start_level,
> +						 ptep);

This again seems less efficient than it deserves to be - iterating 
within __arm_lpae_unmap() itself would seem to make more sense than 
recursing all the way in and out multiple times per operation.

> +		if (!unmapped_page)
> +			break;
> +
> +		unmapped += unmapped_page;
> +		iova += unmapped_page;
> +		pgcount -= pages;
> +	}
> +
> +	return unmapped;
>   }
>   
>   static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
> @@ -751,6 +824,7 @@ arm_lpae_alloc_pgtable(struct io_pgtable_cfg *cfg)
>   	data->iop.ops = (struct io_pgtable_ops) {
>   		.map		= arm_lpae_map,
>   		.unmap		= arm_lpae_unmap,
> +		.unmap_pages	= arm_lpae_unmap_pages,

Why would we need to keep the old callback and have a bunch of 
duplicated code? Even fully converting all the users isn't _that_ 
involved, but having them just call .unmap_pages with n=1 is even less so.

Robin.

>   		.iova_to_phys	= arm_lpae_iova_to_phys,
>   	};
>   
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
