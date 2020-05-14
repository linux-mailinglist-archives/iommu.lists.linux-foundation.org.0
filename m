Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A971D30B1
	for <lists.iommu@lfdr.de>; Thu, 14 May 2020 15:09:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E57A187836;
	Thu, 14 May 2020 13:09:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3MZNSPNLLNSQ; Thu, 14 May 2020 13:09:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id F111C877CE;
	Thu, 14 May 2020 13:09:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DCE3DC016F;
	Thu, 14 May 2020 13:09:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 03C9DC016F
 for <iommu@lists.linux-foundation.org>; Thu, 14 May 2020 13:09:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E5E2189746
 for <iommu@lists.linux-foundation.org>; Thu, 14 May 2020 13:09:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XgRp4v9hd0XU for <iommu@lists.linux-foundation.org>;
 Thu, 14 May 2020 13:09:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 3DFBC8973B
 for <iommu@lists.linux-foundation.org>; Thu, 14 May 2020 13:09:09 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 385C05C026D;
 Thu, 14 May 2020 09:09:07 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 14 May 2020 09:09:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=X49GiuDf4PDo5pvDp+DDj6/4ujD
 zydI+cxg5rjxkb8Q=; b=PMerBt88FGdPWZPyvTAHbMuJPJC341fKMF5zRi+s8Yy
 sZ/jhoiFho0eotjCCkvOGfE3EjaA+h1BGB4VnqSLyxKdcAl6nSECocL0dRG240lq
 geze6iYR/nf74YzyrqtNNnTjhqbRkUV/UvFI/6asa2AAYUUUQZxrPlevbZ9dqBKg
 hkxumwuQ0a76LGI1Qe9OEIGV23M4/jles+c3qVaz+roiO9+k8FPNS88qaPUiltR4
 unHADLGOO7feMHaHDlHxe7zfm23BBmiNf/B062YQ9tg1L4C0JAYkjz2udGBQ7luO
 U9pZWgWAGnChEC0e6omE7QNSdnOmf/WuABIZ3TtFpQA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=X49Giu
 Df4PDo5pvDp+DDj6/4ujDzydI+cxg5rjxkb8Q=; b=B9P7z/rmXlEX8CrBMT5DbM
 ts901KvCWNbr71aaWaADAtx7EvkDKhq3KKjSQtGcYFsNx3/B7tnBXdU30sH+EfVw
 BZG6v1A4RSwqRXTyDqb5ne4sN9cOH/6GnueHAbiZQknBJt+wC+4NvfzjUZQCjK4b
 xkjrS7YL82gQWvFcTwV3Nsa31TFsn40hvr1Aug5NnPVHEB3DYAl5crDR3EghiyWg
 x6GYafx9/irgX0/LQikdzbq/jx1R5R/+nGFjhKsNIJLatUlpSzZCjqFMRJ7Jcxyj
 AKuT8Os4CC1Qpi8ILIUS9KBsILYNmW6PNjnyvueJlf8T5its0GPcr6E7x1911dVg
 ==
X-ME-Sender: <xms:7kK9XuqXZVmzoOgqAGSvzonpQKadd_8xBmGKTLQh2quEw5oekYZ9Fw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrleeigdehjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:7kK9XsoGbJbl7LISqne3Lv1MsLtKo0Ie8szc4RWVjI3JENzynBmb7g>
 <xmx:7kK9XjO4sH_omPfFJKa7yynl-MI9OuhJtfE6LWariLVqyUGuQZ_4OA>
 <xmx:7kK9Xt6ro3GOIJ9rIbp0jbLDVtiUps4BawGqnAyZYunheIqksT-aDA>
 <xmx:80K9Xg0hp1EhaAhLTnMC_e0UQ1wDwKMBo44WjMOJJoUA0w7VrV2zvA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 39825328005A;
 Thu, 14 May 2020 09:09:02 -0400 (EDT)
Date: Thu, 14 May 2020 15:09:00 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v4 0/5] iommu: Add Allwinner H6 IOMMU driver
Message-ID: <20200514130900.k4gvr3zcajg3rouc@gilmour.lan>
References: <cover.b27dedd61e008ffcf55a028ccddda3bb4d21dfc8.1589378833.git-series.maxime@cerno.tech>
 <20200514123855.GI18353@8bytes.org>
MIME-Version: 1.0
In-Reply-To: <20200514123855.GI18353@8bytes.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 iommu@lists.linux-foundation.org, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 linux-arm-kernel@lists.infradead.org
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
Content-Type: multipart/mixed; boundary="===============2070675057553425126=="
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>


--===============2070675057553425126==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nqnml6fovdrucnar"
Content-Disposition: inline


--nqnml6fovdrucnar
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2020 at 02:38:55PM +0200, Joerg Roedel wrote:
> On Wed, May 13, 2020 at 04:07:19PM +0200, Maxime Ripard wrote:
> > Maxime Ripard (5):
> >   dt-bindings: iommu: Add Allwinner H6 IOMMU bindings
> >   dt-bindings: display: sun8i-mixer: Allow for an iommu property
> >   iommu: Add Allwinner H6 IOMMU driver
> >   arm64: dts: allwinner: h6: Add IOMMU
> >   drm/sun4i: mixer: Call of_dma_configure if there's an IOMMU
>=20
> Applied all to the IOMMU tree, thanks. The code lives in the
> arm/allwinner branch.

Did you also merge the DTS and DRM patches?

Ideally, they should be merged through other trees to avoid the conflicts as
much as possible (arm-soc and drm-misc respectively).

If it's an option, could you drop all of them but "dt-bindings: iommu: Add
Allwinner H6 IOMMU bindings" and "iommu: Add Allwinner H6 IOMMU driver"?

> Please use 'iommu/sun50i: <Capital Letter>...' as the pattern for your fu=
ture
> subject lines when changing the driver.

I'll try to remember that, thanks! :)

> I also have two fixes on-top which I will send out shortly and add to
> that branch.

Ugh. I'm not sure how the first one slipped through.. Sorry for that, I'm f=
ine
with both.

Thanks!
Maxime

--nqnml6fovdrucnar
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXr1C7AAKCRDj7w1vZxhR
xXGkAP0Y56azc0zLB0nzAvlu6+1IBmkd/BHghzQYprbgXKwlHgEAq0vPPaxdykZf
e5mP7oAXBQpOFWak0Bg5vMTZ6fX92Q0=
=33ck
-----END PGP SIGNATURE-----

--nqnml6fovdrucnar--

--===============2070675057553425126==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
--===============2070675057553425126==--
