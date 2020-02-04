Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 2092D151CFE
	for <lists.iommu@lfdr.de>; Tue,  4 Feb 2020 16:14:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 36626203C3;
	Tue,  4 Feb 2020 15:14:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uUua72hTGEze; Tue,  4 Feb 2020 15:14:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 380C5203A2;
	Tue,  4 Feb 2020 15:14:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1FD7EC0177;
	Tue,  4 Feb 2020 15:14:11 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8AC92C0174
 for <iommu@lists.linux-foundation.org>; Tue,  4 Feb 2020 15:14:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 79A368513B
 for <iommu@lists.linux-foundation.org>; Tue,  4 Feb 2020 15:14:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lAFt-ibe3O2C for <iommu@lists.linux-foundation.org>;
 Tue,  4 Feb 2020 15:14:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B881884F58
 for <iommu@lists.linux-foundation.org>; Tue,  4 Feb 2020 15:14:08 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 09B8B101E;
 Tue,  4 Feb 2020 07:14:08 -0800 (PST)
Received: from [10.1.196.37] (e121345-lin.cambridge.arm.com [10.1.196.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8C7C43F52E;
 Tue,  4 Feb 2020 07:14:07 -0800 (PST)
Subject: Re: [PATCH 2/2] dma-direct: improve DMA mask overflow reporting
To: Christoph Hellwig <hch@lst.de>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
References: <20200204063205.652456-1-hch@lst.de>
 <20200204063205.652456-3-hch@lst.de>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <b4ff1d6c-6dcb-3f7b-3935-451bdbffdcc3@arm.com>
Date: Tue, 4 Feb 2020 15:14:06 +0000
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200204063205.652456-3-hch@lst.de>
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

On 04/02/2020 6:32 am, Christoph Hellwig wrote:
> Remove the unset dma_mask case as that won't get into mapping calls
> anymore, and also report the other errors unconditonally and with a
> slightly improved message.  Remove the now pointless report_addr helper.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   kernel/dma/direct.c | 22 ++++++++--------------
>   1 file changed, 8 insertions(+), 14 deletions(-)
> 
> diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> index 82ad50aaf42c..04f308a47fc3 100644
> --- a/kernel/dma/direct.c
> +++ b/kernel/dma/direct.c
> @@ -23,18 +23,6 @@
>    */
>   unsigned int zone_dma_bits __ro_after_init = 24;
>   
> -static void report_addr(struct device *dev, dma_addr_t dma_addr, size_t size)
> -{
> -	if (!dev->dma_mask) {
> -		dev_err_once(dev, "DMA map on device without dma_mask\n");
> -	} else if (*dev->dma_mask >= DMA_BIT_MASK(32) || dev->bus_dma_limit) {
> -		dev_err_once(dev,
> -			"overflow %pad+%zu of DMA mask %llx bus limit %llx\n",
> -			&dma_addr, size, *dev->dma_mask, dev->bus_dma_limit);
> -	}
> -	WARN_ON_ONCE(1);
> -}
> -
>   static inline dma_addr_t phys_to_dma_direct(struct device *dev,
>   		phys_addr_t phys)
>   {
> @@ -371,7 +359,10 @@ dma_addr_t dma_direct_map_page(struct device *dev, struct page *page,
>   		if (swiotlb_force != SWIOTLB_NO_FORCE)
>   			return swiotlb_map(dev, phys, size, dir, attrs);
>   
> -		report_addr(dev, dma_addr, size);
> +		dev_err_once(dev,
> +			     "DMA addr %pad+%zu overflow (mask %llx, bus limit %llx).\n",
> +			     &dma_addr, size, *dev->dma_mask, dev->bus_dma_limit);
> +		WARN_ON_ONCE(1);

Or even dev_WARN_ONCE() to make them even simpler?

Robin.

>   		return DMA_MAPPING_ERROR;
>   	}
>   
> @@ -409,7 +400,10 @@ dma_addr_t dma_direct_map_resource(struct device *dev, phys_addr_t paddr,
>   	dma_addr_t dma_addr = paddr;
>   
>   	if (unlikely(!dma_capable(dev, dma_addr, size, false))) {
> -		report_addr(dev, dma_addr, size);
> +		dev_err_once(dev,
> +			     "DMA addr %pad+%zu overflow (mask %llx, bus limit %llx).\n",
> +			     &dma_addr, size, *dev->dma_mask, dev->bus_dma_limit);
> +		WARN_ON_ONCE(1);
>   		return DMA_MAPPING_ERROR;
>   	}
>   
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
