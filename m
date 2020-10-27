Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C48F29AB31
	for <lists.iommu@lfdr.de>; Tue, 27 Oct 2020 12:51:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 29E688718E;
	Tue, 27 Oct 2020 11:51:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V0flxrb4MX78; Tue, 27 Oct 2020 11:51:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id CDABA8598B;
	Tue, 27 Oct 2020 11:51:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BA116C0859;
	Tue, 27 Oct 2020 11:51:05 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F033EC0051
 for <iommu@lists.linux-foundation.org>; Tue, 27 Oct 2020 11:51:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id EBE9B87186
 for <iommu@lists.linux-foundation.org>; Tue, 27 Oct 2020 11:51:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LtZfVUHNUyef for <iommu@lists.linux-foundation.org>;
 Tue, 27 Oct 2020 11:51:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 2F4BF87113
 for <iommu@lists.linux-foundation.org>; Tue, 27 Oct 2020 11:51:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 21D65AAB2;
 Tue, 27 Oct 2020 11:51:02 +0000 (UTC)
Message-ID: <d2b6693aefe6d2cad03432366c48e05cb5c8d3a3.camel@suse.de>
Subject: Re: [PATCH v4 0/7] arm64: Default to 32-bit wide ZONE_DMA
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Jeremy Linton <jeremy.linton@arm.com>, robh+dt@kernel.org, 
 catalin.marinas@arm.com, hch@lst.de, ardb@kernel.org,
 linux-kernel@vger.kernel.org
Date: Tue, 27 Oct 2020 12:50:53 +0100
In-Reply-To: <9bccc5ef-9457-044b-7193-d002a395e461@arm.com>
References: <20201021123437.21538-1-nsaenzjulienne@suse.de>
 <9bccc5ef-9457-044b-7193-d002a395e461@arm.com>
User-Agent: Evolution 3.36.5 
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, linux-mm@kvack.org, robin.murphy@arm.com,
 linux-acpi@vger.kernel.org, iommu@lists.linux-foundation.org,
 linux-rpi-kernel@lists.infradead.org, guohanjun@huawei.com,
 linux-riscv@lists.infradead.org, will@kernel.org,
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
Content-Type: multipart/mixed; boundary="===============2743079617794409594=="
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>


--===============2743079617794409594==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-7KtHL8JmijrZUDdO/9dK"


--=-7KtHL8JmijrZUDdO/9dK
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2020-10-23 at 14:05 -0500, Jeremy Linton wrote:
> Hi,
>=20
> On 10/21/20 7:34 AM, Nicolas Saenz Julienne wrote:
> > Using two distinct DMA zones turned out to be problematic. Here's an
> > attempt go back to a saner default.
> >=20
> > I tested this on both a RPi4 and QEMU.
>=20
> I've tested this in ACPI mode on the rpi4 (4+8G with/without the 3G=20
> limiter) as well, with Ard's IORT patch. Nothing seems to have regressed.
>=20
> Thanks,
>=20
> Tested-by: Jeremy Linton <jeremy.linton@arm.com>

Thanks!


--=-7KtHL8JmijrZUDdO/9dK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl+YCZ0ACgkQlfZmHno8
x/7nHAf+NsPBIeE87IsQQDXb+Yj9HG4BT9qoFjLz6YOJ82f2k6RHxorkNMBGv/Kn
mh1U2wjHbKJvDKSHIM/qsvcbSI8ZKQyqQBLYXintA5koBEw88a1UA3OXCqbs35Eu
5s4sHfoPVAAM8OE9b7+sKTNBFXBLngmBotO0Tt9dAXrTEPNLfPu9pXt22zGb2gCy
34Sv2032HmUGXMX3Dd1eEKPsfqYqHDsBMXmYsh1GrV5/xIJ2ClpD3yM7xjQ/PNtI
c2VffRjFikj/PUTf8I1HPDOeSwX101QkV3Uq9TatMWsLwQYv9Y5EM8Gz8XPPCDF3
CDY5pxiYqZdowQMQ53hVr9yjOjogdQ==
=XjDo
-----END PGP SIGNATURE-----

--=-7KtHL8JmijrZUDdO/9dK--


--===============2743079617794409594==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
--===============2743079617794409594==--

