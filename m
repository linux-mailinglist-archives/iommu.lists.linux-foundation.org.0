Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id E277830FFE6
	for <lists.iommu@lfdr.de>; Thu,  4 Feb 2021 23:09:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 98DB784BC9;
	Thu,  4 Feb 2021 22:09:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x_b_sikf8jO8; Thu,  4 Feb 2021 22:09:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C649284837;
	Thu,  4 Feb 2021 22:09:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A58DFC013A;
	Thu,  4 Feb 2021 22:09:09 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4B2F4C013A
 for <iommu@lists.linux-foundation.org>; Thu,  4 Feb 2021 22:09:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 18F318672E
 for <iommu@lists.linux-foundation.org>; Thu,  4 Feb 2021 22:09:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eKM7THjqqj5G for <iommu@lists.linux-foundation.org>;
 Thu,  4 Feb 2021 22:09:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 21BFF84BC9
 for <iommu@lists.linux-foundation.org>; Thu,  4 Feb 2021 22:09:07 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 27B9A13A1;
 Thu,  4 Feb 2021 14:09:06 -0800 (PST)
Received: from [10.57.49.26] (unknown [10.57.49.26])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 65AC73F718;
 Thu,  4 Feb 2021 14:09:04 -0800 (PST)
Subject: Re: [PATCH 3/8] swiotlb: factor out a nr_slots helper
To: Christoph Hellwig <hch@lst.de>, jxgao@google.com,
 gregkh@linuxfoundation.org
References: <20210204193035.2606838-1-hch@lst.de>
 <20210204193035.2606838-4-hch@lst.de>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <ae995e9d-4476-cea2-a4d7-9e9cbab5aafd@arm.com>
Date: Thu, 4 Feb 2021 22:09:02 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210204193035.2606838-4-hch@lst.de>
Content-Language: en-GB
Cc: saravanak@google.com, konrad.wilk@oracle.com, marcorr@google.com,
 linux-nvme@lists.infradead.org, kbusch@kernel.org,
 iommu@lists.linux-foundation.org
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

On 2021-02-04 19:30, Christoph Hellwig wrote:
> Factor out a helper to find the number of slots for a given size.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   kernel/dma/swiotlb.c | 13 +++++++++----
>   1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> index 838dbad10ab916..0c0b81799edbdb 100644
> --- a/kernel/dma/swiotlb.c
> +++ b/kernel/dma/swiotlb.c
> @@ -194,6 +194,11 @@ static inline unsigned long io_tlb_offset(unsigned long val)
>   	return val & (IO_TLB_SEGSIZE - 1);
>   }
>   
> +static unsigned long nr_slots(u64 val)
> +{
> +	return ALIGN(val, 1 << IO_TLB_SHIFT) >> IO_TLB_SHIFT;

Would DIV_ROUND_UP(val, 1 << IOTLB_SHIFT) be even clearer?

Robin.

> +}
> +
>   /*
>    * Early SWIOTLB allocation may be too early to allow an architecture to
>    * perform the desired operations.  This function allows the architecture to
> @@ -493,20 +498,20 @@ phys_addr_t swiotlb_tbl_map_single(struct device *hwdev, phys_addr_t orig_addr,
>   
>   	tbl_dma_addr &= mask;
>   
> -	offset_slots = ALIGN(tbl_dma_addr, 1 << IO_TLB_SHIFT) >> IO_TLB_SHIFT;
> +	offset_slots = nr_slots(tbl_dma_addr);
>   
>   	/*
>   	 * Carefully handle integer overflow which can occur when mask == ~0UL.
>   	 */
>   	max_slots = mask + 1
> -		    ? ALIGN(mask + 1, 1 << IO_TLB_SHIFT) >> IO_TLB_SHIFT
> +		    ? nr_slots(mask + 1)
>   		    : 1UL << (BITS_PER_LONG - IO_TLB_SHIFT);
>   
>   	/*
>   	 * For mappings greater than or equal to a page, we limit the stride
>   	 * (and hence alignment) to a page size.
>   	 */
> -	nslots = ALIGN(alloc_size, 1 << IO_TLB_SHIFT) >> IO_TLB_SHIFT;
> +	nslots = nr_slots(alloc_size);
>   	if (alloc_size >= PAGE_SIZE)
>   		stride = (1 << (PAGE_SHIFT - IO_TLB_SHIFT));
>   	else
> @@ -602,7 +607,7 @@ void swiotlb_tbl_unmap_single(struct device *hwdev, phys_addr_t tlb_addr,
>   			      enum dma_data_direction dir, unsigned long attrs)
>   {
>   	unsigned long flags;
> -	int i, count, nslots = ALIGN(alloc_size, 1 << IO_TLB_SHIFT) >> IO_TLB_SHIFT;
> +	int i, count, nslots = nr_slots(alloc_size);
>   	int index = (tlb_addr - io_tlb_start) >> IO_TLB_SHIFT;
>   	phys_addr_t orig_addr = io_tlb_orig_addr[index];
>   
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
