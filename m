Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB68223F4E
	for <lists.iommu@lfdr.de>; Fri, 17 Jul 2020 17:16:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6943387E75;
	Fri, 17 Jul 2020 15:16:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id au2L9++Opveu; Fri, 17 Jul 2020 15:16:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A0BC487E6E;
	Fri, 17 Jul 2020 15:16:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8818FC08A5;
	Fri, 17 Jul 2020 15:16:11 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2E682C0733
 for <iommu@lists.linux-foundation.org>; Fri, 17 Jul 2020 15:16:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 1C6CB87E6E
 for <iommu@lists.linux-foundation.org>; Fri, 17 Jul 2020 15:16:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AsKQ41NGcY6b for <iommu@lists.linux-foundation.org>;
 Fri, 17 Jul 2020 15:15:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from smtp-fw-6001.amazon.com (smtp-fw-6001.amazon.com [52.95.48.154])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 1705487E6A
 for <iommu@lists.linux-foundation.org>; Fri, 17 Jul 2020 15:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1594998949; x=1626534949;
 h=from:to:cc:date:message-id:references:in-reply-to:
 reply-to:content-id:mime-version:
 content-transfer-encoding:subject;
 bh=d6ifIOoBZoKAVXOFDOmcElrZEEz2fvlnMJmw9ZGQT3s=;
 b=h5cLuy+UfNdxpleB82gFyQspJii97t18V96aZlMVzQtZnYifQSEXPJ7t
 K8CGLSCCKLFXkhViq8ocmJKe2J57mSbRAc9B2niJnM91E70FbJMGyKReN
 X9Il+lsh4dKR5miUmz66zhp/hkml2XS1Bg6eGS4rGTGdNSLFs0iS+6AVH Q=;
IronPort-SDR: RJeUo0jrkty35FDnB1mfzmkSXczbHkqvpelljVueSm9rhoSJBM+2eSzyvreXE01+kFHN7KHXiD
 LPSmLqIXemRA==
X-IronPort-AV: E=Sophos;i="5.75,362,1589241600"; d="scan'208";a="43920815"
Subject: Re: [PATCH v2 0/3] iommu/amd: I/O VA address limits
Thread-Topic: [PATCH v2 0/3] iommu/amd: I/O VA address limits
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-27fb8269.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 17 Jul 2020 15:15:48 +0000
Received: from EX13MTAUWC001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1e-27fb8269.us-east-1.amazon.com (Postfix) with ESMTPS
 id A43DAA23EB; Fri, 17 Jul 2020 15:15:46 +0000 (UTC)
Received: from EX13D29UWC004.ant.amazon.com (10.43.162.25) by
 EX13MTAUWC001.ant.amazon.com (10.43.162.135) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 17 Jul 2020 15:15:45 +0000
Received: from EX13D02EUC001.ant.amazon.com (10.43.164.92) by
 EX13D29UWC004.ant.amazon.com (10.43.162.25) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 17 Jul 2020 15:15:44 +0000
Received: from EX13D02EUC001.ant.amazon.com ([10.43.164.92]) by
 EX13D02EUC001.ant.amazon.com ([10.43.164.92]) with mapi id 15.00.1497.006;
 Fri, 17 Jul 2020 15:15:43 +0000
To: "robin.murphy@arm.com" <robin.murphy@arm.com>, "sebott@amazon.de"
 <sebott@amazon.de>, "joro@8bytes.org" <joro@8bytes.org>
Thread-Index: AQHWXBuXav2u0i93F0iBWeto0xw41akLhkeAgAA8G4CAABTYgIAACtQA
Date: Fri, 17 Jul 2020 15:15:43 +0000
Message-ID: <715c45b76f49b732e5f20157945d2ae262654602.camel@amazon.de>
References: <20200630093039.GC28824@8bytes.org>
 <20200630224634.319-1-sebott@amazon.de> <20200710123059.GF27672@8bytes.org>
 <751e403f-7095-f761-465b-9e187b423b0b@amazon.de>
 <271d67b2-482e-7a16-8fd7-1f1a6a4bdff2@arm.com>
 <2a04dcca86bdccece6e0109c30fc0262e1bf8829.camel@amazon.de>
 <004a060f-823d-af4e-a34d-1ff029faa40f@arm.com>
In-Reply-To: <004a060f-823d-af4e-a34d-1ff029faa40f@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.44]
Content-ID: <7AD9120EE518864B9A6A488FCFA1E03B@amazon.com>
MIME-Version: 1.0
Cc: "Serebrin, Benjamin" <serebrin@amazon.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>
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
From: "Sironi, Filippo via iommu" <iommu@lists.linux-foundation.org>
Reply-To: "Sironi, Filippo" <sironi@amazon.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Fri, 2020-07-17 at 15:36 +0100, Robin Murphy wrote:
> On 2020-07-17 14:22, Sironi, Filippo wrote:
> > On Fri, 2020-07-17 at 10:47 +0100, Robin Murphy wrote:
> > > 
> > > On 2020-07-17 10:20, Sebastian Ott via iommu wrote:
> > > > Hello Joerg,
> > > > 
> > > > On 2020-07-10 14:31, Joerg Roedel wrote:
> > > > > On Wed, Jul 01, 2020 at 12:46:31AM +0200, Sebastian Ott wrote:
> > > > > > The IVRS ACPI table specifies maximum address sizes for I/O
> > > > > > virtual
> > > > > > addresses that can be handled by the IOMMUs in the system.
> > > > > > Parse
> > > > > > that
> > > > > > data from the IVRS header to provide aperture information
> > > > > > for
> > > > > > DMA
> > > > > > mappings and users of the iommu API.
> > > > > > 
> > > > > > Changes for V2:
> > > > > >    - use limits in iommu_setup_dma_ops()
> > > > > >    - rebased to current upstream
> > > > > > 
> > > > > > Sebastian Ott (3):
> > > > > >     iommu/amd: Parse supported address sizes from IVRS
> > > > > >     iommu/amd: Restrict aperture for domains to conform with
> > > > > > IVRS
> > > > > >     iommu/amd: Actually enforce geometry aperture
> > > > > 
> > > > > Thanks for the changes. May I ask what the reason for those
> > > > > changes are?
> > > > > AFAIK all AMD IOMMU implementations (in hardware) support full
> > > > > 64bit
> > > > > address spaces, and the IVRS table might actually be wrong,
> > > > > limiting the
> > > > > address space in the worst case to only 32 bit.
> > > > 
> > > > It's not the IOMMU, but we've encountered devices that are
> > > > capable
> > > > of
> > > > more than
> > > > 32- but less than 64- bit IOVA, and there's no way to express
> > > > that
> > > > to
> > > > the IOVA
> > > > allocator in the PCIe spec. Our solution was to have our
> > > > platforms
> > > > express an
> > > > IVRS entry that says the IOMMU is capable of 48-bit, which these
> > > > devices
> > > > can generate.
> > > > 48 bits is plenty of address space in this generation for the
> > > > application we have.
> > > 
> > > Hmm, for constraints of individual devices, it should really be
> > > their
> > > drivers' job to call dma_set_mask*() with the appropriate value in
> > > the
> > > first place rather than just assuming that 64 means anything >32.
> > > If
> > > it's a case where the device itself technically is 64-bit capable,
> > > but
> > > an upstream bridge is constraining it, then that limit can also be
> > > described either by dedicated firmware properties (e.g. ACPI _DMA)
> > > or
> > > with a quirk like via_no_dac().
> > > 
> > > Robin.
> > 
> > You cannot rely on the device driver only because the device driver
> > attach might be a generic one like vfio-pci, for instance, that
> > doesn't
> > have any device specific knowledge.
> 
> Indeed, but on the other hand a generic driver that doesn't know the
> device is highly unlikely to set up any DMA transactions by itself
> either. In the case of VFIO, it would then be the guest/userspace
> driver's responsibility to take the equivalent action to avoid
> allocating addresses the hardware can't actually use.

I don't believe that we want to trust a userspace driver here, this may
result in hosts becoming unstable because devices are asked to do things
they aren't meant to do (e.g., DMA beyond 48 bits).

> I'm mostly just wary that trying to fake up a per-device restriction
> as
> a global one is a bit crude, and has the inherent problem that
> whatever
> you think the lowest common denominator is, there's the potential for
> some device to be hotplugged in later and break the assumption you've
> already had to commit to.

I agree, if the BIOS sets up an IVRS table with aperture of 48 bits and
all of a sudden we hotplug a device that only support 36 bits we're in a
bad place.

> And of course I am taking a bit of a DMA-API-centric viewpoint here -
> I
> think exposing per-device properties like bus_dma_limit that aren't
> easily identifiable for VFIO users to take into account is still
> rather
> an open problem.
> 
> Robin.

The use of ACPI _DMA that you suggest looks interesting and would allow
the kernel to prevent a dumb userspace driver using VFIO to make damage,
I think.

It doesn't look like there's much support for ACPI _DMA though. Are you
aware of existing efforts on this front?

Filippo





Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
