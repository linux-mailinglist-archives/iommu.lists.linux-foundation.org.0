Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D311FB798
	for <lists.iommu@lfdr.de>; Tue, 16 Jun 2020 17:49:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 44DE3878B3;
	Tue, 16 Jun 2020 15:49:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dBihoGCMPV-g; Tue, 16 Jun 2020 15:49:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9D91D87887;
	Tue, 16 Jun 2020 15:49:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8A009C016E;
	Tue, 16 Jun 2020 15:49:35 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 33969C016E
 for <iommu@lists.linux-foundation.org>; Tue, 16 Jun 2020 15:49:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2FA5388554
 for <iommu@lists.linux-foundation.org>; Tue, 16 Jun 2020 15:49:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fhKfr3BVPgUn for <iommu@lists.linux-foundation.org>;
 Tue, 16 Jun 2020 15:49:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 25486884AB
 for <iommu@lists.linux-foundation.org>; Tue, 16 Jun 2020 15:49:33 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id t18so21314663wru.6
 for <iommu@lists.linux-foundation.org>; Tue, 16 Jun 2020 08:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=5DdpumczYer1vzyYLEBjn6HNhUmet7Q95lmH6nZR+oA=;
 b=EgiFdnxTeJY8cjznp6PQXqvoiOqDIzX5Mu+fGi9ZJUX+5sY9Uq2jcVuL0batMqbDI1
 o8Xu+jBcSc3ETlLA5o0LHy88Akoz9OzZqHJszjVUmR2V9Mbmxjbs4l7xJgTDicnCcQeH
 6gQ2+2Q1+cxDgafp07cueNU47muxQs5tbiMsLF2CrEvN5HtVSw1ITaA8WiAQ1o5vOO+A
 CtoXHJdHuZvWoIlAszBkT2K7gRkl9AwVHI86EVB/sgy4tUu8iSIFHS1MsC/3V+yz5Nzm
 n6U1RRqhogNORJ1iFN4FVwsJ+QhE4d5mwq3YjdeXkIXM3lC6uaMoXS31SDuhuNmVGfe2
 u2dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5DdpumczYer1vzyYLEBjn6HNhUmet7Q95lmH6nZR+oA=;
 b=UC6NzfV33jiJ9IBo/t6HfhYRbjhmVKiU+FGycKnQxKlRJcpK50QTysyLgL8ooi55ot
 INk0jJ/uyyEU/xC0nXxaMTUXKiBc8OjbBZDMfzG/QQ1h0Ilq2iF0lzG7ajDqI9lmv5T0
 lGFEGSx1J4re8TIdS60VkVeR7+vZA6T5bQP0Y0momaoczFLw+mGDkn6Vog1zi0ImPEIN
 mbIBE1YlvEi0bvj3BVvP6Y60VVpyLRYulPz2c4lzLddxi8KVraWp4jYZ4Xh4IBe/xtbB
 HagK9/dGEZqu1WXFPqfrPErgeIeBYWdvjCdU0+27gc4uqM1+wjsHho+xmtapE1iSXQ3t
 wS9Q==
X-Gm-Message-State: AOAM530svk1yNk4UdMnfbrXRe/fQfkMuzegznG4HopxRBNKzxCTlVHH6
 hUIytyRe5+1ATpoiPFSm9Os=
X-Google-Smtp-Source: ABdhPJwV7EoNU1H3o082LpYH1XlfkrVKA4HXT5i+T2TIXgDIWRTkvvImYhC/z6iTop1auSEsn/oH8g==
X-Received: by 2002:adf:f882:: with SMTP id u2mr3978022wrp.40.1592322571413;
 Tue, 16 Jun 2020 08:49:31 -0700 (PDT)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id w10sm29855176wrp.16.2020.06.16.08.49.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2020 08:49:30 -0700 (PDT)
Date: Tue, 16 Jun 2020 16:49:28 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH v2 00/15] vfio: expose virtual Shared Virtual Addressing
 to VMs
Message-ID: <20200616154928.GF1491454@stefanha-x1.localdomain>
References: <1591877734-66527-1-git-send-email-yi.l.liu@intel.com>
 <20200615100214.GC1491454@stefanha-x1.localdomain>
 <MWHPR11MB16451F1E4748DF97D6A1DDD48C9D0@MWHPR11MB1645.namprd11.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <MWHPR11MB16451F1E4748DF97D6A1DDD48C9D0@MWHPR11MB1645.namprd11.prod.outlook.com>
Cc: "jean-philippe@linaro.org" <jean-philippe@linaro.org>, "Raj,
 Ashok" <ashok.raj@intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, "Sun,
 Yi Y" <yi.y.sun@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>, "Wu,
 Hao" <hao.wu@intel.com>, "Tian, Jun J" <jun.j.tian@intel.com>
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
Content-Type: multipart/mixed; boundary="===============3108081689410052509=="
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>


--===============3108081689410052509==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Wb5NtZlyOqqy58h0"
Content-Disposition: inline


--Wb5NtZlyOqqy58h0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2020 at 02:26:38AM +0000, Tian, Kevin wrote:
> > From: Stefan Hajnoczi <stefanha@gmail.com>
> > Sent: Monday, June 15, 2020 6:02 PM
> >=20
> > On Thu, Jun 11, 2020 at 05:15:19AM -0700, Liu Yi L wrote:
> > > Shared Virtual Addressing (SVA), a.k.a, Shared Virtual Memory (SVM) on
> > > Intel platforms allows address space sharing between device DMA and
> > > applications. SVA can reduce programming complexity and enhance
> > security.
> > >
> > > This VFIO series is intended to expose SVA usage to VMs. i.e. Sharing
> > > guest application address space with passthru devices. This is called
> > > vSVA in this series. The whole vSVA enabling requires QEMU/VFIO/IOMMU
> > > changes. For IOMMU and QEMU changes, they are in separate series (lis=
ted
> > > in the "Related series").
> > >
> > > The high-level architecture for SVA virtualization is as below, the k=
ey
> > > design of vSVA support is to utilize the dual-stage IOMMU translation=
 (
> > > also known as IOMMU nesting translation) capability in host IOMMU.
> > >
> > >
> > >     .-------------.  .---------------------------.
> > >     |   vIOMMU    |  | Guest process CR3, FL only|
> > >     |             |  '---------------------------'
> > >     .----------------/
> > >     | PASID Entry |--- PASID cache flush -
> > >     '-------------'                       |
> > >     |             |                       V
> > >     |             |                CR3 in GPA
> > >     '-------------'
> > > Guest
> > > ------| Shadow |--------------------------|--------
> > >       v        v                          v
> > > Host
> > >     .-------------.  .----------------------.
> > >     |   pIOMMU    |  | Bind FL for GVA-GPA  |
> > >     |             |  '----------------------'
> > >     .----------------/  |
> > >     | PASID Entry |     V (Nested xlate)
> > >     '----------------\.------------------------------.
> > >     |             |   |SL for GPA-HPA, default domain|
> > >     |             |   '------------------------------'
> > >     '-------------'
> > > Where:
> > >  - FL =3D First level/stage one page tables
> > >  - SL =3D Second level/stage two page tables
> >=20
> > Hi,
> > Looks like an interesting feature!
> >=20
> > To check I understand this feature: can applications now pass virtual
> > addresses to devices instead of translating to IOVAs?
> >=20
> > If yes, can guest applications restrict the vSVA address space so the
> > device only has access to certain regions?
> >=20
> > On one hand replacing IOVA translation with virtual addresses simplifies
> > the application programming model, but does it give up isolation if the
> > device can now access all application memory?
> >=20
>=20
> with SVA each application is allocated with a unique PASID to tag its
> virtual address space. The device that claims SVA support must guarantee=
=20
> that one application can only program the device to access its own virtual
> address space (i.e. all DMAs triggered by this application are tagged with
> the application's PASID, and are translated by IOMMU's PASID-granular
> page table). So, isolation is not sacrificed in SVA.

Isolation between applications is preserved but there is no isolation
between the device and the application itself. The application needs to
trust the device.

Examples:

1. The device can snoop secret data from readable pages in the
   application's virtual memory space.

2. The device can gain arbitrary execution on the CPU by overwriting
   control flow addresses (e.g. function pointers, stack return
   addresses) in writable pages.

Stefan

--Wb5NtZlyOqqy58h0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl7o6ggACgkQnKSrs4Gr
c8i4Dwf+Ja8+o4M38hy+I+mda6ZTLNogJhW1RTV2lBBk35XwDmYv+WqLnD/PrUNA
NSu0+o9RXtM9lj0HS1KkRvJGpFs1Q/YtBH1p8vlpxXjyCglRIJdw2uAVejCPUxip
Oez+BhKteh3v0betTZYyQsgAog/HcMU+0mZRGx2O1c9dcyz2+qq5xyKSO5OBjpd4
mcV4DNabPK85TNquyyU3Di88H1A4VdGuDmKOoU5rER7W07c0nfbPgU+V/CEB1Fww
LZ7G8QRQydGuZRyBROl9VhYI6YjMeKs8YxIDoJddQQOycSOgUZJxAZazPe9h4G78
VlimM2C+wn7w/KXE5mbKg9CjbMkh7g==
=cjRe
-----END PGP SIGNATURE-----

--Wb5NtZlyOqqy58h0--

--===============3108081689410052509==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
--===============3108081689410052509==--
