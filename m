Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDCB569A21
	for <lists.iommu@lfdr.de>; Thu,  7 Jul 2022 07:58:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89FBF81422;
	Thu,  7 Jul 2022 05:58:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89FBF81422
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u0cd75ahx-u0; Thu,  7 Jul 2022 05:58:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 8DD8983E00;
	Thu,  7 Jul 2022 05:58:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DD8983E00
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 436A5C0077;
	Thu,  7 Jul 2022 05:58:48 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 78960C002D
 for <iommu@lists.linux-foundation.org>; Thu,  7 Jul 2022 05:58:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5BF1F81431
 for <iommu@lists.linux-foundation.org>; Thu,  7 Jul 2022 05:58:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BF1F81431
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s8ENjMyj5nhN for <iommu@lists.linux-foundation.org>;
 Thu,  7 Jul 2022 05:58:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9AFC781422
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9AFC781422
 for <iommu@lists.linux-foundation.org>; Thu,  7 Jul 2022 05:58:45 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 96BA568AA6; Thu,  7 Jul 2022 07:58:40 +0200 (CEST)
Date: Thu, 7 Jul 2022 07:58:40 +0200
From: Christoph Hellwig <hch@lst.de>
To: "Andrea Parri (Microsoft)" <parri.andrea@gmail.com>
Subject: Re: [RFC PATCH 2/2] dma-direct: Fix dma_direct_{alloc,free}() for
 Hyperv-V IVMs
Message-ID: <20220707055840.GA13401@lst.de>
References: <20220706195027.76026-1-parri.andrea@gmail.com>
 <20220706195027.76026-3-parri.andrea@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220706195027.76026-3-parri.andrea@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Wei Liu <wei.liu@kernel.org>, x86@kernel.org,
 Stephen Hemminger <sthemmin@microsoft.com>, linux-hyperv@vger.kernel.org,
 iommu@lists.linux.dev, Haiyang Zhang <haiyangz@microsoft.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Dexuan Cui <decui@microsoft.com>,
 linux-kernel@vger.kernel.org, Michael Kelley <mikelley@microsoft.com>,
 iommu@lists.linux-foundation.org, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Peter Anvin <hpa@zytor.com>,
 Thomas Gleixner <tglx@linutronix.de>, KY Srinivasan <kys@microsoft.com>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>
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

On Wed, Jul 06, 2022 at 09:50:27PM +0200, Andrea Parri (Microsoft) wrote:
> @@ -305,6 +306,21 @@ void *dma_direct_alloc(struct device *dev, size_t size,
>  		ret = page_address(page);
>  		if (dma_set_decrypted(dev, ret, size))
>  			goto out_free_pages;
> +#ifdef CONFIG_HAS_IOMEM
> +		/*
> +		 * Remap the pages in the unencrypted physical address space
> +		 * when dma_unencrypted_base is set (e.g., for Hyper-V AMD
> +		 * SEV-SNP isolated guests).
> +		 */
> +		if (dma_unencrypted_base) {
> +			phys_addr_t ret_pa = virt_to_phys(ret);
> +
> +			ret_pa += dma_unencrypted_base;
> +			ret = memremap(ret_pa, size, MEMREMAP_WB);
> +			if (!ret)
> +				goto out_encrypt_pages;
> +		}
> +#endif


So:

this needs to move into dma_set_decrypted, otherwise we don't handle
the dma_alloc_pages case (never mind that this is pretty unreadable).

Which then again largely duplicates the code in swiotlb.  So I think
what we need here is a low-level helper that does the
set_memory_decrypted and memremap.  I'm not quite sure where it
should go, but maybe some of the people involved with memory
encryption might have good ideas.  unencrypted_base should go with
it and then both swiotlb and dma-direct can call it.

> +	/*
> +	 * If dma_unencrypted_base is set, the virtual address returned by
> +	 * dma_direct_alloc() is in the vmalloc address range.
> +	 */
> +	if (!dma_unencrypted_base && is_vmalloc_addr(cpu_addr)) {
>  		vunmap(cpu_addr);
>  	} else {
>  		if (IS_ENABLED(CONFIG_ARCH_HAS_DMA_CLEAR_UNCACHED))
>  			arch_dma_clear_uncached(cpu_addr, size);
> +#ifdef CONFIG_HAS_IOMEM
> +		if (dma_unencrypted_base) {
> +			memunmap(cpu_addr);
> +			/* re-encrypt the pages using the original address */
> +			cpu_addr = page_address(pfn_to_page(PHYS_PFN(
> +					dma_to_phys(dev, dma_addr))));
> +		}
> +#endif
>  		if (dma_set_encrypted(dev, cpu_addr, size))

Same on the unmap side.  It might also be worth looking into reordering
the checks in some form instead o that raw dma_unencrypted_base check
before the unmap.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
