Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id B98AD4F96C9
	for <lists.iommu@lfdr.de>; Fri,  8 Apr 2022 15:35:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7205341150;
	Fri,  8 Apr 2022 13:35:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GBWs0mK3f5US; Fri,  8 Apr 2022 13:35:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 6577741157;
	Fri,  8 Apr 2022 13:35:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4D2F8C0087;
	Fri,  8 Apr 2022 13:35:54 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D28D4C002C
 for <iommu@lists.linux-foundation.org>; Fri,  8 Apr 2022 13:35:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 68F056136F
 for <iommu@lists.linux-foundation.org>; Fri,  8 Apr 2022 13:35:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=nvidia.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 67deteB0auYT for <iommu@lists.linux-foundation.org>;
 Fri,  8 Apr 2022 13:35:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::601])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 489D161366
 for <iommu@lists.linux-foundation.org>; Fri,  8 Apr 2022 13:35:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J4eXDbepJzGG3q/2xgQjxdgjgm8/ZztC8NOW9/4rEhCv5s2vr/QU2splpqTFZoVjPpVGKMTGSFLL1jsP3UYymFPYOqMarQB8mIYZ22sS98WoWsiXeTpxfXkYtw5tzP5kAltBAmTC5qRbqOi0r9Me2rSk5SSs8ndI38djW9FGP+pB4MA/7u6lbWD2GT63PH5+38Fn7/bfhINI4v54rNNrjkqqZywrlbjGiy6OslabRkgo8Rx83lRh0KS3hukGeicrcy7WW/qDmW0LoLvR4gZSxHEpwIJny/gd57x07E6nVL1GZ+Ym84c/D8yiE9KSQzcMv/3E+jkssHmfbIljtKxKmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uiIB4pxCbNLxmCQmLmRD1VoVRB7qVcCSJ7ACthhfAm0=;
 b=l0Ukthp8r3CwScFDYUCiR3PZRrEqsIdD/J2yXzjvUF/AFTsXmE0mXX6ELR3/zvUOkG47FQmuQww1s3Q7mEDlb15nHEJH5sMOB2pUFestgmjQf4mVwIQ24bPpA6Cby3slI+XBwAcr4CqCPOOeORPlgm5CqZrXAFuGlDz35BliKIVOKkp27jtdJMBoBWKAsjDbpOF8Z10dsjVIuuYUGY6t+epYARJjq+oP3ts+pKT7I2NyWkQ1HfiNtDqoTWutvFMha/svbGC5A5hZz2BadsOoIxl5ecS8A+5eARFPZxvHY995BlqT/U1boO9djOOsc4G4kmtzF9KIC8bI/5ikD3B/kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uiIB4pxCbNLxmCQmLmRD1VoVRB7qVcCSJ7ACthhfAm0=;
 b=UplJmROWVz35KMlurjzcRAKSfMQuM62ZrDiDInYcvksaX/NPpE4ur60rTU8EpXgbnLEtx6aqvV/x3ziOoTypl8ZCJurLsoDM7VnLeR3t2uSXJMludEbaCVwtLqQagCkQtROPCD4v+/lVYcAjudfSaHzuPTh4fw6HMcZsa+7tDsST4ptzW67fJ1alsvnLOOipWctfaVSojN0s1oVym2UBxiKHjCdWbmR3xz34EvRYhxLeoY5ba2w/BTSTiyYvFg1dUSARG1Wc8GgUP0o5BYt4t2w/uqCbGAQLa1Wuze2Ytp7v9fQ8ebHhqUnVOi9bXiKC3np+uHlf5AvYc4S/edYSTg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by CH2PR12MB3656.namprd12.prod.outlook.com (2603:10b6:610:15::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Fri, 8 Apr
 2022 13:35:24 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::cdfb:f88e:410b:9374]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::cdfb:f88e:410b:9374%6]) with mapi id 15.20.5144.026; Fri, 8 Apr 2022
 13:35:24 +0000
Date: Fri, 8 Apr 2022 10:35:23 -0300
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v2 0/4] Make the iommu driver no-snoop block feature
 consistent
Message-ID: <20220408133523.GX2120790@nvidia.com>
References: <0-v2-f090ae795824+6ad-intel_no_snoop_jgg@nvidia.com>
 <f5acf507-b4ef-b393-159c-05ca04feb43d@arm.com>
 <20220407174326.GR2120790@nvidia.com>
 <77482321-2e39-fc7c-09b6-e929a851a80f@arm.com>
 <20220407190824.GS2120790@nvidia.com>
 <4cc084a5-7d25-8e81-bdc1-1501c3346a0c@arm.com>
 <20220408121845.GT2120790@nvidia.com>
 <4f93d16d-9606-bd1c-a82b-e4b00ae2364f@arm.com>
Content-Disposition: inline
In-Reply-To: <4f93d16d-9606-bd1c-a82b-e4b00ae2364f@arm.com>
X-ClientProxiedBy: MN2PR15CA0012.namprd15.prod.outlook.com
 (2603:10b6:208:1b4::25) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a4d149f-b865-47ad-3996-08da1964a276
X-MS-TrafficTypeDiagnostic: CH2PR12MB3656:EE_
X-Microsoft-Antispam-PRVS: <CH2PR12MB3656094819A5F0CED1EF5204C2E99@CH2PR12MB3656.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q48+UbtDKaVDj+bAfb5OURkLtSziZjMtE3n8EQO9zgC1Leos5oYd7hFVx/yScnEL/pxmcNfE7tO06bPkxKGlD3D5ejkRnJ+9aLLV2Uu0NhMT3kwcauqOELrLH5GfWyUsLWFUGhtsxDgqVC4Wl3Aom09RIMswDmNTIlY7WDSsp37g8pxS3Hs9WgYsucZJrZtQkB2c+zZa2cQfXvB+X8TwyQmQNMdLjVNXpu1wRH1ordn/zELLTrznVWXZKFZs4VGqS54BBw9CyBIBJ3nACtZkRbCFlJ/3yYfZPtqycr0bnTDPu/6JzgCfrtkp4cQ/L+alCdrbDQfn2DRX+zoRR2r8pKRDLSDF4Lct+oOAZgBBxwSXz3vgDnbKhDHuUIP+8g8svkYFATdD3Non4ZDudoJCpy1BYv+PbLeC2mbzY+3hLStuRcTiMbSuVL9fs3bkXAEufDkH1uTfyi/Tkyu3RThKwckxH/4UIgXvh+kS1P+WmOLLpTFNLV7CfUX1PVsVruqV8nTjL9RJpumTVS+FWjabOPRo8m0d15InHTJqdsX+TrrUg9yfyJ2hX8uDJ8bkezSgIgr7b8iCwxpcGJL62b3iIN1JmrMDEKHy98j8V2uTurXO04e+r1Sq7/t3ffrMOQh8aGPHgQ6zKUuKUnCo64dgKg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(1076003)(83380400001)(6512007)(7416002)(2616005)(54906003)(8936002)(26005)(186003)(6916009)(6486002)(86362001)(508600001)(33656002)(6506007)(66476007)(8676002)(4326008)(66946007)(66556008)(36756003)(2906002)(316002)(38100700002)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LJ9J0MyAQf6PSClmLZEci+y7f6hxOgMDOYeDI9en5Nqlx1LjBfH8iq1eNX+V?=
 =?us-ascii?Q?fM7R5oSwuYFyC3CUs0A+CUKAzWBwY2kQpzNLc8iJEbHLyQhbHtfbDyMOS4Wg?=
 =?us-ascii?Q?yn9gZmw3Gt8XAAc8/anhBy/XUeKC4/1OG5/bShk1vNBPw+xCOsynOmRUwxM2?=
 =?us-ascii?Q?f1jEpiITcUM7peqq74HKc6nlLsX0cOwZGGahLNdV8xvrN6KfDbdQ/IyljzSI?=
 =?us-ascii?Q?Jh7rCOX9GGGK5g2WlR1N2OsFWnlw9IzXT5QWt4lNAXq500n8OZNRUaxOk1J2?=
 =?us-ascii?Q?ZuDwB23utouqqhDMs9SXARrn28ZRLSplVxvYCtgdRM0WWDEzIC4k9wgeCVAx?=
 =?us-ascii?Q?aaSOpnz8xOzdWK/XK22Vr2ek4LimEetfKJe+cRhHl1lbiO2mGETilBUrKJCw?=
 =?us-ascii?Q?wLX3nuSg/GBKqkSeJSM0s7SgKMM1HjbR/KRd1fdq0EIsfEF+uXeccOLw4/x0?=
 =?us-ascii?Q?nKgqouQ3wRwcJv32qheKxtK5rd/86HTzjEk8qw9j+ga98D/bWYflKASh0IU7?=
 =?us-ascii?Q?7QwTO1xBLjnpuOHThy1TUL5zbTD6+byQI02tZpSmFGxTAPdgbgs6RmEILuzG?=
 =?us-ascii?Q?C9pjEPvu1nJcRlaxKa5GNmN66CTn5iPSKd9/kuR4PhAtZili5QAkHWFO/Vpi?=
 =?us-ascii?Q?EhYtTOA9hu3FJU7nNRjFCimiBmcbzZEpQnXlnqDek4L7GnADUc67oC3ARFwK?=
 =?us-ascii?Q?hEAdoYof3SIczyzhb4ybk5NyuPlXgnPVDQmHsy4SN9Ma3jR/bl/2v8vJ0roW?=
 =?us-ascii?Q?0ghFTh/sOAqSfnco5CyW+5L3NOZxS29oQXoasT9r9pGH67kZYKhM8ih6Q83j?=
 =?us-ascii?Q?cBW8s7ZriPaF0ERFNFF9Av2CRX7JAH/v1SCYjFBwy+73De3UFLvGlhWeO0rf?=
 =?us-ascii?Q?OhpG9p/pFqphY8V8EkDGexGbyL47LzCZCZMx4CbK/QW6SxV3Q3maQJNQzi9w?=
 =?us-ascii?Q?r9hUL8EJkmlbKQZgm3WQAM68BzpyKzEeDC/x6ytDOhui2BWDuZfWuLYEr7b1?=
 =?us-ascii?Q?3PSp9Hjks4h2W9ZMP1QKQtbhQ5BAKJ1CoGp4iV13INVfXONigtLaUXoDSYov?=
 =?us-ascii?Q?1AvWXUt717+XT5tjVT3xvbe6dgbQrKSyqGB7NfmhoGvGEbg4DZdiLOEDA8UI?=
 =?us-ascii?Q?UGM27l2OoKbNt3jN6l8hWJRXxw15OKYOioxKfdSAyrFlEaQyd85aqq2D5fHE?=
 =?us-ascii?Q?o0hWdC8/ikCYau7NjSc4oaHrTlHHhtdOTEMOeZ58qIToW42K8KRu+hRVNrdt?=
 =?us-ascii?Q?sC8ZrDegjZsRpd42v5ibFc1Xkt67P/Ldn8/+E3gEaaelDcslfHWr+Ze8Ut+3?=
 =?us-ascii?Q?TdPKvV19SJ1jkjFGw7CqCgrhxn//vyiUt68ljy0xEnEeEBImnGkQFHs5u3S0?=
 =?us-ascii?Q?wD6qfKgIgGveVvsPLekkd18EerXi313mxs8Qo6bwsHBwaunULr2aQlSdZ4De?=
 =?us-ascii?Q?KwgkKPqIvP+eZvLEusm0E7jjYWGtsAg5f45Fxk2+QL5grT9Yv4jgP0blbbSm?=
 =?us-ascii?Q?4dSIdEOxShHCcEdx9FgyJ9JcLIzB5aGo8cD3QJxTwbmzvNdTGFyrTyJeU33B?=
 =?us-ascii?Q?Ol+kwCp4ws+yFgSYeMWhTk9zyYYXlHopEQ5waYB1IaAeelArAyXe7cNa8iMb?=
 =?us-ascii?Q?B6zA8Is2CQsKkS3cwj2ot5LajUZ7MDk7jyRIKZj4HKR5YPh7KO51R4A5nvF9?=
 =?us-ascii?Q?LIVre7Nv29gSyIZBPOCJSrUtkw6H4haakrCuS1pLMqI5/nG2Ux/GO7X8tnhH?=
 =?us-ascii?Q?0vODIGcyHA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a4d149f-b865-47ad-3996-08da1964a276
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 13:35:24.0833 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I5x7vyATY8+rsJxOatPlc9gtaPOhHfD+ovNcUtILB7DDbrcHSYL68pOern+2NBe8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3656
Cc: "Tian, Kevin" <kevin.tian@intel.com>, kvm@vger.kernel.org,
 Will Deacon <will@kernel.org>, Cornelia Huck <cohuck@redhat.com>,
 iommu@lists.linux-foundation.org, Alex Williamson <alex.williamson@redhat.com>,
 David Woodhouse <dwmw2@infradead.org>, Christoph Hellwig <hch@lst.de>
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

On Fri, Apr 08, 2022 at 02:11:10PM +0100, Robin Murphy wrote:

> > However, this creates an oddball situation where the vfio_device and
> > it's struct device could become unplugged from the system while the
> > domain that the struct device spawned continues to exist and remains
> > attached to other devices in the same group. ie the iommu driver has
> > to be careful not to retain the struct device input..
> 
> Oh, I rather assumed that VFIO might automatically tear down the
> container/domain when the last real user disappears. 

It does, that isn't quite what I mean..

Lets say a simple case with two groups and two devices.

Open a VFIO container FD

We open group A and SET_CONTAINER it. This results in an
   domain_A = iommu_domain_alloc(device_A)
   iommu_attach_group(domain_A, device_A->group)

We open group B and SET_CONTAINER it. Using the sharing logic we end
up doing
   iommu_attach_group(domain_A, device_B->group)

Now we close group A FD, detatch device_A->group from domain_A and the
driver core hot-unplugs device A completely from the system.

However, domain_A remains in the system used by group B's open FD.

It is a bit funny at least.. I think it is just something to document
and be aware of for iommu driver writers that they probably shouldn't
try to store the allocation device in their domain struct.

IHMO the only purpose of the allocation device is to crystalize the
configuration of the iommu_domain at allocation time.

> as long as we take care not to release DMA ownership until that point also.
> As you say, it just looks a bit funny.

The DMA ownership should be OK as we take ownership on each group FD
open
 
> > I suppose that is inevitable to have sharing of domains across
> > devices, so the iommu drivers will have to accommodate this.
> 
> I think domain lifecycle management is already entirely up to the users and
> not something that IOMMU drivers need to worry about. Drivers should only
> need to look at per-device data in attach/detach (and, once I've finished,
> alloc) from the device argument which can be assumed to be valid at that
> point. Otherwise, all the relevant internal data for domain ops should
> belong to the domain already.

Making attach/detach take a struct device would be nice - but I would
expect the attach/detatch to use a strictly paired struct device and I
don't think this trick of selecting an arbitary vfio_device will
achieve that.

So, I suppose VFIO would want to attach/detatch on every vfio_device
individually and it would iterate over the group instead of doing a
list_first_entry() like above. This would not be hard to do in VFIO.

Not sure what the iommu layer would have to do to accommodate this..

Jason
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
