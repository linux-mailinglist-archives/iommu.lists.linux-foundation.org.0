Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A92528C7F
	for <lists.iommu@lfdr.de>; Mon, 16 May 2022 20:04:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AA6AC401DF;
	Mon, 16 May 2022 18:04:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KmtAABbTjMym; Mon, 16 May 2022 18:04:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id C96314061C;
	Mon, 16 May 2022 18:04:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A2A1DC002D;
	Mon, 16 May 2022 18:04:54 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0DF48C002D
 for <iommu@lists.linux-foundation.org>; Mon, 16 May 2022 18:04:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F079D81C6E
 for <iommu@lists.linux-foundation.org>; Mon, 16 May 2022 18:04:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=nvidia.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SlXRutcpswaW for <iommu@lists.linux-foundation.org>;
 Mon, 16 May 2022 18:04:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 365B681754
 for <iommu@lists.linux-foundation.org>; Mon, 16 May 2022 18:04:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gYlYxs3yupF7ZfFHBmVfYtTKM7qr4bPmVTzJZikzVoz8TW59YTb4FSYUPxz/Lh4YLLzS0m+oj1fsSD4YIbLxqhOr1KeqCNt6bP1WXYQUMmNpqW6YOo+QolcUSqYqkMkvvCu30IwYEPHbDoGhsFKLBGdbwtcQrJZHjayF0TKnNT4aFN0OCWn0Z1LKjSkC4e4n/nVLZ+VJddwqiL96UMP7R7PPJ6W/gZkyvxcPMlfCHnDPbmZmTLfidda2SXIPjHsq8cpkgfvVPE/By9TJwlzpLoYHR9uzUX1TPP/b5wMa6FJPEB+KxgfG7E4Ca5UK2PSdg62opSxH0qCIIfreSB1vlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uQ0tMkt6phWThESqX9H9TBla/dc0/oXsrx5nZNCQ3kc=;
 b=nJqW+Aq9yBMtTrJPYog84MVY9sw81Sr6hsSzH626ioYrKjuAXRp1tA+mQcmeYiSg6J5SVCk/i21lwB4MCuEWjBC7f4OMNj6WogHXZSt/dkAIueIMfQBssdkZq4FTWSLQ+geNQ9ZKJG3tSs0HZ9L0aG+8mcVz+3pI/futbcBMHKBgTUgASpb3uwMN9mjVPCZytRrTGhwpUyS+k7G6Z4tapOf/gqshjmHEDHmzejxjKaDy6iT7xfl9W5oTLsqxHjDbg81pn6Y0QYo23UbKQrqBJvpqDNWscH/LCzFWLZT4KJW3nZZxyyvNAXVYGYPYYRx1Hj0Q40rMzURj+Fk4yQ6KEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uQ0tMkt6phWThESqX9H9TBla/dc0/oXsrx5nZNCQ3kc=;
 b=Tf7bBxUetoURCpgZ/UdguD1yrr/vu6K0FQ3kTvIJ9SGsc6LK8POHWZl7CKum79BVfIWqlQ/Fe0Yh99vxYtn9Ih/GXYHPlSfXcH4xyRMX5gf7HhH3VXyr1YJg6g5WbX7EtV5GLkf9tgwrIE/+nMleeuR/imCNhnGCbqZUY7XdaaUo67V+C7UrSI7TS7isvZLXaFCQ4XlbshQAA6PbTCfDHM/AQlijQKT56NLhr3iUj2HkFNr0tB2bv4MmXSRqcm2XX27G4Bdrw4yBbxFcAxnvHKsSLMlutzvoh+Spt1kz3O99VXWF8ZYf+jFpScVgQp/aCXAFCjfGIcd7iMUm4lfNIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by DM5PR12MB1337.namprd12.prod.outlook.com (2603:10b6:3:6e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.15; Mon, 16 May
 2022 18:04:48 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2%5]) with mapi id 15.20.5250.018; Mon, 16 May 2022
 18:04:48 +0000
Date: Mon, 16 May 2022 15:04:46 -0300
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH 3/7] iommu/vt-d: Remove unnecessary exported symbol
Message-ID: <20220516180446.GI1343366@nvidia.com>
References: <20220514014322.2927339-1-baolu.lu@linux.intel.com>
 <20220514014322.2927339-4-baolu.lu@linux.intel.com>
Content-Disposition: inline
In-Reply-To: <20220514014322.2927339-4-baolu.lu@linux.intel.com>
X-ClientProxiedBy: MN2PR16CA0009.namprd16.prod.outlook.com
 (2603:10b6:208:134::22) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c0d4f69b-4b21-400c-eac5-08da3766906e
X-MS-TrafficTypeDiagnostic: DM5PR12MB1337:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB1337E9DF56EBAA716E4A42A5C2CF9@DM5PR12MB1337.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JrtaQdtk9OMoZ9PTVVr7KJVpaV7JDhQ9S3g0UQOicBpfveE51dxaxnIeipkbNPJYwaSlwtSblZZjevbaKHisBUZBzWVn4XtjHwgL4SC743bRXvDcYnjUCj2jkXfnaxLd3nH4xy6EkHRQ8IKtFPBGNgHOh8Vj5apaMhS1GYunMzoyymGtovdvTu6Yz5MHvv8sSvgSLjQ7jksLV8D0Oc2UgjbP0VJhPVq5Cp4xiQ9APakKb2vBJD4svyX+qNSIs9bJ7xyS+xsFt7VFrQWUNNhb7bmUOESPJg+lIM+cchwl1RnLmUecSIUxIR07utswqmf9Obo2ToEdlNx9Fe1F6ICidkDGpjpwKR/cdqWBK2J5PiAipUNxC7vE8zzp98F9cTX/Ohqhr0DWUj8Rb6aXH2h7qVSzZg/7fLDz/l3vwZNV+OUZfVzeMm2JOzDdFpMBsuTh4mura13uV/4BubX/zwDqMSDwmu79lCRUEcGF4sEplLhL27H0qiLquDm1jGB7BncAU5/bthEmTetHEK1Tq2Z4YvWc5T1UVhKgXpaxmtCH6rdVc5v8qSoZ9BuUeT/S8dajS5EwJvTRBxIoxfdE2FWLQ7RaX0Bw/SluLpWnNWcsDKW8ECjxYzp5x746/8+IhV6ghZ4Vpq+XPy2pxreJkVCiHA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(6512007)(7416002)(86362001)(4744005)(6916009)(36756003)(508600001)(6506007)(8936002)(26005)(186003)(6486002)(316002)(66476007)(8676002)(66946007)(4326008)(66556008)(54906003)(83380400001)(1076003)(2906002)(33656002)(38100700002)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bNCma/1Et8vPneodjItPpD6uVigmIi52R9N+cCl/dQQ8G+9ICpIpnUg8lTJE?=
 =?us-ascii?Q?iGp1I6WNTs1Yw8mkas5umIOb0xSz1m7vWBSFl9BsuqtshHdzaO1B/fcQngdT?=
 =?us-ascii?Q?2aCyfnptDO7lPaf12OTXP/l8AeQS5nyjS1TGqzjjcexlunAeqWGKjmdo426P?=
 =?us-ascii?Q?1/qEWx+9WmIXC2Gqh1FuczKMeHNUhymfXwik1OZZGeguYhhDkRyQ3DV7B6SS?=
 =?us-ascii?Q?C1CqYauoQAizmsIvkAxB6f9uYS97KkC81fqjThVLVPWF8VgxUrN+U2509O8P?=
 =?us-ascii?Q?u/yv2DVXcNsQxd3D+eQuqtlVHQrK1SEM9WGK7b8xgSX5cd2TouvrJSLCKemz?=
 =?us-ascii?Q?M4iqh8P2Dl9kTb6NIcNRYEyrmfZlNf+92C5rkKdjyGfGwV+05orHtCNeGUQ4?=
 =?us-ascii?Q?X2yagjh47egEff4QhC9muziILDSL/UJ84J1ds//ipOp3RTT/ut42l2chingt?=
 =?us-ascii?Q?12GBBV80SyCYvNjqUGaZbgsOddYCdG5OqaUqUCjcnMtLByfZvDf0Uxk4KZne?=
 =?us-ascii?Q?aiqnKk+MhKtHTHsMgaCXeS6iDcinawUKZL2m/ikB+k+CHG5f459oPoMFkG3+?=
 =?us-ascii?Q?tpM3yDL+sZb6UqmPQbhsaEko8Vki90m7bZVMbwBIZrJviw9aND5uVIYe5Y6q?=
 =?us-ascii?Q?BSjFnvunWurD8WeXGRBwH9cd0Yx7qegeOXGoS3FDIoKaoAwQws0fFB2ccseI?=
 =?us-ascii?Q?BVvUvjuOxB6Kxc/CdSHu0yAkzGb7vTb8bgO2syL5kuvv/CWGn7m9HacbnM37?=
 =?us-ascii?Q?/D/u+l4rL+0qAOev+uF3nturBrSBdS/CyHbw6+XGxxMTd9YI5l83ecsjFLhE?=
 =?us-ascii?Q?2E9TYDo8UxhTfm8+sfh+SccYJkAjznrQyfWhOJ1eSI8MtuVHaITIXEz3zqDJ?=
 =?us-ascii?Q?DRrzwJLHsBraV4LMWo0aJx4BYpbv6C6Q6scCL12dx1lPW+SfGkGgu7Za/hI3?=
 =?us-ascii?Q?YGWZieUk+ZlPvkbE2XUICh8tg+QqG8jkI1sdib1HxKBF2T4Cz/dVNbrjcg4T?=
 =?us-ascii?Q?SBakV/G7WzLNkHzvEvttOT1awltbU1U8lNS51znBX9nAIRIcHcwec1Hg4grb?=
 =?us-ascii?Q?+7j9pYGxAi+hErzaG+t/Miys9pu3FAIIJkHX4o/G3HsOqaTxuYaIzsgV7MPh?=
 =?us-ascii?Q?aEX7Vw472VtDRX/6S4qNyqUaYjUxZcNXdpNgZ/iHflzmQlHT0CKCrUFnB1NM?=
 =?us-ascii?Q?nftt9vwDWHa0+Ej2oHXhZDc/LYbu9/+KDos+GB3jZDm6FDpQx6P8KKx7pSRB?=
 =?us-ascii?Q?2nRfSPHRFRZ7njnsg/AdfH2IGBoBqVxzTfNgmdOAh24uYVTT0Eq1E+hmueUp?=
 =?us-ascii?Q?k5diroMiRd9u+D/ghGwZMkaXGLbkXv9C9sy5lWRQdFE9Glfb+Dp2WYK0t892?=
 =?us-ascii?Q?hKq/I49eSv3s7rpCb5iUQht5bumplb3ifxDQ7PVUMAt5jNaFOUcFypvTWVxf?=
 =?us-ascii?Q?8Jc+vCKG4W3IeLcWYRa76duCn4Nt7xnlQJCVdgpHrMKB8SU1nLphS+m/F1CS?=
 =?us-ascii?Q?EforXixhv6RnblX0vkyEP6edPwAbBRdix/4+fSi5qTHvI0gep3pORc3geRbX?=
 =?us-ascii?Q?Cljv9Ab1fQAappuwwNFvaUEZu1vHXMvY0pZzrC92T1YsmZxByqwcJyxJcjy0?=
 =?us-ascii?Q?K9o76ej+yotMC4JX+aBIaPDeseqXDj2u3zubw1vglnUnNu/VEuoRLLGiNjEV?=
 =?us-ascii?Q?xF53Td+OmtqOVH7qd78ugoYl0W1PBJVQFMsla6TOIZ5B7f/O4ec9dGsa/PjZ?=
 =?us-ascii?Q?TvA8sXsi/g=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0d4f69b-4b21-400c-eac5-08da3766906e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2022 18:04:47.9944 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NpaNin+Ly8okW038McBnpC47cy/2wmpLq/gEsf60kiKU4jXTzonCt5I474Vj2syK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1337
Cc: Steve Wahl <steve.wahl@hpe.com>, David Airlie <airlied@linux.ie>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Will Deacon <will@kernel.org>,
 Christoph Hellwig <hch@lst.de>, Ashok Raj <ashok.raj@intel.com>,
 Ingo Molnar <mingo@redhat.com>, Kevin Tian <kevin.tian@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Ning Sun <ning.sun@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Daniel Vetter <daniel@ffwll.ch>,
 Borislav Petkov <bp@alien8.de>, Robin Murphy <robin.murphy@arm.com>
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

On Sat, May 14, 2022 at 09:43:18AM +0800, Lu Baolu wrote:
> The exported symbol intel_iommu_gfx_mapped is not used anywhere in the
> tree. Remove it to avoid dead code.
> 
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> ---
>  include/linux/intel-iommu.h | 1 -
>  drivers/iommu/intel/iommu.c | 6 ------
>  2 files changed, 7 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Maybe could squash to the prior patch

Jason
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
