Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 22AE23E581F
	for <lists.iommu@lfdr.de>; Tue, 10 Aug 2021 12:19:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8B1DD40229;
	Tue, 10 Aug 2021 10:19:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F_8X6UhCWETP; Tue, 10 Aug 2021 10:18:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 69833400EC;
	Tue, 10 Aug 2021 10:18:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 358F2C001F;
	Tue, 10 Aug 2021 10:18:59 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 20BDDC000E
 for <iommu@lists.linux-foundation.org>; Tue, 10 Aug 2021 10:18:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C3B440261
 for <iommu@lists.linux-foundation.org>; Tue, 10 Aug 2021 10:18:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gibson.dropbear.id.au
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k0criMaIZdEM for <iommu@lists.linux-foundation.org>;
 Tue, 10 Aug 2021 10:18:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2B0A34020A
 for <iommu@lists.linux-foundation.org>; Tue, 10 Aug 2021 10:18:52 +0000 (UTC)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GkTSS0p5Qz9sRf; Tue, 10 Aug 2021 20:18:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1628590728;
 bh=sLzUle4HNjbt2dpuzLJ/SCgyEaG1KNFjSdG9/ykRLYo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bE7CtES05Gb33ZZWvfgfzvroh0FvJfb8WbKwzViGUD5LeQNvpQdpBjLHr3/24sjKE
 idwd62N3gx53z8IIFvjSpMJmdpG2PsCBaDejyPRTtyHSVN+DF6VILSwEauB+I9+dYU
 MP3gbRCUPVOCSQu2vvetmvzqO+jHEvU6RMZhlms8=
Date: Tue, 10 Aug 2021 16:10:12 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [RFC v2] /dev/iommu uAPI proposal
Message-ID: <YRIYRI+2qSvX/e2d@yekko>
References: <BN9PR11MB5433B1E4AE5B0480369F97178C189@BN9PR11MB5433.namprd11.prod.outlook.com>
 <YP4/KJoYfbaf5U94@yekko>
 <BN9PR11MB54332594B1B4003AE4B9238C8CEA9@BN9PR11MB5433.namprd11.prod.outlook.com>
 <YQig7EIVMAuzSgH4@yekko>
 <BN9PR11MB54338C2863EA94145710A1BA8CF09@BN9PR11MB5433.namprd11.prod.outlook.com>
 <YQy+ZsCab6Ni/sN7@yekko> <20210806123211.GR1721383@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20210806123211.GR1721383@nvidia.com>
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Jason Wang <jasowang@redhat.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, "Jiang,
 Dave" <dave.jiang@intel.com>, "Raj, Ashok" <ashok.raj@intel.com>,
 Jonathan Corbet <corbet@lwn.net>, "Tian, Kevin" <kevin.tian@intel.com>,
 "parav@mellanox.com" <parav@mellanox.com>,
 "Alex Williamson \(alex.williamson@redhat.com\)" <alex.williamson@redhat.com>,
 "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
 Robin Murphy <robin.murphy@arm.com>, LKML <linux-kernel@vger.kernel.org>,
 Shenming Lu <lushenming@huawei.com>,
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
Content-Type: multipart/mixed; boundary="===============1431197244878920735=="
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>


--===============1431197244878920735==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="odEeZa7MqmWAODkt"
Content-Disposition: inline


--odEeZa7MqmWAODkt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 06, 2021 at 09:32:11AM -0300, Jason Gunthorpe wrote:
> On Fri, Aug 06, 2021 at 02:45:26PM +1000, David Gibson wrote:
>=20
> > Well, that's kind of what I'm doing.  PCI currently has the notion of
> > "default" address space for a RID, but there's no guarantee that other
> > buses (or even future PCI extensions) will.  The idea is that
> > "endpoint" means exactly the (RID, PASID) or (SID, SSID) or whatever
> > future variations are on that.
>=20
> This is already happening in this proposal, it is why I insisted that
> the driver facing API has to be very explicit. That API specifies
> exactly what the device silicon is doing.
>=20
> However, that is placed at the IOASID level. There is no reason to
> create endpoint objects that are 1:1 with IOASID objects, eg for
> PASID.

They're not 1:1 though.  You can have multiple endpoints in the same
IOAS, that's the whole point.

> We need to have clear software layers and responsibilities, I think
> this is where the VFIO container design has fallen behind.
>=20
> The device driver is responsible to delcare what TLPs the device it
> controls will issue

Right.. and I'm envisaging an endpoint as a abstraction to represent a
single TLP.

> The system layer is responsible to determine how those TLPs can be
> matched to IO page tables, if at all
>=20
> The IO page table layer is responsible to map the TLPs to physical
> memory.
>=20
> Each must stay in its box and we should not create objects that smush
> together, say, the device and system layers because it will only make
> a mess of the software design.

I agree... and endpoints are explicitly an attempt to do that.  I
don't see how you think they're smushing things together.

> Since the system layer doesn't have any concrete objects in our
> environment (which is based on devices and IO page tables) it has to
> exist as metadata attached to the other two objects.

Whereas I'm suggesting clarifying this by *creating* concrete objects
to represent the concept we need.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--odEeZa7MqmWAODkt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmESGEQACgkQbDjKyiDZ
s5Ktrg/+MU/OVbhaG0pM1dSjmK1fu9a3jQ3S7egfXHqBCHsGei0mCcWonB4WX71t
JghxefYDxyliljq9AQuZuOG6LmHAr02cy0bPhHlZwnjXnDvHjZcOkcfBMNLdwtAQ
uhUCXkPBq1nH9liPYMPKBsk6skgKuT5kiO4IiQgmptD3qMDUumzdFWU4FlwFtEeJ
izG3YYaqr0v1C8I4zCT5kBibk5EFTWwE/ZvHtaYK9yDjOi4b1X79F2EBR/arNcY3
/Vdq0sdCqKstC3g3az+K5Akdti53oNltLWTnqvFbbpZmPvIhOZ37zScMc1bmjrxf
5icEraXNHQW0dEmi29qZLeqr0cmYXhcrfXnneRCprubUMxdfkMVRA5LxqS0vqBOU
wSoGH1d/3D5BKm6lTpvZCc/QsAyxgwYgX0gxURGKt/CrWOkC+XXXgCO3x1j+xG3V
04k0yMEk+9K9+YT3oxjsdOGThJW0ZNA5fhmBf4I/NxRCtPwldXdIVOC1DdB0iTW1
0XHE3Wvp9yjMpVt6bt1NOt8lfn74aVkWqjDjpEIdyWtGqaJQVgynAozorT/SBIUI
awVwsTosKBG9Paf3L82ZETY8rIPvqJCFu+KgFumeaS5Xyl0z4eUDrnEgNdH9B3mh
QEEffkuuuV9L5zxyp+Ir4OWtE4lNkjkcylCpEpklCV2oVLBKVFI=
=LOUq
-----END PGP SIGNATURE-----

--odEeZa7MqmWAODkt--

--===============1431197244878920735==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
--===============1431197244878920735==--
