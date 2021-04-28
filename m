Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E7F36D098
	for <lists.iommu@lfdr.de>; Wed, 28 Apr 2021 04:42:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CEB6440539;
	Wed, 28 Apr 2021 02:41:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JCzMnP7H7h1y; Wed, 28 Apr 2021 02:41:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id C973340533;
	Wed, 28 Apr 2021 02:41:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 90941C0001;
	Wed, 28 Apr 2021 02:41:58 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2E5F0C0001
 for <iommu@lists.linux-foundation.org>; Wed, 28 Apr 2021 02:41:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B77C83AC6
 for <iommu@lists.linux-foundation.org>; Wed, 28 Apr 2021 02:41:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gibson.dropbear.id.au
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qSRT1r98Eo5i for <iommu@lists.linux-foundation.org>;
 Wed, 28 Apr 2021 02:41:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 151FD83E29
 for <iommu@lists.linux-foundation.org>; Wed, 28 Apr 2021 02:41:54 +0000 (UTC)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FVNFB4FRJz9srX; Wed, 28 Apr 2021 12:41:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1619577710;
 bh=gE3cwxeK8l52V3mXQ8Xznwj1fLwrrrjLu8KWJT/DX9U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SflghnlghzACtBYRzPNbsCJ+dAV56XMiDSEKz9RA3l5nSe+zufSUmI3DT5EaR/A3T
 BaKjdbudVH0aFttmCtWqp5/X40LE0tVirFJvWdJVJNqXw6uDi46p2SUUxuf/6kS/HU
 f/ygGsxHlo7TvpMhoX7/NxFIL1i96S+MJgESlHkE=
Date: Wed, 28 Apr 2021 10:49:03 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH V4 05/18] iommu/ioasid: Redefine IOASID set and
 allocation APIs
Message-ID: <YIiw/z9ohYavM/aX@yekko.fritz.box>
References: <20210421230301.GP1370958@nvidia.com>
 <20210422111337.6ac3624d@redhat.com>
 <20210422175715.GA1370958@nvidia.com>
 <20210422133747.23322269@redhat.com>
 <20210422200024.GC1370958@nvidia.com>
 <20210422163808.2d173225@redhat.com>
 <20210422233950.GD1370958@nvidia.com>
 <MWHPR11MB1886A98D9176B5571530EF1D8C459@MWHPR11MB1886.namprd11.prod.outlook.com>
 <YIec/Rt7OxvfFw7W@yekko.fritz.box>
 <20210427163954.GC1370958@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20210427163954.GC1370958@nvidia.com>
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, "Tian,
 Kevin" <kevin.tian@intel.com>, "Jiang, Dave" <dave.jiang@intel.com>, "Raj,
 Ashok" <ashok.raj@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>,
 Li Zefan <lizefan@huawei.com>, LKML <linux-kernel@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Tejun Heo <tj@kernel.org>,
 "cgroups@vger.kernel.org" <cgroups@vger.kernel.org>, "Wu,
 Hao" <hao.wu@intel.com>, David Woodhouse <dwmw2@infradead.org>
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
Content-Type: multipart/mixed; boundary="===============5314751764645407014=="
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>


--===============5314751764645407014==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JQRVQfh5FhbBFvT+"
Content-Disposition: inline


--JQRVQfh5FhbBFvT+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 27, 2021 at 01:39:54PM -0300, Jason Gunthorpe wrote:
> On Tue, Apr 27, 2021 at 03:11:25PM +1000, David Gibson wrote:
>=20
> > > So your proposal sort of moves the entire container/group/domain=20
> > > managment into /dev/ioasid and then leaves vfio only provide device
> > > specific uAPI. An ioasid represents a page table (address space), thu=
s=20
> > > is equivalent to the scope of VFIO container.
> >=20
> > Right.  I don't really know how /dev/iosasid is supposed to work, and
> > so far I don't see how it conceptually differs from a container.  What
> > is it adding?
>=20
> There are three motivating topics:
>  1) /dev/vfio/vfio is only usable by VFIO and we have many interesting
>     use cases now where we need the same thing usable outside VFIO
>  2) /dev/vfio/vfio does not support modern stuff like PASID and
>     updating to support that is going to be a big change, like adding
>     multiple IOASIDs so they can be modeled as as a tree inside a
>     single FD
>  3) I understand there is some desire to revise the uAPI here a bit,
>     ie Alex mentioned the poor mapping performance.
>=20
> I would say it is not conceptually different from what VFIO calls a
> container, it is just a different uAPI with the goal to be cross
> subsystem.

Ok, that makes sense.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--JQRVQfh5FhbBFvT+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCIsP8ACgkQbDjKyiDZ
s5LRgBAAnUYT4mzHS9z12bEDDjxIJlNISL9eC8ubKY8SIUm+mchxLYgEY3wAkoJL
eFglIjrPvJD6R2vnpBVT9z8SNbHHULxTcVcLbhb1M0Qf5TrzniLGaBfdJbrgxomz
lMTL3xTJ/djQcAeE4ulfQheA5Rh5OMmEmrFgzUUkI0y2aHK04YCyjxnxFYMSmIje
ECTKFFl4sCwH6d7mDfOvz0CcelTIuI4OvpaFPw8jdKCv8rhF56C0En63sSdrGDIm
iU2d/im/d4d7cnQfUHtcdw9neI4ia2NNYf2tIzLz2Ow9TBavv3VaeHMjUKQueKTE
Adk6pdb9yZxeKurPYFoU9Cm1mhi4zbd+K48TGAexE57xCDWSEZcr44nM4ALv8YjC
6ZCU67IEM+J/uM0XYyv99G/ctqQeyQRRw9VtxT2sM/qBiI3S+t+S80LcFXV63La9
uP/5VvEe+C5+yMatJxFkdMQ92djhlFqFFnu84vhJnQX0U9zJvEx2XvSpoc/cxOUj
uORn3Pex3YVOoh8SSIM8eJOEZxYy/Zk0EMZgP1Ub0zgD2PaS1DUqYgkVNslUZ1qs
qhkZttZsxvwsPKBLXoSSarYj6h25ic6a8vGr/GMPxZJ6EDHuivzkqsJY0owcdIus
AlCuTBNJvmY/5OUSao/MZ/XrbOXP/hCgYagOjMsTsudi3e/WYp8=
=hSc/
-----END PGP SIGNATURE-----

--JQRVQfh5FhbBFvT+--

--===============5314751764645407014==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
--===============5314751764645407014==--
