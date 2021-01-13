Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BFE2F4CA0
	for <lists.iommu@lfdr.de>; Wed, 13 Jan 2021 14:59:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2574287233;
	Wed, 13 Jan 2021 13:59:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mKhvkfGXheb7; Wed, 13 Jan 2021 13:59:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 52AB687232;
	Wed, 13 Jan 2021 13:59:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 30153C013A;
	Wed, 13 Jan 2021 13:59:48 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4EAB4C013A
 for <iommu@lists.linux-foundation.org>; Wed, 13 Jan 2021 13:59:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 42FFA2041F
 for <iommu@lists.linux-foundation.org>; Wed, 13 Jan 2021 13:59:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id je-QAAFe8RvD for <iommu@lists.linux-foundation.org>;
 Wed, 13 Jan 2021 13:59:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by silver.osuosl.org (Postfix) with ESMTPS id 51FA9204F3
 for <iommu@lists.linux-foundation.org>; Wed, 13 Jan 2021 13:59:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 17911AB92;
 Wed, 13 Jan 2021 13:59:39 +0000 (UTC)
Message-ID: <7ed51025f051f65f3dfe10a88caeb648821994b1.camel@suse.de>
Subject: Re: [RFC PATCH v3 2/6] swiotlb: Add restricted DMA pool
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Florian Fainelli <f.fainelli@gmail.com>, Claire Chang
 <tientzu@chromium.org>,  robh+dt@kernel.org, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org,  joro@8bytes.org,
 will@kernel.org, frowand.list@gmail.com, konrad.wilk@oracle.com, 
 boris.ostrovsky@oracle.com, jgross@suse.com, sstabellini@kernel.org,
 hch@lst.de,  m.szyprowski@samsung.com, robin.murphy@arm.com
Date: Wed, 13 Jan 2021 14:59:34 +0100
In-Reply-To: <95ae9c1e-c1f1-5736-fe86-12ced1f648f9@gmail.com>
References: <20210106034124.30560-1-tientzu@chromium.org>
 <20210106034124.30560-3-tientzu@chromium.org>
 <95ae9c1e-c1f1-5736-fe86-12ced1f648f9@gmail.com>
User-Agent: Evolution 3.38.2 
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, heikki.krogerus@linux.intel.com,
 grant.likely@arm.com, saravanak@google.com, peterz@infradead.org,
 xypron.glpk@gmx.de, rafael.j.wysocki@intel.com, linux-kernel@vger.kernel.org,
 treding@nvidia.com, bgolaszewski@baylibre.com,
 iommu@lists.linux-foundation.org, drinkcat@chromium.org, rdunlap@infradead.org,
 gregkh@linuxfoundation.org, xen-devel@lists.xenproject.org,
 dan.j.williams@intel.com, andriy.shevchenko@linux.intel.com,
 linuxppc-dev@lists.ozlabs.org, mingo@kernel.org
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
Content-Type: multipart/mixed; boundary="===============3298790406768279362=="
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>


--===============3298790406768279362==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-t4If4GPTxFUMkhdNPchG"


--=-t4If4GPTxFUMkhdNPchG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi All,

On Tue, 2021-01-12 at 16:03 -0800, Florian Fainelli wrote:
> On 1/5/21 7:41 PM, Claire Chang wrote:
> > Add the initialization function to create restricted DMA pools from
> > matching reserved-memory nodes in the device tree.
> >=20
> > Signed-off-by: Claire Chang <tientzu@chromium.org>
> > ---
> > =C2=A0include/linux/device.h  |   4 ++
> > =C2=A0include/linux/swiotlb.h |   7 +-
> > =C2=A0kernel/dma/Kconfig      |   1 +
> > =C2=A0kernel/dma/swiotlb.c    | 144 ++++++++++++++++++++++++++++++++++-=
-----
> > =C2=A04 files changed, 131 insertions(+), 25 deletions(-)
> >=20
> > diff --git a/include/linux/device.h b/include/linux/device.h
> > index 89bb8b84173e..ca6f71ec8871 100644
> > --- a/include/linux/device.h
> > +++ b/include/linux/device.h
> > @@ -413,6 +413,7 @@ struct dev_links_info {
> > =C2=A0=C2=A0* @dma_pools:	Dma pools (if dma'ble device).
> > =C2=A0=C2=A0* @dma_mem:	Internal for coherent mem override.
> > =C2=A0=C2=A0* @cma_area:	Contiguous memory area for dma allocations
> > + * @dma_io_tlb_mem: Internal for swiotlb io_tlb_mem override.
> > =C2=A0=C2=A0* @archdata:	For arch-specific additions.
> > =C2=A0=C2=A0* @of_node:	Associated device tree node.
> > =C2=A0=C2=A0* @fwnode:	Associated device node supplied by platform firm=
ware.
> > @@ -515,6 +516,9 @@ struct device {
> > =C2=A0#ifdef CONFIG_DMA_CMA
> > =C2=A0	struct cma *cma_area;		/* contiguous memory area for dma
> > =C2=A0					   allocations */
> > +#endif
> > +#ifdef CONFIG_SWIOTLB
> > +	struct io_tlb_mem	*dma_io_tlb_mem;
> > =C2=A0#endif
> > =C2=A0	/* arch specific additions */
> > =C2=A0	struct dev_archdata	archdata;
> > diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
> > index dd8eb57cbb8f..a1bbd7788885 100644
> > --- a/include/linux/swiotlb.h
> > +++ b/include/linux/swiotlb.h
> > @@ -76,12 +76,13 @@ extern enum swiotlb_force swiotlb_force;
> > =C2=A0=C2=A0*
> > =C2=A0=C2=A0* @start:	The start address of the swiotlb memory pool. Use=
d to do a quick
> > =C2=A0=C2=A0*		range check to see if the memory was in fact allocated b=
y this
> > - *		API.
> > + *		API. For restricted DMA pool, this is device tree adjustable.
>=20
> Maybe write it as this is "firmware adjustable" such that when/if ACPI
> needs something like this, the description does not need updating.
>=20
> [snip]
>=20
> > +static int rmem_swiotlb_device_init(struct reserved_mem *rmem,
> > +				    struct device *dev)
> > +{
> > +	struct io_tlb_mem *mem =3D rmem->priv;
> > +	int ret;
> > +
> > +	if (dev->dma_io_tlb_mem)
> > +		return -EBUSY;
> > +
> > +	if (!mem) {
> > +		mem =3D kzalloc(sizeof(*mem), GFP_KERNEL);
> > +		if (!mem)
> > +			return -ENOMEM;
> > +
> > +		if (!memremap(rmem->base, rmem->size, MEMREMAP_WB)) {
>=20
> MEMREMAP_WB sounds appropriate as a default.

As per the binding 'no-map' has to be disabled here. So AFAIU, this memory =
will
be part of the linear mapping. Is this really needed then?

> Documentation/devicetree/bindings/reserved-memory/ramoops.txt does
> define an "unbuffered" property which in premise could be applied to the
> generic reserved memory binding as well and that we may have to be
> honoring here, if we were to make it more generic. Oh well, this does
> not need to be addressed right now I guess.




--=-t4If4GPTxFUMkhdNPchG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl/+/MYACgkQlfZmHno8
x/57/wf8DfucOc1/3ySk20PkRc6qv7RWXbGw5RAUSZfXGpnHv1mAOnBMd6ProWeU
mJiYuCGcljwaI92Dc4Yca/JpWSeZmXWl/HZ+T0GIF9SegR36L8j5Fwop/zptM3kF
Je0VZZ/VIXKkgr7rp0yqFNRFB0vGuXdQz022npLJ4YKgyN1uvEaVgVCEeKuB/gSc
7BYPkilOLaUXaBxRcA6l7mcQZc4vqCMW3Lzl/9IM+mKhrhFllZI3pvBFnWed+k2J
JVdA5hjLI3QQrsXYH8+AfKlhLjzzMCGn5E5Gw1IPluIoeObgEwwLfYuMHbOvFplQ
3LHRL6KrY2rpsuzPeVMDM0TFPae/Hw==
=L05t
-----END PGP SIGNATURE-----

--=-t4If4GPTxFUMkhdNPchG--


--===============3298790406768279362==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
--===============3298790406768279362==--

