Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A8B4C2C9F
	for <lists.iommu@lfdr.de>; Thu, 24 Feb 2022 14:05:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7EE7641691;
	Thu, 24 Feb 2022 13:05:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GznhQmlnJWAA; Thu, 24 Feb 2022 13:05:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 745F641640;
	Thu, 24 Feb 2022 13:05:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 55663C0036;
	Thu, 24 Feb 2022 13:05:10 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C318EC0011
 for <iommu@lists.linux-foundation.org>; Thu, 24 Feb 2022 13:05:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF2CF8249E
 for <iommu@lists.linux-foundation.org>; Thu, 24 Feb 2022 13:05:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=nvidia.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8BDo2WvfjcZr for <iommu@lists.linux-foundation.org>;
 Thu, 24 Feb 2022 13:05:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20604.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::604])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 25FDC81B70
 for <iommu@lists.linux-foundation.org>; Thu, 24 Feb 2022 13:05:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eZ6BfTGsUEf1yILkU/peCS9hZwjEakxByyH4YQyymNXBnSQAX4VE+bpOUkvFDMHsVS7+Pc+CtiGHsyiargyXAwEwU6Nv6MjNnk2qRo8ZlKxmj9mO1QW+Prgx0s28miqYgVFjlqL6Frw0KZaehMmK62gmYWVkf5HOF29jy7c5jSmrO8jTE9ijhz5pJ6qjNBN8kmSzn1wbV5H2ApJs56N/mk5apnYVMJEP9IcnIFz+Id0QMO3LqD7ciiffq2fH8bvDi3U9PD5i9nIoYDEEYZ6QG5B1nefDXxR3s1NaTcCdXMMiH6BC4OhuYH0tnRga8iZY/p+xOZcaYPRwXtbNOV2wzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bkt9hsKYFuJQezYW9Z8+f0O84HAxTISE4+4AUmu2y5M=;
 b=HryTH6/6YF1FEKvKoBJu2zfMBYwpqbWhHz5PF7JIKNm7JFkoKFZ41uRo6esfWaHUfIPhWZzL+/NF3Ht23ISV9Ie7y7KMltSDI2rGk4pX1hhlxi4Ha6lAPlBJQCWD+4M5nSLqjHHCKaGE8KnBSyZOk4UG3Gd486Kur94kGJS1k7lRC5qPhM/x+sHtIfw9m1Vt8ROVn0dYTLWe+RxLKUjsIwaKWzdqQpph82/SzOo3wsnW9DgocNjeilS9gsLTUIUdAuY9wuawhI0RESDUMCvvQvZDzVI9srI5oCQWn/wIHf9PAqMZMiRHEL4p6Th7YQCDA5yLN/I43R8f16LG11wY7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bkt9hsKYFuJQezYW9Z8+f0O84HAxTISE4+4AUmu2y5M=;
 b=AjVEpHXZpl3CALDwylos8Ixv8Rl01f2Qtakl4+qmy8hdwVIOz21tPRqjQ0j2THBt9pwXl3QowB9YFZbLqi6HdMDR+fpxYoTQfZWjviMiDdi581XpB3BU7H+jGEIuWyHBlExpuol2DSsMjhPyd5wLys+C6nwBU7VvthttK8PRMKEPvWxMGVAPndnkUNQWAIWME52CyLGH/CpINXXo8vbeP1Y0npB95+lKmxwjvjaJUHGIhT9fkgZI9cSAPJC6qHYyiabtGdTtnUA85f3F9wBMajFLxaWkda9xNJARS/o+34ujOrr0gGMHZNJjOKSYMMdksrv2go9FLe+P3/K1sld9Bw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB4181.namprd12.prod.outlook.com (2603:10b6:610:a8::16)
 by DM5PR12MB1546.namprd12.prod.outlook.com (2603:10b6:4:8::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5017.24; Thu, 24 Feb 2022 13:05:06 +0000
Received: from CH2PR12MB4181.namprd12.prod.outlook.com
 ([fe80::287d:b5f6:ed76:64ba]) by CH2PR12MB4181.namprd12.prod.outlook.com
 ([fe80::287d:b5f6:ed76:64ba%3]) with mapi id 15.20.5017.024; Thu, 24 Feb 2022
 13:05:06 +0000
Date: Thu, 24 Feb 2022 09:05:04 -0400
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH v2 06/11] iommu/vt-d: Remove unnecessary includes
Message-ID: <20220224130504.GI6413@nvidia.com>
References: <20220214025704.3184654-1-baolu.lu@linux.intel.com>
 <20220214025704.3184654-7-baolu.lu@linux.intel.com>
Content-Disposition: inline
In-Reply-To: <20220214025704.3184654-7-baolu.lu@linux.intel.com>
X-ClientProxiedBy: MN2PR10CA0011.namprd10.prod.outlook.com
 (2603:10b6:208:120::24) To CH2PR12MB4181.namprd12.prod.outlook.com
 (2603:10b6:610:a8::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 756cc1eb-f8c0-4342-1980-08d9f7964719
X-MS-TrafficTypeDiagnostic: DM5PR12MB1546:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB15461D11C487DCFC39C1C8F1C23D9@DM5PR12MB1546.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 00DmrICPlURgbGFHSsWJD7f6ctLGePqY6jVbJJbsvZC4Fu7lfp33OyrkDyFtgprcYzy0Y1zS/O+cdpyV/B6OdLFpEjBImcTd0FbB1uKj2X1LBLu2Ktuh0l6Tx2Os6qgVclzKAqYBe3ZL7Evtd2gENgYOpdpSPqPAGPqY7rodvKVOvSAA9NXamhXJ1sJHtEFAFoFDa3XZPrj2TDIUt+IPsnbwbwBbOj0EXT+ToDC4GPfTKwgOQ+i7dKeJoeHstdoRwyjOFFnO7gd3CDZb3zXcO8uhTo+J19Ql7ngqzeN6spO9owBbWY9e2CozbvogoGg4/gGTKZYhq2aKr/A82gLgX6pRMBcq5WcmY/swKc+eVbRjZFDRMeo77+49rdFRb2p9BW7lQFFP0hnB/ZqaEBtmQYpRtUO48oBN1zLIOcN4HECHgpHAs8zXPPiiC0krhtX3A6s6ae9G/0ddB3eBrmKEYrAp8NDfJtYUZPVHbPBQ4UPKnrTWazUDK5e5blMQo7uqDOLULhxYq3i9Qrx61AF+GuVwVRzDzZCig339wrKBau7NAQ2m+T48LUby6rhCgn9U+KsapwqhnDdyQfM3m5ydhYJoP8ES0myos1//zQLIqxtvv83MZVrQlU8+/kEqsFBcwCYrGJXyQiFGlbO159ZhVg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB4181.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6506007)(66946007)(2616005)(66556008)(186003)(26005)(66476007)(8676002)(6512007)(6916009)(6486002)(54906003)(1076003)(86362001)(508600001)(316002)(38100700002)(83380400001)(4326008)(5660300002)(36756003)(33656002)(8936002)(2906002)(4744005)(7416002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6dZzHqGQw5FejxvGq1E0U2cu3fC1VNAQM/vgOTDmKDm52whrKMfDbxMhn5gn?=
 =?us-ascii?Q?g7KEO3FCJc1Rm0XuYsOyc8Xwn7ljGUh+EepoXGeHZmgNCbt1uqmDPoN15F3X?=
 =?us-ascii?Q?pVrJJf5468QFpf+chl2AQlsMejmqMhf3tlFJiuTKLHf5Amzm2bD5L/YnOzCF?=
 =?us-ascii?Q?53AKnCRLoZ1EaUXzjbu3N2u+6uGf8rBaXp22uCuWWVOVgALn9nC+VZXSSN22?=
 =?us-ascii?Q?o3VxOwjv+z0hTmUu+AO7RJjxUOFy2LxgMmJl4OCH5fW5p+X8IQiPRvpNm2NO?=
 =?us-ascii?Q?52rzQXBSoEQcLWVOu7gYou4Psxbciju15HJ9jJMZhvHUFGBA0WGATG7OOBrI?=
 =?us-ascii?Q?4fqxqat0mmjjoYoalvUtToZhCYstE4WS9NitmnwgTwsCl1G1ea+c4DWSaO0X?=
 =?us-ascii?Q?E09JcEfK9T2BAt8KGvFZAILQR9086LFdogJwxj7Wsr7Na2gC7Hg5HRvI8ye4?=
 =?us-ascii?Q?C0vWSL2Z/xneJUZC5K9oNNJoskp05NTw8DOfsx8dtj3jMokM1CtLNB1sAXDa?=
 =?us-ascii?Q?rg5XZhTaXQi0oY4YgR8qnomG0yRHIwDA6zTQCfWpiYBtXVhkyQ7KxQka5tYu?=
 =?us-ascii?Q?9lNEuy2Zw1FcG/JNKelYzk/2ftMb49ZkEjgZjU5nfcE5gkxOvrRl5E+vB1aD?=
 =?us-ascii?Q?KBbsz2ysyCKW0gfjnwW4leFEJjSYrEDAkpsw4BNPf45yj5lVbQnvVl/zTL5i?=
 =?us-ascii?Q?9WqhTGZwPOSzhzCWCEK0rynWMvFna5ADEZDBerSAgEdLhidAUke9TiNl+nqy?=
 =?us-ascii?Q?IO5axgXn8CH9BFDk1mxPAVM7oHEjCQQfQgITxY/p5pNzQwGllTOaGoHGr19b?=
 =?us-ascii?Q?Ld4C3nHwT6Ra4NRvwKqVZ92THcquYecjh/S5QjmpkHC2ki6IATPTgBjSnOrc?=
 =?us-ascii?Q?EGvJtZdNUIEXD8navB+JzmEM1ng6zbSl1phQR4zXi0N5mibOgvT0MBp668FI?=
 =?us-ascii?Q?TsIppnmCrHoxSk/SD+AfKyyxoM/Q4HYidOyHyuYtG6Dm5rI7ExWPODPaV2Z7?=
 =?us-ascii?Q?oBCn/ezoJbycT7cjcwU/Q0QfEXf1hDFv1XQYB8Wq95F44SlPuD8V1fV7/3nP?=
 =?us-ascii?Q?ua9LcE0z7kXsy9My2AA69ksH9EhJQYTw2FLdlKP8T4UvQFUHtV4HihRjyjYm?=
 =?us-ascii?Q?fzaKUN58rZ/i8r7XeL9xMLK9cWtAXbYr+ZYztXkq2QuPXa8WUVasVryPpJ1W?=
 =?us-ascii?Q?0tomKoXUKpA3fjDhWkGG+mz7c289IcYKAUqYNlTDxUb3GxIee7jQo5g4KKCl?=
 =?us-ascii?Q?sOlm56Xb6kZpU5qebJa50tIqk3xwsY4t9QDr64dcffhjph2m/JA52G+dzr2p?=
 =?us-ascii?Q?YoZ9yILJYf5jJN3uK9qKld+woUPscvM/Y2vmS2RILPCYdFr919crpNaclxVF?=
 =?us-ascii?Q?s3uE5P6wXeeET21mIk3Powry8o1Rc6o3nEEfIWSuqQKI832bmjF1GYaUiV4R?=
 =?us-ascii?Q?vCc67A+S+3ws07ZOSh5mORAJZG0hkuC4Dmqj8ZHJaTZiIIyLDBA9sK/JPXJi?=
 =?us-ascii?Q?DcC84r8yHdVbhPvOwprXFT9j5IBNhTz5VcDMuFdy8F43mkPM9je4rkXwxdk+?=
 =?us-ascii?Q?7EBwADMsW3f62kzxpfg=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 756cc1eb-f8c0-4342-1980-08d9f7964719
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4181.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 13:05:06.0555 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LR01gC3qxd2AFJGciOWF1cFiZkLF+l65XNHtxr4pP68ekXIp2rLILbupTBnRmK+e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1546
Cc: Kevin Tian <kevin.tian@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>
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

On Mon, Feb 14, 2022 at 10:56:59AM +0800, Lu Baolu wrote:
> Remove unnecessary include files and sort the remaining alphabetically.
> 
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> ---
>  drivers/iommu/intel/iommu.c | 34 +++++++---------------------------
>  1 file changed, 7 insertions(+), 27 deletions(-)

Are we sorting includes alphabetically now?

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
