Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 1120DEB497
	for <lists.iommu@lfdr.de>; Thu, 31 Oct 2019 17:23:10 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D28DFD81;
	Thu, 31 Oct 2019 16:23:05 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E05FECBD
	for <iommu@lists.linux-foundation.org>;
	Thu, 31 Oct 2019 16:23:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 4BEDA14D
	for <iommu@lists.linux-foundation.org>;
	Thu, 31 Oct 2019 16:23:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id 60797B833;
	Thu, 31 Oct 2019 16:23:01 +0000 (UTC)
Message-ID: <6726a651c12d91ca22b9d8984745d90db5d507ec.camel@suse.de>
Subject: Re: [PATCH] dma/direct: turn ARCH_ZONE_DMA_BITS into a variable
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Christoph Hellwig <hch@lst.de>
Date: Thu, 31 Oct 2019 17:22:59 +0100
In-Reply-To: <20191031155750.GA7394@lst.de>
References: <20191031152837.15253-1-nsaenzjulienne@suse.de>
	<20191031154759.GA7162@lst.de>
	<40d06d463c05d36968e8b64924d78f7794f8de50.camel@suse.de>
	<20191031155750.GA7394@lst.de>
User-Agent: Evolution 3.34.1 
MIME-Version: 1.0
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-s390@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>,
	Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
	linuxppc-dev@lists.ozlabs.org, Heiko Carstens <heiko.carstens@de.ibm.com>,
	linux-kernel@vger.kernel.org,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	iommu@lists.linux-foundation.org, Paul Mackerras <paulus@samba.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Content-Type: multipart/mixed; boundary="===============8493371255100559878=="
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org


--===============8493371255100559878==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-geumnkbETQYdG1ZUMwUA"


--=-geumnkbETQYdG1ZUMwUA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2019-10-31 at 16:57 +0100, Christoph Hellwig wrote:
> On Thu, Oct 31, 2019 at 04:53:13PM +0100, Nicolas Saenz Julienne wrote:
> > > > +#define ARM64_ZONE_DMA_BITS	30
> > > > +
> > > >  /*
> > > >   * We need to be able to catch inadvertent references to memstart_=
addr
> > > >   * that occur (potentially in generic code) before
> > > > arm64_memblock_init()
> > > > @@ -424,6 +427,8 @@ void __init arm64_memblock_init(void)
> > > >  	else
> > > >  		arm64_dma_phys_limit =3D PHYS_MASK + 1;
> > > > =20
> > > > +	zone_dma_bits =3D ARM64_ZONE_DMA_BITS;
> > > > +
> > > >  	reserve_crashkernel();
> > >=20
> > > This actually adds a new limit, as there wasn't one before for arm64.
> >=20
> > Well, as zone_dma_bits is only relevant in dma/direct when ZONE_DMA is
> > defined
> > I figured it doesn't matter if the variable is set conditionally to ZON=
E_DMA
> > or
> > not.
>=20
> I'd much prefer that to do separately.

OK, I see what you mean now. It's wrong indeed.

The trouble is the ZONE_DMA series[1] in arm64, also due for v5.5, will be
affected by this patch. I don't know the right way to approach this problem
since depending on the merge order, this patch should be updated or the arm=
64
ZONE_DMA series fixed.

Maybe it's easier to just wait for v5.6.

Regards,
Nicolas

[1] https://lkml.org/lkml/2019/9/11/734


--=-geumnkbETQYdG1ZUMwUA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl27CmMACgkQlfZmHno8
x/4b+AgAoH8wv9sfGomdszgwev9YRlMzey4HKe8HTYaOtmPwv+9I5u2Q1L0Hll8U
oOvfmsMi3/GCphnYxgVI15TV3gT23I4f+e1sVmHtdJwOja145qdVYeN0eVrJBGlW
gllgXNWdKSeomR5jQYRo6/r/e4b2DFreMuJMYO5Ac0Jmp4lqqbZ9tXDqMvKt0VcB
4olZERu99fJIT8AxzUVXOG9cft6l18Fio1WtXJLzXgVrjxEKnxGLAq1GxY5o8VF7
mf5621L1pvp/rNs/CBhehPADNaJqYwdS+nm7md9u/My8zRvp2OqT8O9a4e7RxcQi
QPdhGBoQVaeZdUmbRgLmr2hq8cGTqw==
=2ip7
-----END PGP SIGNATURE-----

--=-geumnkbETQYdG1ZUMwUA--


--===============8493371255100559878==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
--===============8493371255100559878==--

