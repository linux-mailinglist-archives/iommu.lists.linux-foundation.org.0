Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id D743A1A73D0
	for <lists.iommu@lfdr.de>; Tue, 14 Apr 2020 08:43:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8636684812;
	Tue, 14 Apr 2020 06:43:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id USQLrfIZ6PXz; Tue, 14 Apr 2020 06:43:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2015885566;
	Tue, 14 Apr 2020 06:43:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 06B07C0172;
	Tue, 14 Apr 2020 06:43:39 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C8CC2C0172
 for <iommu@lists.linux-foundation.org>; Tue, 14 Apr 2020 06:43:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B12808306B
 for <iommu@lists.linux-foundation.org>; Tue, 14 Apr 2020 06:43:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ai2rGSdcQhfC for <iommu@lists.linux-foundation.org>;
 Tue, 14 Apr 2020 06:43:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 6423C826E0
 for <iommu@lists.linux-foundation.org>; Tue, 14 Apr 2020 06:43:36 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 1EBA468BEB; Tue, 14 Apr 2020 08:43:32 +0200 (CEST)
Date: Tue, 14 Apr 2020 08:43:32 +0200
From: Christoph Hellwig <hch@lst.de>
To: David Rientjes <rientjes@google.com>
Subject: Re: [rfc v2 4/6] dma-direct: atomic allocations must come from
 atomic coherent pools
Message-ID: <20200414064332.GB23359@lst.de>
References: <alpine.DEB.2.21.1912311738130.68206@chino.kir.corp.google.com>
 <b22416ec-cc28-3fd2-3a10-89840be173fa@amd.com>
 <alpine.DEB.2.21.2002280118461.165532@chino.kir.corp.google.com>
 <alpine.DEB.2.21.2003011535510.213582@chino.kir.corp.google.com>
 <alpine.DEB.2.21.2004081418490.19661@chino.kir.corp.google.com>
 <alpine.DEB.2.21.2004081420060.19661@chino.kir.corp.google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2004081420060.19661@chino.kir.corp.google.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Tom Lendacky <thomas.lendacky@amd.com>, "Singh,
 Brijesh" <brijesh.singh@amd.com>, "Grimm, Jon" <jon.grimm@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>
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

> +	/*
> +	 * Unencrypted memory must come directly from DMA atomic pools if
> +	 * blocking is not allowed.
> +	 */
> +	if (IS_ENABLED(CONFIG_DMA_COHERENT_POOL) &&
> +	    force_dma_unencrypted(dev) && !gfpflags_allow_blocking(gfp)) {
> +		ret = dma_alloc_from_pool(dev, PAGE_ALIGN(size), &page, gfp);
> +		if (!ret)
> +			return NULL;
> +		goto done;
> +	}
> +
>  	if (IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) &&
>  	    dma_alloc_need_uncached(dev, attrs) &&
>  	    !gfpflags_allow_blocking(gfp)) {

Can we keep a single conditional for the pool allocations?  Maybe
add a new dma_alloc_from_pool helper ala:

static inline bool dma_alloc_from_pool(struct device *dev, gfp_t gfp)
{
	if (!IS_ENABLED(CONFIG_DMA_COHERENT_POOL))
		return false;
	if (gfpflags_allow_blocking(gfp))
		return false;
	if (force_dma_unencrypted(dev))
		return true;
	if (dma_alloc_need_uncached(dev))
		return true;
}
}

> @@ -203,6 +215,10 @@ void dma_direct_free_pages(struct device *dev, size_t size, void *cpu_addr,
>  {
>  	unsigned int page_order = get_order(size);
>  
> +	if (IS_ENABLED(CONFIG_DMA_COHERENT_POOL) &&
> +	    dma_free_from_pool(dev, cpu_addr, PAGE_ALIGN(size)))
> +		return;
> +

Similarly I think we should have a single conditional to free from the
pool instead.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
