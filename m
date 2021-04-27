Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id D238736BEE3
	for <lists.iommu@lfdr.de>; Tue, 27 Apr 2021 07:25:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3BC1783B97;
	Tue, 27 Apr 2021 05:25:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rJOvjBOxggBg; Tue, 27 Apr 2021 05:25:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0642083B95;
	Tue, 27 Apr 2021 05:25:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CA0CAC001C;
	Tue, 27 Apr 2021 05:25:24 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3A5F4C000B
 for <iommu@lists.linux-foundation.org>; Tue, 27 Apr 2021 05:25:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0F97A40523
 for <iommu@lists.linux-foundation.org>; Tue, 27 Apr 2021 05:25:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gibson.dropbear.id.au
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uk1H481LDBM7 for <iommu@lists.linux-foundation.org>;
 Tue, 27 Apr 2021 05:25:21 +0000 (UTC)
X-Greylist: delayed 00:10:02 by SQLgrey-1.8.0
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7C4244026B
 for <iommu@lists.linux-foundation.org>; Tue, 27 Apr 2021 05:25:21 +0000 (UTC)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FTqhc4LFBz9sWp; Tue, 27 Apr 2021 15:15:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1619500512;
 bh=lizq0Lqzk2EatXUb5ZFVvKnpEnSogf59im7Exk+3MPA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jcY2jCsPOBsYdlM8j/+8TOq2KUcw+m57VNKG0HsIhkcecy2IQIZqsYxOcmH+mrWky
 ZknFgql+wqVm/22DOiFpk2ra+0KooJkBzd1KdaylbIyixMESaoLZl2G+aV4KIvHiVa
 dwC0og3GmGtfM/27Gx0t5urtnl98Tl/mJBI8PD2k=
Date: Tue, 27 Apr 2021 15:11:25 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH V4 05/18] iommu/ioasid: Redefine IOASID set and
 allocation APIs
Message-ID: <YIec/Rt7OxvfFw7W@yekko.fritz.box>
References: <20210421175203.GN1370958@nvidia.com>
 <20210421133312.15307c44@redhat.com>
 <20210421230301.GP1370958@nvidia.com>
 <20210422111337.6ac3624d@redhat.com>
 <20210422175715.GA1370958@nvidia.com>
 <20210422133747.23322269@redhat.com>
 <20210422200024.GC1370958@nvidia.com>
 <20210422163808.2d173225@redhat.com>
 <20210422233950.GD1370958@nvidia.com>
 <MWHPR11MB1886A98D9176B5571530EF1D8C459@MWHPR11MB1886.namprd11.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <MWHPR11MB1886A98D9176B5571530EF1D8C459@MWHPR11MB1886.namprd11.prod.outlook.com>
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Li Zefan <lizefan@huawei.com>, "Jiang, Dave" <dave.jiang@intel.com>, "Raj,
 Ashok" <ashok.raj@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>,
 LKML <linux-kernel@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Alex Williamson <alex.williamson@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
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
Content-Type: multipart/mixed; boundary="===============6110362499262301655=="
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>


--===============6110362499262301655==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5hGoi/nk34Eem4E7"
Content-Disposition: inline


--5hGoi/nk34Eem4E7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 23, 2021 at 10:31:46AM +0000, Tian, Kevin wrote:
> > From: Jason Gunthorpe <jgg@nvidia.com>
> > Sent: Friday, April 23, 2021 7:40 AM
> >=20
> > On Thu, Apr 22, 2021 at 04:38:08PM -0600, Alex Williamson wrote:
> >=20
> > > Because it's fundamental to the isolation of the device?  What you're
> > > proposing doesn't get around the group issue, it just makes it implic=
it
> > > rather than explicit in the uapi.
> >=20
> > I'm not even sure it makes it explicit or implicit, it just takes away
> > the FD.
> >=20
> > There are four group IOCTLs, I see them mapping to /dev/ioasid follows:
> >  VFIO_GROUP_GET_STATUS -
> >    + VFIO_GROUP_FLAGS_CONTAINER_SET is fairly redundant
> >    + VFIO_GROUP_FLAGS_VIABLE could be in a new sysfs under
> >      kernel/iomm_groups, or could be an IOCTL on /dev/ioasid
> >        IOASID_ALL_DEVICES_VIABLE
> >=20
> >  VFIO_GROUP_SET_CONTAINER -
> >    + This happens implicitly when the device joins the IOASID
> >      so it gets moved to the vfio_device FD:
> >       ioctl(vifo_device_fd, JOIN_IOASID_FD, ioasifd)
> >=20
> >  VFIO_GROUP_UNSET_CONTAINER -
> >    + Also moved to the vfio_device FD, opposite of JOIN_IOASID_FD
> >=20
> >  VFIO_GROUP_GET_DEVICE_FD -
> >    + Replaced by opening /dev/vfio/deviceX
> >      Learn the deviceX which will be the cdev sysfs shows as:
> >       /sys/devices/pci0000:00/0000:00:01.0/0000:01:00.0/vfio/deviceX/dev
> >     Open /dev/vfio/deviceX
> >=20
> > > > How do we model the VFIO group security concept to something like
> > > > VDPA?
> > >
> > > Is it really a "VFIO group security concept"?  We're reflecting the
> > > reality of the hardware, not all devices are fully isolated.
> >=20
> > Well, exactly.
> >=20
> > /dev/ioasid should understand the group concept somehow, otherwise it
> > is incomplete and maybe even security broken.
> >=20
> > So, how do I add groups to, say, VDPA in a way that makes sense? The
> > only answer I come to is broadly what I outlined here - make
> > /dev/ioasid do all the group operations, and do them when we enjoin
> > the VDPA device to the ioasid.
> >=20
> > Once I have solved all the groups problems with the non-VFIO users,
> > then where does that leave VFIO? Why does VFIO need a group FD if
> > everyone else doesn't?
> >=20
> > > IOMMU group.  This is the reality that any userspace driver needs to
> > > play in, it doesn't magically go away because we drop the group file
> > > descriptor.
> >=20
> > I'm not saying it does, I'm saying it makes the uAPI more regular and
> > easier to fit into /dev/ioasid without the group FD.
> >=20
> > > It only makes the uapi more difficult to use correctly because
> > > userspace drivers need to go outside of the uapi to have any idea
> > > that this restriction exists.
> >=20
> > I don't think it makes any substantive difference one way or the
> > other.
> >=20
> > With the group FD: the userspace has to read sysfs, find the list of
> > devices in the group, open the group fd, create device FDs for each
> > device using the name from sysfs.
> >=20
> > Starting from a BDF the general pseudo code is
> >  group_path =3D readlink("/sys/bus/pci/devices/BDF/iommu_group")
> >  group_name =3D basename(group_path)
> >  group_fd =3D open("/dev/vfio/"+group_name)
> >  device_fd =3D ioctl(VFIO_GROUP_GET_DEVICE_FD, BDF);
> >=20
> > Without the group FD: the userspace has to read sysfs, find the list
> > of devices in the group and then open the device-specific cdev (found
> > via sysfs) and link them to a /dev/ioasid FD.
> >=20
> > Starting from a BDF the general pseudo code is:
> >  device_name =3D first_directory_of("/sys/bus/pci/devices/BDF/vfio/")
> >  device_fd =3D open("/dev/vfio/"+device_name)
> >  ioasidfd =3D open("/dev/ioasid")
> >  ioctl(device_fd, JOIN_IOASID_FD, ioasidfd)
> >=20
> > These two routes can have identical outcomes and identical security
> > checks.
> >=20
> > In both cases if userspace wants a list of BDFs in the same group as
> > the BDF it is interested in:
> >    readdir("/sys/bus/pci/devices/BDF/iommu_group/devices")
> >=20
> > It seems like a very small difference to me.
> >=20
> > I still don't see how the group restriction gets surfaced to the
> > application through the group FD. The applications I looked through
> > just treat the group FD as a step on their way to get the device_fd.
> >=20
>=20
> So your proposal sort of moves the entire container/group/domain=20
> managment into /dev/ioasid and then leaves vfio only provide device
> specific uAPI. An ioasid represents a page table (address space), thus=20
> is equivalent to the scope of VFIO container.

Right.  I don't really know how /dev/iosasid is supposed to work, and
so far I don't see how it conceptually differs from a container.  What
is it adding?

> Having the device join=20
> an ioasid is equivalent to attaching a device to VFIO container, and=20
> here the group integrity must be enforced. Then /dev/ioasid anyway=20
> needs to manage group objects and their association with ioasid and=20
> underlying iommu domain thus it's pointless to keep same logic within
> VFIO. Is this understanding correct?
>=20
> btw one remaining open is whether you expect /dev/ioasid to be=20
> associated with a single iommu domain, or multiple. If only a single=20
> domain is allowed, the ioasid_fd is equivalent to the scope of VFIO=20
> container. It is supposed to have only one gpa_ioasid_id since one=20
> iommu domain can only have a single 2nd level pgtable. Then all other=20
> ioasids, once allocated, must be nested on this gpa_ioasid_id to fit=20
> in the same domain. if a legacy vIOMMU is exposed (which disallows=20
> nesting), the userspace has to open an ioasid_fd for every group.=20
> This is basically the VFIO way. On the other hand if multiple domains=20
> is allowed, there could be multiple ioasid_ids each holding a 2nd level=
=20
> pgtable and an iommu domain (or a list of pgtables and domains due to
> incompatibility issue as discussed in another thread), and can be
> nested by other ioasids respectively. The application only needs
> to open /dev/ioasid once regardless of whether vIOMMU allows=20
> nesting, and has a single interface for ioasid allocation. Which way
> do you prefer to?
>=20
> Thanks
> Kevin
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--5hGoi/nk34Eem4E7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCHnP0ACgkQbDjKyiDZ
s5L5PA//flrkhubXpzoBZLXretbuwbZdUJYevrg1C05Pn5HLMCWFgxykm2UTfz6J
GgJJL+svAh1JSvHAF5WaZ0QzVBlZ1+sG9DfUuPq/yHRvLZAORVfmxNK87zSTRYgj
pDl6ljMLTDjFmRNHz+mQ/y+9wyYQYId2b5f6YPvaozYCzkHiqyJTJN4dYOKZMH4J
pSWePF+aNQWOOczobz91r5K56RFIgE0qTD3vuir4uZomZuU3jxVp+uhpaozXmZNz
kboJ6gJCFQBxS90a568lzgjYXPS7OTKSIwJkFp1YoDI0LmxyP3SYC3RsiAcBT7xl
PAhpukBdxaosIB0iC0c63a2n5WaSVyKn5lShqC0dhNw6x1rKRbv27yBLe/vjTLPt
D5RQTP29btV2Qc+9u1xlbHYsYwzRjWR3n81EgxzYhv6Y8FHfEwc8zR4RuEI1Xb2y
gRkOGmoY6DyxelHIn8y1/O6N4Ep2fXNKWFhmk/yE5yY7gFmp/Ih4Blq7UaT68hb5
TzykrI5dyY/hZ5/LK9wjlzA1jFIlJtMsUtyn2olebNchLGWGQpgkNmXx011clAQu
n0sfpD0LWbHVVJmBTqprCIcNYcWj18wZiJ83HI/+bOcosJHCA4dHsyYoXA1BeXbn
hy3SOielHLZ31fcGGA3NBcvIgynHPHYZ1eNKerIzMt4/5V83w2w=
=6qQG
-----END PGP SIGNATURE-----

--5hGoi/nk34Eem4E7--

--===============6110362499262301655==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
--===============6110362499262301655==--
