Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 07AB5340067
	for <lists.iommu@lfdr.de>; Thu, 18 Mar 2021 08:48:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 920E48419A;
	Thu, 18 Mar 2021 07:48:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1MAHVQWGNZ6b; Thu, 18 Mar 2021 07:48:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9FE3184190;
	Thu, 18 Mar 2021 07:48:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 76F6FC0001;
	Thu, 18 Mar 2021 07:48:43 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D4C6EC0001
 for <iommu@lists.linux-foundation.org>; Thu, 18 Mar 2021 07:48:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B68ED60616
 for <iommu@lists.linux-foundation.org>; Thu, 18 Mar 2021 07:48:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s56NdHlcSr1i for <iommu@lists.linux-foundation.org>;
 Thu, 18 Mar 2021 07:48:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E10926060D
 for <iommu@lists.linux-foundation.org>; Thu, 18 Mar 2021 07:48:40 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id o2so868010plg.1
 for <iommu@lists.linux-foundation.org>; Thu, 18 Mar 2021 00:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=2Hpg/NuaBtBwQfUbFetkCYRA5pMldXXEVPqi57b9mGE=;
 b=DYsuBvfxTbcDA0ajEncbpb9yUISgGydoK2lGAyi8Wz6sglnzDSWhMQxpXR59LxDi0n
 U/FjJwhVoDsV9VbzhOd6okjZTQ3felq23dHHNCiRw7uSmQ06n5PlLGB7tB6N/nlP3oVO
 K5R4HkKO7hsD6tcx68TYcOXxbJEHVGTZJmWK9PWtxsHeSw8Z5Xl/TIWZURxQo3NjScir
 zWiQOATtlPRehEUK42HVtM8/UAssPo1WLK/6PE+qwAHAPvdgv4ZEajzp3Ia8IP35EDrM
 d2uG2XeK/ND6zl/vorIc/rnVYiBed+DPzY5KoBxKG6sbBN/IhdYdl8JxvbGpdS9X+YK9
 L8dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=2Hpg/NuaBtBwQfUbFetkCYRA5pMldXXEVPqi57b9mGE=;
 b=OHBmU5Y0XotIYa7AVh/SJubqUSPmdbQ8mSvkPwSu3pKS9/NiANJ+IfYxgxuZBKjej/
 sOcvMc4GDsR0nUkD3RWKMPTRmCyqlHpjocdk0WdU7FIhFrfB97mr2SPTjUIYLNGdDOhP
 x0EdmJiylY5Sbd8nFAqtEXdyPsyjDc75VAXlajr3ZmqSRnJRY4jpBkATsmBY5tMxAoxv
 hpcg56oF0aBQzsNTJJqBkQisvTooRZ+T7VyOxOfQjitb8KaZiSvOdJPaDIf6oenERmK7
 2eND1eficQ+9T5k+1UreSOMWl2/4vS0eqhxlsexc9p01bjoM7EJlf26gSmgMUStRHN1y
 36lw==
X-Gm-Message-State: AOAM530AKwAZC1leSyfCWXhsFONsIYfOofw0mtw4M+5E2B+o37KXtGOC
 FS2By89Jsny0sCf4EuMMO8I=
X-Google-Smtp-Source: ABdhPJy5qWFUrhBzudk3D2WqHJ15M10yxYm3fMm45oFT4/SJrIySu5lOZ5J7MmGSGtVtx+PS0vMhyw==
X-Received: by 2002:a17:90b:100a:: with SMTP id
 gm10mr2970961pjb.0.1616053719970; 
 Thu, 18 Mar 2021 00:48:39 -0700 (PDT)
Received: from [192.168.88.245] (c-24-6-216-183.hsd1.ca.comcast.net.
 [24.6.216.183])
 by smtp.gmail.com with ESMTPSA id v26sm1312644pff.195.2021.03.18.00.48.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 18 Mar 2021 00:48:39 -0700 (PDT)
From: Nadav Amit <nadav.amit@gmail.com>
Message-Id: <F609AED4-2238-43E0-8095-1659F945E277@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: =?utf-8?Q?Re=3A_A_problem_of_Intel_IOMMU_hardware_=EF=BC=9F?=
Date: Thu, 18 Mar 2021 00:48:37 -0700
In-Reply-To: <a0ca6dd974be42878a8f51b0a7bbe00f@huawei.com>
To: "Longpeng (Mike,
 Cloud Infrastructure Service Product Dept.)" <longpeng2@huawei.com>
References: <670baaf8-4ff8-4e84-4be3-030b95ab5a5e@huawei.com>
 <692186fd-42b8-4054-ead2-f6c6b1bf5b2d@linux.intel.com>
 <20210317091820.5f4ab69e@omen.home.shazbot.org>
 <87a5f90a-d1ea-fe7a-2577-fdfdf25f8fd7@linux.intel.com>
 <a0ca6dd974be42878a8f51b0a7bbe00f@huawei.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Cc: chenjiashang <chenjiashang@huawei.com>, "Subo \(Subo,
 Cloud Infrastructure Service Product Dept.\)" <subo7@huawei.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 "will@kernel.org" <will@kernel.org>
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
Content-Type: multipart/mixed; boundary="===============1476894078088463200=="
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>


--===============1476894078088463200==
Content-Type: multipart/signed;
	boundary="Apple-Mail=_D5F2480D-0332-4EEC-8906-3CF58CF9DB05";
	protocol="application/pgp-signature";
	micalg=pgp-sha256


--Apple-Mail=_D5F2480D-0332-4EEC-8906-3CF58CF9DB05
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Mar 17, 2021, at 9:46 PM, Longpeng (Mike, Cloud Infrastructure =
Service Product Dept.) <longpeng2@huawei.com> wrote:
>=20

[Snip]

>=20
> NOTE, the magical thing happen...(*Operation-4*) we write the PTE
> of Operation-1 from 0 to 0x3 which means can Read/Write, and then
> we trigger DMA read again, it success and return the data of HPA 0 !!
>=20
> Why we modify the older page table would make sense ? As we
> have discussed previously, the cache flush part of the driver is =
correct,
> it call flush_iotlb after (b) and no need to flush after (c). But the =
result
> of the experiment shows the older page table or older caches is =
effective
> actually.
>=20
> Any ideas ?

Interesting. Sounds as if there is some page-walk cache that was not
invalidated properly.


--Apple-Mail=_D5F2480D-0332-4EEC-8906-3CF58CF9DB05
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEESJL3osl5Ymx/w9I1HaAqSabaD1oFAmBTBdUACgkQHaAqSaba
D1okIhAAocTfPO7VNXWn6f/yy3l6uWtFbUp4MQzB5obcM4QGYw/7Km/XbaVNeV+6
6GvQxQR8zgYS35A0EEJpKQEI43hkX5FlRcde3rhbLQljmXVyL+vCArw2P6b8k0Qf
7OexTH9bF7/l8lKe1Zz8HDD6KQRrO0zLwNZQkT1JnJoacS04HejS5WqVYQG+jx6G
C/ntNBNDEAFE2rM3UI+sQVcctkEq6/gd2rMz2L/aDNSYIXe4znTIGLqfNNd4lBUM
4OtGKTxsF8KJHchn4WUXkh4nenIQ8qYHeF+0yLrSJNX9c8/JG+E2e8A1aGTd5Bxe
Kh2q+b1Gx9F7nO9zVfg3fBU8yL+tHSNaWfHUkAUQyCjHMQEEPMQoxc2l4uQ4OF/l
Ce5TBH0VUb1tmY/kW2kjCGQub9Ez5WkQD5Hv2VHxXsEl5GhaEZNdop5IXLN99xhJ
gXNKdNOX1uV7yxMyXxvqUMkuRbOcTLt7jpeEn5zFd+VQat1dHBb4a4G0l7MdQCxA
ffyA90dVLGt9vSe9NA64llZUoM016izzHPsDghoRydNTCtNZK361LAgFkdaojCJB
oIBMSfDQlap/QCKPMylBUjYkh+SzeMB1cGSAoHnxoWTEgBCcwk6QIhKmo4dwJCAv
p+wN+DR6ojH6lNYvdho6eo1zcH237l7RSyMRhsyAMNHxqOmXpP8=
=5Q2D
-----END PGP SIGNATURE-----

--Apple-Mail=_D5F2480D-0332-4EEC-8906-3CF58CF9DB05--

--===============1476894078088463200==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
--===============1476894078088463200==--
