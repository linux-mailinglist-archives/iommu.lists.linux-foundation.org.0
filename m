Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7BC44532F
	for <lists.iommu@lfdr.de>; Thu,  4 Nov 2021 13:37:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3B42E400F3;
	Thu,  4 Nov 2021 12:37:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7j0bWR2jI5J4; Thu,  4 Nov 2021 12:37:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id D8A484011C;
	Thu,  4 Nov 2021 12:37:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C1A9EC000E;
	Thu,  4 Nov 2021 12:37:31 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C3BC9C000E
 for <iommu@lists.linux-foundation.org>; Thu,  4 Nov 2021 12:37:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A640440599
 for <iommu@lists.linux-foundation.org>; Thu,  4 Nov 2021 12:37:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e5xrIctcwRco for <iommu@lists.linux-foundation.org>;
 Thu,  4 Nov 2021 12:37:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0053B4058D
 for <iommu@lists.linux-foundation.org>; Thu,  4 Nov 2021 12:37:29 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 80B011063;
 Thu,  4 Nov 2021 05:37:29 -0700 (PDT)
Received: from [10.57.80.217] (unknown [10.57.80.217])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E75203F7D7;
 Thu,  4 Nov 2021 05:37:28 -0700 (PDT)
Message-ID: <84544f0a-c0e8-758d-474b-736e7d83c619@arm.com>
Date: Thu, 4 Nov 2021 12:37:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 10/10] dma-direct: add a dma_direct_use_pool helper
Content-Language: en-GB
To: Christoph Hellwig <hch@lst.de>, iommu@lists.linux-foundation.org
References: <20211021090611.488281-1-hch@lst.de>
 <20211021090611.488281-11-hch@lst.de>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20211021090611.488281-11-hch@lst.de>
Cc: David Rientjes <rientjes@google.com>
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

On 2021-10-21 10:06, Christoph Hellwig wrote:
> Add a helper to check if a potentially blocking operation should
> dip into the atomic pools.

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   kernel/dma/direct.c | 18 ++++++++++++------
>   1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> index f2ec40f5733fc..babf79c16c041 100644
> --- a/kernel/dma/direct.c
> +++ b/kernel/dma/direct.c
> @@ -151,6 +151,15 @@ static struct page *__dma_direct_alloc_pages(struct device *dev, size_t size,
>   	return page;
>   }
>   
> +/*
> + * Check if a potentially blocking operations needs to dip into the atomic
> + * pools for the given device/gfp.
> + */
> +static bool dma_direct_use_pool(struct device *dev, gfp_t gfp)
> +{
> +	return gfpflags_allow_blocking(gfp) && !is_swiotlb_for_alloc(dev);
> +}
> +
>   static void *dma_direct_alloc_from_pool(struct device *dev, size_t size,
>   		dma_addr_t *dma_handle, gfp_t gfp)
>   {
> @@ -229,8 +238,7 @@ void *dma_direct_alloc(struct device *dev, size_t size,
>   		 * instead have to dip into the atomic pools.
>   		 */
>   		if (IS_ENABLED(CONFIG_DMA_DIRECT_REMAP)) {
> -			if (!gfpflags_allow_blocking(gfp) &&
> -			    !is_swiotlb_for_alloc(dev))
> +			if (dma_direct_use_pool(dev, gfp))
>   				return dma_direct_alloc_from_pool(dev, size,
>   						dma_handle, gfp);
>   			remap = true;
> @@ -241,8 +249,7 @@ void *dma_direct_alloc(struct device *dev, size_t size,
>   	 * Decrypting memory may block, so allocate the memory from the atomic
>   	 * pools if we can't block.
>   	 */
> -	if (force_dma_unencrypted(dev) && !gfpflags_allow_blocking(gfp) &&
> -	    !is_swiotlb_for_alloc(dev))
> +	if (force_dma_unencrypted(dev) && dma_direct_use_pool(dev, gfp))
>   		return dma_direct_alloc_from_pool(dev, size, dma_handle, gfp);
>   
>   	/* we always manually zero the memory once we are done */
> @@ -359,8 +366,7 @@ struct page *dma_direct_alloc_pages(struct device *dev, size_t size,
>   	struct page *page;
>   	void *ret;
>   
> -	if (force_dma_unencrypted(dev) && !gfpflags_allow_blocking(gfp) &&
> -	    !is_swiotlb_for_alloc(dev))
> +	if (force_dma_unencrypted(dev) && dma_direct_use_pool(dev, gfp))
>   		return dma_direct_alloc_from_pool(dev, size, dma_handle, gfp);
>   
>   	page = __dma_direct_alloc_pages(dev, size, gfp);
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
