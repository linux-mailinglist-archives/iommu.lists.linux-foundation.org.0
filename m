Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F1D3AAD50
	for <lists.iommu@lfdr.de>; Thu, 17 Jun 2021 09:22:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8944415D6;
	Thu, 17 Jun 2021 07:22:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8TOddAPo3JOw; Thu, 17 Jun 2021 07:22:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 2181441607;
	Thu, 17 Jun 2021 07:22:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 56C3DC0028;
	Thu, 17 Jun 2021 07:22:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 30FE9C000E
 for <iommu@lists.linux-foundation.org>; Thu, 17 Jun 2021 07:22:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1226640623
 for <iommu@lists.linux-foundation.org>; Thu, 17 Jun 2021 07:22:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gibson.dropbear.id.au
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HZjRwLmJxDZS for <iommu@lists.linux-foundation.org>;
 Thu, 17 Jun 2021 07:22:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F24DC40618
 for <iommu@lists.linux-foundation.org>; Thu, 17 Jun 2021 07:22:09 +0000 (UTC)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4G5D5W4m10z9sRf; Thu, 17 Jun 2021 17:22:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1623914527;
 bh=KPajcMAMYS8Yfe/JJX11FqJOSDGerFBr3TJOBgH8r68=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kuL7dga/NS8HBjdDpUHbhBDJLwru+EcSUusoud/ZqNsxtN6McVoU1aPmi5aqfpSa1
 O+sXER0PNoL3fuhafS3I0F8PBItYc7PHxp1IJRUZ83sNBrmMP3MfXaqTP+Y807nugj
 iI4p5g6sBalxk8aPwkk2Y3juVnwxsASz2oJ6nV5w=
Date: Thu, 17 Jun 2021 13:00:14 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [RFC] /dev/ioasid uAPI proposal
Message-ID: <YMq6voIhXt7guI+W@yekko>
References: <MWHPR11MB1886422D4839B372C6AB245F8C239@MWHPR11MB1886.namprd11.prod.outlook.com>
 <20210528195839.GO1002214@nvidia.com> <YLcpw5Kx61L7TVmR@yekko>
 <20210602165838.GA1002214@nvidia.com> <YLhsZRc72aIMZajz@yekko>
 <YLn/SJtzuJopSO2x@myrica> <YL8O1pAlg1jtHudn@yekko>
 <YMI/yynDsX/aaG8T@myrica>
MIME-Version: 1.0
In-Reply-To: <YMI/yynDsX/aaG8T@myrica>
Cc: "Tian, Kevin" <kevin.tian@intel.com>,
 "Alex Williamson \(alex.williamson@redhat.com\)"
 <alex.williamson@redhat.com>, "Raj, Ashok" <ashok.raj@intel.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Robin Murphy <robin.murphy@arm.com>, LKML <linux-kernel@vger.kernel.org>,
 Kirti Wankhede <kwankhede@nvidia.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Jason Gunthorpe <jgg@nvidia.com>, "Jiang, Dave" <dave.jiang@intel.com>,
 David Woodhouse <dwmw2@infradead.org>, Jason Wang <jasowang@redhat.com>
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
Content-Type: multipart/mixed; boundary="===============5157636145093639958=="
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>


--===============5157636145093639958==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="blc09Nf686sGRVxV"
Content-Disposition: inline


--blc09Nf686sGRVxV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 10, 2021 at 06:37:31PM +0200, Jean-Philippe Brucker wrote:
> On Tue, Jun 08, 2021 at 04:31:50PM +1000, David Gibson wrote:
> > For the qemu case, I would imagine a two stage fallback:
> >=20
> >     1) Ask for the exact IOMMU capabilities (including pagetable
> >        format) that the vIOMMU has.  If the host can supply, you're
> >        good
> >=20
> >     2) If not, ask for a kernel managed IOAS.  Verify that it can map
> >        all the IOVA ranges the guest vIOMMU needs, and has an equal or
> >        smaller pagesize than the guest vIOMMU presents.  If so,
> >        software emulate the vIOMMU by shadowing guest io pagetable
> >        updates into the kernel managed IOAS.
> >=20
> >     3) You're out of luck, don't start.
> >    =20
> > For both (1) and (2) I'd expect it to be asking this question *after*
> > saying what devices are attached to the IOAS, based on the virtual
> > hardware configuration.  That doesn't cover hotplug, of course, for
> > that you have to just fail the hotplug if the new device isn't
> > supportable with the IOAS you already have.
>=20
> Yes. So there is a point in time when the IOAS is frozen, and cannot take
> in new incompatible devices. I think that can support the usage I had in
> mind. If the VMM (non-QEMU, let's say) wanted to create one IOASID FD per
> feature set it could bind the first device, freeze the features, then bind

Are you thinking of this "freeze the features" as an explicitly
triggered action?  I have suggested that an explicit "ENABLE" step
might be useful, but that hasn't had much traction from what I've
seen.

> the second device. If the second bind fails it creates a new FD, allowing
> to fall back to (2) for the second device while keeping (1) for the first
> device. A paravirtual IOMMU like virtio-iommu could easily support this as
> it describes pIOMMU properties for each device to the guest. An emulated
> vIOMMU could also support some hybrid cases as you describe below.

Eh.. in some cases.  The vIOMMU model will often dictate what guest
side devices need to share an an address space, which may make it very
impractical to have them in different address spaces on the host side.

> > One can imagine optimizations where for certain intermediate cases you
> > could do a lighter SW emu if the host supports a model that's close to
> > the vIOMMU one, and you're able to trap and emulate the differences.
> > In practice I doubt anyone's going to have time to look for such cases
> > and implement the logic for it.
> >=20
> > > For example depending whether the hardware IOMMU is SMMUv2 or SMMUv3,=
 that
> > > completely changes the capabilities offered to the guest (some v2
> > > implementations support nesting page tables, but never PASID nor PRI
> > > unlike v3.) The same vIOMMU could support either, presenting different
> > > capabilities to the guest, even multiple page table formats if we wan=
ted
> > > to be exhaustive (SMMUv2 supports the older 32-bit descriptor), but it
> > > needs to know early on what the hardware is precisely. Then some new =
page
> > > table format shows up and, although the vIOMMU can support that in
> > > addition to older ones, QEMU will have to pick a single one, that it
> > > assumes the guest knows how to drive?
> > >=20
> > > I think once it binds a device to an IOASID fd, QEMU will want to pro=
be
> > > what hardware features are available before going further with the vI=
OMMU
> > > setup (is there PASID, PRI, which page table formats are supported,
> > > address size, page granule, etc). Obtaining precise information about=
 the
> > > hardware would be less awkward than trying different configurations u=
ntil
> > > one succeeds. Binding an additional device would then fail if its pIO=
MMU
> > > doesn't support exactly the features supported for the first device,
> > > because we don't know which ones the guest will choose. QEMU will hav=
e to
> > > open a new IOASID fd for that device.
> >=20
> > No, this fundamentally misunderstands the qemu model.  The user
> > *chooses* the guest visible platform, and qemu supplies it or fails.
> > There is no negotiation with the guest, because this makes managing
> > migration impossibly difficult.
>=20
> I'd like to understand better where the difficulty lies, with migration.
> Is the problem, once we have a guest running on physical machine A, to
> make sure that physical machine B supports the same IOMMU properties
> before migrating the VM over to B?  Why can't QEMU (instead of the user)
> select a feature set on machine A, then when time comes to migrate, query
> all information from the host kernel on machine B and check that it
> matches what was picked for machine A?  Or is it only trying to
> accommodate different sets of features between A and B, that would be too
> difficult?

There are two problems

1) Although it could be done in theory, it's hard, and it would need a
huge rewrite to qemu's whole migration infrastructure to do this.
We'd need a way of representing host features, working out which sets
are compatible with which others depending on what things the guest is
allowed to use, encoding the information in the migration stream and
reporting failure.  None of this exists now.

Indeed qemu requires that you create the (stopped) machine on the
destination (including virtual hardware configuration) before even
attempting to process the incoming migration.  It does not for the
most part transfer the machine configuration in the migration stream.
Now, that's generally considered a flaw with the design, but fixing it
is a huge project that no-one's really had the energy to begin despite
the idea being around for years.

2) It makes behaviour really hard to predict for management layers
above.  Things like oVirt automatically migrate around a cluster for
load balancing.  At the moment the model which works is basically that
you if you request the same guest features on each end of the
migration, and qemu starts with that configuration on each end, the
migration should work (or only fail for transient reasons).  If you
can't know if the migration is possible until you get the incoming
stream, reporting and exposing what will and won't work to the layer
above also becomes an immensely fiddly problem.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--blc09Nf686sGRVxV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDKurwACgkQbDjKyiDZ
s5I3jw/8CRP8drcUyfPvxp3OOOIbOp8H/Bwmssu/sVjLDGuMvXGL2fbC721b8cLF
WDQ9ybAoVC+li8CrMJqdI2IIZVp7+qgUrgA+RfjzaXKIiNJprv6BZIeVfDrwuwfR
mYcYNHcxTrQEFaOV3MI/p1+Al99Ds+jYhqvNok3mnX104PFW1u/HCujZ5Hbs6M0+
mqBJcBfGzqn1AglHNq+PSmaRgll2tY0UQubaf+IdkIj7W2hFgjJKFjSglF65e2J0
3XZyoQkKBV9LVgtQ4e+CZjaphPdsIP1Z/jd1MlbR6PH8fdRN/HRh8t67HFl7lmlk
7lcwRJFgTbhrkTSRHwtTbVDMJpMcYq3vg0/3YUELH4b0lVXhz8tr7LV2c3a2oawE
H+4VYIDt7oH5e9t9BHrVlXYxkd42xzMQ3tloo0iCGyyPO8997KKS/Gi+jquNEwEb
Zv+PwOVMz0uCJCWnduw2RdFf326kzWkVy5iM2N0Ks1Lafj29EP3Bxmy6Z4Cc3RJX
6FfEqccL9Zs21LJ//G143xhOcAMCwxbOAeFYFTZ6WPcef3dPqI3sDrTQ3xfis1sn
6NeX9t5BvGmgUUHyojaV2TLv0jh2stCRJ2Na8yd1jR9+msHESOJ1y3wCb7XftBus
2+6uJ3JxwUXxcEQSDAhmEErrKubIVJwFRdQQCroIWGXqHN2j798=
=5nff
-----END PGP SIGNATURE-----

--blc09Nf686sGRVxV--

--===============5157636145093639958==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
--===============5157636145093639958==--
