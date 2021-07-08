Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB173C1802
	for <lists.iommu@lfdr.de>; Thu,  8 Jul 2021 19:22:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6546141610;
	Thu,  8 Jul 2021 17:22:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5DWu9pyv0FRM; Thu,  8 Jul 2021 17:22:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 44F7E41607;
	Thu,  8 Jul 2021 17:22:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 18DBBC001F;
	Thu,  8 Jul 2021 17:22:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DE4BBC000E
 for <iommu@lists.linux-foundation.org>; Thu,  8 Jul 2021 17:22:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D971B60AFA
 for <iommu@lists.linux-foundation.org>; Thu,  8 Jul 2021 17:22:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dp2rTg7ZxzI0 for <iommu@lists.linux-foundation.org>;
 Thu,  8 Jul 2021 17:22:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2EC286061A
 for <iommu@lists.linux-foundation.org>; Thu,  8 Jul 2021 17:22:24 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4415FED1;
 Thu,  8 Jul 2021 10:22:23 -0700 (PDT)
Received: from [10.57.35.192] (unknown [10.57.35.192])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 27E413F73B;
 Thu,  8 Jul 2021 10:22:22 -0700 (PDT)
Subject: Re: [PATCH 1/4] dma-iommu: add kalloc gfp flag to alloc helper
To: David Stevens <stevensd@chromium.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>
References: <20210707075505.2896824-1-stevensd@google.com>
 <20210707075505.2896824-2-stevensd@google.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <8cdbcbbb-5064-ae7f-af4a-abb0e4203b6d@arm.com>
Date: Thu, 8 Jul 2021 18:22:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210707075505.2896824-2-stevensd@google.com>
Content-Language: en-GB
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
 iommu@lists.linux-foundation.org, Christoph Hellwig <hch@lst.de>,
 linux-kernel@vger.kernel.org
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

On 2021-07-07 08:55, David Stevens wrote:
> From: David Stevens <stevensd@chromium.org>
> 
> Add gfp flag for kalloc calls within __iommu_dma_alloc_pages, so the
> function can be called from atomic contexts.

Why bother? If you need GFP_ATOMIC for allocating the pages array, then 
you don't not need it for allocating the pages themselves. It's hardly 
rocket science to infer one from the other.

Robin.

> Signed-off-by: David Stevens <stevensd@chromium.org>
> ---
>   drivers/iommu/dma-iommu.c | 13 +++++++------
>   1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
> index 614f0dd86b08..00993b56c977 100644
> --- a/drivers/iommu/dma-iommu.c
> +++ b/drivers/iommu/dma-iommu.c
> @@ -593,7 +593,8 @@ static void __iommu_dma_free_pages(struct page **pages, int count)
>   }
>   
>   static struct page **__iommu_dma_alloc_pages(struct device *dev,
> -		unsigned int count, unsigned long order_mask, gfp_t gfp)
> +		unsigned int count, unsigned long order_mask,
> +		gfp_t page_gfp, gfp_t kalloc_gfp)
>   {
>   	struct page **pages;
>   	unsigned int i = 0, nid = dev_to_node(dev);
> @@ -602,15 +603,15 @@ static struct page **__iommu_dma_alloc_pages(struct device *dev,
>   	if (!order_mask)
>   		return NULL;
>   
> -	pages = kvzalloc(count * sizeof(*pages), GFP_KERNEL);
> +	pages = kvzalloc(count * sizeof(*pages), kalloc_gfp);
>   	if (!pages)
>   		return NULL;
>   
>   	/* IOMMU can map any pages, so himem can also be used here */
> -	gfp |= __GFP_NOWARN | __GFP_HIGHMEM;
> +	page_gfp |= __GFP_NOWARN | __GFP_HIGHMEM;
>   
>   	/* It makes no sense to muck about with huge pages */
> -	gfp &= ~__GFP_COMP;
> +	page_gfp &= ~__GFP_COMP;
>   
>   	while (count) {
>   		struct page *page = NULL;
> @@ -624,7 +625,7 @@ static struct page **__iommu_dma_alloc_pages(struct device *dev,
>   		for (order_mask &= (2U << __fls(count)) - 1;
>   		     order_mask; order_mask &= ~order_size) {
>   			unsigned int order = __fls(order_mask);
> -			gfp_t alloc_flags = gfp;
> +			gfp_t alloc_flags = page_gfp;
>   
>   			order_size = 1U << order;
>   			if (order_mask > order_size)
> @@ -680,7 +681,7 @@ static struct page **__iommu_dma_alloc_noncontiguous(struct device *dev,
>   
>   	count = PAGE_ALIGN(size) >> PAGE_SHIFT;
>   	pages = __iommu_dma_alloc_pages(dev, count, alloc_sizes >> PAGE_SHIFT,
> -					gfp);
> +					gfp, GFP_KERNEL);
>   	if (!pages)
>   		return NULL;
>   
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
