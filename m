Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 0762C46DF0C
	for <lists.iommu@lfdr.de>; Thu,  9 Dec 2021 00:39:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABAEE60651;
	Wed,  8 Dec 2021 23:39:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HMStxHZhZAdB; Wed,  8 Dec 2021 23:39:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id A34A860B91;
	Wed,  8 Dec 2021 23:39:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7447EC0038;
	Wed,  8 Dec 2021 23:39:43 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D45DBC0012
 for <iommu@lists.linux-foundation.org>; Wed,  8 Dec 2021 23:39:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BBE1280E3D
 for <iommu@lists.linux-foundation.org>; Wed,  8 Dec 2021 23:39:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=nvidia.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yWvdyKngVFqQ for <iommu@lists.linux-foundation.org>;
 Wed,  8 Dec 2021 23:39:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20607.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::607])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 78BE780E37
 for <iommu@lists.linux-foundation.org>; Wed,  8 Dec 2021 23:39:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nVwvQmV9qad40fjVl3+T4RilnnDpcmfktUT0b9SbQf4Tuf8wGk/sX3IZsjI2tScWFQYuq4TgiHb2aFACbOCVN4cFZxdsvFoV+FHJ46VHW0xuSeu87sywzzmDVQduUvdsdqqRKJdgAXaRjujzGA+/xX5p3j/DvVHccs1UflELqLmzBZoO8CmTziSpeeMZb/nUNJGndTb7rwsPsZ/w58xRBusqIPV0+5wf82jcxg75ObiUPXOoYQPa9J5t0rz6aOY/6Dw9lG+TVwZFxa+2LgFZObR1hnWLuOYp9lwen5qZCPUNfvE2ROi1Ecn/hxnnetrB/Ri79/N/34p9JfHCnTKWxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d+UYR73GCa9Ap/ufBxpNHNstlHuw+cOQMwMV6lr2CMU=;
 b=Md/5KJI7N3Rd14DexFacO+rh0ZVc8RWOS7QpbtO8T5yDDTGUCm9YMAobvlxvDdrvKXhs1GL/jibQVZ8Yh5rCNmOtl///7qVsKJRshlfNRy3rnbffW16iSpS6tLinzAue4jZ4qdVbfeuFroJ+tha955sfPho3tbiOeEVu9QrEqI6dy6Q6PcGI1LKT7TYITXilRDvhqQzPP1p83n0hdXGMVvgi2gyrKdHUgK0Y+r7eC7DuxxVSTXFrypgvzFZfO5yV6JCGLS/Ot0XVC57vLhvmvG35uUFCvgESh2OOLFDPJgpILj9HprPzdy/sbTFNnjexW6iu7tz4ohmvqfQuEstJWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d+UYR73GCa9Ap/ufBxpNHNstlHuw+cOQMwMV6lr2CMU=;
 b=sD8LCjcIPLBnFS+CEz9EDk3HQXmXCuATBaB9+ar8DBCB5OJoVmq21+/uerHcJmebLuxyS6CFg5AYGa/pGdpI1XWfvZ6c+FiQ6mDyVmJ74WInr19bMlP8wZN1OY4SBGbQsnJD6yFujBril39JwnshDoTz1wu0aUaUIYdxhKA0ZnR/wSFeTWjtJjhIHM4gYxNIQ5MSaDNIVcr48mQ1J8KkTvHAz38i2fxFyjAGT9LNQidwUdk4EESuGcHu0/4fwEhsPdTLu1YwFc5KgvN73tI+/Rx77p9+8MbAOYeWEq856Aq/PLbPYfq2KH0WvTuP474sO7R1Wokqte9J4LYBsZTWuA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5175.namprd12.prod.outlook.com (2603:10b6:208:318::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Wed, 8 Dec
 2021 23:39:38 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d8be:e4e4:ce53:6d11]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d8be:e4e4:ce53:6d11%7]) with mapi id 15.20.4778.013; Wed, 8 Dec 2021
 23:39:38 +0000
Date: Wed, 8 Dec 2021 19:39:36 -0400
To: Jacob Pan <jacob.jun.pan@linux.intel.com>
Subject: Re: [PATCH 4/4] dmaengine: idxd: Use DMA API for in-kernel DMA with
 PASID
Message-ID: <20211208233936.GI6385@nvidia.com>
References: <1638884834-83028-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1638884834-83028-5-git-send-email-jacob.jun.pan@linux.intel.com>
 <20211208131358.GR6385@nvidia.com>
 <20211208115516.1d36fed9@jacob-builder>
 <20211208203022.GF6385@nvidia.com>
 <20211208135945.6d0a3b69@jacob-builder>
Content-Disposition: inline
In-Reply-To: <20211208135945.6d0a3b69@jacob-builder>
X-ClientProxiedBy: CH0P223CA0015.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:610:116::33) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ac94012f-ebf7-4b40-0f6f-08d9baa3ff95
X-MS-TrafficTypeDiagnostic: BL1PR12MB5175:EE_
X-Microsoft-Antispam-PRVS: <BL1PR12MB5175A490EE580E3DC4B970C4C26F9@BL1PR12MB5175.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nfgB5mLI0MNuXsZYf8LxvBEpAjTdo2nBa9jDndWOMFkiK05sNcNYLtZj1oq2aCdHsrW54onOYiYG3QlO8ngTg95BQpcboEikWQfQG4/HgBAicXWeaypTcB25fWXMWmoiI5RxLqHUrHrzJCj8eZ+peZego0/OcAzmwiANFnMQbYhm2ekkHiVA33tLR7Otm3Vv8/EUjupF7vrFX0T9BDvVvoqmlATS0U+HeyJaBu8lpop9ZrpQk2RFN9ZHQfoHsD6at+jRgL6RMUvxTtkNmOn0zjhlmqoNYny0NQj/8vmVwfd0hf7Qa5kGElJAwl4l+9uJun65nk9IMAUlXaegPAaOMPWNAovOU5X+CGad0waphMLafCYd7wCHrbo2n2j13GBKyfE0zeDxy6awT4tfyO95iAe7tZ7Gzal57egenNVIc90AopBR64PPPoRzlSwpu6UhNe+L3/M1NGItN/e4ATuipF3murr9CjP7E0+XUSHKLrAHk38ciYeNn4pERKFWkdWcSH4ulASACA/OsJbidvrCNQYDcGrgAl/u05fqUFeqP19il624S4sexVoqxvCtV1LLdklNa2zdRo7S7jxibDkXZ45/v/4BbSFzRVsTk6pdd0RW7nkE0tTxxVERnpyw2gopR+g5mnEfU64P6A/xyWgtAg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(86362001)(26005)(6512007)(8676002)(66946007)(66556008)(186003)(66476007)(1076003)(2616005)(6486002)(4326008)(7416002)(2906002)(6506007)(36756003)(5660300002)(38100700002)(316002)(6916009)(33656002)(508600001)(83380400001)(54906003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BAggiiiyb/jVCwf1ElNVANU6CDDwVZJhvkqZcp0GIue1uQSNmiaq/qaZ2LlP?=
 =?us-ascii?Q?wKmOwFV2l5pCczjOeTSkAV4JadEZQDfVrn8UfYvUQyTmYLWFgvPKtZPAZDkF?=
 =?us-ascii?Q?O/hVQ1OyaVGhVqEnObiGqg/Bgy+koDO/jS4EJKuWUTPh34Vk5zGD4BmqdBWj?=
 =?us-ascii?Q?A6BwaGUkY3wiqN9LZtPORQKjoFIvh3srppiD7PpE2IIfS27STbzor1CoXA3n?=
 =?us-ascii?Q?8tcAm3MdsbbwGVY1zxYxbBeWo1UyP36dmRTrHC3BUAXSnCDnhk9cE252KuhJ?=
 =?us-ascii?Q?3j17YO/ZbF5ZH1L5w4Ag6JCxqhmAtA6qL08Ao+K9NEizlQYh4w7a0EWC6hOR?=
 =?us-ascii?Q?zdwdNp/DXSUof2fKLpG86acBX3AWzgRa+Qw7weyoSkKQoMe3KJHYt50til65?=
 =?us-ascii?Q?Ujxl4T1xWam3Yq5MunCrGlueLb+nFNtAR3NNMgheHgYOocyPz4EOy3N8UhTy?=
 =?us-ascii?Q?OaMwfIWKvQj8no5inUkp9wXjDj88mqu4IXlBX2nDTYDrW5jNRHZj07eYSFYZ?=
 =?us-ascii?Q?q9yCHH/h+BqTW90bmnZEWeXo3WI+Z2+smCQh17V2Thw6q7tjIYmcMIGjmFKR?=
 =?us-ascii?Q?NtqceixvfiAbC75WqWMoIGrKwfK09P8SKYuwMGDplnLj+abYUTwy19kf54aZ?=
 =?us-ascii?Q?NcT1cvKL4vuSlGbfTJzGwXBtfBL1cr4b7csmQ0tAjQuOTA2+G3AdRQsN8F8M?=
 =?us-ascii?Q?2dRA3Zbj+VhAbuJBL4swvdkS5tyjD4bi1XW1nPWoJXzVgblnQQKFR51EN/eY?=
 =?us-ascii?Q?sUrnn58t/i1ZFGby8Kzj9kqVR5BAIooyM9/UA8XpQdX2jOccEPpLpf/AVqF/?=
 =?us-ascii?Q?SAPyMDbMCfJXTB8S6eIlmX+E30sqVchecVoWOR1XeHbAGJWriEKGaD1ZrL1k?=
 =?us-ascii?Q?jBa9nT3yc0/yQVVLm65pu4lwXnidzdWyC6Rk6YfNI6wEgAgw6Q2YfsPSZVzi?=
 =?us-ascii?Q?PCvcblTFsN4ald4B1strgtkAqu/ebMAVye/4aotR/mLY7PMLHahq1C9FKRHa?=
 =?us-ascii?Q?JNGtNGAC1cjZ1qyZGTIiMirNE0TWV6fp3QAbA+jelg1w7Tw0sJTpk178mOXm?=
 =?us-ascii?Q?7SV0J+iUb/KNSkOpyTuEWOJVc6Jwiy0ysLHDiysGgtM9+toi4OPk7mvnppto?=
 =?us-ascii?Q?8WLo/qIrWstk0AJu/8wyCsVibKOWNfpLrqwvRBUNZXU80LM7nL6Xkamir69A?=
 =?us-ascii?Q?lGI5prKc3/3CcowVK4Pw1XEaV315jcT+H99Qh/bJz+QHLBU5HfuTxlL9cqEZ?=
 =?us-ascii?Q?SP7nWUgilrIFohSm74ee4e8sOtXBvA5OW0PolLOp9sgmd0MVYAormCYnrkrx?=
 =?us-ascii?Q?/5RrWnDlMBDjgBh9jrv+n2reN0ecsHNQR+Ov6KNoGlKn2FaOOfrkHlipOnpX?=
 =?us-ascii?Q?bFB0K6ALN0OT56zcbX63cb5+6KfFvpjZlawLN4SOBnAqj9pXiusFJlnTMRKO?=
 =?us-ascii?Q?zACTh2s0YxEXBr8EnhWwN8muwQwNCKRCisTs7b1igHGiJvOFkoz+sB7TPYd8?=
 =?us-ascii?Q?IAurD6rXDjshOwtbjYbAWLdwfFCsPQwscJ+O28czQjwKzDSSDGVogJjd2rQm?=
 =?us-ascii?Q?qiDKrnPJcQrcoCoOcUA=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac94012f-ebf7-4b40-0f6f-08d9baa3ff95
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2021 23:39:38.1592 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KbbrnWoHHVJY9P5uBft/MFNyB6e2viktef9EAmlWbgvrwDA2CIPQKUJrujNZeIDR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5175
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Tony Luck <tony.luck@intel.com>,
 Dave Jiang <dave.jiang@intel.com>, Raj Ashok <ashok.raj@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Kumar,
 Sanjay K" <sanjay.k.kumar@intel.com>, LKML <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, iommu@lists.linux-foundation.org,
 Jacob Pan <jacob.jun.pan@intel.com>, Barry Song <21cnbao@gmail.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>, "Zanussi,
 Tom" <tom.zanussi@intel.com>
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

On Wed, Dec 08, 2021 at 01:59:45PM -0800, Jacob Pan wrote:
> Hi Jason,
> 
> On Wed, 8 Dec 2021 16:30:22 -0400, Jason Gunthorpe <jgg@nvidia.com> wrote:
> 
> > On Wed, Dec 08, 2021 at 11:55:16AM -0800, Jacob Pan wrote:
> > > Hi Jason,
> > > 
> > > On Wed, 8 Dec 2021 09:13:58 -0400, Jason Gunthorpe <jgg@nvidia.com>
> > > wrote: 
> > > > > This patch utilizes iommu_enable_pasid_dma() to enable DSA to
> > > > > perform DMA requests with PASID under the same mapping managed by
> > > > > DMA mapping API. In addition, SVA-related bits for kernel DMA are
> > > > > removed. As a result, DSA users shall use DMA mapping API to obtain
> > > > > DMA handles instead of using kernel virtual addresses.    
> > > > 
> > > > Er, shouldn't this be adding dma_map/etc type calls?
> > > > 
> > > > You can't really say a driver is using the DMA API without actually
> > > > calling the DMA API..  
> > > The IDXD driver is not aware of addressing mode, it is up to the user of
> > > dmaengine API to prepare the buffer mappings. Here we only set up the
> > > PASID such that it can be picked up during DMA work submission. I
> > > tested with /drivers/dma/dmatest.c which does dma_map_page(),
> > > map_single etc. also tested with other pieces under development.  
> > 
> > Ignoring the work, doesn't IDXD prepare the DMA queues itself, don't
> > those need the DMA API?
> > 
> Do you mean wq completion record address? It is already using DMA API.
> 	wq->compls = dma_alloc_coherent(dev, wq->compls_size,
> &wq->compls_addr, GFP_KERNEL);
> 	desc->compl_dma = wq->compls_addr + idxd->data->compl_size * i;

I would have expected something on the queue submission side too?

> > the same thing, they do not use the same IOVA's. Did you test this
> > with bypass mode off?
> Yes with dmatest. IOVA is the default, I separated out the SATC patch which
> will put internal accelerators in bypass mode. It can also be verified by
> iommu debugfs dump of DMA PASID (2) and PASID 0 (RIDPASID) are pointing to
> he same default domain. e.g

Well, OK then..

Jason
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
