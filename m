Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCED28EFD4
	for <lists.iommu@lfdr.de>; Thu, 15 Oct 2020 12:05:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 71441875EA;
	Thu, 15 Oct 2020 10:05:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PzlcHS_5ZbiR; Thu, 15 Oct 2020 10:05:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BA53E875DE;
	Thu, 15 Oct 2020 10:05:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 80D28C0051;
	Thu, 15 Oct 2020 10:05:17 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 120E9C0051
 for <iommu@lists.linux-foundation.org>; Thu, 15 Oct 2020 10:05:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id EFAE32044F
 for <iommu@lists.linux-foundation.org>; Thu, 15 Oct 2020 10:05:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rzubdEBBp7+r for <iommu@lists.linux-foundation.org>;
 Thu, 15 Oct 2020 10:05:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by silver.osuosl.org (Postfix) with ESMTPS id 40DB7203F1
 for <iommu@lists.linux-foundation.org>; Thu, 15 Oct 2020 10:05:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C81D4AD6B;
 Thu, 15 Oct 2020 10:05:12 +0000 (UTC)
Message-ID: <eb355b9d3167d4c9575fe568d413ed4ff30078bb.camel@suse.de>
Subject: Re: [PATCH v3 5/8] dma-direct: Turn zone_dma_bits default value
 into a define
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Christoph Hellwig <hch@lst.de>
Date: Thu, 15 Oct 2020 12:05:11 +0200
In-Reply-To: <20201015053808.GA12218@lst.de>
References: <20201014191211.27029-1-nsaenzjulienne@suse.de>
 <20201014191211.27029-6-nsaenzjulienne@suse.de>
 <20201015053808.GA12218@lst.de>
User-Agent: Evolution 3.36.5 
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, jeremy.linton@arm.com,
 iommu@lists.linux-foundation.org, robh+dt@kernel.org,
 linux-rpi-kernel@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>,
 ardb@kernel.org, linux-arm-kernel@lists.infradead.org
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
Content-Type: multipart/mixed; boundary="===============2639078911660423423=="
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>


--===============2639078911660423423==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-ooBe/nz7Sn01MZB7Rrs+"


--=-ooBe/nz7Sn01MZB7Rrs+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-10-15 at 07:38 +0200, Christoph Hellwig wrote:
> On Wed, Oct 14, 2020 at 09:12:07PM +0200, Nicolas Saenz Julienne wrote:
> > Set zone_dma_bits default value through a define so as for architecture=
s
> > to be able to override it with their default value.
>=20
> Architectures can do that already by assigning a value to zone_dma_bits
> at runtime.  I really do not want to add the extra clutter.

I'll remove it then.


--=-ooBe/nz7Sn01MZB7Rrs+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl+IHtcACgkQlfZmHno8
x/6RQAf9GxOfgIudy6fJqG6B49H9h6IDJ4zv4+4QQwBXduPrUsL/C3Y0sFDL3fYB
60lEZWhAHKEvOCXo2nIUPE1mBXJwbMGEvvC6COTHvszK6mGKbtm/2tQF8ZTW3Vq0
CW/yxdpH3bYmMv+SAHFwhVJlujIqEQztQ8nsULO1vqU0G1+LI+E5u4LRIc352ZXd
zHi4ICHDOysIlB9I1OqICUDxnhPCUGXgqngrGYb6hrL/D/uiEv1e7kKdKHJU6Frz
R+8GUJ3FxMx6etC5hdGCmkqontX65U2Tyd3PXbj7pLBPLXo90SZnOh4lxc/rKhgm
bYh8stzAm1gcJzuYsOxrYy2qj1lWFg==
=B+5L
-----END PGP SIGNATURE-----

--=-ooBe/nz7Sn01MZB7Rrs+--


--===============2639078911660423423==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
--===============2639078911660423423==--

