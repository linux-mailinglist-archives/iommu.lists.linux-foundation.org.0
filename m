Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id D023C28EED6
	for <lists.iommu@lfdr.de>; Thu, 15 Oct 2020 10:55:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 948AF876C9;
	Thu, 15 Oct 2020 08:55:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IE70-s3NP5lI; Thu, 15 Oct 2020 08:55:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 28137876C5;
	Thu, 15 Oct 2020 08:55:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 11E1AC0051;
	Thu, 15 Oct 2020 08:55:44 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A4188C0051
 for <iommu@lists.linux-foundation.org>; Thu, 15 Oct 2020 08:55:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 91F58876BB
 for <iommu@lists.linux-foundation.org>; Thu, 15 Oct 2020 08:55:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kfuKkKy4xgw4 for <iommu@lists.linux-foundation.org>;
 Thu, 15 Oct 2020 08:55:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id ED071876B0
 for <iommu@lists.linux-foundation.org>; Thu, 15 Oct 2020 08:55:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8886BAD07;
 Thu, 15 Oct 2020 08:55:40 +0000 (UTC)
Message-ID: <d2b9b819c3245d80964959ab9544ae83aee470de.camel@suse.de>
Subject: Re: [PATCH v3 1/8] arm64: mm: Move reserve_crashkernel() into
 mem_init()
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Will Deacon <will@kernel.org>
Date: Thu, 15 Oct 2020 10:55:39 +0200
In-Reply-To: <20201015084008.GB4537@willie-the-truck>
References: <20201014191211.27029-1-nsaenzjulienne@suse.de>
 <20201014191211.27029-2-nsaenzjulienne@suse.de>
 <20201015084008.GB4537@willie-the-truck>
User-Agent: Evolution 3.36.5 
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, jeremy.linton@arm.com, ardb@kernel.org,
 iommu@lists.linux-foundation.org, robh+dt@kernel.org,
 linux-rpi-kernel@lists.infradead.org, robin.murphy@arm.com, hch@lst.de,
 linux-arm-kernel@lists.infradead.org
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
Content-Type: multipart/mixed; boundary="===============5763373995075466817=="
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>


--===============5763373995075466817==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-LqkvVPGxKWHS4SdfYKKx"


--=-LqkvVPGxKWHS4SdfYKKx
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-10-15 at 09:40 +0100, Will Deacon wrote:
> On Wed, Oct 14, 2020 at 09:12:03PM +0200, Nicolas Saenz Julienne wrote:
> > crashkernel might reserve memory located in ZONE_DMA. We plan to delay
> > ZONE_DMA's initialization after unflattening the devicetree and ACPI's
> > boot table initialization, so move it later in the boot process.
> > Specifically into mem_init(), this is the last place crashkernel will b=
e
> > able to reserve the memory before the page allocator kicks in and there=
 is
> > no need to do it earlier.
> >=20
> > Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> > ---
> >  arch/arm64/mm/init.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> Please can you cc me on the whole series next time? I know different
> maintainers have different preferences here, but I find it much easier to
> figure out what's happening when I can see all of the changes together.

Will do.

Regards,
Nicolas



--=-LqkvVPGxKWHS4SdfYKKx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl+IDosACgkQlfZmHno8
x/5b8gf/WNSZvoD1xtpKjt8jTMpQspe3cPPxx3dpnpf7yyIFDV2xDx1fyq+Mpgad
krP9EbmaQcdA3u87hnSWp1EdJ0b1fGQQooiORSHOG+aQk4sfG/pOtFMt0WtxPyPf
r5KkkqLrh0x+ro0UB1BjEThi48JfY3mXrBjsohVFeytePlBk0HetZtyfWf5JxyCY
ZEHDUqbeYqhpWS3CfAfu5R3o5QFD4j4duokshFeptOcz2qFULFMKDFhVPbIIQE8x
Oydt2nCcFSDExbev7dHLEh0QmSY3vSd9F2c3nN0cw1y7M1MB2xc5XKLfLSgPgpY8
LQ4wQNIocmuUtgHQR8Blet63XHBeNw==
=Fb5G
-----END PGP SIGNATURE-----

--=-LqkvVPGxKWHS4SdfYKKx--


--===============5763373995075466817==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
--===============5763373995075466817==--

