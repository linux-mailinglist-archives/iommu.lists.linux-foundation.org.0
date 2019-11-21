Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AAEE104F11
	for <lists.iommu@lfdr.de>; Thu, 21 Nov 2019 10:19:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 6E14C2094E;
	Thu, 21 Nov 2019 09:19:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id euduUeDJ+Z9b; Thu, 21 Nov 2019 09:19:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 5A1FF20778;
	Thu, 21 Nov 2019 09:19:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 468FCC1DD8;
	Thu, 21 Nov 2019 09:19:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 111ADC18DA
 for <iommu@lists.linux-foundation.org>; Thu, 21 Nov 2019 09:19:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0B64F887B1
 for <iommu@lists.linux-foundation.org>; Thu, 21 Nov 2019 09:19:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wo-UJ4Ttv0aP for <iommu@lists.linux-foundation.org>;
 Thu, 21 Nov 2019 09:19:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9B5E5887B0
 for <iommu@lists.linux-foundation.org>; Thu, 21 Nov 2019 09:19:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 134B7B324;
 Thu, 21 Nov 2019 09:19:01 +0000 (UTC)
Message-ID: <f7c09f06913fa1ed5e98c55ebe6d9db81bf232c0.camel@suse.de>
Subject: Re: [PATCH] dma-mapping: treat dev->bus_dma_mask as a DMA limit
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Christoph Hellwig <hch@lst.de>, Robin Murphy <robin.murphy@arm.com>
Date: Thu, 21 Nov 2019 10:18:54 +0100
In-Reply-To: <20191121073152.GB24024@lst.de>
References: <20191113161340.27228-1-nsaenzjulienne@suse.de>
 <dd074ef5c23ba56598e92be19e8e25ae31b75f93.camel@suse.de>
 <20191119170006.GA19569@lst.de>
 <7609007d-52f5-bb10-e8d5-96fadbfab46d@arm.com>
 <20191121073152.GB24024@lst.de>
User-Agent: Evolution 3.34.1 
MIME-Version: 1.0
Cc: Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org,
 linux-ide@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Frank Rowand <frowand.list@gmail.com>,
 Hanjun Guo <guohanjun@huawei.com>, Paul Burton <paulburton@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org, phil@raspberrypi.org,
 linux-acpi@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 linux-pci@vger.kernel.org, James Hogan <jhogan@kernel.org>,
 Len Brown <lenb@kernel.org>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Jens Axboe <axboe@kernel.dk>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 linux-mips@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
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
Content-Type: multipart/mixed; boundary="===============2402638163730196244=="
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>


--===============2402638163730196244==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-lq+O6sjXzX+AgzEMEd7n"


--=-lq+O6sjXzX+AgzEMEd7n
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2019-11-21 at 08:31 +0100, Christoph Hellwig wrote:
> On Tue, Nov 19, 2019 at 05:17:03PM +0000, Robin Murphy wrote:
> > TBH I can't see it being a massive problem even if the DMA patch, drive=
r=20
> > and DTS patch went entirely separately via the respective DMA, PCI, and=
=20
> > arm-soc trees in the same cycle. Bisecting over a merge window is a big=
=20
> > enough pain in the bum as it is, and if the worst case is that someone=
=20
> > trying to do that on a Pi4 has a wonky PCI controller appear for a coup=
le=20
> > of commits, they may as well just disable that driver for their bisecti=
on,=20
> > because it wasn't there at the start so can't possibly be the thing the=
y're=20
> > looking for regressions in ;)
>=20
> Agreed.
>=20
> Nicolas, can you send a respin?  That way I can still queue it up
> for 5.5.

Oh, I thought it was too late for that already. I'll send it in a minute.

Regards,
Nicolas


--=-lq+O6sjXzX+AgzEMEd7n
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl3WVn4ACgkQlfZmHno8
x/6kBwf/SKtubLT3BK6PDi2kFxS7U1Nuy9X/MqsOPMdQNIIzccK4WqpweJsn3fn7
WUh4Tsn5H2fjaeqsOCLpG5PeYLO6nDWDmCzVszhsyBjqWczikEWQ8reuCbXbbW6G
rUh1wlp8+VDFDs0reFtW9POlYcvxixcMmbkSjKPEtZCh/GjdgIcjdkCtvwGkdrE1
8E8Z6K9lqyiB2WQ0z7tdOf3fglQwJ7HxRgsmlYm1u0UQCm3+Hdrvy2hO7X/OYhtB
4JbPmzPk62RNUjdmnuJ8t2ar57gMQ4VwRi7hjfCir9Iq8t/B7vCzCAQnzREpL05w
BEUfJlvCYEvS3eArOErmv3Mm+/ugdg==
=NUIQ
-----END PGP SIGNATURE-----

--=-lq+O6sjXzX+AgzEMEd7n--


--===============2402638163730196244==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
--===============2402638163730196244==--

