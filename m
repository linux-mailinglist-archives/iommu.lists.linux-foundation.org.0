Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E8245AC4
	for <lists.iommu@lfdr.de>; Fri, 14 Jun 2019 12:43:08 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 8389211E5;
	Fri, 14 Jun 2019 10:43:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 303A1115E
	for <iommu@lists.linux-foundation.org>;
	Fri, 14 Jun 2019 10:43:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from pokefinder.org (sauhun.de [88.99.104.3])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id A8F04174
	for <iommu@lists.linux-foundation.org>;
	Fri, 14 Jun 2019 10:43:05 +0000 (UTC)
Received: from localhost (p5486CF81.dip0.t-ipconnect.de [84.134.207.129])
	by pokefinder.org (Postfix) with ESMTPSA id 9DB202CF690;
	Fri, 14 Jun 2019 12:42:57 +0200 (CEST)
Date: Fri, 14 Jun 2019 12:42:52 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [RFC PATCH v6 5/5] mmc: queue: Use bigger segments if IOMMU can
	merge the segments
Message-ID: <20190614104252.GA2245@kunai>
References: <1560421215-10750-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
	<1560421215-10750-6-git-send-email-yoshihiro.shimoda.uh@renesas.com>
	<20190614072459.GD8420@lst.de>
MIME-Version: 1.0
In-Reply-To: <20190614072459.GD8420@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: axboe@kernel.dk, linux-renesas-soc@vger.kernel.org, ulf.hansson@linaro.org,
	linux-mmc@vger.kernel.org, linux-block@vger.kernel.org,
	wsa+renesas@sang-engineering.com, iommu@lists.linux-foundation.org
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
Content-Type: multipart/mixed; boundary="===============5266369396665431993=="
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org


--===============5266369396665431993==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OXfL5xGRrasGEqWY"
Content-Disposition: inline


--OXfL5xGRrasGEqWY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > +		host->can_merge =3D 1;
> > +	else
> > +		host->can_merge =3D 0;
> > +
>=20
> can_merge seems a little too generic a name to me.  Maybe can_iommu_merge?

Ack.


--OXfL5xGRrasGEqWY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0DeicACgkQFA3kzBSg
Kbai+A//TXe/UTCawLN26OjHt2UucUCPMqPhYULQbICoNMwgmVUqX54DWzikDx5o
A9NBpSff++FwU4hkdh80DQfdR4//S3uTQZnf0ZlND4AGFLKOCCSdZwsDCg3o8sAe
/Oc4pJa8BPV2W72PVKyZK+qFw5e5GFzC9jehlDHVWSI3/w08lICPzX2ogz5teYVn
8cmYjuaj9y6gibmMbRj/rgv3WvGn1jr2rjc+ekpZS5V/YlYqeUI3/5fp7n4Bit8X
OVQBXCcf6Z5oqVs+tio/MhA801qPykJvCwIrnsN9FN4P1C2iUZ72ynZ9z47jfxp2
MHAyV0h7glizA51S0YUqqW9ZeUIp2EKO6rPULVDlu4vxLtbELU0y8Yp5WmB6aJ4L
dRXpygqseWNgf9MlCFTT56L2VVVFnty/3Bm0f/LNiA+98XM103+bUsk3Y9nU9GnS
SBUEQbxyBnIt2JDhS978XAQWWNcy1Q1cyfj4Y4ywGatkCip7RjXC8jl2YQmOF7c9
sf+FIrEziEJKfWWXjtbz8NeWHFMsIt1GbP3+ICCgykgU5jrtGMhE8Xr/w1GV4RQ6
MPMdY2g9BwHGr27IVqCK0cHjs6mT4VRCH5NOEDdakN3FOmTXwFLsMEo2TXiSPjPa
TMMucF0Vlrt8S5/SuQQfz5L5JTRsr7RzLbOiV4mzDi00znetCwM=
=nycl
-----END PGP SIGNATURE-----

--OXfL5xGRrasGEqWY--

--===============5266369396665431993==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
--===============5266369396665431993==--
