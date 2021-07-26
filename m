Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FD83D5379
	for <lists.iommu@lfdr.de>; Mon, 26 Jul 2021 09:00:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 44B724022A;
	Mon, 26 Jul 2021 07:00:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nfJ9MWsccFl0; Mon, 26 Jul 2021 07:00:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 43E39401C0;
	Mon, 26 Jul 2021 07:00:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1E9ACC000E;
	Mon, 26 Jul 2021 07:00:40 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7665BC000E
 for <iommu@lists.linux-foundation.org>; Mon, 26 Jul 2021 07:00:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5DCEA4040A
 for <iommu@lists.linux-foundation.org>; Mon, 26 Jul 2021 07:00:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PLhROb9nkc9y for <iommu@lists.linux-foundation.org>;
 Mon, 26 Jul 2021 07:00:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AC8C3403FC
 for <iommu@lists.linux-foundation.org>; Mon, 26 Jul 2021 07:00:37 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id DA9D068B05; Mon, 26 Jul 2021 09:00:30 +0200 (CEST)
Date: Mon, 26 Jul 2021 09:00:30 +0200
From: Christoph Hellwig <hch@lst.de>
To: Atish Patra <atish.patra@wdc.com>
Subject: Re: [RFC 3/5] dma-mapping: Enable global non-coherent pool support
 for RISC-V
Message-ID: <20210726070030.GB9035@lst.de>
References: <20210723214031.3251801-1-atish.patra@wdc.com>
 <20210723214031.3251801-4-atish.patra@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210723214031.3251801-4-atish.patra@wdc.com>
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

On Fri, Jul 23, 2021 at 02:40:29PM -0700, Atish Patra wrote:
> Currently, linux,dma-default is used to reserve a global non-coherent pool
> to allocate memory for dma operations. This can be useful for RISC-V as
> well as the ISA specification doesn't specify a method to modify PMA
> attributes or page table entries to define non-cacheable area yet.
> A non-cacheable memory window is an alternate options for vendors to
> support non-coherent devices.

Please explain why you do not want to use the simply non-cachable
window support using arch_dma_set_uncached as used by mips, niops2 and
xtensa.

> +static int __dma_init_global_coherent(phys_addr_t phys_addr, dma_addr_t device_addr, size_t size)




>  {
>  	struct dma_coherent_mem *mem;
>  
> -	mem = dma_init_coherent_memory(phys_addr, phys_addr, size, true);
> +	if (phys_addr == device_addr)
> +		mem = dma_init_coherent_memory(phys_addr, device_addr, size, true);
> +	else
> +		mem = dma_init_coherent_memory(phys_addr, device_addr, size, false);

Nak.  The phys_addr != device_addr support is goign away.  This needs
to be filled in using dma-ranges property hanging of the struct device.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
