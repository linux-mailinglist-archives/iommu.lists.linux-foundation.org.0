Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A76634B123
	for <lists.iommu@lfdr.de>; Fri, 26 Mar 2021 22:16:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B58E4185C;
	Fri, 26 Mar 2021 21:16:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f80atS8pGR7v; Fri, 26 Mar 2021 21:16:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65C0141881;
	Fri, 26 Mar 2021 21:16:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 18559C000F;
	Fri, 26 Mar 2021 21:16:25 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 056DFC000A
 for <iommu@lists.linux-foundation.org>; Fri, 26 Mar 2021 21:16:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D6C454060F
 for <iommu@lists.linux-foundation.org>; Fri, 26 Mar 2021 21:16:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dREVivZRyTpW for <iommu@lists.linux-foundation.org>;
 Fri, 26 Mar 2021 21:16:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from sibelius.xs4all.nl (sibelius.xs4all.nl [83.163.83.176])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BE2A640245
 for <iommu@lists.linux-foundation.org>; Fri, 26 Mar 2021 21:16:17 +0000 (UTC)
Received: from localhost (bloch.sibelius.xs4all.nl [local])
 by bloch.sibelius.xs4all.nl (OpenSMTPD) with ESMTPA id 71729a6f;
 Fri, 26 Mar 2021 22:16:14 +0100 (CET)
Date: Fri, 26 Mar 2021 22:16:14 +0100 (CET)
From: Mark Kettenis <mark.kettenis@xs4all.nl>
To: Arnd Bergmann <arnd@kernel.org>
In-Reply-To: <CAK8P3a1+BOmT39k=OqFU+LtgfW=SDCp5W69YW58sVGf66mSppw@mail.gmail.com>
 (message from Arnd Bergmann on Fri, 26 Mar 2021 20:59:58 +0100)
Subject: Re: [PATCH 0/3] Apple M1 DART IOMMU driver
References: <20210320151903.60759-1-sven@svenpeter.dev>
 <c1bcc0609e920bc6@bloch.sibelius.xs4all.nl>
 <20210323205346.GA1283560@robh.at.kernel.org>
 <43685c67-6d9c-4e72-b320-0462c2273bf0@www.fastmail.com>
 <CAK8P3a0fvnYLrG=cGiOQ6u8aZnriTeM0R=MW7FX=94mO13Rq0w@mail.gmail.com>
 <c1bcd90d344c2b68@bloch.sibelius.xs4all.nl>
 <9f06872d-f0ec-43c3-9b53-d144337100b3@www.fastmail.com>
 <CAK8P3a2b7k6JkxecW=yu-NF+fkNCxJ3Ja36nQ7LK8hsuO=4=sw@mail.gmail.com>
 <c1bcd9821a8f8c05@bloch.sibelius.xs4all.nl>
 <e03833b1-1368-c5c3-424b-59e34bef19f3@arm.com>
 <45faaadd-eda7-464f-96ff-7324f566669e@www.fastmail.com>
 <CAK8P3a1+BOmT39k=OqFU+LtgfW=SDCp5W69YW58sVGf66mSppw@mail.gmail.com>
Message-ID: <c1bcda7f8ba573bd@bloch.sibelius.xs4all.nl>
Cc: robh@kernel.org, sven@svenpeter.dev, devicetree@vger.kernel.org,
 will@kernel.org, marcan@marcan.st, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, maz@kernel.org,
 mohamed.mediouni@caramail.com, robin.murphy@arm.com,
 linux-arm-kernel@lists.infradead.org, stan@corellium.com
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

> From: Arnd Bergmann <arnd@kernel.org>
> Date: Fri, 26 Mar 2021 20:59:58 +0100
> 
> On Fri, Mar 26, 2021 at 6:51 PM Sven Peter <sven@svenpeter.dev> wrote:
> > On Fri, Mar 26, 2021, at 18:34, Robin Murphy wrote:
> > > On 2021-03-26 17:26, Mark Kettenis wrote:
> > > >
> > > > Anyway, from my viewpoint having the information about the IOVA
> > > > address space sit on the devices makes little sense.  This information
> > > > is needed by the DART driver, and there is no direct cnnection from
> > > > the DART to the individual devices in the devicetree.  The "iommus"
> > > > property makes a connection in the opposite direction.
> > >
> > > What still seems unclear is whether these addressing limitations are a
> > > property of the DART input interface, the device output interface, or
> > > the interconnect between them. Although the observable end result
> > > appears more or less the same either way, they are conceptually
> > > different things which we have different abstractions to deal with.
> >
> > I'm not really sure if there is any way for us to figure out where these
> > limitation comes from though.
> 
> My first guess was that this is done to partition the available address
> address space in a way that allows one physical IOTLB to handle
> multiple devices that each have their own page table for a subset
> of the address space, as was done on old PowerPC IOMMUs.
> However, the ranges you list don't really support that model.
> 
> > I've done some more experiments and looked at all DART nodes in Apple's Device
> > Tree though. It seems that most (if not all) masters only connect 32 address
> > lines even though the iommu can handle a much larger address space. I'll therefore
> > remove the code to handle the full space for v2 since it's essentially dead
> > code that can't be tested anyway.
> >
> >
> > There are some exceptions though:
> >
> > There are the PCIe DARTs which have a different limitation which could be
> > encoded as 'dma-ranges' in the pci bus node:
> >
> >            name         base      size
> >          dart-apcie1: 00100000  3fe00000
> >          dart-apcie2: 00100000  3fe00000
> >          dart-apcie0: 00100000  3fe00000
> >         dart-apciec0: 00004000  7fffc000
> >         dart-apciec1: 80000000  7fffc000
> 
> This looks like they are reserving some address space in the beginning
> and/or the end, and for apciec0, the address space is partitioned into
> two equal-sized regions.
> 
> > Then there are also these display controller DARTs. If we wanted to use dma-ranges
> > we could just put them in a single sub bus:
> >
> >               name     base      size
> >           dart-disp0: 00000000 fc000000
> >             dart-dcp: 00000000 fc000000
> >        dart-dispext0: 00000000 fc000000
> >          dart-dcpext: 00000000 fc000000
> >
> >
> > And finally we have these strange ones which might eventually each require
> > another awkward sub-bus if we want to stick to the dma-ranges property.
> >
> >     name     base      size
> >   dart-aop: 00030000 ffffffff ("always-on processor")
> >   dart-pmp: 00000000 bff00000 (no idea yet)
> 
> Here I also see a "pio-vm-size" property:
> 
>     dart-pmp {
>       pio-vm-base = <0xc0000000>;
>       pio-vm-size = <0x40000000>;
>       vm-size = <0xbff00000>;
>       ...
>    };
> 
> Which seems to give 3GB of address space to the normal iotlb,
> plus the last 1GB to something else. The vm-base property is also
> missing rather than zero, but that could just be part of their syntax
> instead of a real difference.

Yes.  It seems like "vm-base" is omitted when it is 0, and "vm-size"
is omitted when the end of the window is at 0xffffffff.

> 
> Could it be that there are
> 
> >   dart-sio: 0021c000 fbde4000 (at least their Secure Enclave/TPM co-processor)
> 
> Same here:
>     dart-sio {
>        vm-base = <0x0>;
>        vm-size = <0xfc000000>;
>        pio-vm-base = <0xfd000000>;
>       pio-vm-size = <0x2000000>;
>       pio-granularity = <0x1000000>;
>    }
> 
> There are clearly two distinct ranges that split up the 4GB space again,
> with a small hole of 16MB (==pio-granularity) at the end of each range.
> 
> The "pio" name might indicate that this is a range of addresses that
> can be programmed to point at I/O registers in another device, rather
> than pointing to RAM.
> 
>            Arnd
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
