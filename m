Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D571101CF
	for <lists.iommu@lfdr.de>; Tue,  3 Dec 2019 17:06:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 90D6A86CD0;
	Tue,  3 Dec 2019 16:06:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5SUoma7aOFLU; Tue,  3 Dec 2019 16:06:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 419EB86CF4;
	Tue,  3 Dec 2019 16:06:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 175E3C1DE2;
	Tue,  3 Dec 2019 16:06:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B8FEDC087F
 for <iommu@lists.linux-foundation.org>; Tue,  3 Dec 2019 16:06:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id A6E55203D1
 for <iommu@lists.linux-foundation.org>; Tue,  3 Dec 2019 16:06:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hFWxgdCDrM+u for <iommu@lists.linux-foundation.org>;
 Tue,  3 Dec 2019 16:06:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by silver.osuosl.org (Postfix) with ESMTPS id 6CA2C20341
 for <iommu@lists.linux-foundation.org>; Tue,  3 Dec 2019 16:06:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id AD9186A2F7;
 Tue,  3 Dec 2019 16:06:47 +0000 (UTC)
Message-ID: <d1c87c83f38e74f0c6b0692248fe88dfd2bdec3e.camel@suse.de>
Subject: Re: [PATCH v4 8/8] linux/log2.h: Use roundup/dow_pow_two() on 64bit
 calculations
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Rob Herring <robh+dt@kernel.org>
Date: Tue, 03 Dec 2019 17:06:43 +0100
In-Reply-To: <CAL_JsqLMCXdnZag3jihV_dzuR+wFaVKFb7q_PdKTxTg0LVA6cw@mail.gmail.com>
References: <20191203114743.1294-1-nsaenzjulienne@suse.de>
 <20191203114743.1294-9-nsaenzjulienne@suse.de>
 <CAL_JsqLMCXdnZag3jihV_dzuR+wFaVKFb7q_PdKTxTg0LVA6cw@mail.gmail.com>
User-Agent: Evolution 3.34.1 
MIME-Version: 1.0
Cc: Heiko Stuebner <heiko@sntech.de>, PCI <linux-pci@vger.kernel.org>,
 Shawn Lin <shawn.lin@rock-chips.com>, Eric Anholt <eric@anholt.net>,
 Hanjun Guo <guohanjun@huawei.com>, Frank Rowand <frowand.list@gmail.com>,
 Christoph Hellwig <hch@lst.de>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 linux-rdma@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
 Phil Elwell <phil@raspberrypi.org>, linux-acpi@vger.kernel.org,
 "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE"
 <bcm-kernel-feedback-list@broadcom.com>, Len Brown <lenb@kernel.org>,
 devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 "moderated list:BROADCOM BCM2835 ARM
 ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM
 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
 Matthias Brugger <mbrugger@suse.com>, netdev <netdev@vger.kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jeremy Linton <jeremy.linton@arm.com>,
 Linux IOMMU <iommu@lists.linux-foundation.org>,
 Stefan Wahren <wahrenst@gmx.net>, james.quinlan@broadcom.com,
 Sudeep Holla <sudeep.holla@arm.com>, Robin Murphy <robin.murphy@arm.com>,
 "David S. Miller" <davem@davemloft.net>, Tariq Toukan <tariqt@mellanox.com>
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
Content-Type: multipart/mixed; boundary="===============1693223338480754163=="
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>


--===============1693223338480754163==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-VHC+bPmpbRjqhnK2ykxw"


--=-VHC+bPmpbRjqhnK2ykxw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Tue, 2019-12-03 at 09:53 -0600, Rob Herring wrote:
> On Tue, Dec 3, 2019 at 5:48 AM Nicolas Saenz Julienne
> <nsaenzjulienne@suse.de> wrote:
> > The function now is safe to use while expecting a 64bit value. Use it
> > where relevant.
>=20
> What was wrong with the existing code? This is missing some context.

You're right, I'll update it.

For most of files changed the benefit here is factoring out a common patter=
n
using the standard function roundup/down_pow_two() which now provides corre=
ct
64bit results.

As for of/device.c and arm64/iort.c it's more of a readability enhancement.=
 I
consider it's easier to understand than the current calculation as it abstr=
acts
the math.

> > Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> > ---
> >  drivers/acpi/arm64/iort.c                        | 2 +-
> >  drivers/net/ethernet/mellanox/mlx4/en_clock.c    | 3 ++-
> >  drivers/of/device.c                              | 3 ++-
>=20
> In any case,
>=20
> Acked-by: Rob Herring <robh@kernel.org>
>=20

Thanks!

Regards,
Nicolas


--=-VHC+bPmpbRjqhnK2ykxw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl3miBMACgkQlfZmHno8
x/5s+Af/a2icSd66GHrsABoMtUfJXpQclSae81ThRP5Bfx6+mK4Ty4en3T+IxOK+
NPmneod0gjSfyqqQniFbEcmlKAd8wXyUnBCCi6urRvuqOWcw65h10DA3fQCivaOt
NWn3FRWMlPZbBIAYr/XOcsdOOkbD+VaFE/PaBYmxU/rWaCLGMWpYYBhF/Vcm+ASd
VPQ4g8AfxyGvQW9EgbmRTMC0k7kMP6qrpmgIjNWvUPyJ+8ytD2Zly2xvbVf9TqhX
/PP/t19fWayTqhsg+B04K0aN0oriRqSFX44yvCOApKhLBSsF6Nyc40m2sreqKMYY
98kwrOrux/Fb3OeV/Wzdhhh8VhH+Sg==
=4wmf
-----END PGP SIGNATURE-----

--=-VHC+bPmpbRjqhnK2ykxw--


--===============1693223338480754163==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
--===============1693223338480754163==--

