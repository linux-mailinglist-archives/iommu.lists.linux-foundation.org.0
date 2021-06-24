Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E58A3B2682
	for <lists.iommu@lfdr.de>; Thu, 24 Jun 2021 06:52:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 393F2608FB;
	Thu, 24 Jun 2021 04:52:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3_5PkgCCYcAE; Thu, 24 Jun 2021 04:52:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 3C2676086F;
	Thu, 24 Jun 2021 04:52:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 51EA6C001A;
	Thu, 24 Jun 2021 04:52:35 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1F2DBC000E
 for <iommu@lists.linux-foundation.org>; Thu, 24 Jun 2021 04:52:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F31354065A
 for <iommu@lists.linux-foundation.org>; Thu, 24 Jun 2021 04:52:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gibson.dropbear.id.au
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 409Hg9nGc__G for <iommu@lists.linux-foundation.org>;
 Thu, 24 Jun 2021 04:52:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C7D8C406A0
 for <iommu@lists.linux-foundation.org>; Thu, 24 Jun 2021 04:52:28 +0000 (UTC)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4G9SRT4pGKz9t0T; Thu, 24 Jun 2021 14:52:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1624510341;
 bh=Y1ZXO4GOKwiZGQOUSkU62M3QSVIF13l7lSRYG/A5sd4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ihu3DMzkLAV+wjtqkkh/A0N7zBO2qjXvqPIoL5l26qdg3N4Fpa6+Mg5QnLEYJ36C+
 E8IfzU/O8tDq34n9NEkU4Ui+voj839ng2PR0r2T7a4WXMpZu1iaIyq/8aMRgwfYmkI
 F42I0a7ZNBzG+9PEbFmvHo8VbdxCQQktyxyZcIDM=
Date: Thu, 24 Jun 2021 14:29:29 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: Plan for /dev/ioasid RFC v2
Message-ID: <YNQKKSb3onBCz+f6@yekko>
References: <20210612105711.7ac68c83.alex.williamson@redhat.com>
 <20210614140711.GI1002214@nvidia.com>
 <20210614102814.43ada8df.alex.williamson@redhat.com>
 <MWHPR11MB1886239C82D6B66A732830B88C309@MWHPR11MB1886.namprd11.prod.outlook.com>
 <20210615101215.4ba67c86.alex.williamson@redhat.com>
 <MWHPR11MB188692A6182B1292FADB3BDB8C0F9@MWHPR11MB1886.namprd11.prod.outlook.com>
 <20210616133937.59050e1a.alex.williamson@redhat.com>
 <MWHPR11MB18865DF9C50F295820D038798C0E9@MWHPR11MB1886.namprd11.prod.outlook.com>
 <YMykBzUHmATPbmdV@8bytes.org> <20210618151506.GG1002214@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20210618151506.GG1002214@nvidia.com>
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Jason Wang <jasowang@redhat.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, "Jiang,
 Dave" <dave.jiang@intel.com>, "Raj, Ashok" <ashok.raj@intel.com>,
 Jonathan Corbet <corbet@lwn.net>, "Tian, Kevin" <kevin.tian@intel.com>,
 "parav@mellanox.com" <parav@mellanox.com>,
 Alex Williamson <alex.williamson@redhat.com>, "Enrico Weigelt,
 metux IT consult" <lkml@metux.net>, Robin Murphy <robin.murphy@arm.com>,
 LKML <linux-kernel@vger.kernel.org>, Shenming Lu <lushenming@huawei.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Paolo Bonzini <pbonzini@redhat.com>, David Woodhouse <dwmw2@infradead.org>
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
Content-Type: multipart/mixed; boundary="===============0096716067666541159=="
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>


--===============0096716067666541159==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yLEcQ6F0C4xJHQpz"
Content-Disposition: inline


--yLEcQ6F0C4xJHQpz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 18, 2021 at 12:15:06PM -0300, Jason Gunthorpe wrote:
> On Fri, Jun 18, 2021 at 03:47:51PM +0200, Joerg Roedel wrote:
> > Hi Kevin,
> >=20
> > On Thu, Jun 17, 2021 at 07:31:03AM +0000, Tian, Kevin wrote:
> > > Now let's talk about the new IOMMU behavior:
> > >=20
> > > -   A device is blocked from doing DMA to any resource outside of
> > >     its group when it's probed by the IOMMU driver. This could be a
> > >     special state w/o attaching to any domain, or a new special domain
> > >     type which differentiates it from existing domain types (identity=
,=20
> > >     dma, or unmanged). Actually existing code already includes a
> > >     IOMMU_DOMAIN_BLOCKED type but nobody uses it.
> >=20
> > There is a reason for the default domain to exist: Devices which require
> > RMRR mappings to be present. You can't just block all DMA from devices
> > until a driver takes over, we put much effort into making sure there is
> > not even a small window in time where RMRR regions (unity mapped regions
> > on AMD) are not mapped.
>=20
> Yes, I think the DMA blocking can only start around/after a VFIO type
> driver has probed() and bound to a device in the group, not much
> different from today.

But as I keep saying, some forms of grouping (and DMA aliasing as Alex
mentioned) mean that changing the domain of one device can change the
domain of another device, unavoidably.  It may be rare with modern
hardware, but we still can't ignore the case.

Which means you can't DMA block until everything in the group is
managed by a vfio-like driver.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--yLEcQ6F0C4xJHQpz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDUCikACgkQbDjKyiDZ
s5LTyA//bJpWtaDHUtdmpyHIrjTXkhO/p0T3/Me6MMC2aA3PiMYgq5mOYQ8rJEfX
7kRqkNMRDLOjachD429QvNosQGm8ImsLOK7SRLQeE9BMBYB6IU7G8ig+jpTsRbRT
qmKFuoqWalvFrP9Mct8HLY3SjT/lXke7356q11hjhKMVRWNdmwZSsX6rak8+N+cy
sQI9Y/ZtjJVSYYA8e/FQOSsMW4AnQpDCNCQhDEU0Do6MJ+Epf92C4BiDQnBprrBJ
GuZaoRA3tlUKb1wUYcyG1piE8aAWGUyVNxGR0h7P6CQ9qR1mLugUPEJLwS8J6ZFD
h50XuLB9SD1WynaS3onyvugDSP8EPdnei+nAHQqyOs97zZksy6j+/066OslhEhWw
OIMQbIC+f9WHHBABG7g4g8ZCQUY9jYPvw23gjyWDHuyQtqrCXRUE8O/9kn6fQbBM
0jcZUEyvq5RiSnfnP3+Ja6z0bj6BL83IYkUIrVKJFwY4c19HwTk5cqYqU+lG2PRg
hv212bYgICZXJ4QZBbzqR/1Jc5maQB/tc0LYiyrtc4GagrUOuchgN3T9mmNKe+IV
widXRoL/4ntxuPzZnUhgcOjpHAVxC2wkv3aAfLcRVDTfu7xfU29YW84cSHbCulHK
FZ6zhyeEY818TljNrE8LY6iCyUJqLINRaIC97bqzCvxkquXvQF4=
=pdCD
-----END PGP SIGNATURE-----

--yLEcQ6F0C4xJHQpz--

--===============0096716067666541159==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
--===============0096716067666541159==--
