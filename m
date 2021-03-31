Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 64095346D26
	for <lists.iommu@lfdr.de>; Tue, 23 Mar 2021 23:33:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E648C40592;
	Tue, 23 Mar 2021 22:33:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qjpeejtQe857; Tue, 23 Mar 2021 22:33:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id 687FC4059A;
	Tue, 23 Mar 2021 22:33:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3CE8BC0012;
	Tue, 23 Mar 2021 22:33:40 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D6D8AC000A
 for <iommu@lists.linux-foundation.org>; Tue, 23 Mar 2021 22:33:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B8FC5608BA
 for <iommu@lists.linux-foundation.org>; Tue, 23 Mar 2021 22:33:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XqQQ3gMB79RW for <iommu@lists.linux-foundation.org>;
 Tue, 23 Mar 2021 22:33:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from sibelius.xs4all.nl (sibelius.xs4all.nl [83.163.83.176])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5EDE3608B7
 for <iommu@lists.linux-foundation.org>; Tue, 23 Mar 2021 22:33:29 +0000 (UTC)
Received: from localhost (bloch.sibelius.xs4all.nl [local])
 by bloch.sibelius.xs4all.nl (OpenSMTPD) with ESMTPA id 2dca3855;
 Tue, 23 Mar 2021 23:33:25 +0100 (CET)
Date: Tue, 23 Mar 2021 23:33:25 +0100 (CET)
From: Mark Kettenis <mark.kettenis@xs4all.nl>
To: Rob Herring <robh@kernel.org>
In-Reply-To: <20210323205346.GA1283560@robh.at.kernel.org> (message from Rob
 Herring on Tue, 23 Mar 2021 14:53:46 -0600)
Subject: Re: [PATCH 0/3] Apple M1 DART IOMMU driver
References: <20210320151903.60759-1-sven@svenpeter.dev>
 <c1bcc0609e920bc6@bloch.sibelius.xs4all.nl>
 <20210323205346.GA1283560@robh.at.kernel.org>
Message-ID: <c1bccac6b36d4662@bloch.sibelius.xs4all.nl>
Cc: arnd@kernel.org, sven@svenpeter.dev, devicetree@vger.kernel.org,
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

> Date: Tue, 23 Mar 2021 14:53:46 -0600
> From: Rob Herring <robh@kernel.org>
> 
> On Sun, Mar 21, 2021 at 05:00:50PM +0100, Mark Kettenis wrote:
> > > Date: Sat, 20 Mar 2021 15:19:33 +0000
> > > From: Sven Peter <sven@svenpeter.dev>
> > > 
> > > Hi,
> > > 
> > > After Hector's initial work [1] to bring up Linux on Apple's M1 it's time to
> > > bring up more devices. Most peripherals connected to the SoC are behind a iommu
> > > which Apple calls "Device Address Resolution Table", or DART for short [2].
> > > Unfortunately, it only shares the name with PowerPC's DART.
> > > Configuring this iommu is mandatory if these peripherals require DMA access.
> > > 
> > > This patchset implements initial support for this iommu. The hardware itself
> > > uses a pagetable format that's very similar to the one already implement in
> > > io-pgtable.c. There are some minor modifications, namely some details of the
> > > PTE format and that there are always three pagetable levels, which I've
> > > implement as a new format variant.
> > > 
> > > I have mainly tested this with the USB controller in device mode which is
> > > compatible with Linux's dwc3 driver. Some custom PHY initialization (which is
> > > not yet ready or fully understood) is required though to bring up the ports,
> > > see e.g. my patches to our m1n1 bootloader [3,4]. If you want to test the same
> > > setup you will probably need that branch for now and add the nodes from
> > > the DT binding specification example to your device tree.
> > > 
> > > Even though each DART instances could support up to 16 devices usually only
> > > a single device is actually connected. Different devices generally just use
> > > an entirely separate DART instance with a seperate MMIO range, IRQ, etc.
> > > 
> > > I have just noticed today though that at least the USB DWC3 controller in host
> > > mode uses *two* darts at the same time. I'm not sure yet which parts seem to
> > > require which DART instance.
> > > 
> > > This means that we might need to support devices attached to two iommus
> > > simultaneously and just create the same iova mappings. Currently this only
> > > seems to be required for USB according to Apple's Device Tree.
> > > 
> > > I see two options for this and would like to get feedback before
> > > I implement either one:
> > > 
> > >     1) Change #iommu-cells = <1>; to #iommu-cells = <2>; and use the first cell
> > >        to identify the DART and the second one to identify the master.
> > >        The DART DT node would then also take two register ranges that would
> > >        correspond to the two DARTs. Both instances use the same IRQ and the
> > >        same clocks according to Apple's device tree and my experiments.
> > >        This would keep a single device node and the DART driver would then
> > >        simply map iovas in both DARTs if required.
> > > 
> > >     2) Keep #iommu-cells as-is but support
> > >             iommus = <&usb_dart1a 1>, <&usb_dart1b 0>;
> > >        instead.
> > >        This would then require two devices nodes for the two DART instances and
> > >        some housekeeping in the DART driver to support mapping iovas in both
> > >        DARTs.
> > >        I believe omap-iommu.c supports this setup but I will have to read
> > >        more code to understand the details there and figure out how to implement
> > >        this in a sane way.
> > > 
> > > I currently prefer the first option but I don't understand enough details of
> > > the iommu system to actually make an informed decision.
> 
> Please don't mix what does the h/w look like and what's easy to 
> implement in Linux's IOMMU subsytem. It's pretty clear (at least 
> from the description here) that option 2 reflects the h/w.

Apple does represent these as a single node in their device tree.  The
two instances share an interrupt and share power/clock gating.  So
they seem to be part of a single hardware block.

> > > I'm obviously also open to more options :-)
> > 
> > Hi Sven,
> > 
> > I don't think the first option is going to work for PCIe.  PCIe
> > devices will have to use "iommu-map" properties to map PCI devices to
> > the right iommu, and the currently implementation seems to assume that
> > #iommu-cells = <1>.  The devictree binding[1] doesn't explicitly state
> > that it relies on #iommu-cells = <1>, but it isn't clear how the
> > rid-base to iommu-base mapping mechanism would work when that isn't
> > the case.
> > 
> > Now the PCIe DARTs are simpler and seem to have only one "instance"
> > per DART.  So if we keep #iommu-cells = <1> for those, you'd still be
> > fine using the first approach.
> > 
> > As I mentioned before, not all DARTs support the full 32-bit aperture.
> > In particular the PCIe DARTs support a smaller address-space.  It is
> > not clear whether this is a restriction of the PCIe host controller or
> > the DART, but the Apple Device Tree has "vm-base" and "vm-size"
> > properties that encode the base address and size of the aperture.
> > These single-cell properties which is probably why for the USB DARTs
> > only "vm-base" is given; since "vm-base" is 0, a 32-bit number
> > wouldn't be able to encode the full aperture size.  We could make them
> > 64-bit numbers in the Linux device tree though and always be explicit
> > about the size.  Older Sun SPARC machines used a single "virtual-dma"
> > property to encode the aperture.  We could do someting similar.  You
> > would use this property to initialize domain->geometry.aperture_start
> > and domain->geometry.aperture_end in diff 3/3 of this series.
> 
> 'dma-ranges' is what should be used here.
> 
> Rob
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
