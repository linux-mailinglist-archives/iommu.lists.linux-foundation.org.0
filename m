Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id C6ED828053F
	for <lists.iommu@lfdr.de>; Thu,  1 Oct 2020 19:31:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 40B5B22EC9;
	Thu,  1 Oct 2020 17:31:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hci5drFCXOJh; Thu,  1 Oct 2020 17:31:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id AA3B020379;
	Thu,  1 Oct 2020 17:31:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 97305C0895;
	Thu,  1 Oct 2020 17:31:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2EE70C0051
 for <iommu@lists.linux-foundation.org>; Thu,  1 Oct 2020 17:31:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1E2BE85FFD
 for <iommu@lists.linux-foundation.org>; Thu,  1 Oct 2020 17:31:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QO26qUHDsMYb for <iommu@lists.linux-foundation.org>;
 Thu,  1 Oct 2020 17:31:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 66FFC85964
 for <iommu@lists.linux-foundation.org>; Thu,  1 Oct 2020 17:31:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 548E3B224;
 Thu,  1 Oct 2020 17:31:22 +0000 (UTC)
Message-ID: <b47232e2173e9e5ddf8f5be4c7b5a2f897f34eb7.camel@suse.de>
Subject: Re: [PATCH 1/4] of/fdt: Update zone_dma_bits when running in bcm2711
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Catalin Marinas <catalin.marinas@arm.com>, Rob Herring <robh+dt@kernel.org>
Date: Thu, 01 Oct 2020 19:31:19 +0200
In-Reply-To: <20201001172320.GQ21544@gaia>
References: <20201001161740.29064-1-nsaenzjulienne@suse.de>
 <20201001161740.29064-2-nsaenzjulienne@suse.de>
 <20201001171500.GN21544@gaia> <20201001172320.GQ21544@gaia>
User-Agent: Evolution 3.36.5 
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org, robh+dt@kernel.org,
 linux-rpi-kernel@lists.infradead.org, will@kernel.org, hch@lst.de,
 linux-arm-kernel@lists.infradead.org, robin.murphy@arm.com
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
Content-Type: multipart/mixed; boundary="===============4512063749124489570=="
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>


--===============4512063749124489570==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-seD6uijt62oXdXYvdJ0h"


--=-seD6uijt62oXdXYvdJ0h
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-10-01 at 18:23 +0100, Catalin Marinas wrote:
> On Thu, Oct 01, 2020 at 06:15:01PM +0100, Catalin Marinas wrote:
> > Hi Nicolas,
> >=20
> > Thanks for putting this together.
> >=20
> > On Thu, Oct 01, 2020 at 06:17:37PM +0200, Nicolas Saenz Julienne wrote:
> > > diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> > > index 4602e467ca8b..cd0d115ef329 100644
> > > --- a/drivers/of/fdt.c
> > > +++ b/drivers/of/fdt.c
> > > @@ -25,6 +25,7 @@
> > >  #include <linux/serial_core.h>
> > >  #include <linux/sysfs.h>
> > >  #include <linux/random.h>
> > > +#include <linux/dma-direct.h>	/* for zone_dma_bits */
> > > =20
> > >  #include <asm/setup.h>  /* for COMMAND_LINE_SIZE */
> > >  #include <asm/page.h>
> > > @@ -1198,6 +1199,14 @@ void __init early_init_dt_scan_nodes(void)
> > >  	of_scan_flat_dt(early_init_dt_scan_memory, NULL);
> > >  }
> > > =20
> > > +void __init early_init_dt_update_zone_dma_bits(void)
> > > +{
> > > +	unsigned long dt_root =3D of_get_flat_dt_root();
> > > +
> > > +	if (of_flat_dt_is_compatible(dt_root, "brcm,bcm2711"))
> > > +		zone_dma_bits =3D 30;
> > > +}
> >=20
> > I think we could keep this entirely in the arm64 setup_machine_fdt() an=
d
> > not pollute the core code with RPi4-specific code.
>=20
> Actually, even better, could we not move the check to
> arm64_memblock_init() when we initialise zone_dma_bits?

I did it this way as I vaguely remembered Rob saying he wanted to centralis=
e
all early boot fdt code in one place. But I'll be happy to move it there.

Regards,
Nicolas


--=-seD6uijt62oXdXYvdJ0h
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl92EmcACgkQlfZmHno8
x/650wf7BuG9OAXrpcJx+slOiIpUn27A9VP5PUiZhylbJPYElYlFJCs1q9tLFNHw
2xXUtjY3QDdSH9GtDY1utSkQ2VeyqLRsDeVMkiwV721Gtn3y9veD2tNiJb4WXtet
C9us1mhEFgpu691D6JilmlxSxjfCOHZYGmZXGpTOPOSu12/YQlHCYc33cRKkDbfn
G5H0tNc4gXkWwJh5OSZixd08Ek7+d4HzG8hpZB5ifDWYLY7ZTDWC27mF1xYWGwAE
d7WUXSQ11UaAQBl5maIqrL3X19tg/GsdidU3yrsjIBtBEFaulKmVtggI33JTfgoo
v517kqitPiAV14ZYWJoifJK6ZppdiQ==
=E6vz
-----END PGP SIGNATURE-----

--=-seD6uijt62oXdXYvdJ0h--


--===============4512063749124489570==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
--===============4512063749124489570==--

