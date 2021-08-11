Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4313E89F7
	for <lists.iommu@lfdr.de>; Wed, 11 Aug 2021 07:58:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BDBFD4017B;
	Wed, 11 Aug 2021 05:58:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pvYST9OaQMb5; Wed, 11 Aug 2021 05:58:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id B1C5C4014C;
	Wed, 11 Aug 2021 05:58:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8271FC0022;
	Wed, 11 Aug 2021 05:58:36 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AD47CC000E
 for <iommu@lists.linux-foundation.org>; Wed, 11 Aug 2021 05:58:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 88BA34017B
 for <iommu@lists.linux-foundation.org>; Wed, 11 Aug 2021 05:58:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hDyZthOFS-4a for <iommu@lists.linux-foundation.org>;
 Wed, 11 Aug 2021 05:58:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6CFAC4014C
 for <iommu@lists.linux-foundation.org>; Wed, 11 Aug 2021 05:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=cCkb2qMOYuPYfdphFUYq7dI3/TJ7XUd74ZXsL2WF3pw=; b=d9PMnaIJQRLjQ2mzCUBHCcxmKQ
 XYK0zfnIRwpk1A1IUHghWg6sHIWDqaSuyabmsK6qMMtzrkeQjEdbEBqVfk5bmggGvwhNqJsesgP33
 M3MH8uXoF/UF4amLLFo9R6zZuG9wtMmbO91iZOp4upiS94yjZOFTaAoTqtUqWrGsm3yHCl3jyop5L
 y4g1NM6VoULjbyKT3E0SNPUaNfCWBZNtUCq2urc/uL0KMd99WfLE+4W+VYtG55qGusfumpgO43p6R
 D39sUvFki7bEbaZmFx2KzF6gdwWpuRppDYMBsNhm7LyC8W/TNw21fBdckULCRJdozpVwaaUusQ3ch
 c4cfbR/Q==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1mDhEz-00D2T9-A4; Wed, 11 Aug 2021 05:57:33 +0000
Date: Wed, 11 Aug 2021 06:57:25 +0100
From: Christoph Hellwig <hch@infradead.org>
To: David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH v3 1/5] dma-iommu: fix sync_sg with swiotlb
Message-ID: <YRNmxU9Ou2OcvBq2@infradead.org>
References: <20210811024247.1144246-1-stevensd@google.com>
 <20210811024247.1144246-2-stevensd@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210811024247.1144246-2-stevensd@google.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: Will Deacon <will@kernel.org>, iommu@lists.linux-foundation.org,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 Tom Murphy <murphyt7@tcd.ie>
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

On Wed, Aug 11, 2021 at 11:42:43AM +0900, David Stevens wrote:
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
>  drivers/iommu/dma-iommu.c | 27 +++++++++++++--------------
>  1 file changed, 13 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
> index 98ba927aee1a..54e103b989d9 100644
> --- a/drivers/iommu/dma-iommu.c
> +++ b/drivers/iommu/dma-iommu.c
> @@ -813,14 +813,13 @@ static void iommu_dma_sync_sg_for_cpu(struct device *dev,
>  	if (dev_is_dma_coherent(dev) && !dev_is_untrusted(dev))
>  		return;
>  
> +	if (dev_is_untrusted(dev))
> +		for_each_sg(sgl, sg, nelems, i)
> +			iommu_dma_sync_single_for_cpu(dev, sg_dma_address(sg),
> +						      sg->length, dir);
> +	else
> +		for_each_sg(sgl, sg, nelems, i)
>  			arch_sync_dma_for_cpu(sg_phys(sg), sg->length, dir);
>  }

I'd remove the above check and fold the if (!dev_is_dma_coherent(dev))
into the else line.  Same for iommu_dma_sync_sg_for_device.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
