Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id EE82510EDAF
	for <lists.iommu@lfdr.de>; Mon,  2 Dec 2019 18:03:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AA00584B75;
	Mon,  2 Dec 2019 17:03:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZpPIa2ec9rc7; Mon,  2 Dec 2019 17:03:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4443084545;
	Mon,  2 Dec 2019 17:03:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 37F18C087F;
	Mon,  2 Dec 2019 17:03:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 383CFC087F
 for <iommu@lists.linux-foundation.org>; Mon,  2 Dec 2019 17:03:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 21B32885DD
 for <iommu@lists.linux-foundation.org>; Mon,  2 Dec 2019 17:03:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vNLletEUDGlI for <iommu@lists.linux-foundation.org>;
 Mon,  2 Dec 2019 17:03:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by hemlock.osuosl.org (Postfix) with ESMTPS id AA43088446
 for <iommu@lists.linux-foundation.org>; Mon,  2 Dec 2019 17:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DG39bNYTihhqkx6ybV4uIHnTEGx9Vdvkch9DQ54cGQY=; b=L2hSdgyOflPbe61FnSBBXdtV6
 pjGCg+LHBqhOlGOT3n3f+pReDN3I7myisb5WFagyhBw8oOmMrKCJH2B5G4o/kSIGuEZ2yElTCqWAQ
 VkZ/++kM07DxUvSpD0LRysdgPU1AAeHMX5u3CQHoBd7J1qxetaZXGmJl92kv0zZ2nwbbYVfpzm+CP
 QB/3pgJFIWTwAZ8jhPyHwShovKBQNSuZVlm9w9j81WrBCxjAbZAQSwwFPuLQJTPTaREvksEWbgIti
 L0VK73P2W/tVxwgrfCuV+gyN9NIkn+B97PtMuEjaA+39WDGN/Suz/4m9kXbksN5pQt0jROIElMa7e
 Bgv8W9rJQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1ibp6G-00019k-3B; Mon, 02 Dec 2019 17:03:04 +0000
Date: Mon, 2 Dec 2019 09:03:04 -0800
From: Christoph Hellwig <hch@infradead.org>
To: James Sewart <jamessewart@arista.com>
Subject: Re: [PATCH v5 1/3] PCI: Fix off by one in dma_alias_mask allocation
 size
Message-ID: <20191202170304.GA4174@infradead.org>
References: <20191120193228.GA103670@google.com>
 <6A902F0D-FE98-4760-ADBB-4D5987D866BE@arista.com>
 <20191126173833.GA16069@infradead.org>
 <547214A9-9FD0-4DD5-80E1-1F5A467A0913@arista.com>
 <9c54c5dd-702c-a19b-38ba-55ab73b24729@deltatee.com>
 <435064D4-00F0-47F5-94D2-2C354F6B1206@arista.com>
 <058383d9-69fe-65e3-e410-eebd99840261@deltatee.com>
 <F26CC19F-66C2-466B-AE30-D65E10BA3022@arista.com>
 <d811576e-0f89-2303-a554-2701af5c5647@deltatee.com>
 <9DD82D05-6B9E-4AF5-9A3C-D459B75C0089@arista.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9DD82D05-6B9E-4AF5-9A3C-D459B75C0089@arista.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Dmitry Safonov <dima@arista.com>, linux-pci@vger.kernel.org,
 Dmitry Safonov <0x7f454c46@gmail.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Bjorn Helgaas <helgaas@kernel.org>,
 Logan Gunthorpe <logang@deltatee.com>
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

On Fri, Nov 29, 2019 at 05:56:19PM +0000, James Sewart wrote:
> The number of possible devfns is 256 so the size of the bitmap for
> allocations should be U8_MAX+1.
> 
> Signed-off-by: James Sewart <jamessewart@arista.com>
> ---
>  drivers/pci/pci.c    | 2 +-
>  drivers/pci/search.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index a97e2571a527..0a4449a30ace 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -5876,7 +5876,7 @@ int pci_set_vga_state(struct pci_dev *dev, bool decode,
>  void pci_add_dma_alias(struct pci_dev *dev, u8 devfn)
>  {
>  	if (!dev->dma_alias_mask)
> -		dev->dma_alias_mask = bitmap_zalloc(U8_MAX, GFP_KERNEL);
> +		dev->dma_alias_mask = bitmap_zalloc(U8_MAX+1, GFP_KERNEL);

Missing whitespaces around the "+".

> -		for_each_set_bit(devfn, pdev->dma_alias_mask, U8_MAX) {
> +		for_each_set_bit(devfn, pdev->dma_alias_mask, U8_MAX+1) {

Same here.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
