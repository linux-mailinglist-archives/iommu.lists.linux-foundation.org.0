Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7683972F7
	for <lists.iommu@lfdr.de>; Tue,  1 Jun 2021 14:04:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89C4A83CE4;
	Tue,  1 Jun 2021 12:04:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hKQ-KaBJD2Cx; Tue,  1 Jun 2021 12:04:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96F5A83CE1;
	Tue,  1 Jun 2021 12:04:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3403FC0024;
	Tue,  1 Jun 2021 12:04:06 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7CEE8C0001
 for <iommu@lists.linux-foundation.org>; Tue,  1 Jun 2021 12:04:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6AF9583CDB
 for <iommu@lists.linux-foundation.org>; Tue,  1 Jun 2021 12:04:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fP_A-PSA81K6 for <iommu@lists.linux-foundation.org>;
 Tue,  1 Jun 2021 12:04:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2061.outbound.protection.outlook.com [40.107.212.61])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E7AE283CCD
 for <iommu@lists.linux-foundation.org>; Tue,  1 Jun 2021 12:04:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PTJgUUQut1MpygC1vR/JYq8tdsNGx2Ve46/NAUACM5qKAuYeikdrossndBfA58CXmAw112DOsid2Oam/8MkVvVlkNwbOY3mThcKDl2hliG6Gd2vTCS2C/CC3x4/wiPSYqFRJuP1nPNg7n20azn+WA4szKo6FD5JcZxfeIIRHMu8YkE6dqx4wihYdixcAV1HU0m5OFFdLCZEZ58L78OfbR3kdRzsVAql//WCjC9rjj7CO8wU3Lm9FQMSBqhnxROkbuzDBJt926lJQhju5yEeaBVBY6np32YT04TbQ9sELNx2e6L8O4GSYW9WvZNVZaggGZKUO5+hXLqi0HrW5hl8lFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lmXwegCBIC8nx21+v3fnZwbww1POpaKc/toBWaZ5swE=;
 b=UEzySjn4bp208NSTuuoDJMFoOzbFPmV6Azv7kwlPgG4WWcUZoc3x8oIpSoSah63WiVijjzNYuNgBC2bxRibG6qOmFV2RDO9VDduAZreRPXdLoU+XcAgYxLpugknbEG7CYSvnzX6Ms2zjjr/oiuWmrSqXQCl26krQTT+bVg2wfjOeqZrLVRzDbBKWECTUoufEOPVtWrg6TiL5aqzAkGBieGHGH4R12S/oNQLh4MTZEgmJZYzbC8/DPgHlpVRysTw+7ZM1VvB6MPKuTI8jc3vksS7WZt+2UMmDyM5nHDZbuOG/wDvSNYMII56yzlsF7+H99MussIln6tDhvPsGzzQmLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lmXwegCBIC8nx21+v3fnZwbww1POpaKc/toBWaZ5swE=;
 b=SA8oIBnYA07FQkJ/i4QFGql2j7uUyKG9nmuWIBR4tL2eXdSvZq/ixOZut67o3G8NhQ08fQphEfyrTnTRU//Qvd8c4/CI/txOGIubBLcbLTjfDpAG2mnqxlorvFsL6Gh3XvUmA0rRO7edMrJd1m2pd4oIDhYz3D67XF7/E20O4qFP9Sv7TEjdFqAQsCSVoB5gco9WR4xH/dm+PlC0EmwPtNIU0SEYKytP8TfOMJ/Q4tcFEQLB3JJCNkAQzKRPConZNxgRczTsajun5d7eYr+Obg2LXKSxXgBu5htFPojziH9qkpVHhXgUONmiHdxHl5+aFQICKBEHGlW2MmeJudlfuA==
Received: from PH0PR12MB5481.namprd12.prod.outlook.com (2603:10b6:510:d4::15)
 by PH0PR12MB5401.namprd12.prod.outlook.com (2603:10b6:510:d4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Tue, 1 Jun
 2021 12:04:00 +0000
Received: from PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::b0d9:bff5:2fbf:b344]) by PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::b0d9:bff5:2fbf:b344%6]) with mapi id 15.20.4173.030; Tue, 1 Jun 2021
 12:04:00 +0000
From: Parav Pandit <parav@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: RE: [RFC] /dev/ioasid uAPI proposal
Thread-Topic: [RFC] /dev/ioasid uAPI proposal
Thread-Index: AddSzQ970oLnVHLeQca/ysPD8zMJZwDdOxjAAAGkOoAAJToGkA==
Date: Tue, 1 Jun 2021 12:04:00 +0000
Message-ID: <PH0PR12MB548177CF2193BF5AD12B493EDC3E9@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <MWHPR11MB1886422D4839B372C6AB245F8C239@MWHPR11MB1886.namprd11.prod.outlook.com>
 <PH0PR12MB5481C1B2249615257A461EEDDC3F9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20210531181243.GY1002214@nvidia.com>
In-Reply-To: <20210531181243.GY1002214@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nvidia.com; dkim=none (message not signed)
 header.d=none;nvidia.com; dmarc=none action=none header.from=nvidia.com;
x-originating-ip: [49.207.197.245]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d56efbff-e6f4-4f48-6d6e-08d924f557ab
x-ms-traffictypediagnostic: PH0PR12MB5401:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <PH0PR12MB540179A2D8ECFFE3623F4BAFDC3E9@PH0PR12MB5401.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SYBNy81s1M/IGWjLc/67JE2bQfsqhMrVtbQXgkrfsSVlLuZgEUdJ/i2Dz9dTrIOROQc00zIAq+fdMjJiYoIp8ftieePFbLhazEvfV0K8gajFwRYqQYcLCy3ngJqci8DuDv4US1/xlcQVrmwGj4KGxf/Cr4MY55UA0m5wngD2+z2iLNYnDkDyAkMZ0ELElRTSAseQqofYErKl+z04QEFIT9Fu9A+mI2RaLGtJAdBSZrVGSoKxXoHTp6aDgW69lChTlNnMF32/CcjwHEOaBN8TCbmKAvHaSDhAHjpyNU/82c4wfoCRXDvJpjl0vEDRMic+nbrvy3dGJQWepR7FEUpjImcNsL69H0wVNhXSTsGhg3rIsUPTA8ZTQdZ8QgnH4rhlvkYMA8NCIijwbkap+C+eqmKKbOr2wKKsNho/Z09Wbu9uW17nmRK828UrVzmxSBpDf6TiXBRnHRuZoHgPC2mfphZD4r1B1jn/Vj77pNtELMk+nMVMMBoE0lwbUFvzW5yai1kIRPl4Sh4jpMzua6fRYfk1RbLzxBScb7+cNaszJlyZNHzUl2EAdXnHlfLknVyONvZ3YmKaK/hIBrkYQvTw4+bLlny0X0DgdD01fqQVCgQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR12MB5481.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(136003)(376002)(39860400002)(366004)(478600001)(6506007)(122000001)(66946007)(8936002)(38100700002)(86362001)(76116006)(2906002)(316002)(54906003)(7416002)(4326008)(9686003)(186003)(52536014)(6862004)(66446008)(64756008)(7696005)(55236004)(71200400001)(5660300002)(26005)(66476007)(8676002)(55016002)(33656002)(6636002)(66556008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?sfXDKdkp9jriTJJfIFExyGO60BPULjGf09C1f6xl2ggrWgp+pPLg0cvf1uGk?=
 =?us-ascii?Q?twHHcaMOhkVkn6e/Mwvn7IYfQE1HwODXSTcaLffJudBdYUz4KD7IvHBrDSAY?=
 =?us-ascii?Q?m8sHEfWBVE5aXhpNkpwEcpX5jQS7QouG69K59fw/lciFZejMp63p3lejNLeH?=
 =?us-ascii?Q?xXmYWKAZre+iQegK2BIcF72EQz7lVD+n++3xf0B++E7YERmTQAlgyMu2QbCW?=
 =?us-ascii?Q?7rQyzl2BqH6+cfwQnoiDCIC1zuvHts5aP7CMFIlqDT+odVXAp57dd0t72PQW?=
 =?us-ascii?Q?zrZ84GPb3lCzupiTrOC0oia2ymwqJE/vWI4esnWftmmTfs5z6Smxu6mfWQ7O?=
 =?us-ascii?Q?JwuFk45+wwzlwv1ePUAQDoQU4sIx2zrc0YNREF+TZ8WIJ5VN4h+NbhLpqzOi?=
 =?us-ascii?Q?CCbk0dGXta8Js3spbJOUvl8qZRhee7MHPTeGU87U4ZhZF+tIJtX3QEG6U1me?=
 =?us-ascii?Q?6yb5QCNAKy1fSfzVgxD1g/Xa1iTYQ0gAoh87ywbZsHy6+z3rwSy9oAAkPa8E?=
 =?us-ascii?Q?sWINCkthK08gCAi1RNJXWFLSJKDGxjmKSqpXd2mwl8CFBlZNCSECnA+0zBaH?=
 =?us-ascii?Q?v6qDecA42QBxj5Z60jvuWLVmDJq38EsaBURYYlHknXQ70vaz1s+sUg1Fb+qN?=
 =?us-ascii?Q?OGPdrLLMBOWQnvXVJg6qTJuuBivUmdguMhuVnyF+pFwxvxBZqk+TEA/v2dXn?=
 =?us-ascii?Q?AWMa6f1HDx4VnD6SZCQP2U4vrxph2SqgFpIq3UhW5bfPh1b5IAsmdTy8pYY6?=
 =?us-ascii?Q?wKqJ3/NSiAEeC96eY08SK1qdKhKPAQMpX+dFjWRlMdBX2V/xgOjxNAXxOFqd?=
 =?us-ascii?Q?UxXoztTvvdfsAMNxzJckMKV5qQnvaJTA5zZArNEk0+lX5tPuRmYA4oaMogMy?=
 =?us-ascii?Q?D4l4UeigjjrYN3yQGwH6yk32ycJVfq5A1Wo+kzcfPhXm8oW+0Dbp2fsbc0VL?=
 =?us-ascii?Q?LtN275qnMyLO+7dH+xjSTt/nL3ujHdwVo+7KijtCl+THvXgMnhyVLeLOvHVy?=
 =?us-ascii?Q?fcayrQuK+gevUrcl79sRXm4w+X6ESIQ6TZX2j1edS5PnpNwhqo4cBXpwWWOp?=
 =?us-ascii?Q?TWlTUERRmUxb4eLXyqVHUGdKA3JQGOe3X8t8ltdFhtIfg7ckaoyAUW58PKjT?=
 =?us-ascii?Q?b9Dzn/97eS6pXbxrfVTFfvAAQfums83nYIYoCoJoLEQCeFVLxUO8qSO/N/Q8?=
 =?us-ascii?Q?Mz3BMfMpxWE5qVSU3vlYO+eNocMSTSQcWGKvqzhjNsbY9UK0DEjPI3+78JTg?=
 =?us-ascii?Q?2WtOeXfAobOVlWrnZ0TkLYQID+XM+GAlWITCZnDL+9UXS134uARqxg4EUoE1?=
 =?us-ascii?Q?oW8TtGjSDUpwKMGLg8L8my2r?=
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d56efbff-e6f4-4f48-6d6e-08d924f557ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2021 12:04:00.4233 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wvwc9t/3gBFQyBMwvOvjBHh04Qe5zUaa4szXuS5tmLqv9sH6xPBclEpsfWZ3PyIiOozjFwYSkuWIZE49DYN4ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5401
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, "Tian,
 Kevin" <kevin.tian@intel.com>,
 "Alex Williamson \(alex.williamson@redhat.com\)" <alex.williamson@redhat.com>,
 "Raj, Ashok" <ashok.raj@intel.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Robin Murphy <robin.murphy@arm.com>, LKML <linux-kernel@vger.kernel.org>,
 Kirti Wankhede <kwankhede@nvidia.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 David Gibson <david@gibson.dropbear.id.au>, "Jiang,
 Dave" <dave.jiang@intel.com>, David Woodhouse <dwmw2@infradead.org>,
 Jason Wang <jasowang@redhat.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>



> From: Jason Gunthorpe <jgg@nvidia.com>
> Sent: Monday, May 31, 2021 11:43 PM
> 
> On Mon, May 31, 2021 at 05:37:35PM +0000, Parav Pandit wrote:
> 
> > In that case, can it be a new system call? Why does it have to be under
> /dev/ioasid?
> > For example few years back such system call mpin() thought was proposed
> in [1].
> 
> Reference counting of the overall pins are required
> 
> So when a pinned pages is incorporated into an IOASID page table in a later
> IOCTL it means it cannot be unpinned while the IOASID page table is using it.
Ok. but cant it use the same refcount of that mmu uses?

> 
> This is some trick to organize the pinning into groups and then refcount each
> group, thus avoiding needing per-page refcounts.
Pinned page refcount is already maintained by the mmu without ioasid, isn't it?

> 
> The data structure would be an interval tree of pins in general
> 
> The ioasid itself would have an interval tree of its own mappings, each entry
> in this tree would reference count against an element in the above tree
> 
> Then the ioasid's interval tree would be mapped into a page table tree in HW
> format.
Does it mean in simple use case [1], second level page table copy is maintained in the IOMMU side via map interface?
I hope not. It should use the same as what mmu uses, right?

[1] one SIOV/ADI device assigned with one PASID and mapped in guest VM

> 
> The redundant storages are needed to keep track of the refencing and the
> CPU page table values for later unpinning.
> 
> Jason
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
