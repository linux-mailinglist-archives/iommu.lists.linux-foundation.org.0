Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 1979BD5A82
	for <lists.iommu@lfdr.de>; Mon, 14 Oct 2019 07:08:21 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 2E2F42579;
	Mon, 14 Oct 2019 05:08:16 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id EA5BE2562;
	Mon, 14 Oct 2019 04:52:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 1060F6CE;
	Mon, 14 Oct 2019 04:52:44 +0000 (UTC)
Received: by ozlabs.org (Postfix, from userid 1007)
	id 46s5lZ6rscz9sP3; Mon, 14 Oct 2019 15:52:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1571028762;
	bh=5ic5WJLETE48dYyBLSCb1MM2F7flCGOpH3qsXLyV8n8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BDJfsvOKlYFniqmjeT/AI6HcNOV1ln1BxU/lRTiSl1OZR30b7aBpr9jdIkYRg/52x
	NGxFBlDbv1VXrJo3DY0hI4ChehpnlBtf+O+oxCC95ARasIgJ+WLE9nzsP/2cHusaYK
	LpKGJw6gzFvNYuSsGdCxGjR6ohdcNlzb9UyGkjfk=
Date: Mon, 14 Oct 2019 15:52:35 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Ram Pai <linuxram@us.ibm.com>
Subject: Re: [PATCH 2/2] virtio_ring: Use DMA API if memory is encrypted
Message-ID: <20191014045235.GO4080@umbus.fritz.box>
References: <1570843519-8696-1-git-send-email-linuxram@us.ibm.com>
	<1570843519-8696-2-git-send-email-linuxram@us.ibm.com>
	<1570843519-8696-3-git-send-email-linuxram@us.ibm.com>
MIME-Version: 1.0
In-Reply-To: <1570843519-8696-3-git-send-email-linuxram@us.ibm.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: andmike@us.ibm.com, sukadev@linux.vnet.ibm.com, mdroth@linux.vnet.ibm.com,
	b.zolnierkie@samsung.com, mpe@ellerman.id.au,
	jasowang@redhat.com, aik@linux.ibm.com, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, paulus@ozlabs.org,
	iommu@lists.linux-foundation.org, paul.burton@mips.com,
	benh@kernel.crashing.org, linuxppc-dev@lists.ozlabs.org,
	hch@lst.de, robin.murphy@arm.com
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
Content-Type: multipart/mixed; boundary="===============4577847849682447228=="
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org


--===============4577847849682447228==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8N0TQpGUCeEQshoq"
Content-Disposition: inline


--8N0TQpGUCeEQshoq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 11, 2019 at 06:25:19PM -0700, Ram Pai wrote:
> From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
>=20
> Normally, virtio enables DMA API with VIRTIO_F_IOMMU_PLATFORM, which must
> be set by both device and guest driver. However, as a hack, when DMA API
> returns physical addresses, guest driver can use the DMA API; even though
> device does not set VIRTIO_F_IOMMU_PLATFORM and just uses physical
> addresses.
>=20
> Doing this works-around POWER secure guests for which only the bounce
> buffer is accessible to the device, but which don't set
> VIRTIO_F_IOMMU_PLATFORM due to a set of hypervisor and architectural bugs.
> To guard against platform changes, breaking any of these assumptions down
> the road, we check at probe time and fail if that's not the case.
>=20
> cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> cc: David Gibson <david@gibson.dropbear.id.au>
> cc: Michael Ellerman <mpe@ellerman.id.au>
> cc: Paul Mackerras <paulus@ozlabs.org>
> cc: Michael Roth <mdroth@linux.vnet.ibm.com>
> cc: Alexey Kardashevskiy <aik@linux.ibm.com>
> cc: Jason Wang <jasowang@redhat.com>
> cc: Christoph Hellwig <hch@lst.de>
> Suggested-by: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Ram Pai <linuxram@us.ibm.com>
> Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

I don't know that this is the most elegant solution possible.  But
it's simple, gets the job done and pretty unlikely to cause mysterious
breakage down the road.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--8N0TQpGUCeEQshoq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl2j/xMACgkQbDjKyiDZ
s5KZJw/7BRxGaRXVs4GwonOJMnJpzq+0zo4Rex4IzZu98y/3bSw1XB+cNfhAwGdo
00Qpp0+AGxMNUmcXy+ilSprBokq1gDBh1hbq2ap/1yoK/fcW2L5ZuyoT5m9d1AMR
4sExuhtQpr7ZMAHHC5Q99jOi44i4BNixlNI62OwtYwOoSvGz1dar6PthN/D6zZ1N
k5ViBzqOY4CIoK/Onqlf47P0ZbgP2XP7rfri0m+PbY0ipOw7E+8zMl4NMIu+dGeU
RQm5e1v8wX/5MUS50gAL+lW/QUxsneaCs3WLCXvHqSJL+shLJnV8Bnomgw+zsBCb
lkLKb+MqdRLt+OMjmIzAtJ2Sza6CU5cpvOAWmIeTlxiwEdD5qrVzAryhFU204vwP
J4ovQSOyR4geqNF3uzTvvVhdme9dNLHkwp7h9PnFwVQEYK6/BlUXxi6WXQXbcthz
PDIj5YdYOwnHLsAv0uaEqRb8/n8ULgyLMfMI4EJOomafMlXF+VD0UPsOEC5glAJ4
TQ6Q0MMzMJ48BhOhwoAZDEYCJYPSXDaKKxEPgvr+uY+VeGTMuMUC8W8VyKFfEZr2
jKpt2P6u/9cPgZWI02Ve5xbRDHJ38cW74JxnTK21zEiF5m14JTYxU6lTTyPQZhFe
DWvkWwsvDz0JvMt8z5DU+FZZbYAnax5XWnEqIl2urw/ChF6DHOY=
=kf/I
-----END PGP SIGNATURE-----

--8N0TQpGUCeEQshoq--

--===============4577847849682447228==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
--===============4577847849682447228==--
