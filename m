Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 4596C2C1E8C
	for <lists.iommu@lfdr.de>; Tue, 24 Nov 2020 07:57:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A233D20029;
	Tue, 24 Nov 2020 06:57:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zzqWkObE+fmK; Tue, 24 Nov 2020 06:57:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 3A69C204CD;
	Tue, 24 Nov 2020 06:57:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 207BFC1D9F;
	Tue, 24 Nov 2020 06:57:35 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 305A0C0052
 for <iommu@lists.linux-foundation.org>; Tue, 24 Nov 2020 06:57:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 16D718715D
 for <iommu@lists.linux-foundation.org>; Tue, 24 Nov 2020 06:57:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 02D9LKyeMquj for <iommu@lists.linux-foundation.org>;
 Tue, 24 Nov 2020 06:57:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2041.outbound.protection.outlook.com [40.107.94.41])
 by hemlock.osuosl.org (Postfix) with ESMTPS id B537087158
 for <iommu@lists.linux-foundation.org>; Tue, 24 Nov 2020 06:57:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L16QxENlXJw37stdUvkh5nXBHflyzT3AO07k32wz8dDPabNBbrhy4EF+sFFZxeuIo1I6/91MVifaVOKst0Ly+R1A7qUhMEiTSUVP701vhyhgnptZF5mYoKk2VdiLsVG4xNgQCZGEP+N1+t6tIbDmwz7DF5vhFY4oS0Y5rQdStLYIFjgy+4aMaeRtQWmHnrXDIEKKi3pqNy6QT+47ERjtQwGYpQGpqr9FDYTXP8uIHwDeG+vBRmYzmktB3S02vrho9H7WRgM2mugVlPvGrsvE/jlCy3+OVEp47BtAaZFBrMhKlae5qTn/BN9EzocXUZJm+iL3YK9BENP/LFk691mNJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rgkwNWumUvt3Lq199MdOqlofTzfZOpK/ajIIcjXD0gg=;
 b=XcZE9sKa+aTCJWTc0aR41+xDpiq18i6CaZXp5RplIhp4JEQL4PcUi3jObwfIc2D33TCbgczMRuqQpHaPQL4fTBmjWz30q2UGWjG85Nou+v2nLcyXfkz8aKoIA98TOS80otflMVqvWybplkhbuleqdFlhzK1fwOXnTFlyuXmYa4BC9qKwkHgCNsd60/Bi944G4p6WFbSlVxYNKwQ+ZM9czaoa2qujoX73jIwOSOKy9p/HPDIUqeJJJY+rp+KW204ISRBzjvw26KB4fyXrXWwzHVivEO2xxoaZNXrM2UUEwqP0Q9azPUYn5xV7FvQiz4Ml3I+iE2kgrCM5g9eSCNajlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rgkwNWumUvt3Lq199MdOqlofTzfZOpK/ajIIcjXD0gg=;
 b=WQVhdzJpmh3oGUbU1tu3KBLyTF7kBJEwAsC/W9nSbSFynUGzfVuDJd/CEnFEs1IC+ivSnRi9iVi3obtZ6OjncrKvFw4RCq8b2LpvZI+pfHp19VGIHCASZG1ZWkZfgibwUK6tuLO5aRizGeHdyD0Bnom4k63/M9672bt1TSwn/hk=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MWHPR12MB1248.namprd12.prod.outlook.com (2603:10b6:300:12::21)
 by MWHPR12MB1439.namprd12.prod.outlook.com (2603:10b6:300:12::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.28; Tue, 24 Nov
 2020 06:42:57 +0000
Received: from MWHPR12MB1248.namprd12.prod.outlook.com
 ([fe80::4590:261a:f3b1:a1a2]) by MWHPR12MB1248.namprd12.prod.outlook.com
 ([fe80::4590:261a:f3b1:a1a2%9]) with mapi id 15.20.3589.030; Tue, 24 Nov 2020
 06:42:57 +0000
Date: Tue, 24 Nov 2020 14:43:01 +0800
From: Huang Rui <ray.huang@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>
Subject: Re: [PATCH] PCI: Mark AMD Raven iGPU ATS as broken
Message-ID: <20201124064301.GA536919@hr-amd>
References: <20201123134410.10648-1-will@kernel.org>
 <MN2PR12MB4488308D26DB50C18EA3BE0FF7FC0@MN2PR12MB4488.namprd12.prod.outlook.com>
 <20201123223356.GC12069@willie-the-truck>
 <218017ab-defd-c77d-9055-286bf49bee86@amd.com>
Content-Disposition: inline
In-Reply-To: <218017ab-defd-c77d-9055-286bf49bee86@amd.com>
X-Originating-IP: [58.247.170.245]
X-ClientProxiedBy: HK2PR0302CA0017.apcprd03.prod.outlook.com
 (2603:1096:202::27) To MWHPR12MB1248.namprd12.prod.outlook.com
 (2603:10b6:300:12::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hr-amd (58.247.170.245) by
 HK2PR0302CA0017.apcprd03.prod.outlook.com (2603:1096:202::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.11 via Frontend Transport; Tue, 24 Nov 2020 06:42:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6adefb83-3843-48f1-9674-08d890442d52
X-MS-TrafficTypeDiagnostic: MWHPR12MB1439:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR12MB14399E84F308D1F9A2DCE6F8ECFB0@MWHPR12MB1439.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7zuCRJwJAdYdrsn11Q8lQglqRCYH8yFPz5ZQB/J6wjxSx3VEHa2v0/vhcVoVtQ1592LFKhIJ8QWJwbo6Ik3ubigHrXKgZiNF/t0swXwmo8OPzHNSHJgJm7FF2I+AxA7lq08E05QfYIRfXRP1B0ohizAAv0jnGKQTEXnbM9sG1Y33J8/jHSNuo9ckL4XbbDs7zz4rEwS1Z7Gcyllbr+4FEZC8Zg00jk37OYPLTmklM78BLh5EuzKjS7eQtL2DIZuBp9LXf1TvvMUxBeuW7gCnfU5Uz6Llu1M9Zq26VEhzNUG2CohME0eU3pT/r7qDWAuwXn/deVnibYcq8qPf85x1AwrEbHR/0xg6oY1Dgl3c0dLMTkjvtIUWR9QIU7kadr3CHC8DsemN7WeIw0ZCZoDS7A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR12MB1248.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(346002)(376002)(136003)(39860400002)(45080400002)(53546011)(55016002)(8936002)(33656002)(966005)(16526019)(6862004)(6496006)(9686003)(26005)(4326008)(52116002)(6666004)(186003)(66946007)(956004)(66476007)(66556008)(478600001)(1076003)(83380400001)(86362001)(2906002)(5660300002)(8676002)(33716001)(54906003)(6636002)(4001150100001)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: pL9bY6lQU0AHLdueRQZFoY3mDfiviOZnjsJHQYWhvKQbsWpWybY1QMNwlvJ9T5OvFD+RG6VqopBAjJAiwXJ4p0AK7KAEGxGa/ksTciC4dspmgMg63Ot2SbaPriS4Kr8QzGlAMeqpyB9FwkvTNTuicSkknqwzaTWr0Vzv5Zd/5vTYIX2TiUv4NgdxzOE0vSwId7jY6g0+R6/X3Z90c0ZNFcP6JBd3rZnqhdZTsOy4vWYnF4WW9GPHoGrXGK/CQvpMsOxqWm5Qdh5Ohawoz9ojo8yFq6wA7nNrhpHeI4MpEBW+yrQ07d5YSe7Brqlwos/RXGvuct2smzYudQ1e6cc6I4ghHNXnCGPWwmoOpCEIkuyolQfJLHjHaYxCR7yWPOySz188PkSZoXZnQ1NkVwd1jxAmqUr3/P7BFXEQuFWP/a4pnpp7Zf2jpE0EYKZ7YB7XiaP+Kr8Uvx5vjxydwXWhlKlGo0eYCWrZDf1KhPXD8AIY593DRk2PdHIkAVN6dCv5aa424yAq9OW8bKD89HwvPn7uoqQxCSaCKpKui8C1eD4sNsIX8Fyj8cuqHmmrKrkmxi/XQCn+wqJej6fKC+WrjqixqH3YtOIUqTH4sdd5pUIELsnGhKdgCcZPOdASxftMACcPgvKP8Dm4JIu17d3stvZegFcy6B6OYZCj66N4keq3tFolrKnm4mWb5m/fE+DtKPSJtYhkeflWqDyR+bq5DVqtp/bi1X+KdiS4PoTARVntBlsENcuCZ7CPbY/ytsRl1Q0I/ETZjliv7RLGak4zhVtU2ioXnISn9fFT4Z3Dq/MW1ep2L8/H1+R8GLCE+yG39EqpuJsgGutrOjUqNfTgvNefdY/sgRGWOcoFp08foF0g9xcQ0pAUf7tVvm79a8ZNyH0xH+bgGgUHPPb63PDquA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6adefb83-3843-48f1-9674-08d890442d52
X-MS-Exchange-CrossTenant-AuthSource: MWHPR12MB1248.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2020 06:42:56.8956 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 46GkhVxdYv87/+98+dEtduJjGsWXH+FQDa+RU9i1flCRwLSm4qlHUtt5I/2JtW6OIM3Tzpynt0w9vuQSpQqXkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1439
Cc: Edgar Merger <Edgar.Merger@emerson.com>, Joerg Roedel <jroedel@suse.de>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Changfeng Zhu <changfeng.zhu@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, Will Deacon <will@kernel.org>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Tue, Nov 24, 2020 at 06:51:11AM +0800, Kuehling, Felix wrote:
> On 2020-11-23 5:33 p.m., Will Deacon wrote:
> > On Mon, Nov 23, 2020 at 09:04:14PM +0000, Deucher, Alexander wrote:
> >> [AMD Public Use]
> >>
> >>> -----Original Message-----
> >>> From: Will Deacon <will@kernel.org>
> >>> Sent: Monday, November 23, 2020 8:44 AM
> >>> To: linux-kernel@vger.kernel.org
> >>> Cc: linux-pci@vger.kernel.org; iommu@lists.linux-foundation.org; Will
> >>> Deacon <will@kernel.org>; Bjorn Helgaas <bhelgaas@google.com>;
> >>> Deucher, Alexander <Alexander.Deucher@amd.com>; Edgar Merger
> >>> <Edgar.Merger@emerson.com>; Joerg Roedel <jroedel@suse.de>
> >>> Subject: [PATCH] PCI: Mark AMD Raven iGPU ATS as broken
> >>>
> >>> Edgar Merger reports that the AMD Raven GPU does not work reliably on=
 his
> >>> system when the IOMMU is enabled:
> >>>
> >>>    | [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,
> >>> signaled seq=3D1, emitted seq=3D3
> >>>    | [...]
> >>>    | amdgpu 0000:0b:00.0: GPU reset begin!
> >>>    | AMD-Vi: Completion-Wait loop timed out
> >>>    | iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT
> >>> device=3D0b:00.0 address=3D0x38edc0970]
> >>>
> >>> This is indicative of a hardware/platform configuration issue so, sin=
ce
> >>> disabling ATS has been shown to resolve the problem, add a quirk to m=
atch
> >>> this particular device while Edgar follows-up with AMD for more infor=
mation.
> >>>
> >>> Cc: Bjorn Helgaas <bhelgaas@google.com>
> >>> Cc: Alex Deucher <alexander.deucher@amd.com>
> >>> Reported-by: Edgar Merger <Edgar.Merger@emerson.com>
> >>> Suggested-by: Joerg Roedel <jroedel@suse.de>
> >>> Link:
> >>> https://lore.
> >>> kernel.org/linux-
> >>> iommu/MWHPR10MB1310F042A30661D4158520B589FC0@MWHPR10M
> >>> B1310.namprd10.prod.outlook.com
> >>> her%40amd.com%7C1a883fe14d0c408e7d9508d88fb5df4e%7C3dd8961fe488
> >>> 4e608e11a82d994e183d%7C0%7C0%7C637417358593629699%7CUnknown%7
> >>> CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwi
> >>> LCJXVCI6Mn0%3D%7C1000&amp;sdata=3DTMgKldWzsX8XZ0l7q3%2BszDWXQJJ
> >>> LOUfX5oGaoLN8n%2B8%3D&amp;reserved=3D0
> >>> Signed-off-by: Will Deacon <will@kernel.org>
> >>> ---
> >>>
> >>> Hi all,
> >>>
> >>> Since Joerg is away at the moment, I'm posting this to try to make so=
me
> >>> progress with the thread in the Link: tag.
> >> + Felix
> >>
> >> What system is this?  Can you provide more details?  Does a sbios upda=
te
> >> fix this?  Disabling ATS for all Ravens will break GPU compute for a l=
ot
> >> of people.  I'd prefer to just black list this particular system (e.g.,
> >> just SSIDs or revision) if possible.
> =

> +Ray
> =

> There are already many systems where the IOMMU is disabled in the BIOS, =

> or the CRAT table reporting the APU compute capabilities is broken. Ray =

> has been working on a fallback to make APUs behave like dGPUs on such =

> systems. That should also cover this case where ATS is blacklisted. That =

> said, it affects the programming model, because we don't support the =

> unified and coherent memory model on dGPUs like we do on APUs with =

> IOMMUv2. So it would be good to make the conditions for this workaround =

> as narrow as possible.

Yes, besides the comments from Alex and Felix, may we get your firmware
version (SMC firmware which is from SBIOS) and device id?

> >>>    | [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,
> >>> signaled seq=3D1, emitted seq=3D3

It looks only gfx ib test passed, and fails to lanuch desktop, am I right?

We would like to see whether it is Raven, Raven kicker (new Raven), or
Picasso. In our side, per the internal test result, we didn't see the
similiar issue on Raven kicker and Picasso platform.

Thanks,
Ray

> =

> These are the relevant changes in KFD and Thunk for reference:
> =

> ### KFD ###
> =

> commit 914913ab04dfbcd0226ecb6bc99d276832ea2908
> Author: Huang Rui <ray.huang@amd.com>
> Date:=A0=A0 Tue Aug 18 14:54:23 2020 +0800
> =

>  =A0=A0=A0 drm/amdkfd: implement the dGPU fallback path for apu (v6)
> =

>  =A0=A0=A0 We still have a few iommu issues which need to address, so for=
ce raven
>  =A0=A0=A0 as "dgpu" path for the moment.
> =

>  =A0=A0=A0 This is to add the fallback path to bypass IOMMU if IOMMU v2 i=
s =

> disabled
>  =A0=A0=A0 or ACPI CRAT table not correct.
> =

>  =A0=A0=A0 v2: Use ignore_crat parameter to decide whether it will go wit=
h =

> IOMMUv2.
>  =A0=A0=A0 v3: Align with existed thunk, don't change the way of raven, o=
nly =

> renoir
>  =A0=A0=A0=A0=A0=A0=A0 will use "dgpu" path by default.
>  =A0=A0=A0 v4: don't update global ignore_crat in the driver, and revise =
fallback
>  =A0=A0=A0=A0=A0=A0=A0 function if CRAT is broken.
>  =A0=A0=A0 v5: refine acpi crat good but no iommu support case, and renam=
e the
>  =A0=A0=A0=A0=A0=A0=A0 title.
>  =A0=A0=A0 v6: fix the issue of dGPU initialized firstly, just modify the=
 report
>  =A0=A0=A0=A0=A0=A0=A0 value in the node_show().
> =

>  =A0=A0=A0 Signed-off-by: Huang Rui <ray.huang@amd.com>
>  =A0=A0=A0 Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
>  =A0=A0=A0 Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> =

> ### Thunk ###
> =

> commit e32482fa4b9ca398c8bdc303920abfd672592764
> Author: Huang Rui <ray.huang@amd.com>
> Date:=A0=A0 Tue Aug 18 18:54:05 2020 +0800
> =

>  =A0=A0=A0 libhsakmt: remove is_dgpu flag in the hsa_gfxip_table
> =

>  =A0=A0=A0 Whether use dgpu path will check the props which exposed from =
kernel.
>  =A0=A0=A0 We won't need hard code in the ASIC table.
> =

>  =A0=A0=A0 Signed-off-by: Huang Rui <ray.huang@amd.com>
>  =A0=A0=A0 Change-Id: I0c018a26b219914a41197ff36dbec7a75945d452
> =

> commit 7c60f6d912034aa67ed27b47a29221422423f5cc
> Author: Huang Rui <ray.huang@amd.com>
> Date:=A0=A0 Thu Jul 30 10:22:23 2020 +0800
> =

>  =A0=A0=A0 libhsakmt: implement the method that using flag which exposed =
by =

> kfd to configure is_dgpu
> =

>  =A0=A0=A0 KFD already implemented the fallback path for APU. Thunk will =
use flag
>  =A0=A0=A0 which exposed by kfd to configure is_dgpu instead of hardcode =
before.
> =

>  =A0=A0=A0 Signed-off-by: Huang Rui <ray.huang@amd.com>
>  =A0=A0=A0 Change-Id: I445f6cf668f9484dd06cd9ae1bb3cfe7428ec7eb
> =

> Regards,
>  =A0 Felix
> =

> =

> > Cheers, Alex. I'll have to defer to Edgar for the details, as my
> > understanding from the original thread over at:
> >
> > https://lore.kernel.org/linux-iommu/MWHPR10MB1310CDB6829DDCF5EA84A14689=
150@MWHPR10MB1310.namprd10.prod.outlook.com/
> >
> > is that this is a board developed by his company.
> >
> > Edgar -- please can you answer Alex's questions?
> >
> > Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
