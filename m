Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF2B53968E
	for <lists.iommu@lfdr.de>; Tue, 31 May 2022 20:51:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC10C41C6E;
	Tue, 31 May 2022 18:51:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zRP2eArqLb57; Tue, 31 May 2022 18:51:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 8E7C141C6D;
	Tue, 31 May 2022 18:51:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5A0E8C0081;
	Tue, 31 May 2022 18:51:17 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D3D1EC002D
 for <iommu@lists.linux-foundation.org>; Tue, 31 May 2022 18:51:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AD33861287
 for <iommu@lists.linux-foundation.org>; Tue, 31 May 2022 18:51:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=nvidia.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qE-iklbMFiaD for <iommu@lists.linux-foundation.org>;
 Tue, 31 May 2022 18:51:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on20620.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8c::620])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 71AA860B5E
 for <iommu@lists.linux-foundation.org>; Tue, 31 May 2022 18:51:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CY0++9bwO/k0KqCLHjcCNxhfHvSte48tdUIINN6+PRQ7GPXHGdpnEdWWCd8CGj9X8jIytPnii0uXN6YW1GotnDEe4KOpeSlbBSVL/ZA5RLSGskZAAHFZ1OT3MWJ5huEWnUCS4BOfqYvFq3vFXMWAaY7i5CafalG4AyJ0nI1HZ/dQFg3IDGjhcSTWNvLRuFy4lc21d03B0HOJv62egKAq9Ti6i4FYz9CP3LyLhmp0GCngEwComao7Cmj9yvYRvFFzW6uWEAIZQO0F7nfyZDtsvaEpVrVN7TeL1aXZ1FiM81D20p5LK+VMtITRO/xLRyVokWF947BusUBjIWKJlX14Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EXp66Di8DRresZOsYFQBu6nqG3w3CI0F+RVth1Wcqdo=;
 b=MMjajOdDPsM1a0VSZBGPe2BUWURHuYBRCIE0qMKq3l4deFSiQsuyMW2+E/sDYDNhq4P3/wTXOiwT7EgsvVt2LYInYRymmlVj2NVjGaJ2OepW6tPMaPoUY+XXL8jtTNNaN1S6cxvhHCfJYXHjFWGkEPsb22i2yhORkPV2ROHjmf+bo3bpmo4ey9b2NWHB5tX+b3gsRM+Zwk2xhHRDYRXPY9bTD4iG6bSBtJcdf9CJ2k4znmVYzg44kzL5MTVf6qWgjEL4nc4uVg+irc1KfpJQZLwJpIfq2qgQ1rXhGbmPk+s1YrvzZYKM0xU0vN0MYwrN/SOHkIRTJzZd1V9F6qLLIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EXp66Di8DRresZOsYFQBu6nqG3w3CI0F+RVth1Wcqdo=;
 b=n3tyHYS7Y+M36TrhbMaYyNBHBt8HCPh25OpZabqaGS5yBu4JfRve4cllxJpzJlvUxSjqlp0Dpu88z+Nd0q0xyi+jX0QHWtQNv6VBcpMjYzCMf9Y8pTzo+RFr46PLfHNLzQamsVUTwtRqOqDEi7BjcnScBYZL74/iI2ZeGv2yi5tuQoVoHU5D6YxjfMXyXlKahbXtdHR0MQyKcTr4uLwEupaHsXWarKu19MABloJeFmaFCMGbazFe4e1DZ+7Y2/9WmX25yZIRJpZEFQfpFsuFZZ3msNshDOaKL9qgr1gYx446uoQPuAMyzh5bk0Fn2Cd2mjUgy9LVgSbeLTgujF68lQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by BN8PR12MB3443.namprd12.prod.outlook.com (2603:10b6:408:63::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Tue, 31 May
 2022 18:51:11 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::2484:51da:d56f:f1a5]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::2484:51da:d56f:f1a5%9]) with mapi id 15.20.5314.012; Tue, 31 May 2022
 18:51:11 +0000
Date: Tue, 31 May 2022 15:51:10 -0300
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 01/12] iommu/vt-d: Use iommu_get_domain_for_dev() in
 debugfs
Message-ID: <20220531185110.GJ1343366@nvidia.com>
References: <20220530121412.GX1343366@nvidia.com>
 <42623a73-c288-1c0d-7021-93caff4ffb6f@linux.intel.com>
 <20220531131052.GD1343366@nvidia.com>
 <60318d83-e22f-f922-436f-6c31bce24d59@linux.intel.com>
 <20220531145301.GE1343366@nvidia.com>
 <a7d6d830-cb06-e0d7-0688-028f9af900e5@arm.com>
 <20220531151332.GF1343366@nvidia.com>
 <b66a2e3b-9adc-5150-fe00-d68b141b1c28@arm.com>
 <20220531162152.GH1343366@nvidia.com>
 <10f16c13-c50d-892c-a20d-979b2135c953@arm.com>
Content-Disposition: inline
In-Reply-To: <10f16c13-c50d-892c-a20d-979b2135c953@arm.com>
X-ClientProxiedBy: MN2PR16CA0045.namprd16.prod.outlook.com
 (2603:10b6:208:234::14) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9cce3b50-466a-4b15-61ef-08da4336880b
X-MS-TrafficTypeDiagnostic: BN8PR12MB3443:EE_
X-Microsoft-Antispam-PRVS: <BN8PR12MB3443B8E1851A32A69D445AC5C2DC9@BN8PR12MB3443.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hrnVK5mMh3MuxetUjQv0LFSoWfm8P97gQ781EzDeKrtfV/Z2pFLOcEwRYR3QzCJDXFs5IH6kiNysNphlmoxO1UFEDb/xerPyaVTVp/FqQ0flHTU3lDrMjiM+6UgQwnXxCaU0mI5/MfYID8jnu01ApZp+XY0mjakM3gKq9B4YyUvZIQtt35ZHI/q8gGwd9P7Zx1VMpXoCP0YzDZ/KAGUODlwRtElVFfCgBbKRYrSkl2JN1OjuDnzKliY1mTfc8i4a4VE+HirLgP3ikNF3jsURwuju4tKgqJsGhMoFuiYVvXkEYg1zehfGSbsGOwxY/miXa5cBiMSRodcxG5yjQLlwWWp8Kj/aw+RpMKLhCg3EvaM+IRU63o25BmfngFSgaPujQjAgYGTKXNL+CUNIPbmpZGCSFL2dujx/UZtWK6pylK9FkNSWZv6eNgfNNr6qd5MeeCFI8VVivhB3FeRf9r+SLxtvRb7rkF4XhfOPagMKYyTn716rDtKNqJZxHpEDAWx4D0urtGIk3lq80ClN7+Fbp3bbm0VdUb+QoXQWXN8eS2Su45q4QyGY5XJG9ema6bqzbY70MSQRU6rsHQOVQUPskKiver+Yp1oKw3Ubca8bgVKOg2yjMlqvoCnY5K48CMc0OCb6/vJJmOB50v8jN5fsuA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66946007)(8676002)(66476007)(66556008)(54906003)(6916009)(86362001)(33656002)(4326008)(2616005)(8936002)(26005)(316002)(6506007)(6512007)(83380400001)(36756003)(7416002)(5660300002)(1076003)(6486002)(508600001)(186003)(38100700002)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yvznQFJqbQEKb0DSn6NNlKIgAq9KIvQ7z2MP6fIbP3NGTg17MU6XKNUTKPUs?=
 =?us-ascii?Q?DPVfns8+zP8Zkd0+ziMJ6mkeFWyrOW+wGGougIXPgs09A8ZgIweNQLKX2F6e?=
 =?us-ascii?Q?qfOBvVHrML01IHYM9H4hJLSM3A1bQeHsPHpfUnty4x9YSIj1eBHJZ4bCc/TW?=
 =?us-ascii?Q?YcVhFFqqop/aa1So5H4Qray32l55HN2tl3fkMUdBpS3IHh6qtzhfhtqyPBv4?=
 =?us-ascii?Q?P+AWGf8A6u1/6+cjZyJBe5St7rNUAO9CnSYwFDI3MVoiee8723DwL6MRnQ/2?=
 =?us-ascii?Q?YhITDcgeiJFIUw07gSuRW/pEbtvSOqxZjvKuuQUT9d7VPTMpjsiFwcr2p9NQ?=
 =?us-ascii?Q?fHQYRq8HX4//XQ9/ouu3djaPBFEyMMGXirooPukPLZP2dMwf7qjndEz40B1C?=
 =?us-ascii?Q?BR7HYmIrXjWYhbpRMIJWL5XnI6Ph5GhyBbdN6PFava4Th4gdLjzh8c0KEX5V?=
 =?us-ascii?Q?HLRP32C5Apmw3TrmpJq1hPanyjRRzzMd2dcyF+xHKifOdGl2kAdOt/4FftoW?=
 =?us-ascii?Q?Ts3fARjl9IJKIV1sJ7Yb2hYRU7SsqEx/VpnrUQuM1DH3xxG81R6Ut+MoULwe?=
 =?us-ascii?Q?wUR4ZYDzY/w1wxJ4xeXjBeK3sWtruuLP9Uq1XxU8X9VkfGxGGvGQqVVyrPg+?=
 =?us-ascii?Q?n1Er3s9C1UWxC0D47ngKBI8g0/AA5xMTSvq85FlFka9DGwehVlJTGrVr1lQm?=
 =?us-ascii?Q?mmVNJl1IKJEUHRvlrXoLkIKubj1GTMsf4DjSWAe5KO4ubKSHuLcS49cq4XoA?=
 =?us-ascii?Q?BfoTkOmq5z8quLaE0+3cYkETo62iyn2sHoOw61JSS5PC49Rc917Ss8Q6Wm2g?=
 =?us-ascii?Q?f+dLU04viPwiDZ70pBoMemfNzel+vHyTISeEII1Nx70m6vj85K7bqTU64VSl?=
 =?us-ascii?Q?EwmHllgrXp3lhaBmlNADDW569AIiLkXoU89N9DbFXb0cetW6yG+QF1pVYfxQ?=
 =?us-ascii?Q?8UIVE+EnvaWpAvuCo9G3gh2MXtQ1lU7mnZ+eKqfMnN7xSOMRthOLEIwvKUyX?=
 =?us-ascii?Q?LzFlyV/DGsXIeaC39vkqFUFL3Cdp5SOStMVCn4N3e6WsqU6wUFWigT5i5je0?=
 =?us-ascii?Q?nIE5CehqvIQSS2YsHRNvpwjX4/mYpWeEGK3mX5Ooz4FxhEDQUWzAwlp2d1i0?=
 =?us-ascii?Q?qA4F5Hp7BBWVr5CuW10h6gqj5hNRrEU7GUpVpO2EWvrZ0/xqSF/fKmISfksP?=
 =?us-ascii?Q?EvtgtVHwBsIXJmR2WkBRO/gVr0eWuAa1a2LUeAEktt7oR736xXNMoc0SLRa+?=
 =?us-ascii?Q?CtzaUlxt4zIGXiOZl/nE6C131mOk85PkiTXrmr0kmnUYtwBX3KqpIOeaPFjX?=
 =?us-ascii?Q?/xkh8uyIQmbZzGT0J7cNsgWL+Q0Q5AQZF2cz0qCKGtjbrVDyp9/AnIyDvxBG?=
 =?us-ascii?Q?F8NTkreiUTm/w/4DDvu35/SaAQ8bOHuo/3AlU7j2Z6jha1qqK01v4vSREPL8?=
 =?us-ascii?Q?2dVxvZbQacX3IFe666/SnRWQwHuzxrfUU2K76Mt5MCoPqj0vhcl0/klM1pmT?=
 =?us-ascii?Q?qV9pKNJ2Zb5BP2kggckwg7adV0wtPQNI68StpL/FuAexSP+JEHgoREzbES+l?=
 =?us-ascii?Q?u/AkxZN6DqsdxxJh8d5Sb/PVnlY1MPhDc2sJBbuLp2h1zHbYM7uZLaGttAVw?=
 =?us-ascii?Q?A2EG2rOTbCbVqg5GJAYaimQJruFJirvnpTrP3e/n+qTGDL7ZMR1Wrcq/OfY5?=
 =?us-ascii?Q?I3/U8ltq3MR/u+ycBbDV5ceGUzQpNF7miBcClSf/Ve8axgBT1Hlgj+pSpu8P?=
 =?us-ascii?Q?1/vxKyjotg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cce3b50-466a-4b15-61ef-08da4336880b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2022 18:51:11.7807 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pc8xGKB7hg4ts5xVuL4ldewSiqBx2gJ6MpDru4RsnyNGymiAh2wtcSiLwmb32pHu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3443
Cc: Kevin Tian <kevin.tian@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 iommu@lists.linux-foundation.org, Jacob jun Pan <jacob.jun.pan@intel.com>,
 Will Deacon <will@kernel.org>
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

On Tue, May 31, 2022 at 07:07:32PM +0100, Robin Murphy wrote:

> > And we expect the iommu driver to be unable to free page table levels
> > that have IOVA boundaries in them?
> 
> I'm not entirely sure what you mean there, but in general an unmap request
> is expected to match some previous map request 

atomic cmpxchg is OK for inserting new page table levels but it can't
protect you against concurrent freeing of page table levels. So
without locks it means that page tables can't usually be freed. Which
seems to match what the Intel driver does - at least from a cursory
look.

This is one of the reasons the mm has the mmap/etc lock and spinlocks
because we do expect page table levels to get wiped out when VMA's are
zap'd - all the different locks provide the protection against page
tables disappearing under from something manipulating them.

Basically every "lockless" walk in (process) MM land is actually
protected by some kind of lock that blocks zap_page_range() from
removing the page table levels themselves.

> They might either unmap the entire region originally mapped, or just
> the requested part, or might fail entirely (IIRC there was some
> nasty code in VFIO for detecting a particular behaviour).

This is something I did differently in iommufd. It always generates
unmaps that are strict supersets of the maps it issued. So it would be
a kernel bug if the driver unmaps more or less than requested.

> Oh, I've spent the last couple of weeks hacking up horrible things
> manipulating entries in init_mm, and never realised that that was actually
> the special case. Oh well, live and learn.

The init_mm is sort of different, it doesn't have zap in quite the
same way, for example. I was talking about the typical process mm.

Anyhow, the right solution is to use RCU as I described before, Baolu
do you want to try?

Jason
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
