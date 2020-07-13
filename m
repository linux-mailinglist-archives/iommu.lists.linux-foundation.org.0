Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 782E721D68A
	for <lists.iommu@lfdr.de>; Mon, 13 Jul 2020 15:14:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id F221B227D1;
	Mon, 13 Jul 2020 13:14:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HUkhJMjLd1EY; Mon, 13 Jul 2020 13:14:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 975EA25521;
	Mon, 13 Jul 2020 13:14:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 71CC7C0733;
	Mon, 13 Jul 2020 13:14:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 73DEDC0733
 for <iommu@lists.linux-foundation.org>; Mon, 13 Jul 2020 13:14:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 6A35F888FB
 for <iommu@lists.linux-foundation.org>; Mon, 13 Jul 2020 13:14:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 95cTrVFR4vvy for <iommu@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 13:14:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id D870E888F0
 for <iommu@lists.linux-foundation.org>; Mon, 13 Jul 2020 13:14:30 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 9B18D36B; Mon, 13 Jul 2020 15:14:27 +0200 (CEST)
Date: Mon, 13 Jul 2020 15:14:26 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 2/2] iommu/dma: Avoid SAC address trick for PCIe devices
Message-ID: <20200713131426.GQ27672@8bytes.org>
References: <e583fc6dd1fb4ffc90310ff4372ee776f9cc7a3c.1594207679.git.robin.murphy@arm.com>
 <d412c292d222eb36469effd338e985f9d9e24cd6.1594207679.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d412c292d222eb36469effd338e985f9d9e24cd6.1594207679.git.robin.murphy@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, jonathan.lemon@gmail.com,
 dwmw2@infradead.org, hch@lst.de, linux-arm-kernel@lists.infradead.org
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

On Wed, Jul 08, 2020 at 12:32:42PM +0100, Robin Murphy wrote:
> As for the intel-iommu implementation, relegate the opportunistic
> attempt to allocate a SAC address to the domain of conventional PCI
> devices only, to avoid it increasingly causing far more performance
> issues than possible benefits on modern PCI Express systems.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  drivers/iommu/dma-iommu.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
> index 4959f5df21bd..0ff124f16ad4 100644
> --- a/drivers/iommu/dma-iommu.c
> +++ b/drivers/iommu/dma-iommu.c
> @@ -426,7 +426,8 @@ static dma_addr_t iommu_dma_alloc_iova(struct iommu_domain *domain,
>  		dma_limit = min(dma_limit, (u64)domain->geometry.aperture_end);
>  
>  	/* Try to get PCI devices a SAC address */
> -	if (dma_limit > DMA_BIT_MASK(32) && dev_is_pci(dev))
> +	if (dma_limit > DMA_BIT_MASK(32) &&
> +	    dev_is_pci(dev) && !pci_is_pcie(to_pci_dev(dev)))
>  		iova = alloc_iova_fast(iovad, iova_len,
>  				       DMA_BIT_MASK(32) >> shift, false);
>  

Unfortunatly this patch causes XHCI initialization failures on my AMD
Ryzen system. I will remove both from the IOMMU tree for now.

I guess the XHCI chip in my system does not support full 64bit dma
addresses and needs a quirk or something like that. But until this is
resolved its better to not change the IOVA allocation behavior.

Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
