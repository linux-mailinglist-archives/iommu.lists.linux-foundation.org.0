Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D095521C8E
	for <lists.iommu@lfdr.de>; Tue, 10 May 2022 16:35:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA7F660FE9;
	Tue, 10 May 2022 14:35:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wFDvxoDbP5zT; Tue, 10 May 2022 14:35:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id D588C60FE3;
	Tue, 10 May 2022 14:35:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A77B7C0081;
	Tue, 10 May 2022 14:35:46 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BA5E6C002D
 for <iommu@lists.linux-foundation.org>; Tue, 10 May 2022 14:35:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A7F3241615
 for <iommu@lists.linux-foundation.org>; Tue, 10 May 2022 14:35:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=nvidia.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WZ0sUw4-0DY2 for <iommu@lists.linux-foundation.org>;
 Tue, 10 May 2022 14:35:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::61f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8371B4160D
 for <iommu@lists.linux-foundation.org>; Tue, 10 May 2022 14:35:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qg0MAdbBoYR3zjCyJGAmbrhBDxuJkJgrkcvp4ztrGJuW7CbycvMBz6SdqPydO2e/p2gRZRxVnz98sJtZLOdW0Uv1sXFaCKfne/v0582AdLpFBwaT5tRM9hT6AcaZlOdxhviu9Y9hCLDJ0UUCEoX9eUdxytJl8En0zVvD1jmdzSOqFVrJv276/y/Mf7YrYKXYrYpBYsJSn5REkq+D9a/sO2oGPpAQM8GVHei6OVTghAsvFGrJpj6Ky97oyuyg+xmhuW0k33w8jPzDqg5yHk0mmWzc5ZgO8VZzP33VAfHYgmObv5bSbq5FQOYcLrSE4v0Ns9jGC8BOklFqxu7/XSNHZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D2vC+pXqfMqZ/27rKURrYaBdzw26ai1k/DRaNYH8FjY=;
 b=aNYvtMaMzMpcDzIVmXAuqyf3g898KEezOhfXPEOTqnRu9coG81//D6ypt8eCYWwEw7y6qXpSoLr02o5jy9n/BYrMu347xKtkB0QszIykyJrCCht4qqCIcDaBzl7rNbUgAoMZgoQaamUYB8D795rzfR48uWja2ldbyaXHzJKEFX6U0KISDWem47+JGh0mgd1t911KzHq1B+h7hBGpR3pmI2P78qYyljHjG8/a6EF52LGVCIFkmlFLPowhPVu5LXisBvv3cbRUJFKr9YibEZ3mnUgrzF0afIOHPp0loyJcExkIJQb3Dw8Nbw9CGOLmO4ktoipahcSkmL2gq1l6giPJcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D2vC+pXqfMqZ/27rKURrYaBdzw26ai1k/DRaNYH8FjY=;
 b=fUCZ1kzC9JjJmew2qjjiu3lWx8GGeItvNuuvk1S4cO31l3IfS3uOuMpR9hFDDCffNPVNGDJE0ttdLms6CZxWDE1PmeNqwWZ67eJZdMml58MYiBPqrWwog3WBwo06wMz1KvXqZQWn85Mo78jAFlhNuD1CQm+7cgqgDKHh81+kPtYjlD0ldltGqJrjrNKXpLbJRpy4LXEEOKAfZD16p6wCJfdHMjBJ13k46bJsQKqqmp5iIOgVOwdxWzzcakq8mXjGa+sWi/yuj8c7a/CfwNN8cC9KeXXEC+Rt0NWmsHU5AaPrSn974um3Vw4TUZrjCGtpaQdI7/Pq7W/GdLmypdGLBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by DM4PR12MB5280.namprd12.prod.outlook.com (2603:10b6:5:39d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.21; Tue, 10 May
 2022 14:35:41 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2%5]) with mapi id 15.20.5227.023; Tue, 10 May 2022
 14:35:41 +0000
Date: Tue, 10 May 2022 11:35:40 -0300
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH v6 05/12] iommu/vt-d: Remove SVM_FLAG_SUPERVISOR_MODE
 support
Message-ID: <20220510143540.GF49344@nvidia.com>
References: <20220510061738.2761430-1-baolu.lu@linux.intel.com>
 <20220510061738.2761430-6-baolu.lu@linux.intel.com>
Content-Disposition: inline
In-Reply-To: <20220510061738.2761430-6-baolu.lu@linux.intel.com>
X-ClientProxiedBy: BL0PR02CA0134.namprd02.prod.outlook.com
 (2603:10b6:208:35::39) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eccc97a4-23ff-4a90-00c0-08da32925bc3
X-MS-TrafficTypeDiagnostic: DM4PR12MB5280:EE_
X-Microsoft-Antispam-PRVS: <DM4PR12MB52806984A50AC49797890BB8C2C99@DM4PR12MB5280.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PvYhfOajIIrr5TCpg3Aof5ttBzwU58oq3Vgas5F4Dk+aUfkVQU+G5AGszBmhtTtTTsqO+nvjG57oJcXPnHuzBTYUA3JAOjv2u0Fmb7HMZ0Kmy7Li2BSp9w+H6G8sJ1I7eW0Mn3DzPg537LI8h58QxIPU4gLOFAsXq4IoPBcj7ee3XbVb5aWF0Adfh6dfZJQce8E8MhuDNQQ09l/LhqBsSA8YBNQoLPpNdV0e65Fg5mq6oWqm3A/oyaJP4SiyoZcLjkfAKsitvY7m1ALdscH1iSVpyYFnDiPhanMIvKmRBa4mkCAe3V/RUHaTkBkr122KB+z/CaoPwFfuUQBmqz17yBCINJpX4w+Ai8PA5D9AINm2SOcRRgIOeuFMnFJGdEkHZx+3+MTepVmfhpRQU/rk+ZCX0xvC6K7KJYiMpUg+P8gqIjXJXC0nkQWWnzeVGnFmydLgbAKMqwZUGQTZbSOOe/DE7etP2N3x5NSlhHu9AojUy++z3MiteWgK91PPCCIx3CsaqyY9yE+ev4YhAZPBD5xY+esv3080uCpkduFpi8zDAmIAZ5HqN++FLgsiiw+noKHldomHrtXrP3WG3OKTYzC8vDMH29R5Lae4e/dwX2mxQXytzTGMcNSQP1+5pjKGx2Xj3a1A/71EVQNpQw20s/KG0XEXSWnZfqSDh6UB5fwvQQOMMTB5f0PhqGvWxGvUEtWScuPrJn+cKMYr0U0Bj4ydHrzDfwDLUe6unJwNZNM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38100700002)(2616005)(1076003)(26005)(6512007)(6506007)(2906002)(54906003)(66556008)(66946007)(8676002)(4326008)(66476007)(186003)(36756003)(316002)(6916009)(6486002)(966005)(86362001)(83380400001)(33656002)(8936002)(508600001)(7416002)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8lFzpe/bdRaSsNLXFkLgBM3mW032IlouEFmvLkuIfuvnzFb2ip+rXAl5NiKq?=
 =?us-ascii?Q?8bJsRSRTfNl/IO+hwLmO7YNZm4QMKSKSIUQ/5Hnz97h6aVhPHaCYJZQEogFU?=
 =?us-ascii?Q?MCgh5ahRMWxJVqvpkF15znJ8TVKhXz3QmtXSkBduFX0QzirK/vrJOL/lawwS?=
 =?us-ascii?Q?ACS5cXwHjCPOQ1PMUJezlPhzN8ai4Zsk9n7po6jr2PQT9eSj1s89Sc8CcHhM?=
 =?us-ascii?Q?J6BhCs+rYhQZ5QBxm8EXqV4liMKSuR+XSIGBLRnuq9ZKzFwXnDCZl1yYtUaJ?=
 =?us-ascii?Q?LnPeNUHebtmlGgd9OxyWULmrbj5nka1Uk8MO1TKLVAvuMOsK6U7pAGr/4l/u?=
 =?us-ascii?Q?ZEW1tH9LhHAAlDw+cp3ML4ZpXyk5DCtg8Dflfj36VmBoYJClucQkQPaQjqRJ?=
 =?us-ascii?Q?JIoX1OfktkPzPYmDPT5e+TID0Hje68m33bQUq5yZHh1e1p8ezWIcpRQqj+8M?=
 =?us-ascii?Q?jEG9G+8SHqMhfBYmGqzyfcOVnu3i1I/MHaQoHVUKgQCpRweRqYKascbZOHQC?=
 =?us-ascii?Q?UIfh1mxK1zasDoSbBKTssIk1uBGhWwlaa6bq1M/gFVZCDOXwDF3cJmOwfuW2?=
 =?us-ascii?Q?Ci4JNcAdvZ5/e4vYhQvgocO5IR3LK34cPf5+LO4u2+25s0wsujRnGtD9/a2s?=
 =?us-ascii?Q?aBc0Nk+w5tx9/H6xoVyR1PlS4z1MpXTiP+Ucc+57nTBZIcNcLno9kaQCQz+s?=
 =?us-ascii?Q?ZwamKtUolZmEMXxrnZGEio/fnznW05zCWjMhJNcEAnUu4PZsjQbWP3BE9XAF?=
 =?us-ascii?Q?cR0zI407zCjK4rSj1UMjKr1B/mJOz1k2VeuoQ3YFGfCN3QP2hGO/LB6gnVR8?=
 =?us-ascii?Q?nZXELoQpMq/Lgl2ATr2+o92thYbIwco65dhnyd0fTfhlZFylrU9XX80ZeaYY?=
 =?us-ascii?Q?X3upcVPOTIxD2DnapAquw3uRiFZKnVdvvL6mdlarqLpusKyLybawXHrOuMYj?=
 =?us-ascii?Q?NDTUr0hHkTTBs3chvBnz/YjN4Ql5Dh3LiLCegWIBaDj8NbIuBn5z0HpEoYBz?=
 =?us-ascii?Q?ijrF5Kupy0q1kEk72KLpNtzXvEUlWycyiZfcGBDDT/RtzTRFepl7vdhWxK1r?=
 =?us-ascii?Q?zEcG+GsZHC+fZaxmEn7ixIVAxGC3wlASA475YQYV3FStHLE67Ibz90OvbidY?=
 =?us-ascii?Q?oj7kiUVN/sr0xdYJ4vxisNl19BD36C1SaA4Kv9y/iqOvH/p7TrvPQCM9amNz?=
 =?us-ascii?Q?B5O9E12/0xaoTQdUoXGMGWYp239voj5E2/Y7nmMGpS25Snc4bxIxHzWcXSpM?=
 =?us-ascii?Q?eq6dNfys0jhVuHpE/+nTjLK6yMEeoPYqJ2lDPMpZyGgiOabjT17YnMlDXtdj?=
 =?us-ascii?Q?UtWDtdoIuMMYJYRJDs5LrNCzUXYJ+OymBUdQ9cih1jrfeT0yA7TFW7+egNSG?=
 =?us-ascii?Q?Mw2lTspaXfn1qGTWF2jV2cBmoYAhkEleN4jxmlhvE6EiD9+HIoihrd1qguak?=
 =?us-ascii?Q?exiDOU4zMvgad8GY8asGtfNEQJ/irZRXeb5XqMuGZssxhMkVnTxgCxpr5MJX?=
 =?us-ascii?Q?euOnIqTBUfCGLktP6bsmthLUIn5Fni3J/VyznyIckSz8saS4N8lNjwYKq8eJ?=
 =?us-ascii?Q?+5oPzdhso5CN1B/yfyAEB76vLemJD7SqoaFGees6YA+wJHT0vRDmze9z90qX?=
 =?us-ascii?Q?mjr+Q1Jhj6IFK4fc+/P6Fti2/j9/rlCfIhwh5Tl4kHYxk7JOF4rEFTdLM4gH?=
 =?us-ascii?Q?CMLyKyFbkdMarXO1L8p2cYgXnHXd6+aRM5iz+0ydTLMYB7rJ9Tgj/nKfC0Xi?=
 =?us-ascii?Q?PdflxaNryA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eccc97a4-23ff-4a90-00c0-08da32925bc3
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2022 14:35:41.3716 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DaVlJ87j0DePlkST45d7QEslF29NWSLmxdVNQalyOGwHDg7xO1wjftsW2hGPZR6n
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5280
Cc: Kevin Tian <kevin.tian@intel.com>, Dave Jiang <dave.jiang@intel.com>,
 Ashok Raj <ashok.raj@intel.com>, Will Deacon <will@kernel.org>,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>,
 Vinod Koul <vkoul@kernel.org>, Jacob jun Pan <jacob.jun.pan@intel.com>,
 Robin Murphy <robin.murphy@arm.com>
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

On Tue, May 10, 2022 at 02:17:31PM +0800, Lu Baolu wrote:
> The current kernel DMA with PASID support is based on the SVA with a flag
> SVM_FLAG_SUPERVISOR_MODE. The IOMMU driver binds the kernel memory address
> space to a PASID of the device. The device driver programs the device with
> kernel virtual address (KVA) for DMA access. There have been security and
> functional issues with this approach:
> 
> - The lack of IOTLB synchronization upon kernel page table updates.
>   (vmalloc, module/BPF loading, CONFIG_DEBUG_PAGEALLOC etc.)
> - Other than slight more protection, using kernel virtual address (KVA)
>   has little advantage over physical address. There are also no use
>   cases yet where DMA engines need kernel virtual addresses for in-kernel
>   DMA.
> 
> This removes SVM_FLAG_SUPERVISOR_MODE support in the Intel IOMMU driver.
> The device driver is suggested to handle kernel DMA with PASID through
> the kernel DMA APIs.
> 
> Link: https://lore.kernel.org/linux-iommu/20210511194726.GP1002214@nvidia.com/
> Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> ---
>  drivers/iommu/intel/svm.c | 53 +++++++++------------------------------
>  1 file changed, 12 insertions(+), 41 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
