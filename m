Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DED3539754
	for <lists.iommu@lfdr.de>; Tue, 31 May 2022 21:48:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C029283F63;
	Tue, 31 May 2022 19:48:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lQVHYBaaIj7x; Tue, 31 May 2022 19:48:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id B787483F82;
	Tue, 31 May 2022 19:48:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 911D6C002D;
	Tue, 31 May 2022 19:48:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 17ACFC002D
 for <iommu@lists.linux-foundation.org>; Tue, 31 May 2022 19:48:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F1B7E6129A
 for <iommu@lists.linux-foundation.org>; Tue, 31 May 2022 19:48:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6mrFZUFpoYJE for <iommu@lists.linux-foundation.org>;
 Tue, 31 May 2022 19:48:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2EEE161296
 for <iommu@lists.linux-foundation.org>; Tue, 31 May 2022 19:48:31 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4283523A;
 Tue, 31 May 2022 12:48:30 -0700 (PDT)
Received: from [10.57.81.38] (unknown [10.57.81.38])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B791E3F766;
 Tue, 31 May 2022 12:48:28 -0700 (PDT)
Message-ID: <b97645ed-b524-a505-2993-e04a37b50d35@arm.com>
Date: Tue, 31 May 2022 20:48:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 04/10] dmapool: improve accuracy of debug statistics
Content-Language: en-GB
To: Tony Battersby <tonyb@cybernetics.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <9b08ab7c-b80b-527d-9adf-7716b0868fbc@cybernetics.com>
 <a922c30f-d6d7-dde2-554f-254441290331@cybernetics.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <a922c30f-d6d7-dde2-554f-254441290331@cybernetics.com>
Cc: Tony Lindgren <tony@atomide.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Matthew Wilcox <willy@infradead.org>, iommu@lists.linux-foundation.org,
 Keith Busch <kbusch@kernel.org>, kernel-team@fb.com
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

On 2022-05-31 19:17, Tony Battersby wrote:
> The "total number of blocks in pool" debug statistic currently does not
> take the boundary value into account, so it diverges from the "total
> number of blocks in use" statistic when a boundary is in effect.  Add a
> calculation for the number of blocks per allocation that takes the
> boundary into account, and use it to replace the inaccurate calculation.
> 
> This depends on the patch "dmapool: fix boundary comparison" for the
> calculated blks_per_alloc value to be correct.
> 
> Signed-off-by: Tony Battersby <tonyb@cybernetics.com>
> ---
>   mm/dmapool.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/dmapool.c b/mm/dmapool.c
> index 782143144a32..9e30f4425dea 100644
> --- a/mm/dmapool.c
> +++ b/mm/dmapool.c
> @@ -47,6 +47,7 @@ struct dma_pool {		/* the pool */
>   	struct device *dev;
>   	unsigned int allocation;
>   	unsigned int boundary;
> +	unsigned int blks_per_alloc;
>   	char name[32];
>   	struct list_head pools;
>   };
> @@ -92,8 +93,7 @@ static ssize_t pools_show(struct device *dev, struct device_attribute *attr, cha
>   		/* per-pool info, no real statistics yet */
>   		temp = scnprintf(next, size, "%-16s %4zu %4zu %4u %2u\n",

Nit: if we're tinkering with this, it's probably worth updating the 
whole function to use sysfs_emit{_at}().

>   				 pool->name, blocks,
> -				 (size_t) pages *
> -				 (pool->allocation / pool->size),
> +				 (size_t) pages * pool->blks_per_alloc,
>   				 pool->size, pages);
>   		size -= temp;
>   		next += temp;
> @@ -168,6 +168,9 @@ struct dma_pool *dma_pool_create(const char *name, struct device *dev,
>   	retval->size = size;
>   	retval->boundary = boundary;
>   	retval->allocation = allocation;
> +	retval->blks_per_alloc =
> +		(allocation / boundary) * (boundary / size) +
> +		(allocation % boundary) / size;

Do we really need to store this? Sure, 4 divisions (which could possibly 
be fewer given the constraints on boundary) isn't the absolute cheapest 
calculation, but I still can't imagine anyone would be polling sysfs 
stats hard enough to even notice.

Thanks,
Robin.

>   
>   	INIT_LIST_HEAD(&retval->pools);
>   
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
