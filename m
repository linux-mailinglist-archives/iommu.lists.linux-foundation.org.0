Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EC33FCFCD
	for <lists.iommu@lfdr.de>; Wed,  1 Sep 2021 01:11:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFB2981AD7;
	Tue, 31 Aug 2021 23:11:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EWYQ27cx4f01; Tue, 31 Aug 2021 23:11:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id DFCE081A6A;
	Tue, 31 Aug 2021 23:11:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9BA18C000E;
	Tue, 31 Aug 2021 23:11:01 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DED85C000E
 for <iommu@lists.linux-foundation.org>; Tue, 31 Aug 2021 23:10:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C8BE94036E
 for <iommu@lists.linux-foundation.org>; Tue, 31 Aug 2021 23:10:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QosuxxIeO1Xf for <iommu@lists.linux-foundation.org>;
 Tue, 31 Aug 2021 23:10:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from rosenzweig.io (rosenzweig.io [138.197.143.207])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 385D84036C
 for <iommu@lists.linux-foundation.org>; Tue, 31 Aug 2021 23:10:57 +0000 (UTC)
Date: Tue, 31 Aug 2021 17:30:18 -0400
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Sven Peter <sven@svenpeter.dev>
Subject: Re: [PATCH v2 3/8] iommu/dma: Disable get_sgtable for granule >
 PAGE_SIZE
Message-ID: <YS6fasuqPURbmC6X@sunset>
References: <20210828153642.19396-1-sven@svenpeter.dev>
 <20210828153642.19396-4-sven@svenpeter.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210828153642.19396-4-sven@svenpeter.dev>
Cc: Arnd Bergmann <arnd@kernel.org>, Will Deacon <will@kernel.org>,
 Hector Martin <marcan@marcan.st>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Alexander Graf <graf@amazon.com>,
 Mohamed Mediouni <mohamed.mediouni@caramail.com>,
 Robin Murphy <robin.murphy@arm.com>
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

I use this function for cross-device sharing on the M1 display driver.
Arguably this is unsafe but it works on 16k kernels and if you want to
test the function on 4k, you know where my code is.

On Sat, Aug 28, 2021 at 05:36:37PM +0200, Sven Peter wrote:
> Pretend that iommu_dma_get_sgtable is not implemented when
> granule > PAGE_SIZE since I can neither test this function right now
> nor do I fully understand how it is used.
> 
> Signed-off-by: Sven Peter <sven@svenpeter.dev>
> ---
>  drivers/iommu/dma-iommu.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
> index d6e273ec3de6..64fbd9236820 100644
> --- a/drivers/iommu/dma-iommu.c
> +++ b/drivers/iommu/dma-iommu.c
> @@ -1315,9 +1315,15 @@ static int iommu_dma_get_sgtable(struct device *dev, struct sg_table *sgt,
>  		void *cpu_addr, dma_addr_t dma_addr, size_t size,
>  		unsigned long attrs)
>  {
> +	struct iommu_domain *domain = iommu_get_dma_domain(dev);
> +	struct iommu_dma_cookie *cookie = domain->iova_cookie;
> +	struct iova_domain *iovad = &cookie->iovad;
>  	struct page *page;
>  	int ret;
>  
> +	if (iovad->granule > PAGE_SIZE)
> +		return -ENXIO;
> +
>  	if (IS_ENABLED(CONFIG_DMA_REMAP) && is_vmalloc_addr(cpu_addr)) {
>  		struct page **pages = dma_common_find_pages(cpu_addr);
>  
> -- 
> 2.25.1
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
