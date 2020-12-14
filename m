Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id D03342D9879
	for <lists.iommu@lfdr.de>; Mon, 14 Dec 2020 14:01:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7C93A852F8;
	Mon, 14 Dec 2020 13:01:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EvSjK2uHUtLC; Mon, 14 Dec 2020 13:01:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 26D4B852F6;
	Mon, 14 Dec 2020 13:01:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 01816C1D9F;
	Mon, 14 Dec 2020 13:01:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ED420C013B
 for <iommu@lists.linux-foundation.org>; Mon, 14 Dec 2020 13:01:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id D04FC20454
 for <iommu@lists.linux-foundation.org>; Mon, 14 Dec 2020 13:01:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iGYTYSI2F3D7 for <iommu@lists.linux-foundation.org>;
 Mon, 14 Dec 2020 13:01:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by silver.osuosl.org (Postfix) with ESMTP id E88B42035D
 for <iommu@lists.linux-foundation.org>; Mon, 14 Dec 2020 13:01:28 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 092FF1FB;
 Mon, 14 Dec 2020 05:01:28 -0800 (PST)
Received: from [10.57.33.60] (unknown [10.57.33.60])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DE7313F66B;
 Mon, 14 Dec 2020 05:01:26 -0800 (PST)
Subject: Re: [PATCH v2] dma-mapping: add unlikely hint for error path in
 dma_mapping_error
To: Heiner Kallweit <hkallweit1@gmail.com>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Barry Song <song.bao.hua@hisilicon.com>
References: <39581f9a-0066-ad98-094d-d41082145e23@gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <ba14be47-6c77-94d6-9904-b4679e62091b@arm.com>
Date: Mon, 14 Dec 2020 13:01:25 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <39581f9a-0066-ad98-094d-d41082145e23@gmail.com>
Content-Language: en-GB
Cc: "open list:AMD IOMMU \(AMD-VI\)" <iommu@lists.linux-foundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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

On 2020-12-13 16:32, Heiner Kallweit wrote:
> Zillions of drivers use the unlikely() hint when checking the result of
> dma_mapping_error(). This is an inline function anyway, so we can move
> the hint into this function and remove it from drivers.

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

FWIW I consider this case similar to the same hint in WARN_ON() and 
friends - it's a pretty severe condition that should never be expected 
to be hit in normal operation, so it's entirely logical for it to be 
implicitly unlikely. I struggle to imagine any case that would 
specifically *not* want that (or worse, want to hint it as likely). Some 
DMA API backends may spend considerable time trying as hard as possible 
to make a mapping work before eventually admitting defeat, so the idea 
of ever trying to optimise at the driver level for failure in hot paths 
just makes no sense.

Thanks,
Robin.

> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> v2:
> Split the big patch into the change for dma-mapping.h and follow-up
> patches per subsystem that will go through the trees of the respective
> maintainers.
> ---
>   include/linux/dma-mapping.h | 2 +-
>   kernel/dma/map_benchmark.c  | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
> index 2e49996a8..6177e20b5 100644
> --- a/include/linux/dma-mapping.h
> +++ b/include/linux/dma-mapping.h
> @@ -95,7 +95,7 @@ static inline int dma_mapping_error(struct device *dev, dma_addr_t dma_addr)
>   {
>   	debug_dma_mapping_error(dev, dma_addr);
>   
> -	if (dma_addr == DMA_MAPPING_ERROR)
> +	if (unlikely(dma_addr == DMA_MAPPING_ERROR))
>   		return -ENOMEM;
>   	return 0;
>   }
> diff --git a/kernel/dma/map_benchmark.c b/kernel/dma/map_benchmark.c
> index b1496e744..901420a5d 100644
> --- a/kernel/dma/map_benchmark.c
> +++ b/kernel/dma/map_benchmark.c
> @@ -78,7 +78,7 @@ static int map_benchmark_thread(void *data)
>   
>   		map_stime = ktime_get();
>   		dma_addr = dma_map_single(map->dev, buf, PAGE_SIZE, map->dir);
> -		if (unlikely(dma_mapping_error(map->dev, dma_addr))) {
> +		if (dma_mapping_error(map->dev, dma_addr)) {
>   			pr_err("dma_map_single failed on %s\n",
>   				dev_name(map->dev));
>   			ret = -ENOMEM;
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
