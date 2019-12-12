Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC0911CE29
	for <lists.iommu@lfdr.de>; Thu, 12 Dec 2019 14:21:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D61258706E;
	Thu, 12 Dec 2019 13:21:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VuVoXHRXSSH2; Thu, 12 Dec 2019 13:21:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4DC9287018;
	Thu, 12 Dec 2019 13:21:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 366B6C1D85;
	Thu, 12 Dec 2019 13:21:09 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 70D41C0881
 for <iommu@lists.linux-foundation.org>; Thu, 12 Dec 2019 13:21:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 52DA520506
 for <iommu@lists.linux-foundation.org>; Thu, 12 Dec 2019 13:21:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NU5YF8qSP550 for <iommu@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 13:21:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by silver.osuosl.org (Postfix) with ESMTPS id 24B9E20489
 for <iommu@lists.linux-foundation.org>; Thu, 12 Dec 2019 13:21:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B70EFAFD8;
 Thu, 12 Dec 2019 13:21:03 +0000 (UTC)
Message-ID: <ff60337c5f6f324fb121fa7cad24e763af29cfe2.camel@suse.de>
Subject: Re: [PATCH v4 8/8] linux/log2.h: Use roundup/dow_pow_two() on 64bit
 calculations
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Bjorn Helgaas <helgaas@kernel.org>
Date: Thu, 12 Dec 2019 14:21:00 +0100
In-Reply-To: <20191205203845.GA243596@google.com>
References: <20191205203845.GA243596@google.com>
User-Agent: Evolution 3.34.2 
MIME-Version: 1.0
Cc: Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org,
 Shawn Lin <shawn.lin@rock-chips.com>, Eric Anholt <eric@anholt.net>,
 Hanjun Guo <guohanjun@huawei.com>, Frank Rowand <frowand.list@gmail.com>,
 Christoph Hellwig <hch@lst.de>, Florian Fainelli <f.fainelli@gmail.com>,
 linux-rockchip@lists.infradead.org, linux-rdma@vger.kernel.org, maz@kernel.org,
 phil@raspberrypi.org, linux-acpi@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, Len Brown <lenb@kernel.org>,
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, mbrugger@suse.com,
 netdev@vger.kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 linux-kernel@vger.kernel.org, jeremy.linton@arm.com,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
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
Content-Type: multipart/mixed; boundary="===============5670420179505825945=="
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>


--===============5670420179505825945==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-lcx9Dpdc/nSfdN+F0tca"


--=-lcx9Dpdc/nSfdN+F0tca
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2019-12-05 at 14:38 -0600, Bjorn Helgaas wrote:
> The subject contains a couple typos: it's missing "of" and it's
> missing the "n" on "down".

Noted >=20
> On Tue, Dec 03, 2019 at 12:47:41PM +0100, Nicolas Saenz Julienne wrote:
> > The function now is safe to use while expecting a 64bit value. Use it
> > where relevant.
>=20
> Please include the function names ("roundup_pow_of_two()",
> "rounddown_pow_of_two()") in the changelog so it is self-contained and
> doesn't depend on the subject.

Noted

> > Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
>=20
> With the nits above and below addressed,
>=20
> Acked-by: Bjorn Helgaas <bhelgaas@google.com>	# drivers/pci

Thanks!

> > ---
> >  drivers/acpi/arm64/iort.c                        | 2 +-
> >  drivers/net/ethernet/mellanox/mlx4/en_clock.c    | 3 ++-
> >  drivers/of/device.c                              | 3 ++-
> >  drivers/pci/controller/cadence/pcie-cadence-ep.c | 3 ++-
> >  drivers/pci/controller/cadence/pcie-cadence.c    | 3 ++-
> >  drivers/pci/controller/pcie-brcmstb.c            | 3 ++-
> >  drivers/pci/controller/pcie-rockchip-ep.c        | 5 +++--
> >  kernel/dma/direct.c                              | 2 +-
> >  8 files changed, 15 insertions(+), 9 deletions(-)
> > --- a/drivers/pci/controller/cadence/pcie-cadence-ep.c
> > +++ b/drivers/pci/controller/cadence/pcie-cadence-ep.c
> > @@ -10,6 +10,7 @@
> >  #include <linux/platform_device.h>
> >  #include <linux/pm_runtime.h>
> >  #include <linux/sizes.h>
> > +#include <linux/log2.h>
> > =20
> >  #include "pcie-cadence.h"
> > =20
> > @@ -65,7 +66,7 @@ static int cdns_pcie_ep_set_bar(struct pci_epc *epc, =
u8
> > fn,
> >  	 * roundup_pow_of_two() returns an unsigned long, which is not suited
> >  	 * for 64bit values.
> >  	 */
>=20
> Please remove the comment above since it no longer applies.

Noted

[...]

> > diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> > index 6af7ae83c4ad..056886c4efec 100644
> > --- a/kernel/dma/direct.c
> > +++ b/kernel/dma/direct.c
> > @@ -53,7 +53,7 @@ u64 dma_direct_get_required_mask(struct device *dev)
> >  {
> >  	u64 max_dma =3D phys_to_dma_direct(dev, (max_pfn - 1) << PAGE_SHIFT);
> > =20
> > -	return (1ULL << (fls64(max_dma) - 1)) * 2 - 1;
> > +	return rounddown_pow_of_two(max_dma) * 2 - 1;
>=20
> Personally I would probably make this one a separate patch since it's
> qualitatively different than the others and it would avoid the slight
> awkwardness of the non-greppable "roundup/down_pow_of_two()"
> construction in the commit subject.
>=20
> But it's fine either way.

I'll split it into two parts, as RobH made a similar complaint.

Regards,
Nicolas


--=-lcx9Dpdc/nSfdN+F0tca
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl3yPrwACgkQlfZmHno8
x/4DxAf/dUNU44c6C5UlupKkHs1V09AR3yPNPOe8GrxrtpnzWAaNQ9L4S0ZG9ocS
gey8W3CCPJPrWmqSAjQ8ddX9w+wKaaRaGFE3wHRFiGVMDSN8kGzHySuWi1ytfy0Y
x0msb/bX87L3SwSegRTGlvbRJ1rDZl4WxCVFSrhCNRwem2R+v668VGifVS24Ay1f
dwS7xyDUcMTmaiCfpK8KyJK1GdbScI6kVPFUM57deANw/I60zWGWykBnTeTQtlrM
gLN2fGNP1wLRKZ5IEHObKLWo0rXTRKBjsouzL4/D5dW69LXZK1nS02rJsdu5bpUl
WepA96OKnIgxngbBiO8z4btiMgZ1Jw==
=QTsG
-----END PGP SIGNATURE-----

--=-lcx9Dpdc/nSfdN+F0tca--


--===============5670420179505825945==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
--===============5670420179505825945==--

