Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BE910A370
	for <lists.iommu@lfdr.de>; Tue, 26 Nov 2019 18:38:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3EFD2860D1;
	Tue, 26 Nov 2019 17:38:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QTKIljX0+xae; Tue, 26 Nov 2019 17:38:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id F36EA85CB4;
	Tue, 26 Nov 2019 17:38:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DF62FC0878;
	Tue, 26 Nov 2019 17:38:37 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D5C9BC0878
 for <iommu@lists.linux-foundation.org>; Tue, 26 Nov 2019 17:38:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id D21F585CD0
 for <iommu@lists.linux-foundation.org>; Tue, 26 Nov 2019 17:38:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aePtacJcXK1N for <iommu@lists.linux-foundation.org>;
 Tue, 26 Nov 2019 17:38:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 5A52185CB4
 for <iommu@lists.linux-foundation.org>; Tue, 26 Nov 2019 17:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aKZvvePDQW5RDqmZAeiG6BbNoPgHNagjIBh3FYogELM=; b=ciH8dOAK3EX7IC9OLRsLDW7v1
 TfobHdqmVQrxa/fj9p/gxjWD8V+zUBHxm8qA2+sBAERlhsplsQuqMIh4U56uCHSHWHtyYCG0nDVmO
 9pPGKrBYbsT23uPZdVjWH/uqgwTpNSLxO+40eKIEM/2N+0499F+t8geK4GAJBSuVijX2Hr99d9jHK
 KVlU32XRCcHidYdAnBpTLorxpBKjwD/sewe38tetWTmnus7wOv4JDxdW+4r4i6PFN9g+cpIKTm8yx
 iB/HSZzTFzfnUVREwjBNef1ex3N9aRBtr3pKmsISsnOz7EXh9+aRPRln4JAM45nQKiZEelB9WcDgH
 7+EPYFnAg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1iZenJ-00070t-1h; Tue, 26 Nov 2019 17:38:33 +0000
Date: Tue, 26 Nov 2019 09:38:33 -0800
From: Christoph Hellwig <hch@infradead.org>
To: James Sewart <jamessewart@arista.com>
Subject: Re: [PATCH v2] PCI: Add DMA alias quirk for PLX PEX NTB
Message-ID: <20191126173833.GA16069@infradead.org>
References: <20191120193228.GA103670@google.com>
 <6A902F0D-FE98-4760-ADBB-4D5987D866BE@arista.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6A902F0D-FE98-4760-ADBB-4D5987D866BE@arista.com>
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

> +int _pci_add_dma_alias_range(struct pci_dev *dev, u8 devfn_from, int len)

This should be mrked static.  Also single underscore prefixes are rather
unusual in Linux.  Either use two or use a more descriptive name.


> @@ -5875,18 +5887,21 @@ int pci_set_vga_state(struct pci_dev *dev, bool decode,
>   */
>  void pci_add_dma_alias(struct pci_dev *dev, u8 devfn)
>  {
> -	if (!dev->dma_alias_mask)
> -		dev->dma_alias_mask = bitmap_zalloc(U8_MAX, GFP_KERNEL);
> -	if (!dev->dma_alias_mask) {
> -		pci_warn(dev, "Unable to allocate DMA alias mask\n");
> +	if (_pci_add_dma_alias_range(dev, devfn, 1) != 0)
>  		return;
> -	}
> -
> -	set_bit(devfn, dev->dma_alias_mask);
>  	pci_info(dev, "Enabling fixed DMA alias to %02x.%d\n",
>  		 PCI_SLOT(devfn), PCI_FUNC(devfn));
>  }
>  
> +void pci_add_dma_alias_range(struct pci_dev *dev, u8 devfn_from, int len)
> +{
> +	int devfn_to = devfn_from + len - 1;
> +	if (_pci_add_dma_alias_range(dev, devfn_from, len) != 0)
> +		return;
> +	pci_info(dev, "Enabling fixed DMA alias for devfn range from %02x.%d to %02x.%d\n",
> +		 PCI_SLOT(devfn_from), PCI_FUNC(devfn_from), PCI_SLOT(devfn_to), PCI_FUNC(devfn_to));
> +}

This adds a non-string constant line over 80 chars that should be fixed
up.

But can't you just add the len argument (which really should be
nr_devfns or so) to pci_add_dma_alias and switch the 8 existing
callers over?
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
