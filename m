Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C594841D7
	for <lists.iommu@lfdr.de>; Tue,  4 Jan 2022 13:48:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6AF181551;
	Tue,  4 Jan 2022 12:48:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Llg2uqsUi2-w; Tue,  4 Jan 2022 12:48:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 0400781773;
	Tue,  4 Jan 2022 12:48:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C0E77C006E;
	Tue,  4 Jan 2022 12:48:08 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E8404C001E
 for <iommu@lists.linux-foundation.org>; Tue,  4 Jan 2022 12:48:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C71FF815AC
 for <iommu@lists.linux-foundation.org>; Tue,  4 Jan 2022 12:48:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P6UPJkx1vF6f for <iommu@lists.linux-foundation.org>;
 Tue,  4 Jan 2022 12:48:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on20626.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eb2::626])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F25CD81463
 for <iommu@lists.linux-foundation.org>; Tue,  4 Jan 2022 12:48:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ao8IJW/oI2qM6ekiMsDsqziFqM0mtpfHlVO/H+wayvx+/eDCMV5Y/JK2kQw/NySDY+aDzGcfkahb0Ao1GOSzqOJaIbGzlS6qJhIz5VCtXniGzedyl9nbfZ5JpwiTbgbEHZTrryN/SxxxPqyeyCEJFyrzSq9ykWqWl2To5UD+/yFVTbTGOb91a97KI2b3imxzCt87GXc42n4MTisYhtz7QGDTf8/viiu+vQKdN9rGxDHVjHmAQJ41hjMPHYXjSlT/OBjPVKHFzMJrgRhq0V6pS3+SHkSk5vx740/txKDBy5iDfTWhfmyyvbvCEJcmm+8CxdCQVu50LGGbFgjwehBfJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SU9BbM/Ab51vTLU0TZtWLc7yVN50HZWTPRoYCnPu/Y8=;
 b=Y7hbS4mAfHts570jKSqQYZ2PeOEJnf9ravHCXJ0BIeVqCO1c4vMFtFrGS7QsMbtzoROigDty7BDsDviP7OvDepDyQnhntrmZ/BpnhmU2zp+/U68SFBh7yY4kPWU/d7785E5Y9NgHvpo7nRmr90DYkuFTLXqUgWVZTP9GnM+hZRQnfjlVulDbvviRAPCEQEm92GE679jcLofVPXCja9S4pAjJQIloZPyk3Aaiui7pzG3CWARQYOdAyod0g6A7oFrw7qzcDsezLazI+8/szrRBPLy/H7sGVQQLSn8/Y7TQFyy0mmnWZTzPf8bwtpXc5ZM3W8DBSp6+KMMMLgfAy9P4Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SU9BbM/Ab51vTLU0TZtWLc7yVN50HZWTPRoYCnPu/Y8=;
 b=Wx8UaakritWEQz+AWki4rzTp5axWpLGZhNDduprXyEq6W2cqc9FmU4PvET7J6dVoMpXYpyrr2FL2ij5Pu2ZINAnid3pZJD/MbqU66RIOKoL6fZb1ePcjQc3zayp+BD1EKN9QNhRsaJaDZRRv2lRfNplx6KFuKBiISWJkUizubEVCJWjZqR2Ku1O4twptBTjUx8qh8EvaWrlCDUjH9tVgG+DaVouM1m9y9BQLsI1VM06cAgpOfs02D4bteODJ5XiAdjbopG4iixLnTsJAwnaFo2A0Ou4Zo0CVVxCIL0oroeVEtDk3KkRxxQoyMzc7f/w8fRZGKS/t7s5HbZuCZ0kqMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB5520.namprd12.prod.outlook.com (2603:10b6:5:208::9) by
 DM4PR12MB5120.namprd12.prod.outlook.com (2603:10b6:5:393::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4844.15; Tue, 4 Jan 2022 12:48:02 +0000
Received: from DM6PR12MB5520.namprd12.prod.outlook.com
 ([fe80::218e:ede8:15a4:f00d]) by DM6PR12MB5520.namprd12.prod.outlook.com
 ([fe80::218e:ede8:15a4:f00d%4]) with mapi id 15.20.4844.016; Tue, 4 Jan 2022
 12:48:02 +0000
Date: Tue, 4 Jan 2022 08:48:00 -0400
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH v5 00/14] Fix BUG_ON in vfio_iommu_group_notifier()
Message-ID: <20220104124800.GF2328285@nvidia.com>
References: <20220104015644.2294354-1-baolu.lu@linux.intel.com>
Content-Disposition: inline
In-Reply-To: <20220104015644.2294354-1-baolu.lu@linux.intel.com>
X-ClientProxiedBy: YTOPR0101CA0037.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::14) To DM6PR12MB5520.namprd12.prod.outlook.com
 (2603:10b6:5:208::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 26ef8b3a-f631-495e-d5e1-08d9cf8071ef
X-MS-TrafficTypeDiagnostic: DM4PR12MB5120:EE_
X-Microsoft-Antispam-PRVS: <DM4PR12MB51202BF89983F9AC9BE83AF2C24A9@DM4PR12MB5120.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Wch2v2xayj8IZO5Zk/0V2XdwPF9XT0bSwdYr2ReYIsiIbXSg5cFWmOXsu1+cYYHuRJFjusdqYpfTtCak3z5fSdmc/ookErrwI7ZuLTGSKfs6DwsE87sR3hBUIXs2Ru0cZwavdeB7n6mQ5wG9z4weOHZKTYKrk9FMWLbz9k2JLgOIgXwcSfkeAYE4UxhcUbPL6bBYg6IVhpo/R150tnm1K0lVRKq9aEwcgi18xXfKDqmINP75cusuTFjQtc9+hmc4sK/J/neDyVHRTKZShMc7Rc2/mDik0tsv3tE/8B5u+Yo3FMxywPoFMERA58Pn0aKkjHuhUOppwmJ9WChTPrgK6gpcwxo6GOfZ+9EDEADbcqYIF5Idz76P9t7hCvA9v8Vv1ThwMkzr5OGop7Ds+aEIELgTE1BN9cqI7KYCILQER4Bg5K7lEAZvALrMlM81P23B+H66C0CE3M/YnHVjwOsHIBXLWwtfUIDnZXWskamQa1SN9q+boC86JDITP/2JG9Mf5nvVovVpBk4A9ZMuSnvPVdmYlW8ZUQFUg5t1/MvZH9FF07ZWkU5mkT7cm792FjKMO2JZU77TLkgQTC727L5GTT6K96RomeGxK6+02B3cMYIjXzghKV/XdiM3qApPUaR60gO8TrOBtN8x1K3IURSS+w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5520.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(26005)(6512007)(86362001)(83380400001)(186003)(5660300002)(54906003)(6486002)(6916009)(6506007)(2616005)(36756003)(66476007)(1076003)(2906002)(508600001)(66556008)(8676002)(33656002)(38100700002)(66946007)(7416002)(8936002)(316002)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UA8b32O/24xotB/QOMYG8CmZ8XK7QoHlA2aS/ArPb7S0QNhWpb93QuU3qbh9?=
 =?us-ascii?Q?sBt34w+GT9Kj+Lg3cuDWVLqKgycPPv3FA0r3u4H6ZQpyGMvYGxR79v9DItYJ?=
 =?us-ascii?Q?/Hvribr5DlwRxhh+i1h/dZDLa6eTn7awKUD5LCjHYIoatRk0PSaB3YKJPHni?=
 =?us-ascii?Q?PY2JSumS/rK26PLcWnDHeYfEBVjzVHDXoog9Zt/NstVLQmQITot0026Kuoq3?=
 =?us-ascii?Q?viji3bFDw1je3oOeOvym2BLEI9pMy7k3h2cC4Qk20/M3s1s8mTxVm57P6Oom?=
 =?us-ascii?Q?C4njX4qVK9RE2K7yr/d6g69HBZb8YGbfAYKYPA2u3f1zWwTIf6Zt6LF29y++?=
 =?us-ascii?Q?JX7GP4w0/D0ZYa/yBXni1ibSC2vLDpilqEVc5hdsyXN4zBrJCA8JWbidqzQm?=
 =?us-ascii?Q?8t6N+SBGN4NKogclKgjYKQwyhwiNgsY6sL/Bqf8DEH/R+YbHwF4H0G5Wr8BQ?=
 =?us-ascii?Q?wlBY+t3Jlxb8RLPn2ABHwp5wgYOHh6/Y34GVOZD2r/V0lbyiSAFJTwVCEmvz?=
 =?us-ascii?Q?sErU6wS1jhwMMX+/FrvmCrxcPMXh+c5eybWYfU2mQZVdHcC1evsdo2cp6IQM?=
 =?us-ascii?Q?M+I1D6yZotJe8AvpMjy42esVpeG8bUOXwK1xxtUPK3TLneQb0TSxS8B2zmL2?=
 =?us-ascii?Q?TWw9dh+BEIXsy2e7/yorsPz4/7rEdjI0TN/FU7yi9Fc3rZL1SjwH2Zsr6GSc?=
 =?us-ascii?Q?HWypGpQawpdgCnNQQQgK2n7BDfhq9XCw7oGbR2ht3+pau61xe55zSKDbPtVC?=
 =?us-ascii?Q?gEog45uIzgU9H/Fa7ViI3/HmfE/2wYS7C7RVUWTMkuYDWyTeGlG6FKtbKK36?=
 =?us-ascii?Q?Vre1140hwWRitcd/tOkaBdnJlm2HaWKWaZh/CVXAgY2MS0bAnZi4if6VkiRZ?=
 =?us-ascii?Q?30toOmxz2Zf1B60kHqXoIgd6FWyU43Nx34Dm+ruhf0Zthyf/wFuC4nB+NehF?=
 =?us-ascii?Q?MbZVeuT9mgYPHvQeQpMHIMfxJT4MzkYuGk26wHQLE5C/UntMI1is8q1K3ZGK?=
 =?us-ascii?Q?quSYRcHn3xUcbPGHT2Y2EhJVpAGtNSUPLiGjstJzeihheg5IqlubqjqAEwey?=
 =?us-ascii?Q?9kWTsRD9eFZQK2quUED2CytwdbUywMkk4eYFiKfUFcnMZQ52vBmIM8lQSwb/?=
 =?us-ascii?Q?3xGcC7xNY3aplToC14+rjiizXafpHj1+WsyY/yd79eXU2KlwB8nKBH3S8elc?=
 =?us-ascii?Q?o0TWpD02WOezR/79m7thT/4BCF3RJQqJtZnvZdbtlK/Q0n1Ngc3C795JbPAw?=
 =?us-ascii?Q?t9s2w3N1mvRZlC/DMFt75rHg9J4Smf5k5A3pZq/JkhvRWpGhppRq9DhQcKa6?=
 =?us-ascii?Q?vjnziwtYbOB3m25Ntq151RmAAkMmgLGovIJnKH0FHT0GwvS0do9JSmVPS2Hd?=
 =?us-ascii?Q?9AJ/nsAHwIzMnhkuFhYk3epggPc1dQ3gt6PueeT7m1N83qyTgGkfC2KjtN71?=
 =?us-ascii?Q?ncSEHKlfRTK5jwHpY/WVvvEkYsBd3senXQ0szUieOMJebOOv4dCuE5vHbw6X?=
 =?us-ascii?Q?awX9wu0Jq8D9XchB/dEvXQKIXaIj3zmoaiPtG5ZWNmCLRdY2zXXpMaAXnunF?=
 =?us-ascii?Q?Rvc+VRAcXFgVTG7yaXA=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26ef8b3a-f631-495e-d5e1-08d9cf8071ef
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5520.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2022 12:48:02.6129 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gr9Qe+B19BRIBJX4pCw0aEX778gJgJigzf0sxMQOx+X8xzbZYiuzo7BBME05OYPO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5120
Cc: Stuart Yoder <stuyoder@gmail.com>, rafael@kernel.org,
 David Airlie <airlied@linux.ie>, linux-pci@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>, Dmitry Osipenko <digetx@gmail.com>,
 Will Deacon <will@kernel.org>, Ashok Raj <ashok.raj@intel.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Christoph Hellwig <hch@infradead.org>,
 Kevin Tian <kevin.tian@intel.com>, Chaitanya Kulkarni <kch@nvidia.com>,
 Alex Williamson <alex.williamson@redhat.com>, kvm@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, Dan Williams <dan.j.williams@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Cornelia Huck <cohuck@redhat.com>, linux-kernel@vger.kernel.org,
 Li Yang <leoyang.li@nxp.com>, iommu@lists.linux-foundation.org,
 Jacob jun Pan <jacob.jun.pan@intel.com>, Daniel Vetter <daniel@ffwll.ch>,
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

On Tue, Jan 04, 2022 at 09:56:30AM +0800, Lu Baolu wrote:

> v5:
>   - Move kernel dma ownership auto-claiming from driver core to bus
>     callback. (Greg)
>   - Refactor the iommu interfaces to make them more specific.
>     (Jason/Robin)
>   - Simplify the dma ownership implementation by removing the owner
>     type. (Jason)
>   - Commit message refactoring for PCI drivers. (Bjorn)
>   - Move iommu_attach/detach_device() improvement patches into another
>     series as there are a lot of code refactoring and cleanup staffs
>     in various device drivers.

Since you already have the code you should make this 'other series'
right now. It should delete iommu_group_attach() and fix
iommu_device_attach().

You also didn't really do my suggestion, this messes up the normal
__iommu_attach_group()/__iommu_detach_group() instead of adding the
clear to purpose iommu_replace_group() for VFIO to use. This just
makes it more difficult to normalize the APIs.

Otherwise it does seem to have turned out to be more understandable.

Jason
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
