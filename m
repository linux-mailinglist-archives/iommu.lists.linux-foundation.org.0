Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id E421D379448
	for <lists.iommu@lfdr.de>; Mon, 10 May 2021 18:40:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9741F40552;
	Mon, 10 May 2021 16:40:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aw-8OZW3ESDt; Mon, 10 May 2021 16:40:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id A2E4940551;
	Mon, 10 May 2021 16:40:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 71B65C0024;
	Mon, 10 May 2021 16:40:03 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CB9CBC0001
 for <iommu@lists.linux-foundation.org>; Mon, 10 May 2021 16:40:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B25ED40551
 for <iommu@lists.linux-foundation.org>; Mon, 10 May 2021 16:40:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5XZsV0Gq8PHx for <iommu@lists.linux-foundation.org>;
 Mon, 10 May 2021 16:40:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::600])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 93B40402BA
 for <iommu@lists.linux-foundation.org>; Mon, 10 May 2021 16:40:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AmioHs3IgmS2vIbDXGS10leCYUGRH+Kgj/wv1WZ8pM5Buasdv35MKUNiCgK4S7WhsRt3PecixTSHPNB9Xk8ce8gyC9wKfUAWLIp8oamG5wwUhCgUu7AH95NbBgNTt9SmLHNZ3CooqKFm60zQ2DZToi6bokyJrKcHhIIskTDVSbKHzVNdbANiJDGyh7tg/9Nto5ikwPSkCAvNj6dO+qANZew0a2PJD7S7oKkzD3iE4kM3bOWEgKI/UKzayIc93iaAZ61udsn7cM/0k4pMIIIYhldI2irTp6mwRM9W1BaWRq7ZBmPUWGkmdYsUx2vK/M7Bvy6++wb/rcmnDGnn5qE63Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aamh5W010c99pQ7W0CL0uGNQYPJkJSYQhWeISNlUlrs=;
 b=EWFehVXM/ZLdGl5hZMxwvViZ8+zDwPCxPvZHSdwRXdJLjd4002f7x/X9Aq1vONsO8ftpBuknUAJX4Y4SKngcu8E8F8DceFlsL83rHtVyqUEq6Yc6GZ/XDTiDteT6sJpcH9iksmwCNrLbfCVO84A/eNGA6sw2lOqks8Ro2mN0DBcyLJ2VA8DWkQhg7lNihmhnJ9JjHBFHCEw1ImvZb/PdELFk+8HwaEU5909GI7GQiNYPBfnSrapARK6zRFtEpjibLrTw/HF+ybnWyzTVWLDP/Tda6/vvU3DTeFWd3khyGjGulgPmAmfK7pdS73OxAA9CHxHXTk4xZis1sawtoWjLDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aamh5W010c99pQ7W0CL0uGNQYPJkJSYQhWeISNlUlrs=;
 b=XxNzY7/9N5ELx34GFE8E+TpvXWkGDVvKYRwIkv/H0wEl32DxSZR2zPN+Hh3dv2w4sKal5p02VsUSTievXnIKp5bqfTU6EYQ/e3Zh4flVk8+syjdsiOyXUt/+s5OcJSj9rqQSWmhDO0LZuXsf7UA8SrwZTLCRyK/rVwBMK4d+Xht/kH7c0oxoJJZPpBpt+FA3oA/o118Kc2v9kkCLT23lPf3ZKAn+1wkE8DSs48mX/iOPewS6oLggHjMoOyCb9wWWSyqDtdH/BxwB3PJgg8+iknzazbZZusvSZau8YFxAqCY2djkYGo+2ceBzdVTvS35Q6enxL4BH9udSXgEOop4OtQ==
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM6PR12MB4265.namprd12.prod.outlook.com (2603:10b6:5:211::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.26; Mon, 10 May
 2021 16:39:57 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::ddb4:2cbb:4589:f039]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::ddb4:2cbb:4589:f039%4]) with mapi id 15.20.4108.031; Mon, 10 May 2021
 16:39:57 +0000
Date: Mon, 10 May 2021 13:39:56 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Raj, Ashok" <ashok.raj@intel.com>
Subject: Re: [PATCH V4 05/18] iommu/ioasid: Redefine IOASID set and
 allocation APIs
Message-ID: <20210510163956.GD1002214@nvidia.com>
References: <20210505180023.GJ1370958@nvidia.com>
 <20210505130446.3ee2fccd@jacob-builder> <YJOZhPGheTSlHtQc@myrica>
 <20210506122730.GQ1370958@nvidia.com>
 <20210506163240.GA9058@otc-nc-03>
 <MWHPR11MB188698FBEE62AF1313E0F7AC8C569@MWHPR11MB1886.namprd11.prod.outlook.com>
 <20210510123729.GA1002214@nvidia.com>
 <20210510152502.GA90095@otc-nc-03>
 <20210510153111.GB1002214@nvidia.com>
 <20210510162212.GB90095@otc-nc-03>
Content-Disposition: inline
In-Reply-To: <20210510162212.GB90095@otc-nc-03>
X-Originating-IP: [47.55.113.94]
X-ClientProxiedBy: MN2PR01CA0003.prod.exchangelabs.com (2603:10b6:208:10c::16)
 To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (47.55.113.94) by
 MN2PR01CA0003.prod.exchangelabs.com (2603:10b6:208:10c::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.24 via Frontend Transport; Mon, 10 May 2021 16:39:57 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1lg8wm-004cE1-4S; Mon, 10 May 2021 13:39:56 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0107b155-b884-4ed9-fe7d-08d913d23f27
X-MS-TrafficTypeDiagnostic: DM6PR12MB4265:
X-Microsoft-Antispam-PRVS: <DM6PR12MB4265F5E8D4430BCB0733465AC2549@DM6PR12MB4265.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MYEyVuQUkNwQ/2mXGXlp/C9VFMxmarNSuakArYYwtoC5+9+wCgyA99mBABmSiBp36d+UCTDAmApy+l6qcN+GMkSAQPZorSecgANkaXOKkNyDUhxfd0HZ+97UV49QEqYXCJcJYQuslJxVlPiNxlqgoocYNr/AVw9KyUfWwPyBtB6kRHwWtJg6+zcjLZjkC15OG7njxKfweZ4dAPrvHnJ1BQ7eOFJTKzkzk1xAHWFbk/z8zV0DCbDUv9HldL+fvPi3/7j2nhkyhfSqRlf+LBHXS+1nGahEFtYt0NTIj0O8QO39TRV3kdDkGzlsoqmhS9yBEPXa92PTIcMWwgsJiBwpIagWvEFcF3N42ii5oauH8LobInKCuipPAcYGJTChJ/gBFwBANnTmQfbrK7YXCINTtNvCF+gapIsh0YyupKZKQIPagdWjWipcApde+gcgx22eU03O0VutytJvjrIq+/jSChcQ3PL56yFEDF+6x4vX6x7faTnnTfS9RAqoEW6ZKilovqFswvE5+thPtaGqiIn7j+xIEDkgE6qwYMd1QRdsiK26hUnZbuC6KYnIreFxfgI6zxB00XSUxyoHE9lNa97tjdZibip2wp6qMP+UruGjBts=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3834.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(136003)(396003)(346002)(376002)(4326008)(2906002)(8936002)(7416002)(66476007)(478600001)(316002)(426003)(33656002)(2616005)(186003)(9786002)(8676002)(66946007)(54906003)(5660300002)(66556008)(86362001)(9746002)(38100700002)(26005)(1076003)(36756003)(6916009);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?1NuXN0GZYIM2zK5Rys4YHSNpPeDE9QMK741jEWWgZjTnV7nSs3T7+HCKbdFO?=
 =?us-ascii?Q?Ld3i8rlhlgYPXzu5ppFuyDv20GJ1JTlIndINsTX6LdxiPbpBWR64KMbIAxw4?=
 =?us-ascii?Q?YB1kfqX0DGlUXbOzcypHyh0cN+eEgbmBzVsB/SEQjHBs6hRqY5F2eDR6vIsL?=
 =?us-ascii?Q?G7Zpm9pEd2Z42USvN0YFvZWz91G9xP/DWzSM62MnKj9IM5HnOdH7Cogw+3tr?=
 =?us-ascii?Q?36kIXrEDbmVKYZQIu37KaAggLoYK7dwy86NxGdbz9o+U8QSQ/JERF2NrtvE+?=
 =?us-ascii?Q?DqcSPiM1wNG2Lm3uxbuHMVA8pLq6LiUEPnZFYw80hgdZLCjIe34bOOD0oAgW?=
 =?us-ascii?Q?EfRGbGbKwQ6t+qroL2ZGsxVP6FWx2TAdvDFwX54qkgR2cxt5InGKkgXOr9We?=
 =?us-ascii?Q?WxqS0TEnuq3Aue7AtzsTZ5mOOAlecoR2vbmEI8kmSaQ+3KXgBsfiN2axbSqa?=
 =?us-ascii?Q?d/0U+3B51bt2YMCj4PxjGOM2yKG+JTE89iXkv5N5Amb+2NT2JHiGy3RMvxj3?=
 =?us-ascii?Q?V9MW8zN9Tpr1TYIZXtJk48yVd/rGX0ESy7Y0fgtJ0EZMFux6176kR0Ctjmmh?=
 =?us-ascii?Q?a2sJbQzUwKoeTgSTXU6V7oFYmVr6MA7twwUuIyKR9aNuqu0cGyV2rI6alg45?=
 =?us-ascii?Q?KGWsPMjIK+0hb9DADCaI3WPyFt7lrEuXL4IkksKVIL7YjaYtHrCngjS0a4W7?=
 =?us-ascii?Q?Q/Gwrx6ul1/ZakZoenYQBluxBXp0r4A7FqqGzfmzCfeW7AqYvVUNZG5g0wO8?=
 =?us-ascii?Q?HJXIAMxrAM53hJzrYfcMPA01TpIAvlNCICiwKGkVdJfWt5OtI6C6Um5NKuRu?=
 =?us-ascii?Q?3u1RmG/T7vdxL0+jLVGmq3cphhDMAXG1g6F+CsEvlhxD5SL5AfDKXyYtFrMd?=
 =?us-ascii?Q?J3wNMs1mHI9c2QtUJB5W4PxX1DLXcaDR81Fva3qvTwk2duMJTLqZLeqOUMzP?=
 =?us-ascii?Q?b1C7k3Dmv3DAa5YOVLBScJObPznic5L+uMJurkd1etOxm4T1furFUIack9DJ?=
 =?us-ascii?Q?FeFCfYFBks+AehUuUsRcB50f4c87QtzkL3FvyFCKLxRpKWPGNJV0Z3t4ZJeS?=
 =?us-ascii?Q?VtkZg4NdhAzN4fo+JpqN8yEycacRbNAcGiBYbXb5KrUHJILRfoIlTlsodNQZ?=
 =?us-ascii?Q?8rzDG+TQjaw4mQNoJL+tvup+MbJ6ViwRcfYvZwJwiZJvBOvClOXWAEhvxiwr?=
 =?us-ascii?Q?EJ9XZC9b1d+2/jrYDJDEbC33Gk5DR0Gf1R+F4BYj4O9MzIjY6J0ubP0REbhW?=
 =?us-ascii?Q?WtQeI86Yx3lAp13iEemLoHCTLxlEnrKOwLQ850I2DnmgltwRNFvbXZwbfsYF?=
 =?us-ascii?Q?2b7oysCCz8OVTb8WX/49+Sya?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0107b155-b884-4ed9-fe7d-08d913d23f27
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3834.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2021 16:39:57.6959 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rh96MM3F4as38GjrCbuDGzyuD6tUU1Fy8UYd1uWBJCCDa+hMbowVv0XWSEEEmHvP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4265
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, "Tian,
 Kevin" <kevin.tian@intel.com>, "Jiang, Dave" <dave.jiang@intel.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>,
 LKML <linux-kernel@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Tejun Heo <tj@kernel.org>,
 "cgroups@vger.kernel.org" <cgroups@vger.kernel.org>, "Wu,
 Hao" <hao.wu@intel.com>, David Woodhouse <dwmw2@infradead.org>
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

On Mon, May 10, 2021 at 09:22:12AM -0700, Raj, Ashok wrote:

> Those vIOMMU's will have a capability that it supports PASID allocation
> interface. When you allocate you can say what type of PASID you need
> (shared vs local) and Qemu will obtain either within the local range, or in
> the shared range.

Isn't this what I've been saying? This all has to be explicit, and it
is all local to the iommu driver. At worst we'd have some single
global API 'get me a global PASID' which co-ordinates with all the
iommu drivers to actually implement it.

> > > When we have both SRIOV and shared WQ exposed to the same guest, we 
> > > do have an issue. The simplest way that I thought was to have a guest 
> > > and host PASID separation.  Where the guest has its own PASID  space 
> > > and host has its own carved out.  Guest can do what ever it wants within 
> > > that allocated space without fear of any collition with any other device. 
> > 
> > And how do you reliably migrate if the target kernel has a PASID
> > already allocated in that range?
> 
> For any shared range, remember there is a mapping table. And since those
> ranges are always reserved in the new host it isn't a problem.

It is a smaller problem - all the ranges still need to match between
hosts and so forth. It is tractable but this all needs to be API'd
properly and nothing can be implicit, including the global/local range
split.

Basically all this needs to come through in your /dev/ioasid API RFC
proposal that I hope is being worked on.

I still think it is smarter to push a group of RID's into a global
allocation group and accept there are potential downsides with that
than to try to force a global allocation group on every RID and then
try to fix the mess that makes for non-ENQCMD devices.

Jason
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
