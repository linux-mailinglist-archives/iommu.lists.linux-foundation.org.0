Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DB61E4B4D
	for <lists.iommu@lfdr.de>; Wed, 27 May 2020 19:01:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 52C7E86E35;
	Wed, 27 May 2020 17:01:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lz5TsoW3oh6a; Wed, 27 May 2020 17:01:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B596786E47;
	Wed, 27 May 2020 17:01:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 99ADFC016F;
	Wed, 27 May 2020 17:01:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C8AE1C016F
 for <iommu@lists.linux-foundation.org>; Wed, 27 May 2020 17:01:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id AD1B787E9C
 for <iommu@lists.linux-foundation.org>; Wed, 27 May 2020 17:01:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DsJd9NJ3CXKr for <iommu@lists.linux-foundation.org>;
 Wed, 27 May 2020 17:01:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9510987E68
 for <iommu@lists.linux-foundation.org>; Wed, 27 May 2020 17:01:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6A074AC61;
 Wed, 27 May 2020 17:01:49 +0000 (UTC)
Message-ID: <c48ede24790b2e402ca47640ae9f1ea2a5b27530.camel@suse.de>
Subject: Re: [PATCH v2 09/14] device core: Add ability to handle multiple
 dma offsets
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Jim Quinlan <james.quinlan@broadcom.com>
Date: Wed, 27 May 2020 19:01:43 +0200
In-Reply-To: <CA+-6iNyOKvY-xNfXqDRa5_nJVJuqGKA-oe-ejNuJHUBt6ORu0A@mail.gmail.com>
References: <20200526191303.1492-1-james.quinlan@broadcom.com>
 <20200526191303.1492-10-james.quinlan@broadcom.com>
 <59a0b4e1454a8ef4d3e4ebaf55dcbf3dcd2d73a2.camel@suse.de>
 <CA+-6iNyOKvY-xNfXqDRa5_nJVJuqGKA-oe-ejNuJHUBt6ORu0A@mail.gmail.com>
User-Agent: Evolution 3.36.2 
MIME-Version: 1.0
Cc: "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
 "open list:PCI NATIVE HOST BRIDGE AND ENDPOINT DRIVERS"
 <linux-pci@vger.kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Frank Rowand <frowand.list@gmail.com>, Christoph Hellwig <hch@lst.de>,
 Saravana Kannan <saravanak@google.com>, "Rafael J.
 Wysocki" <rafael.j.wysocki@intel.com>,
 "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE"
 <bcm-kernel-feedback-list@broadcom.com>,
 Alan Stern <stern@rowland.harvard.edu>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE
 TREE" <devicetree@vger.kernel.org>, Corey Minyard <minyard@acm.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Oliver Neukum <oneukum@suse.com>, open list <linux-kernel@vger.kernel.org>,
 Wolfram Sang <wsa@kernel.org>,
 "open list:DMA MAPPING HELPERS" <iommu@lists.linux-foundation.org>,
 Robin Murphy <robin.murphy@arm.com>
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
Content-Type: multipart/mixed; boundary="===============1975762228464738699=="
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>


--===============1975762228464738699==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-zRgqKyYp8CMyrh28/srG"


--=-zRgqKyYp8CMyrh28/srG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jim,

On Wed, 2020-05-27 at 11:43 -0400, Jim Quinlan wrote:
> Hi Nicolas,
>=20
> On Wed, May 27, 2020 at 11:00 AM Nicolas Saenz Julienne
> <nsaenzjulienne@suse.de> wrote:
> > Hi Jim,
> > one thing comes to mind, there is a small test suite in
> > drivers/of/unittest.c
> > (specifically of_unittest_pci_dma_ranges()) you could extend it to incl=
ude
> > your
> > use cases.
> Sure, will check out.
> > On Tue, 2020-05-26 at 15:12 -0400, Jim Quinlan wrote:
> > > The new field in struct device 'dma_pfn_offset_map' is used to facili=
tate
> > > the use of multiple pfn offsets between cpu addrs and dma addrs.  It =
is
> > > similar to 'dma_pfn_offset' except that the offset chosen depends on =
the
> > > cpu or dma address involved.
> > >=20
> > > Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
> > > ---
> > >  drivers/of/address.c        | 65 +++++++++++++++++++++++++++++++++++=
--
> > >  drivers/usb/core/message.c  |  3 ++
> > >  drivers/usb/core/usb.c      |  3 ++
> > >  include/linux/device.h      | 10 +++++-
> > >  include/linux/dma-direct.h  | 10 ++++--
> > >  include/linux/dma-mapping.h | 46 ++++++++++++++++++++++++++
> > >  kernel/dma/Kconfig          | 13 ++++++++
> > >  7 files changed, 144 insertions(+), 6 deletions(-)
> > >=20
> >=20
> > [...]
> >=20
> > > @@ -977,10 +1020,19 @@ int of_dma_get_range(struct device *dev, struc=
t
> > > device_node *np, u64 *dma_addr,
> > >               pr_debug("dma_addr(%llx) cpu_addr(%llx) size(%llx)\n",
> > >                        range.bus_addr, range.cpu_addr, range.size);
> > >=20
> > > +             num_ranges++;
> > >               if (dma_offset && range.cpu_addr - range.bus_addr !=3D
> > > dma_offset)
> > > {
> > > -                     pr_warn("Can't handle multiple dma-ranges with
> > > different
> > > offsets on node(%pOF)\n", node);
> > > -                     /* Don't error out as we'd break some existing =
DTs
> > > */
> > > -                     continue;
> > > +                     if (!IS_ENABLED(CONFIG_DMA_PFN_OFFSET_MAP)) {
> > > +                             pr_warn("Can't handle multiple dma-rang=
es
> > > with
> > > different offsets on node(%pOF)\n", node);
> > > +                             pr_warn("Perhaps set
> > > DMA_PFN_OFFSET_MAP=3Dy?\n");
> > > +                             /*
> > > +                              * Don't error out as we'd break some
> > > existing
> > > +                              * DTs that are using configs w/o
> > > +                              * CONFIG_DMA_PFN_OFFSET_MAP set.
> > > +                              */
> > > +                             continue;
> >=20
> > dev->bus_dma_limit is set in of_dma_configure(), this function's caller=
,
> > based
> > on dma_start's value (set after this continue). So you'd be effectively
> > setting
> > the dev->bus_dma_limit to whatever we get from the first dma-range.
> I'm not seeing that at all.  On the  evaluation of each dma-range,
> dma_start and dma_end are re-evaluated to be the lowest and highest
> bus values of the  dma-ranges seen so far.  After all dma-ranges are
> examined,  dev->bus_dma_limit being set to the highest.  In fact, the
> current code -- ie before my commits -- already does this for multiple
> dma-ranges as long as the cpu-bus offset is the same in the
> dma-ranges.

Sorry I got carried away, you're right.

So I understand there is an underlaying assumption that the non DMAble memo=
ry
space will always sit on top of the bus memory space, as intertwined as it
might be, so as to every phys_to_dma() call on non DMAble memory to fall ab=
ove
bus_dma_limit.

Regards,
Nicolas


--=-zRgqKyYp8CMyrh28/srG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl7OnPcACgkQlfZmHno8
x/5FYQf9Hyg6r4xe2AQsd6Jy/LEHz47hHSEfbk6Zmqu1XLp6EQsPOCHEFLoCjExf
aDe7lcONaDgfY45AEZOwP+W3gdL76lKuD+PIv1UP2M61toc9CkJ2MdOyzpcx+081
g9rs8iR4JyZuGdPrIoF7gmRFQFuV54dNROs0cKTRe1BmErORF5We0IEaqhhOJ4iF
DNKjYglQ/w2zskqEMsiN89kDjUpmWWvolH9SDIzoBYmfIfBQzQbsyiNpA0Chq9ul
hWJwJq6uwXczXpwqWSDIoZX/DruOl5fAVLU/GZxdw7Yn3MJ5dtkDza3yRdg303JZ
ejwGur84LCjY8lJnXEIz+VfX0wboSA==
=CgTI
-----END PGP SIGNATURE-----

--=-zRgqKyYp8CMyrh28/srG--


--===============1975762228464738699==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
--===============1975762228464738699==--

