Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 52866FAE58
	for <lists.iommu@lfdr.de>; Wed, 13 Nov 2019 11:18:35 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 261301166;
	Wed, 13 Nov 2019 10:18:31 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 957891116
	for <iommu@lists.linux-foundation.org>;
	Wed, 13 Nov 2019 10:18:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 0BAEF102
	for <iommu@lists.linux-foundation.org>;
	Wed, 13 Nov 2019 10:18:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id CE8D6B547;
	Wed, 13 Nov 2019 10:18:26 +0000 (UTC)
Message-ID: <fc488c5ff7dc7e1b9d96660f0da9b423b3f5094a.camel@suse.de>
Subject: Re: unify the dma_capable definition
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Christoph Hellwig <hch@lst.de>, iommu@lists.linux-foundation.org, 
	Russell King <linux@armlinux.org.uk>
Date: Wed, 13 Nov 2019 11:18:25 +0100
In-Reply-To: <20191113073539.9660-1-hch@lst.de>
References: <20191113073539.9660-1-hch@lst.de>
User-Agent: Evolution 3.34.1 
MIME-Version: 1.0
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
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
Content-Type: multipart/mixed; boundary="===============1483135903638981418=="
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org


--===============1483135903638981418==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-cvyL9zADiQPcce4MqJVv"


--=-cvyL9zADiQPcce4MqJVv
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2019-11-13 at 08:35 +0100, Christoph Hellwig wrote:
> Hi all,
>=20
> there is no good reason to have different version of dma_capable.
> This series removes the arch overrides and also adds a few cleanups
> in the same area.

Reviewed-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>

for the whole series,
Thanks!


--=-cvyL9zADiQPcce4MqJVv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl3L2HEACgkQlfZmHno8
x/4wSQf/XC3BfmBQXcl1ZtWzTr+4bUfUUlsKGdPH0jSKURaYqy7S86ww5oUlbFMC
GIc3I7oN23Q6+p5XDoS/T+tZytUy7HyMB8Z6JRrMjigkV8t0gW58PbjzcHeYQxVL
XnfiZTwo/uVYqJyaPQFDmeHn2H8FpeJkX9oGPohHAY4QX6Iw/dc4cO9S6be933vr
ri4Hau+t8D6/9iT2Wkl7x7hUqinW1yo/6MXhyx44tCpT6RxAimXnK01Gb2G35hiO
t+qRXCA6dvnKlkm4wBQExVT9w1hJt0rHQpcnA5Psb16thfClv3X7esvIMAS4NiJO
mn9iwYlDzdlqgyHT8Qz+Q7qTS9YZog==
=EWiZ
-----END PGP SIGNATURE-----

--=-cvyL9zADiQPcce4MqJVv--


--===============1483135903638981418==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
--===============1483135903638981418==--

