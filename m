Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FCBB471455
	for <lists.iommu@lfdr.de>; Sat, 11 Dec 2021 15:57:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A97F85797;
	Sat, 11 Dec 2021 14:57:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NCr-zHQIokSs; Sat, 11 Dec 2021 14:57:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 6A28B85794;
	Sat, 11 Dec 2021 14:57:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3D418C002F;
	Sat, 11 Dec 2021 14:57:45 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2EEB1C0012;
 Fri, 10 Dec 2021 08:13:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 06D3D4017C;
 Fri, 10 Dec 2021 08:13:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8F8UiLBwXxV9; Fri, 10 Dec 2021 08:13:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B5C5C40163;
 Fri, 10 Dec 2021 08:13:00 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id iq11so6286690pjb.3;
 Fri, 10 Dec 2021 00:13:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:to:cc:references
 :from:in-reply-to:content-transfer-encoding;
 bh=2UitW/a22qHZy5xKHHYHlOFEb1WRqzGH7Dq8o2PFe2Q=;
 b=JPzFNwiK2iFaWWHf7bmMKQmQq4SMMySrFIJdUkpi5Qc4ht4RWKF86ObNuwrBI9mGgP
 j3jJOhnHaJ+LaqotSPZggh5Qp5YnxMI4oYx2RyNibcaBN2506S+1/FXge07DveaGZo/l
 Hh1MXdW5D53lwAO06m5nX2wPyXCMwW9HjNAILJi/l5yJVW1a4WoKONEJX7iUzRFyTCe/
 L10PPbubstGcSUmf6Ud49G09QGmTaUV0mVByzjQej9yQ2on7Nj2lbZ1BdBpmBai9dqUl
 2zEBKZeHFymQoM0SilBGTcUYER4rJzGe1W8xUvfzVjRitL4VN7lOH4XuGjxebopjlIB3
 +Mzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :to:cc:references:from:in-reply-to:content-transfer-encoding;
 bh=2UitW/a22qHZy5xKHHYHlOFEb1WRqzGH7Dq8o2PFe2Q=;
 b=YN11kJEzoQI7WdH34mKTAdgv6/dJLNTQUT7rOMuQahKEofjSzDh9C43qb1uTjhFr64
 wTZd1vvhFpfer3oRy7r7sKXjrKvvnR78B++kOQTRPygL+4y9bLZRml+P64lQImAq5ZHs
 Q1njTBaxVXVchA8uDd9Ez4B+TBOsutwkiYUfNTbDP/14tpjCP6TGB3eFwSkeV5bsdxIW
 GbL9oP69WavdsP1gRPiVmi+z15/CG4qmhotSiyf0h7SkIRAzbkF6E9UikmcSTo0/2NFt
 NGGYDyNRBK+6oxEkS2DT1QjIbUFxUflNt3rwmAsh1nc+ErNUJOrZcUVgmtLqG1WB3NQl
 PDxQ==
X-Gm-Message-State: AOAM532wMUL7FazCpcJEl2sy0w2bcvPruUNmuRcQSelc2A9Ri246Ft1b
 K08A1x2sD0AgMm40t29TCuQ=
X-Google-Smtp-Source: ABdhPJxaQ3cxs4XFuaCZRvbdao8/EGWyVW34XMPvxu03qRDAtSQPHRlZIjUP9VNgKOI0LdYXqei/bw==
X-Received: by 2002:a17:90a:b88d:: with SMTP id
 o13mr21933558pjr.39.1639123980083; 
 Fri, 10 Dec 2021 00:13:00 -0800 (PST)
Received: from [30.240.98.4] ([205.204.117.108])
 by smtp.gmail.com with ESMTPSA id j1sm2218166pfu.47.2021.12.10.00.12.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Dec 2021 00:12:59 -0800 (PST)
Message-ID: <b0d31df3-c0a2-5c76-ada5-81e2a01ac560@gmail.com>
Date: Fri, 10 Dec 2021 16:12:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.1
Subject: Re: [RFC PATCH v2 4/7] mm: make alloc_contig_range work at pageblock
 granularity
To: Zi Yan <ziy@nvidia.com>, David Hildenbrand <david@redhat.com>,
 linux-mm@kvack.org
References: <20211209230414.2766515-1-zi.yan@sent.com>
 <20211209230414.2766515-5-zi.yan@sent.com>
From: Eric Ren <renzhengeek@gmail.com>
In-Reply-To: <20211209230414.2766515-5-zi.yan@sent.com>
X-Mailman-Approved-At: Sat, 11 Dec 2021 14:57:44 +0000
Cc: Mel Gorman <mgorman@techsingularity.net>,
 Michael Ellerman <mpe@ellerman.id.au>, Robin Murphy <robin.murphy@arm.com>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 virtualization@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Hi,

On 2021/12/10 07:04, Zi Yan wrote:
> From: Zi Yan <ziy@nvidia.com>
>
> alloc_contig_range() worked at MAX_ORDER-1 granularity to avoid merging
> pageblocks with different migratetypes. It might unnecessarily convert
> extra pageblocks at the beginning and at the end of the range. Change
> alloc_contig_range() to work at pageblock granularity.
>
> It is done by restoring pageblock types and split >pageblock_order free
> pages after isolating at MAX_ORDER-1 granularity and migrating pages
> away at pageblock granularity. The reason for this process is that
> during isolation, some pages, either free or in-use, might have >pageblock
> sizes and isolating part of them can cause free accounting issues.
Could you elaborate on how the acconting issue would happen in details?


> Restoring the migratetypes of the pageblocks not in the interesting
> range later is much easier.
>
> Signed-off-by: Zi Yan <ziy@nvidia.com>
> ---
>   mm/page_alloc.c | 169 ++++++++++++++++++++++++++++++++++++++++++------
>   1 file changed, 149 insertions(+), 20 deletions(-)
>
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index 107a5f186d3b..5ffbeb1b7512 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -8981,8 +8981,8 @@ struct page *has_unmovable_pages(struct zone *zone, struct page *page,
>   #ifdef CONFIG_CONTIG_ALLOC
>   static unsigned long pfn_max_align_down(unsigned long pfn)
>   {
> -	return pfn & ~(max_t(unsigned long, MAX_ORDER_NR_PAGES,
> -			     pageblock_nr_pages) - 1);
> +	return ALIGN_DOWN(pfn, max_t(unsigned long, MAX_ORDER_NR_PAGES,
> +				     pageblock_nr_pages));
>   }
>   
>   static unsigned long pfn_max_align_up(unsigned long pfn)
> @@ -9071,6 +9071,52 @@ static int __alloc_contig_migrate_range(struct compact_control *cc,
>   	return 0;
>   }
>   
> +static inline int save_migratetypes(unsigned char *migratetypes,
> +				unsigned long start_pfn, unsigned long end_pfn)
> +{
> +	unsigned long pfn = start_pfn;
> +	int num = 0;
> +
> +	while (pfn < end_pfn) {
> +		migratetypes[num] = get_pageblock_migratetype(pfn_to_page(pfn));
> +		num++;
> +		pfn += pageblock_nr_pages;
> +	}
> +	return num;
> +}
> +
> +static inline int restore_migratetypes(unsigned char *migratetypes,
> +				unsigned long start_pfn, unsigned long end_pfn)
> +{
> +	unsigned long pfn = start_pfn;
> +	int num = 0;
> +
> +	while (pfn < end_pfn) {
> +		set_pageblock_migratetype(pfn_to_page(pfn), migratetypes[num]);
> +		num++;
> +		pfn += pageblock_nr_pages;
> +	}
> +	return num;
> +}
> +
> +static inline void split_free_page_into_pageblocks(struct page *free_page,
> +				int order, struct zone *zone)
> +{
> +	unsigned long pfn;
> +
> +	spin_lock(&zone->lock);
> +	del_page_from_free_list(free_page, zone, order);
> +	for (pfn = page_to_pfn(free_page);
> +	     pfn < page_to_pfn(free_page) + (1UL << order);
> +	     pfn += pageblock_nr_pages) {
> +		int mt = get_pfnblock_migratetype(pfn_to_page(pfn), pfn);
> +
> +		__free_one_page(pfn_to_page(pfn), pfn, zone, pageblock_order,
> +				mt, FPI_NONE);
> +	}
> +	spin_unlock(&zone->lock);
> +}
> +
>   /**
>    * alloc_contig_range() -- tries to allocate given range of pages
>    * @start:	start PFN to allocate
> @@ -9096,8 +9142,15 @@ int alloc_contig_range(unsigned long start, unsigned long end,
>   		       unsigned migratetype, gfp_t gfp_mask)
>   {
>   	unsigned long outer_start, outer_end;
> +	unsigned long isolate_start = pfn_max_align_down(start);
> +	unsigned long isolate_end = pfn_max_align_up(end);
> +	unsigned long alloc_start = ALIGN_DOWN(start, pageblock_nr_pages);
> +	unsigned long alloc_end = ALIGN(end, pageblock_nr_pages);
What is the differecence between isolate_* and alloc_*?
> +	unsigned long num_pageblock_to_save;
>   	unsigned int order;
>   	int ret = 0;
> +	unsigned char *saved_mt;
> +	int num;
>   
>   	struct compact_control cc = {
>   		.nr_migratepages = 0,
> @@ -9111,11 +9164,30 @@ int alloc_contig_range(unsigned long start, unsigned long end,
>   	};
>   	INIT_LIST_HEAD(&cc.migratepages);
>   
> +	/*
> +	 * TODO: make MIGRATE_ISOLATE a standalone bit to avoid overwriting
> +	 * the exiting migratetype. Then, we will not need the save and restore
> +	 * process here.
> +	 */
> +
> +	/* Save the migratepages of the pageblocks before start and after end */
> +	num_pageblock_to_save = (alloc_start - isolate_start) / pageblock_nr_pages
> +				+ (isolate_end - alloc_end) / pageblock_nr_pages;
> +	saved_mt =
> +		kmalloc_array(num_pageblock_to_save,
> +			      sizeof(unsigned char), GFP_KERNEL);
> +	if (!saved_mt)
> +		return -ENOMEM;
> +
> +	num = save_migratetypes(saved_mt, isolate_start, alloc_start);
> +
> +	num = save_migratetypes(&saved_mt[num], alloc_end, isolate_end);
the two lines above looks confusing to figure out the logic. Could you 
help explain a bit?

Thanks,
Eric
> +
>   	/*
>   	 * What we do here is we mark all pageblocks in range as
>   	 * MIGRATE_ISOLATE.  Because pageblock and max order pages may
>   	 * have different sizes, and due to the way page allocator
> -	 * work, we align the range to biggest of the two pages so
> +	 * work, we align the isolation range to biggest of the two so
>   	 * that page allocator won't try to merge buddies from
>   	 * different pageblocks and change MIGRATE_ISOLATE to some
>   	 * other migration type.
> @@ -9125,6 +9197,20 @@ int alloc_contig_range(unsigned long start, unsigned long end,
>   	 * we are interested in).  This will put all the pages in
>   	 * range back to page allocator as MIGRATE_ISOLATE.
>   	 *
> +	 * Afterwards, we restore the migratetypes of the pageblocks not
> +	 * in range, split free pages spanning outside the range,
> +	 * and put split free pages (at pageblock_order) to the right
> +	 * migratetype list.
> +	 *
> +	 * NOTE: the above approach is used because it can cause free
> +	 * page accounting issues during isolation, if a page, either
> +	 * free or in-use, contains multiple pageblocks and we only
> +	 * isolate a subset of them. For example, if only the second
> +	 * pageblock is isolated from a page with 2 pageblocks, after
> +	 * the page is free, it will be put in the first pageblock
> +	 * migratetype list instead of having 2 pageblocks in two
> +	 * separate migratetype lists.
> +	 *
>   	 * When this is done, we take the pages in range from page
>   	 * allocator removing them from the buddy system.  This way
>   	 * page allocator will never consider using them.
> @@ -9135,10 +9221,9 @@ int alloc_contig_range(unsigned long start, unsigned long end,
>   	 * put back to page allocator so that buddy can use them.
>   	 */
>   
> -	ret = start_isolate_page_range(pfn_max_align_down(start),
> -				       pfn_max_align_up(end), migratetype, 0);
> +	ret = start_isolate_page_range(isolate_start, isolate_end, migratetype, 0);
>   	if (ret)
> -		return ret;
> +		goto done;
>   
>   	drain_all_pages(cc.zone);
>   
> @@ -9174,6 +9259,19 @@ int alloc_contig_range(unsigned long start, unsigned long end,
>   	 * isolated thus they won't get removed from buddy.
>   	 */
>   
> +	/*
> +	 * Restore migratetypes of pageblocks outside [start, end)
> +	 * TODO: remove it when MIGRATE_ISOLATE becomes a standalone bit
> +	 */
> +
> +	num = restore_migratetypes(saved_mt, isolate_start, alloc_start);
> +
> +	num = restore_migratetypes(&saved_mt[num], alloc_end, isolate_end);
> +
> +	/*
> +	 * Split free page spanning [isolate_start, alloc_start) and put the
> +	 * pageblocks in the right migratetype lists.
> +	 */
>   	order = 0;
>   	outer_start = start;
>   	while (!PageBuddy(pfn_to_page(outer_start))) {
> @@ -9188,37 +9286,68 @@ int alloc_contig_range(unsigned long start, unsigned long end,
>   		order = buddy_order(pfn_to_page(outer_start));
>   
>   		/*
> -		 * outer_start page could be small order buddy page and
> -		 * it doesn't include start page. Adjust outer_start
> -		 * in this case to report failed page properly
> -		 * on tracepoint in test_pages_isolated()
> +		 * split the free page has start page and put the pageblocks
> +		 * in the right migratetype list
>   		 */
> -		if (outer_start + (1UL << order) <= start)
> -			outer_start = start;
> +		if (outer_start + (1UL << order) > start) {
> +			struct page *free_page = pfn_to_page(outer_start);
> +
> +			split_free_page_into_pageblocks(free_page, order, cc.zone);
> +		}
> +	}
> +
> +	/*
> +	 * Split free page spanning [alloc_end, isolate_end) and put the
> +	 * pageblocks in the right migratetype list
> +	 */
> +	order = 0;
> +	outer_end = end;
> +	while (!PageBuddy(pfn_to_page(outer_end))) {
> +		if (++order >= MAX_ORDER) {
> +			outer_end = end;
> +			break;
> +		}
> +		outer_end &= ~0UL << order;
> +	}
> +
> +	if (outer_end != end) {
> +		order = buddy_order(pfn_to_page(outer_end));
> +
> +		/*
> +		 * split the free page has start page and put the pageblocks
> +		 * in the right migratetype list
> +		 */
> +		VM_BUG_ON(outer_end + (1UL << order) <= end);
> +		{
> +			struct page *free_page = pfn_to_page(outer_end);
> +
> +			split_free_page_into_pageblocks(free_page, order, cc.zone);
> +		}
>   	}
>   
>   	/* Make sure the range is really isolated. */
> -	if (test_pages_isolated(outer_start, end, 0)) {
> +	if (test_pages_isolated(alloc_start, alloc_end, 0)) {
>   		ret = -EBUSY;
>   		goto done;
>   	}
>   
>   	/* Grab isolated pages from freelists. */
> -	outer_end = isolate_freepages_range(&cc, outer_start, end);
> +	outer_end = isolate_freepages_range(&cc, alloc_start, alloc_end);
>   	if (!outer_end) {
>   		ret = -EBUSY;
>   		goto done;
>   	}
>   
>   	/* Free head and tail (if any) */
> -	if (start != outer_start)
> -		free_contig_range(outer_start, start - outer_start);
> -	if (end != outer_end)
> -		free_contig_range(end, outer_end - end);
> +	if (start != alloc_start)
> +		free_contig_range(alloc_start, start - alloc_start);
> +	if (end != alloc_end)
> +		free_contig_range(end, alloc_end - end);
>   
>   done:
> -	undo_isolate_page_range(pfn_max_align_down(start),
> -				pfn_max_align_up(end), migratetype);
> +	kfree(saved_mt);
> +	undo_isolate_page_range(alloc_start,
> +				alloc_end, migratetype);
>   	return ret;
>   }
>   EXPORT_SYMBOL(alloc_contig_range);

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
