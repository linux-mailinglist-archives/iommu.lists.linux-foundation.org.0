Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9242A408A
	for <lists.iommu@lfdr.de>; Tue,  3 Nov 2020 10:46:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 3E45E20507;
	Tue,  3 Nov 2020 09:46:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mU1-l5kCy-RZ; Tue,  3 Nov 2020 09:46:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id CBE1620384;
	Tue,  3 Nov 2020 09:46:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AEE20C0889;
	Tue,  3 Nov 2020 09:46:51 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 894E0C0889
 for <iommu@lists.linux-foundation.org>; Tue,  3 Nov 2020 09:46:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 78AD08709E
 for <iommu@lists.linux-foundation.org>; Tue,  3 Nov 2020 09:46:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ddJQdt0iMmXy for <iommu@lists.linux-foundation.org>;
 Tue,  3 Nov 2020 09:46:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by hemlock.osuosl.org (Postfix) with ESMTPS id C9D1287269
 for <iommu@lists.linux-foundation.org>; Tue,  3 Nov 2020 09:46:47 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id C586667373; Tue,  3 Nov 2020 10:46:43 +0100 (CET)
Date: Tue, 3 Nov 2020 10:46:43 +0100
From: Christoph Hellwig <hch@lst.de>
To: konrad.wilk@oracle.com
Subject: Re: [PATCH for-5.10] swiotlb: remove the tbl_dma_addr argument to
 swiotlb_tbl_map_single
Message-ID: <20201103094643.GA18936@lst.de>
References: <20201023063309.3472987-1-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201023063309.3472987-1-hch@lst.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: xen-devel@lists.xenproject.org, iommu@lists.linux-foundation.org,
 Stefano Stabellini <sstabellini@kernel.org>
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

ping?

On Fri, Oct 23, 2020 at 08:33:09AM +0200, Christoph Hellwig wrote:
> The tbl_dma_addr argument is used to check the DMA boundary for the
> allocations, and thus needs to be a dma_addr_t.  swiotlb-xen instead
> passed a physical address, which could lead to incorrect results for
> strange offsets.  Fix this by removing the parameter entirely and hard
> code the DMA address for io_tlb_start instead.
> 
> Fixes: 91ffe4ad534a ("swiotlb-xen: introduce phys_to_dma/dma_to_phys translations")
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> ---
>  drivers/iommu/intel/iommu.c |  5 ++---
>  drivers/xen/swiotlb-xen.c   |  3 +--
>  include/linux/swiotlb.h     | 10 +++-------
>  kernel/dma/swiotlb.c        | 16 ++++++----------
>  4 files changed, 12 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
> index 8651f6d4dfa032..6b560e6f193096 100644
> --- a/drivers/iommu/intel/iommu.c
> +++ b/drivers/iommu/intel/iommu.c
> @@ -3815,9 +3815,8 @@ bounce_map_single(struct device *dev, phys_addr_t paddr, size_t size,
>  	 * page aligned, we don't need to use a bounce page.
>  	 */
>  	if (!IS_ALIGNED(paddr | size, VTD_PAGE_SIZE)) {
> -		tlb_addr = swiotlb_tbl_map_single(dev,
> -				phys_to_dma_unencrypted(dev, io_tlb_start),
> -				paddr, size, aligned_size, dir, attrs);
> +		tlb_addr = swiotlb_tbl_map_single(dev, paddr, size,
> +				aligned_size, dir, attrs);
>  		if (tlb_addr == DMA_MAPPING_ERROR) {
>  			goto swiotlb_error;
>  		} else {
> diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
> index 71ce1b7a23d1cc..2b385c1b4a99cb 100644
> --- a/drivers/xen/swiotlb-xen.c
> +++ b/drivers/xen/swiotlb-xen.c
> @@ -395,8 +395,7 @@ static dma_addr_t xen_swiotlb_map_page(struct device *dev, struct page *page,
>  	 */
>  	trace_swiotlb_bounced(dev, dev_addr, size, swiotlb_force);
>  
> -	map = swiotlb_tbl_map_single(dev, virt_to_phys(xen_io_tlb_start),
> -				     phys, size, size, dir, attrs);
> +	map = swiotlb_tbl_map_single(dev, phys, size, size, dir, attrs);
>  	if (map == (phys_addr_t)DMA_MAPPING_ERROR)
>  		return DMA_MAPPING_ERROR;
>  
> diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
> index 513913ff748626..3bb72266a75a1d 100644
> --- a/include/linux/swiotlb.h
> +++ b/include/linux/swiotlb.h
> @@ -45,13 +45,9 @@ enum dma_sync_target {
>  	SYNC_FOR_DEVICE = 1,
>  };
>  
> -extern phys_addr_t swiotlb_tbl_map_single(struct device *hwdev,
> -					  dma_addr_t tbl_dma_addr,
> -					  phys_addr_t phys,
> -					  size_t mapping_size,
> -					  size_t alloc_size,
> -					  enum dma_data_direction dir,
> -					  unsigned long attrs);
> +phys_addr_t swiotlb_tbl_map_single(struct device *hwdev, phys_addr_t phys,
> +		size_t mapping_size, size_t alloc_size,
> +		enum dma_data_direction dir, unsigned long attrs);
>  
>  extern void swiotlb_tbl_unmap_single(struct device *hwdev,
>  				     phys_addr_t tlb_addr,
> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> index b4eea0abc3f002..92e2f54f24c01b 100644
> --- a/kernel/dma/swiotlb.c
> +++ b/kernel/dma/swiotlb.c
> @@ -441,14 +441,11 @@ static void swiotlb_bounce(phys_addr_t orig_addr, phys_addr_t tlb_addr,
>  	}
>  }
>  
> -phys_addr_t swiotlb_tbl_map_single(struct device *hwdev,
> -				   dma_addr_t tbl_dma_addr,
> -				   phys_addr_t orig_addr,
> -				   size_t mapping_size,
> -				   size_t alloc_size,
> -				   enum dma_data_direction dir,
> -				   unsigned long attrs)
> +phys_addr_t swiotlb_tbl_map_single(struct device *hwdev, phys_addr_t orig_addr,
> +		size_t mapping_size, size_t alloc_size,
> +		enum dma_data_direction dir, unsigned long attrs)
>  {
> +	dma_addr_t tbl_dma_addr = phys_to_dma_unencrypted(hwdev, io_tlb_start);
>  	unsigned long flags;
>  	phys_addr_t tlb_addr;
>  	unsigned int nslots, stride, index, wrap;
> @@ -667,9 +664,8 @@ dma_addr_t swiotlb_map(struct device *dev, phys_addr_t paddr, size_t size,
>  	trace_swiotlb_bounced(dev, phys_to_dma(dev, paddr), size,
>  			      swiotlb_force);
>  
> -	swiotlb_addr = swiotlb_tbl_map_single(dev,
> -			phys_to_dma_unencrypted(dev, io_tlb_start),
> -			paddr, size, size, dir, attrs);
> +	swiotlb_addr = swiotlb_tbl_map_single(dev, paddr, size, size, dir,
> +			attrs);
>  	if (swiotlb_addr == (phys_addr_t)DMA_MAPPING_ERROR)
>  		return DMA_MAPPING_ERROR;
>  
> -- 
> 2.28.0
> 
> _______________________________________________
> iommu mailing list
> iommu@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/iommu
---end quoted text---
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
