Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id A55443DD71B
	for <lists.iommu@lfdr.de>; Mon,  2 Aug 2021 15:30:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 456056080C;
	Mon,  2 Aug 2021 13:30:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pxZTMjEcbbeR; Mon,  2 Aug 2021 13:30:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 5E789607B7;
	Mon,  2 Aug 2021 13:30:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 45C42C000E;
	Mon,  2 Aug 2021 13:30:45 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0A244C000E
 for <iommu@lists.linux-foundation.org>; Mon,  2 Aug 2021 13:30:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E1D776080C
 for <iommu@lists.linux-foundation.org>; Mon,  2 Aug 2021 13:30:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id exjPdNDxCnWb for <iommu@lists.linux-foundation.org>;
 Mon,  2 Aug 2021 13:30:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DB6FF60656
 for <iommu@lists.linux-foundation.org>; Mon,  2 Aug 2021 13:30:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5381260F6D;
 Mon,  2 Aug 2021 13:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627911042;
 bh=AopIBg3UQuNzGUn6zHPTl2RUpxi1CeIiSyyBhV3W0IU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nHwL3XngEiLQt4Didk/zSnyxzEHhLvI/h87NYzxgJW8aV9nergHLrRivaMg8Z2AZO
 8kuEw4+FZosbZe4uikBvFP1Sml89L/BSeuj5Ff25UAMW6Pcy7EYLRaZp/DGE9vk/Q3
 xr2oL845xDL4K22oGmVfyU0UzhLgn1e1K8khfY9wEkWXOOG6qbBH+ZnjQ3/qqnk0GR
 WXPH12PIZS96YbDsPp9MnZp6cvrcg1r/6GlQq0HFHKMI0yyFCqvnI/99FWO93aoC5q
 +9Um+bb8RbypSIvULxhV0A5kejZrgqd8NNxdC4uS2WUXxGe8MAXKh0p/EIZPA13Hpc
 EN7cMXB+23UFQ==
Date: Mon, 2 Aug 2021 14:30:38 +0100
From: Will Deacon <will@kernel.org>
To: David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH v2 1/4] dma-iommu: fix sync_sg with swiotlb
Message-ID: <20210802133037.GB28547@willie-the-truck>
References: <20210709033502.3545820-1-stevensd@google.com>
 <20210709033502.3545820-2-stevensd@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210709033502.3545820-2-stevensd@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-kernel@vger.kernel.org, Tom Murphy <murphyt7@tcd.ie>,
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>
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

On Fri, Jul 09, 2021 at 12:34:59PM +0900, David Stevens wrote:
> From: David Stevens <stevensd@chromium.org>
> 
> The is_swiotlb_buffer function takes the physical address of the swiotlb
> buffer, not the physical address of the original buffer. The sglist
> contains the physical addresses of the original buffer, so for the
> sync_sg functions to work properly when a bounce buffer might have been
> used, we need to use iommu_iova_to_phys to look up the physical address.
> This is what sync_single does, so call that function on each sglist
> segment.
> 
> The previous code mostly worked because swiotlb does the transfer on map
> and unmap. However, any callers which use DMA_ATTR_SKIP_CPU_SYNC with
> sglists or which call sync_sg would not have had anything copied to the
> bounce buffer.
> 
> Fixes: 82612d66d51d ("iommu: Allow the dma-iommu api to use bounce buffers")
> Signed-off-by: David Stevens <stevensd@chromium.org>
> ---
>  drivers/iommu/dma-iommu.c | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
> index 7bcdd1205535..eac65302439e 100644
> --- a/drivers/iommu/dma-iommu.c
> +++ b/drivers/iommu/dma-iommu.c
> @@ -811,14 +811,14 @@ static void iommu_dma_sync_sg_for_cpu(struct device *dev,
>  	if (dev_is_dma_coherent(dev) && !dev_is_untrusted(dev))
>  		return;
>  
> -	for_each_sg(sgl, sg, nelems, i) {
> -		if (!dev_is_dma_coherent(dev))
> -			arch_sync_dma_for_cpu(sg_phys(sg), sg->length, dir);
> -
> -		if (is_swiotlb_buffer(sg_phys(sg)))
> +	if (dev_is_untrusted(dev))
> +		for_each_sg(sgl, sg, nelems, i)
> +			iommu_dma_sync_single_for_cpu(dev, sg_dma_address(sg),
> +						      sg->length, dir);
> +	else
> +		for_each_sg(sgl, sg, nelems, i)
>  			swiotlb_sync_single_for_cpu(dev, sg_phys(sg),
>  						    sg->length, dir);

Doesn't this skip arch_sync_dma_for_cpu() for non-coherent trusted devices?

Why not skip the extra dev_is_untrusted(dev) call here and just call
iommu_dma_sync_single_for_cpu() for each entry regardless?

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
