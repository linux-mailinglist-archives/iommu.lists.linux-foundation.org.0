Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D89445307
	for <lists.iommu@lfdr.de>; Thu,  4 Nov 2021 13:31:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C7B94058C;
	Thu,  4 Nov 2021 12:31:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nyYltqK-kIAa; Thu,  4 Nov 2021 12:31:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 9BBCD4058D;
	Thu,  4 Nov 2021 12:31:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6BCE3C0023;
	Thu,  4 Nov 2021 12:31:12 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BF918C000E
 for <iommu@lists.linux-foundation.org>; Thu,  4 Nov 2021 12:31:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9B0AE403A9
 for <iommu@lists.linux-foundation.org>; Thu,  4 Nov 2021 12:31:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4i6V6zUzfl8R for <iommu@lists.linux-foundation.org>;
 Thu,  4 Nov 2021 12:31:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8845740015
 for <iommu@lists.linux-foundation.org>; Thu,  4 Nov 2021 12:31:05 +0000 (UTC)
X-UUID: c651f2c855144886b83e0c995d128bea-20211104
X-UUID: c651f2c855144886b83e0c995d128bea-20211104
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <walter-zh.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1029824007; Thu, 04 Nov 2021 20:31:01 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Thu, 4 Nov 2021 20:31:00 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs10n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 4 Nov 2021 20:31:00 +0800
Message-ID: <cc893162f0e2c81a1d64bf85794cc77ae76cadce.camel@mediatek.com>
Subject: Re: [PATCH v2] dma-direct: improve DMA_ATTR_NO_KERNEL_MAPPING
From: Walter Wu <walter-zh.wu@mediatek.com>
To: Ard Biesheuvel <ardb@kernel.org>, Christoph Hellwig <hch@lst.de>
Date: Thu, 4 Nov 2021 20:31:00 +0800
In-Reply-To: <CAMj1kXHjjmhCVzKFhAseMGOdnidmFT=+o+vwKLTCGFkpwHmcfQ@mail.gmail.com>
References: <20211104023221.16391-1-walter-zh.wu@mediatek.com>
 <20211104085336.GA24260@lst.de>
 <CAMj1kXHjjmhCVzKFhAseMGOdnidmFT=+o+vwKLTCGFkpwHmcfQ@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Cc: wsd_upstream <wsd_upstream@mediatek.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux IOMMU <iommu@lists.linux-foundation.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Andrew
 Morton <akpm@linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>,
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

On Thu, 2021-11-04 at 09:57 +0100, Ard Biesheuvel wrote:
> On Thu, 4 Nov 2021 at 09:53, Christoph Hellwig <hch@lst.de> wrote:
> > 
> > On Thu, Nov 04, 2021 at 10:32:21AM +0800, Walter Wu wrote:
> > > diff --git a/include/linux/set_memory.h
> > > b/include/linux/set_memory.h
> > > index f36be5166c19..6c7d1683339c 100644
> > > --- a/include/linux/set_memory.h
> > > +++ b/include/linux/set_memory.h
> > > @@ -7,11 +7,16 @@
> > > 
> > >  #ifdef CONFIG_ARCH_HAS_SET_MEMORY
> > >  #include <asm/set_memory.h>
> > > +
> > > +#ifndef CONFIG_RODATA_FULL_DEFAULT_ENABLED
> > 
> > This is an arm64-specific symbol, and one that only controls a
> > default.  I don't think it is suitable to key off stubs in common
> > code.
> > 
> > > +static inline int set_memory_valid(unsigned long addr, int
> > > numpages, int enable) { return 0; }
> > 
> > Pleae avoid overly long lines.
> > 
> > > +             if (IS_ENABLED(CONFIG_RODATA_FULL_DEFAULT_ENABLED))
> > > {
> > > +                     kaddr = (unsigned
> > > long)phys_to_virt(dma_to_phys(dev, *dma_handle));
> > 
> > This can just use page_address.
> > 
> > > +                     /* page remove kernel mapping for arm64 */
> > > +                     set_memory_valid(kaddr, size >> PAGE_SHIFT,
> > > 0);
> > > +             }
> > 
> > But more importantly:  set_memory_valid only exists on arm64, this
> > will break compile everywhere else.  And this API is complete crap.
> > Passing kernel virtual addresses as unsigned long just sucks, and
> > passing an integer argument for valid/non-valid also is a horrible
> > API.
> > 
> 
> ... and as I pointed out before, you can still pass rodata=off on
> arm64, and get the old behavior, in which case bad things will happen
> if you try to use an API that expects to operate on page mappings
> with
> a 1 GB block mapping.
> 

Thanks for your suggestion.


> And you still haven't explained what the actual problem is: is this
> about CPU speculation corrupting non-cache coherent inbound DMA?

No corrupiton, only cpu read it, we hope to fix the behavior.


Thanks.
Walter

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
