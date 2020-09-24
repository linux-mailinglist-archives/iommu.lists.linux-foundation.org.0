Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB15276FE9
	for <lists.iommu@lfdr.de>; Thu, 24 Sep 2020 13:27:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4E0B586B5C;
	Thu, 24 Sep 2020 11:27:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tw7ss6aCrezY; Thu, 24 Sep 2020 11:27:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8903A86B71;
	Thu, 24 Sep 2020 11:27:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7ACBAC0051;
	Thu, 24 Sep 2020 11:27:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DA540C0051
 for <iommu@lists.linux-foundation.org>; Thu, 24 Sep 2020 11:27:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C25D987494
 for <iommu@lists.linux-foundation.org>; Thu, 24 Sep 2020 11:27:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GBeN7oK-FK5z for <iommu@lists.linux-foundation.org>;
 Thu, 24 Sep 2020 11:27:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id C404687490
 for <iommu@lists.linux-foundation.org>; Thu, 24 Sep 2020 11:27:30 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id q9so3162062wmj.2
 for <iommu@lists.linux-foundation.org>; Thu, 24 Sep 2020 04:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=tLMDNFt9TJF/ZryOzL1ilHgxO48Y454udYyrZfWfvtQ=;
 b=KE9bXRFAViekuZoQZduiZKVxdWJdrkIl2nLqMZo98FdrI2wiDLcGMDaJ4mPks0qBOl
 MMZGVnsc5FWJkREASoSaaYGas7QORH0Y4IMjXqUJZ9qMnmY/dYGtJ11e5xbrcCG4a2lC
 QO5ulEPD55sfnzYwi5M1/ChtdiZdWlVdLsDcr/QsyTrcT+5OqWPdVymYV/39Vd9iGXxT
 B7UHReiElDB66vlbn0XCRg8J3wws7U9E2uoIcpk3rx4YRx4IxirinXjeePIeawmAw6GD
 g+MN3djt+ctElTBdm2Oidz9ASuhLPBgM1AmCdSw/x1oa78MFUnbONXDQIjAsY/LNeN6z
 ypog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=tLMDNFt9TJF/ZryOzL1ilHgxO48Y454udYyrZfWfvtQ=;
 b=lNT4HjMpVe/hQee0RpsL52g5QOakOt789W4+jK6xS/Y8Nxt3JDshYQuEmElfjsJXxu
 o4GN7Toyjrkk9nownP9x76z1D1AIL+g3lwnJWHwsbzm+dApm5j7VKPOjXse6aKjP7Cmz
 WdBYY9JZbguTaYig2cChIlnLZFb8XMesG6AMGPp4SVI8UmJqWIVe2RZl+nPQJK9+3xuS
 8LGk6DWmwhi60us0TRqndtA/+ySDftqFihtMmCy7Gg+ChqxNqv/laPzmraHFt2ap9ACC
 Yv7eQG4Id3AFMGpy0BsPVQmJCgslF+/Ke89E8usMAw4JNPRQ94iiNxhhxBCvlr8aUzxr
 AFPw==
X-Gm-Message-State: AOAM5323Li0iNuzY4wKlTwvIyYoksIJLEHgV9Zwjwd16LhFGc2Y8eDag
 /B5OE63WpgNvJMG1uA5/zqs=
X-Google-Smtp-Source: ABdhPJzzr875MyIIlAKjUsDN40VPniPu1+Ti6Bzsj+dgGRxzdCtL/zGiHjqFXhZtmTarjQZLVFj8Hw==
X-Received: by 2002:a1c:dd45:: with SMTP id u66mr4311728wmg.117.1600946849132; 
 Thu, 24 Sep 2020 04:27:29 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id t124sm3381875wmg.31.2020.09.24.04.27.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Sep 2020 04:27:27 -0700 (PDT)
Date: Thu, 24 Sep 2020 13:27:25 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: reserved-memory: Document "active"
 property
Message-ID: <20200924112725.GA2486709@ulmo>
References: <20200904130000.691933-1-thierry.reding@gmail.com>
 <20200914220829.GA330122@bogus> <20200915123648.GA3496938@ulmo>
MIME-Version: 1.0
In-Reply-To: <20200915123648.GA3496938@ulmo>
User-Agent: Mutt/1.14.7 (2020-08-29)
Cc: devicetree@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Will Deacon <will@kernel.org>
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
Content-Type: multipart/mixed; boundary="===============1726506938390475943=="
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>


--===============1726506938390475943==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9jxsPFA5p3P2qPhR"
Content-Disposition: inline


--9jxsPFA5p3P2qPhR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2020 at 02:36:48PM +0200, Thierry Reding wrote:
> On Mon, Sep 14, 2020 at 04:08:29PM -0600, Rob Herring wrote:
> > On Fri, Sep 04, 2020 at 02:59:57PM +0200, Thierry Reding wrote:
> > > From: Thierry Reding <treding@nvidia.com>
> > >=20
> > > Reserved memory regions can be marked as "active" if hardware is
> > > expected to access the regions during boot and before the operating
> > > system can take control. One example where this is useful is for the
> > > operating system to infer whether the region needs to be identity-
> > > mapped through an IOMMU.
> >=20
> > I like simple solutions, but this hardly seems adequate to solve the=20
> > problem of passing IOMMU setup from bootloader/firmware to the OS. Like=
=20
> > what is the IOVA that's supposed to be used if identity mapping is not=
=20
> > used?
>=20
> The assumption here is that if the region is not active there is no need
> for the IOVA to be specified because the kernel will allocate memory and
> assign any IOVA of its choosing.
>=20
> Also, note that this is not meant as a way of passing IOMMU setup from
> the bootloader or firmware to the OS. The purpose of this is to specify
> that some region of memory is actively being accessed during boot. The
> particular case that I'm looking at is where the bootloader set up a
> splash screen and keeps it on during boot. The bootloader has not set up
> an IOMMU mapping and the identity mapping serves as a way of keeping the
> accesses by the display hardware working during the transitional period
> after the IOMMU translations have been enabled by the kernel but before
> the kernel display driver has had a chance to set up its own IOMMU
> mappings.
>=20
> > If you know enough about the regions to assume identity mapping, then=
=20
> > can't you know if active or not?
>=20
> We could alternatively add some property that describes the region as
> requiring an identity mapping. But note that we can't make any
> assumptions here about the usage of these regions because the IOMMU
> driver simply has no way of knowing what they are being used for.
>=20
> Some additional information is required in device tree for the IOMMU
> driver to be able to make that decision.

Rob, can you provide any hints on exactly how you want to move this
forward? I don't know in what direction you'd like to proceed.

Thierry

--9jxsPFA5p3P2qPhR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9sgpsACgkQ3SOs138+
s6HU/BAAsp4ztlRhFpoZxRRVHt3XKaVuNsn3yxThPMn67Xbk9U6QwWaY+ssNTMuZ
7oM3m4GgdUJ7vl1eoDNg7levtLHtMnhdXeEFSvBqkmPcxoPxSpll3mlMZk00uOX9
ZKx9+fMOIhZj3vlnfAquU9uhOMAOivIEDZhLYQ8ic2Yr8kA2utHOpTNI61XOOVRh
SphmnAYnJOkhvHehAIDc8M1qZH0ZQYUeJONEBRNK/wihFbiHeLnYY0FE0b5vxQpj
rKzDGsGcd0tZc+s6PmT1v2OQru3rA6MWl6FGKwI0UzUouZG+dLQybLWBeY4mNCP/
L6QjVVZa8oeQ5M+JIcEiIDbRrB4X/2M7is/539AwJ2IhBoIRZpr5LCbeVK/b//O7
m0Tw1kV4ibrXzVLD0YKB0Ls4KF1gztmLrZcfUy5/qqP0TdzZWfwxmbW/M0PTSRG8
oPK5W0TViRW9rn1B3RibGFUKdCXdassKFZWYWO5/FCEP4ijOrhsVbLHrMrkwBzBU
YsAaqJDWCbl+xmHwT/2E/wWtCpjsuGmbscAfJ6lhKwQJcTfPsnIV0G9luXZxMoYu
nFuWN2RBDnARwPqr6jubxe8evniLQSCE7PUZ2VdJYOlMt+3DEzrpx2JVdd/UysTa
tP5K57t2OyxVjIEgcdBrxAYL0Uf/tgNMGk5LqNd8ZYyr7EHdFgM=
=xZhX
-----END PGP SIGNATURE-----

--9jxsPFA5p3P2qPhR--

--===============1726506938390475943==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
--===============1726506938390475943==--
