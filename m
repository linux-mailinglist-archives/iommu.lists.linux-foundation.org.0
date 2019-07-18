Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D50446CDA6
	for <lists.iommu@lfdr.de>; Thu, 18 Jul 2019 13:45:38 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 7E4F71676;
	Thu, 18 Jul 2019 11:45:37 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 46774164B
	for <iommu@lists.linux-foundation.org>;
	Thu, 18 Jul 2019 11:45:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
	[172.104.155.198])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B42678A0
	for <iommu@lists.linux-foundation.org>;
	Thu, 18 Jul 2019 11:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=NKk1z9eeAZpeVSsCA5XD6xsclz2cwdL0iURWkjA/YF0=;
	b=wlXSOFlWAZaZhPQOl1zJwbMRx
	frcQPj15rPyZEVIl3jhXyGyy0HYkv8Hjp+Yl6V7nF3hQ7A6RVJsMf0IZzdNF5UtaoN+WOWkxRIfTP
	FUbqlP/0b9XHmgjePbatehOO1pe3NMr9rBfuF0tuAi5fXuT7KekyIzN6cyXhKHhFnw4ak=; 
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
	([82.37.168.47] helo=ypsilon.sirena.org.uk)
	by heliosphere.sirena.org.uk with esmtpsa
	(TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
	(envelope-from <broonie@sirena.org.uk>)
	id 1ho4qX-0004yz-3a; Thu, 18 Jul 2019 11:45:13 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
	id 2FE502742C07; Thu, 18 Jul 2019 12:45:12 +0100 (BST)
Date: Thu, 18 Jul 2019 12:45:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [RFC PATCH] regulator: core: Move device_link_remove out from
	regulator_list_mutex
Message-ID: <20190718114512.GA5761@sirena.org.uk>
References: <1563432146-28097-1-git-send-email-yong.wu@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <1563432146-28097-1-git-send-email-yong.wu@mediatek.com>
X-Cookie: Oh, wow!  Look at the moon!
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: youlin.pei@mediatek.com, anan.sun@mediatek.com,
	Nicolas Boichat <drinkcat@chromium.org>, cui.zhang@mediatek.com,
	srv_heupstream@mediatek.com, chao.hao@mediatek.com,
	Robin Murphy <robin.murphy@arm.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Evan Green <evgreen@chromium.org>, linux-kernel@vger.kernel.org,
	Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
	Matthias Kaehlcke <mka@chromium.org>, linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	ming-fan.chen@mediatek.com, Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Content-Type: multipart/mixed; boundary="===============0363130152907946997=="
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org


--===============0363130152907946997==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qDbXVdCdHGoSgWSk"
Content-Disposition: inline


--qDbXVdCdHGoSgWSk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 18, 2019 at 02:42:26PM +0800, Yong Wu wrote:
> The MediaTek SMI adding device_link patch looks reveal a deadlock
> issue reported in [1], This patch is to fix this deadlock issue.

Can you please describe in words what this issue is and how the patch
addresses it?

> This is the detailed log:
>=20
> [    4.664194] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [    4.670368] WARNING: possible circular locking dependency detected
> [    4.676545] 5.2.0-rc2-next-20190528-44527-g6c94b6475c04 #20 Tainted: G=
 S
> [    4.684539] ------------------------------------------------------

Please think hard before including complete backtraces in upstream
reports, they are very large and contain almost no useful information
relative to their size so often obscure the relevant content in your
message. If part of the backtrace is usefully illustrative then it's
usually better to pull out the relevant sections.

> index 955a0a1..3db9350 100644
> --- a/drivers/regulator/core.c
> +++ b/drivers/regulator/core.c
> @@ -2048,7 +2048,9 @@ static void _regulator_put(struct regulator *regula=
tor)
>  	debugfs_remove_recursive(regulator->debugfs);
> =20
>  	if (regulator->dev) {
> +		mutex_unlock(&regulator_list_mutex);
>  		device_link_remove(regulator->dev, &rdev->dev);
> +		mutex_lock(&regulator_list_mutex);
> =20
>  		/* remove any sysfs entries */
>  		sysfs_remove_link(&rdev->dev.kobj, regulator->supply_name);
> --=20
> 1.9.1
>=20

Just randomly dropping and reacquiring the lock in the middle of a
series of operations sounds potentially racy...  What happens if the
list gets changed while the lock is dropped?

--qDbXVdCdHGoSgWSk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0wW8UACgkQJNaLcl1U
h9Duwgf8DrFA6rkNbZWAOQolUO3ScHl7ZIFDMYs/c8IslX851jEG59mVl69AFFdx
OOzfKw4BgDoYJX0pIoCnYGkEyTZgI3m1zWOmb3ceu8UPwxDa2fOeXaXvfRT0C9IP
J4sQe88/NyzcipB6TwzYri4MnDI/dC5cmnHGuiOLWRzLtu9JKLdkyqoHynMk8gy8
RbFiatFKpVgxXz1RCVKulsJ/bZuHAUoa827QErIIzH00XVUSeolXp0k1HOZmbtJe
xrUkA+hvKhCw+cJaft/ifJWyO9+AorM7CGBJvJtSYuqjUp4rB5+Bl4T/8IHVNgtX
rl74RJhGjAjgSzIE+HlBKIiOD1DL8A==
=hW06
-----END PGP SIGNATURE-----

--qDbXVdCdHGoSgWSk--

--===============0363130152907946997==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
--===============0363130152907946997==--
