Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E85645165B
	for <lists.iommu@lfdr.de>; Mon, 15 Nov 2021 22:20:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E12F605E4;
	Mon, 15 Nov 2021 21:20:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gdsUQialIPkz; Mon, 15 Nov 2021 21:20:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id D239960763;
	Mon, 15 Nov 2021 21:19:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AE52EC0032;
	Mon, 15 Nov 2021 21:19:59 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9CB2DC0012
 for <iommu@lists.linux-foundation.org>; Mon, 15 Nov 2021 21:19:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 88D1B401F8
 for <iommu@lists.linux-foundation.org>; Mon, 15 Nov 2021 21:19:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=nvidia.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wofVB6jqCYoQ for <iommu@lists.linux-foundation.org>;
 Mon, 15 Nov 2021 21:19:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2067.outbound.protection.outlook.com [40.107.236.67])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DF0A440012
 for <iommu@lists.linux-foundation.org>; Mon, 15 Nov 2021 21:19:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gd2tK0ntIiUeCyLndbi5/a9CbFsVF5EB4/SikRswJwrRrkFeGuTM7vNGsz7Sm6EikdrqAybpDJp5drOsv6mLlPMT6chWPefFBHedA/zWq0lKI/iPI3a5Vu9MZ/t7xRZXDWwpE8GKuR3HwQlBHKddK4IXY25+9Akj3j+O/CRujQ/9jUfLnw+9w04VtPRauKyB2rieIE2YRjbbOp5eCRBIOlf9inXvH6J2pP1vjgpDL3UUSasyYRqCCMErJ7pCslOnKuc38QwMVqxBvP2YTfRiYoMh8iq2K84i3mvgghV9z+Ds4JAt/Fr2E5dHCDUdJLuoC5NytN3xXMus03MGN0qv8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uQgoRBcumxvVVE5XMnpdCB+bkYUg+WbdN3ugMSG9X50=;
 b=Nsc/2mCw1EZIk6X1uAZNuTlW1jaj4vBkbU3ITNaJYyzFM9ArDIvQjFzYVUPui0psO8QF6/D6l8O6h7NhEEDGCOosiTMFiqYyhGasw2PXWgIkmCrW6g+VrRfZUhZVl5oBTwoRqrJoW476w9IXseldCvnFTU3RH7w1IoT7x5Ib9fX2U4mSe291gMkd4oKyq12ovXY4XoD7yn5hwpKXT1MK+1lQ63VYEIcX2j5sPwlpCSUqEYJNRdx5jAfDM564MLwq2uw1plMuRDVJHhZF6MlEUuLX7o9fc6W83UdjfPKty9HIIh6LN1vI7DGQBoU6jJKQGpa+h0TCE3l/YLjzRSkBhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uQgoRBcumxvVVE5XMnpdCB+bkYUg+WbdN3ugMSG9X50=;
 b=d5+dnqLqpVdV4Zzp1ll6aePasXXPJ4UlIv73urLH8ghrRt3uDax558Ry/lc1aINlY19zJjrHNwww8iOfWWn4iOF/jk+XysNKm8gL3ohEJeyGerj4fGT6Zg0aRTqSAysfYjbnUgihgaP4dauzJoTNQ1e4Lu12ESEmW71arFVUB3krXBYCvaF42GVqozBXfCJNzBPtcyYGLUww4hHN4qVApsTkfn8AoDb/Lowzr4cRg0Nh0ROSgZBZMBMogbcOH4gfYMib8oiEMAaEgJtNGTEh2jyEKbY4A64LBAu/YvMnY/uHpSbaY8v9aa7Gl9GUrHEry3Cv5J76ppcUjmLYUph9/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5208.namprd12.prod.outlook.com (2603:10b6:208:311::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Mon, 15 Nov
 2021 21:19:54 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::5897:83b2:a704:7909]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::5897:83b2:a704:7909%7]) with mapi id 15.20.4690.027; Mon, 15 Nov 2021
 21:19:54 +0000
Date: Mon, 15 Nov 2021 17:19:52 -0400
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 03/11] PCI: pci_stub: Suppress kernel DMA ownership
 auto-claiming
Message-ID: <20211115211952.GA2534655@nvidia.com>
References: <20211115020552.2378167-1-baolu.lu@linux.intel.com>
 <20211115020552.2378167-4-baolu.lu@linux.intel.com>
 <YZJe1jquP+osF+Wn@infradead.org>
 <20211115133107.GB2379906@nvidia.com>
 <495c65e4-bd97-5f29-d39b-43671acfec78@arm.com>
 <20211115161756.GP2105516@nvidia.com>
 <e9db18d3-dea3-187a-d58a-31a913d95211@arm.com>
 <20211115192212.GQ2105516@nvidia.com>
 <ab3ae3d1-c4d7-251a-fecc-d21f6b9d87a5@arm.com>
Content-Disposition: inline
In-Reply-To: <ab3ae3d1-c4d7-251a-fecc-d21f6b9d87a5@arm.com>
X-ClientProxiedBy: YT3PR01CA0044.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:82::29) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (206.223.160.26) by
 YT3PR01CA0044.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:82::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.26 via Frontend Transport; Mon, 15 Nov 2021 21:19:53 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mmjOK-00AdhS-AI; Mon, 15 Nov 2021 17:19:52 -0400
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ad8d6868-7118-4a01-e1a7-08d9a87daabb
X-MS-TrafficTypeDiagnostic: BL1PR12MB5208:
X-Microsoft-Antispam-PRVS: <BL1PR12MB52081FDCDCDEE25F775EA5F6C2989@BL1PR12MB5208.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j17Ww0MMR6ghMRlnQPYPBJFuFlkDhrkJLDakdha7rCqaCkwbUcF+k2Tl/DUgWl2MRSUi53SiF9XVsgwaxfZUp8obqvYiP9SRg74/rnlbE1I2zN/3yubfN7EWs/t4QrdKfP0003xtDr5zq+wwDmZCULPvij7dnuNV5kHGxP5NsyEZmNjtlG7J2p8HIbFnYMYlMjEKiDlYf8Ky6qSnuUqYwWBmrqFm3qvhWRenaXYzeln3bcy1AnxNYALEgWqSyDenDuS3ve9HRGN6b6RuvN+TQOs88duWVsw5vxXFo+tr30Ync6H2ObToqcL3HnwXCcg/bfoQKp8sRXxHe9KJB+F3nCYS+79tyawT6d6p41ZvBqn13Fo63MdutGNw2tif1r65yZZWDKmvqNvAMPq3BLfMLUor7uIsXZqPl0A1LTqUrNVZ2Nxv+C/zlO12jS19nlcbKjf5TPOSESVoyTFUsnJ0KdQO6jyGprGYuayt0gf4hiQgXnz5voz3kxvyW/0IFjsQPAyhHjQ3cgyvNhbgCUyy8LW7nqDhaN9+hl4I+1KK/jDKSTf2GVmRyev/pXm7IaGf9yJ0eAXgoi0Lk1biuXNEIIv+JAZm9453/3EV8BjbiH4b4wsjx8PyJqqKdaqgwrhPSOvv28ceOAuO31hhukz37g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(5660300002)(38100700002)(6916009)(66476007)(7416002)(54906003)(9786002)(186003)(66556008)(66946007)(86362001)(8936002)(26005)(2906002)(83380400001)(2616005)(508600001)(36756003)(426003)(9746002)(8676002)(1076003)(4326008)(316002)(33656002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?K3htXgdc7AiBe73aalH1rN9LO5gickbyqk5hkk1UM7O+b4JVSo3B6w7FDOyh?=
 =?us-ascii?Q?8sD2DWj80nvLsgDrupYVWY6HwauEiPWzJdVl4sWW1oTJ1L8bH+rDA3WZ5YKw?=
 =?us-ascii?Q?rPI7GRwBIiuZ7Wl2HMdNP0zyy79yDXO1cjjd1Ie0qkZJcqxR/jM4UtXUEiFq?=
 =?us-ascii?Q?FfTfPPDEcJuvbKIsKtnM7D3fQ7PSd4CXUZPepLbBa1IwNdW+HvW32/MzLntu?=
 =?us-ascii?Q?puW2mJG4sCFHh8m9rzPC8K+pYobK28JdcnqunIBibw5O423HnGnz2HCHTh/C?=
 =?us-ascii?Q?EF9qAMWoIMUqU9wXxTay3LLKG469BXCQaE0xWTfMBcY5tOU3D96bm16s0csm?=
 =?us-ascii?Q?Gyj0qs/NuexEyHWcOqraasjvrnOGH0hgfVhMMjZQn4zzNmJWnAY9aHjlifjg?=
 =?us-ascii?Q?muLHZMWAX8tEo/yGzhHQ1HP3F6DsSGmCSUAwxsEQpPTK06m5ugwEZ9AFKjX4?=
 =?us-ascii?Q?QN5p51TQt6JTOEFR+qcx4wiuK6I+eIKqlRdGNnpcP//y/07JSswiedttGpT8?=
 =?us-ascii?Q?D8NFHOKDcwPee+bm5Ue6phPbog7/nHiQUq0PXFInE2/M4j4rzvKN4BLTYN/i?=
 =?us-ascii?Q?1df+swRDJsQMu/kzv9MhtIktJ/yBnUdmQeYz0rilETgPXpS0VcZ2J8oW7Kpy?=
 =?us-ascii?Q?zIg1tiOZaRsKImkf5fIdhuG2295K3K4OVXuZKMLxt6e+qUmK8jTK5D8u7I4v?=
 =?us-ascii?Q?pGt5fPpsRVQWIqP6HTop76HGvIr0RAkB9CWDsiPGDv+7m1s8tT7dS5/w4m1y?=
 =?us-ascii?Q?QyuxweY7EAX8hZ4NrYPZTmFBPtlD9A7bR08/M5mnBrJIiVxG1KTyG1Sh3PsG?=
 =?us-ascii?Q?0RmrtGoCIs9P0CMr/pZUGbtATcOl9DhV2UzVLNfatDHS2E1GdqBnrFRmtpT7?=
 =?us-ascii?Q?k/g3H59O5laC5/sQ8JgSKdYnfESaAnVJK0brmP1n2m9gUeRmrwNJxT5UJ5bO?=
 =?us-ascii?Q?mSgCvV46hh9nMXTBZPwjuLXB/xNsheqDIEDhTAP2IKtw/X0Wxyff0Z7g+Gyr?=
 =?us-ascii?Q?Aq+0YLem3RWYKv60zaYGM2oeMX/5AnNsd/ZRp11c9Hw/JN9Uv0c83H1G80FV?=
 =?us-ascii?Q?MtCndDUOe62mNjnuq+aWKlzOLOI2FFXnz1ERWsadYkLJsb0NGh77D15NFEsv?=
 =?us-ascii?Q?MVyndWBqt4nkM5/V1+GGG21lVqcx93Vjj6ZF2uGm3oLB04fU9+PV5zdyGa4Z?=
 =?us-ascii?Q?mkDkl1YuxqZJSM9Pu0gvat1BNmr1Or4yqTUad99iVfHzAehCpJIkiIvOy5Jl?=
 =?us-ascii?Q?oAoLfLGeg6hjz2elPuv5Z+Bvk0apd+D2zSDa6OVZuHng0G7SzTLiVPWn14ps?=
 =?us-ascii?Q?cciOhW5Jxcqq6C7rI0G5S1PQYAFsXq+IEiOEK442i8aHfZB5RI6vRdMS0lsl?=
 =?us-ascii?Q?KbeM4cdnuF3XN7RAePeOFRdDGgpH4m+6vOHv3pKOZDf6dGaa97UCmT+Yi6RM?=
 =?us-ascii?Q?SEGuPWHCz8J6yZ+05xonmt1zxJ4EzLiFmm1dR4L0E7FaZFe7PJ5ElgpQeQE+?=
 =?us-ascii?Q?b0bGY/LxrBSLjSiJY8Sq2CdZ2cAWDQZzfbSRspBQe9NxvkZgeG/7eUqNmEGq?=
 =?us-ascii?Q?RNo/MIocKEXte3gCMTk=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad8d6868-7118-4a01-e1a7-08d9a87daabb
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 21:19:54.0266 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BFn5XgPdAT6K0PcFiARHz+LdZgOKUNJE5eBkF9ZyeJqzNUTwgzSXXlzRb1Vcr1zK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5208
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Kevin Tian <kevin.tian@intel.com>, Chaitanya Kulkarni <kch@nvidia.com>,
 Ashok Raj <ashok.raj@intel.com>, kvm@vger.kernel.org, rafael@kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Cornelia Huck <cohuck@redhat.com>, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, iommu@lists.linux-foundation.org,
 Jacob jun Pan <jacob.jun.pan@intel.com>, linux-pci@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, Will Deacon <will@kernel.org>,
 Diana Craciun <diana.craciun@oss.nxp.com>
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

On Mon, Nov 15, 2021 at 08:58:19PM +0000, Robin Murphy wrote:
> > The above scenarios are already blocked by the kernel with
> > LOCKDOWN_DEV_MEM - yes there are historical ways to violate kernel
> > integrity, and these days they almost all have mitigation. I would
> > consider any kernel integrity violation to be a bug today if
> > LOCKDOWN_INTEGRITY_MAX is enabled.
> > 
> > I don't know why you bring this up?
> 
> Because as soon as anyone brings up "security" I'm not going to blindly
> accept the implicit assumption that VFIO is the only possible way to get one
> device to mess with another. That was just a silly example in the most basic
> terms, and obviously I don't expect well-worn generic sysfs interfaces to be
> a genuine threat, but how confident are you that no other subsystem- or
> driver-level interfaces past present and future can ever be tricked into p2p
> DMA?

Given the definition of LOCKDOWN_INTEGRITY_MAX I will consider any
past/present/future p2p attacks as definitive kernel bugs.

Generally, allowing a device to do arbitary DMA to a userspace
controlled address is a pretty serious bug, and directly attacking the
kernel memory is a much more interesting and serious threat vector.

> > What is the preference then? This is the only working API today,
> > right?
> 
> I believe the intent was that everyone should move to
> iommu_group_get()/iommu_attach_group() - precisely *because*
> iommu_attach_device() can't work sensibly for multi-device groups.

And iommu_attach_group() can't work sensibly for anything except VFIO
today, so hum :)

> > > Indeed I wasn't imagining it changing any ownership, just preventing a group
> > > from being attached to a non-default domain if it contains devices bound to
> > > different incompatible drivers.
> > 
> > So this could solve just the domain/DMA API problem, but it leaves the
> > MMIO peer-to-peer issue unsolved, and it gives no tools to solve it in
> > a layered way.
> > 
> > This seems like half an idea, do you have a solution for the rest?
> 
> Tell me how the p2p DMA issue can manifest if device A is prohibited from
> attaching to VFIO's unmanaged domain while device B still has a driver
> bound, and thus would fail to be assigned to userspace in the first place.
> And conversely if non-VFIO drivers are still prevented from binding to
> device B while device A remains attached to the VFIO domain.

You've assumed that a group is continuously attached to the same
domain during the entire period that userspace has MMIO.

Any domain detatch creates a race where a kernel driver can jump in
and bind, while user space continues to have MMIO control over a
device. That violates the security invariant.

Many new flows, like PASID support, are requiring dynamically changing
the domain bound to a group.

If you want to go in this direction then we also need to have some
kind of compare and swap operation for the domain currently bound to a
group.

From a security perspective I disliek this idea a lot. Instead of
having nice clear barriers indicating the security domain we have a
very subtle 'so long as a domain is attached' idea, which is going to
get broken.

> > The concept of DMA USER is important here, and it is more than just
> > which domain is attached.
> 
> Tell me how a device would be assigned to userspace while its group is still
> attached to a kernel-managed default domain.
> 
> As soon as anyone calls iommu_attach_group() - or indeed
> iommu_attach_device() if more devices may end up hotplugged into the same
> group later - *that's* when the door opens for potential subversion of any
> kind, without ever having to leave kernel space.

The approach in this series can solve both, attach_device could switch
the device to user mode and it will block future hot plugged kernel
drivers.

> > VFIO also has logic related to the file
> 
> Yes, because unsurprisingly VFIO code is tailored for the specific case of
> VFIO usage rather than anything more general.

VFIO represents this class of users exposing the IOMMU to userspace,
I say it is general of that use class.

> > It isn't muddying the water, it is providing common security code that
> > is easy to undertand.
> > 
> > *Which* userspace FD/process owns the iommu_group is important
> > security information because we can't have process A do DMA attacks on
> > some other process B.
> 
> Tell me how a single group could be attached to two domains representing two
> different process address spaces at once.

Again you are focused on domains and ignoring MMIO.

Requiring the users of the API to continuously assert a non-default
domain is a non-trivial ask.

> In case this concept wasn't as clear as I thought, which seems to be so:
>
>                  | dev->iommu_group->domain | dev->driver
> DMA_OWNER_NONE   |          default         |   unbound
> DMA_OWNER_KERNEL |          default         |    bound
> DMA_OWNER_USER   |        non-default       |    bound

Unfortunately this can't use dev->driver. Reading dev->driver of every
device in the group requires holding the device_lock. really_probe()
already holds the device lock so this becomes a user triggerable ABBA
deadlock when scaled up to N devices.

This is why this series uses only the group mutex and tracks if
drivers are bound inside the group. I view that as unavoidable.

Jason
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
