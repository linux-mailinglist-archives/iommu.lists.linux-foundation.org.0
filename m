Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C4A7E060
	for <lists.iommu@lfdr.de>; Thu,  1 Aug 2019 18:41:40 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A8F5F130E;
	Thu,  1 Aug 2019 16:41:38 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 836CB107A
	for <iommu@lists.linux-foundation.org>;
	Thu,  1 Aug 2019 16:41:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id C47175F4
	for <iommu@lists.linux-foundation.org>;
	Thu,  1 Aug 2019 16:41:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id E44E3AFA1;
	Thu,  1 Aug 2019 16:41:07 +0000 (UTC)
Message-ID: <4027201b6128b3f2b0ab941dc473ab143da64be2.camel@suse.de>
Subject: Re: [PATCH 5/8] arm64: use ZONE_DMA on DMA addressing limited devices
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Robin Murphy <robin.murphy@arm.com>, Catalin Marinas
	<catalin.marinas@arm.com>
Date: Thu, 01 Aug 2019 18:40:50 +0200
In-Reply-To: <e35dd4a5-281b-d281-59c9-3fc7108eb8be@arm.com>
References: <20190731154752.16557-1-nsaenzjulienne@suse.de>
	<20190731154752.16557-6-nsaenzjulienne@suse.de>
	<20190731170742.GC17773@arrakis.emea.arm.com>
	<d8b4a7cb9c06824ca88a0602a5bf38b6324b43c0.camel@suse.de>
	<e35dd4a5-281b-d281-59c9-3fc7108eb8be@arm.com>
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: phill@raspberryi.org, devicetree@vger.kernel.org, f.fainelli@gmail.com,
	wahrenst@gmx.net, eric@anholt.net, marc.zyngier@arm.com,
	frowand.list@gmail.com, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, iommu@lists.linux-foundation.org,
	robh+dt@kernel.org, linux-rpi-kernel@lists.infradead.org,
	mbrugger@suse.com, akpm@linux-foundation.org,
	Will Deacon <will@kernel.org>, hch@lst.de,
	linux-arm-kernel@lists.infradead.org
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
Content-Type: multipart/mixed; boundary="===============1027766949558518623=="
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org


--===============1027766949558518623==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-qAJVJtco/gH4l0Ax6g8O"


--=-qAJVJtco/gH4l0Ax6g8O
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2019-08-01 at 17:07 +0100, Robin Murphy wrote:
> On 2019-08-01 4:44 pm, Nicolas Saenz Julienne wrote:
> > On Wed, 2019-07-31 at 18:07 +0100, Catalin Marinas wrote:
> > > On Wed, Jul 31, 2019 at 05:47:48PM +0200, Nicolas Saenz Julienne wrot=
e:
> > > > diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> > > > index 1c4ffabbe1cb..f5279ef85756 100644
> > > > --- a/arch/arm64/mm/init.c
> > > > +++ b/arch/arm64/mm/init.c
> > > > @@ -50,6 +50,13 @@
> > > >   s64 memstart_addr __ro_after_init =3D -1;
> > > >   EXPORT_SYMBOL(memstart_addr);
> > > >  =20
> > > > +/*
> > > > + * We might create both a ZONE_DMA and ZONE_DMA32. ZONE_DMA is nee=
ded
> > > > if
> > > > there
> > > > + * are periferals unable to address the first naturally aligned 4G=
B of
> > > > ram.
> > > > + * ZONE_DMA32 will be expanded to cover the rest of that memory. I=
f
> > > > such
> > > > + * limitations doesn't exist only ZONE_DMA32 is created.
> > > > + */
> > >=20
> > > Shouldn't we instead only create ZONE_DMA to cover the whole 32-bit
> > > range and leave ZONE_DMA32 empty? Can__GFP_DMA allocations fall back
> > > onto ZONE_DMA32?
> >=20
> > Hi Catalin, thanks for the review.
> >=20
> > You're right, the GFP_DMA page allocation will fail with a nasty dmesg =
error
> > if
> > ZONE_DMA is configured but empty. Unsurprisingly the opposite situation=
 is
> > fine
> > (GFP_DMA32 with an empty ZONE_DMA32).
>=20
> Was that tested on something other than RPi4 with more than 4GB of RAM?=
=20
> (i.e. with a non-empty ZONE_NORMAL either way)

No, all I did is play around with RPi4's memory size (1 GB vs 4 GB).

I'll see If I can get access to a dts based board with more than 4 GB, If n=
ot
I'll try to fake it. It's not ideal but I can set the limit on 3 GB and hav=
e
the 3 areas created (with and witouth an empty ZONE_DMA32).

On top of that, now that you ask, I realise I neglected all the ACPI based
servers. I have access to some so I'll make sure I test everything on them =
too
for the next series.

Regards,
Nicolas


--=-qAJVJtco/gH4l0Ax6g8O
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl1DFhIACgkQlfZmHno8
x/5YnAf/aih3gNCdpPnk9CDn+WHuChefMegomFiKPy7KLWGYmB9OrtzlXlYit3VU
z2zffpz7+B+tFBZWLyxyQfJ8sT8uogFFJR+HNsvucEC2z4cDMksEkCgYQRHcv5iq
4CDSPUrd5zuESxZjq3ne7sLGx0G41aVs7o+iKAaUls/WAhq7MbYiq8B/r9HPnS1/
qAxsHlnX0PASFIN3BCnr+1VSy+xbwpFNSNVfqLYtWRQZvI8ww3Epx/AbWcTKy3YC
3YbXITPMlA4Mf+0ROrmU4sf0dj/mdQkC6SYqPjTMqVYyzON4rJ/MvOChQDmEGPs6
WiNr9ZnC1GXA4QfwFXcRrfK85+Y0vw==
=e240
-----END PGP SIGNATURE-----

--=-qAJVJtco/gH4l0Ax6g8O--


--===============1027766949558518623==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
--===============1027766949558518623==--

