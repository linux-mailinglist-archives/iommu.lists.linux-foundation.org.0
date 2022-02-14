Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B124B4C8E
	for <lists.iommu@lfdr.de>; Mon, 14 Feb 2022 11:44:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 967CC402FB;
	Mon, 14 Feb 2022 10:44:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rPwUf_GDYrN7; Mon, 14 Feb 2022 10:44:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 6DBFF402AC;
	Mon, 14 Feb 2022 10:44:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1A405C000B;
	Mon, 14 Feb 2022 10:44:48 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2ED65C0011;
 Mon, 14 Feb 2022 10:44:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E0AFA60ECE;
 Mon, 14 Feb 2022 10:44:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4QMYo1neGAPn; Mon, 14 Feb 2022 10:44:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D417C60EC9;
 Mon, 14 Feb 2022 10:44:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2478160C43;
 Mon, 14 Feb 2022 10:44:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88B97C340F1;
 Mon, 14 Feb 2022 10:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644835482;
 bh=AUVszgovKphgBWrf1HKIDKsHgWZewjn5bxYg+MWsw8A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AxiZ9Up3ZHZBdQxrwzfOuHcrpCFJy2o1tCPaisl8caiVcdPkaNKeTvvzlD+85AJF9
 BQwrEOm5X3UaqYxXzrJK3TQSLDiTGc6FyGbylevhzCKdSagclSU1NENxWWWJ6mBDAA
 BJ5Gzj/KNcgaNNsc4nWCssWCXkuUvTtwxoUkmtVtb5vv1gNbq1wjPjHPfOzuzwCxAT
 +IYxVbzlzgNpK2/aHT11B+UldejrVB7+1A30LMPr8TEVtvFUVCvRsXlg6TbTAauask
 RKsRjikhVkQ85ALH28hCZq4KwINb5N2Nz+4qRVFO+cSA3TQn6JCBKIE9nmwOC/W4wh
 bUME5HMdSGC5g==
Date: Mon, 14 Feb 2022 12:44:32 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Zi Yan <ziy@nvidia.com>
Subject: Re: [PATCH v5 1/6] mm: page_isolation: move has_unmovable_pages() to
 mm/page_isolation.c
Message-ID: <YgoykFBUnEJ6Ynro@kernel.org>
References: <20220211164135.1803616-1-zi.yan@sent.com>
 <20220211164135.1803616-2-zi.yan@sent.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220211164135.1803616-2-zi.yan@sent.com>
Cc: Mel Gorman <mgorman@techsingularity.net>,
 David Hildenbrand <david@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org, Eric Ren <renzhengeek@gmail.com>,
 Oscar Salvador <osalvador@suse.de>, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>, Vlastimil Babka <vbabka@suse.cz>
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

On Fri, Feb 11, 2022 at 11:41:30AM -0500, Zi Yan wrote:
> From: Zi Yan <ziy@nvidia.com>
> 
> has_unmovable_pages() is only used in mm/page_isolation.c. Move it from
> mm/page_alloc.c and make it static.
> 
> Signed-off-by: Zi Yan <ziy@nvidia.com>
> Reviewed-by: Oscar Salvador <osalvador@suse.de>

Reviewed-by: Mike Rapoport <rppt@linux.ibm.com>

> ---
>  include/linux/page-isolation.h |   2 -
>  mm/page_alloc.c                | 119 ---------------------------------
>  mm/page_isolation.c            | 119 +++++++++++++++++++++++++++++++++
>  3 files changed, 119 insertions(+), 121 deletions(-)
> 
> diff --git a/include/linux/page-isolation.h b/include/linux/page-isolation.h
> index 572458016331..e14eddf6741a 100644
> --- a/include/linux/page-isolation.h
> +++ b/include/linux/page-isolation.h
> @@ -33,8 +33,6 @@ static inline bool is_migrate_isolate(int migratetype)
>  #define MEMORY_OFFLINE	0x1
>  #define REPORT_FAILURE	0x2
>  
> -struct page *has_unmovable_pages(struct zone *zone, struct page *page,
> -				 int migratetype, int flags);
>  void set_pageblock_migratetype(struct page *page, int migratetype);
>  int move_freepages_block(struct zone *zone, struct page *page,
>  				int migratetype, int *num_movable);
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index cface1d38093..e2c6a67fc386 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -8962,125 +8962,6 @@ void *__init alloc_large_system_hash(const char *tablename,
>  	return table;
>  }
>  
> -/*
> - * This function checks whether pageblock includes unmovable pages or not.
> - *
> - * PageLRU check without isolation or lru_lock could race so that
> - * MIGRATE_MOVABLE block might include unmovable pages. And __PageMovable
> - * check without lock_page also may miss some movable non-lru pages at
> - * race condition. So you can't expect this function should be exact.
> - *
> - * Returns a page without holding a reference. If the caller wants to
> - * dereference that page (e.g., dumping), it has to make sure that it
> - * cannot get removed (e.g., via memory unplug) concurrently.
> - *
> - */
> -struct page *has_unmovable_pages(struct zone *zone, struct page *page,
> -				 int migratetype, int flags)
> -{
> -	unsigned long iter = 0;
> -	unsigned long pfn = page_to_pfn(page);
> -	unsigned long offset = pfn % pageblock_nr_pages;
> -
> -	if (is_migrate_cma_page(page)) {
> -		/*
> -		 * CMA allocations (alloc_contig_range) really need to mark
> -		 * isolate CMA pageblocks even when they are not movable in fact
> -		 * so consider them movable here.
> -		 */
> -		if (is_migrate_cma(migratetype))
> -			return NULL;
> -
> -		return page;
> -	}
> -
> -	for (; iter < pageblock_nr_pages - offset; iter++) {
> -		page = pfn_to_page(pfn + iter);
> -
> -		/*
> -		 * Both, bootmem allocations and memory holes are marked
> -		 * PG_reserved and are unmovable. We can even have unmovable
> -		 * allocations inside ZONE_MOVABLE, for example when
> -		 * specifying "movablecore".
> -		 */
> -		if (PageReserved(page))
> -			return page;
> -
> -		/*
> -		 * If the zone is movable and we have ruled out all reserved
> -		 * pages then it should be reasonably safe to assume the rest
> -		 * is movable.
> -		 */
> -		if (zone_idx(zone) == ZONE_MOVABLE)
> -			continue;
> -
> -		/*
> -		 * Hugepages are not in LRU lists, but they're movable.
> -		 * THPs are on the LRU, but need to be counted as #small pages.
> -		 * We need not scan over tail pages because we don't
> -		 * handle each tail page individually in migration.
> -		 */
> -		if (PageHuge(page) || PageTransCompound(page)) {
> -			struct page *head = compound_head(page);
> -			unsigned int skip_pages;
> -
> -			if (PageHuge(page)) {
> -				if (!hugepage_migration_supported(page_hstate(head)))
> -					return page;
> -			} else if (!PageLRU(head) && !__PageMovable(head)) {
> -				return page;
> -			}
> -
> -			skip_pages = compound_nr(head) - (page - head);
> -			iter += skip_pages - 1;
> -			continue;
> -		}
> -
> -		/*
> -		 * We can't use page_count without pin a page
> -		 * because another CPU can free compound page.
> -		 * This check already skips compound tails of THP
> -		 * because their page->_refcount is zero at all time.
> -		 */
> -		if (!page_ref_count(page)) {
> -			if (PageBuddy(page))
> -				iter += (1 << buddy_order(page)) - 1;
> -			continue;
> -		}
> -
> -		/*
> -		 * The HWPoisoned page may be not in buddy system, and
> -		 * page_count() is not 0.
> -		 */
> -		if ((flags & MEMORY_OFFLINE) && PageHWPoison(page))
> -			continue;
> -
> -		/*
> -		 * We treat all PageOffline() pages as movable when offlining
> -		 * to give drivers a chance to decrement their reference count
> -		 * in MEM_GOING_OFFLINE in order to indicate that these pages
> -		 * can be offlined as there are no direct references anymore.
> -		 * For actually unmovable PageOffline() where the driver does
> -		 * not support this, we will fail later when trying to actually
> -		 * move these pages that still have a reference count > 0.
> -		 * (false negatives in this function only)
> -		 */
> -		if ((flags & MEMORY_OFFLINE) && PageOffline(page))
> -			continue;
> -
> -		if (__PageMovable(page) || PageLRU(page))
> -			continue;
> -
> -		/*
> -		 * If there are RECLAIMABLE pages, we need to check
> -		 * it.  But now, memory offline itself doesn't call
> -		 * shrink_node_slabs() and it still to be fixed.
> -		 */
> -		return page;
> -	}
> -	return NULL;
> -}
> -
>  #ifdef CONFIG_CONTIG_ALLOC
>  static unsigned long pfn_max_align_down(unsigned long pfn)
>  {
> diff --git a/mm/page_isolation.c b/mm/page_isolation.c
> index f67c4c70f17f..b34f1310aeaa 100644
> --- a/mm/page_isolation.c
> +++ b/mm/page_isolation.c
> @@ -15,6 +15,125 @@
>  #define CREATE_TRACE_POINTS
>  #include <trace/events/page_isolation.h>
>  
> +/*
> + * This function checks whether pageblock includes unmovable pages or not.
> + *
> + * PageLRU check without isolation or lru_lock could race so that
> + * MIGRATE_MOVABLE block might include unmovable pages. And __PageMovable
> + * check without lock_page also may miss some movable non-lru pages at
> + * race condition. So you can't expect this function should be exact.
> + *
> + * Returns a page without holding a reference. If the caller wants to
> + * dereference that page (e.g., dumping), it has to make sure that it
> + * cannot get removed (e.g., via memory unplug) concurrently.
> + *
> + */
> +static struct page *has_unmovable_pages(struct zone *zone, struct page *page,
> +				 int migratetype, int flags)
> +{
> +	unsigned long iter = 0;
> +	unsigned long pfn = page_to_pfn(page);
> +	unsigned long offset = pfn % pageblock_nr_pages;
> +
> +	if (is_migrate_cma_page(page)) {
> +		/*
> +		 * CMA allocations (alloc_contig_range) really need to mark
> +		 * isolate CMA pageblocks even when they are not movable in fact
> +		 * so consider them movable here.
> +		 */
> +		if (is_migrate_cma(migratetype))
> +			return NULL;
> +
> +		return page;
> +	}
> +
> +	for (; iter < pageblock_nr_pages - offset; iter++) {
> +		page = pfn_to_page(pfn + iter);
> +
> +		/*
> +		 * Both, bootmem allocations and memory holes are marked
> +		 * PG_reserved and are unmovable. We can even have unmovable
> +		 * allocations inside ZONE_MOVABLE, for example when
> +		 * specifying "movablecore".
> +		 */
> +		if (PageReserved(page))
> +			return page;
> +
> +		/*
> +		 * If the zone is movable and we have ruled out all reserved
> +		 * pages then it should be reasonably safe to assume the rest
> +		 * is movable.
> +		 */
> +		if (zone_idx(zone) == ZONE_MOVABLE)
> +			continue;
> +
> +		/*
> +		 * Hugepages are not in LRU lists, but they're movable.
> +		 * THPs are on the LRU, but need to be counted as #small pages.
> +		 * We need not scan over tail pages because we don't
> +		 * handle each tail page individually in migration.
> +		 */
> +		if (PageHuge(page) || PageTransCompound(page)) {
> +			struct page *head = compound_head(page);
> +			unsigned int skip_pages;
> +
> +			if (PageHuge(page)) {
> +				if (!hugepage_migration_supported(page_hstate(head)))
> +					return page;
> +			} else if (!PageLRU(head) && !__PageMovable(head)) {
> +				return page;
> +			}
> +
> +			skip_pages = compound_nr(head) - (page - head);
> +			iter += skip_pages - 1;
> +			continue;
> +		}
> +
> +		/*
> +		 * We can't use page_count without pin a page
> +		 * because another CPU can free compound page.
> +		 * This check already skips compound tails of THP
> +		 * because their page->_refcount is zero at all time.
> +		 */
> +		if (!page_ref_count(page)) {
> +			if (PageBuddy(page))
> +				iter += (1 << buddy_order(page)) - 1;
> +			continue;
> +		}
> +
> +		/*
> +		 * The HWPoisoned page may be not in buddy system, and
> +		 * page_count() is not 0.
> +		 */
> +		if ((flags & MEMORY_OFFLINE) && PageHWPoison(page))
> +			continue;
> +
> +		/*
> +		 * We treat all PageOffline() pages as movable when offlining
> +		 * to give drivers a chance to decrement their reference count
> +		 * in MEM_GOING_OFFLINE in order to indicate that these pages
> +		 * can be offlined as there are no direct references anymore.
> +		 * For actually unmovable PageOffline() where the driver does
> +		 * not support this, we will fail later when trying to actually
> +		 * move these pages that still have a reference count > 0.
> +		 * (false negatives in this function only)
> +		 */
> +		if ((flags & MEMORY_OFFLINE) && PageOffline(page))
> +			continue;
> +
> +		if (__PageMovable(page) || PageLRU(page))
> +			continue;
> +
> +		/*
> +		 * If there are RECLAIMABLE pages, we need to check
> +		 * it.  But now, memory offline itself doesn't call
> +		 * shrink_node_slabs() and it still to be fixed.
> +		 */
> +		return page;
> +	}
> +	return NULL;
> +}
> +
>  static int set_migratetype_isolate(struct page *page, int migratetype, int isol_flags)
>  {
>  	struct zone *zone = page_zone(page);
> -- 
> 2.34.1
> 

-- 
Sincerely yours,
Mike.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
