Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D3F8680A
	for <lists.iommu@lfdr.de>; Thu,  8 Aug 2019 19:30:50 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1D3C8E4E;
	Thu,  8 Aug 2019 17:30:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E9AEBE43
	for <iommu@lists.linux-foundation.org>;
	Thu,  8 Aug 2019 17:30:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id DBED3829
	for <iommu@lists.linux-foundation.org>;
	Thu,  8 Aug 2019 17:30:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id E72A0AF4C;
	Thu,  8 Aug 2019 17:30:44 +0000 (UTC)
Message-ID: <6917ea286e76cb0f3f3bea23552a00d1b2a381de.camel@suse.de>
Subject: Re: [PATCH 3/8] of/fdt: add function to get the SoC wide DMA
	addressable memory size
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Rob Herring <robh+dt@kernel.org>
Date: Thu, 08 Aug 2019 19:30:42 +0200
In-Reply-To: <CAL_JsqJS6XBSc8DuK2sJApHtY4nCSFpLezf003YMD75THLHAqg@mail.gmail.com>
References: <20190731154752.16557-1-nsaenzjulienne@suse.de>
	<20190731154752.16557-4-nsaenzjulienne@suse.de>
	<CAL_JsqKF5nh3hcdLTG5+6RU3_TnFrNX08vD6qZ8wawoA3WSRpA@mail.gmail.com>
	<2050374ac07e0330e505c4a1637256428adb10c4.camel@suse.de>
	<CAL_Jsq+LjsRmFg-xaLgpVx3miXN3hid3aD+mgTW__j0SbEFYjQ@mail.gmail.com>
	<12eb3aba207c552e5eb727535e7c4f08673c4c80.camel@suse.de>
	<CAL_JsqJS6XBSc8DuK2sJApHtY4nCSFpLezf003YMD75THLHAqg@mail.gmail.com>
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: phill@raspberryi.org, devicetree@vger.kernel.org,
	Florian Fainelli <f.fainelli@gmail.com>,
	Frank Rowand <frowand.list@gmail.com>, linux-mm@kvack.org,
	Marc Zyngier <marc.zyngier@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Eric Anholt <eric@anholt.net>,
	Linux IOMMU <iommu@lists.linux-foundation.org>,
	Matthias Brugger <mbrugger@suse.com>, "moderated
	list:BROADCOM BCM2835 ARM ARCHITECTURE"
	<linux-rpi-kernel@lists.infradead.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM
	ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, wahrenst@gmx.net
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Content-Type: multipart/mixed; boundary="===============0811344231852774570=="
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org


--===============0811344231852774570==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-aUnd1sGElH9S49gE7iVL"


--=-aUnd1sGElH9S49gE7iVL
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2019-08-08 at 09:02 -0600, Rob Herring wrote:
> On Tue, Aug 6, 2019 at 12:12 PM Nicolas Saenz Julienne
> <nsaenzjulienne@suse.de> wrote:
> > Hi Rob,
> >=20
> > On Mon, 2019-08-05 at 13:23 -0600, Rob Herring wrote:
> > > On Mon, Aug 5, 2019 at 10:03 AM Nicolas Saenz Julienne
> > > <nsaenzjulienne@suse.de> wrote:
> > > > Hi Rob,
> > > > Thanks for the review!
> > > >=20
> > > > On Fri, 2019-08-02 at 11:17 -0600, Rob Herring wrote:
> > > > > On Wed, Jul 31, 2019 at 9:48 AM Nicolas Saenz Julienne
> > > > > <nsaenzjulienne@suse.de> wrote:
> > > > > > Some SoCs might have multiple interconnects each with their own=
 DMA
> > > > > > addressing limitations. This function parses the 'dma-ranges' o=
n
> > > > > > each of
> > > > > > them and tries to guess the maximum SoC wide DMA addressable me=
mory
> > > > > > size.
> > > > > >=20
> > > > > > This is specially useful for arch code in order to properly set=
up
> > > > > > CMA
> > > > > > and memory zones.
> > > > >=20
> > > > > We already have a way to setup CMA in reserved-memory, so why is =
this
> > > > > needed for that?
> > > >=20
> > > > Correct me if I'm wrong but I got the feeling you got the point of =
the
> > > > patch
> > > > later on.
> > >=20
> > > No, for CMA I don't. Can't we already pass a size and location for CM=
A
> > > region under /reserved-memory. The only advantage here is perhaps the
> > > CMA range could be anywhere in the DMA zone vs. a fixed location.
> >=20
> > Now I get it, sorry I wasn't aware of that interface.
> >=20
> > Still, I'm not convinced it matches RPi's use case as this would hard-c=
ode
> > CMA's size. Most people won't care, but for the ones that do, it's nice=
r to
> > change the value from the kernel command line than editing the dtb.
>=20
> Sure, I fully agree and am not a fan of the CMA DT overlays I've seen.
>=20
> > I get that
> > if you need to, for example, reserve some memory for the video to work,=
 it's
> > silly not to hard-code it. Yet due to the board's nature and users base=
 I
> > say
> > it's important to favor flexibility. It would also break compatibility =
with
> > earlier versions of the board and diverge from the downstream kernel
> > behaviour.
> > Which is a bigger issue than it seems as most users don't always unders=
tand
> > which kernel they are running and unknowingly copy configuration option=
s
> > from
> > forums.
> >=20
> > As I also need to know the DMA addressing limitations to properly confi=
gure
> > memory zones and dma-direct. Setting up the proper CMA constraints duri=
ng
> > the
> > arch's init will be trivial anyway.
>=20
> It was really just commentary on commit text as for CMA alone we have
> a solution already. I agree on the need for zones.

Ok, understood :)

> > > > > IMO, I'd just do:
> > > > >=20
> > > > > if (of_fdt_machine_is_compatible(blob, "brcm,bcm2711"))
> > > > >     dma_zone_size =3D XX;
> > > > >=20
> > > > > 2 lines of code is much easier to maintain than 10s of incomplete=
 code
> > > > > and is clearer who needs this. Maybe if we have dozens of SoCs wi=
th
> > > > > this problem we should start parsing dma-ranges.
> > > >=20
> > > > FYI that's what arm32 is doing at the moment and was my first insti=
nct.
> > > > But
> > > > it
> > > > seems that arm64 has been able to survive so far without any machin=
e
> > > > specific
> > > > code and I have the feeling Catalin and Will will not be happy abou=
t
> > > > this
> > > > solution. Am I wrong?
> > >=20
> > > No doubt. I'm fine if the 2 lines live in drivers/of/.
> > >=20
> > > Note that I'm trying to reduce the number of early_init_dt_scan_*
> > > calls from arch code into the DT code so there's more commonality
> > > across architectures in the early DT scans. So ideally, this can all
> > > be handled under early_init_dt_scan() call.
> >=20
> > How does this look? (I'll split it in two patches and add a comment
> > explaining
> > why dt_dma_zone_size is needed)
> >=20
> > diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> > index f2444c61a136..1395be40b722 100644
> > --- a/drivers/of/fdt.c
> > +++ b/drivers/of/fdt.c
> > @@ -30,6 +30,8 @@
> >=20
> >  #include "of_private.h"
> >=20
> > +u64 dt_dma_zone_size __ro_after_init;
>=20
> Avoiding a call from arch code by just having a variable isn't really
> better. I'd rather see a common, non DT specific variable that can be
> adjusted. Something similar to initrd_start/end. Then the arch code
> doesn't have to care what hardware description code adjusted the
> value.

Way better, I'll update it.


--=-aUnd1sGElH9S49gE7iVL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl1MXEIACgkQlfZmHno8
x/4I5gf6A+XJGnTIx+91Jp1InIYL3ffBEX7UUGqmhdiznnad0gVF6JWh/Kq6dJyQ
zkCiCoziJ5AFuNeS3Akpa7psFTnLYsWWaeL+FzWvSvLntp6ti6URyBlx5v4JeKT2
QaGzJsdWWGEMXA8QIHk309B127xqqgKqFJKnOYubd1h7xdULE11Ht1Ur+mTlkur/
AEaSkGTAJHap13dIxCnV2cdHt8u/79mL/vDRSCDLmUrJxaOcvQPSDQHIK86j+cBb
OEzAaU89Ektf1Uq1GI5yjn0gBRcOiPw+TaMlJw4PcPWZN1Lfz8M9lb3+QZOrykTs
KgzRXlmzYbKR0CO/8rK+dbxSO+x9gg==
=JXPI
-----END PGP SIGNATURE-----

--=-aUnd1sGElH9S49gE7iVL--


--===============0811344231852774570==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
--===============0811344231852774570==--

