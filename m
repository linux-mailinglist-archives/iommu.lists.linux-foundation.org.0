Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FB9517024
	for <lists.iommu@lfdr.de>; Mon,  2 May 2022 15:20:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 13BDF408DA;
	Mon,  2 May 2022 13:20:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MriY6FT69O6W; Mon,  2 May 2022 13:20:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 0F812408D1;
	Mon,  2 May 2022 13:20:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CBEACC002D;
	Mon,  2 May 2022 13:20:09 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6E06CC002D
 for <iommu@lists.linux-foundation.org>; Mon,  2 May 2022 13:20:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4DF558291C
 for <iommu@lists.linux-foundation.org>; Mon,  2 May 2022 13:20:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=nvidia.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BFRxJxPogcuo for <iommu@lists.linux-foundation.org>;
 Mon,  2 May 2022 13:20:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on20614.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e83::614])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A0E1182521
 for <iommu@lists.linux-foundation.org>; Mon,  2 May 2022 13:20:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PgRRka8fYi/AjAvhVZObVCEBUdyu8a1GAx59RetEHdHrK8ZbfjSE5QU5t2BZlFvkZ+UXzCnPPXPrk1GI71EXE7AA4bEMuX3/3IrrPlSmMbVhp6fQjsGNOCzxlV+ee3tdjSptVkPWWf3ZDjau0Q3AgTBQshq8q33q7dHvXEhPM20KAsmDL28adTOH4fWe6VT8Ply6vgX9IHcR+NnFHkMC2CVqgCSI8VaF0RynxGhTdzJ8+ONkE2+3Twdi9vzfrf8mTnHIA5UegBCTEfn/vZFAQraXsXTtP3qezXPorKZLNctwUfcfNPAcTArMTNbbDQK7Dg0UEHWOh4jLA5LK7dKbhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x+7ZGfUrBeVFp+tZhq64PYUTl/E3Oa2NUCQJ+ervlOs=;
 b=YCOZg0a0oa5dij8pZoF2KoItiVwZdDhRfxNpdpHKq4Y1hEh9n78uhCJvle2DRQdWr0Nq1pbhcCHa6R1s3sOW5Z5S2Et+ZMVTNPFylbDa1niAWcnRHhgHt4gemZlI271SKgQn7MqF91ySDM/lUhBNho6fF/vKaiviokiRZJ94TPPxNlm7lYecN4wsEHUBfKjTDtABZkmhzckhyLRxyPy8eE+ItG401RM0iWx2votmKN5oQdxUCsUxMNRw4r8WL9f976+RpW/mIxQQaZFhg+lwvoM4Qa9DI3AuPUykmu86SCp6zmWDeyYnq4DsgNDK7vh8CJijiDve4CE+QfQJMuOJLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x+7ZGfUrBeVFp+tZhq64PYUTl/E3Oa2NUCQJ+ervlOs=;
 b=etbqBStBJGnNCll1cqd3z+K/ZLqDRlYF9ph3hyavu+Am78xkLqHuOVpzB06Fc3W1CYNk4OyTAbgmkoo3Sy0u/EvhS2tnAMuvXNCSWbnPO7kVMOCUbBLcP7w+Uju/BmKITkhFS9nIiMTrtm7kpPn9ni8im9XTmL1cKi0GLEuoXtHwNOoiFp6MyFQA44JhmN1mghC7lEe6YA46Cm+sncVE+7v9nwciYRwVH8eeaPtpuxbwSn0GuoXlOtNNhPNH6mrWYopLLQeHQurgm3nnoaFPrPDizZuSCKMkn8Wa2NN1o0UcpBa+0fNhEXmfz9GMyS3WIuPXNM8HMydIWZbNHJd+RA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by BN8PR12MB3076.namprd12.prod.outlook.com (2603:10b6:408:61::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.28; Mon, 2 May
 2022 13:20:01 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2%6]) with mapi id 15.20.5206.024; Mon, 2 May 2022
 13:20:01 +0000
Date: Mon, 2 May 2022 10:19:59 -0300
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH 5/5] iommu/vt-d: Remove hard coding PGSNP bit in PASID
 entries
Message-ID: <20220502131959.GL8364@nvidia.com>
References: <20220501112434.874236-1-baolu.lu@linux.intel.com>
 <20220501112434.874236-6-baolu.lu@linux.intel.com>
Content-Disposition: inline
In-Reply-To: <20220501112434.874236-6-baolu.lu@linux.intel.com>
X-ClientProxiedBy: MN2PR19CA0066.namprd19.prod.outlook.com
 (2603:10b6:208:19b::43) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 902f6c28-1c80-4664-a69e-08da2c3e7671
X-MS-TrafficTypeDiagnostic: BN8PR12MB3076:EE_
X-Microsoft-Antispam-PRVS: <BN8PR12MB30761707E2B2BC5ED1921015C2C19@BN8PR12MB3076.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ekrf6i6lbVbXuPbflEpFnqk++eqhSDVqV++pAnXQs6veXjQLWgJD/bSmulVeipE5oJrLkh+Yu3xfY2wQp4n6wxtOZb/Z1di9cJcLPFZO63FpqSNZKkZpppreE3unDrZQQWvU/AubJrzFzB8fMe6hxaWRCPjzFhylHuPZIyDXicPAM9SAhOHE/M8QmB/9R0qv3cmCEJO9KwjYUe8cpc8t6gha+GMHcRvK3oBMO0WJv6s3sQUA7IWi/vz2lBsZJmBhQInGwSGKmfj9L90lljKXKvnJO8pxX//1nJtraHmkJKVXshF0BDVWfUUN4AmBSRpagJMeq8NnDZrf6/eqlRFHWrHg0r8lWgqtObAqoG48KS4ufwvif0ljhw2XYdioxRPfVvZqANebuyx9Po/yen5yqKFX7BpZReZsLlytrwhGXMuHKezuFjXeQcoWUSCfhfkHOC0RzkTaRL9a3ZjIVabXjYuMCK1WeX7Q0V3/8sGVp2JtenjNikW4sbhMk13omKueLZAkFSN17CZoJmABABH91/jpP3MQWYNaFE0+ACFNBFUOXLX9T+4N/GNp4W0EAbaQMM46hpLym99Pfk1Rd3c0evDZzoHpQYp2ZvIDXXR1JGoEXp4gAx/Jt/MKDZ13kn4NgP4WTav1xnXZd6vRw/pFgQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8936002)(6506007)(5660300002)(4744005)(6512007)(66946007)(6916009)(8676002)(4326008)(66556008)(316002)(66476007)(54906003)(38100700002)(86362001)(508600001)(6486002)(186003)(2616005)(1076003)(83380400001)(36756003)(33656002)(2906002)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hEnM46onj1kY6QDV5xMFpEhTbJ367VouwP6N6ZCDkUstEmp9k0CiTOs8Rar4?=
 =?us-ascii?Q?zhogBcxOSRFQWnTThO85+9YIq660nkO34s93WhkXuIAGUzy24hcVHlC1jzle?=
 =?us-ascii?Q?TaKCjX6Z8oRYxj2LnlSPS+mBVf7LeKIOA0MicwUwB0ZIMxRqDOXOUBH/DtMo?=
 =?us-ascii?Q?gQbzwKvLLzASVpUUCOmVxEruHKJ74bZ0HxSdGueszyDzzv3hUKHy97b7KQRG?=
 =?us-ascii?Q?Uz2iC6cf2CWDp/ajQSgdnvMDj3Ej9/ZQwmhS+JkXojqDrE9y2suhPf/nCqp9?=
 =?us-ascii?Q?GKS6ZocQ5gaKBcWbgbkyq9bCjGkhn+J06D6quj2xnmjhjKSF7h7/fShwRsmZ?=
 =?us-ascii?Q?7QC603l0CIfP8bZAdnnx7EGO0oU+YWD2b0qW+4s1Cr8JobuRp5fr2OuMDm7E?=
 =?us-ascii?Q?VCPnUmNmAJJOb+Bns0erDDmh3rv93pxfM64ramWWnFNRW3duHtZU79uLcdyF?=
 =?us-ascii?Q?bBn51psoln4S8bdilXkD/wTDivDPJ0jYHCA8G46yMOcj9YkFtqLfNIxm4ObW?=
 =?us-ascii?Q?yohKi10glrYWwof1GL8KL22om/8ZTLUr3oDKnMhEq2BGbdCGFepLxGv8XbAV?=
 =?us-ascii?Q?ol/LKKXt2D6XV+Y+KOXLya1z0EbOq8QtNgVz+ObkyeflvL3cO9mM+9+IMV2+?=
 =?us-ascii?Q?PT1bwD8rcsyKkj2QFkEtPVe7J7JWsSvA3mT8D9wQiF/0WyY9Ws0bkfsnXrBu?=
 =?us-ascii?Q?CQzbLn5pPewYeff2JLqhI384DMSsds1DD2spcYxHiwX3BlQkSZMziXftb8yn?=
 =?us-ascii?Q?kJeAMX5K9IYcGgFJfvIubiM2WyBAIxHaQ66ACz/X+4kBsQTp9qFUNaISRkdt?=
 =?us-ascii?Q?cjNv+dmuaIsh+nUhvhQycNodg2jWz9tv0qnDdKShZ+7/juXRuFSqgLNGD5oI?=
 =?us-ascii?Q?tBYAk5ipRBWHaNLH62+ZOfYC5Cg1rzIiIUZ5b4R/Bg2twO4IjerTRN5OiQTQ?=
 =?us-ascii?Q?wyFEdLC+u+PMcFGZuIAvJVsN5Owv3a3ZRakI5Fcv2LGXvoGvdFAcfx0cRGtI?=
 =?us-ascii?Q?OaHwint6a35m7swvcPHtQmuSlOWzcJq0p5nF8PAwQy1GxYs+AqrkWnxccGsY?=
 =?us-ascii?Q?4Sgo+hCMDnp7pqJDJenvWoUbgr5YkWCJZ9dj1+JrXmRK16jFEWbeTRElHMy0?=
 =?us-ascii?Q?FEaEJlupWlrF+XIyFCmh3WSOrOg71OxusSsmDuxKZUfMlTVQe+xtboWRVATd?=
 =?us-ascii?Q?X3ebxeyTCPg2JiwYOutKFgG/X+pMTNhnd/usn0VE1rj4F5mukdc55qVHzEy2?=
 =?us-ascii?Q?/udYQdY0XPYajVc9G2hydi+PHpsuV8V+sSEx56Lptnl+PD6MnRyxk/esKWha?=
 =?us-ascii?Q?FDd4Qjd4lva6u1JbQnyDP4kRLcTzbUwm7HI1hmfR7itlbc8pOVHEEX9GgPRG?=
 =?us-ascii?Q?3mNDuhsHTultV8TdiRQhagk7c4D5qqw7B7e4xNLxV2RHeauNu3ayJoKXmJxK?=
 =?us-ascii?Q?ah5nc6b+3oMmoSinQCgGIPh8P8fVmvF9IHzcJocz0Ewzcx4+HCuxfkoErvTP?=
 =?us-ascii?Q?CtJRDzb+c3dqpulAZhlnM2Yo+VJinck52vIL3eyMrXyOecSeULetPxsKkbCL?=
 =?us-ascii?Q?thSHpIGApJ9ucQP/+HSs7NcnYR7qXp/HQPuMQZwtC61YCByUQSOB9VixmSe8?=
 =?us-ascii?Q?eFHN+S4dW3XC/KUIgFUoXSb8lpYJf40aWVYqPTg6iaaGPL6439Hx2vUZnrxG?=
 =?us-ascii?Q?9o8ElgVjB8ihfF54EH5CHnVo82eCppt+7bm6yrn0EnKR43k25EXjCfwb4SQT?=
 =?us-ascii?Q?NUNtcUCwyg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 902f6c28-1c80-4664-a69e-08da2c3e7671
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2022 13:20:01.4194 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3KP8OIonJpCosyFBZ3gHJgtZS7H1hf9mjJKVxVm/ZTLLH+bhKrN8gfXnc7TsKvCR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3076
Cc: Kevin Tian <kevin.tian@intel.com>, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 Jacob jun Pan <jacob.jun.pan@intel.com>
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

On Sun, May 01, 2022 at 07:24:34PM +0800, Lu Baolu wrote:
> As enforce_cache_coherency has been introduced into the iommu_domain_ops,
> the kernel component which owns the iommu domain is able to opt-in its
> requirement for force snooping support. The iommu driver has no need to
> hard code the page snoop control bit in the PASID table entries anymore.
> 
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> ---
>  drivers/iommu/intel/pasid.h | 1 -
>  drivers/iommu/intel/iommu.c | 3 ---
>  drivers/iommu/intel/pasid.c | 6 ------
>  3 files changed, 10 deletions(-)

It seems fine, but as in the other email where do we do
pasid_set_pgsnp() for a new device attach on an already no-snopp domain?

Jason
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
