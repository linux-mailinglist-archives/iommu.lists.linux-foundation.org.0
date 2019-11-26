Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F0B10A436
	for <lists.iommu@lfdr.de>; Tue, 26 Nov 2019 19:52:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 74028204BC;
	Tue, 26 Nov 2019 18:52:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cBts5cDwHnp8; Tue, 26 Nov 2019 18:52:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id CCB90220E5;
	Tue, 26 Nov 2019 18:52:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BAC43C0878;
	Tue, 26 Nov 2019 18:52:14 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 29BDAC0878
 for <iommu@lists.linux-foundation.org>; Tue, 26 Nov 2019 18:52:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 186F485CB4
 for <iommu@lists.linux-foundation.org>; Tue, 26 Nov 2019 18:52:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MgdZaeuitR2Q for <iommu@lists.linux-foundation.org>;
 Tue, 26 Nov 2019 18:52:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 006AD85722
 for <iommu@lists.linux-foundation.org>; Tue, 26 Nov 2019 18:52:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 38C30ABD6;
 Tue, 26 Nov 2019 18:52:08 +0000 (UTC)
Message-ID: <45feed391bbd95c46f64b31cf8817d4f773c8da1.camel@suse.de>
Subject: Re: [PATCH v2] dma-mapping: treat dev->bus_dma_mask as a DMA limit
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>, 
 Nathan Chancellor <natechancellor@gmail.com>
Date: Tue, 26 Nov 2019 19:51:59 +0100
In-Reply-To: <0b851d0e-37c7-062e-c287-05f8c8a54c16@arm.com>
References: <20191121092646.8449-1-nsaenzjulienne@suse.de>
 <20191123165108.GA15306@ubuntu-x2-xlarge-x86>
 <20191125074412.GA30595@lst.de>
 <0b851d0e-37c7-062e-c287-05f8c8a54c16@arm.com>
User-Agent: Evolution 3.34.1 
MIME-Version: 1.0
Cc: Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org,
 linux-ide@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Frank Rowand <frowand.list@gmail.com>,
 Paul Burton <paulburton@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 x86@kernel.org, linux-acpi@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 linux-pci@vger.kernel.org, James Hogan <jhogan@kernel.org>,
 Len Brown <lenb@kernel.org>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Jens Axboe <axboe@kernel.dk>, "Rafael J.
 Wysocki" <rjw@rjwysocki.net>, Hanjun Guo <guohanjun@huawei.com>,
 linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
 iommu@lists.linux-foundation.org, Sudeep Holla <sudeep.holla@arm.com>,
 linuxppc-dev@lists.ozlabs.org
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
Content-Type: multipart/mixed; boundary="===============0396297438206779582=="
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>


--===============0396297438206779582==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-B9dp7hYRMOcivm0VMcWv"


--=-B9dp7hYRMOcivm0VMcWv
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2019-11-25 at 16:33 +0000, Robin Murphy wrote:
> On 25/11/2019 7:44 am, Christoph Hellwig wrote:
> > On Sat, Nov 23, 2019 at 09:51:08AM -0700, Nathan Chancellor wrote:
> > > Just as an FYI, this introduces a warning on arm32 allyesconfig for m=
e:
> >=20
> > I think the dma_limit argument to iommu_dma_alloc_iova should be a u64
> > and/or we need to use min_t and open code the zero exception.
> >=20
> > Robin, Nicolas - any opinions?
>=20
> Yeah, given that it's always held a mask I'm not entirely sure why it=20
> was ever a dma_addr_t rather than a u64. Unless anyone else is desperate=
=20
> to do it I'll get a cleanup patch ready for rc1.

Sounds good to me too

Robin, since I started the mess, I'll be happy to do it if it helps offload=
ing
some work from you.

Regards,
Nicolas


--=-B9dp7hYRMOcivm0VMcWv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl3ddE8ACgkQlfZmHno8
x/5fVwgAnN7cpWXNHEbGgqyZcMqmBWCtR0bMa/xIu1xNgr/CAwMMZj0Z3/+6d18p
mlU5N6AqlkTxefP9mV5ZxBzugcsriGR4+qJ05kZZAMxAeG625qDkfhSEl0FmUZRT
WmEv98IN0aFzHEjZJAyPDNV8Ff1a3JpoHKQmnYs5z438rMZt49CPBC0jNPFdaEuj
v9ry1DkR+cGYuD1WRyBQJjtze14XoG7ZCu0o9Htc02GZHq3OuabxDikuTC+UJ1jR
BZX4ak4qGpJUGYT8fQA7IOA94Sd/N/CHMrDp8yv5f/kRcprKqgGX8PnMCUOPf4ns
PsCZZGhEKvVwZy3/+QzWSYQ7q20O8w==
=WYKI
-----END PGP SIGNATURE-----

--=-B9dp7hYRMOcivm0VMcWv--


--===============0396297438206779582==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
--===============0396297438206779582==--

