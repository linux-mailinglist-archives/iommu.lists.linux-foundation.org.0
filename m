Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 923C14AF318
	for <lists.iommu@lfdr.de>; Wed,  9 Feb 2022 14:42:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 127CB40423;
	Wed,  9 Feb 2022 13:42:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8SScMwKhGqVA; Wed,  9 Feb 2022 13:42:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id C05A040492;
	Wed,  9 Feb 2022 13:41:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 734AAC0073;
	Wed,  9 Feb 2022 13:41:59 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 609E6C000B
 for <iommu@lists.linux-foundation.org>; Wed,  9 Feb 2022 13:41:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 45DA740423
 for <iommu@lists.linux-foundation.org>; Wed,  9 Feb 2022 13:41:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2RS1bZLSTDvc for <iommu@lists.linux-foundation.org>;
 Wed,  9 Feb 2022 13:41:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20617.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::617])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 40FBC4012E
 for <iommu@lists.linux-foundation.org>; Wed,  9 Feb 2022 13:41:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hWDOjsaEWy9DL7/2zVwnOvzf+cnKcEzwKXezHP2ea0DLsqBFJjQ1iKI9zrn+P/4mPWz+6UkDPyzK/zFDnx+1lZ3fJ5gZQknnOJVn4jw3jN/fxH+nFQJiNDoQDMfZo5qf/aEGRktLNHfOCOp6ZpLCn13OkGXbnJGQ9vRSHflSUNmqsE6onyH+fPFVY+gTvTLxyE5BF/2r1gnzaap4HBwXAPZ/9AScR6+FEGPq6BUeTlFkJR28vMVdqaXlAbSv02vf+NBJ/N/OFMQTAePLPrDuvhRLlj0r0SEYQHQ4eUFzBF0vDBeVPD8Isk1kPJWxwgjhCpF7jZsiC9426B7ZDa379w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jbw1qmh8WqX8/qdUZ0hYOeIeE0V+AneJEMWjZvL76k0=;
 b=VgV+6jB3d197s27ktqEa6l9HriY+qoGK3ytKLPAFqr0urkwoyesFLecFKUI92TcpAQu97QI84OBUNHhZc94ePOvGrnjfOm4TT7OUpa1Y2M31SD8WBEo2ErFFtMqOuY6QdPtQhYryKiFiExoSG/uCsmUa1U5COQBzdDxjhGUJFjPf3k9BjgjALt6Xbam4SMRtPtRVRMby/BAvHguN2Y3OYY3+5syhuiUGMVO9nNdlbD5H9tJMHnHraYYF2VP/OUEixQzTx3ghdfPbaXVnDvV9QJKUTMkfJwxTMvUFLbH9qqebgWwOg3txzC/ZUkh+XW4WMD+0NklQAtQVaD8rEmh1zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jbw1qmh8WqX8/qdUZ0hYOeIeE0V+AneJEMWjZvL76k0=;
 b=ZGGnPhZ5KoB72pmB8w6lqrmMli42Qjde0JGS5XxWdYU4Ov2VUhY1XN9Tq7beUDxilcGpsSdGN5jRwIMCnbxPXkhXjNjMHQOBrpo1WBuuqoRD5OqsY+Q0fN6a4SjrP7cIO4qNX9uUnBR0tWTrV+G275lVN8c3u6cXbyRRYDJ6xIpvhfXrLLMYIZx+k3hoyvqg6HNCKVd3oi4y1cH4k8nEMt1uAlUy+lVBWBK4Jqfl5ttsrEOb35DP43o1i3GBf8HsQg62xGEnTSqjrrobXEC1OTnLnnHpC7DXQ1wygAXDREsDG4gYH/UBbzZLTYMpuSi8Wlo3ombE8o+AEs0KxCAuYA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by MN2PR12MB3712.namprd12.prod.outlook.com (2603:10b6:208:164::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Wed, 9 Feb
 2022 13:41:53 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::e8f4:9793:da37:1bd3]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::e8f4:9793:da37:1bd3%4]) with mapi id 15.20.4975.011; Wed, 9 Feb 2022
 13:41:53 +0000
Date: Wed, 9 Feb 2022 09:41:52 -0400
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH v2 09/10] iommu: Use dev_iommu_ops() helper
Message-ID: <20220209134152.GA4160@nvidia.com>
References: <20220208012559.1121729-1-baolu.lu@linux.intel.com>
 <20220208012559.1121729-10-baolu.lu@linux.intel.com>
Content-Disposition: inline
In-Reply-To: <20220208012559.1121729-10-baolu.lu@linux.intel.com>
X-ClientProxiedBy: MN2PR16CA0006.namprd16.prod.outlook.com
 (2603:10b6:208:134::19) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 67ffb4c3-8ca5-4c47-1491-08d9ebd1eeaa
X-MS-TrafficTypeDiagnostic: MN2PR12MB3712:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB37120F213146DF0389A60F08C22E9@MN2PR12MB3712.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RaHbv69B6zcbXS4Sh0yTwtpiOJFirNCZ1+Z7BarK+f1fe+FuOxxMXOPX0NfdVHGYgvQWlhJDpBoeX8beKAZnQ3sXNLxNes/UBhMSamGkTXodH/cGabkUaLaqlaK0JTJPDO8ha4mhqcQMdHgTTh0+BvoZnDnTbJ44cd3v0xfK6Fy3aDZb/RgIl2swsvD6PWyJcWX87BDqR7/XCAPAS2dZT8znBTyx/dzzPbED4vUjY8rCWb57TC4wv30QCPWsVIWgnAKQIK2KKVVfvwngE8zKVwniOZ8K4g6TYV6rhGubcoFXILt0x2rsPr/s8p1ZcUn5dWX/PfPQ6NE0ittvn3442GuUbao40pqOlu9xBNKE5Z05FfMNMqaqoidLLphBmiaCVYmS1k/0NywMYNCv18uEtSa4mkn4yauv23GYHxFKcJqWqxMy59XOvH6jezC6B2j/81MKAZzd15yYBc6XZ9b1CZ8YH/cvfgoFvlTaezk7byeSBi1s0gRxZFcWlLb6IBmvHMLtqsA7kNV2IsUvHB4ewE8HgZD7tcp+coA9WdcbRyNqa37TDBen+cvxEgq/eTP9lRu1OipYvI8KB8qlhmLyNMKuyFss/8PvmnwR+kUzJN/8HZytwJK0kkECSjxc4J1yXNGWqF55ACWAnShdgNdUhQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(4326008)(66476007)(66556008)(8676002)(7416002)(6512007)(508600001)(6506007)(6486002)(66946007)(6916009)(54906003)(316002)(36756003)(2616005)(1076003)(83380400001)(2906002)(186003)(26005)(38100700002)(86362001)(33656002)(8936002)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+YmN7AF0EKfKmdm93w0DN/F5e2jSjh5L8SPI8JA0ak3xaZGzPjVDNnVTPZZE?=
 =?us-ascii?Q?fFddNPDb19i4kJYldNZizHCX0+0Y7u3s1MUDtKZytS9CLsLKJ5JvEEFD0+5B?=
 =?us-ascii?Q?QyzAew4Kx6n5DXOshnA1L2t1y+DYV6x3RqZH87nLu77wTURuCV7XiMz+mOME?=
 =?us-ascii?Q?WSQ1bBTAZE/8rLGNWoXIc4BySJ54/QjrGPBvG64Ye3Wi3UrMQvvTldIqyIfS?=
 =?us-ascii?Q?oKg1UuNfnpWlPQ3ATZGPKxs7AQYSxzeW5zTAc1qrOzo69XQ5v8ycNs3fCsqd?=
 =?us-ascii?Q?bnNChTcWvIEqFHgViBf/5uryrQMx9NzGT2T2zXLGBSYcWUDPYEU43KaUh7nE?=
 =?us-ascii?Q?oHJJoEinLY+1lC3zf1e5NW2Zx9tsiOPUSTl+lWYqfTFvF0ndQCvb2ZeuU1N7?=
 =?us-ascii?Q?K8L0RU91VY75D9SADcxOM/fLFdR1PhOA1oTKGO6pncY2Qi0aspC0uwMzQcbt?=
 =?us-ascii?Q?ELUhj2ltvHWF1mdW3jEIQACNmJH26YEFW9zLJv/YRt8MJs01nhYtv+SVok9t?=
 =?us-ascii?Q?hyJS+mzhPOjYfEET3h43Sygfm5nMjv7azXZDwowcKI4rrW6j5bdW4AIB3zyl?=
 =?us-ascii?Q?QkogWoEHBcgqmeVcvIWOPuGr6BIyb7cApkUPqwT2XfPz9xJMbpjksB77A8fB?=
 =?us-ascii?Q?PwmXKbHAa9X9bOccR0qOf7lf0hu+9wrgXC9LlPWTY+Qv915gSiaQj00Plm4u?=
 =?us-ascii?Q?X+xslVq2waj5ToemEt09pfroizXX4IbJQ8x8klcWB7f9o0GVpKnHX8gEh66x?=
 =?us-ascii?Q?9J4rzna99hdPMMPbNwDjxf+WAH0TUJjKaOYf2Ek0C4dhumjNwOSN5M0s+saY?=
 =?us-ascii?Q?33x7phvdCLmQU1ahL8jZXLH7ddg6zVTObCc/f0t5RmN1nQAZY/+UVZDOfiG3?=
 =?us-ascii?Q?w90O61Om4bBMi93dXxBR1pr8ddkEzfX7wOJCNP8kuh9wZxDJwlg/O/fVSKr3?=
 =?us-ascii?Q?/u3fLWm+TO2DpCn8yBAEnEI07BK0R4X7lMFyp71e5znWD8jN9EvYyvblWKwV?=
 =?us-ascii?Q?y60s+Ia8ZItrObISiL7Btu993MFB6tVx0u0LyAwwCTbej5iN6Ct4AXdRG4rl?=
 =?us-ascii?Q?zNL5LlRSqsbTMjsAgg7Vmv/tOUBZ4OJQVBB8vIx+2m6X0tpnHZtkbnYWZ5rC?=
 =?us-ascii?Q?WVcLB5r7YVXrgyDbLZ4UfX4CRf0gusyPlCnOjcdaSM39Dp2xgSomAGmUvKP9?=
 =?us-ascii?Q?GAapZXJvInBrUjaa26F7ltYPPM2SGfNtquVa+qjljoRFmIrT9fpBsQxuhDLw?=
 =?us-ascii?Q?lhBVD6cIVbHmV/5tKFe4own159T/BMkOqGBkMwGTYbeib7tQ2jeN8FjeWzlL?=
 =?us-ascii?Q?NrytDxqtp55CIidm4qLXKPx3RrppIMNvlryuea4TgNu4HBVF8R8DX1wxPPPC?=
 =?us-ascii?Q?JJRBV8NrBGpHv+UslY03zVkwKT1WeXHZ2ZM/iTvV6srLKidmaPcf5/WhRQHI?=
 =?us-ascii?Q?umAWdT2NDLflEdkzn6qqo16TkZYWBmOCavjhc6m3ZDdsNlysxljls3ByaR1p?=
 =?us-ascii?Q?qd20PNA2G4Fwjpn62/OzwPP/Jj1Jl4aUJdiwC/57LtHBcXnXpG/fDhRapik3?=
 =?us-ascii?Q?NbXKB5potDM7D9+sXdE=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67ffb4c3-8ca5-4c47-1491-08d9ebd1eeaa
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 13:41:53.5545 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +peSEKA/iLJPddqSb8dFU468sDFUnE6tEBxQ4ekslAhD7Mz3mBCE8ptfRalko/HL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3712
Cc: Kevin Tian <kevin.tian@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 David Airlie <airlied@linux.ie>, Robin Murphy <robin.murphy@arm.com>,
 iommu@lists.linux-foundation.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Christoph Hellwig <hch@infradead.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Thierry Reding <thierry.reding@gmail.com>, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, Will Deacon <will@kernel.org>,
 linux-kernel@vger.kernel.org, Jacob jun Pan <jacob.jun.pan@intel.com>
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

On Tue, Feb 08, 2022 at 09:25:58AM +0800, Lu Baolu wrote:
> Convert all the feasible instances of dev->bus->iommu_ops to
> dev_iommu_ops() in order to making the operation of obtaining
> iommu_ops from a device consistent.

Why are there two patches doing this conversion? Roll this into the
prior patch?

>  void iommu_get_resv_regions(struct device *dev, struct list_head *list)
>  {
> -	const struct iommu_ops *ops = dev->bus->iommu_ops;
> +	const struct iommu_ops *ops = dev_iommu_ops(dev);
>  
>  	if (ops && ops->get_resv_regions)
>  		ops->get_resv_regions(dev, list);

And agree with Christoph, don't keep confusing ops null tests -
dev_iommu_ops() never returns null and any function using it must rely
on the caller to handle this, somehow.

However, I wonder how safe this is. Certainly some APIs like this one
it is fine, but I would be happier if the 'first' APIs like
bind/attach/alloc/etc fail silently upwards. In many cases these APIs
are called based on things like DT configuration, or VFIO or
something, and the caller is expecting the iommu layer to do all
necessary validation.

> @@ -2788,7 +2789,7 @@ iommu_sva_bind_device(struct device *dev, struct mm_struct *mm, void *drvdata)
>  {
>  	struct iommu_group *group;
>  	struct iommu_sva *handle = ERR_PTR(-EINVAL);
> -	const struct iommu_ops *ops = dev->bus->iommu_ops;
> +	const struct iommu_ops *ops = dev_iommu_ops(dev);
>  
>  	if (!ops || !ops->sva_bind)
>  		return ERR_PTR(-ENODEV);
> @@ -2831,7 +2832,7 @@ void iommu_sva_unbind_device(struct iommu_sva *handle)
>  {
>  	struct iommu_group *group;
>  	struct device *dev = handle->dev;
> -	const struct iommu_ops *ops = dev->bus->iommu_ops;
> +	const struct iommu_ops *ops = dev_iommu_ops(dev);
>  
>  	if (!ops || !ops->sva_unbind)
>  		return;
> @@ -2850,7 +2851,7 @@ EXPORT_SYMBOL_GPL(iommu_sva_unbind_device);
>  
>  u32 iommu_sva_get_pasid(struct iommu_sva *handle)
>  {
> -	const struct iommu_ops *ops = handle->dev->bus->iommu_ops;
> +	const struct iommu_ops *ops = dev_iommu_ops(handle->dev);
>  
>  	if (!ops || !ops->sva_get_pasid)
>  		return IOMMU_PASID_INVALID;

We all agreed that this sva object will turn into a domain and thus
all of this will eventually move to domain ops?

Jason
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
