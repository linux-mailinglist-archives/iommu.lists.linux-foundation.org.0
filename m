Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 2522344409
	for <lists.iommu@lfdr.de>; Thu, 13 Jun 2019 18:35:32 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C4104F21;
	Thu, 13 Jun 2019 16:35:30 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id BE5D8F1A
	for <iommu@lists.linux-foundation.org>;
	Thu, 13 Jun 2019 16:35:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 48D7076D
	for <iommu@lists.linux-foundation.org>;
	Thu, 13 Jun 2019 16:35:28 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id s3so10909187wms.2
	for <iommu@lists.linux-foundation.org>;
	Thu, 13 Jun 2019 09:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=CdU3AkHiGyVIlUJsXB82LDChYizZRFvTCAKkkb1a9Bo=;
	b=d21HABiSP22hYq6h2HqZvldGkD4KwFsLbe2nO07JgkifWj0n4vD0ejq10JdusropKA
	YP96a/ggrRLmwTlidX1zYOwLTTXsiJH551QUJmoK4cBh4WpCxGKz8Kn/uYGhb06UfZ6N
	j4RdWgRKhPgN188N8oiDPBv7oyI+9je3uKohQdNf8sDXc3H4AbKIcuQ78mwtlfjhhR3B
	zzFLHCGl6Fo1DTuchVDz1NHIjsQaDgroHBpaqatm9Se8lPtL4zAs0xVTjn3sgeW9GJn3
	iB9UyijNjXwP/DSzbp2aWx+gJ6Z0MzidOSvO9rdIx9m/7DS/nsMx/v6vhYTVOkMvACWL
	mNMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=CdU3AkHiGyVIlUJsXB82LDChYizZRFvTCAKkkb1a9Bo=;
	b=QpkaDhxtJILUZfTE5opj8wTviFV2ZxghuJQltr3eJYg1B+3PYWT6JnKMGi24dMEiFw
	9C+pSSY21m1PCNtrR/Wx3DMcyfGAMqGotfVJNE5X5Va6qyjiHlxU1wiw5E5GV4Y7tUDD
	oNi+mmMe+//cB7/scVoAhM/8O3cYIAaZbsCaz3J6NRM6zrOzdNRw1kn+1Xu8nU6GQsCm
	OarOgSHN1N3OLu3jJaEAtNW0CnYPsJ1iuGJUoyVelaA3t8FjkL8dsxKvqUrvSQ5U9krG
	sQhX4nBcSB7Adt7EX77tLcztmjOJKlu8fBmAY2Vn/d4ryaCqim8eofbwEQ3Tub0OeDTk
	7hag==
X-Gm-Message-State: APjAAAXYpE39xiBXSPF2baYW7GGt2UuWPJhRRHngyaHhWsCU6HZBxyvy
	JjS0FvBhAl3oyQIoJIji4a4=
X-Google-Smtp-Source: APXvYqzTMsGQ5gi7WuA5z1F9IWEkNjr/KmvxNpinkh3KQ2V8PASKooKQ8TQ9V8D6BrB+t6HYIGVZmQ==
X-Received: by 2002:a7b:c251:: with SMTP id b17mr4698049wmj.143.1560443726939; 
	Thu, 13 Jun 2019 09:35:26 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
	by smtp.gmail.com with ESMTPSA id d18sm223569wrn.26.2019.06.13.09.35.25
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 13 Jun 2019 09:35:26 -0700 (PDT)
Date: Thu, 13 Jun 2019 18:35:25 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Yangtao Li <tiny.windzz@gmail.com>
Subject: Re: [PATCH 10/10] iommu/tegra-smmu: convert to SPDX license tags
Message-ID: <20190613163525.GB3258@ulmo>
References: <20190613162703.986-1-tiny.windzz@gmail.com>
	<20190613162703.986-10-tiny.windzz@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190613162703.986-10-tiny.windzz@gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-samsung-soc@vger.kernel.org, heiko@sntech.de,
	iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
	will.deacon@arm.com, agross@kernel.org, krzk@kernel.org,
	jonathanh@nvidia.com, david.brown@linaro.org, kgene@kernel.org,
	linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-rockchip@lists.infradead.org, robin.murphy@arm.com,
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
Content-Type: multipart/mixed; boundary="===============5657694717631071545=="
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org


--===============5657694717631071545==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xgyAXRrhYN0wYx8y"
Content-Disposition: inline


--xgyAXRrhYN0wYx8y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 13, 2019 at 12:27:03PM -0400, Yangtao Li wrote:
> Updates license to use SPDX-License-Identifier.
>=20
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> ---
>  drivers/iommu/tegra-smmu.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--xgyAXRrhYN0wYx8y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0Ce00ACgkQ3SOs138+
s6FKzA//cTztUQT0grkWSjIr7uw4dhz8d4QkKoLpgJNMBy86/9lW7oGsYjGSTQd8
TElU4HT1/mbjm22/k8CS7uzTkDVIzJpLTMWIsvzJ8xlBD81/lnzau+NgzFxbCe+D
4FwpGJd9wsi1b3h1eWFzxsrY8xi17liG26hKPMl5I0uvPs0XXgIJxLvxshpwU5IH
p+Q7EDpSkcbtyxJCFcVNWQsAi0SsDawMHk42EHYEZYqgywlMfWqW/nisTODLcQGy
dWKABd5zclXza3ISw77plAvPu/7XZ79QGOLVadS2qEydL2Ec8cJg2JZovnn3hl3U
5Q7R7dq+3ArKEQXYiUhUNxNJ+pjiusO2mgn2elLB8gMcf3UehFZ6lVhFbkOete7H
rA5gaZhZd1nDC9J3wuTnCjlLDvWB/IcapgPLEiP1rvvAUJCgaQmAWgzsJs8wXm1B
robCwCzXX9q7ktjBLpeVGrrFtPDruXHWC1qcQI//nJdr7QPhliTbgrSt5+H83eY/
07UXShb9r+n+v4j8slwC6G9uuMZzq0o0OowDC3PXc5S+GXruiyVt1wB2+Z6RTvbF
P0mHLRfpPnsxC9YBejsrhVCRWHS71CQc9xuuRczo0smJXlmb3sU5KGZhZJaHWNTs
nPbGRR7vEW3lhNbSpACEZzLweA6/ALaRgri+qx3cHHnx6biX+A4=
=nAP7
-----END PGP SIGNATURE-----

--xgyAXRrhYN0wYx8y--

--===============5657694717631071545==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
--===============5657694717631071545==--
