Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1712A6B1B
	for <lists.iommu@lfdr.de>; Wed,  4 Nov 2020 17:54:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 997032000A;
	Wed,  4 Nov 2020 16:54:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZHvtDplMJnhL; Wed,  4 Nov 2020 16:54:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 95345203E2;
	Wed,  4 Nov 2020 16:54:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8FF28C0051;
	Wed,  4 Nov 2020 16:54:51 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AD92DC0051
 for <iommu@lists.linux-foundation.org>; Wed,  4 Nov 2020 16:54:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 99CB0203E2
 for <iommu@lists.linux-foundation.org>; Wed,  4 Nov 2020 16:54:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lsJCE4GDIrG8 for <iommu@lists.linux-foundation.org>;
 Wed,  4 Nov 2020 16:54:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id C72E82000A
 for <iommu@lists.linux-foundation.org>; Wed,  4 Nov 2020 16:54:49 +0000 (UTC)
Received: from localhost (230.sub-72-107-127.myvzw.com [72.107.127.230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EC7782072C;
 Wed,  4 Nov 2020 16:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604508889;
 bh=ArcQJwinIpORlAmkBGB/AAkFp/7wMyEXpZdR/3J4wBQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=A2dV6ftbFeL34zkMdFbtruZhBI1rmk5r4E50s63hTH493XEIMYiT1h5F49xpGnXOM
 aiaZlQv4h/qyRD7jYsfpFqZ6bSRgipAJEIknQ1F5HZGFEREF8+Cyj+VjJ1fj/3OHMd
 1/J1Z1wCrb4HIDVlpvH4cYELRmp+oQoKUPLF9nXo=
Date: Wed, 4 Nov 2020 10:54:47 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 4/5] PCI/p2p: cleanup up __pci_p2pdma_map_sg a bit
Message-ID: <20201104165447.GA358343@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201104095052.1222754-5-hch@lst.de>
Cc: linux-rdma@vger.kernel.org, linux-pci@vger.kernel.org,
 Jason Gunthorpe <jgg@ziepe.ca>, iommu@lists.linux-foundation.org,
 Bjorn Helgaas <bhelgaas@google.com>, Logan Gunthorpe <logang@deltatee.com>
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

s|PCI/p2p: cleanup up __pci_p2pdma_map_sg|PCI/P2PDMA: Cleanup up __pci_p2pdma_map_sg|
to match history.

On Wed, Nov 04, 2020 at 10:50:51AM +0100, Christoph Hellwig wrote:
> Remove the pointless paddr variable that was only used once.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> ---
>  drivers/pci/p2pdma.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/pci/p2pdma.c b/drivers/pci/p2pdma.c
> index b07018af53876c..afd792cc272832 100644
> --- a/drivers/pci/p2pdma.c
> +++ b/drivers/pci/p2pdma.c
> @@ -825,13 +825,10 @@ static int __pci_p2pdma_map_sg(struct pci_p2pdma_pagemap *p2p_pgmap,
>  		struct device *dev, struct scatterlist *sg, int nents)
>  {
>  	struct scatterlist *s;
> -	phys_addr_t paddr;
>  	int i;
>  
>  	for_each_sg(sg, s, nents, i) {
> -		paddr = sg_phys(s);
> -
> -		s->dma_address = paddr - p2p_pgmap->bus_offset;
> +		s->dma_address = sg_phys(s) - p2p_pgmap->bus_offset;
>  		sg_dma_len(s) = s->length;
>  	}
>  
> -- 
> 2.28.0
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
