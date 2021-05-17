Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id CF533386CF0
	for <lists.iommu@lfdr.de>; Tue, 18 May 2021 00:30:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F42D8429A;
	Mon, 17 May 2021 22:30:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rqCXgyqPGcO2; Mon, 17 May 2021 22:30:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 703AE83D9A;
	Mon, 17 May 2021 22:30:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 51A3CC0001;
	Mon, 17 May 2021 22:30:24 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 48E51C0001
 for <iommu@lists.linux-foundation.org>; Mon, 17 May 2021 22:30:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 32EF3401B2
 for <iommu@lists.linux-foundation.org>; Mon, 17 May 2021 22:30:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7MTzv5463cr3 for <iommu@lists.linux-foundation.org>;
 Mon, 17 May 2021 22:30:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from manchmal.in-ulm.de (manchmal.in-ulm.de [217.10.9.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E608640109
 for <iommu@lists.linux-foundation.org>; Mon, 17 May 2021 22:30:20 +0000 (UTC)
Date: Tue, 18 May 2021 00:30:15 +0200
From: Christoph Biedl <linux-kernel.bfrz@manchmal.in-ulm.de>
To: Greg KH <greg@kroah.com>
Subject: Re: 5.10.37 won't boot on my system, but 5.10.36 with same config does
Message-ID: <1621290515@msgid.manchmal.in-ulm.de>
References: <e0e9ecf4-cfd7-b31a-29b0-ead4a6c0ee40@charleswright.co>
 <1621180418@msgid.manchmal.in-ulm.de> <YKI/D64ODBUEHO9M@kroah.com>
 <1621251453@msgid.manchmal.in-ulm.de>
 <1621251685@msgid.manchmal.in-ulm.de>
 <CA+res+RHyF22T-sGwCG5zA6EBrk_gWbnZETX_iAgdRdWaPLbfw@mail.gmail.com>
 <1621254246@msgid.manchmal.in-ulm.de>
 <CA+res+QRm3VyJSjMaKLYm=KY5+T5nX+6-QhOgrgBcP+d2Ganag@mail.gmail.com>
 <YKJ5ysGAuI32Jpn6@kroah.com>
MIME-Version: 1.0
In-Reply-To: <YKJ5ysGAuI32Jpn6@kroah.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: iommu@lists.linux-foundation.org, stable <stable@vger.kernel.org>
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
Content-Type: multipart/mixed; boundary="===============7378700362458890717=="
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>


--===============7378700362458890717==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="v2Uk6McLiE8OV1El"
Content-Disposition: inline


--v2Uk6McLiE8OV1El
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Greg KH wrote...

> On Mon, May 17, 2021 at 02:45:01PM +0200, Jack Wang wrote:

> > So it's caused by this commit[1], and it should be fixed by latest
> > 5.10.38-rc1 https://git.kernel.org/pub/scm/linux/kernel/git/stable/linu=
x-stable-rc.git/log/?h=3Dlinux-5.10.y
> > [1]https://lore.kernel.org/stable/20210515132855.4bn7ve2ozvdhpnj4@nabok=
ov.fritz.box/
>=20
> Hopefully the "real" 5.10.38-rc1 release that is out now should fix
> this.  If not, please let us know.

Good news: Fixed with that "real" 5.10.38-rc1.

    Christoph

--v2Uk6McLiE8OV1El
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEWXMI+726A12MfJXdxCxY61kUkv0FAmCi7m8ACgkQxCxY61kU
kv3R1w/+OsPyGGnxeMcCjTZTrn/+WJFpR9fcHM13lTfgwjznk+gdR3uQ0QL6la0X
ros7A94fRiJ6QOhl3K5IiuNS7F+mOaaFaSrPtUzFgvqnroj+0tzya6ISxJJQpRSe
GQV/RO/iN8dL1+lnRDDSqIsQmXQrrPgog7Z1XdvDZ43TfRPNMgfoFFgvfyKeOiqk
V7shbi2R7d2kvlPmPV3Mva8Xg+di/KUePLFUT5z8Nvd1c+knA/m2SqCEQ3B79WWC
bzpb/EdxGOQAvj/lgU7vuXvhKKj+1k5+gpr/VVIYdXxwYl26LoKOLpGkWNKnOqZ9
AXVJq/6Zne3h7WKivAYSAq5LOJpeKpCKmOnVNmvZXWe55t8sCPeh6KAP4hJpIY2x
VVyZWsolt8nb8vEyVRn89oJbJfbmY2XaKqphysjr0PDMizmiD3/MAS0C9U6tn/33
OgQHs88svvSC895bCrg3BtzU9SLcboSFpcOpGvL90Oz8vPEwv5ya1zOLqVWR0Qvc
WzXh6CrZ10tUJ5Dak5YCyLwhauCJJ7hDO36t0KYrKCtZseQj8tMm/L+YnIXR4Kia
MU8XasRAI9MVo8EAcJnq83tpMOHVGxTM6EUP1xpeD+tuVjB88Rr4zHcjfP9etdlx
GMvN5TMHQQYK8sZUQyctbW8c8pM0HS6/7iWJqNLWQMFjCVLlHSM=
=BFBR
-----END PGP SIGNATURE-----

--v2Uk6McLiE8OV1El--

--===============7378700362458890717==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
--===============7378700362458890717==--
