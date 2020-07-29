Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CE2231E7E
	for <lists.iommu@lfdr.de>; Wed, 29 Jul 2020 14:23:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D6F7D84867;
	Wed, 29 Jul 2020 12:23:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A7mz2hqd5n7B; Wed, 29 Jul 2020 12:23:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EEFD3847F8;
	Wed, 29 Jul 2020 12:23:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D860CC004D;
	Wed, 29 Jul 2020 12:23:32 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 99D41C004D
 for <iommu@lists.linux-foundation.org>; Wed, 29 Jul 2020 12:23:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 72F1D204C9
 for <iommu@lists.linux-foundation.org>; Wed, 29 Jul 2020 12:23:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JoDWp4gopeW7 for <iommu@lists.linux-foundation.org>;
 Wed, 29 Jul 2020 12:23:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 by silver.osuosl.org (Postfix) with ESMTPS id EBD222040A
 for <iommu@lists.linux-foundation.org>; Wed, 29 Jul 2020 12:23:28 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id q76so1537235wme.4
 for <iommu@lists.linux-foundation.org>; Wed, 29 Jul 2020 05:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fMmcp+vqawdRZvUQgLJSo3jqLQZVdDiqMld5qAC31Ho=;
 b=yyjsmqaU09qMkHycG7kCf2zgFz/jI2/bKMz/U2wueNtkOkLb72qo+JPD1tCSiFeUyJ
 f67IbGFyeX9WSK6dzilx37+jwnx4XhoOHiNMKkW+YRaQgcp1DK3kr0jHxUjpLYvOHqO4
 LCq25UOaUvOoPE3aU+IbecczawU5MmsAGvxsC5bsIraz8OXcYvGFTiA0V7KXem0nSZpY
 anf8gS2N+XDaBYFVenvCnYdKDtgZqurUTVgxz6VJt/wpybiufxyEFKT5/4zQ+mA2BjNY
 OdF5qa/Ei3IQ0xzVp3MgVR15YMTXlCAnuIR9ChqJwBz8uCBAjtgN064xZ207kSW//yb8
 ekDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fMmcp+vqawdRZvUQgLJSo3jqLQZVdDiqMld5qAC31Ho=;
 b=FZOA4OmL8p7FJ3kEwD5dftP+WfyQ5eljsMn+jfg1hBJRvwUhSttrRAo91GtIb4bl7H
 iQ6Ti9GDvRRdXmz+iYymbLoecA5B6exGDl4X4ArjjTqADNZY9Y5XCTXy0NIFL1JfOH7z
 nUhkZ/yOIFNcl/lLhO7ZbYRW0pWQatukFPoQw6PNkIXAzs1xRdntZ6lyJdMulaVfLkVS
 yMAfCy3gYyVxExM1e0ymxEAySFenKcf3JCije7+EoA11VpyO6Oqm2jdB/K1qF7wb/RmY
 E4i7647ITt52FEJpSqamwcQduIVRjQ9ew+BJCNQt1z6AKQhncgLlARnCfE544Rub/6rU
 ZM/w==
X-Gm-Message-State: AOAM5332f3k2nEgiirL0IzkB9h+OkYGeF/FGicbECwLso+GH/NAb6tVo
 4kSX0f34gv+e8NyoixDc4HcJn5kqikX8sRbr17+NfA==
X-Google-Smtp-Source: ABdhPJykww7xa0rbNk6D/7ca7xGpRrZnSlaMnskdVoyMr98LfuSGFCTtx8XeRPNaAn9hSDXzVKKF8nXcVwCxcdfPD5A=
X-Received: by 2002:a05:600c:2209:: with SMTP id
 z9mr8346410wml.70.1596025407047; 
 Wed, 29 Jul 2020 05:23:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200728104742.422960-1-hch@lst.de>
 <CAMi1Hd3=6ZZykF1yx_CChqx71k6T-wj12TzJiz_uJZbwrEtTXw@mail.gmail.com>
 <20200728120716.GA2507@lst.de>
 <CAMi1Hd1c3cNMYg+S5Pwuv30QCdcWJw+QxkWmNP34s3nb+_yUuA@mail.gmail.com>
 <20200728124114.GA4865@lst.de>
 <CAMi1Hd0wpcLVJ41h6gs4H0WEDVpNEs7N=wx+KQ_yRKeSv0kQ9g@mail.gmail.com>
 <20200728153055.GA16701@lst.de>
 <18a3b93cc5ba3e0e39ae1b14759ce31121d54045.camel@suse.de>
In-Reply-To: <18a3b93cc5ba3e0e39ae1b14759ce31121d54045.camel@suse.de>
From: Amit Pundir <amit.pundir@linaro.org>
Date: Wed, 29 Jul 2020 17:52:50 +0530
Message-ID: <CAMi1Hd3QNtZVEFUgDprT==wcVHKv6TsvpT3RurVJTDb1op2LnA@mail.gmail.com>
Subject: Re: dma-pool fixes
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Cc: jeremy.linton@arm.com, iommu@lists.linux-foundation.org,
 linux-rpi-kernel@lists.infradead.org, David Rientjes <rientjes@google.com>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>
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

On Wed, 29 Jul 2020 at 16:15, Nicolas Saenz Julienne
<nsaenzjulienne@suse.de> wrote:
>
> On Tue, 2020-07-28 at 17:30 +0200, Christoph Hellwig wrote:
> > On Tue, Jul 28, 2020 at 06:18:41PM +0530, Amit Pundir wrote:
> > > > Oh well, this leaves me confused again.  It looks like your setup
> > > > really needs a CMA in zone normal for the dma or dma32 pool.
> > >
> > > Anything I should look up in the downstream kernel/dts?
> >
> > I don't have a good idea right now.  Nicolas, can you think of something
> > else?
>
> To summarise, the device is:
>  - Using the dma-direct code path.
>  - Requesting ZONE_DMA memory to then fail when provided memory falls in
>    ZONE_DMA. Actually, the only acceptable memory comes from CMA, which is
>    located topmost of the 4GB boundary.
>
> My wild guess is that we may be abusing an iommu identity mapping setup by
> firmware.
>
> That said, what would be helpful to me is to find out the troublesome device.
> Amit, could you try adding this patch along with Christoph's modified series
> (so the board boots). Ultimately DMA atomic allocations are not that common, so
> we should get only a few hits:

Hi, still not hitting dma_alloc_from_pool().

I hit the following direct alloc path only once, at starting:

dma_alloc_coherent ()
-> dma_alloc_attrs()
   -> dma_is_direct() -> dma_direct_alloc()
      -> dma_direct_alloc_pages()
         -> dma_should_alloc_from_pool() #returns FALSE from here

After that I'm hitting following iommu dma alloc path all the time:

dma_alloc_coherent()
-> dma_alloc_attrs()
   -> (ops->alloc) -> iommu_dma_alloc()
      -> iommu_dma_alloc_remap() #always returns from here

So dma_alloc_from_pool() is not getting called at all in either of the
above cases.

>
> diff --git a/kernel/dma/pool.c b/kernel/dma/pool.c
> index 83fda1039493..de93fce6d5d2 100644
> --- a/kernel/dma/pool.c
> +++ b/kernel/dma/pool.c
> @@ -276,8 +276,11 @@ struct page *dma_alloc_from_pool(struct device *dev, size_t size,
>         while ((pool = dma_guess_pool(pool, gfp))) {
>                 page = __dma_alloc_from_pool(dev, size, pool, cpu_addr,
>                                              phys_addr_ok);
> -               if (page)
> +               if (page) {
> +                       dev_err(dev, "%s: phys addr 0x%llx, size %lu, dev->coherent_dma_mask 0x%llx, dev->bus_dma_limit 0x%llx\n",
> +                               __func__, (phys_addr_t)*cpu_addr, size, dev->coherent_dma_mask, dev->bus_dma_limit);
>                         return page;
> +               }
>         }
>
>         WARN(1, "Failed to get suitable pool for %s\n", dev_name(dev));
>
>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
