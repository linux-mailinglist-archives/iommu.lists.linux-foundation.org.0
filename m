Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3561C22AEB0
	for <lists.iommu@lfdr.de>; Thu, 23 Jul 2020 14:08:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id DE1C18985C;
	Thu, 23 Jul 2020 12:08:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FwfrpGw0jv95; Thu, 23 Jul 2020 12:08:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5456989862;
	Thu, 23 Jul 2020 12:08:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 355A7C016F;
	Thu, 23 Jul 2020 12:08:47 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1FDABC004C
 for <iommu@lists.linux-foundation.org>; Thu, 23 Jul 2020 12:08:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0E5C989862
 for <iommu@lists.linux-foundation.org>; Thu, 23 Jul 2020 12:08:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6av3kWPaFrl7 for <iommu@lists.linux-foundation.org>;
 Thu, 23 Jul 2020 12:08:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 587458985C
 for <iommu@lists.linux-foundation.org>; Thu, 23 Jul 2020 12:08:40 +0000 (UTC)
Received: from dggemi403-hub.china.huawei.com (unknown [172.30.72.56])
 by Forcepoint Email with ESMTP id AEB4C4CFE7EA0B6A3EA7;
 Thu, 23 Jul 2020 20:08:36 +0800 (CST)
Received: from DGGEMI525-MBS.china.huawei.com ([169.254.6.52]) by
 dggemi403-hub.china.huawei.com ([10.3.17.136]) with mapi id 14.03.0487.000;
 Thu, 23 Jul 2020 20:08:28 +0800
From: "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>
To: Christoph Hellwig <hch@lst.de>
Subject: RE: [PATCH v3 1/2] dma-direct: provide the ability to reserve
 per-numa CMA
Thread-Topic: [PATCH v3 1/2] dma-direct: provide the ability to reserve
 per-numa CMA
Thread-Index: AQHWTT1ZxTwLmOgUCE+K/2/rfDv6P6kTSH2AgAD8G8CAAGyigIAAhoXw
Date: Thu, 23 Jul 2020 12:08:27 +0000
Message-ID: <B926444035E5E2439431908E3842AFD25A4F81@DGGEMI525-MBS.china.huawei.com>
References: <20200628111251.19108-1-song.bao.hua@hisilicon.com>
 <20200628111251.19108-2-song.bao.hua@hisilicon.com>
 <20200722142943.GB17658@lst.de>
 <B926444035E5E2439431908E3842AFD25A1606@DGGEMI525-MBS.china.huawei.com>
 <20200723120051.GB31598@lst.de>
In-Reply-To: <20200723120051.GB31598@lst.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.126.201.39]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Cc: "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 Steve Capper <steve.capper@arm.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>, Linuxarm <linuxarm@huawei.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "Zengtao \(B\)" <prime.zeng@hisilicon.com>,
 "ganapatrao.kulkarni@cavium.com" <ganapatrao.kulkarni@cavium.com>,
 huangdaode <huangdaode@huawei.com>, Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@linux.ibm.com>, "will@kernel.org" <will@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
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



> -----Original Message-----
> From: Christoph Hellwig [mailto:hch@lst.de]
> Sent: Friday, July 24, 2020 12:01 AM
> To: Song Bao Hua (Barry Song) <song.bao.hua@hisilicon.com>
> Cc: Christoph Hellwig <hch@lst.de>; m.szyprowski@samsung.com;
> robin.murphy@arm.com; will@kernel.org; ganapatrao.kulkarni@cavium.com;
> catalin.marinas@arm.com; iommu@lists.linux-foundation.org; Linuxarm
> <linuxarm@huawei.com>; linux-arm-kernel@lists.infradead.org;
> linux-kernel@vger.kernel.org; Jonathan Cameron
> <jonathan.cameron@huawei.com>; Nicolas Saenz Julienne
> <nsaenzjulienne@suse.de>; Steve Capper <steve.capper@arm.com>; Andrew
> Morton <akpm@linux-foundation.org>; Mike Rapoport <rppt@linux.ibm.com>;
> Zengtao (B) <prime.zeng@hisilicon.com>; huangdaode
> <huangdaode@huawei.com>
> Subject: Re: [PATCH v3 1/2] dma-direct: provide the ability to reserve
> per-numa CMA
> 
> On Wed, Jul 22, 2020 at 09:41:50PM +0000, Song Bao Hua (Barry Song)
> wrote:
> > I got a kernel robot warning which said dev should be checked before
> > being accessed when I did a similar change in v1. Probably it was an
> > invalid warning if dev should never be null.
> 
> That usually shows up if a function is inconsistent about sometimes checking it
> and sometimes now.
> 
> > Yes, it looks much better.
> 
> Below is a prep patch to rebase on top of:

Thanks for letting me know.

Will rebase on top of your patch.

> 
> ---
> From b81a5e1da65fce9750f0a8b66dbb6f842cbfdd4d Mon Sep 17 00:00:00
> 2001
> From: Christoph Hellwig <hch@lst.de>
> Date: Wed, 22 Jul 2020 16:33:43 +0200
> Subject: dma-contiguous: cleanup dma_alloc_contiguous
> 
> Split out a cma_alloc_aligned helper to deal with the "interesting"
> calling conventions for cma_alloc, which then allows to the main function to
> be written straight forward.  This also takes advantage of the fact that NULL
> dev arguments have been gone from the DMA API for a while.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  kernel/dma/contiguous.c | 31 ++++++++++++++-----------------
>  1 file changed, 14 insertions(+), 17 deletions(-)
> 
> diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c index
> 15bc5026c485f2..cff7e60968b9e1 100644
> --- a/kernel/dma/contiguous.c
> +++ b/kernel/dma/contiguous.c
> @@ -215,6 +215,13 @@ bool dma_release_from_contiguous(struct device
> *dev, struct page *pages,
>  	return cma_release(dev_get_cma_area(dev), pages, count);  }
> 
> +static struct page *cma_alloc_aligned(struct cma *cma, size_t size,
> +gfp_t gfp) {
> +	unsigned int align = min(get_order(size), CONFIG_CMA_ALIGNMENT);
> +
> +	return cma_alloc(cma, size >> PAGE_SHIFT, align, gfp & __GFP_NOWARN);
> +}
> +
>  /**
>   * dma_alloc_contiguous() - allocate contiguous pages
>   * @dev:   Pointer to device for which the allocation is performed.
> @@ -231,24 +238,14 @@ bool dma_release_from_contiguous(struct device
> *dev, struct page *pages,
>   */
>  struct page *dma_alloc_contiguous(struct device *dev, size_t size, gfp_t gfp)
> {
> -	size_t count = size >> PAGE_SHIFT;
> -	struct page *page = NULL;
> -	struct cma *cma = NULL;
> -
> -	if (dev && dev->cma_area)
> -		cma = dev->cma_area;
> -	else if (count > 1)
> -		cma = dma_contiguous_default_area;
> -
>  	/* CMA can be used only in the context which permits sleeping */
> -	if (cma && gfpflags_allow_blocking(gfp)) {
> -		size_t align = get_order(size);
> -		size_t cma_align = min_t(size_t, align, CONFIG_CMA_ALIGNMENT);
> -
> -		page = cma_alloc(cma, count, cma_align, gfp & __GFP_NOWARN);
> -	}
> -
> -	return page;
> +	if (!gfpflags_allow_blocking(gfp))
> +		return NULL;
> +	if (dev->cma_area)
> +		return cma_alloc_aligned(dev->cma_area, size, gfp);
> +	if (size <= PAGE_SIZE || !dma_contiguous_default_area)
> +		return NULL;
> +	return cma_alloc_aligned(dma_contiguous_default_area, size, gfp);
>  }
> 
>  /**
> --
> 2.27.0

Thanks
Barry

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
