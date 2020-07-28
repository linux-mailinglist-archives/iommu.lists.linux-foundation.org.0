Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id AF350230CCF
	for <lists.iommu@lfdr.de>; Tue, 28 Jul 2020 16:56:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6AD0C85230;
	Tue, 28 Jul 2020 14:56:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZungEpcfaVWg; Tue, 28 Jul 2020 14:56:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E84688527F;
	Tue, 28 Jul 2020 14:56:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CF838C004D;
	Tue, 28 Jul 2020 14:56:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 34B43C004D
 for <iommu@lists.linux-foundation.org>; Tue, 28 Jul 2020 14:56:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 3102E85230
 for <iommu@lists.linux-foundation.org>; Tue, 28 Jul 2020 14:56:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cZSKcKx2eJFF for <iommu@lists.linux-foundation.org>;
 Tue, 28 Jul 2020 14:56:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 5D22385209
 for <iommu@lists.linux-foundation.org>; Tue, 28 Jul 2020 14:56:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6668AABF4;
 Tue, 28 Jul 2020 14:56:41 +0000 (UTC)
Message-ID: <0c602a1d887d0fe38857e21aa963d51f5c772661.camel@suse.de>
Subject: Re: [PATCH 1/2] dma-pool: fix coherent pool allocations for IOMMU
 mappings
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Christoph Hellwig <hch@lst.de>, Amit Pundir <amit.pundir@linaro.org>
Date: Tue, 28 Jul 2020 16:56:29 +0200
In-Reply-To: <20200728104742.422960-2-hch@lst.de>
References: <20200728104742.422960-1-hch@lst.de>
 <20200728104742.422960-2-hch@lst.de>
User-Agent: Evolution 3.36.4 
MIME-Version: 1.0
Cc: iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>,
 linux-rpi-kernel@lists.infradead.org, jeremy.linton@arm.com,
 David Rientjes <rientjes@google.com>
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
Content-Type: multipart/mixed; boundary="===============8096881029972438877=="
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>


--===============8096881029972438877==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-XZEyFAsWzCPSX92xaAsK"


--=-XZEyFAsWzCPSX92xaAsK
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2020-07-28 at 12:47 +0200, Christoph Hellwig wrote:
> When allocating coherent pool memory for an IOMMU mapping we don't care
> about the DMA mask.  Move the guess for the initial GFP mask into the
> dma_direct_alloc_pages and pass dma_coherent_ok as a function pointer
> argument so that it doesn't get applied to the IOMMU case.
>=20
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/iommu/dma-iommu.c   |   4 +-
>  include/linux/dma-direct.h  |   3 -
>  include/linux/dma-mapping.h |   5 +-
>  kernel/dma/direct.c         |  13 ++--
>  kernel/dma/pool.c           | 114 +++++++++++++++---------------------
>  5 files changed, 62 insertions(+), 77 deletions(-)
>=20

[...]

> -static inline struct gen_pool *dma_get_safer_pool(struct gen_pool *bad_p=
ool)
> +static struct page *__dma_alloc_from_pool(struct device *dev, size_t siz=
e,
> +		struct gen_pool *pool, void **cpu_addr,
> +		bool (*phys_addr_ok)(struct device *, phys_addr_t, size_t))
>  {
> -	if (bad_pool =3D=3D atomic_pool_kernel)
> -		return atomic_pool_dma32 ? : atomic_pool_dma;
> +	unsigned long addr;
> +	phys_addr_t phys;
> =20
> -	if (bad_pool =3D=3D atomic_pool_dma32)
> -		return atomic_pool_dma;
> +	addr =3D gen_pool_alloc(pool, size);
> +	if (!addr)
> +		return NULL;
> =20
> -	return NULL;
> -}
> +	phys =3D gen_pool_virt_to_phys(pool, addr);
> +	if (!phys_addr_ok(dev, phys, size)) {

Shoudn't we check if phys_addr_ok() !=3D NULL?

Regards,
Nicolas



--=-XZEyFAsWzCPSX92xaAsK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl8gPJ0ACgkQlfZmHno8
x/7Q9ggApvwRAjjmRTZkltf/ifdl4pTyUps9aTqvCM+p6jnePFCR71d3He8aWyJG
86epRQTgzJ3tGCwgv+mmu2g99JBGlZdgTs0TZxAk8cWyGDEiEscpr4kze/AMdSRz
5/ss1UdfDT8vyhCsSyPZebIiSHHe9LUsCSwY2l3htdsxHHzQEOXCt1MzGMji+KfA
aRUFqcZLx1vaFLagYmN9RD4k6kDA1WkycQPE/QBhhLmz6PDCyJZYVg7yGOKJ81gj
RCSNWl8b9SVS8HVKRSy/OWVEHu4PmQc0PeaVPD6PR6g9J1qw5fCPsSPlhFdPPx2t
VTB06sog64vJruFbXR79AysvOP3MCg==
=O26p
-----END PGP SIGNATURE-----

--=-XZEyFAsWzCPSX92xaAsK--


--===============8096881029972438877==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
--===============8096881029972438877==--

