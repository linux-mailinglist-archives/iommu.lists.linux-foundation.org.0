Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE94382CDF
	for <lists.iommu@lfdr.de>; Mon, 17 May 2021 15:09:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 98998403CF;
	Mon, 17 May 2021 13:09:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cy6NsZtfrBM1; Mon, 17 May 2021 13:09:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50428403E6;
	Mon, 17 May 2021 13:09:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1E9D9C001C;
	Mon, 17 May 2021 13:09:16 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 70668C0001
 for <iommu@lists.linux-foundation.org>; Mon, 17 May 2021 12:32:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5C4F8404B8
 for <iommu@lists.linux-foundation.org>; Mon, 17 May 2021 12:32:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xlpe3NfSOtTB for <iommu@lists.linux-foundation.org>;
 Mon, 17 May 2021 12:32:11 +0000 (UTC)
X-Greylist: delayed 00:06:49 by SQLgrey-1.8.0
Received: from manchmal.in-ulm.de (manchmal.in-ulm.de [217.10.9.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E3663404AD
 for <iommu@lists.linux-foundation.org>; Mon, 17 May 2021 12:32:10 +0000 (UTC)
Date: Mon, 17 May 2021 14:25:16 +0200
From: Christoph Biedl <linux-kernel.bfrz@manchmal.in-ulm.de>
To: Jack Wang <jack.wang.usish@gmail.com>
Subject: Re: 5.10.37 won't boot on my system, but 5.10.36 with same config does
Message-ID: <1621254246@msgid.manchmal.in-ulm.de>
References: <e0e9ecf4-cfd7-b31a-29b0-ead4a6c0ee40@charleswright.co>
 <1621180418@msgid.manchmal.in-ulm.de> <YKI/D64ODBUEHO9M@kroah.com>
 <1621251453@msgid.manchmal.in-ulm.de>
 <1621251685@msgid.manchmal.in-ulm.de>
 <CA+res+RHyF22T-sGwCG5zA6EBrk_gWbnZETX_iAgdRdWaPLbfw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+res+RHyF22T-sGwCG5zA6EBrk_gWbnZETX_iAgdRdWaPLbfw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Mon, 17 May 2021 13:09:15 +0000
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
Content-Type: multipart/mixed; boundary="===============2892022558411008029=="
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>


--===============2892022558411008029==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VbJkn9YxBvnuCH5J"
Content-Disposition: inline


--VbJkn9YxBvnuCH5J
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Jack Wang wrote...

> Christoph Biedl <linux-kernel.bfrz@manchmal.in-ulm.de> =E4=BA=8E2021=E5=
=B9=B45=E6=9C=8817=E6=97=A5=E5=91=A8=E4=B8=80 =E4=B8=8B=E5=8D=881:52=E5=86=
=99=E9=81=93=EF=BC=9A
> >
> > Christoph Biedl wrote...
> >
> > > Thanks for taking care, unfortunately no improvement with 5.10.38-rc1=
 here.
> >
> > So in case this is related to the .config, I'm attaching it. Hardware i=
s,
> > as said before, an old Thinkpad x200, vendor BIOS and no particular mod=
ifications.
> > After disabling all vga/video/fbcon parameters I see the system suffers
> > a kernel panic but unfortunately only the last 25 lines are visible.
> > Possibly (typos are mine)
> >
> >     RIP: 0010:__domain_mapping+0xa7/0x3a0
> >
> > is a hint into the right direction?
> This looks intel_iommu related, can you try boot with
> "intel_iommu=3Doff" in kernel parameter?

Gotcha. System boots up fine then.

    Christoph

--VbJkn9YxBvnuCH5J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEWXMI+726A12MfJXdxCxY61kUkv0FAmCiYKkACgkQxCxY61kU
kv3OtA//ddEx7kYOaHzvJ9W3qeGm1BuDAC6kNguj/roud2NdKWERoVT++17Zbplq
bWic8NQLO5aKdi3hUD6Jn1HJMSuRVf4icnpTPaIpZD3VzS9fAB17owi5UnDlHlRI
P+Vg/bp+CtRMzPpSe4iK9Z/or9BPorej7FdFIMieRmfeqBG3+ZC0geaUfiKhF8Dr
NJmGY+/kPAcJmfy2vfesQ53KL/C6nv9q43oK6pQx0wpieuRRdE2nP0Vu8XQVX73S
op4KDeM43zpzXJnl5CmbGr3EwZARuALMEg0W8jLZDFnFn22ZAaYDS3JlBOLTNQeG
pCUwuijWjgAwV34gKnA5EbMRdqomRMb1d2AAhIKBTPIwdLgygepJChl7m1Mgbru8
eb9Cr0bxam7hVrQea+4GIRnRKynAAAj/GhwRyHqUDscY4xHDiLLlODpyrTlEIvp8
D29QYGDA/onIiv+SKARgm7y7HbvGmgRywPwfxK1cRDVHJ+UCxQ11mA5xVwi9gZxJ
FYAcQTj3LZZNIsw+fFDbDzB2VCLl8NwIMEvoMlE5looOL7QfL9A7nEzn+GfA+FDJ
wafcXOyD+HVOLa3+O5LmZqoodUvn1FoMAYidhof57hqELjmmeWtRRzj7iHxtI5ox
aCarbYOmuSqNfOv3YGPHtX5CA9EyCVFcCUnZUjRxuDZEmhQSGTw=
=53rx
-----END PGP SIGNATURE-----

--VbJkn9YxBvnuCH5J--

--===============2892022558411008029==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
--===============2892022558411008029==--
