Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 936703EE68E
	for <lists.iommu@lfdr.de>; Tue, 17 Aug 2021 08:29:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1681B83696;
	Tue, 17 Aug 2021 06:29:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hrSkAU3tSqUQ; Tue, 17 Aug 2021 06:29:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 44C63836A7;
	Tue, 17 Aug 2021 06:29:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 21FA2C0022;
	Tue, 17 Aug 2021 06:29:02 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 21790C000E
 for <iommu@lists.linux-foundation.org>; Tue, 17 Aug 2021 06:29:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EF7CA40156
 for <iommu@lists.linux-foundation.org>; Tue, 17 Aug 2021 06:28:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 80KGelK14vSq for <iommu@lists.linux-foundation.org>;
 Tue, 17 Aug 2021 06:28:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D2EBF40022
 for <iommu@lists.linux-foundation.org>; Tue, 17 Aug 2021 06:28:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3B4A061038
 for <iommu@lists.linux-foundation.org>; Tue, 17 Aug 2021 06:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629181735;
 bh=y0HUvMC1sQq6AFsYEi1z1jFYlX4llWlauvdgseAQwKA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=J1KVWpnFU1z0mvqeX2LN1w6g64cU1amSanSKTQjm3RQexMOGjK8xrAa4oM+84elK3
 wD5DClu7WoAMOZVwubL1IkCEvIC/6wFdnhliYeQxQ7Q2fzv0FJHcYc0y6ZyTg8Qdut
 Jjm22sRwOpBt0cIl1j7GKOBTNSYE4q4HJZk1W+wzwbPy2/bt3zbB3NnB7KTMdV9sGr
 8zrtZ82M+maNuYd+VQMwSb/tnbt44R+yZgyy+T0KjGL9KUK4lyKhFD+vLCeFJ/250G
 VNgPFyB0N9KG0j4MLl6HO93iW//JJqOF34ENH3HMkAoWMX+6EZvJLJ/LpiQ32bUmdN
 Q9FlNiUkXXTpA==
Received: by mail-lj1-f176.google.com with SMTP id x7so31205094ljn.10
 for <iommu@lists.linux-foundation.org>; Mon, 16 Aug 2021 23:28:55 -0700 (PDT)
X-Gm-Message-State: AOAM531lf85JhfHK1yEusqb4pKMFMP3dfO4mPbPNwQ8rG4tGvtIHhpYO
 0JSD0KQUF2uaHXQBZnbWEkc8qSOaGT3S2U5iMSA=
X-Google-Smtp-Source: ABdhPJwyPyxj47GyA0nsFM2W/NJJj+2fT6rvJAeElZihgyXsd/VEqIv7awRZVKSaYuNO+nnX2aL5/VPBehBQGurYRZc=
X-Received: by 2002:a05:651c:39c:: with SMTP id
 e28mr1728053ljp.498.1629181733447; 
 Mon, 16 Aug 2021 23:28:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210723214031.3251801-1-atish.patra@wdc.com>
 <20210723214031.3251801-2-atish.patra@wdc.com>
 <CAJF2gTT+zS=ySrmQUzVe7hf56E2K7XoGjzMyeaH5oFPUNwFqZA@mail.gmail.com>
 <CAOnJCU+Sebr-3zt-xy9F6hGb8qj30QsH_SQvEkrvWhw6sVmbcw@mail.gmail.com>
In-Reply-To: <CAOnJCU+Sebr-3zt-xy9F6hGb8qj30QsH_SQvEkrvWhw6sVmbcw@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 17 Aug 2021 14:28:42 +0800
X-Gmail-Original-Message-ID: <CAJF2gTR79Ob5ini3W=67i1A4RQnTr46TdNqmpTPLuq79PdAdcQ@mail.gmail.com>
Message-ID: <CAJF2gTR79Ob5ini3W=67i1A4RQnTr46TdNqmpTPLuq79PdAdcQ@mail.gmail.com>
Subject: Re: [RFC 1/5] RISC-V: Implement arch_sync_dma* functions
To: Atish Patra <atishp@atishpatra.org>
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 devicetree <devicetree@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Atish Patra <atish.patra@wdc.com>,
 iommu@lists.linux-foundation.org, Albert Ou <aou@eecs.berkeley.edu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Tobias Klauser <tklauser@distanz.ch>, Frank Rowand <frowand.list@gmail.com>,
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

On Tue, Aug 17, 2021 at 11:24 AM Atish Patra <atishp@atishpatra.org> wrote:
>
> On Mon, Aug 16, 2021 at 6:48 PM Guo Ren <guoren@kernel.org> wrote:
> >
> > On Sat, Jul 24, 2021 at 5:40 AM Atish Patra <atish.patra@wdc.com> wrote:
> > >
> > > To facilitate streaming DMA APIs, this patch introduces a set of generic
> > > cache operations related dma sync. Any platform can use the generic ops
> > > to provide platform specific cache management operations. Once the
> > > standard RISC-V CMO extension is available, it can be built on top of it.
> > >
> > > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > > ---
> > >  arch/riscv/include/asm/dma-noncoherent.h | 19 +++++++
> > >  arch/riscv/mm/Makefile                   |  1 +
> > >  arch/riscv/mm/dma-noncoherent.c          | 66 ++++++++++++++++++++++++
> > >  3 files changed, 86 insertions(+)
> > >  create mode 100644 arch/riscv/include/asm/dma-noncoherent.h
> > >  create mode 100644 arch/riscv/mm/dma-noncoherent.c
> > >
> > > diff --git a/arch/riscv/include/asm/dma-noncoherent.h b/arch/riscv/include/asm/dma-noncoherent.h
> > > new file mode 100644
> > > index 000000000000..5bdb03c9c427
> > > --- /dev/null
> > > +++ b/arch/riscv/include/asm/dma-noncoherent.h
> > > @@ -0,0 +1,19 @@
> > > +/* SPDX-License-Identifier: GPL-2.0-only */
> > > +/*
> > > + * Copyright (c) 2021 Western Digital Corporation or its affiliates.
> > > + */
> > > +
> > > +#ifndef __ASM_RISCV_DMA_NON_COHERENT_H
> > > +#define __ASM_RISCV_DMA_NON_COHERENT_H
> > > +
> > > +#ifdef CONFIG_RISCV_DMA_NONCOHERENT
> > > +struct riscv_dma_cache_sync {
> > > +       void (*cache_invalidate)(phys_addr_t paddr, size_t size);
> > > +       void (*cache_clean)(phys_addr_t paddr, size_t size);
> > > +       void (*cache_flush)(phys_addr_t paddr, size_t size);
> > > +};
> > I like the style like this than my previous patch which using
> > sbi_call. The c906 has custom instructions that could be called in
> > S-mode directly.
> >
>
> How are you going to include the custom instructions in the upstream kernel ?
In errata, call set_ops? I'm headache with that issue.

>
> > Hope the patch could be soon merged, after correct the
> > DMA_FROM/TO_DEVICE/BIDIRECTIONAL and alternatives ops_set.
> >
> > > +
> > > +void riscv_dma_cache_sync_set(struct riscv_dma_cache_sync *ops);
> > > +#endif
> > > +
> > > +#endif
> > > diff --git a/arch/riscv/mm/Makefile b/arch/riscv/mm/Makefile
> > > index 7ebaef10ea1b..959bef49098b 100644
> > > --- a/arch/riscv/mm/Makefile
> > > +++ b/arch/riscv/mm/Makefile
> > > @@ -27,3 +27,4 @@ KASAN_SANITIZE_init.o := n
> > >  endif
> > >
> > >  obj-$(CONFIG_DEBUG_VIRTUAL) += physaddr.o
> > > +obj-$(CONFIG_RISCV_DMA_NONCOHERENT) += dma-noncoherent.o
> > > diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoherent.c
> > > new file mode 100644
> > > index 000000000000..2f6e9627c4aa
> > > --- /dev/null
> > > +++ b/arch/riscv/mm/dma-noncoherent.c
> > > @@ -0,0 +1,66 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +/*
> > > + * RISC-V specific functions to support DMA for non-coherent devices
> > > + *
> > > + * Copyright (c) 2021 Western Digital Corporation or its affiliates.
> > > + */
> > > +
> > > +#include <linux/dma-direct.h>
> > > +#include <linux/dma-map-ops.h>
> > > +#include <linux/init.h>
> > > +#include <linux/io.h>
> > > +#include <linux/libfdt.h>
> > > +#include <linux/mm.h>
> > > +#include <linux/of.h>
> > > +#include <linux/of_fdt.h>
> > > +#include <asm/dma-noncoherent.h>
> > > +
> > > +static struct riscv_dma_cache_sync *dma_cache_sync;
> > > +unsigned long riscv_dma_uc_offset;
> > > +
> > > +static void __dma_sync(phys_addr_t paddr, size_t size, enum dma_data_direction dir)
> > > +{
> > > +       if ((dir == DMA_FROM_DEVICE) && (dma_cache_sync->cache_invalidate))
> > > +               dma_cache_sync->cache_invalidate(paddr, size);
> > > +       else if ((dir == DMA_TO_DEVICE) && (dma_cache_sync->cache_clean))
> > > +               dma_cache_sync->cache_clean(paddr, size);
> > > +       else if ((dir == DMA_BIDIRECTIONAL) && dma_cache_sync->cache_flush)
> > > +               dma_cache_sync->cache_flush(paddr, size);
> > > +}
> > > +
> > > +void arch_sync_dma_for_device(phys_addr_t paddr, size_t size, enum dma_data_direction dir)
> > > +{
> > > +       if (!dma_cache_sync)
> > > +               return;
> > > +
> > > +       __dma_sync(paddr, size, dir);
> > > +}
> > > +
> > > +void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size, enum dma_data_direction dir)
> > > +{
> > > +       if (!dma_cache_sync)
> > > +               return;
> > > +
> > > +       __dma_sync(paddr, size, dir);
> > > +}
> > > +
> > > +void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
> > > +               const struct iommu_ops *iommu, bool coherent)
> > > +{
> > > +       /* If a specific device is dma-coherent, set it here */
> > > +       dev->dma_coherent = coherent;
> > > +}
> > > +
> > > +void arch_dma_prep_coherent(struct page *page, size_t size)
> > > +{
> > > +       void *flush_addr = page_address(page);
> > > +
> > > +       memset(flush_addr, 0, size);
> > > +       if (dma_cache_sync && dma_cache_sync->cache_flush)
> > > +               dma_cache_sync->cache_flush(__pa(flush_addr), size);
> > > +}
> > > +
> > > +void riscv_dma_cache_sync_set(struct riscv_dma_cache_sync *ops)
> > > +{
> > > +       dma_cache_sync = ops;
> > > +}
> > > --
> > > 2.31.1
> > >
> > > _______________________________________________
> > > iommu mailing list
> > > iommu@lists.linux-foundation.org
> > > https://lists.linuxfoundation.org/mailman/listinfo/iommu
> >
> >
> >
> > --
> > Best Regards
> >  Guo Ren
> >
> > ML: https://lore.kernel.org/linux-csky/
> > _______________________________________________
> > iommu mailing list
> > iommu@lists.linux-foundation.org
> > https://lists.linuxfoundation.org/mailman/listinfo/iommu
>
>
>
> --
> Regards,
> Atish



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
