Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 321F44665A8
	for <lists.iommu@lfdr.de>; Thu,  2 Dec 2021 15:45:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFB6683DB7;
	Thu,  2 Dec 2021 14:45:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R7kMRaMu0FOG; Thu,  2 Dec 2021 14:45:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id EA41E83A47;
	Thu,  2 Dec 2021 14:45:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 69EECC002E;
	Thu,  2 Dec 2021 14:45:20 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7818FC000A
 for <iommu@lists.linux-foundation.org>; Thu,  2 Dec 2021 14:45:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 63087400F7
 for <iommu@lists.linux-foundation.org>; Thu,  2 Dec 2021 14:45:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=nvidia.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b6aoUbdVt-Z1 for <iommu@lists.linux-foundation.org>;
 Thu,  2 Dec 2021 14:45:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20623.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::623])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0F2D4400E5
 for <iommu@lists.linux-foundation.org>; Thu,  2 Dec 2021 14:45:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NhxsAbWVhn3EQybBSWSQ+IPO2NR7Lk2nh61H2CLOmrl+t0PJI19oIPGANjQLqBjpz+QYe50Z0WvHspA8JIYkWk6PJPLuesEQ/om7oMBV5OSb9hweQqG7Q73xJPaxlM7pAoO7lGeIICr1YV9Psx+5U6QNOgmnFgS7avwCtX2ONYfa20BoQIAk9e6Gj2oJ3hY6k+LjdFcTfn5NgJxo8ztDCtWMLtHGNZ7M6RUrCfZCLxPq06WL52hmM1bdroENI40oEG0TLosLUkYjecX6DJC8B8KUpE3h2fdd6ny1RWJgG7pf4Z3lQzKIUqjeHEgT8yjT6ennaxAqW76w5qHYGaQ6iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X/I0zanScvzDSeYVjIuIpJcqFAlFMYihOVtWJ/0S5HA=;
 b=D3l/7EaNY46DYH2ltOuiFnWuuaRexy4wTVDmNBWtt2j90Ik5ewNanXyMbK1sVGuE4JS4DHxcpcbqszCxbZjcliJ+/aThG3ca/553sF8EdcYhmP+k+hFYqb0zoxV7xl55mzBHsLw319jPhoSd+UppiZ9qTOHpjQGv8VxLRUzCTZd2h40Rx2HiYfxcrRLGtlY9f0YA6tLP6alXUIzM3Yulf4XxT7aBBNv5PGz8EVgcjqXT9Xf/jsQ9YCVrMGgdQCpbFHXIYzd6gju4Tn+7yYhoNL5k81+qEv4KHaL6CN13uR2CJHJgV1rcr+iMSfZmm2AwxlipqY1vLbzS2b6urkNslg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X/I0zanScvzDSeYVjIuIpJcqFAlFMYihOVtWJ/0S5HA=;
 b=Unl10r+tNPMvt77Vmql32sWhYafjMADSkbsQTuqXfybXcU7lV4cDoWaERbOONbGskHj5ZAfAJdpoOLRZkWyawnsd40qeENTnbaZC7tv+xWEO/TcjYVUCJ6PuNWQ7j9humAxZ5pUq4ArF6Me0WqgCBKcg2QdrZDkgLbiz/wE5+HaQXcrIP58+IAXYfkXRXJ3D6ehP5vhVeS+QCTG5kYwG56sHFb8OjEveIW1CD7KQUsefSMsSMyRa53TYIBBKttpk8BF4dkaoHsmYkZoLubAIp6sDix/aWJCVsNWgCOTIUgvRrmq6BJSL1wW6eQu3JUjS+HQ3t45rkM4SCDSnBjzC3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5288.namprd12.prod.outlook.com (2603:10b6:208:314::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Thu, 2 Dec
 2021 14:45:15 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d8be:e4e4:ce53:6d11]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d8be:e4e4:ce53:6d11%5]) with mapi id 15.20.4755.016; Thu, 2 Dec 2021
 14:45:15 +0000
Date: Thu, 2 Dec 2021 10:45:14 -0400
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [patch 21/32] NTB/msi: Convert to msi_on_each_desc()
Message-ID: <20211202144514.GQ4670@nvidia.com>
References: <87o861banv.ffs@tglx> <20211201001748.GF4670@nvidia.com>
 <87mtlkaauo.ffs@tglx> <20211201130023.GH4670@nvidia.com>
 <87y2548byw.ffs@tglx> <20211201181406.GM4670@nvidia.com>
 <87mtlk84ae.ffs@tglx> <87r1av7u3d.ffs@tglx>
 <20211202135502.GP4670@nvidia.com> <YajW6veanK4GZUkv@kroah.com>
Content-Disposition: inline
In-Reply-To: <YajW6veanK4GZUkv@kroah.com>
X-ClientProxiedBy: MN2PR07CA0004.namprd07.prod.outlook.com
 (2603:10b6:208:1a0::14) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.162.113.129) by
 MN2PR07CA0004.namprd07.prod.outlook.com (2603:10b6:208:1a0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23 via Frontend
 Transport; Thu, 2 Dec 2021 14:45:15 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1msnKk-006tVB-In; Thu, 02 Dec 2021 10:45:14 -0400
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cd0a7af6-db9d-424c-ff6c-08d9b5a25a4a
X-MS-TrafficTypeDiagnostic: BL1PR12MB5288:
X-Microsoft-Antispam-PRVS: <BL1PR12MB52884E5826063775221460FBC2699@BL1PR12MB5288.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YUKBGsKQ3l3n03IijQjMpOxcqKtPuH/w1C88WjIJe0O1HhuamGsh//N41iWjVYiBG/my+MluaTGFirxjsKr4unCDTiOjONsC6W7i69T1etF5WjqBG3sEEzWzLcswRFMDYNEwFqgdTvybwSF7g6mx1m3+7E0pA/GJxiC5SaBt5aODB4yc+5fTKhBVRHk8+Ui9P4qTEh0+vKkiiW++Cd9Zk4/k2OQRPS8/2io66LANc5qa6/lmjqQKIoFt9woRI6t5NYYjE0wzPcaKWvzJZLHCsaI6k/HoF7fONf5Ilc8tETj65AbTsuZjVHDXy/PiWrhxLzbHS2p25oeF7xTvf6Fh/gXcO80Wm02g3SEy77TYiFG0k/N5jweTVzsH4EE5m+5k9tvYfDqzGEsZ07xBNOK0iQascRTaiPtARmU8x6oOaMtetua+knEBi6t5BpzGNDXWeEoZSI59D6PFSFIt9NnnLxBTAQpcevOo01c7xuWBvZFPo2r3ZPj7dfP3jQZC6AU05j0HK7pr8ywt7wSp9rcFjWO9HvHpytZIkFe6dLwSlO+njPp1b1fCfwtxSFnXlu+BKcLbCkgW8RRU1Y8KFXABZNIc+Ydrlc0gtszQw1cBXw4LM96ntn9GAdlDp+oTS5bxjeApypjkXLs0KuTtMtYiEw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(9786002)(9746002)(426003)(2616005)(8936002)(8676002)(5660300002)(83380400001)(2906002)(66476007)(36756003)(33656002)(508600001)(86362001)(66556008)(38100700002)(4326008)(186003)(26005)(66946007)(7416002)(1076003)(316002)(6916009)(54906003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DXnrJ1GJqiu0t8/khzdJQDoSDdzCtvRrFwbqY8rzmO7h/oAole7zRZfb7FpZ?=
 =?us-ascii?Q?g7nKpgNzWeoqTjJjOtfgC0uf7vpk+hBbfVhPvzOnkbDCV+6OOH/x5KyCsQdY?=
 =?us-ascii?Q?2qb495f6QwxtiAKqSn560iwBERfqkNE0wctYflvA01DmxABLUShuPrI43BBN?=
 =?us-ascii?Q?IeyABwvs455MJO59iI2idlbt7irS80HuqzMUQM1y8oGq83c3C4fX7GSKhYV6?=
 =?us-ascii?Q?5aRUw/3nqlp6wl74WWZ2Apy/kKJ5qMe0MORoAbgjt02C3K170VABUfT8w5hi?=
 =?us-ascii?Q?BikoIhj63Ew1/a+s04KwTtWomBeHwMUaIWLsPQVjijq1oNF3sJZcdTj3EG5n?=
 =?us-ascii?Q?tNbgyP/XdQzV9LVwmRR3OK/8p1HfxkIMI0dSbfKvxRBcl2Sv5j9hvbDZ5KMj?=
 =?us-ascii?Q?TsXCgnA1vjeWLZG+SB1RGvnsByJV9sumCqMCx2F3xsOKoqiOCVm/Bvqod5tj?=
 =?us-ascii?Q?uAbCyLf+T4Cvc5ZWhCno1G2a49Q42YwmwWng8BOBduM9Xnd+bbZYzL6Ntydw?=
 =?us-ascii?Q?qY0FIh/l44gWaQuL+aSWqqUzhQr5QU8tOKqKEqd33mqopP6hPd6KHCPuaJm4?=
 =?us-ascii?Q?vIfOi4pHZSmBGCs49vc02oB9bdM+XuiUnuh3S8CLJGkmQelHvcxFjwxiZPuh?=
 =?us-ascii?Q?ahDPqPOXbUv/IuZ2th++NhGXfzloW+pvoAetIjPFgCPxIw53AsbwI0cVhxZd?=
 =?us-ascii?Q?pkgKgKqUrG8UdUxbydOFfuNl57iSz43F8AfMOgs4XIU/HMs0F+MDvUCPGYaa?=
 =?us-ascii?Q?mghjzw01jhn3HbJB0FwMLR5IWApuSloqyh2b7qWXQ4oVDpJT4ajkxOKlBOA4?=
 =?us-ascii?Q?iNCC3sLafJb23c3F3656NZ7Egb8XOjMeEdq0GNEWxodSQmjU/NVFCEAJv8py?=
 =?us-ascii?Q?P2cWeLskqLpSAwiK55rDkfqfUsuVXq4GHnxSVkRkChC9mMNwWj3gfZ7iTGwP?=
 =?us-ascii?Q?nkvT8TEkqpuVRO9t5I1bGh1hqgtvjCVWDukr+3zaRJM1LyTfRnyoSx/WliPY?=
 =?us-ascii?Q?Gf5OlkbqLGJoSCGveIHjOh7PmG21ZWwBiSFXTniW66EObS58BzldL/A74zVJ?=
 =?us-ascii?Q?/+oHtDOhGQhG4gl9wRrbId5+uH2WYqF/3l7htWJNNEa1gEiMzjrgJESc9e2o?=
 =?us-ascii?Q?A0AQPAQRJTU8MVkurW34gg0hjVnav5+QBnHLuqnJsRubRfw3uLQOx+YxFpa0?=
 =?us-ascii?Q?VwEjK1qrflNyPZiA4+C0pQRqa+BH+OLr9oa9OsDjU6Rrpy2YW1HfVo4ICN6Y?=
 =?us-ascii?Q?Cm0KS+9FQsQZpPIRrilQGx8WapW7Vt81OLT9L7cPhg9lowg4tftO4wmS5DU0?=
 =?us-ascii?Q?Crq/dFvdiSafou8AwP3eoYkMijLTOG6zawmSsXOjcaZ/5UIaeMCzIRQ6Mqnv?=
 =?us-ascii?Q?kfBO/JtmhgiIre8rkrlFdfLmeVETFHEyQ5acJOQv28sgqOZrO+rggNQNj3bA?=
 =?us-ascii?Q?Xs8hmM9BMnoLvhPzbI28cWHpazNsXq3asTRKdJ9KTv19DWR7PUXMjYMYj7Ga?=
 =?us-ascii?Q?ALQuEcKuD+ql1/NsRtBaG4Wgk99xDVc9ZliG4+n57mkOlxDZRIN6PgrHmJzK?=
 =?us-ascii?Q?LaShTJCSyJ3CtZT8Wek=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd0a7af6-db9d-424c-ff6c-08d9b5a25a4a
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2021 14:45:15.5860 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hfPU1iuT4TXLtSDHxF28C9Z+zdeCqb0rqRpoRGObfoVoNsSvXIcgCWahbUwSO/3l
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5288
Cc: Allen Hubbe <allenbh@gmail.com>, linux-s390@vger.kernel.org,
 Kevin Tian <kevin.tian@intel.com>, x86@kernel.org,
 Dave Jiang <dave.jiang@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 Marc Zygnier <maz@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
 LKML <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>, Joerg Roedel <jroedel@suse.de>,
 Bjorn Helgaas <helgaas@kernel.org>, linux-pci@vger.kernel.org,
 linux-ntb@googlegroups.com, Thomas Gleixner <tglx@linutronix.de>,
 Logan Gunthorpe <logang@deltatee.com>, Megha Dey <megha.dey@intel.com>
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

On Thu, Dec 02, 2021 at 03:23:38PM +0100, Greg Kroah-Hartman wrote:
> On Thu, Dec 02, 2021 at 09:55:02AM -0400, Jason Gunthorpe wrote:
> > Further, there is no reason why IMS should be reserved exclusively for
> > VFIO! Why shouldn't the cdev be able to use IMS vectors too? It is
> > just a feature of the PCI device like MSI. If the queue has a PASID it
> > can use IDXD's IMS.
> 
> No, sorry, but a cdev is not for anything resembling any real resource
> at all.

My point is that when the user asks the driver to allocate a queue
through a cdev ioctl it should be able to get the queue attached to an
IMS, today it can only get a queue attached to a MSI.

> It is ONLY for the /dev/NODE interface that controls the character
> device api to userspace.  The struct device involved in it is ONLY for
> that, nothing else.  Any attempt to add things to it will be gleefully
> rejected.

I agree with you!
 
> > If we really need a 2nd struct device to turn on IMS then, I'd suggest
> > picking the cdev, as it keeps IMS and its allocator inside the IDXD
> > PCIe driver and not in the VFIO world.
> 
> No!  Again, a cdev is to control the lifespan/lifecycle of the /dev/NODE
> only.  Anything other than that is not ok to do at all.

Said the same thing in a prior email - which is why I think the only
logical choice here is to make IMS work on the pci_device

FWIW I feel the same way about the VFIO mdev - its *ONLY* purpose is
to control the lifecycle and we are close to stripping away all the
other abuses using it for other things.

Jason
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
