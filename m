Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BAF514D43
	for <lists.iommu@lfdr.de>; Fri, 29 Apr 2022 16:36:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2E471408ED;
	Fri, 29 Apr 2022 14:36:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KnSAg_cjdgQZ; Fri, 29 Apr 2022 14:36:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 1B89C4000B;
	Fri, 29 Apr 2022 14:36:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 016B3C007C;
	Fri, 29 Apr 2022 14:36:45 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8119EC002D
 for <iommu@lists.linux-foundation.org>; Fri, 29 Apr 2022 14:36:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5F59F60ABD
 for <iommu@lists.linux-foundation.org>; Fri, 29 Apr 2022 14:36:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=nvidia.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gSSIfqiSRdd0 for <iommu@lists.linux-foundation.org>;
 Fri, 29 Apr 2022 14:36:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20617.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::617])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 05286605B2
 for <iommu@lists.linux-foundation.org>; Fri, 29 Apr 2022 14:36:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q5vsNfW6cnLOujsranBNpjFVTeR0ivdmdVPXqtXBSEfGF7LH53uI5Dx72NnVIgyiwHPHNtX2zF3EredJZh90c6uBUvdp4Ud8xaYlB3HFAOUUd+Io8rJYsPa9ZgskCBOjBpJURMOrRCDJh7L11+1h0RmI+Mh0yzD+6NE90vJlfdxtP6Pefz0C0W1g4IhR9byHJwwSARHnYSlR5hn0m15pUvVKQ2+51HyvqKoAzQjPVGA4Zb6Hr3hytw7FFNkDWjdYQxAEIL5lk+RINfO7HWbzo88dWbzV7wSPbHDCLJtx9SQa23scOS6gLZeVPxfKSypXjJU3exyCaTTuJpzTNx/CtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=csy9pGE2cVcey6fn3yOZM3VGELYhl3nUXGa6KtQND3Q=;
 b=Muupcj5YY1X0U9/TLxIzI//+HI3toLaAqwSgWZZh7lPvK3TLfk06rtxpTY69j/VGMZfnLOjyaDZtxcXUaU/P4/OXQxupJTt2W/3p6IDxmp2+0QJEKGc7TVCWID/h4k6wGQFw7Arl/FwoYmMcwkHGdFb+cfuGfmf3wZxj2lIVLZOyCjAmG+sj/2Abe4fbOSnnCIjp5wNAv8TgxKVSxR6xXYinRJ2W9dCvj8OYEU6D5I2CDuo3MKTPSLoMxAJBVaz44UBy+XaqWE+5ILu5oHhdmLKChGipp0vdRoXv2P2FjOsYdB776nz6oMDAuWLfwFCYhVPWq8YCpJOYWpimeBXUcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=csy9pGE2cVcey6fn3yOZM3VGELYhl3nUXGa6KtQND3Q=;
 b=iYzFtN+xlmHAv2LG6tZfVQgpuaiRyPbDoQ2bx96SZlaY7bTd/KVLzAKvGEri7bo9+PArMXZL1cTGnEc76D3d6mBM1iMMM77Ybz6QU4o9sWeN5pUfnhnsWB7GR59AGJR5mRR9gS4uBCyk1MN7/2Pvy2qdx3+2dXJhyz9m+zvb1DCY0D2rwvchJJNGV+qf8AGGnIpJvbLC862l/hZZRsT2hMHPX2AMXNFPhPQmPthhk6PazMRcHH+EkfgKQInnG06ZO/1FdlE1wbKT3jgjtC1v/INuZ02SAMM1qdUQLQDAKrX/K3VfjubpJzfbEETJzydHNg9EsJ+zoOzTXTAEV4MzcQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by LV2PR12MB5728.namprd12.prod.outlook.com (2603:10b6:408:17c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.14; Fri, 29 Apr
 2022 14:36:37 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2%6]) with mapi id 15.20.5186.026; Fri, 29 Apr 2022
 14:36:37 +0000
Date: Fri, 29 Apr 2022 11:36:35 -0300
To: Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH RFC 07/19] iommufd/vfio-compat: Dirty tracking IOCTLs
 compatibility
Message-ID: <20220429143635.GA8364@nvidia.com>
References: <20220428210933.3583-1-joao.m.martins@oracle.com>
 <20220428210933.3583-8-joao.m.martins@oracle.com>
 <20220429121910.GT8364@nvidia.com>
 <862dbdc4-b619-d97e-f358-1fd9e3778c5d@oracle.com>
Content-Disposition: inline
In-Reply-To: <862dbdc4-b619-d97e-f358-1fd9e3778c5d@oracle.com>
X-ClientProxiedBy: MN2PR20CA0010.namprd20.prod.outlook.com
 (2603:10b6:208:e8::23) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e1831278-5cf2-4bff-66da-08da29edaa64
X-MS-TrafficTypeDiagnostic: LV2PR12MB5728:EE_
X-Microsoft-Antispam-PRVS: <LV2PR12MB57281191D4AE27004C214E39C2FC9@LV2PR12MB5728.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T3gZyOnpLmVJau26yhIkHqXHorqkQxIKDH72u3YarrUJH2aLPGr0Rog0jybeetwEPiWmV5i5Raw3VSiiE7KU82T98nCLX45d6S23b60KmiGzivCUPqRzB3Ugp4oLI+C6eCs4jpm5oPVwxZXaunDFCBuswFvZa1PEwiELQTG80hL7TGZof7T9jgWMIjSKmLFQD1el2birrE0sQBvxfkKMzZqZfk0DGdTPfzu7lKzNbtHJGcl7AXIc/3gLo/1ObNtzjRyWr4BnD3nk1bp2HSLhdY13W6ap7EuxgRbd+CnFAGd3CLJJmGiqM+icz0LKaXX7pGazObKWmLXIDtDepfC5IV6ml35H8zAi9HIGjjLg+2EN/ahBa9rKshyntGLHCdeNA3eoqnOXHEuYSllhWrgWREJZIsmbEE5UhnleSAE74Dszraapjf76NOqqKnE3ijqqldaM/7tRms5D5AJ+Xz5Ee3HoSHW1MialLTv8wEyCVtI7myDxRcpawfy0XJ4DLkQTtb2ec24nmgaDPPs2RB7qOXJx1i0IzyysmZFbYeuv766GHGKvAYHaeISmPZCDDcEnktw4+/5xHKQK5IFBPRi/gu4CKhgwF6ppc0XVUOYDID929o8hy5HkN15JWvlptu46twEGhQlotnrUyzS2bksy9sL29wDxCFo+yemcaQ7Q1TfUgroKULymaXgNmcJhH9vmhQdPrm5ylrvvxWbRMtKCvA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(86362001)(26005)(6506007)(6512007)(2906002)(6486002)(38100700002)(508600001)(8936002)(36756003)(4744005)(5660300002)(4326008)(83380400001)(8676002)(66946007)(66556008)(66476007)(7416002)(33656002)(1076003)(186003)(316002)(6916009)(54906003)(2616005)(14143004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RG2oQK7S+GonpsJPeihQ0bcOS6pGEx3nM+wFG0y0Jzy5U/1QwNttEuvBdmm0?=
 =?us-ascii?Q?UGnphz1ptc8fuZlOlJAxDM2Y/0G2p4RnkIrDe7yegWA9UmeruqSD72rRpbMl?=
 =?us-ascii?Q?C3I5cMSTEuFmzdIQ4ys5uex9Ksflgq12ur6FtBSUJnpMrZ+zUl9RK2N/QpeA?=
 =?us-ascii?Q?mq5xx2mMDMMRYY5j0dYkxc0RabPaQnotfQZOW4K4I6YdLxmWY01KvK3dYmSx?=
 =?us-ascii?Q?7HSPozy9RKXmAM46GMHq4lABUm+4t5j0K3GIsPHhhXG5YdOIzDviB+TYZwEW?=
 =?us-ascii?Q?6uxWyh52gYt4WVG8+wY4lzahVHwJ3E/Ot1wXd6LuYq23Cq2sc+7LyKXI7073?=
 =?us-ascii?Q?vTZ/ZM78oZSkX/2eu3VTbTMOq2UCbWLFvfAEeQlu23NHznqGmoBOCe3tnxSI?=
 =?us-ascii?Q?j/fV2fDRviSTYnJObtKfWDtEd8G/vBcLw3ztTdxe61RunQ/iD2m8zeHdT6L2?=
 =?us-ascii?Q?P8nzBYXAv41Mx8ATEU9bVLIdOS2hSofV+aWP4vuqnhWMAM+bbWHnfPBbLQzt?=
 =?us-ascii?Q?JY0XJ671/lcgKGmaxayb+IO/v4tkdCtJ1fnmacRjU5Sg5kChfUI376wwOg+I?=
 =?us-ascii?Q?Rg5fuextiHANmpgBuqhMEVODmWeeGcDHJGvrl115QJrK584SPdwB5HpN2QCV?=
 =?us-ascii?Q?sVvKoQsIZFfRjz8bSf9uoOiYAa4utu5xoR3cb7Dx1pfNTvjSZtLTcGbSVWFl?=
 =?us-ascii?Q?o2ui/sfNPnAhMIt/F7RBqYbK63rei+HEMymifJSk7M+EBG8NyrERZNYmAld3?=
 =?us-ascii?Q?tCLyYT2/Wsjicz5rLlRl4pCpxL1UuTc4xawR/DiT/GHHZbzy1XR6zZVXqWDs?=
 =?us-ascii?Q?hy0OdcW8zUVfR3dn4r9pV6CV0t7IT2iY20Y9gCGH7P8BzVvBcmp73JYS6xVS?=
 =?us-ascii?Q?oTgq15UxRFqXZJq6Y6YLsneWOULMr3SVYRO42lchsu41JaMi3Nzv71ISIJ0e?=
 =?us-ascii?Q?kT2Cjht5J9LMFfyepx8HQPCH5A6C/+IChstCxf/KS96omTdOrRF9tUvUyb3k?=
 =?us-ascii?Q?nnivd/ctK39WDtwj0bZBZe2Q/L71EfQZT+nLtljl8+nCTL6NSF2WzwKHgn90?=
 =?us-ascii?Q?rxa42HQb4+CnlkLkc6JemkuL8s/IZ4QZD/QcGu4wOfqauDNhlX3XU3Fu09tl?=
 =?us-ascii?Q?KngpbM4Nw1Ovts6OPr3Jd11Xu38q/sDk1l3QpoiytnnPV/2c6cKqxNpCeWdj?=
 =?us-ascii?Q?LTGXOap4zL38qay+CYGPNf3RNm+dkloEcyEOWxDLgCq7n/EO5tP6kcMhvyob?=
 =?us-ascii?Q?KQvkOE3bo7t9LFyFQA6ZaDCKGhhdOpS7OFjo3ZHn0cwiTj29jCIOHyGni07o?=
 =?us-ascii?Q?yjxSDaipnvlBEYj+3BZkSkrTeNH+PuYBPjVB70MGaukwPNdSKcyOFiIj36Od?=
 =?us-ascii?Q?v9Nz94ZYdRqRDXCjXBRVO3jnzgp2ktQRDaehxCcZNFCimI9rAr0tIbPksFzs?=
 =?us-ascii?Q?0zlD+js8S3YgHSJd4MuVZJYcPGMKVptM+ADX4k/XQgJ841IpUYT2DSpKpyNK?=
 =?us-ascii?Q?WBemBpW6/+tRYPyrqPxmC//HPpZO/RGLVIt7Xbp4AnKiG6dhifHsljRVWWt6?=
 =?us-ascii?Q?49hUn3S+Zlfm8bqjTtpgk9iHSg79OjmXv9dQatIVwb+2NVA6CyapAMpVQk8T?=
 =?us-ascii?Q?qkpwfNj278jbi1au9HxQl4ncBNm2GnZLWAKxkaJkkoVoOS6N0Hb7SjJsvy7+?=
 =?us-ascii?Q?TIb2ttcERcQP2WzQLK6/pgWPBk8/389GfhdZjopCQSVLEwLerIUY53qpXwmW?=
 =?us-ascii?Q?e8ss0UaT+g=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1831278-5cf2-4bff-66da-08da29edaa64
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2022 14:36:37.0915 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tVqY1fyLzEFJdW1315XgrWIH/xcA8m5LuQD7AuucBU0S0oxCFpsCuNu1nXF21NJD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5728
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Kevin Tian <kevin.tian@intel.com>, Yishai Hadas <yishaih@nvidia.com>,
 kvm@vger.kernel.org, Will Deacon <will@kernel.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, iommu@lists.linux-foundation.org,
 David Woodhouse <dwmw2@infradead.org>, Robin Murphy <robin.murphy@arm.com>
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

On Fri, Apr 29, 2022 at 03:27:00PM +0100, Joao Martins wrote:

> > We've made a qemu patch to allow qemu to be happy if dirty tracking is
> > not supported in the vfio container for migration, which is part of
> > the v2 enablement series. That seems like the better direction.
> > 
> So in my auditing/testing, the listener callbacks are called but the dirty ioctls
> return an error at start, and bails out early on sync. I suppose migration
> won't really work, as no pages aren't set and what not but it could
> cope with no-dirty-tracking support. So by 'making qemu happy' is this mainly
> cleaning out the constant error messages you get and not even attempt
> migration by introducing a migration blocker early on ... should it fetch
> no migration capability?

It really just means pre-copy doesn't work and we can skip it, though
I'm not sure exactly what the qemu patch ended up doing.. I think it
will be posted by Monday

Jason
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
