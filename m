Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C5B2833B5
	for <lists.iommu@lfdr.de>; Mon,  5 Oct 2020 11:58:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 93AE785CDB;
	Mon,  5 Oct 2020 09:58:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cw3QgyEBZJ6i; Mon,  5 Oct 2020 09:58:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1512085C8F;
	Mon,  5 Oct 2020 09:58:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F1B72C0051;
	Mon,  5 Oct 2020 09:58:00 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1D9ADC0051
 for <iommu@lists.linux-foundation.org>; Mon,  5 Oct 2020 09:58:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0C44F85CDB
 for <iommu@lists.linux-foundation.org>; Mon,  5 Oct 2020 09:58:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tiHoeqzva6Rb for <iommu@lists.linux-foundation.org>;
 Mon,  5 Oct 2020 09:57:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
 [209.85.218.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 3B13085C8F
 for <iommu@lists.linux-foundation.org>; Mon,  5 Oct 2020 09:57:59 +0000 (UTC)
Received: by mail-ej1-f65.google.com with SMTP id md26so10989496ejb.10
 for <iommu@lists.linux-foundation.org>; Mon, 05 Oct 2020 02:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=g7GU/AkNe3daV6icPj0oXO9lJvefNEYI/yjHaeqAgzE=;
 b=gBUQ0LSt7aRNbGRSly36vsk68h5MeQHGUEn5PNiLM2tUNHqmKSTnY8ucIH9CGASvH9
 rOJPQrzqJqSjm3vjFOrbslhgFs5YeoVz1zreVI5Gn6XBXNMw/d84OAP+qdX8kL/5r86P
 7glbh+AwxUOSfftniDaU0W2qVJt5k9afxilwP9Vy1tLVYK/RQkv84fzXbQVBr5MHJcP1
 dwD6ae8+OT4dchO1S0XKYhHRZLYJ9/gH4QQuuWa7PnLn9Xgc3BL298FJgx0vpPuMAIp6
 vUWdisshy3dX91w/R534wVAH9qQmaRONx5nTE7PWr1p6CyyDHyGoPmcpaa+xkQj2n296
 xiNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=g7GU/AkNe3daV6icPj0oXO9lJvefNEYI/yjHaeqAgzE=;
 b=j/LxrLGMnEUX61W8uMCzY2iaHwdvXxsSdev/hcwEjhKLw9qAzvB5KLkKrwkvu6a1il
 MueBNJnS9xPYq+hvGSGqlRrGABHCEUe2j3TyMXEAlmubJSSB8k+S8KRzgHHh+iXhQSrd
 EaAkHshx9wMHLMNfVVBEV+JJ1wsvDFWG+sdtQq0Zw84sU8wjaRvypKSFnNBpTMgaKCF7
 XBY99S9YUM+Sw6pV3CJfd9jr28RjWuUR693/NIuk+nXDMo3QYcKop6FFdYZ6/KgBcQKC
 Gj2pVvAuwN+EMVanJeOnJJagiOOJCd9ASRrDLX9ZifnlgJ8KmefY+I9VJ9dAUMkqpinH
 cxpg==
X-Gm-Message-State: AOAM5320t/El6p9RB6/CwWkbsmKVKBwUF0j7k2+5Gub+cY61I+PTeElF
 dOZza8DjVzm1xTyH20J3144=
X-Google-Smtp-Source: ABdhPJwE+3FLZlVeIjhlYl7qJ/LCobtIjgHrzHX4wuV+T11HeCElPqVpYQH4SuMwe2PbUJy/LNTACw==
X-Received: by 2002:a17:906:8399:: with SMTP id
 p25mr14654502ejx.243.1601891877401; 
 Mon, 05 Oct 2020 02:57:57 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id q10sm5385858ejb.117.2020.10.05.02.57.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2020 02:57:56 -0700 (PDT)
Date: Mon, 5 Oct 2020 11:57:54 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Subject: Re: [PATCH v4 2/3] iommu/tegra-smmu: Rework tegra_smmu_probe_device()
Message-ID: <20201005095754.GJ425362@ulmo>
References: <20201002060807.32138-1-nicoleotsuka@gmail.com>
 <20201002060807.32138-3-nicoleotsuka@gmail.com>
 <5542b314-f414-1e83-8cf6-2bf22a41ae9c@gmail.com>
 <20201002185828.GC29706@Asurada-Nvidia>
MIME-Version: 1.0
In-Reply-To: <20201002185828.GC29706@Asurada-Nvidia>
User-Agent: Mutt/1.14.7 (2020-08-29)
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
 Dmitry Osipenko <digetx@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============5402873361227007193=="
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>


--===============5402873361227007193==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fKov5AqTsvseSZ0Z"
Content-Disposition: inline


--fKov5AqTsvseSZ0Z
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 02, 2020 at 11:58:29AM -0700, Nicolin Chen wrote:
> On Fri, Oct 02, 2020 at 06:02:18PM +0300, Dmitry Osipenko wrote:
> > 02.10.2020 09:08, Nicolin Chen =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > >  static int tegra_smmu_of_xlate(struct device *dev,
> > >  			       struct of_phandle_args *args)
> > >  {
> > > +	struct platform_device *iommu_pdev =3D of_find_device_by_node(args-=
>np);
> > > +	struct tegra_mc *mc =3D platform_get_drvdata(iommu_pdev);
> > >  	u32 id =3D args->args[0];
> > > =20
> > > +	of_node_put(args->np);
> >=20
> > of_find_device_by_node() takes device reference and not the np
> > reference. This is a bug, please remove of_node_put().
>=20
> Looks like so. Replacing it with put_device(&iommu_pdev->dev);

Putting the put_device() here is wrong, though. You need to make sure
you keep a reference to it as long as you keep accessing the data that
is owned by it.

Like I said earlier, this is a bit weird in this case because we're
self-referencing, so iommu_pdev->dev is going to stay around as long as
the SMMU is. However, it might be worth to properly track the lifetime
anyway just so that the code can serve as a good example of how to do
things.

If you decide to go for the shortcut and not track this reference
properly, then at least you need to add a comment as to why it is safe
to do in this case. This ensures that readers are away of the
circumstances and don't copy this bad code into a context where the
circumstances are different.

Thierry

--fKov5AqTsvseSZ0Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl967iIACgkQ3SOs138+
s6FMlQ/+PI2U3e9+14M09UT7Av+BBmD/Af5CKPGXxy5A3EG9pX97uPO6q6kt30/1
5VnVWJnXCZESSl2ZFNwXcTOrSZ6Pre5QUH8LTM7TG+QcJH3bSn1wk7jZj6snYOto
z9scPx+zNCqw1lyMbiEd+GkI5DVrrGM6qFH2wESur0ZNn4VUO//DWhOUH62uM1tc
SuByO6o1fcf66jjb6AHwd79BaIXn6E7rKEdQpRFdTmFhZVxCae2fVeETtQ7IPhBL
t4K5SBNjdv/2bD1GEKvOgt2ZufQGqkmB52cCW4FFvv+sSzi3nlv3c1W8hMWGgptA
l/wCei1ZGNU0bwM/Vk+f+/LYjveIarkYsVmZOoamvcliCtnpmpkhznqJy2MJf5GV
jqYQqzG8WyU0JW3vO6jqTz421YmNqajs82APyv7wHn5/Vq4oicDEh67RQvSqxzV5
t1gnQaS19CsoB8TLDJE8VYUGnnZ5mxcNwE+P4dy65O21KmyzjJSkwmzSSfaGklG9
6xLedqfYr2c1YkEiPjYrwpDuLa5ID7A9ohk8x4dkd2OCz/80f4QBnJNt7uv5la1N
U91E6tJ2cLMkQdxP3RQatyYRlkZk/IQTwtQ9LwuQkAmB/PGb9HcfhGc7cPz2UPZA
QQ8+ZwFqEJrHlmVudKnjX1HU+FRSvzu3ComceNZjbqXaEd+F9NU=
=jGLH
-----END PGP SIGNATURE-----

--fKov5AqTsvseSZ0Z--

--===============5402873361227007193==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
--===============5402873361227007193==--
