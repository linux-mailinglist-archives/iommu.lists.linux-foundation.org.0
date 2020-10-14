Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 430EC28E010
	for <lists.iommu@lfdr.de>; Wed, 14 Oct 2020 13:52:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0644687EB8;
	Wed, 14 Oct 2020 11:52:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u0mx9zG2t56r; Wed, 14 Oct 2020 11:52:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id EA27487D11;
	Wed, 14 Oct 2020 11:52:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D3FACC1AD4;
	Wed, 14 Oct 2020 11:52:54 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6872AC0051
 for <iommu@lists.linux-foundation.org>; Wed, 14 Oct 2020 11:52:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 4F6A587B6A
 for <iommu@lists.linux-foundation.org>; Wed, 14 Oct 2020 11:52:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zWl3jz16MR9B for <iommu@lists.linux-foundation.org>;
 Wed, 14 Oct 2020 11:52:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 6C96187B68
 for <iommu@lists.linux-foundation.org>; Wed, 14 Oct 2020 11:52:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D84F8B2C5;
 Wed, 14 Oct 2020 11:52:50 +0000 (UTC)
Message-ID: <6740c49b73b11aaf1d74d216dc6e055e0a0ceac3.camel@suse.de>
Subject: Re: [PATCH v2 2/5] of/address: Introduce of_dma_lower_bus_limit()
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Rob Herring <robh+dt@kernel.org>
Date: Wed, 14 Oct 2020 13:52:49 +0200
In-Reply-To: <CAL_JsqL2cs+cko-UuTd37fnBKO_=3jQeyjB49USvm_VTBwcS8g@mail.gmail.com>
References: <20201010151235.20585-1-nsaenzjulienne@suse.de>
 <20201010151235.20585-3-nsaenzjulienne@suse.de>
 <CAL_JsqL2cs+cko-UuTd37fnBKO_=3jQeyjB49USvm_VTBwcS8g@mail.gmail.com>
User-Agent: Evolution 3.36.5 
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jeremy Linton <jeremy.linton@arm.com>, Ard Biesheuvel <ardb@kernel.org>,
 Linux IOMMU <iommu@lists.linux-foundation.org>, "moderated
 list:BROADCOM BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
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
Content-Type: multipart/mixed; boundary="===============2311297639294153938=="
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>


--===============2311297639294153938==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-vz0cKOt+RK+2KVWDw/31"


--=-vz0cKOt+RK+2KVWDw/31
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Mon, 2020-10-12 at 10:25 -0500, Rob Herring wrote:
> On Sat, Oct 10, 2020 at 10:12 AM Nicolas Saenz Julienne
> <nsaenzjulienne@suse.de> wrote:
> > The function provides the CPU physical address addressable by the most
> > constrained bus in the system. It might be useful in order to
> > dynamically set up memory zones during boot.
> >=20
> > Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> > ---
> >  drivers/of/address.c | 34 ++++++++++++++++++++++++++++++++++
> >  include/linux/of.h   |  7 +++++++
> >  2 files changed, 41 insertions(+)
> >=20
> > diff --git a/drivers/of/address.c b/drivers/of/address.c
> > index eb9ab4f1e80b..755e97b65096 100644
> > --- a/drivers/of/address.c
> > +++ b/drivers/of/address.c
> > @@ -1024,6 +1024,40 @@ int of_dma_get_range(struct device_node *np, con=
st struct bus_dma_region **map)
> >  }
> >  #endif /* CONFIG_HAS_DMA */
> >=20
> > +/**
> > + * of_dma_safe_phys_limit - Get system wide DMA safe address space
> > + *
> > + * Gets the CPU physical address limit for safe DMA addressing system =
wide by
> > + * searching for the most constraining dma-range. Otherwise it returns=
 ~0ULL.
> > + */
> > +u64 __init of_dma_safe_phys_limit(void)
> > +{
> > +       struct device_node *np =3D NULL;
> > +       struct of_range_parser parser;
> > +       const __be32 *ranges =3D NULL;
> > +       u64 phys_dma_limit =3D ~0ULL;
> > +       struct of_range range;
> > +       int len;
> > +
> > +       for_each_of_allnodes(np) {
> > +               dma_addr_t cpu_end =3D 0;
> > +
> > +               ranges =3D of_get_property(np, "dma-ranges", &len);
> > +               if (!ranges || !len)
> > +                       continue;
> > +
> > +               of_dma_range_parser_init(&parser, np);
> > +               for_each_of_range(&parser, &range)
> > +                       if (range.cpu_addr + range.size > cpu_end)
> > +                               cpu_end =3D range.cpu_addr + range.size=
;
>=20
> This doesn't work if you have more than one level of dma-ranges. The
> address has to be translated first. It should be okay to do that on
> the start or end address (if not, your DT is broken).

for_each_of_range() calls of_pci_range_parser_one() which utimately populat=
es
range.cpu_addr with of_translate_dma_address() results. Isn't that good eno=
ugh?

> Please add/extend a unittest for this.

Will do.

Regards,
Nicolas


--=-vz0cKOt+RK+2KVWDw/31
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl+G5pEACgkQlfZmHno8
x/6siQgAoJtPgILFxIVwe1du4om5+ODIO41w5bT0qTXAyu1TIhYAfHgvQA/+Yz7N
SRt7jhByA0NZcZnJk0mS5yR1URMoWQRO7FIdCWcG8cWtyf1cyv2azQijCrJiuSCG
JiaNo0MCEArAdh7B2TufniYLWxuQn5qSw4/xJLLDeYsjxCCvTHKv+rB/u7vPAXuN
ZzqQs06B7AVWW7bsfplFbAp3gBnKcL/APODWtYFu5WlUgPBCdsto1qqWv5uMZXEd
DHJY+bYOOgn3Z3kApceVpdhBBBFOkp3in6WdEoKtoBeLBAnDTBeXCqcE9cFLG2xJ
NP+YRl6dlHSarIqQsqyAhi9qut5ZOQ==
=XNec
-----END PGP SIGNATURE-----

--=-vz0cKOt+RK+2KVWDw/31--


--===============2311297639294153938==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
--===============2311297639294153938==--

