Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 9618AA2A45
	for <lists.iommu@lfdr.de>; Fri, 30 Aug 2019 00:50:01 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 490EC59BB;
	Thu, 29 Aug 2019 22:49:58 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 8006759BC
	for <iommu@lists.linux-foundation.org>;
	Thu, 29 Aug 2019 22:48:12 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 35755E6
	for <iommu@lists.linux-foundation.org>;
	Thu, 29 Aug 2019 22:48:12 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id A476C21874;
	Thu, 29 Aug 2019 22:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1567118892;
	bh=qahLSZidWBqyiJ9KPLWGgOnki/Ohn0lpoN98VUjbdJo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=lox9/f+oJeZihIIKB+HOTjYdPrpnsEmbhUNTlvyPbLyIuqorYqCD/5ugnctXNXr5S
	h9zmT10Nj3xoPfMfmjrctVtlI6lWBTjpTEDIPjzV13CX8jSzyEDs3QtOFIQ8vJWNJn
	iP9g2neD8o6CjtcvfTYgSj6BBKHMbvfVJOT8Yk/g=
Date: Thu, 29 Aug 2019 15:48:11 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 10/11] swiotlb-xen: merge xen_unmap_single into
	xen_swiotlb_unmap_page
In-Reply-To: <20190826121944.515-11-hch@lst.de>
Message-ID: <alpine.DEB.2.21.1908281526470.8175@sstabellini-ThinkPad-T480s>
References: <20190826121944.515-1-hch@lst.de>
	<20190826121944.515-11-hch@lst.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, x86@kernel.org,
	linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
	xen-devel@lists.xenproject.org, linux-arm-kernel@lists.infradead.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On Mon, 26 Aug 2019, Christoph Hellwig wrote:
> No need for a no-op wrapper.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
>  drivers/xen/swiotlb-xen.c | 15 ++++-----------
>  1 file changed, 4 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
> index 95911ff9c11c..384304a77020 100644
> --- a/drivers/xen/swiotlb-xen.c
> +++ b/drivers/xen/swiotlb-xen.c
> @@ -414,9 +414,8 @@ static dma_addr_t xen_swiotlb_map_page(struct device *dev, struct page *page,
>   * After this call, reads by the cpu to the buffer are guaranteed to see
>   * whatever the device wrote there.
>   */
> -static void xen_unmap_single(struct device *hwdev, dma_addr_t dev_addr,
> -			     size_t size, enum dma_data_direction dir,
> -			     unsigned long attrs)
> +static void xen_swiotlb_unmap_page(struct device *hwdev, dma_addr_t dev_addr,
> +		size_t size, enum dma_data_direction dir, unsigned long attrs)
>  {
>  	phys_addr_t paddr = xen_bus_to_phys(dev_addr);
>  
> @@ -430,13 +429,6 @@ static void xen_unmap_single(struct device *hwdev, dma_addr_t dev_addr,
>  		swiotlb_tbl_unmap_single(hwdev, paddr, size, dir, attrs);
>  }
>  
> -static void xen_swiotlb_unmap_page(struct device *hwdev, dma_addr_t dev_addr,
> -			    size_t size, enum dma_data_direction dir,
> -			    unsigned long attrs)
> -{
> -	xen_unmap_single(hwdev, dev_addr, size, dir, attrs);
> -}
> -
>  static void
>  xen_swiotlb_sync_single_for_cpu(struct device *dev, dma_addr_t dma_addr,
>  		size_t size, enum dma_data_direction dir)
> @@ -477,7 +469,8 @@ xen_swiotlb_unmap_sg(struct device *hwdev, struct scatterlist *sgl, int nelems,
>  	BUG_ON(dir == DMA_NONE);
>  
>  	for_each_sg(sgl, sg, nelems, i)
> -		xen_unmap_single(hwdev, sg->dma_address, sg_dma_len(sg), dir, attrs);
> +		xen_swiotlb_unmap_page(hwdev, sg->dma_address, sg_dma_len(sg),
> +				dir, attrs);
>  
>  }
>  
> -- 
> 2.20.1
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
