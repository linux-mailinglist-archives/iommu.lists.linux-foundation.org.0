Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id B60053D537A
	for <lists.iommu@lfdr.de>; Mon, 26 Jul 2021 09:01:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F32E827C6;
	Mon, 26 Jul 2021 07:01:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oHJJkxJFL954; Mon, 26 Jul 2021 07:01:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 7CBA7828BA;
	Mon, 26 Jul 2021 07:01:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 56B54C000E;
	Mon, 26 Jul 2021 07:01:06 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 15BE7C000E
 for <iommu@lists.linux-foundation.org>; Mon, 26 Jul 2021 07:01:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 04B6E40449
 for <iommu@lists.linux-foundation.org>; Mon, 26 Jul 2021 07:01:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T3sG9R6kzxI7 for <iommu@lists.linux-foundation.org>;
 Mon, 26 Jul 2021 07:01:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3CE4340415
 for <iommu@lists.linux-foundation.org>; Mon, 26 Jul 2021 07:01:04 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id B117C68BEB; Mon, 26 Jul 2021 09:01:00 +0200 (CEST)
Date: Mon, 26 Jul 2021 09:01:00 +0200
From: Christoph Hellwig <hch@lst.de>
To: Atish Patra <atish.patra@wdc.com>
Subject: Re: [RFC 4/5] dma-direct: Allocate dma pages directly if global
 pool allocation fails
Message-ID: <20210726070100.GC9035@lst.de>
References: <20210723214031.3251801-1-atish.patra@wdc.com>
 <20210723214031.3251801-5-atish.patra@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210723214031.3251801-5-atish.patra@wdc.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Tobias Klauser <tklauser@distanz.ch>, Robin Murphy <robin.murphy@arm.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 iommu@lists.linux-foundation.org, Guo Ren <guoren@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org, Frank Rowand <frowand.list@gmail.com>,
 Christoph Hellwig <hch@lst.de>, Dmitry Vyukov <dvyukov@google.com>
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

On Fri, Jul 23, 2021 at 02:40:30PM -0700, Atish Patra wrote:
> DMA_GLOBAL_POOL config may be enabled for platforms where global pool is
> not supported because a generic defconfig is expected to boot on different
> platforms. Specifically, some RISC-V platforms may use global pool for
> non-coherent devices while some other platforms are completely coherent.
> However, it is expected that single kernel image must boot on all the
> platforms.
> 
> Continue the dma direct allocation if a allocation from global pool failed.
> This indicates that the platform is relying on some other method (direct
> remap) or just have coherent devices.
> 
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  kernel/dma/direct.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> index d1d0258ed6d0..984ea776f099 100644
> --- a/kernel/dma/direct.c
> +++ b/kernel/dma/direct.c
> @@ -161,8 +161,11 @@ void *dma_direct_alloc(struct device *dev, size_t size,
>  		return arch_dma_alloc(dev, size, dma_handle, gfp, attrs);
>  
>  	if (IS_ENABLED(CONFIG_DMA_GLOBAL_POOL) &&
> -	    !dev_is_dma_coherent(dev))
> -		return dma_alloc_from_global_coherent(dev, size, dma_handle);
> +	    !dev_is_dma_coherent(dev)) {
> +		ret = dma_alloc_from_global_coherent(dev, size, dma_handle);
> +		if (ret)
> +			return ret;

This will now silently return normal non-cache coherent memory when
the global pool allocation fails, and thus is completely broken.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
