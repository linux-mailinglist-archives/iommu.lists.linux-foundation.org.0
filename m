Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 878A74C1520
	for <lists.iommu@lfdr.de>; Wed, 23 Feb 2022 15:09:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24E1860F6B;
	Wed, 23 Feb 2022 14:09:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b9zjmpELYDgw; Wed, 23 Feb 2022 14:09:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 2CC8960F6D;
	Wed, 23 Feb 2022 14:09:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EF263C0073;
	Wed, 23 Feb 2022 14:09:09 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1705EC0011
 for <iommu@lists.linux-foundation.org>; Wed, 23 Feb 2022 14:09:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EBA28813D5
 for <iommu@lists.linux-foundation.org>; Wed, 23 Feb 2022 14:09:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=nvidia.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A35l5F3VGq3U for <iommu@lists.linux-foundation.org>;
 Wed, 23 Feb 2022 14:09:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 08BEE8278F
 for <iommu@lists.linux-foundation.org>; Wed, 23 Feb 2022 14:09:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kBDkYtS1IMASLt4Jka9GWlsjRlyCU5k57gKRPXwxS+pMfDyB8iM9LDy7AF1uMbX0wdDNIjJJfZ1Y+h+adrNWjFo0nwLsqBW5GN10X7qmtA7eeHl8cHGcchrCtNxWn0lGA0k3ePRYow19FaEZD8OsxvfLcq/GRWFTfgtZSeD6v/QfBdIREbE7pvXAcaO3g85aTYTUlcgVaudIdapm6WTaluCzopy09kcGDWARCJofz33i6UH6NVFy56HNztPzskgPj8CZiJqGODajkI2+R4zgRGPF13LOvPP1pzhuv0hJyRGzHkI50aXV2d1itAG7GRJI78ZC4cN6XDswDz1SeHelOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7b1WGVOs/NNj/KPtNX1lKLYF2TJ3nUHgrOdmgNkgC4Q=;
 b=URccwrpqm9gJU9V2jblmEU+Tut51SWihWjWCOhwH14gnL9HAQHDRjhHcQNfI2qb83B4YTfgqUCxBcyG+138sXZtcUoH+FsLGjhNuc+0Xl8gHyeU8Tx6X/g2v3HyEnTYSMbUIX6E1sVKT7zsD42wAm4084T9cMjkxBnhDQ/B9NCyAq+BLbDYu2oGuBHyYb8O27M1iU7LLttLfs7SAsphplBG8XLDfERag+GTyNk+a2mtBrIw7BEIThmZ3ixmfR4dWm2D/idQNGDhVl5MLwCOpiWkVXdzcn6NMbX1taP0PGU+hAD4mDofVIpjrIRYjqWKbnP5t7RzEAsibDeW8SJC8GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7b1WGVOs/NNj/KPtNX1lKLYF2TJ3nUHgrOdmgNkgC4Q=;
 b=CBKkSt2auznNCw2Dg9m+HokJ/SbIKjBAtvZrKqqqzW8AVbWV97jJMqKym8s7zTpCC5tudCb1BtwckK73+VWk0mbR0A8Dl9Cub5tgTekIFFVC32cKjlZa2MsYK/60bjbguZNFv1mejAJQTGomFdq9iqhJRTGpAmt2zB0H2AcWlloXgUcMBHsBso6ZZyYXm74CkUK1HfxKWDc3iX83xWInvrsNfSv2Q2rPezeFVszjCYK3Z33AHX+ITRHEEllCgWgPwlo1WJsepKjmwVEF9kwWoCvDU8qQJ+P6gE3BVYUatM2YXDd4GFZE7S9FKV2nXnjJsh5+myj3Y3SAC48H3Zd8PA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by SN6PR12MB4703.namprd12.prod.outlook.com (2603:10b6:805:ee::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.24; Wed, 23 Feb
 2022 14:09:03 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::e8f4:9793:da37:1bd3]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::e8f4:9793:da37:1bd3%4]) with mapi id 15.20.5017.022; Wed, 23 Feb 2022
 14:09:03 +0000
Date: Wed, 23 Feb 2022 10:09:01 -0400
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v6 02/11] driver core: Add dma_cleanup callback in bus_type
Message-ID: <20220223140901.GP10061@nvidia.com>
References: <1d8004d3-1887-4fc7-08d2-0e2ee6b5fdcb@arm.com>
 <20220221234837.GA10061@nvidia.com>
 <1acb8748-8d44-688d-2380-f39ec820776f@arm.com>
 <20220222151632.GB10061@nvidia.com>
 <3d4c3bf1-fed6-f640-dc20-36d667de7461@arm.com>
 <20220222235353.GF10061@nvidia.com>
 <171bec90-5ea6-b35b-f027-1b5e961f5ddf@linux.intel.com>
 <880a269d-d39d-bab3-8d19-b493e874ec99@arm.com>
 <20220223134627.GO10061@nvidia.com> <YhY/a9wTjmYXsuwt@kroah.com>
Content-Disposition: inline
In-Reply-To: <YhY/a9wTjmYXsuwt@kroah.com>
X-ClientProxiedBy: MN2PR01CA0054.prod.exchangelabs.com (2603:10b6:208:23f::23)
 To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a6b06558-8ce1-4af7-4efa-08d9f6d60bff
X-MS-TrafficTypeDiagnostic: SN6PR12MB4703:EE_
X-Microsoft-Antispam-PRVS: <SN6PR12MB47035D6472CC285FACCCE122C23C9@SN6PR12MB4703.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x68raNybsUPP336b//QUMS1+1NNMrpiGDdvD3KXYsYukLISQlhcV9AfaLC3knPcpWTjPvd3+EAP2UJhK7b2Cah7bQyqUlaEtkZdoXwfGlxdoxR+37NsStzLNALuz2ZPJmzHFdXBy170wlt+X0SkCOGIr7g6FGaib2Cr/CErSoPHCVnhjHWf/INpccbAUlK0YknCWIiIW1u0k9HL23ubE79e1HrK2NGuUpmp9I6nQf0Y4TEYRo6CVohtcfhBhIAQMBw5K0ZateAuq/Lzh+dxoQyEedwWIZ+9ZVHDNWvLHrWLMtKEIm/kSOeL9mcOQSYHamHX5DQYCR9SE9CxuYSWD1c92G1sHO7In/kHc+uvBjP6FlvMXOIyStdhvN3adQIrrvY0NbtBh3k4o/tqr8DZDb2ZN/OEXssmtKdlwgpcEaE8Jtft53zwElrykQ2OtnKormkrJ1YmPIyo0AkRN+fUYIS448iwFWtX2QKB9FuZbcrex7kVXN65MV5urcIYxKXyAPpLkO5AIUJlkfQm5IKu/0+281a963NkOiMkM0DQqdQDRhoVtl7YKeKp1twCC+NC2NwrLYQhn8VUvV25jWxcDkpgr35vhndbxTrqfG64gY7C5Oxa9fg2uoKQJ1K5Fui7l1fuAvqtphDEZXNTnCxSwLQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(4326008)(38100700002)(7416002)(83380400001)(36756003)(5660300002)(2906002)(8936002)(33656002)(26005)(54906003)(6486002)(186003)(6512007)(66556008)(66946007)(66476007)(8676002)(1076003)(6506007)(316002)(6916009)(508600001)(86362001)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?roDFNjYM7nnusSL0MBadZR1GPgDB8AO1TJyu3b5zXxYSbLRgiAFmiHUPPdmz?=
 =?us-ascii?Q?izdtufj6x9qtJF7u7vJ1iic3567ioKYOvrr7HrIVubPQvJccVK1/uqmfgglr?=
 =?us-ascii?Q?x+HpL4uyH3pb0VhiyIJGjvKx7pUpuCynmOnYIW2cKZxpfAz7E/lgrlGyOpkm?=
 =?us-ascii?Q?kGHzJgCUxkDuhUuXgGp3eyJoIM1+GHvfo09cvWmUoP8y1AuWc36LJWgENLJK?=
 =?us-ascii?Q?butU/JNe8q6I9nTcFSBG7fJxs5/4OKN3yumY0TAPmiNlF3CltdSZzmAK9rfO?=
 =?us-ascii?Q?UBMebKUqArr64GGJRY81oBp57qa5XfVk2wR5mBVmRuscnMb392P18wxnoejB?=
 =?us-ascii?Q?xirpNgeuS0ASKg4FgFqvDsOKNJMn3LGwm6ErRZRcohps7nn5j5cNPwM5cEog?=
 =?us-ascii?Q?v4Z97m9AjqBDpOh3q8ivBA1qflLSDyjU7fkQ6I80dbxUnwVffkh53abqwClf?=
 =?us-ascii?Q?mb8DZks35W28g6qkuxJTvgMixTPh8Nqpt47KBOd08VDNCCa0sydWnkNNaeHe?=
 =?us-ascii?Q?OFgl6VmJwWpPVC3tZW7awq61vE+BPBDf2JL8xwx/gf5Pt+biXjeHsQiuaUsx?=
 =?us-ascii?Q?oYlArXhYwJv3D0mXiOnMB1/rqCS/GYmkV19IW2egIoaiL4YuONkEhUHhVtR2?=
 =?us-ascii?Q?CzVbzZ+fCcQJgfT8P+YEqMJ7KMwtXSo7KHkuAcFSTGFg0gJ0/CNBFJRUeFFt?=
 =?us-ascii?Q?tjKkNwvjgbx0DWqYXIggH0AwvaBav7xdNaX3QKI9sgUncddpHpLXtbrmSGWe?=
 =?us-ascii?Q?Gv8ezS//1K8hWlm0mfH0miF0vs3NAQ2GVnPAfHOqA35nxcfCR4KuR6AuarJS?=
 =?us-ascii?Q?XPRN0m+N2LIOftNE06TxiW/h+SAKrHhq1bBlT8bE+Mv4OfsDWcOqTE02M0Pb?=
 =?us-ascii?Q?uMPgEhASIAVuBBl9FXlS8H3yWWzPFFAoA1htjE+ZlC4kb+e3FI59A7akl3gj?=
 =?us-ascii?Q?gZ9niwyYSR9gfKeBVsekpUNirFa2jpB0pBg0LQdevmtVtSE2yRB93qyZUrfk?=
 =?us-ascii?Q?vPvrNSsi7rZPqE553QeGK6ebNTZxUf5pBHXxIVatUuGiJgr/Ld7jxM28tUO7?=
 =?us-ascii?Q?mkNMjK7egeTfm53ZVCFGqFbvWzZ8I7jEDFiAXKru4wUt53bsQcXhUkFtwddr?=
 =?us-ascii?Q?FfkaWUUCGvL8tb83p5pPLFTIDhC5f+Tgb8p0Vn5cCXfu1SsIRtJ9M0KTi8YT?=
 =?us-ascii?Q?4FOd9LS0QejOaEhxQfUEeHwYL9gUz5oh08ZXgsQkTeLB0fgrNkd+hdk5V6jP?=
 =?us-ascii?Q?B/1lDHopnuEp/4b9Bsf5VTLVOyONgjED9B5Fg/GoaohQlItAYrTf5AfbRATM?=
 =?us-ascii?Q?DkGI2QLdAmizzaqwft9ZSUFJHR+U2rs1dEOzhCohPbds9z3N2xPQFgZ3ukSC?=
 =?us-ascii?Q?tdyUXoCpoK5JaAKa1GGzOOQ8el5bZjQsjcmwutyR/DLWl6PPQeayz8D+XZYB?=
 =?us-ascii?Q?B9+1JO4eTbecQJhpRGxD/QZQ0X95yV8SQrD+sVpKKx4VJLqVt/uDsAfKna3m?=
 =?us-ascii?Q?iTjtZQFRcYM0vfKZPscZlEaL56rjuPm/2tp/Jg75mMotaADpmld2ln+NaCPW?=
 =?us-ascii?Q?+GKjkqFGJKNW0Zcx6JQ=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6b06558-8ce1-4af7-4efa-08d9f6d60bff
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 14:09:03.6069 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jPxyMQSp2X6tGeTjSIEyW0sDnp6vMv7Arv8mE1ngpJRQDQXYPrs7hyGzJPEyQf21
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB4703
Cc: kvm@vger.kernel.org, rafael@kernel.org, David Airlie <airlied@linux.ie>,
 linux-pci@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>, Dmitry Osipenko <digetx@gmail.com>,
 Will Deacon <will@kernel.org>, Ashok Raj <ashok.raj@intel.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Christoph Hellwig <hch@infradead.org>,
 Stuart Yoder <stuyoder@gmail.com>, Kevin Tian <kevin.tian@intel.com>,
 Chaitanya Kulkarni <kch@nvidia.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Dan Williams <dan.j.williams@intel.com>,
 Cornelia Huck <cohuck@redhat.com>, linux-kernel@vger.kernel.org,
 Li Yang <leoyang.li@nxp.com>, iommu@lists.linux-foundation.org,
 Jacob jun Pan <jacob.jun.pan@intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Robin Murphy <robin.murphy@arm.com>
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
From: Jason Gunthorpe via iommu <iommu@lists.linux-foundation.org>
Reply-To: Jason Gunthorpe <jgg@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Wed, Feb 23, 2022 at 03:06:35PM +0100, Greg Kroah-Hartman wrote:
> On Wed, Feb 23, 2022 at 09:46:27AM -0400, Jason Gunthorpe wrote:
> > On Wed, Feb 23, 2022 at 01:04:00PM +0000, Robin Murphy wrote:
> > 
> > > 1 - tmp->driver is non-NULL because tmp is already bound.
> > >   1.a - If tmp->driver->driver_managed_dma == 0, the group must currently be
> > > DMA-API-owned as a whole. Regardless of what driver dev has unbound from,
> > > its removal does not release someone else's DMA API (co-)ownership.
> > 
> > This is an uncommon locking pattern, but it does work. It relies on
> > the mutex being an effective synchronization barrier for an unlocked
> > store:
> > 
> > 				      WRITE_ONCE(dev->driver, NULL)
> 
> Only the driver core should be messing with the dev->driver pointer as
> when it does so, it already has the proper locks held.  Do I need to
> move that to a "private" location so that nothing outside of the driver
> core can mess with it?

It would be nice, I've seen a abuse and mislocking of it in drivers

Jason
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
