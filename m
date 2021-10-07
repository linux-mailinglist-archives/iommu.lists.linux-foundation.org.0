Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id D40674258C2
	for <lists.iommu@lfdr.de>; Thu,  7 Oct 2021 19:02:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 732A1843EB;
	Thu,  7 Oct 2021 17:02:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WCYEHqE1Bd7L; Thu,  7 Oct 2021 17:02:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 81B4B843BD;
	Thu,  7 Oct 2021 17:02:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4F4EBC001E;
	Thu,  7 Oct 2021 17:02:18 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 447B3C000D
 for <iommu@lists.linux-foundation.org>; Thu,  7 Oct 2021 17:02:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 26EE9403AA
 for <iommu@lists.linux-foundation.org>; Thu,  7 Oct 2021 17:02:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nWQBO9nJd1mI for <iommu@lists.linux-foundation.org>;
 Thu,  7 Oct 2021 17:02:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 444F2402E9
 for <iommu@lists.linux-foundation.org>; Thu,  7 Oct 2021 17:02:10 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id r18so21180177wrg.6
 for <iommu@lists.linux-foundation.org>; Thu, 07 Oct 2021 10:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=4i3GVmpkBuD3m3Dx++9hKY9H5Zr+5vF1Cseny6w5ZcE=;
 b=ayFMQsGJOdGUZ1MVTHTYDiZ1SQc6yze4ghyhItnIni3RQ6J67klDWuwGH42IOH+nJg
 5tlO0ZVqzUWHDqJLUpaD45xszQxcRtBv1p9VUHdyIYwkrWRze0j3a0Is+2i7Y8ITkbk6
 N1FUIm1G1eFOpdzLtQUGzMm4NLXYV9dHfXfC7rumNPJlXd3YBtztiCv71q+ddCxGuvZ/
 QuyI8Ax8QFpUBtNsswLR8L7lBmdO0QKvOznAWLOobCnhe547npz7cDvmR27CXF58qKO+
 dtxiaB3YEP64mX3PbAyJ1j8u+XA8RrfTtXqNoXCr4AP4XRmcutHgG1mYHeMucHysNipO
 9lRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=4i3GVmpkBuD3m3Dx++9hKY9H5Zr+5vF1Cseny6w5ZcE=;
 b=ge/X5AlRHCmKKc8qSJuNUZ9hAvCKC9YVr5a3OTiz6o9vZVkFVPxr4P3ZAnBsjB1ffz
 sdYJ6l4FDuCfZUe7cSskLwf6LxDNcprks1JDMZlkdBQMprfXl3aP6XQdJOvna7Q/tU1y
 n9YE9CYjr+YMgsPT2C+T+p0BmQAoSYA0UudSbdIyRwd7VLKFGCzA0xlN7Fk06a1+/MbQ
 ZpXhnr6hcF6z02IDL5iOxbq/2VHTIvDqG7sCctlKEta/86oI1l5CUcSfU5iWQh4m6rsQ
 dwcz4xHgFr2cUhfychsIZbkY7/Wd8gqmfa7dMfMeHzzURQRrGQvpR0MRaahGbvRPEg0m
 R1Pw==
X-Gm-Message-State: AOAM532rxAsLdtRL40V5NDeDXVXLlx/+J86uT4FAjp1ulg3k52lvjdpE
 uGtKOy5lwd5a12K9wM3kW1k=
X-Google-Smtp-Source: ABdhPJztK3Ymj0FVvTj85HCmP4sz33hCB1vgj2DcsLNkHyhcBy4oQgS6eSoRfo+Q7Joqansxy3VJ2Q==
X-Received: by 2002:a05:600c:3b21:: with SMTP id
 m33mr5805316wms.80.1633626128447; 
 Thu, 07 Oct 2021 10:02:08 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id d8sm174568wrv.80.2021.10.07.10.02.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 10:02:07 -0700 (PDT)
Date: Thu, 7 Oct 2021 19:02:06 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Subject: Re: [PATCH v6 5/6] iommu/tegra-smmu: Attach as pointer to
 tegra_smmu_group
Message-ID: <YV8oDrIweDV3Mo++@orome.fritz.box>
References: <20210914013858.31192-1-nicoleotsuka@gmail.com>
 <20210914013858.31192-6-nicoleotsuka@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210914013858.31192-6-nicoleotsuka@gmail.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 jonathanh@nvidia.com, linux-tegra@vger.kernel.org, digetx@gmail.com,
 will@kernel.org
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
Content-Type: multipart/mixed; boundary="===============5956380556421482801=="
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>


--===============5956380556421482801==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9bn30aZWl2it19YI"
Content-Disposition: inline


--9bn30aZWl2it19YI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 13, 2021 at 06:38:57PM -0700, Nicolin Chen wrote:
> This could ease driver to access corresponding as pointer
> when having tegra_smmu_group pointer only, which can help
> new mappings debugfs nodes.
>=20
> Also moving tegra_smmu_find_group_soc() upward, for using
> it in new tegra_smmu_attach_as(); and it's better to have
> all tegra_smmu_find_* functions together.
>=20
> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> ---
>  drivers/iommu/tegra-smmu.c | 94 +++++++++++++++++++++++++++++++-------
>  1 file changed, 78 insertions(+), 16 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--9bn30aZWl2it19YI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmFfKA4ACgkQ3SOs138+
s6Fisg//YTpYUjCFbuDVLZtxhX/A7K4EQHHaz4cKA4GOVp54LNy4eEX6BNOsHo9/
fkWFS3/4n5WmT+NRbwicvBJz2OTTDDzZfZPumPO5RUh1W95O7TaD8NJba0eKT+qD
+W9EESBwVQhDoPMC56Pfiuri+4HUY/QvPWSH90fG3eFbAuCwEOYYlEsoll/B7d+x
OmgnnZD8UQeV/84HpAZNQ5S20KmvWhXL6uP7AzPWXfU084UFt8oh4ozmPqu/qoCg
BZtxmlFp1M77UTmlwSgqVbI0F7X2iY1pmxviJjhJ0iU44UWCE5AxlKVtNwYooyJV
yIwuHh5B3VJq5F6JhHXa55OPS0IYwS4+nM9HlSDHPIYwjZCwhPxTuQ+3UfvsWUrJ
rlUyqtXJxq3juJT3q//uQk+LSBbE3HTx0gOlng0Wo3eA7c1KLXvgq0OWIW+g445Z
hV9kQPYa7aVciNYF2YvGqnzFuCZLl65zZiO5yfVJHI2K4ynO8attd6IEuioc6ML8
J0XaI7j/16l8wyi5JvQ82M4WxhHsy7Yl6OrpsuC0Jv50tIg++YZ6oxYKXfAYumaL
RzE9xwZbSlMN56gljpkhqgxmUU7ibmvxdZM681V2uydFHCEjvI2iJQfwkCtgqyjt
yRy7dkap/ebKVI6+gEijJHQIWPNM+ZN/VjDXxpFMOceW3nQVXDU=
=mbcy
-----END PGP SIGNATURE-----

--9bn30aZWl2it19YI--

--===============5956380556421482801==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
--===============5956380556421482801==--
