Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DED1E46A9
	for <lists.iommu@lfdr.de>; Wed, 27 May 2020 17:00:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9985987EC7;
	Wed, 27 May 2020 15:00:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6DjWmNAEpHy4; Wed, 27 May 2020 15:00:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id EB21187E1D;
	Wed, 27 May 2020 15:00:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DFE95C016F;
	Wed, 27 May 2020 15:00:16 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A208DC016F
 for <iommu@lists.linux-foundation.org>; Wed, 27 May 2020 15:00:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 8275524E08
 for <iommu@lists.linux-foundation.org>; Wed, 27 May 2020 15:00:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VBqyYlBvrVWL for <iommu@lists.linux-foundation.org>;
 Wed, 27 May 2020 15:00:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by silver.osuosl.org (Postfix) with ESMTPS id E737224D41
 for <iommu@lists.linux-foundation.org>; Wed, 27 May 2020 15:00:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D8313B1A5;
 Wed, 27 May 2020 15:00:13 +0000 (UTC)
Message-ID: <59a0b4e1454a8ef4d3e4ebaf55dcbf3dcd2d73a2.camel@suse.de>
Subject: Re: [PATCH v2 09/14] device core: Add ability to handle multiple
 dma offsets
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Jim Quinlan <james.quinlan@broadcom.com>, linux-pci@vger.kernel.org, 
 Christoph Hellwig <hch@lst.de>, bcm-kernel-feedback-list@broadcom.com
Date: Wed, 27 May 2020 17:00:07 +0200
In-Reply-To: <20200526191303.1492-10-james.quinlan@broadcom.com>
References: <20200526191303.1492-1-james.quinlan@broadcom.com>
 <20200526191303.1492-10-james.quinlan@broadcom.com>
User-Agent: Evolution 3.36.2 
MIME-Version: 1.0
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE
 TREE" <devicetree@vger.kernel.org>, "Rafael J.
 Wysocki" <rafael.j.wysocki@intel.com>, Saravana Kannan <saravanak@google.com>,
 Corey Minyard <minyard@acm.org>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Oliver Neukum <oneukum@suse.com>, Robin Murphy <robin.murphy@arm.com>,
 open list <linux-kernel@vger.kernel.org>, Wolfram Sang <wsa@kernel.org>,
 "open list:DMA MAPPING HELPERS" <iommu@lists.linux-foundation.org>,
 Rob Herring <robh+dt@kernel.org>, Alan Stern <stern@rowland.harvard.edu>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Frank Rowand <frowand.list@gmail.com>,
 "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>
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
Content-Type: multipart/mixed; boundary="===============1828357412005296841=="
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>


--===============1828357412005296841==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-U+7wZGgMLMRLCbS+rYVu"


--=-U+7wZGgMLMRLCbS+rYVu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jim,
one thing comes to mind, there is a small test suite in drivers/of/unittest=
.c
(specifically of_unittest_pci_dma_ranges()) you could extend it to include =
your
use cases.

On Tue, 2020-05-26 at 15:12 -0400, Jim Quinlan wrote:
> The new field in struct device 'dma_pfn_offset_map' is used to facilitate
> the use of multiple pfn offsets between cpu addrs and dma addrs.  It is
> similar to 'dma_pfn_offset' except that the offset chosen depends on the
> cpu or dma address involved.
>=20
> Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
> ---
>  drivers/of/address.c        | 65 +++++++++++++++++++++++++++++++++++--
>  drivers/usb/core/message.c  |  3 ++
>  drivers/usb/core/usb.c      |  3 ++
>  include/linux/device.h      | 10 +++++-
>  include/linux/dma-direct.h  | 10 ++++--
>  include/linux/dma-mapping.h | 46 ++++++++++++++++++++++++++
>  kernel/dma/Kconfig          | 13 ++++++++
>  7 files changed, 144 insertions(+), 6 deletions(-)
>=20

[...]

> @@ -977,10 +1020,19 @@ int of_dma_get_range(struct device *dev, struct
> device_node *np, u64 *dma_addr,
>  		pr_debug("dma_addr(%llx) cpu_addr(%llx) size(%llx)\n",
>  			 range.bus_addr, range.cpu_addr, range.size);
> =20
> +		num_ranges++;
>  		if (dma_offset && range.cpu_addr - range.bus_addr !=3D dma_offset)
> {
> -			pr_warn("Can't handle multiple dma-ranges with different
> offsets on node(%pOF)\n", node);
> -			/* Don't error out as we'd break some existing DTs */
> -			continue;
> +			if (!IS_ENABLED(CONFIG_DMA_PFN_OFFSET_MAP)) {
> +				pr_warn("Can't handle multiple dma-ranges with
> different offsets on node(%pOF)\n", node);
> +				pr_warn("Perhaps set DMA_PFN_OFFSET_MAP=3Dy?\n");
> +				/*
> +				 * Don't error out as we'd break some existing
> +				 * DTs that are using configs w/o
> +				 * CONFIG_DMA_PFN_OFFSET_MAP set.
> +				 */
> +				continue;

dev->bus_dma_limit is set in of_dma_configure(), this function's caller, ba=
sed
on dma_start's value (set after this continue). So you'd be effectively set=
ting
the dev->bus_dma_limit to whatever we get from the first dma-range.

This can be troublesome depending on how the dma-ranges are setup, for exam=
ple
if the first dma-range doesn't include the CMA area, in arm64 generally set=
 as
high as possible in ZONE_DMA32, that would render it useless for
dma/{direct/swiotlb}. Again depending on the bus_dma_limit value, if smalle=
r
than ZONE_DMA you'd be unable to allocate any DMA memory.

IMO, a solution to this calls for a revamp of dma-direct's dma_capable(): m=
atch
the target DMA memory area with each dma-range we have to see if it fits.

> +			}
> +			dma_multi_pfn_offset =3D true;
>  		}
>  		dma_offset =3D range.cpu_addr - range.bus_addr;
> =20
> @@ -991,6 +1043,13 @@ int of_dma_get_range(struct device *dev, struct
> device_node *np, u64 *dma_addr,
>  			dma_end =3D range.bus_addr + range.size;
>  	}
> =20
> +	if (dma_multi_pfn_offset) {
> +		dma_offset =3D 0;
> +		ret =3D attach_dma_pfn_offset_map(dev, node, num_ranges);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	if (dma_start >=3D dma_end) {
>  		ret =3D -EINVAL;
>  		pr_debug("Invalid DMA ranges configuration on node(%pOF)\n",
> diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
> index 6197938dcc2d..aaa3e58f5eb4 100644
> --- a/drivers/usb/core/message.c
> +++ b/drivers/usb/core/message.c
> @@ -1960,6 +1960,9 @@ int usb_set_configuration(struct usb_device *dev, i=
nt
> configuration)
>  		 */
>  		intf->dev.dma_mask =3D dev->dev.dma_mask;
>  		intf->dev.dma_pfn_offset =3D dev->dev.dma_pfn_offset;
> +#ifdef CONFIG_DMA_PFN_OFFSET_MAP
> +		intf->dev.dma_pfn_offset_map =3D dev->dev.dma_pfn_offset_map;
> +#endif

Thanks for looking at this, that said, I see more instances of drivers chan=
ging
dma_pfn_offset outside of the core code. Why not doing this there too?

Also, are we 100% sure that dev->dev.dma_pfn_offset isn't going to be freed
before we're done using intf->dev? Maybe it's safer to copy the ranges?

>  		INIT_WORK(&intf->reset_ws, __usb_queue_reset_device);
>  		intf->minor =3D -1;
>  		device_initialize(&intf->dev);
> diff --git a/drivers/usb/core/usb.c b/drivers/usb/core/usb.c
> index f16c26dc079d..d2ed4d90e56e 100644
> --- a/drivers/usb/core/usb.c
> +++ b/drivers/usb/core/usb.c
> @@ -612,6 +612,9 @@ struct usb_device *usb_alloc_dev(struct usb_device
> *parent,
>  	 */
>  	dev->dev.dma_mask =3D bus->sysdev->dma_mask;
>  	dev->dev.dma_pfn_offset =3D bus->sysdev->dma_pfn_offset;
> +#ifdef CONFIG_DMA_PFN_OFFSET_MAP
> +	dev->dev.dma_pfn_offset_map =3D bus->sysdev->dma_pfn_offset_map;
> +#endif
>  	set_dev_node(&dev->dev, dev_to_node(bus->sysdev));
>  	dev->state =3D USB_STATE_ATTACHED;
>  	dev->lpm_disable_count =3D 1;
> diff --git a/include/linux/device.h b/include/linux/device.h
> index ac8e37cd716a..67a240ad4fc5 100644
> --- a/include/linux/device.h
> +++ b/include/linux/device.h
> @@ -493,6 +493,8 @@ struct dev_links_info {
>   * @bus_dma_limit: Limit of an upstream bridge or bus which imposes a sm=
aller
>   *		DMA limit than the device itself supports.
>   * @dma_pfn_offset: offset of DMA memory range relatively of RAM
> + * @dma_pfn_offset_map:	Like dma_pfn_offset but used when there are
> multiple
> + *		pfn offsets for multiple dma-ranges.
>   * @dma_parms:	A low level driver may set these to teach IOMMU code
> about
>   * 		segment limitations.
>   * @dma_pools:	Dma pools (if dma'ble device).
> @@ -578,7 +580,13 @@ struct device {
>  					     allocations such descriptors. */
>  	u64		bus_dma_limit;	/* upstream dma constraint */
>  	unsigned long	dma_pfn_offset;
> -
> +#ifdef CONFIG_DMA_PFN_OFFSET_MAP
> +	const struct dma_pfn_offset_region *dma_pfn_offset_map;
> +					/* Like dma_pfn_offset, but for
> +					 * the unlikely case of multiple
> +					 * offsets. If non-null, dma_pfn_offset
> +					 * will be set to 0. */
> +#endif

I'm still sad this doesn't fully replace dma_pfn_offset & bus_dma_limit. I =
feel
the extra logic involved in incorporating this as default isn't going to be
noticeable as far as performance is concerned to single dma-range users, an=
d
it'd make for a nicer DMA code. Also you'd force everyone to test their cha=
nges
on the multi dma-ranges code path, as opposed to having this disabled 99.9%=
 of
the time (hence broken every so often).

Note that I sympathize with the amount of work involved on improving that, =
so
better wait to hear what more knowledgeable people have to say about this :=
)

Regards,
Nicolas


--=-U+7wZGgMLMRLCbS+rYVu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl7OgHcACgkQlfZmHno8
x/5aqAgAtmbHeV7BQvfE3hZbzxOqDfPLkpXq6BB646SCtiQ/l3uzT6TBS2w8UQ7A
F8YkwGAEODoS8hAhImINqjrJHPAachmqkLICx7z3HKt2zDKJkAqIO3jOZTPtkBe2
ZNeOQslgtj9l5uUOmGC+84xeHa73PH8FbUFVCXnzksawH/YuNh5tR1MA3ooFLA9J
EVsNyDwxasfmnoANxbfNDqSFg8m5ycP0GyMQLo+LaV7McJSvlIfa4YFlTzJRVTiW
yj2tSkYtFosbMccUlBZPim1Uv/UKAk6LiXp1eD/S9pPeF8v0Gxa5aYBYUkXQ1Bxm
HdyI1X5a4AdEQzQmGSW4Oi1vbNM0iA==
=Xo2q
-----END PGP SIGNATURE-----

--=-U+7wZGgMLMRLCbS+rYVu--


--===============1828357412005296841==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
--===============1828357412005296841==--

