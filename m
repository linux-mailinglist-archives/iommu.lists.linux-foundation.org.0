Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CE46E46D
	for <lists.iommu@lfdr.de>; Fri, 19 Jul 2019 12:38:37 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1754C2463;
	Fri, 19 Jul 2019 10:38:35 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 6043D245C
	for <iommu@lists.linux-foundation.org>;
	Fri, 19 Jul 2019 10:38:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id D0646FE
	for <iommu@lists.linux-foundation.org>;
	Fri, 19 Jul 2019 10:38:18 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3BFB9337;
	Fri, 19 Jul 2019 03:38:18 -0700 (PDT)
Received: from [10.1.197.57] (e110467-lin.cambridge.arm.com [10.1.197.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3345C3F59C;
	Fri, 19 Jul 2019 03:38:17 -0700 (PDT)
Subject: Re: [PATCH dma 1/1] dma-direct: correct the physical addr in
	dma_direct_sync_sg_for_cpu/device
To: fugang.duan@nxp.com, hch@lst.de, m.szyprowski@samsung.com
References: <20190719092648.11085-1-fugang.duan@nxp.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <a9a544fc-5c45-ec14-9a1d-f976f20b2d25@arm.com>
Date: Fri, 19 Jul 2019 11:38:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190719092648.11085-1-fugang.duan@nxp.com>
Content-Language: en-GB
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: aisheng.dong@nxp.com, Al Farleigh <AWFour@charter.net>,
	iommu@lists.linux-foundation.org, festevam@gmail.com,
	linux-kernel@vger.kernel.org
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On 19/07/2019 10:26, fugang.duan@nxp.com wrote:
> From: Fugang Duan <fugang.duan@nxp.com>
> 
> dma_map_sg() may use swiotlb buffer when kernel parameter include
> "swiotlb=force" or the dma_addr is out of dev->dma_mask range. After
> DMA complete the memory moving from device to memory, then user call
> dma_sync_sg_for_cpu() to sync with DMA buffer, and copy the original
> virtual buffer to other space.
> 
> So dma_direct_sync_sg_for_cpu() should use swiotlb physical addr, not
> the original physical addr from sg_phys(sg).
> 
> dma_direct_sync_sg_for_device() also has the similar issue, correct it.

Yikes, that was unfortunate. There aren't too many users of 
dma_sync_sg*(), but I note that a few of them are in and around v4l2, so 
this could well explain the video brokenness that Al reported.

AFAICS the fix looks appropriate;

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Fixes: 55897af63091("dma-direct: merge swiotlb_dma_ops into the dma_direct code")
> Signed-off-by: Fugang Duan <fugang.duan@nxp.com>
> ---
>   kernel/dma/direct.c | 18 +++++++++++-------
>   1 file changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> index b90e1ae..0e87f86 100644
> --- a/kernel/dma/direct.c
> +++ b/kernel/dma/direct.c
> @@ -242,12 +242,14 @@ void dma_direct_sync_sg_for_device(struct device *dev,
>   	int i;
>   
>   	for_each_sg(sgl, sg, nents, i) {
> -		if (unlikely(is_swiotlb_buffer(sg_phys(sg))))
> -			swiotlb_tbl_sync_single(dev, sg_phys(sg), sg->length,
> +		phys_addr_t paddr = dma_to_phys(dev, sg_dma_address(sg));
> +
> +		if (unlikely(is_swiotlb_buffer(paddr)))
> +			swiotlb_tbl_sync_single(dev, paddr, sg->length,
>   					dir, SYNC_FOR_DEVICE);
>   
>   		if (!dev_is_dma_coherent(dev))
> -			arch_sync_dma_for_device(dev, sg_phys(sg), sg->length,
> +			arch_sync_dma_for_device(dev, paddr, sg->length,
>   					dir);
>   	}
>   }
> @@ -279,11 +281,13 @@ void dma_direct_sync_sg_for_cpu(struct device *dev,
>   	int i;
>   
>   	for_each_sg(sgl, sg, nents, i) {
> +		phys_addr_t paddr = dma_to_phys(dev, sg_dma_address(sg));
> +
>   		if (!dev_is_dma_coherent(dev))
> -			arch_sync_dma_for_cpu(dev, sg_phys(sg), sg->length, dir);
> -	
> -		if (unlikely(is_swiotlb_buffer(sg_phys(sg))))
> -			swiotlb_tbl_sync_single(dev, sg_phys(sg), sg->length, dir,
> +			arch_sync_dma_for_cpu(dev, paddr, sg->length, dir);
> +
> +		if (unlikely(is_swiotlb_buffer(paddr)))
> +			swiotlb_tbl_sync_single(dev, paddr, sg->length, dir,
>   					SYNC_FOR_CPU);
>   	}
>   
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
