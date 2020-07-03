Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A39213D81
	for <lists.iommu@lfdr.de>; Fri,  3 Jul 2020 18:21:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E740F87D61;
	Fri,  3 Jul 2020 16:21:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vbsB1qr7g0sG; Fri,  3 Jul 2020 16:21:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6F98987D52;
	Fri,  3 Jul 2020 16:21:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 67EA6C0733;
	Fri,  3 Jul 2020 16:21:54 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 218AAC0733
 for <iommu@lists.linux-foundation.org>; Fri,  3 Jul 2020 16:21:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 0853C204E1
 for <iommu@lists.linux-foundation.org>; Fri,  3 Jul 2020 16:21:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OE2BhzS7m4QL for <iommu@lists.linux-foundation.org>;
 Fri,  3 Jul 2020 16:21:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 4734E203F1
 for <iommu@lists.linux-foundation.org>; Fri,  3 Jul 2020 16:21:52 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9DBA7208E4;
 Fri,  3 Jul 2020 16:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593793312;
 bh=HhlNgQjMhz+GYZbL+CIhM+GpUQjJBmxjUQV7y4TEyig=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=unrH+mW//Md4+ho/OF+JI8Ue148MTSN6Upj5bJ7Xy26C5p0iVXFLE/HGSAFfeZlO+
 4szqHNKiY5JVlS3cVC9cC1kT9LnweMdBh9agWlR7WH0PO2aZ1GF3GCRKeHWNtme/NJ
 XiAaOcGZtY1we2bwxesxFu/uqxGspBD9EjJfZiFU=
Date: Fri, 3 Jul 2020 17:21:47 +0100
From: Will Deacon <will@kernel.org>
To: Barry Song <song.bao.hua@hisilicon.com>
Subject: Re: [PATCH] iommu/arm-smmu-v3: allocate the memory of queues in
 local numa node
Message-ID: <20200703162147.GB19780@willie-the-truck>
References: <20200601113141.69488-1-song.bao.hua@hisilicon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200601113141.69488-1-song.bao.hua@hisilicon.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linuxarm@huawei.com, iommu@lists.linux-foundation.org, robin.murphy@arm.com,
 hch@lst.de, linux-arm-kernel@lists.infradead.org
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

On Mon, Jun 01, 2020 at 11:31:41PM +1200, Barry Song wrote:
> dmam_alloc_coherent() will usually allocate memory from the default CMA. For
> a common arm64 defconfig without reserved memory in device tree, there is only
> one CMA close to address 0.
> dma_alloc_contiguous() will allocate memory without any idea of  NUMA and smmu
> has no customized per-numa cma_area.
> struct page *dma_alloc_contiguous(struct device *dev, size_t size, gfp_t gfp)
> {
>         size_t count = size >> PAGE_SHIFT;
>         struct page *page = NULL;
>         struct cma *cma = NULL;
> 
>         if (dev && dev->cma_area)
>                 cma = dev->cma_area;
>         else if (count > 1)
>                 cma = dma_contiguous_default_area;
> 
> 	...
>         return page;
> }
> 
> if there are N numa nodes, N-1 nodes will put command/evt queues etc in a
> remote node the default CMA belongs to,probably node 0. Tests show, after
> sending CMD_SYNC in an empty command queue,
> on Node2, without this patch, it takes 550ns to wait for the completion
> of CMD_SYNC; with this patch, it takes 250ns to wait for the completion
> of CMD_SYNC.
> 
> Signed-off-by: Barry Song <song.bao.hua@hisilicon.com>
> ---
>  drivers/iommu/arm-smmu-v3.c | 63 ++++++++++++++++++++++++++++---------
>  1 file changed, 48 insertions(+), 15 deletions(-)

I would prefer that the coherent DMA allocator learned about NUMA, rather
than we bodge drivers to use the streaming API where it doesn't really
make sense.

I see that you've posted other patches to do that (thanks!), so I'll
disregard this series.

Cheers,

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
