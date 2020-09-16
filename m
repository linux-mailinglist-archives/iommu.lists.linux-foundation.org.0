Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 6885826C665
	for <lists.iommu@lfdr.de>; Wed, 16 Sep 2020 19:48:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 1695620774;
	Wed, 16 Sep 2020 17:48:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8dBloNpl7d+E; Wed, 16 Sep 2020 17:47:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 300EE2DE6B;
	Wed, 16 Sep 2020 17:47:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1C44DC0051;
	Wed, 16 Sep 2020 17:47:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5D7F6C0051
 for <iommu@lists.linux-foundation.org>; Wed, 16 Sep 2020 17:04:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 219972BC43
 for <iommu@lists.linux-foundation.org>; Wed, 16 Sep 2020 17:04:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V-sJmv6gXVUP for <iommu@lists.linux-foundation.org>;
 Wed, 16 Sep 2020 17:04:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by silver.osuosl.org (Postfix) with ESMTPS id BEC1E275A5
 for <iommu@lists.linux-foundation.org>; Wed, 16 Sep 2020 17:04:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id 981522711D2
Date: Wed, 16 Sep 2020 13:04:09 -0400
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 0/3] drm: panfrost: Coherency support
Message-ID: <20200916170409.GA2543@kevin>
References: <cover.1600213517.git.robin.murphy@arm.com>
 <d109e9da-feb3-c09f-2b7f-98c92ce39593@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <d109e9da-feb3-c09f-2b7f-98c92ce39593@baylibre.com>
X-Mailman-Approved-At: Wed, 16 Sep 2020 17:47:26 +0000
Cc: robh@kernel.org, tomeu.vizoso@collabora.com,
 Robin Murphy <robin.murphy@arm.com>, dri-devel@lists.freedesktop.org,
 steven.price@arm.com, iommu@lists.linux-foundation.org, khilman@baylibre.com,
 linux-amlogic@lists.infradead.org, will@kernel.org,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
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
Content-Type: multipart/mixed; boundary="===============2658711551411326885=="
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>


--===============2658711551411326885==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EVF5PPMfhYS0aIcm"
Content-Disposition: inline


--EVF5PPMfhYS0aIcm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> So I get a performance regression with the dma-coherent approach, even if it's
> clearly the cleaner.

That's bizarre -- this should really be the faster of the two.

--EVF5PPMfhYS0aIcm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQ17gm7CvANAdqvY4/v5QWgr1WA0FAl9iRX8ACgkQ/v5QWgr1
WA0Fsg//Qy1ZMY68LHnG0Sv9WWMIPx28MJoZmed9VIQ5jMu951cNntKyVqqUVGJf
GAHSFPbAEPpbocf35MhRwm12dLx4SyomgpwavHF0Lkx9e/XkgCJz5n2yZBNvHikV
UP/R31ETfND5V4oRfLdHodJrNNyVabFk5PsWBVbgefRCxysLK+Pq1uXvsWeY5cUW
Nond4DUoQ48S+AMXUCaLFCjfNcqq3Jt1Juh1x2fW61pGdvCWoPHV9u2niQ3ylTiz
l6v105u/j4SvHALH2eW+mxfxNSBwS2kIkMTZdPzD8bTnh8N3DBokcwRpPw2LSR/O
UNPLxSfiTQVrvj5TX/VXBvK2B8eFph0lCMvtoUSt88WZ5xo+RZBkMZdXkOaXgMdt
eyhPLCXOWkLcyA/qPeElvCmRsJ3vrT1XSrfqZkq3Hx3XAedaFYEw2mXGVWRo8XAI
27zYwkyzvWweUR+QkC8HK4fpiXs8/x+rF/cGT3zfDU0VPpCOPLw8ZII/lGGKNazi
/0pocVSw+1IPg4OCdC26zjP9a1Drc5b5YIeLnnxwtb5+KcowkWG0sa4H5+CZ7zls
E4P2exzZCOeRAeqYZMzUWawGzkUCWKVnoxwYrWyyvbO/0eoreJ3kv50S+754JUOw
tAyaRpfGYLblm2cmC2xpckAtg1HekYaFIIphP1SZIm+iZTYv9+0=
=ZO+i
-----END PGP SIGNATURE-----

--EVF5PPMfhYS0aIcm--

--===============2658711551411326885==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
--===============2658711551411326885==--
