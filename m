Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A59FF7353D
	for <lists.iommu@lfdr.de>; Wed, 24 Jul 2019 19:23:58 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 800A1116C;
	Wed, 24 Jul 2019 17:23:56 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 9DD8A1163
	for <iommu@lists.linux-foundation.org>;
	Wed, 24 Jul 2019 17:23:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id F080CF1
	for <iommu@lists.linux-foundation.org>;
	Wed, 24 Jul 2019 17:23:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id 1E42DAE2E;
	Wed, 24 Jul 2019 17:23:53 +0000 (UTC)
Message-ID: <a447eae1bb46fe753f7a62fb8932e680b79b1635.camel@suse.de>
Subject: Re: [PATCH 2/2] arm: use swiotlb for bounce buffer on LPAE configs
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Christoph Hellwig <hch@lst.de>, Russell King - ARM Linux admin
	<linux@armlinux.org.uk>
Date: Wed, 24 Jul 2019 19:23:50 +0200
In-Reply-To: <20190709142011.24984-3-hch@lst.de>
References: <20190709142011.24984-1-hch@lst.de>
	<20190709142011.24984-3-hch@lst.de>
User-Agent: Evolution 3.32.3 
MIME-Version: 1.0
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
	linux-arm-kernel@lists.infradead.org, Roger Quadros <rogerq@ti.com>
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
Content-Type: multipart/mixed; boundary="===============1231161060678270322=="
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org


--===============1231161060678270322==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-whG6SPAwfjFfvDK3372+"


--=-whG6SPAwfjFfvDK3372+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-07-09 at 07:20 -0700, Christoph Hellwig wrote:
> The DMA API requires that 32-bit DMA masks are always supported, but on
> arm LPAE configs they do not currently work when memory is present
> above 4GB.  Wire up the swiotlb code like for all other architectures
> to provide the bounce buffering in that case.
>=20
> Fixes: 21e07dba9fb11 ("scsi: reduce use of block bounce buffers").
> Reported-by: Roger Quadros <rogerq@ti.com>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---

Hi Chistoph,
Out of curiosity, what is the reason stopping us from using dma-direct/swio=
tlb
instead of arm_dma_ops altogether?

Regards,
Nicolas


--=-whG6SPAwfjFfvDK3372+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl04lCcACgkQlfZmHno8
x/5jKAgAszLIqjIi52NyfR8TyZ+bPsWKIAQKAn5HBQa6grZi+PtHDVbHAxKTikMQ
PgjbRl5aI7uPsbYFuq8R6jr+2mQLXI7gvgHn2x22hh+3+cC+mYWJoORNg7v5VrI9
c2Q4FaZcHLxPLNjPNLsJJHyrM8wLiZ9bMbpKpQ8Fs0UoJmD9fefIDXRIHYQTakeZ
ooLgoUnyEje4u1jCI8dbJrDXRxzVwF7CYlY6V5+PG+7GrdP6sqYeNDk1+PAtzUtf
EIRenYS6MAHo3skOiC+Egr/DeYEsk72iZzIZpWKm7k0HGX9kSc6+eWXt6lPwyiqq
22EzPtQpZAz/Jim+FmDtgz/5II5T+g==
=3iIi
-----END PGP SIGNATURE-----

--=-whG6SPAwfjFfvDK3372+--


--===============1231161060678270322==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
--===============1231161060678270322==--

