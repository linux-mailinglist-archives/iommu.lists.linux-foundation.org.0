Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 32844B3080
	for <lists.iommu@lfdr.de>; Sun, 15 Sep 2019 16:22:17 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 169CCAF7;
	Sun, 15 Sep 2019 14:22:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 862A7504
	for <iommu@lists.linux-foundation.org>;
	Sun, 15 Sep 2019 05:03:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 5149A6C5
	for <iommu@lists.linux-foundation.org>;
	Sun, 15 Sep 2019 05:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1568523823; x=1600059823;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=Chks9ClJHwPBARUlK8iqwFCm96S+GK/iZ2/WaJ6ewUc=;
	b=PosEIWTopzlv3oR/APeET77cXnc0QE5EoN3fVKVi51SY+rrHUrRzyIgQ
	oupQBmuu8E7YQXpseeRnlidK5Bx3BlWe+ommrVn7WRg2RNTlaAeNDEzNt
	WMe3WytQWGlIQP1waUueZiQCY/Y2/aUBwOPks0yTdbL3vAyCI1eSj3u6N
	M8lbmf4IAFz7YASFxqAV8wvccn0tFZJK0OHe5id3Ao/bw/tzfdRk/mjOY
	/mX2gC1M6P3GUQKOTEksMAMbvuQCE63UgPh93c6wE4GGQqKdzkZzhIGuA
	ux3OP4YTgW2ojA0YuYwMk4DEh7FlLIQVnmrdzG6tDVKs5lzK0UPtKxjFi A==;
IronPort-SDR: i+VxeOkIzDn9gy6rv7eNjAtrJBhEgMpgA1qZYysYxUJyobn7DRZCdcAIaHnEWKAnwAJMyMo/R3
	3Bdk7f45ewcNz7SYLjxZCNBNb25DTk4tNCrl40nuvOZsjTxoCoWsTcaLyJD5gZGFro8u022boE
	w8yLJnJN7ojhFWdLz8257Uidg1+zSt/9tFH2NP5odcjZfHAM6O5ereotVSzojV/vcCrTaUD29W
	3K9y5v7ansiKyGXlTVqou9lByRWBWgSbnJh0YnQIaYj+CAYw4/jw3q8iTIQ9bXXJXrxwnqhBPS
	yDQ=
X-IronPort-AV: E=Sophos;i="5.64,506,1559491200"; d="scan'208";a="119121435"
Received: from mail-by2nam05lp2054.outbound.protection.outlook.com (HELO
	NAM05-BY2-obe.outbound.protection.outlook.com) ([104.47.50.54])
	by ob1.hgst.iphmx.com with ESMTP; 15 Sep 2019 13:03:40 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=ZJEzRzoADf6z+1RwTTzYckGU89EhUaMbW2JR4JuT2OtbkCA1w2FDcDB0QcjQW2TWTZoFOh+4TAs9qG8CuCDvI4VYbgnsvL5ZOTURsnewSAMhCOWcsmE8m+G2fZcighJgQnGaUoYGjAHkzdlwTeYQSe/vmw8RSn7/RO4wgLfe0ChocmRRc/Y+dIyuh8wqJP1j4zttFnAK9maZ92OeYCcBDUcH6IhOVliNb9CkbXmMPO9hHCo9jEuvL9nZwYuEAN19BDtrRX/0f+Lk6Kvx0j+RAXcQH5K1UYUuOhVW/p6MfXtX76i8dBcEf7dtn79SGVTSCghSdZkfHczwTNwoZz09kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Chks9ClJHwPBARUlK8iqwFCm96S+GK/iZ2/WaJ6ewUc=;
	b=Fbr5BTXojR8fqe5eaJQshxm9ThWDMjAodJK4fVvDgDQR3QQsLDTQ/GQrCSVIO0WCiaz/QIsga9JiXPgay36rP5BF9TrfSQK6Qr5G2gsvU841DZsCA3iL0VVFaaXppD+8dKh81L8ThsOTaCLqQfCOi6kXSlOiRFb7C3/qa+Zo8hI+ASyNJ/mhY4H/jzTzynWeA7sgcdSQ2bpvptVR8tac+F4mrNXBn+geAOJfvVyC+ecBeQdxyTMtjg8ZfZtW9MwsGbqw/whqJ6U6HqAYoDwwzw8KN/IEjiGifRN8vlflg02YUDGqwGnVX8TLWrshkzfdQWbrbkdtUYxDQG4P8gyLow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com;
	dkim=pass header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Chks9ClJHwPBARUlK8iqwFCm96S+GK/iZ2/WaJ6ewUc=;
	b=zJGpYxMcQlS/xbeM5zEVocS3K9TB+hcwEZZe05aKpojwx4lXU3viQdrjNXt1fmx7e9VQpwvrYxZ9bS8sVe+NB9SP4Prv7PXL0TcS29reraab13t3yRacpCGJajgF2xpCs2Ta83e7dXV497CLrL3XxpLKS5Y7QjA/xW7LmBQLGOI=
Received: from MN2PR04MB6061.namprd04.prod.outlook.com (20.178.246.15) by
	MN2PR04MB6029.namprd04.prod.outlook.com (20.178.246.139) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2263.13; Sun, 15 Sep 2019 05:03:38 +0000
Received: from MN2PR04MB6061.namprd04.prod.outlook.com
	([fe80::e1a5:8de2:c3b1:3fb0]) by
	MN2PR04MB6061.namprd04.prod.outlook.com
	([fe80::e1a5:8de2:c3b1:3fb0%7]) with mapi id 15.20.2263.023;
	Sun, 15 Sep 2019 05:03:38 +0000
From: Anup Patel <Anup.Patel@wdc.com>
To: Palmer Dabbelt <palmer@sifive.com>, "will@kernel.org" <will@kernel.org>
Subject: RE: [PATCH RFC 11/14] arm64: Move the ASID allocator code in a
	separate file
Thread-Topic: [PATCH RFC 11/14] arm64: Move the ASID allocator code in a
	separate file
Thread-Index: AQHU4ARW4cwQ4eGTBkiNSNBcx5My8aaNvxWAgBVs3wCAAA0vgIAABQWAgAAz5gCAAAYHgIABXjKAgAZcEYCAdrxbgIAHNtEAgAMkQoCAAPtQ0A==
Date: Sun, 15 Sep 2019 05:03:38 +0000
Message-ID: <MN2PR04MB606117F2AC47385EF23D267D8D8D0@MN2PR04MB6061.namprd04.prod.outlook.com>
References: <20190912140256.fwbutgmadpjbjnab@willie-the-truck>
	<mhng-166dcd4f-9483-4aab-a83a-914d70ddb5a4@palmer-si-x1e>
In-Reply-To: <mhng-166dcd4f-9483-4aab-a83a-914d70ddb5a4@palmer-si-x1e>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Anup.Patel@wdc.com; 
x-originating-ip: [49.207.49.169]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 077cc312-e726-46a6-dd40-08d7399a1201
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
	SRVR:MN2PR04MB6029; 
x-ms-traffictypediagnostic: MN2PR04MB6029:
x-ms-exchange-purlcount: 2
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR04MB602981B00CEC0AC7D7A86E488D8D0@MN2PR04MB6029.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 01613DFDC8
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(376002)(136003)(396003)(39860400002)(346002)(366004)(199004)(13464003)(189003)(74316002)(316002)(966005)(25786009)(3846002)(76116006)(26005)(6116002)(55236004)(305945005)(66066001)(66946007)(66446008)(64756008)(66556008)(66476007)(102836004)(256004)(54906003)(2501003)(7736002)(478600001)(4326008)(33656002)(110136005)(229853002)(53546011)(6506007)(14454004)(81166006)(6246003)(81156014)(7696005)(446003)(9686003)(11346002)(99286004)(6306002)(71190400001)(71200400001)(6436002)(5660300002)(7416002)(476003)(186003)(55016002)(76176011)(53936002)(52536014)(8936002)(86362001)(486006)(2906002)(8676002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR04MB6029;
	H:MN2PR04MB6061.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: sQdWGfS4ONuNECE4i/uE3dTO4x8zKnKX2PHAImSkDJWFtLybrmdz3BVjJpsoMXXR8uzGd9+DX6Ks6WoieOIaaQOklc6RH3UzkIFYfhBSTf5MHafJort67RCKNyYpCv1oXto4ieW5yPHPz0m1ZRHU7k7El/M1y0A4BMwgF228F95pKwvIBUeTXWtgjknDt68k5Sj/gOCCAFwuy5hVqoC4v5hrZ2YmIMwTlK8dfMF+AV2GKNvr1i5VRLo+Rw2E0dtvQ/DrjXCF/Dt1x0IqLxxVQMrJnPQzFQ75JBVs1Vgei2YSkUtVyLcZBDXdnBpMxKIlE/suVBQK8tix2c7l39Le+eeusflBrramYGz5oHnKGsVBIfQccaFIs/QLZNbDBLM/jPLZNwkRkV8TFd6qebJUz3QBz0Xn4LW+iN0ReO8cT1M=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 077cc312-e726-46a6-dd40-08d7399a1201
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2019 05:03:38.3364 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2xaVWlQjH/gbtQ3nYyFIu1lMCo3QEl5NxVddA23LCZjlRgg7Kvm3fjkty3KMHn+rZc482PPy1Bq7F8hWnhbH/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6029
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Mailman-Approved-At: Sun, 15 Sep 2019 14:22:13 +0000
Cc: "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	Arnd Bergmann <arnd@arndb.de>,
	"julien.thierry@arm.com" <julien.thierry@arm.com>,
	"marc.zyngier@arm.com" <marc.zyngier@arm.com>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
	Will Deacon <will.deacon@arm.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
	"rppt@linux.ibm.com" <rppt@linux.ibm.com>,
	Atish Patra <Atish.Patra@wdc.com>,
	"julien.grall@arm.com" <julien.grall@arm.com>,
	"gary@garyguo.net" <gary@garyguo.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	"christoffer.dall@arm.com" <christoffer.dall@arm.com>,
	"james.morse@arm.com" <james.morse@arm.com>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org



> -----Original Message-----
> From: linux-kernel-owner@vger.kernel.org <linux-kernel-
> owner@vger.kernel.org> On Behalf Of Palmer Dabbelt
> Sent: Saturday, September 14, 2019 7:31 PM
> To: will@kernel.org
> Cc: guoren@kernel.org; Will Deacon <will.deacon@arm.com>;
> julien.thierry@arm.com; aou@eecs.berkeley.edu; james.morse@arm.com;
> Arnd Bergmann <arnd@arndb.de>; suzuki.poulose@arm.com;
> marc.zyngier@arm.com; catalin.marinas@arm.com; Anup Patel
> <Anup.Patel@wdc.com>; linux-kernel@vger.kernel.org;
> rppt@linux.ibm.com; Christoph Hellwig <hch@infradead.org>; Atish Patra
> <Atish.Patra@wdc.com>; julien.grall@arm.com; gary@garyguo.net; Paul
> Walmsley <paul.walmsley@sifive.com>; christoffer.dall@arm.com; linux-
> riscv@lists.infradead.org; kvmarm@lists.cs.columbia.edu; linux-arm-
> kernel@lists.infradead.org; iommu@lists.linux-foundation.org
> Subject: Re: [PATCH RFC 11/14] arm64: Move the ASID allocator code in a
> separate file
> 
> On Thu, 12 Sep 2019 07:02:56 PDT (-0700), will@kernel.org wrote:
> > On Sun, Sep 08, 2019 at 07:52:55AM +0800, Guo Ren wrote:
> >> On Mon, Jun 24, 2019 at 6:40 PM Will Deacon <will@kernel.org> wrote:
> >> > > I'll keep my system use the same ASID for SMP + IOMMU :P
> >> >
> >> > You will want a separate allocator for that:
> >> >
> >> > https://lkml.kernel.org/r/20190610184714.6786-2-jean-philippe.bruck
> >> > er@arm.com
> >>
> >> Yes, it is hard to maintain ASID between IOMMU and CPUMMU or
> >> different system, because it's difficult to synchronize the IO_ASID
> >> when the CPU ASID is rollover.
> >> But we could still use hardware broadcast TLB invalidation
> >> instruction to uniformly manage the ASID and IO_ASID, or OTHER_ASID in
> our IOMMU.
> >
> > That's probably a bad idea, because you'll likely stall execution on
> > the CPU until the IOTLB has completed invalidation. In the case of
> > ATS, I think an endpoint ATC is permitted to take over a minute to
> > respond. In reality, I suspect the worst you'll ever see would be in
> > the msec range, but that's still an unacceptable period of time to hold a
> CPU.
> >
> >> Welcome to join our disscusion:
> >> "Introduce an implementation of IOMMU in linux-riscv"
> >> 9 Sep 2019, 10:45 Jade-room-I&II (Corinthia Hotel Lisbon) RISC-V MC
> >
> > I attended this session, but it unfortunately raised many more
> > questions than it answered.
> 
> Ya, we're a long way from figuring this out.

For everyone's reference, here is our first attempt at RISC-V ASID allocator:
http://archive.lwn.net:8080/linux-kernel/20190329045111.14040-1-anup.patel@wdc.com/T/#u

Regards,
Anup
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
