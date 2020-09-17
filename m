Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9E826D947
	for <lists.iommu@lfdr.de>; Thu, 17 Sep 2020 12:41:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A3A228740B;
	Thu, 17 Sep 2020 10:41:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nfAJkA-DksB7; Thu, 17 Sep 2020 10:41:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1BE0D87369;
	Thu, 17 Sep 2020 10:41:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 042BDC089E;
	Thu, 17 Sep 2020 10:41:46 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E911AC0051
 for <iommu@lists.linux-foundation.org>; Thu, 17 Sep 2020 10:41:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id DB75287849
 for <iommu@lists.linux-foundation.org>; Thu, 17 Sep 2020 10:41:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tSqiJfXXdel6 for <iommu@lists.linux-foundation.org>;
 Thu, 17 Sep 2020 10:41:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 by whitealder.osuosl.org (Postfix) with ESMTPS id DCC2C875D7
 for <iommu@lists.linux-foundation.org>; Thu, 17 Sep 2020 10:41:43 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id a9so1536726wmm.2
 for <iommu@lists.linux-foundation.org>; Thu, 17 Sep 2020 03:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=X83+YxLNLakSEy2MO2kNdUk1vFYzpBNVVoYA7qc9Hv8=;
 b=r8Zs4fj610xUajyLYCKzJ7kAYSxcX52cD0GDHf40+fI98gr6h+EEWEzyMRb075ARrd
 I4sQVmOtKcmMh9a+5BNplnzJgXH3H25Zj9voFQqDQ+xop77fAYdWEjS1wT6K98E1DRCr
 BVBWvX6+Y0BzkRUk6UgA7Hgj3WPBr8HhdmogWFQYUibY6Mpol9wiICtNNiHZoEbj4+SZ
 8TrBabmozaC37Inx39cnR26MiNEG68s44MsDxPnMLY5nwuoubCF0djgum70p26BQBADS
 mcZ1QsQWAAvz4kTrJ++tk5PgAIVrK8UrUbAl4aLFZ1dr9p1vR+yQ+21BhkLKWpUdEnsT
 VrQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=X83+YxLNLakSEy2MO2kNdUk1vFYzpBNVVoYA7qc9Hv8=;
 b=W7X5pXKl5btH3s9kOKb4iDu3nl5fQo8FWss4QPydaOVvMuZC4dWyJbJiabDxx/ymJr
 VoI2j1bakDVtpQhbU3j6cBYVhMHUOV6zqcjcSvNoWauxxMvJ9aueVn49KyejjYsELFrO
 kA0cmpqvwc7pNSX0lW52lmBmXcllGvqNHi4CdA8yOdOrUEokyaTpKaIkKsIDVc/EUNv2
 LT5Jl5dByCzy8NVrYIVyJgwoICpROrPHDWfoFKlvYJP2QHjbcLiWPScyOA/S6fQQTQGJ
 mQ4n/e3kV1ogotZ5vQLiXtsRobfZS+dcVT/U4gMoMx9AZzcCc1bEO7Zgb04e+fLoMP8l
 jRig==
X-Gm-Message-State: AOAM530oOtv60sxJ4yennOUyN1rnuArcUqvv47dGW5/gxbfMXPFXoWgJ
 LhXVDCMbJ7jq0DhCBDpYcLA=
X-Google-Smtp-Source: ABdhPJzLaq0pt0bNv92XyZEyoER6JQVztwJxVRUOSMo+cF5R4NCHmce2JIVKbOJMi0TkQ/eTSVcYZA==
X-Received: by 2002:a1c:6a11:: with SMTP id f17mr8726659wmc.143.1600339302168; 
 Thu, 17 Sep 2020 03:41:42 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id y6sm38883203wrn.41.2020.09.17.03.41.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2020 03:41:40 -0700 (PDT)
Date: Thu, 17 Sep 2020 12:41:39 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Subject: Re: [PATCH] iommu/tegra-smmu: Fix tlb_mask
Message-ID: <20200917104139.GH3515672@ulmo>
References: <20200916002359.10823-1-nicoleotsuka@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200916002359.10823-1-nicoleotsuka@gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
Cc: linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 jonathanh@nvidia.com, iommu@lists.linux-foundation.org,
 linux-tegra@vger.kernel.org
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
Content-Type: multipart/mixed; boundary="===============4146144918286818374=="
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>


--===============4146144918286818374==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Yia77v5a8fyVHJSl"
Content-Disposition: inline


--Yia77v5a8fyVHJSl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2020 at 05:23:59PM -0700, Nicolin Chen wrote:
> The "num_tlb_lines" might not be a power-of-2 value, being 48 on
> Tegra210 for example. So the current way of calculating tlb_mask
> using the num_tlb_lines is not correct: tlb_mask=3D0x5f in case of
> num_tlb_lines=3D48, which will trim a setting of 0x30 (48) to 0x10.
>=20
> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> ---
>  drivers/iommu/tegra-smmu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

This is technically a prerequisite for this patch you sent out earlier:

    https://patchwork.ozlabs.org/project/linux-tegra/patch/20200915232803.2=
6163-1-nicoleotsuka@gmail.com/

You should send both of those out as one series and add maintainers for
both subsystems to both patches so that they can work out who will be
applying them.

For this pair it's probably best for Joerg to pick up both patches
because this primarily concerns the Tegra SMMU, whereas the above patch
only provides the per-SoC data update for the SMMU. Obviously if Joerg
prefers for Krzysztof to pick up both patches that's fine with me too.

In either case, please send this out as a series so that both Joerg and
Krzysztof (Cc'ed for visibility) are aware of both patches. From the
Tegra side:

Acked-by: Thierry Reding <treding@nvidia.com>

> diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
> index 84fdee473873..0becdbfea306 100644
> --- a/drivers/iommu/tegra-smmu.c
> +++ b/drivers/iommu/tegra-smmu.c
> @@ -1120,7 +1120,7 @@ struct tegra_smmu *tegra_smmu_probe(struct device *=
dev,
>  		BIT_MASK(mc->soc->num_address_bits - SMMU_PTE_SHIFT) - 1;
>  	dev_dbg(dev, "address bits: %u, PFN mask: %#lx\n",
>  		mc->soc->num_address_bits, smmu->pfn_mask);
> -	smmu->tlb_mask =3D (smmu->soc->num_tlb_lines << 1) - 1;
> +	smmu->tlb_mask =3D (1 << fls(smmu->soc->num_tlb_lines)) - 1;
>  	dev_dbg(dev, "TLB lines: %u, mask: %#lx\n", smmu->soc->num_tlb_lines,
>  		smmu->tlb_mask);
> =20
> --=20
> 2.17.1
>=20

--Yia77v5a8fyVHJSl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9jPWMACgkQ3SOs138+
s6F/bg//XdumYVA2ODztwS8iTzCljbnXyjUzNX8Ru37N5Br82W9rXoStYRiZ7boA
8IQVASAvvHf8pKd8J6Sm1sXasSi6yGFeJqPrCfZxYq1PCs+RIM93OrXtBd1JRajl
8d/u3ivynx6Qd3E98BQTc9uNc2+6cXY11XR6dKwhHuI4wb43BS/4FOR8a3lq+VWf
gznzq/QZPd11ZbCNLF4eI/LaWByGR4c/J1yrnw4O/QcCv/MTMr2m6YViJHhybm+V
XOTLotbAK0sjn2ihlieHKVUHvluPKkAn+qJVdB9/9SpgaPBq1/wueXu4GpLOcA9F
1ffbBx27wHv/dW3QzAqyOrjeTsKd0vFwTVziux0eZ1zOt74n9ARp9C+KDEn4b28G
2XtbuBE4CVTsZ2IS+ePrWAAG3ZnPfcz+cu+v6NNxZ9cd65qDK2aqOD6nskkUbbaf
m8eV41RK2PqT8p5FaeA3KFmXASVIMAwSFqWhNGnPYO5fzPSdr43m/iPas77sM8pE
OXPy/+SL5YDyYwez4mEs3gCzdPy19pFcnXgKGACS9yR5xnYAEBBvU+UpV8xAHFfE
vJYX5UyOBqJbmUAccVEhqllklQ0iWpTR1gmGBWlwjizBGxyR4bXW82oL/+ePcv0c
xdzFtey9zMVqmbsX3wqCi83VoEEwfo8VzxWF399WCoUiQMUJo+s=
=dbE2
-----END PGP SIGNATURE-----

--Yia77v5a8fyVHJSl--

--===============4146144918286818374==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
--===============4146144918286818374==--
