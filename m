Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A79A424F84
	for <lists.iommu@lfdr.de>; Tue, 21 May 2019 15:01:00 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5A9F1C4E;
	Tue, 21 May 2019 13:00:59 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E3478BDC
	for <iommu@lists.linux-foundation.org>;
	Tue, 21 May 2019 13:00:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 03A9227B
	for <iommu@lists.linux-foundation.org>;
	Tue, 21 May 2019 13:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6ifQmDBhWTZl8rhJvIbZz2ekjW5v/WEMQ+tswwvohW8=;
	b=ucuf5RfLFDo0GPsWp3LiAy55h
	olVecf1LGQap4YkilkPL4Yp0l5K7zvLtvhQy+sYKv+XlLQYIytrS9zcxWwWDSLv/9ZS3xPUFRSyLE
	QJI39Y/BZ8pYeZYDIR/Qse7d1zaNvdkyIKn+/2k8St/0VJXQzI2klNelHbUXOWFtx4sHdzD+maIql
	C0AWmBs8YGUmdoFM1y7E+FaR05lXxMgU+8mr5rWHOunjCVuwSXCgwL8R9d6fq7JKhREl7ZQ2DEMMH
	yWsEynJoPMCW8gFUSdGuB8XlOmweUUvddo9H+EZ28Ow9+MU5m/H2jNJLFmETDo/aB+gGpD9deH/9n
	KwQSAp/lA==;
Received: from shell.armlinux.org.uk
	([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:52564)
	by pandora.armlinux.org.uk with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
	(envelope-from <linux@armlinux.org.uk>)
	id 1hT4Nv-0001J6-7M; Tue, 21 May 2019 14:00:51 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.89)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1hT4Nr-0005qZ-Sq; Tue, 21 May 2019 14:00:47 +0100
Date: Tue, 21 May 2019 14:00:47 +0100
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 2/2] ARM: dma-mapping: allow larger DMA mask than supported
Message-ID: <20190521130047.3bvvttpaa3pfqkdq@shell.armlinux.org.uk>
References: <20190521124729.23559-1-hch@lst.de>
	<20190521124729.23559-3-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190521124729.23559-3-hch@lst.de>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On Tue, May 21, 2019 at 02:47:29PM +0200, Christoph Hellwig wrote:
> Since Linux 5.1 we allow drivers to just set the largest DMA mask they
> support instead of falling back to smaller ones.

This doesn't make sense.  "they" is confusing - why would a driver set
a DMA mask larger than the driver supports?  Or is "they" not
referring to the drivers (in which case, what is it referring to?)

> When fixing up all the dma ops instances to allow for this behavior
> the arm direct mapping code was missed.  Fix it up by removing the
> sanity check, as all the actual mapping code handles this case just
> fine.
> 
> Fixes: 9eb9e96e97b3 ("Documentation/DMA-API-HOWTO: update dma_mask sections")
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/arm/mm/dma-mapping.c | 20 +-------------------
>  1 file changed, 1 insertion(+), 19 deletions(-)
> 
> diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
> index 0a75058c11f3..bdf0d236aaee 100644
> --- a/arch/arm/mm/dma-mapping.c
> +++ b/arch/arm/mm/dma-mapping.c
> @@ -219,25 +219,7 @@ EXPORT_SYMBOL(arm_coherent_dma_ops);
>  
>  static int __dma_supported(struct device *dev, u64 mask, bool warn)
>  {
> -	unsigned long max_dma_pfn;
> -
> -	/*
> -	 * If the mask allows for more memory than we can address,
> -	 * and we actually have that much memory, then we must
> -	 * indicate that DMA to this device is not supported.
> -	 */
> -	if (sizeof(mask) != sizeof(dma_addr_t) &&
> -	    mask > (dma_addr_t)~0 &&
> -	    dma_to_pfn(dev, ~0) < max_pfn - 1) {
> -		if (warn) {
> -			dev_warn(dev, "Coherent DMA mask %#llx is larger than dma_addr_t allows\n",
> -				 mask);
> -			dev_warn(dev, "Driver did not use or check the return value from dma_set_coherent_mask()?\n");
> -		}
> -		return 0;
> -	}

The point of this check is to trap the case where we have, for example,
8GB of memory, but dma_addr_t is 32-bit.  We can allocate in the high
4GB, but we can't represent the address in a dma_addr_t.

> -
> -	max_dma_pfn = min(max_pfn, arm_dma_pfn_limit);
> +	unsigned long max_dma_pfn = min(max_pfn, arm_dma_pfn_limit);
>  
>  	/*
>  	 * Translate the device's DMA mask to a PFN limit.  This
> -- 
> 2.20.1
> 
> 

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
