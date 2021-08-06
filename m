Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 7783D3E22F0
	for <lists.iommu@lfdr.de>; Fri,  6 Aug 2021 07:33:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DD8E402FA;
	Fri,  6 Aug 2021 05:33:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LIApHWfMGZM5; Fri,  6 Aug 2021 05:33:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 9F52340311;
	Fri,  6 Aug 2021 05:33:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CC336C001A;
	Fri,  6 Aug 2021 05:33:05 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 20C1DC000E
 for <iommu@lists.linux-foundation.org>; Fri,  6 Aug 2021 05:33:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E398E82FCE
 for <iommu@lists.linux-foundation.org>; Fri,  6 Aug 2021 05:33:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gibson.dropbear.id.au
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eQdkYQ_Xw5z5 for <iommu@lists.linux-foundation.org>;
 Fri,  6 Aug 2021 05:33:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ACEA782F03
 for <iommu@lists.linux-foundation.org>; Fri,  6 Aug 2021 05:33:01 +0000 (UTC)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GgvJT5j2qz9sW5; Fri,  6 Aug 2021 15:32:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1628227977;
 bh=VgP74InI3Uz0qZ2/LQM1R3Ud9iWaj+wk/xGRWtN/6yY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Xi+yKoqfW0FkYj+E2G8mVLF6aPdhG3HhV0yIOwgUkVBn7p4NzF/iYNdpUE7HHitZk
 j5qfp4AdzdTAt4sE4Hivsc3v1s7U/ZIalR03kQxlOAms683p6OpZ61PFOoYxGwQzQD
 Bgsf0Sx0ROMhpcJNioWxawsw9nT/kGNH5IKSmLtk=
Date: Fri, 6 Aug 2021 14:47:50 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [RFC v2] /dev/iommu uAPI proposal
Message-ID: <YQy+9mSSzban+t/X@yekko>
References: <BN9PR11MB5433B1E4AE5B0480369F97178C189@BN9PR11MB5433.namprd11.prod.outlook.com>
 <YP4/KJoYfbaf5U94@yekko> <20210730145123.GW1721383@nvidia.com>
 <BN9PR11MB5433C34222B3E727B3D0E5638CEF9@BN9PR11MB5433.namprd11.prod.outlook.com>
 <20210804140447.GH1721383@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20210804140447.GH1721383@nvidia.com>
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
Content-Type: multipart/mixed; boundary="===============2477276390049928552=="
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>


--===============2477276390049928552==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xtXF0LkKM6+DEdEM"
Content-Disposition: inline


--xtXF0LkKM6+DEdEM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 04, 2021 at 11:04:47AM -0300, Jason Gunthorpe wrote:
> On Mon, Aug 02, 2021 at 02:49:44AM +0000, Tian, Kevin wrote:
>=20
> > Can you elaborate? IMO the user only cares about the label (device cook=
ie=20
> > plus optional vPASID) which is generated by itself when doing the attac=
hing
> > call, and expects this virtual label being used in various spots (inval=
idation,
> > page fault, etc.). How the system labels the traffic (the physical RID =
or RID+
> > PASID) should be completely invisible to userspace.
>=20
> I don't think that is true if the vIOMMU driver is also emulating
> PASID. Presumably the same is true for other PASID-like schemes.

Right.  The idea for an SVA capable vIOMMU in my scheme is that the
hypervisor would set up an IOAS of address type "PASID+address" with
the mappings made by the guest according to its vIOMMU semantics.
Then SVA capable devices would be plugged into that IOAS by using
"PASID+address" type endpoints from those devices.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--xtXF0LkKM6+DEdEM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmEMvvYACgkQbDjKyiDZ
s5J7OhAAt80UyM01hO9UcB2WUWkDFXZd5ryLChQk4nBBHH6AolfinitcVmNoHb6l
+WQQGubNPMHJa5bzSpa28cViR8hcc1frjPwqcHbUb8YS4h7ILXpk3BiEt5jIZ4Oc
xUP6lKK8G14ZltBQvNNzjrd031aA+XHEx80bpU1q4xKMCLqJt2CFyd5bTw7aOabh
+qGukHkhcotpFTroiAkuJrHRTOy8nvbl8nAw/ult+59c0DnTao+yfdFBjf3+h9a0
iPcnxEWS8HJ80/Fv9KpLnQ0tNtXoTY2Q/dBfS4FolPwYg9bfNqm8Xdk8t4owCfeF
M9m0fDBDekxaM2Lsr+fGMZ2A9CdrXs8NBAaNWvU92H3EnIZBmxb95VoaJsryN7gj
IbZVLLz4zY7BQos7pc7EJKB3uYzAOpNpvrTZKPTOb5+oTwFrr60fFbzlIe4lyg/z
XOZ4tHtlzsYxhaFZmVRrW0taJ30aR9vHGiJSbcQlrs1W1cK8nAjO0QRkeYmVyRqA
o0TFw1SBNIIieNzPUxHa56cNQm0M3Hi9w+RkcSmsK2aDhaovrM7l5xgSs5/HxIqI
qT6VBd/+bqhK+y0iA2SFd3d/521yGKu41XcEvkya0k0dv2sCUwDydNC4knVGoAUc
nlRowbhm5r9RbcHcsCcduvboA7JAEMhU2aESrQGrHwTAXn2cS+E=
=rCVy
-----END PGP SIGNATURE-----

--xtXF0LkKM6+DEdEM--

--===============2477276390049928552==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
--===============2477276390049928552==--
