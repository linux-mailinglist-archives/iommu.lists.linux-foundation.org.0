Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3BF441B1D
	for <lists.iommu@lfdr.de>; Mon,  1 Nov 2021 13:26:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1FA44025B;
	Mon,  1 Nov 2021 12:26:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y0-rIR1Hj_Hb; Mon,  1 Nov 2021 12:26:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id EA05840253;
	Mon,  1 Nov 2021 12:26:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C954DC0021;
	Mon,  1 Nov 2021 12:26:10 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0C4D1C000E
 for <iommu@lists.linux-foundation.org>; Mon,  1 Nov 2021 12:26:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E0F9280C93
 for <iommu@lists.linux-foundation.org>; Mon,  1 Nov 2021 12:26:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RqzeNEEzB67Y for <iommu@lists.linux-foundation.org>;
 Mon,  1 Nov 2021 12:26:08 +0000 (UTC)
X-Greylist: delayed 00:05:04 by SQLgrey-1.8.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1EBC680C90
 for <iommu@lists.linux-foundation.org>; Mon,  1 Nov 2021 12:26:07 +0000 (UTC)
X-UUID: 68fdf43b5950449085ad96e65f11c9be-20211101
X-UUID: 68fdf43b5950449085ad96e65f11c9be-20211101
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <walter-zh.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1286271789; Mon, 01 Nov 2021 20:20:59 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Mon, 1 Nov 2021 20:20:58 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs10n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Mon, 1 Nov 2021 20:20:58 +0800
Message-ID: <76840b40fcf26a65467931a73f236982ad39989c.camel@mediatek.com>
Subject: Re: [PATCH] dma-direct: fix DMA_ATTR_NO_KERNEL_MAPPING
From: Walter Wu <walter-zh.wu@mediatek.com>
To: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 1 Nov 2021 20:20:58 +0800
In-Reply-To: <CAMj1kXGqOzHM+J30TXR3-uZPkjHBCXB4CMkzZjHbbmptyU5W9w@mail.gmail.com>
References: <20211101031558.7184-1-walter-zh.wu@mediatek.com>
 <CAMj1kXGqOzHM+J30TXR3-uZPkjHBCXB4CMkzZjHbbmptyU5W9w@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Cc: wsd_upstream <wsd_upstream@mediatek.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux IOMMU <iommu@lists.linux-foundation.org>,
 linux-mediatek@lists.infradead.org, Matthias
 Brugger <matthias.bgg@gmail.com>, Andrew
 Morton <akpm@linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
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

Hi Ard,

On Mon, 2021-11-01 at 09:34 +0100, Ard Biesheuvel wrote:
> On Mon, 1 Nov 2021 at 04:17, Walter Wu <walter-zh.wu@mediatek.com>
> wrote:
> > 
> > DMA_ATTR_NO_KERNEL_MAPPING is to avoid creating a kernel mapping
> > for the allocated buffer, but current implementation is that
> > PTE of allocated buffer in kernel page table is valid. So we
> > should set invalid for PTE of allocate buffer so that there are
> > no kernel mapping for the allocated buffer.
> > 
> > In some cases, we don't hope the allocated buffer to be read
> > by cpu or speculative execution, so we use
> > DMA_ATTR_NO_KERNEL_MAPPING
> > to get no kernel mapping in order to achieve this goal.
> > 
> > Signed-off-by: Walter Wu <walter-zh.wu@mediatek.com>
> > Cc: Christoph Hellwig <hch@lst.de>
> > Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> > Cc: Robin Murphy <robin.murphy@arm.com>
> > Cc: Matthias Brugger <matthias.bgg@gmail.com>
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > ---
> >  kernel/dma/direct.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> > index 4c6c5e0635e3..aa10b4c5d762 100644
> > --- a/kernel/dma/direct.c
> > +++ b/kernel/dma/direct.c
> > @@ -13,6 +13,7 @@
> >  #include <linux/vmalloc.h>
> >  #include <linux/set_memory.h>
> >  #include <linux/slab.h>
> > +#include <asm/cacheflush.h>
> >  #include "direct.h"
> > 
> >  /*
> > @@ -169,6 +170,9 @@ void *dma_direct_alloc(struct device *dev,
> > size_t size,
> >                 if (!PageHighMem(page))
> >                         arch_dma_prep_coherent(page, size);
> >                 *dma_handle = phys_to_dma_direct(dev,
> > page_to_phys(page));
> > +               /* remove kernel mapping for pages */
> > +               set_memory_valid((unsigned
> > long)phys_to_virt(dma_to_phys(dev, *dma_handle)),
> > +                               size >> PAGE_SHIFT, 0);
> 
> This only works if the memory is mapped at page granularity in the
> linear region, and you cannot rely on that. Many architectures prefer
> block mappings for the linear region, and arm64 will only use page
> mappings if rodata=full is set (which is set by default but can be
> overridden on the kernel command line)
> 

We mainly want to solve arm64 arch. RODATA_FULL_DEFAULT_ENABLED should
be the arm64 config. If we use CONFIG_RODATA_FULL_DEFAULT_ENABLED to
check whether it call set_memory_valid(). It should avoid other
architectures. Do you think this method is work?

Thanks for your explaination and suggestion.

Walter

> 
> >                 /* return the page pointer as the opaque cookie */
> >                 return page;
> >         }
> > @@ -278,6 +282,10 @@ void dma_direct_free(struct device *dev,
> > size_t size,
> > 
> >         if ((attrs & DMA_ATTR_NO_KERNEL_MAPPING) &&
> >             !force_dma_unencrypted(dev) &&
> > !is_swiotlb_for_alloc(dev)) {
> > +               size = PAGE_ALIGN(size);
> > +               /* create kernel mapping for pages */
> > +               set_memory_valid((unsigned
> > long)phys_to_virt(dma_to_phys(dev, dma_addr)),
> > +                               size >> PAGE_SHIFT, 1);
> >                 /* cpu_addr is a struct page cookie, not a kernel
> > address */
> >                 dma_free_contiguous(dev, cpu_addr, size);
> >                 return;
> > --
> > 2.18.0
> > 
> > 
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > 
https://urldefense.com/v3/__http://lists.infradead.org/mailman/listinfo/linux-arm-kernel__;!!CTRNKA9wMg0ARbw!16dLCjnvtRkaRLeCO9AQ7Fund5XL0FicZmeVaU3-WkFymr-0lbITfzwrvoJpiHlqnqIu-g$
> >  

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
