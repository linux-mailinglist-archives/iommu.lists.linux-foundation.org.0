Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 768723D536B
	for <lists.iommu@lfdr.de>; Mon, 26 Jul 2021 08:57:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 804A2828BA;
	Mon, 26 Jul 2021 06:57:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e9LpF-PODGef; Mon, 26 Jul 2021 06:57:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id A8790828AF;
	Mon, 26 Jul 2021 06:57:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 84F8DC0022;
	Mon, 26 Jul 2021 06:57:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 82FF8C000E
 for <iommu@lists.linux-foundation.org>; Mon, 26 Jul 2021 06:57:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 698036060E
 for <iommu@lists.linux-foundation.org>; Mon, 26 Jul 2021 06:57:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rviGrxsAkYQE for <iommu@lists.linux-foundation.org>;
 Mon, 26 Jul 2021 06:57:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 81EA760093
 for <iommu@lists.linux-foundation.org>; Mon, 26 Jul 2021 06:57:05 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 408B168AFE; Mon, 26 Jul 2021 08:56:58 +0200 (CEST)
Date: Mon, 26 Jul 2021 08:56:57 +0200
From: Christoph Hellwig <hch@lst.de>
To: Atish Patra <atish.patra@wdc.com>
Subject: Re: [RFC 1/5] RISC-V: Implement arch_sync_dma* functions
Message-ID: <20210726065657.GA9035@lst.de>
References: <20210723214031.3251801-1-atish.patra@wdc.com>
 <20210723214031.3251801-2-atish.patra@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210723214031.3251801-2-atish.patra@wdc.com>
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

> +#ifdef CONFIG_RISCV_DMA_NONCOHERENT
> +struct riscv_dma_cache_sync {
> +	void (*cache_invalidate)(phys_addr_t paddr, size_t size);
> +	void (*cache_clean)(phys_addr_t paddr, size_t size);
> +	void (*cache_flush)(phys_addr_t paddr, size_t size);
> +};
> +
> +void riscv_dma_cache_sync_set(struct riscv_dma_cache_sync *ops);
> +#endif

As told a bunch of times before: doing indirect calls here is a
performance nightmare.  Use something that actually does perform
horribly like alternatives.  Or even delay implementing that until
we need it and do a plain direct call for now.

static void __dma_sync(phys_addr_t paddr, size_t size, enum dma_data_direction dir)
> +{
> +	if ((dir == DMA_FROM_DEVICE) && (dma_cache_sync->cache_invalidate))
> +		dma_cache_sync->cache_invalidate(paddr, size);
> +	else if ((dir == DMA_TO_DEVICE) && (dma_cache_sync->cache_clean))
> +		dma_cache_sync->cache_clean(paddr, size);
> +	else if ((dir == DMA_BIDIRECTIONAL) && dma_cache_sync->cache_flush)
> +		dma_cache_sync->cache_flush(paddr, size);
> +}

The seletion of flush types is completely broken.  Take a look at the
comment in arch/arc/mm/dma.c above arch_sync_dma_for_device for a good
explanation.

> +void arch_dma_prep_coherent(struct page *page, size_t size)
> +{
> +	void *flush_addr = page_address(page);
> +
> +	memset(flush_addr, 0, size);

arch_dma_prep_coherent is not supposed to modify the content of
the data.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
