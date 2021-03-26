Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D21C34AC1D
	for <lists.iommu@lfdr.de>; Fri, 26 Mar 2021 16:59:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C26CC40239;
	Fri, 26 Mar 2021 15:59:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zDw4Tfl_tG0n; Fri, 26 Mar 2021 15:59:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE6F6405DD;
	Fri, 26 Mar 2021 15:59:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C4DBFC000A;
	Fri, 26 Mar 2021 15:59:54 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8B9D9C000A
 for <iommu@lists.linux-foundation.org>; Fri, 26 Mar 2021 15:59:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D8FE84A89
 for <iommu@lists.linux-foundation.org>; Fri, 26 Mar 2021 15:59:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pjxH6nVtuW7R for <iommu@lists.linux-foundation.org>;
 Fri, 26 Mar 2021 15:59:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from sibelius.xs4all.nl (sibelius.xs4all.nl [83.163.83.176])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E1F3584A19
 for <iommu@lists.linux-foundation.org>; Fri, 26 Mar 2021 15:59:51 +0000 (UTC)
Received: from localhost (bloch.sibelius.xs4all.nl [local])
 by bloch.sibelius.xs4all.nl (OpenSMTPD) with ESMTPA id ff3d25fc;
 Fri, 26 Mar 2021 16:59:46 +0100 (CET)
Date: Fri, 26 Mar 2021 16:59:46 +0100 (CET)
From: Mark Kettenis <mark.kettenis@xs4all.nl>
To: Arnd Bergmann <arnd@kernel.org>
In-Reply-To: <CAK8P3a0fvnYLrG=cGiOQ6u8aZnriTeM0R=MW7FX=94mO13Rq0w@mail.gmail.com>
 (message from Arnd Bergmann on Thu, 25 Mar 2021 22:41:09 +0100)
Subject: Re: [PATCH 0/3] Apple M1 DART IOMMU driver
References: <20210320151903.60759-1-sven@svenpeter.dev>
 <c1bcc0609e920bc6@bloch.sibelius.xs4all.nl>
 <20210323205346.GA1283560@robh.at.kernel.org>
 <43685c67-6d9c-4e72-b320-0462c2273bf0@www.fastmail.com>
 <CAK8P3a0fvnYLrG=cGiOQ6u8aZnriTeM0R=MW7FX=94mO13Rq0w@mail.gmail.com>
Message-ID: <c1bcd90d344c2b68@bloch.sibelius.xs4all.nl>
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
> Date: Thu, 25 Mar 2021 22:41:09 +0100
> 
> On Thu, Mar 25, 2021 at 8:53 AM Sven Peter <sven@svenpeter.dev> wrote:
> > On Tue, Mar 23, 2021, at 21:53, Rob Herring wrote:
> >
> > I'm probably just confused or maybe the documentation is outdated but I don't
> > see how I could specify "this device can only use DMA addresses from
> > 0x00100000...0x3ff00000 but can map these via the iommu to any physical
> > address" using 'dma-ranges'.
> 
> It sounds like this is a holdover from the original powerpc iommu,
> which also had a limited set of virtual addresses in the iommu.
> 
> I would think it's sufficient to describe it in the iommu itself,
> since the limitation is more "addresses coming into the iommu must
> be this range" than "this device must use that address range for
> talking to the iommu".
> 
> If the addresses are allocated by the iommu driver, and each iommu
> only has one DMA master attached to it, having a simple range
> property in the iommu node should do the trick here. If there might
> be multiple devices on the same iommu but with different address
> ranges (which I don't think is the case), then it could be part of
> the reference to the iommu.

The ADT has properties on the iommu node that describe the adresses it
accepts for translation ("vm-base" and "vm-size").  So I think we can
safely assume that the same limits apply to all DMA masters that are
attached to it.  We don't know if the range limit is baked into the
silicon or whether it is related to how the firmware sets things up.
Having the properties on the iommu node makes it easy for m1n1 to
update the properties with the right values if necessary.

Some of the DARTs provide a bypass facility.  That code make using the
standard "dma-ranges" property tricky.  That property would need to
contain the bypass address range.  But that would mean that if the
DART driver needs to look at that property to figure out the address
range that supports translation it will need to be able to distinguish
between the translatable address range and the bypass address range.

Cheers,

Mark
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
