Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE6010B4A1
	for <lists.iommu@lfdr.de>; Wed, 27 Nov 2019 18:38:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4AC8D87A60;
	Wed, 27 Nov 2019 17:38:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WAaK+kQgImue; Wed, 27 Nov 2019 17:38:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id A6D3587A52;
	Wed, 27 Nov 2019 17:38:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8EE67C0881;
	Wed, 27 Nov 2019 17:38:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A1ACAC0881
 for <iommu@lists.linux-foundation.org>; Wed, 27 Nov 2019 17:38:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 8F28E86797
 for <iommu@lists.linux-foundation.org>; Wed, 27 Nov 2019 17:38:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3pBMa5R7bZG9 for <iommu@lists.linux-foundation.org>;
 Wed, 27 Nov 2019 17:38:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from ale.deltatee.com (ale.deltatee.com [207.54.116.67])
 by whitealder.osuosl.org (Postfix) with ESMTPS id E9A4C8665D
 for <iommu@lists.linux-foundation.org>; Wed, 27 Nov 2019 17:38:47 +0000 (UTC)
Received: from s0106ac1f6bb1ecac.cg.shawcable.net ([70.73.163.230]
 helo=[192.168.11.155])
 by ale.deltatee.com with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <logang@deltatee.com>)
 id 1ia1H3-0003xR-Id; Wed, 27 Nov 2019 10:38:46 -0700
To: James Sewart <jamessewart@arista.com>, linux-pci@vger.kernel.org
References: <20191120193228.GA103670@google.com>
 <6A902F0D-FE98-4760-ADBB-4D5987D866BE@arista.com>
 <20191126173833.GA16069@infradead.org>
 <547214A9-9FD0-4DD5-80E1-1F5A467A0913@arista.com>
From: Logan Gunthorpe <logang@deltatee.com>
Message-ID: <9c54c5dd-702c-a19b-38ba-55ab73b24729@deltatee.com>
Date: Wed, 27 Nov 2019 10:38:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <547214A9-9FD0-4DD5-80E1-1F5A467A0913@arista.com>
Content-Language: en-US
X-SA-Exim-Connect-IP: 70.73.163.230
X-SA-Exim-Rcpt-To: helgaas@kernel.org, alex.williamson@redhat.com,
 dima@arista.com, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, 0x7f454c46@gmail.com, hch@infradead.org,
 linux-pci@vger.kernel.org, jamessewart@arista.com
X-SA-Exim-Mail-From: logang@deltatee.com
Subject: Re: [PATCH v3 1/2] PCI: Add parameter nr_devfns to pci_add_dma_alias
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
Cc: Dmitry Safonov <dima@arista.com>, Dmitry Safonov <0x7f454c46@gmail.com>,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 Alex Williamson <alex.williamson@redhat.com>,
 Bjorn Helgaas <helgaas@kernel.org>
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



On 2019-11-27 6:27 a.m., James Sewart wrote:
>   * This helper encodes an 8-bit devfn as a bit number in dma_alias_mask
>   * which is used to program permissible bus-devfn source addresses for DMA
> @@ -5873,8 +5874,12 @@ int pci_set_vga_state(struct pci_dev *dev, bool decode,
>   * cannot be left as a userspace activity).  DMA aliases should therefore
>   * be configured via quirks, such as the PCI fixup header quirk.
>   */
> -void pci_add_dma_alias(struct pci_dev *dev, u8 devfn)
> +void pci_add_dma_alias(struct pci_dev *dev, u8 devfn_from, int nr_devfns)
>  {
> +	int devfn_to = devfn_from + nr_devfns - 1;
> +
> +	BUG_ON(nr_devfns < 1);

Why not just make nr_devfns unsigned and do nothing if it's zero? It
might also be worth checking that nr_devfns + devfn_from is less than
U8_MAX... But I'd probably avoid the BUG_ON and just truncate it.

Logan
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
