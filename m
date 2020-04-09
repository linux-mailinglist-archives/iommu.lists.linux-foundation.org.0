Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id B281D1A31FB
	for <lists.iommu@lfdr.de>; Thu,  9 Apr 2020 11:41:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 619B385B1D;
	Thu,  9 Apr 2020 09:41:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yl-YkXfXCqvE; Thu,  9 Apr 2020 09:41:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9E304857B2;
	Thu,  9 Apr 2020 09:41:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7F822C0177;
	Thu,  9 Apr 2020 09:41:36 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 38EB6C0177
 for <iommu@lists.linux-foundation.org>; Thu,  9 Apr 2020 09:41:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 22E26876C0
 for <iommu@lists.linux-foundation.org>; Thu,  9 Apr 2020 09:41:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0gWsMZd4d4gH for <iommu@lists.linux-foundation.org>;
 Thu,  9 Apr 2020 09:41:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by whitealder.osuosl.org (Postfix) with ESMTPS id F1C6787698
 for <iommu@lists.linux-foundation.org>; Thu,  9 Apr 2020 09:41:32 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id f52so9834444otf.8
 for <iommu@lists.linux-foundation.org>; Thu, 09 Apr 2020 02:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AAmPcakirZ+49aStGKItq0c+j+VEsXqfcBH/BMyGspk=;
 b=WXfJC2xvujS1NMEJmo8auNqU+zz3KoHNnFI/ZwIoQGqsenIlj1/rLp7i8g0wrHhNMA
 tB4UaPYqL8fo1FBLJD1QspR85zqLl/OHQQ2XW2wZhxbVmnvXaj4OEg2HGRtpK4xkfIA5
 QryyOXVdb1eBXsQfmBlDoe7W6QRuDag4YOw+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AAmPcakirZ+49aStGKItq0c+j+VEsXqfcBH/BMyGspk=;
 b=R/sAURo8aUjIgLArIr4sech1F0CzuQLcW7HLy5FnRgRqpvpm0vgduFp0gWThGYC8sJ
 DomGgWbRZ4HHOXO0myDvrclZuYDE25/F5O1XAGK/OBS3DOUQUZLjZxmesC2Xh6goPlAG
 jhjk22wMRLdfevfG25ktpz0b3JzFbvq+3005YLs7lCjDDpGPq3cT1S0qZVrTxOOx216N
 iWWEQdR2ESAjyjEhfKytSCMPcWKYGtb2lndFHAeqmIsRRpWV9OgtJgYABClvQFusLQK1
 QOTDg7tdBICRDZ5O1nw8JCanBJSB/WnZH6umFLSXCa0ecIB4lyTkTnmG/UJfEoBn/d98
 thJw==
X-Gm-Message-State: AGi0PuYvag/P/2kZwmTtY7bFHQqlfVjaMHgZLK9u50Tc2s9fn+ws/Yfr
 yPqv5JyoWtcrBe/vi+VKurMb9ZqW6wKnvtDmWzT1Eg==
X-Google-Smtp-Source: APiQypLHBVJAv55CZxyRjUHHZPFErxI7m2EAB+edMw28HekqHKAMU8pcbynFySqYUgFQY0OpR/l48dylQu4jTtXwGxw=
X-Received: by 2002:a4a:4190:: with SMTP id x138mr9186341ooa.35.1586425291875; 
 Thu, 09 Apr 2020 02:41:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200408115926.1467567-1-hch@lst.de>
 <20200408115926.1467567-20-hch@lst.de>
 <20200408122504.GO3456981@phenom.ffwll.local>
 <eb48f7b6327e482ea9911b129210c0417ab48345.camel@kernel.crashing.org>
In-Reply-To: <eb48f7b6327e482ea9911b129210c0417ab48345.camel@kernel.crashing.org>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 9 Apr 2020 11:41:20 +0200
Message-ID: <CAKMK7uHtkLvdsWFGiAtkzVa5mpnDvXkn3CHZQ6bgJ_enbyAc8A@mail.gmail.com>
Subject: Re: [PATCH 19/28] gpu/drm: remove the powerpc hack in
 drm_legacy_sg_alloc
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: linux-hyperv@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>, Linux MM <linux-mm@kvack.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:GENERIC INCLUDE/A..." <linux-arch@vger.kernel.org>,
 linux-s390@vger.kernel.org, Wei Liu <wei.liu@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, X86 ML <x86@kernel.org>,
 Christoph Hellwig <hch@lst.de>, Peter Zijlstra <peterz@infradead.org>,
 Laura Abbott <labbott@redhat.com>, Nitin Gupta <ngupta@vflare.org>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 bpf <bpf@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Robin Murphy <robin.murphy@arm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Minchan Kim <minchan@kernel.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
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

On Thu, Apr 9, 2020 at 10:54 AM Benjamin Herrenschmidt
<benh@kernel.crashing.org> wrote:
>
> On Wed, 2020-04-08 at 14:25 +0200, Daniel Vetter wrote:
> > On Wed, Apr 08, 2020 at 01:59:17PM +0200, Christoph Hellwig wrote:
> > > If this code was broken for non-coherent caches a crude powerpc hack
> > > isn't going to help anyone else.  Remove the hack as it is the last
> > > user of __vmalloc passing a page protection flag other than PAGE_KERNEL.
> >
> > Well Ben added this to make stuff work on ppc, ofc the home grown dma
> > layer in drm from back then isn't going to work in other places. I guess
> > should have at least an ack from him, in case anyone still cares about
> > this on ppc. Adding Ben to cc.
>
> This was due to some drivers (radeon ?) trying to use vmalloc pages for
> coherent DMA, which means on those 4xx powerpc's need to be non-cached.
>
> There were machines using that (440 based iirc), though I honestly
> can't tell if anybody still uses any of it.

agp subsystem still seems to happily do that (vmalloc memory for
device access), never having been ported to dma apis (or well
converted to iommu drivers, which they kinda are really). So I think
this all still works exactly as back then, even with the kms radeon
drivers. Question really is whether we have users left, and I have no
clue about that either.

Now if these boxes didn't ever have agp then I think we can get away
with deleting this, since we've already deleted the legacy radeon
driver. And that one used vmalloc for everything. The new kms one does
use the dma-api if the gpu isn't connected through agp.
-Daniel

> Cheers,
> Ben.
>
> > -Daniel
> >
> > >
> > > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > > ---
> > >  drivers/gpu/drm/drm_scatter.c | 11 +----------
> > >  1 file changed, 1 insertion(+), 10 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/drm_scatter.c b/drivers/gpu/drm/drm_scatter.c
> > > index ca520028b2cb..f4e6184d1877 100644
> > > --- a/drivers/gpu/drm/drm_scatter.c
> > > +++ b/drivers/gpu/drm/drm_scatter.c
> > > @@ -43,15 +43,6 @@
> > >
> > >  #define DEBUG_SCATTER 0
> > >
> > > -static inline void *drm_vmalloc_dma(unsigned long size)
> > > -{
> > > -#if defined(__powerpc__) && defined(CONFIG_NOT_COHERENT_CACHE)
> > > -   return __vmalloc(size, GFP_KERNEL, pgprot_noncached_wc(PAGE_KERNEL));
> > > -#else
> > > -   return vmalloc_32(size);
> > > -#endif
> > > -}
> > > -
> > >  static void drm_sg_cleanup(struct drm_sg_mem * entry)
> > >  {
> > >     struct page *page;
> > > @@ -126,7 +117,7 @@ int drm_legacy_sg_alloc(struct drm_device *dev, void *data,
> > >             return -ENOMEM;
> > >     }
> > >
> > > -   entry->virtual = drm_vmalloc_dma(pages << PAGE_SHIFT);
> > > +   entry->virtual = vmalloc_32(pages << PAGE_SHIFT);
> > >     if (!entry->virtual) {
> > >             kfree(entry->busaddr);
> > >             kfree(entry->pagelist);
> > > --
> > > 2.25.1
> > >
> >
> >
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
