Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F48A43BE66
	for <lists.iommu@lfdr.de>; Wed, 27 Oct 2021 02:15:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 068EC40275;
	Wed, 27 Oct 2021 00:15:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KPwqQvzMGdFG; Wed, 27 Oct 2021 00:15:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id AA30B401F3;
	Wed, 27 Oct 2021 00:15:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 64A25C0021;
	Wed, 27 Oct 2021 00:15:30 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 67EBBC000E
 for <iommu@lists.linux-foundation.org>; Wed, 27 Oct 2021 00:15:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4FE1380F07
 for <iommu@lists.linux-foundation.org>; Wed, 27 Oct 2021 00:15:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gibson.dropbear.id.au
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ylGN7XiPfrLx for <iommu@lists.linux-foundation.org>;
 Wed, 27 Oct 2021 00:15:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1BC9180E24
 for <iommu@lists.linux-foundation.org>; Wed, 27 Oct 2021 00:15:26 +0000 (UTC)
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4Hf8N76gFJz4xbt; Wed, 27 Oct 2021 11:15:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1635293719;
 bh=dKeVKsGMF2yh/WmFnvSeUwHjMJ9NdhhLGarW1W7UHaM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O3tFvRmZe2stjsNh610SuRMHbefz50riV1AKZDV2Uc0s3jsive5JQNnaACk8GwOR/
 zygRbW0flKtrC7nLiDDNB6wcj2AwVb5QnfRQaZhmdUGzEmZB0hiDitdBRgH6JoBMud
 Tr73DXkaFeMXFBbm8Y69+xUSBDXtCLxD/I4DHCfQ=
Date: Tue, 26 Oct 2021 20:23:22 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [RFC 13/20] iommu: Extend iommu_at[de]tach_device() for multiple
 devices group
Message-ID: <YXfJCrvtaXHV+qs/@yekko>
References: <20210919063848.1476776-1-yi.l.liu@intel.com>
 <20210919063848.1476776-14-yi.l.liu@intel.com>
 <YWe+88sfCbxgMYPN@yekko>
 <BN9PR11MB54337A8E65C789D038D875C68CB89@BN9PR11MB5433.namprd11.prod.outlook.com>
 <YWzwmAQDB9Qwu2uQ@yekko> <20211018163238.GO2744544@nvidia.com>
 <YXY9UIKDlQpNDGax@yekko> <20211025121410.GQ2744544@nvidia.com>
 <YXauO+YSR7ivz1QW@yekko> <20211025233602.GN2744544@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20211025233602.GN2744544@nvidia.com>
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 "kwankhede@nvidia.com" <kwankhede@nvidia.com>, "hch@lst.de" <hch@lst.de>,
 "jean-philippe@linaro.org" <jean-philippe@linaro.org>, "Jiang,
 Dave" <dave.jiang@intel.com>, "Raj, Ashok" <ashok.raj@intel.com>,
 "corbet@lwn.net" <corbet@lwn.net>, "Tian, Kevin" <kevin.tian@intel.com>,
 "parav@mellanox.com" <parav@mellanox.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "lkml@metux.net" <lkml@metux.net>, "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "Tian, Jun J" <jun.j.tian@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "lushenming@huawei.com" <lushenming@huawei.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>
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
Content-Type: multipart/mixed; boundary="===============5006215121426566766=="
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>


--===============5006215121426566766==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HAEESUd3nsaELdfA"
Content-Disposition: inline


--HAEESUd3nsaELdfA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 25, 2021 at 08:36:02PM -0300, Jason Gunthorpe wrote:
> On Tue, Oct 26, 2021 at 12:16:43AM +1100, David Gibson wrote:
> > If you attach devices A and B (both in group X) to IOAS 1, then detach
> > device A, what happens?  Do you detach both devices?  Or do you have a
> > counter so you have to detach as many time as you attached?
>=20
> I would refcount it since that is the only thing that makes semantic
> sense with the device centric model.

Yes, I definitely think that's the better option here.  This does
still leave (at least) one weird edge case where the group structure
can "leak" into the awareness of code that otherwise doesn't care,
though it's definitely less nasty that the ones I mentioned before:

If an app wants to move a bunch of devices from one IOAS to another,
it can do it either:

A)
	for each dev:
		detach dev from IOAS
	for each dev:
		attach dev to new IOAS

or B)

	for each dev:
		detach dev from IOAS
		attach dev to new IOAS

With only singleton groups they're pretty much equivalent, but with
multiple devices in a group, (B) will fail.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--HAEESUd3nsaELdfA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmF3yQoACgkQbDjKyiDZ
s5LyLBAAsvp/wdXHEJM94XhKjCF5ao1wc21uqzV/TsPjACrM7F0hBGc58zmLojnN
SrvWkquRwIZJKQPtQTNfck2bsDXYP5bv0Kfr2C7NJF63COQc/G112VoUQSa+6cKu
doeXjM0heJj6e8Rs/d3vtBnNtpsiAowZVB2T45vpeVKRMwrPz6AHeus5T3kPcRcL
hTi9zDLal1AtfomkvLzSZXmS/alx3xraTe4dMCdgCfG6l1VlDfaTQouX52ELZrDy
Glnr/CX5zAi/PX+e4Vtojjr1+wt8IKbQeXXB5/m9Fxbn8Q6OirmuMnElgra2hRG2
6Zoe5VmV148pB31a17eDcEn4ISCy0XTzvXxvYFbqyU+zBat8BIWnSrHHkK/HnwPr
hdQSJZLcCq4vZh0LmSEIEanq66a4BTGaFmDoP2+MV2KCniQouwrrQdxPndDMmm+K
6VNuSrReFl6EYBBvbFX3Xs4UT3cVeRPRXhuMLo3nLdjcTqQnK8hJlUB6PCDUahcb
NZwmAlsRSuMRrWoB6tFd8fLENKDwO4+PKbX7MK2UPUOy+2YFATypnAe26STD0jOj
nwgz6yvTuKTLRvpXsYVzxc7bMJgWHXzNWPlogsttWd0yDd4ZX1n65SMid0/JRWvZ
dja1XtV+i0gGz3Z+L+CPSdwZai1jRL5ZNFWOjdruncdKXUNDHkY=
=YvzU
-----END PGP SIGNATURE-----

--HAEESUd3nsaELdfA--

--===============5006215121426566766==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
--===============5006215121426566766==--
