Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 0628F29BD3E
	for <lists.iommu@lfdr.de>; Tue, 27 Oct 2020 17:49:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 953CC860A3;
	Tue, 27 Oct 2020 16:49:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KgaZHhI-xJ3s; Tue, 27 Oct 2020 16:49:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 93BAF85FC4;
	Tue, 27 Oct 2020 16:49:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8353AC1AD5;
	Tue, 27 Oct 2020 16:49:05 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7FBA4C0051
 for <iommu@lists.linux-foundation.org>; Tue, 27 Oct 2020 16:49:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 6D60885DA5
 for <iommu@lists.linux-foundation.org>; Tue, 27 Oct 2020 16:49:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qge9ixgFo4x2 for <iommu@lists.linux-foundation.org>;
 Tue, 27 Oct 2020 16:49:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 09BD385D8E
 for <iommu@lists.linux-foundation.org>; Tue, 27 Oct 2020 16:49:02 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 5CA9967373; Tue, 27 Oct 2020 17:48:58 +0100 (CET)
Date: Tue, 27 Oct 2020 17:48:58 +0100
From: Christoph Hellwig <hch@lst.de>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH kernel v2 1/2] dma: Allow mixing bypass and normal
 IOMMU operation
Message-ID: <20201027164858.GA30651@lst.de>
References: <20201027101841.96056-1-aik@ozlabs.ru>
 <20201027101841.96056-2-aik@ozlabs.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201027101841.96056-2-aik@ozlabs.ru>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Michael Ellerman <mpe@ellerman.id.au>, iommu@lists.linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>,
 linux-kernel@vger.kernel.org
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

> +static inline bool dma_handle_direct(struct device *dev, dma_addr_t dma_handle)
> +{
> +       return dma_handle >= dev->archdata.dma_offset;
> +}

This won't compile except for powerpc, and directly accesing arch members
in common code is a bad idea.  Maybe both your helpers need to be
supplied by arch code to better abstract this out.

>  	if (dma_map_direct(dev, ops))
>  		addr = dma_direct_map_page(dev, page, offset, size, dir, attrs);
> +#ifdef CONFIG_DMA_OPS_BYPASS_BUS_LIMIT
> +	else if (dev->bus_dma_limit &&
> +		 can_map_direct(dev, (phys_addr_t) page_to_phys(page) + offset + size))
> +		addr = dma_direct_map_page(dev, page, offset, size, dir, attrs);
> +#endif

I don't think page_to_phys needs a phys_addr_t on the return value.
I'd also much prefer if we make this a little more beautiful, here
are a few suggestions:

 - hide the bus_dma_limit check inside can_map_direct, and provide a
   stub so that we can avoid the ifdef
 - use a better name for can_map_direct, and maybe also a better calling
   convention by passing the page (the sg code also has the page), and
   maybe even hide the dma_map_direct inside it.

	if (dma_map_direct(dev, ops) ||
	    arch_dma_map_page_direct(dev, page, offset, size))
		addr = dma_direct_map_page(dev, page, offset, size, dir, attrs);

>  	BUG_ON(!valid_dma_direction(dir));
>  	if (dma_map_direct(dev, ops))
>  		dma_direct_unmap_page(dev, addr, size, dir, attrs);
> +#ifdef CONFIG_DMA_OPS_BYPASS_BUS_LIMIT
> +	else if (dev->bus_dma_limit && dma_handle_direct(dev, addr + size))
> +		dma_direct_unmap_page(dev, addr, size, dir, attrs);
> +#endif

Same here.

>  	if (dma_map_direct(dev, ops))
>  		ents = dma_direct_map_sg(dev, sg, nents, dir, attrs);
> +#ifdef CONFIG_DMA_OPS_BYPASS_BUS_LIMIT
> +	else if (dev->bus_dma_limit) {
> +		struct scatterlist *s;
> +		bool direct = true;
> +		int i;
> +
> +		for_each_sg(sg, s, nents, i) {
> +			direct = can_map_direct(dev, sg_phys(s) + s->offset + s->length);
> +			if (!direct)
> +				break;
> +		}
> +		if (direct)
> +			ents = dma_direct_map_sg(dev, sg, nents, dir, attrs);
> +		else
> +			ents = ops->map_sg(dev, sg, nents, dir, attrs);
> +	}
> +#endif

This needs to go into a helper as well.  I think the same style as
above would work pretty nicely as well:

 	if (dma_map_direct(dev, ops) ||
	    arch_dma_map_sg_direct(dev, sg, nents))
 		ents = dma_direct_map_sg(dev, sg, nents, dir, attrs);
 	else
 		ents = ops->map_sg(dev, sg, nents, dir, attrs);

> +#ifdef CONFIG_DMA_OPS_BYPASS_BUS_LIMIT
> +	if (dev->bus_dma_limit) {
> +		struct scatterlist *s;
> +		bool direct = true;
> +		int i;
> +
> +		for_each_sg(sg, s, nents, i) {
> +			direct = dma_handle_direct(dev, s->dma_address + s->length);
> +			if (!direct)
> +				break;
> +		}
> +		if (direct) {
> +			dma_direct_unmap_sg(dev, sg, nents, dir, attrs);
> +			return;
> +		}
> +	}
> +#endif

One more time here..
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
