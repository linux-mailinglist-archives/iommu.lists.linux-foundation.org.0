Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B9A229A17
	for <lists.iommu@lfdr.de>; Wed, 22 Jul 2020 16:29:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D836186962;
	Wed, 22 Jul 2020 14:29:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FQhXs6vMPxhU; Wed, 22 Jul 2020 14:29:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 561DD86949;
	Wed, 22 Jul 2020 14:29:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3B9FEC004C;
	Wed, 22 Jul 2020 14:29:51 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D8ADAC004C
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jul 2020 14:29:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C715788603
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jul 2020 14:29:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ODMHzml1HyK1 for <iommu@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 14:29:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 95AE0885F1
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jul 2020 14:29:48 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id B599868B05; Wed, 22 Jul 2020 16:29:43 +0200 (CEST)
Date: Wed, 22 Jul 2020 16:29:43 +0200
From: Christoph Hellwig <hch@lst.de>
To: Barry Song <song.bao.hua@hisilicon.com>
Subject: Re: [PATCH v3 1/2] dma-direct: provide the ability to reserve
 per-numa CMA
Message-ID: <20200722142943.GB17658@lst.de>
References: <20200628111251.19108-1-song.bao.hua@hisilicon.com>
 <20200628111251.19108-2-song.bao.hua@hisilicon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200628111251.19108-2-song.bao.hua@hisilicon.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: catalin.marinas@arm.com, Steve Capper <steve.capper@arm.com>,
 robin.murphy@arm.com, linuxarm@huawei.com, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, ganapatrao.kulkarni@cavium.com,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@linux.ibm.com>,
 will@kernel.org, hch@lst.de, linux-arm-kernel@lists.infradead.org
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

On Sun, Jun 28, 2020 at 11:12:50PM +1200, Barry Song wrote:
>  struct page *dma_alloc_contiguous(struct device *dev, size_t size, gfp_t gfp)
>  {
>  	size_t count = size >> PAGE_SHIFT;
>  	struct page *page = NULL;
>  	struct cma *cma = NULL;
> +	int nid = dev ? dev_to_node(dev) : NUMA_NO_NODE;
> +	bool alloc_from_pernuma = false;
> +
> +	if ((count <= 1) && !(dev && dev->cma_area))
> +		return NULL;
>  
>  	if (dev && dev->cma_area)
>  		cma = dev->cma_area;
> -	else if (count > 1)
> +	else if ((nid != NUMA_NO_NODE) && dma_contiguous_pernuma_area[nid]
> +		&& !(gfp & (GFP_DMA | GFP_DMA32))) {
> +		cma = dma_contiguous_pernuma_area[nid];
> +		alloc_from_pernuma = true;
> +	} else {
>  		cma = dma_contiguous_default_area;
> +	}

I find the function rather confusing now.  What about something
like (this relies on the fact that dev should never be NULL in the
DMA API)

struct page *dma_alloc_contiguous(struct device *dev, size_t size, gfp_t gfp)
{
	size_t cma_align = min_t(size_t, get_order(size), CONFIG_CMA_ALIGNMENT);
 	size_t count = size >> PAGE_SHIFT;

	if (gfpflags_allow_blocking(gfp))
		return NULL;
	gfp &= __GFP_NOWARN;

	if (dev->cma_area)
		return cma_alloc(dev->cma_area, count, cma_align, gfp);
	if (count <= 1)
		return NULL;

	if (IS_ENABLED(CONFIG_PERNODE_CMA) && !(gfp & (GFP_DMA | GFP_DMA32)) {
		int nid = dev_to_node(dev);
 		struct cma *cma = dma_contiguous_pernuma_area[nid];
		struct page *page;

		if (cma) {
			page = cma_alloc(cma, count, cma_align, gfp);
			if (page)
				return page;
		}
	}

	return cma_alloc(dma_contiguous_default_area, count, cma_align, gfp);
}

> +		/*
> +		 * otherwise, page is from either per-numa cma or default cma
> +		 */
> +		int nid = page_to_nid(page);
> +
> +		if (nid != NUMA_NO_NODE) {
> +			if (cma_release(dma_contiguous_pernuma_area[nid], page,
> +						PAGE_ALIGN(size) >> PAGE_SHIFT))
> +				return;
> +		}
> +
> +		if (cma_release(dma_contiguous_default_area, page,

How can page_to_nid ever return NUMA_NO_NODE?
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
