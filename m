Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DBB2D4229
	for <lists.iommu@lfdr.de>; Wed,  9 Dec 2020 13:33:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4E4D38740D;
	Wed,  9 Dec 2020 12:33:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9KPHbN-vjdlf; Wed,  9 Dec 2020 12:33:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7FA7787452;
	Wed,  9 Dec 2020 12:33:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 53E18C1DA2;
	Wed,  9 Dec 2020 12:33:31 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D7FC5C013B
 for <iommu@lists.linux-foundation.org>; Wed,  9 Dec 2020 12:33:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C5DD1874D2
 for <iommu@lists.linux-foundation.org>; Wed,  9 Dec 2020 12:33:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cSI0v09-04gs for <iommu@lists.linux-foundation.org>;
 Wed,  9 Dec 2020 12:33:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by fraxinus.osuosl.org (Postfix) with ESMTP id DDCE1874D1
 for <iommu@lists.linux-foundation.org>; Wed,  9 Dec 2020 12:33:28 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1B12931B;
 Wed,  9 Dec 2020 04:33:28 -0800 (PST)
Received: from [10.57.61.6] (unknown [10.57.61.6])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 54E0B3F718;
 Wed,  9 Dec 2020 04:33:27 -0800 (PST)
Subject: Re: [PATCH] dma-iommu: remove __iommu_dma_mmap
To: Christoph Hellwig <hch@lst.de>, joro@8bytes.org, will@kernel.org
References: <20201209112019.2625029-1-hch@lst.de>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <7cce7842-6b53-d34e-88e8-30c6df76cb65@arm.com>
Date: Wed, 9 Dec 2020 12:33:25 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201209112019.2625029-1-hch@lst.de>
Content-Language: en-GB
Cc: iommu@lists.linux-foundation.org
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

On 2020-12-09 11:20, Christoph Hellwig wrote:
> The function has a single caller, so open code it there and take
> advantage of the precalculated page count variable.

I can't shake the feeling that we've written this patch at least twice 
before through all the refactoring, so definitely no objection from me 
to an obvious cleanup:

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   drivers/iommu/dma-iommu.c | 17 +----------------
>   1 file changed, 1 insertion(+), 16 deletions(-)
> 
> diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
> index 0cbcd3fc3e7e8d..f6ea1dabc6a894 100644
> --- a/drivers/iommu/dma-iommu.c
> +++ b/drivers/iommu/dma-iommu.c
> @@ -655,21 +655,6 @@ static void *iommu_dma_alloc_remap(struct device *dev, size_t size,
>   	return NULL;
>   }
>   
> -/**
> - * __iommu_dma_mmap - Map a buffer into provided user VMA
> - * @pages: Array representing buffer from __iommu_dma_alloc()
> - * @size: Size of buffer in bytes
> - * @vma: VMA describing requested userspace mapping
> - *
> - * Maps the pages of the buffer in @pages into @vma. The caller is responsible
> - * for verifying the correct size and protection of @vma beforehand.
> - */
> -static int __iommu_dma_mmap(struct page **pages, size_t size,
> -		struct vm_area_struct *vma)
> -{
> -	return vm_map_pages(vma, pages, PAGE_ALIGN(size) >> PAGE_SHIFT);
> -}
> -
>   static void iommu_dma_sync_single_for_cpu(struct device *dev,
>   		dma_addr_t dma_handle, size_t size, enum dma_data_direction dir)
>   {
> @@ -1102,7 +1087,7 @@ static int iommu_dma_mmap(struct device *dev, struct vm_area_struct *vma,
>   		struct page **pages = dma_common_find_pages(cpu_addr);
>   
>   		if (pages)
> -			return __iommu_dma_mmap(pages, size, vma);
> +			return vm_map_pages(vma, pages, nr_pages);
>   		pfn = vmalloc_to_pfn(cpu_addr);
>   	} else {
>   		pfn = page_to_pfn(virt_to_page(cpu_addr));
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
