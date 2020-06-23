Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 942B4204C73
	for <lists.iommu@lfdr.de>; Tue, 23 Jun 2020 10:33:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 0F2F82CF15;
	Tue, 23 Jun 2020 08:33:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3EHt6RTsWzVt; Tue, 23 Jun 2020 08:33:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 9347520498;
	Tue, 23 Jun 2020 08:33:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7802EC08A2;
	Tue, 23 Jun 2020 08:33:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B9504C016F
 for <iommu@lists.linux-foundation.org>; Tue, 23 Jun 2020 08:33:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A65BA88A8C
 for <iommu@lists.linux-foundation.org>; Tue, 23 Jun 2020 08:33:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bgEDqUjwQbA2 for <iommu@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 08:33:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by whitealder.osuosl.org (Postfix) with ESMTPS id C5CF2883DF
 for <iommu@lists.linux-foundation.org>; Tue, 23 Jun 2020 08:33:52 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id z17so3770647edr.9
 for <iommu@lists.linux-foundation.org>; Tue, 23 Jun 2020 01:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=mByc+HdrrJVo82qOlaNYMdsIyPS2/ALz2+ifGVUr9zU=;
 b=dC2x/AZRE3KWtfaIXsv78v09gfMqxzRs7yz4QEOPZEQOZGrnT/yy44af4IRXkLcV1X
 xihpklYb9RrIn9oYx+XKoxjApf6RFWl+mEzOC/bdXoSNWahYJ83gU7bZNpsl9vbieaFo
 obV6YkC4SUEmM2NV/ApFUK7TKzHZ0s3H9wXBBEkAOWmjyAzas5gr0pkIYryq8S4yvQp8
 FBgKBArq28TI3ur/DQ8N2ZaleywxlzyRDqM6lfG61JR6fskg1bHfmGMDHnesntG7xDqf
 r6doil1skOkDFqvxPxhp2hY12FIESKM/Wxrk3QYmc+Sq6VBRqe5mV8ABafBr0ILwhTLz
 NS1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=mByc+HdrrJVo82qOlaNYMdsIyPS2/ALz2+ifGVUr9zU=;
 b=pJIdIjEcZhSPeZwLBYTfjJvvOQ5lrpvrBbcmy+VEGxr+dXUoi+f6AOe49Yystj8Zvv
 OhgYeKmCVkKRQMHB6xeGHFsdwyNVPYeQv6xP4fV1S89D0nuF6PgiD1QBzFbAzBIDmDXM
 s08bMkHdXkTxrw4QJmS9z2XWjXaFHt04RX4tnY6mC2wIL9+bAP5NRZSZ/R43dZKzT4sl
 dWmH2AaIsNL0EUqzAcOf5pgHEYPuzEzVNsSPOlWyal7uQ/3T2zyYCTHOjWmQaQe3ZUhg
 BxnCVJAeEvNz58ocNfgJ1kT08Nik1+7oQTADPXNAveAbyn+7UxCAEobPmZghT8uY4fPG
 TpMw==
X-Gm-Message-State: AOAM531C7YGgUg668/eIyEVWO8W6lL7OJJKVrx/w5OwElNobIt60iv2u
 5OpNmCwb9bnmwtaut3hHHMk=
X-Google-Smtp-Source: ABdhPJxLjGU5g0rdOk2g6boet8HWFpPywMBg/d1/q9eFZqBZEmhRL00230dLs+48qy++4ChmW1D27w==
X-Received: by 2002:a50:fb14:: with SMTP id d20mr20880575edq.209.1592901231168; 
 Tue, 23 Jun 2020 01:33:51 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id w12sm3339851edx.19.2020.06.23.01.33.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2020 01:33:49 -0700 (PDT)
Date: Tue, 23 Jun 2020 10:33:48 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Krishna Reddy <vdumpa@nvidia.com>
Subject: Re: [PATCH v6 4/4] iommu/arm-smmu-nvidia: fix the warning reported
 by kbuild test robot
Message-ID: <20200623083348.GA4098287@ulmo>
References: <20200604234414.21912-1-vdumpa@nvidia.com>
 <20200604234414.21912-5-vdumpa@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20200604234414.21912-5-vdumpa@nvidia.com>
User-Agent: Mutt/1.14.4 (2020-06-18)
Cc: treding@nvidia.com, kbuild test robot <lkp@intel.com>, bhuntsman@nvidia.com,
 robin.murphy@arm.com, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, mperttunen@nvidia.com, talho@nvidia.com,
 snikam@nvidia.com, nicolinc@nvidia.com, linux-tegra@vger.kernel.org,
 yhsu@nvidia.com, praithatha@nvidia.com, will@kernel.org,
 linux-arm-kernel@lists.infradead.org, bbiswas@nvidia.com
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
Content-Type: multipart/mixed; boundary="===============0675210143395143499=="
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>


--===============0675210143395143499==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jI8keyz6grp/JLjh"
Content-Disposition: inline


--jI8keyz6grp/JLjh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 04, 2020 at 04:44:14PM -0700, Krishna Reddy wrote:
> >> drivers/iommu/arm-smmu-nvidia.c:151:33: sparse: sparse: cast removes
> >> address space '<asn:2>' of expression
>=20
> Reported-by: kbuild test robot <lkp@intel.com>
> Signed-off-by: Krishna Reddy <vdumpa@nvidia.com>
> ---
>  drivers/iommu/arm-smmu-nvidia.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

This should be folded into the patch that introduced this error.

Thierry

--jI8keyz6grp/JLjh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl7xvmoACgkQ3SOs138+
s6H5OhAAnUJxO+okbp2kcAzUIo+/gCFpLxt2IUml3mizRRO5emehRyjmdq/5zbng
wee1t+qSJyX65D2aRq1WUi0ENusf6T+5mO+s3Qao6d8cu35H4l3j56kX3gO9mew3
eCvMH5ZmczMiqS5Tlyk+BxmsBBcP8c6FpygcLrsiMtXX6NkaUScSSOB74tkamv1g
KOslg0uZNaANq6jCKOaJ4uhkHjAUDLFigq4CNcPG1dqyAIYipHZy1tHgK7IORCic
SPsMCaOYh7OXKaLdrZn6+TqX1JdlJpRjwecViTdR30CxbPvAJjata1suxbVOK6c/
sh0bKzeOyeb7iza2nQltD7YkeCF7Y9o69NFyzdl0KKkObCOxuWNn3BwS2iu6rm9r
ZMBwxo35jzHh/KWtaRaPlQaGwYqYpCTCezyFAo4kvsbD+mjIMvcFtJ786zgsdNcV
ZplpSnKvt6NwxjxzSZwUI1a25xUYA7WKrxVLi9yEAcfGEZYyQxFkiJDKK0JsmHiU
NILvdgXpTNZODuLwQ2vItfbrLVK+Uil/frAPNHfNjYlPG24CC7D2FCIgDLhBlhfD
aU90sf7sbWBIFzFGci5RjTQGkAd0h6akiHuVJkOQBRHM58G5V4Y85H9dpm6C0GmP
hUcrPhSv+SGL4BLUTu8zBcq0Jyp0kDhbBypUSVotnQdJW5LJrFI=
=M0sQ
-----END PGP SIGNATURE-----

--jI8keyz6grp/JLjh--

--===============0675210143395143499==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
--===============0675210143395143499==--
