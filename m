Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA4855A0EA
	for <lists.iommu@lfdr.de>; Fri, 24 Jun 2022 20:46:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37B76847F7;
	Fri, 24 Jun 2022 18:46:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37B76847F7
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=q/1cQCPk
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cxaBxSIWtsXX; Fri, 24 Jun 2022 18:46:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 3A6A6847FB;
	Fri, 24 Jun 2022 18:46:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A6A6847FB
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0E773C007E;
	Fri, 24 Jun 2022 18:46:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 76FDEC002D;
 Fri, 24 Jun 2022 18:46:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 42FA5847FA;
 Fri, 24 Jun 2022 18:46:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42FA5847FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZBWVuelTF8Kq; Fri, 24 Jun 2022 18:46:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E214C847F7
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2058.outbound.protection.outlook.com [40.107.243.58])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E214C847F7;
 Fri, 24 Jun 2022 18:46:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YGJha/yn0345YY+ROBfmLpPlsqXKQR9cooBerE/aOAAqj0E853Mhug4tGlSssV9+HFAf81o/to0rftSQ8Jad9ALp3s9o7VtS7o0eOq1xscTZgRWG4oruEsN/IR3BfowXD0susY/ISOR60ucPnAHyKZzBMif9Q4zb5oElGTEPSXMEB9A3D+qTym/I7RBt6Ay1UXbi/enPNRsRabY51DyOBgKX6EsOfBKP/pleo8lt8tHYiSLLdQvM6VVr6ATLsku6yM7I+UR86qP90Wc5X9PllsEFxACZGHNPawxUqV7ix9ox3WkhqNwyh5WxF+IwuPkkDbUSkwzBDbGapABzUQB4IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qMLGChXTWvaZAEPnnypHBwGDQ98ZO5bzJsrBiVBrT1Q=;
 b=dSVUgnywsu15J2hbF3B4EBUG2NNPWw/Jwi2c8gx+Oy7wKYqMC5dloaWAReDkXlvtIF6XU2nU2deRETCkZgFAKqVlgxUYm+As7rr/D7E9JQ1gypemDDOu9v1043WfeLW10vO+ui2mhRgu0p+Vz/xuDS6mkt5OSdSDhyx+AhnDjkBMis9CGyaTqqZiNkpdOtyfrEUj5XHIGvbqgnOPm1ttNFcIpBpNeg9nE/HYE80p35gz5i6jBi0Prgt2b90D/Fb85q0hUMvJ1i3Q8xh0ze//ogfkDdDF6QTvAOFFARjKGhpAVrX+SHN8kz9GGUXw7EOYGUf2w2uJPXroE4oaVUtRdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qMLGChXTWvaZAEPnnypHBwGDQ98ZO5bzJsrBiVBrT1Q=;
 b=q/1cQCPkABkJrHVgrDV0lhhtOya43CWIYtW3WgAZAHIwmrNqWiJXbeRwDCq6wlJn21nyS1jRTjC1VK3pYASr8w6DqycKcstPkWuY0Gl4G5Kmp8yJKDLn/kMml6Rby7SucHEFg1FLy4v3iF3X6kfAPvfrzU7g/eobvBZbv4YfWJyHeP2wJZ8ukqQm1W+dQB23oEEPWgsyKZTAx3Wh0qx5bMlZtZd44Oh3SDUvT4/E8BPFNCguklfVIDkA56SzwW2pdqVZKliAOCGQVSHYcn56kBCBRIrJpXsU8HaxVshfJUIXeb+fLuOqw65fQ9hdNaVwiRPOtaoJI2dfH62GgqYFuw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by CH2PR12MB4232.namprd12.prod.outlook.com (2603:10b6:610:a4::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Fri, 24 Jun
 2022 18:46:29 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb%3]) with mapi id 15.20.5373.016; Fri, 24 Jun 2022
 18:46:29 +0000
Date: Fri, 24 Jun 2022 15:46:28 -0300
To: Nicolin Chen <nicolinc@nvidia.com>
Subject: Re: [PATCH v3 3/5] vfio/iommu_type1: Remove the domain->ops comparison
Message-ID: <20220624184628.GY4147@nvidia.com>
References: <20220623200029.26007-1-nicolinc@nvidia.com>
 <20220623200029.26007-4-nicolinc@nvidia.com>
 <20220624182833.GW4147@nvidia.com>
Content-Disposition: inline
In-Reply-To: <20220624182833.GW4147@nvidia.com>
X-ClientProxiedBy: BL1PR13CA0251.namprd13.prod.outlook.com
 (2603:10b6:208:2ba::16) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cdb88057-a9fe-4436-bdd6-08da5611d9d0
X-MS-TrafficTypeDiagnostic: CH2PR12MB4232:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oK+9Kohy/MhoHLPN1+YqnRUd7loUtib0HLAuId7AJwM0J/Vg5d2WU+aXw0x+0CizzzF4tFOF90BSfTgL/Mmn6vP2itFgE5dDN3SkzpyYLKRvJGUifWV2qVbeFi54OTNZuv7U3RzZ+PCXpThHC83/Ccmy+/wQcq/tvW2eBbJgryfiKDNDaRgM65m4OH9h0Cu5Ab8mfUtOG2eBHYYZGDYc6QbF+Nl9HDzF8gHniycJ1DtjPbyK/JRCemlaQ9CpW42o+y/bE9vqDGxwM7IgEroF2QSxEqkyyn9+gXArfyViF2imrswM1Pel0oOpzx1Wi3/OWtgLf48xawr2e7WfG3sWK6ibsTJmefA40PI8sLh76RuiPEE2a7OtnzsiWx3NvCVHgYc0rrY7LDYLnqY5mTxC++HH48ZMdc/NEshZd6kI05THeNxK//9FnV1h7DG6rQ+JM6/TVfQNpuKdsUgBhFeFkLhf7z20Xr/Rb3yTkaQq+UzAr6dhxILNolFk39c9lAi7Lh4ustYxTbUPVWuYE1YrQVJlO51HDaQQpG/DqOHaM374g9iKAqKtHjyBAiQTZqlq0HywVT/L4v3wf7MOAFyhKZKo6Ra9KiEV+sIyp7YqPYp1o0bIXELmfC1yX1/6upjY+EtyuGy4ZffhYtqwITWq631l1NmkAWUF6V7IgsLbgodslOv9lIqtmpQSw1uZZNRJLlbs0IKpUEog3CF7riOFBzmAp9A8+5hIcCG3EQ0nzaiiNuwRcXlqPAzCYQwhPJtKQZJZoAiFBtH/G0r7LHmffYqJ3OgozOaAkxSQlB3sWrfIOKevI9jkQMs4tAskD5vUPZ4QAE+LE5PzI1o3jSsf0lEFZsvCKxMNgTbdjHRqIHc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(346002)(376002)(39860400002)(136003)(396003)(6512007)(6506007)(5660300002)(33656002)(6486002)(316002)(2906002)(36756003)(26005)(41300700001)(38100700002)(966005)(478600001)(66946007)(37006003)(2616005)(66556008)(8676002)(66476007)(4326008)(86362001)(6636002)(6862004)(7416002)(186003)(8936002)(1076003)(7406005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FF5a47BhAifM0dceBonHnH9Jy7mIB+AMS5G2BarWFhHLyV/5hQda0nPSJdb3?=
 =?us-ascii?Q?dGFmsnfMPH50CdXlr53YSk2uNS+Xevs4gtub+qVlPJHnb5q9kMvW0oynM18O?=
 =?us-ascii?Q?CxjEq/BvmcuGmQAbWtp49OtHe7ITW+cOALSW63cyT1X/cXBAprmxWobkwgD7?=
 =?us-ascii?Q?Ri2S96OMB1jfiFxjD61VpGjFB0ZKZ1zhwa3QDgtCDB4A40ehB+VdLMeDV5wk?=
 =?us-ascii?Q?flaMZCgJsIgm7R3+iBwhe8jwKpnsrnAhG6fdt+0iJrS3ENSuQtS1dmeZqnMK?=
 =?us-ascii?Q?0lCLkRYyPpRsRBazDAx11FC1VU+v7+UW1dx9rgvxa/EpAkG3gxO8T9wH4Sf6?=
 =?us-ascii?Q?qhFBSqdGoj3jivo39ic6s2Ufadd1/p2RCT6Z2pnAeeaZJIJZPqwqgfwuWm3i?=
 =?us-ascii?Q?yz7lx6LBgpnlTqyhlS+DlrK1eLYwTRFzGlaJHNYlLeosjljHMG3BmvxNWXVh?=
 =?us-ascii?Q?Woss4ui1Q4ClyT8UoO8YqSNCBDerBBg8/Cp6Ul3yefiSWxw7GByP3qOGYh4G?=
 =?us-ascii?Q?SmsXd59Ur1Z7TMnU1Baui/JelClKyMkKx305FXbm37RHcMbVq1HCNI677BAw?=
 =?us-ascii?Q?/PVNr83VEI72QLStq6/9wOxJkFgcnSg+lrs0j2nard5AbH1FgmKp55ZKfwfA?=
 =?us-ascii?Q?LEZr+XThEzqFfaVbI06/yDv9wSuKRRx571tPUMvcZPTNZiLK4U4ZcZwOKUTv?=
 =?us-ascii?Q?6AXZPNXZQg7IP4aWQuVMrDMT9GAXKytbvCUy8vW87ZFKXjr4qU6VIV6IpTAO?=
 =?us-ascii?Q?EnoBIiIBXTwJQcBBNuVPStmBsePbeGCHXLm/VeNrOOjlZ7DzHHQgkHVWCfRx?=
 =?us-ascii?Q?A1m2tPT9KO24LKSrXEaCnVrb7pUS5GKpUzW5mzerS7CnNFbillpu5LbtcG/l?=
 =?us-ascii?Q?7ePD6Y6LrMpyDhEBaznx6vdUOVMbpg9Tuj4YMqvlO5AaAR6N7l10ytfq3uNp?=
 =?us-ascii?Q?gPkmTfSRJDYuBKp0bW/bysZPRNWkVxf6uxQ5jClEmspc2DapM+jdihW1rwaF?=
 =?us-ascii?Q?gooq1OS5yfFpOtNejsonl8cR6/Nz05+Ng5KMMW01xG+0RCK0ja7HC4GkzrRV?=
 =?us-ascii?Q?Hbrq6YeMQasj4TYu6S35M5RtoQpGs/lKx1acQEh/SQUjUg451X4Oduqyobq+?=
 =?us-ascii?Q?a/Vw2sEDgfVs3yN9hvGcAx8+5tQYbOC8jV4xYXYnCHOot6DiDYrxaFVRUppj?=
 =?us-ascii?Q?iTRYxW3rLy3ootEJQuSK/N7pmaFdzWfw/PsfcCqgGT2xqiiOhKs2rrla9VlK?=
 =?us-ascii?Q?rXu544sbJ9xddWwKt7VHU9k6gJzu8b6KprHtvqOAw5L1B2ftjcSqcMxntMJd?=
 =?us-ascii?Q?yZAIh31Y6Mdk9XAvr//q3oCd/wC9+olVFnsr5kwpqbVzuOZQ0TS69dJJKKbB?=
 =?us-ascii?Q?kAoB8wogtAdcSKdE0JJzVNaec0spUelLthGWT9BQLy/3q9TbLZzsKWDL2Pc+?=
 =?us-ascii?Q?pmjTciTzvqoGGu+sNLkN7p11ITVAxFYdmQgnODWsrXx4yFamePwyNMma3suq?=
 =?us-ascii?Q?tV8jzsQzX2C+CjeV1xRLJeji518XFOkUQBSPU9Cv6bVvZ1pyE9VuVf5ScXGR?=
 =?us-ascii?Q?TiP9ss+mFC98B+Uc7qjCbJ/HsSxTGfg2i2yTlUcw?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdb88057-a9fe-4436-bdd6-08da5611d9d0
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2022 18:46:29.6520 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cSc448OIFBGkRNEF4AWEIZFWwDhq6wu76mSSXLrkv8w0H1bSnKhPvEuehbpxWuqm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4232
Cc: linux-s390@vger.kernel.org, cohuck@redhat.com, jordan@cosmicpenguin.net,
 linux-tegra@vger.kernel.org, thierry.reding@gmail.com, will@kernel.org,
 alyssa@rosenzweig.io, jean-philippe@linaro.org, kvm@vger.kernel.org,
 zhang.lyra@gmail.com, iommu@lists.linux-foundation.org, jonathanh@nvidia.com,
 linux-arm-kernel@lists.infradead.org, yangyingliang@huawei.com,
 orsonzhai@gmail.com, gerald.schaefer@linux.ibm.com, kevin.tian@intel.com,
 linux-arm-msm@vger.kernel.org, alex.williamson@redhat.com,
 christophe.jaillet@wanadoo.fr, matthias.bgg@gmail.com, tglx@linutronix.de,
 virtualization@lists.linux-foundation.org, dwmw2@infradead.org,
 marcan@marcan.st, linux-kernel@vger.kernel.org, baolin.wang7@gmail.com,
 linux-mediatek@lists.infradead.org, robin.murphy@arm.com
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

On Fri, Jun 24, 2022 at 03:28:33PM -0300, Jason Gunthorpe wrote:
> On Thu, Jun 23, 2022 at 01:00:27PM -0700, Nicolin Chen wrote:
> > The domain->ops validation was added, as a precaution, for mixed-driver
> > systems.
> > 
> > Per Robin's remarks,
> > * While bus_set_iommu() still exists, the core code prevents multiple
> >   drivers from registering, so we can't really run into a situation of
> >   having a mixed-driver system:
> >   https://lore.kernel.org/kvm/6e1280c5-4b22-ebb3-3912-6c72bc169982@arm.com/
> > 
> > * And there's plenty more significant problems than this to fix; in future
> >   when many can be permitted, we will rely on the IOMMU core code to check
> >   the domain->ops:
> >   https://lore.kernel.org/kvm/6575de6d-94ba-c427-5b1e-967750ddff23@arm.com/
> > 
> > So remove the check in VFIO for simplicity.
> 
> As discussed we can't remove this check, multiple iommus on different
> busses are allowed today and VFIO does not restrict its attempts to
> attach a pre-existing domain to a single group or bus.
> 
> Please go back to the original version with the ops check in the core
> code.

Robin convinced me, so never mind :)

Jason
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
