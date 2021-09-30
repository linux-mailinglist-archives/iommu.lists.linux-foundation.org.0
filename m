Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id BB85041D227
	for <lists.iommu@lfdr.de>; Thu, 30 Sep 2021 06:19:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1535A40164;
	Thu, 30 Sep 2021 04:19:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u-VmdXBFEVrY; Thu, 30 Sep 2021 04:19:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 034B1402BA;
	Thu, 30 Sep 2021 04:19:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 076C5C0029;
	Thu, 30 Sep 2021 04:19:32 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4B375C000F
 for <iommu@lists.linux-foundation.org>; Thu, 30 Sep 2021 04:19:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2136740781
 for <iommu@lists.linux-foundation.org>; Thu, 30 Sep 2021 04:19:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gibson.dropbear.id.au
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0H75hAudp6GU for <iommu@lists.linux-foundation.org>;
 Thu, 30 Sep 2021 04:19:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F3D6D406E8
 for <iommu@lists.linux-foundation.org>; Thu, 30 Sep 2021 04:19:26 +0000 (UTC)
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HKg4C5Xqmz4xbR; Thu, 30 Sep 2021 14:19:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1632975563;
 bh=7ImM9SI/BFgJ8f/PNNDd6cX2ps2N2DdxQ/FJAtnm3AI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Idy4tPCU0C9XZJC3sZS5E6TqgpCHbbHc++kXGeyUhEGAyEgf7RwUsLnhGvbN+7ICG
 9bhnpFyxwNzypjVu0iWHpWX4St/ADt1yvzX7A7Nd6oKyzFz2nCI8tGdE7osg+O2wcT
 F5ZAMC/Sw/Q7NWWAbjpOcwy9Tv0EBuxv3fPkWtYE=
Date: Thu, 30 Sep 2021 13:10:29 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [RFC 07/20] iommu/iommufd: Add iommufd_[un]bind_device()
Message-ID: <YVUqpff7DUtTLYKx@yekko>
References: <20210919063848.1476776-1-yi.l.liu@intel.com>
 <20210919063848.1476776-8-yi.l.liu@intel.com>
 <YVP44v4FVYJBSEEF@yekko> <20210929122457.GP964074@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20210929122457.GP964074@nvidia.com>
Cc: kvm@vger.kernel.org, jasowang@redhat.com, kwankhede@nvidia.com, hch@lst.de,
 jean-philippe@linaro.org, dave.jiang@intel.com, ashok.raj@intel.com,
 corbet@lwn.net, kevin.tian@intel.com, parav@mellanox.com,
 alex.williamson@redhat.com, lkml@metux.net, dwmw2@infradead.org,
 jun.j.tian@intel.com, linux-kernel@vger.kernel.org, lushenming@huawei.com,
 iommu@lists.linux-foundation.org, pbonzini@redhat.com, robin.murphy@arm.com
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
Content-Type: multipart/mixed; boundary="===============2969572023489593265=="
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>


--===============2969572023489593265==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Cu/fr+k+GRSm6ylg"
Content-Disposition: inline


--Cu/fr+k+GRSm6ylg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 29, 2021 at 09:24:57AM -0300, Jason Gunthorpe wrote:
65;6402;1c> On Wed, Sep 29, 2021 at 03:25:54PM +1000, David Gibson wrote:
>=20
> > > +struct iommufd_device {
> > > +	unsigned int id;
> > > +	struct iommufd_ctx *ictx;
> > > +	struct device *dev; /* always be the physical device */
> > > +	u64 dev_cookie;
> >=20
> > Why do you need both an 'id' and a 'dev_cookie'?  Since they're both
> > unique, couldn't you just use the cookie directly as the index into
> > the xarray?
>=20
> ID is the kernel value in the xarray - xarray is much more efficient &
> safe with small kernel controlled values.
>=20
> dev_cookie is a user assigned value that may not be unique. It's
> purpose is to allow userspace to receive and event and go back to its
> structure. Most likely userspace will store a pointer here, but it is
> also possible userspace could not use it.
>=20
> It is a pretty normal pattern

Hm, ok.  Could you point me at an example?

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Cu/fr+k+GRSm6ylg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFVKqUACgkQbDjKyiDZ
s5IgWQ//cY+/CZBapInqTS3ld5AVvlLP+hYabxO9YGZASIa/ybrzzLE08lmPx5Wy
0ZaXJF0ZAfE0+QEKy6tjsn27oAn7tndELqyh1VnxEjP/aY4U+CAkhzFeJhKwik3y
1INg32pctc1RlMP46DVWhowOl3IRA2mJSchngrYMhEjDUCbkZVpSaf5LgGeh97Yd
mFc5s0+pKiDRgDrKRJP/7A/qg70L5CgpcEKdxhlJKeuYKI0ZkY3anLUzf6WCZw6o
uLRa/mkkdxxrM+obmXkFQjmPn3uTSWYx6uwZn4lOlpPL4JtP6C+raR48kvJZRGfP
ggkJopqLgoSyuPWI/NojfmkjY95yiw6kv/Et7T/ReUzRAuQ7svHEiBnx7i01S/0B
uZrk/8CKzaA+rGXzLv6kHwynFYAXP81e2cN2OXnb7SWtbt9RHOWwBO/waLRKWqvu
HXsrSqVOUsiN8d2NEQihgfkKSqvhWhBEiM7LmBizFriQVnBiH77SoxaerwFarhcJ
8fjQRLnkN4HX/muq9BxQs66FT7NAKu1DmvoX6FWGC710OFLJ+q6jDsCHiXWIsh3X
0cX60iREJUlVwRWdp1bRu7jX4qnnPPOdvLhHPU7VdpDfnhp5834pno/jceOnbZ6O
xkzEtS6ihpTitwvMkyi3fG2uTU9sRdZNGEoXUPJ8D8nTFP+GIJA=
=KaeT
-----END PGP SIGNATURE-----

--Cu/fr+k+GRSm6ylg--

--===============2969572023489593265==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
--===============2969572023489593265==--
