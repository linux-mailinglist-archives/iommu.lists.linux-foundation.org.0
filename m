Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1E43D718D
	for <lists.iommu@lfdr.de>; Tue, 27 Jul 2021 10:52:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DA22404DF;
	Tue, 27 Jul 2021 08:52:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H36MAqPNiOL6; Tue, 27 Jul 2021 08:52:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 0F00F404CA;
	Tue, 27 Jul 2021 08:52:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DE846C001F;
	Tue, 27 Jul 2021 08:52:53 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B63E6C000E
 for <iommu@lists.linux-foundation.org>; Tue, 27 Jul 2021 08:52:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 986C660798
 for <iommu@lists.linux-foundation.org>; Tue, 27 Jul 2021 08:52:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3UZfE4vEYPiM for <iommu@lists.linux-foundation.org>;
 Tue, 27 Jul 2021 08:52:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9E8AD60633
 for <iommu@lists.linux-foundation.org>; Tue, 27 Jul 2021 08:52:50 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 9A8A16736F; Tue, 27 Jul 2021 10:52:44 +0200 (CEST)
Date: Tue, 27 Jul 2021 10:52:44 +0200
From: Christoph Hellwig <hch@lst.de>
To: Atish Patra <atishp@atishpatra.org>
Subject: Re: [RFC 3/5] dma-mapping: Enable global non-coherent pool support
 for RISC-V
Message-ID: <20210727085244.GA20609@lst.de>
References: <20210723214031.3251801-1-atish.patra@wdc.com>
 <20210723214031.3251801-4-atish.patra@wdc.com> <20210726070030.GB9035@lst.de>
 <CAOnJCU+qRznBTn9Mt6t_DE6UUz6_LuaBBuOmnURS2Yh3pmpjvg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOnJCU+qRznBTn9Mt6t_DE6UUz6_LuaBBuOmnURS2Yh3pmpjvg@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: devicetree <devicetree@vger.kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@linux.alibaba.com>, Frank Rowand <frowand.list@gmail.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Atish Patra <atish.patra@wdc.com>, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Tobias Klauser <tklauser@distanz.ch>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 Dmitry Vyukov <dvyukov@google.com>
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

On Mon, Jul 26, 2021 at 03:47:54PM -0700, Atish Patra wrote:
> arch_dma_set_uncached works as well in this case. However, mips,
> niops2 & xtensa uses a
> fixed (via config) value for the offset. Similar approach can't be
> used here because the platform specific
> offset value has to be determined at runtime so that a single kernel
> image can boot on all platforms.

Nothing in the interface requires a fixed offset.  And using the offset
has one enormous advantage in that there is no need to declare a
statically sized pool - allocations are fully dynamic.  And any kind of
fixed pool tends to cause huge problems.

> 1. a new DT property so that arch specific code is aware of the
> non-cacheable window offset.

Yes.

> individual device if a per-device non-cacheable
>    window support is required in future. As of now, the beagleV memory

If you require a per-device noncachable area you can use the per-device
coherent pools.  But why would you want that?

> region lies in 0x10_0000_00000 - x17_FFFF_FFFF
>    which is mapped to start of DRAM 0x80000000. All of the
> non-coherent devices can do 32bit DMA only.

Adjust ZONE_DMA32 so that it takes the uncached offset into account.

> > > -     mem = dma_init_coherent_memory(phys_addr, phys_addr, size, true);
> > > +     if (phys_addr == device_addr)
> > > +             mem = dma_init_coherent_memory(phys_addr, device_addr, size, true);
> > > +     else
> > > +             mem = dma_init_coherent_memory(phys_addr, device_addr, size, false);
> >
> > Nak.  The phys_addr != device_addr support is goign away.  This needs
> 
> ok.
> 
> > to be filled in using dma-ranges property hanging of the struct device.
> 
> struct device is only accessible in rmem_dma_device_init. I couldn't
> find a proper way to access it during
> dma_reserved_default_memory setup under global pool.
> 
> Does that mean we should use a per-device memory pool instead of a
> global non-coherent pool ?

Indeed, that would be a problem in this case.  But if we can just
use the uncached offset directly I think everything will be much
simpler.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
