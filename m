Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 333FC3AAD51
	for <lists.iommu@lfdr.de>; Thu, 17 Jun 2021 09:22:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C647383DC3;
	Thu, 17 Jun 2021 07:22:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4ZIeJ01WRf_5; Thu, 17 Jun 2021 07:22:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 0D9BB83DC5;
	Thu, 17 Jun 2021 07:22:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DB4DBC0022;
	Thu, 17 Jun 2021 07:22:20 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7F03BC000E
 for <iommu@lists.linux-foundation.org>; Thu, 17 Jun 2021 07:22:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 632CA40623
 for <iommu@lists.linux-foundation.org>; Thu, 17 Jun 2021 07:22:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gibson.dropbear.id.au
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 33fUN5YWGYcr for <iommu@lists.linux-foundation.org>;
 Thu, 17 Jun 2021 07:22:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 471E140614
 for <iommu@lists.linux-foundation.org>; Thu, 17 Jun 2021 07:22:11 +0000 (UTC)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4G5D5W5rs3z9sWH; Thu, 17 Jun 2021 17:22:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1623914527;
 bh=tFVUtNbdZ+Fw5LYQ7mSmAwqiFoN6XF0MqDJ61aM3Yrg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ScwxV0RsYOHqcnlffmG1ZaoGQ2430eMxloExqv65ydVRdbmXlOoaDWQfCKUvUquBL
 yUFFdOaIgV275bfscZF39oYoyHvQiUNdD/DCfOArYOdFZ7eGMcldGgRsonWclzUPtd
 Rw2uY4AqHpHww6Q7+gawy0lPus+exB4r67vDky4g=
Date: Thu, 17 Jun 2021 14:07:46 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [RFC] /dev/ioasid uAPI proposal
Message-ID: <YMrKksUeNW/PEGPM@yekko>
References: <MWHPR11MB1886422D4839B372C6AB245F8C239@MWHPR11MB1886.namprd11.prod.outlook.com>
 <YLch6zbbYqV4PyVf@yekko>
 <MWHPR11MB188668D220E1BF7360F2A6BE8C3C9@MWHPR11MB1886.namprd11.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <MWHPR11MB188668D220E1BF7360F2A6BE8C3C9@MWHPR11MB1886.namprd11.prod.outlook.com>
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
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
Content-Type: multipart/mixed; boundary="===============0660304840325819947=="
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>


--===============0660304840325819947==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gK7m5XMN4F+it+mS"
Content-Disposition: inline


--gK7m5XMN4F+it+mS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 03, 2021 at 08:12:27AM +0000, Tian, Kevin wrote:
> > From: David Gibson <david@gibson.dropbear.id.au>
> > Sent: Wednesday, June 2, 2021 2:15 PM
> >
> [...]
> =20
> > >
> > > /*
> > >   * Get information about an I/O address space
> > >   *
> > >   * Supported capabilities:
> > >   *	- VFIO type1 map/unmap;
> > >   *	- pgtable/pasid_table binding
> > >   *	- hardware nesting vs. software nesting;
> > >   *	- ...
> > >   *
> > >   * Related attributes:
> > >   * 	- supported page sizes, reserved IOVA ranges (DMA mapping);
> >=20
> > Can I request we represent this in terms of permitted IOVA ranges,
> > rather than reserved IOVA ranges.  This works better with the "window"
> > model I have in mind for unifying the restrictions of the POWER IOMMU
> > with Type1 like mapping.
>=20
> Can you elaborate how permitted range work better here?

Pretty much just that MAP operations would fail if they don't entirely
lie within a permitted range.  So, for example if your IOMMU only
implements say, 45 bits of IOVA, then you'd have 0..0x1fffffffffff as
your only permitted range.  If, like the POWER paravirtual IOMMU (in
defaut configuration) you have a small (1G) 32-bit range and a large
(45-bit) 64-bit range at a high address, you'd have say:
	0x00000000..0x3fffffff (32-bit range)
and
	0x800000000000000 .. 0x8001fffffffffff (64-bit range)
as your permitted ranges.

If your IOMMU supports truly full 64-bit addressing, but has a
reserved range (for MSIs or whatever) at 0xaaaa000..0xbbbb0000 then
you'd have permitted ranges of 0..0xaaa9ffff and
0xbbbb0000..0xffffffffffffffff.

[snip]
> > For debugging and certain hypervisor edge cases it might be useful to
> > have a call to allow userspace to lookup and specific IOVA in a guest
> > managed pgtable.
>=20
> Since all the mapping metadata is from userspace, why would one=20
> rely on the kernel to provide such service? Or are you simply asking
> for some debugfs node to dump the I/O page table for a given=20
> IOASID?

I'm thinking of this as a debugging aid so you can make sure that how
the kernel is interpreting that metadata in the same way that your
userspace expects it to interpret that metadata.


--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--gK7m5XMN4F+it+mS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDKypAACgkQbDjKyiDZ
s5KJ2RAAyi8TAl1qgdNgAf5wIGmOThtFfEghnObAGDxj+Jk30YI5r5tFLn1kX/ub
vWiXHGBSWYWqixxkkpepzvDI+uT/PziBrUJFP2b/sdvxEwfNNXPV08Df2y5gruUb
Oz6a2lqBelPjWI95H1fbtBn3sBQCTQoL1E35Ft9tcT6F/GPDZo9JUHlp1tuinJt8
lCkIMjvpgcefvh67yiQdnz0SRJunnn45WYK2KHQbyDHvpYuyPmRHQ6xz8iuDttO4
q+vssdbEqMA3doxWedxvmdNr9SE+Dm6ISpSdFvvy6I1O9CsThFAzsKkHyf5NBLQy
ttSSroxg5sqPPYqHznZlg7bG0fjxsDdYkzo66FPP2WtVmJTmKBet54HY+MQsR1do
gHZtCz+KGHBBLONRkHn5SSAwnjbUgv8+KTGmo92lCUI0PmBWta1L9s9CFG0sCiXn
f64/CNc/134/PtjDgrh3N5mFxlAKKkV6y7j/DJ0dMF7Bid001DTKC7WbVvrxTxxB
j7yo3I/jqxG4t5JelMN67wAFnRfM74N7SkyfhyL9E2oE92NHxGhwAdi8YPLNQf7L
4IbhKPz3q7tb34hDfRo9koANkQ09mkbNSGZTREXdRCrcevn69NyPk1jAmsUTt50M
seWfdBaV6WXG1qEVBPJidolTU71ErZRpvlV1JsZr6LD4qudwkaU=
=OGRh
-----END PGP SIGNATURE-----

--gK7m5XMN4F+it+mS--

--===============0660304840325819947==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
--===============0660304840325819947==--
