Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C84B49CAC4
	for <lists.iommu@lfdr.de>; Wed, 26 Jan 2022 14:27:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E388283313;
	Wed, 26 Jan 2022 13:27:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eFX8nHxTospi; Wed, 26 Jan 2022 13:27:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 0716C832C6;
	Wed, 26 Jan 2022 13:27:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D7EE7C002D;
	Wed, 26 Jan 2022 13:27:38 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1E6CFC002D
 for <iommu@lists.linux-foundation.org>; Wed, 26 Jan 2022 13:27:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A26240949
 for <iommu@lists.linux-foundation.org>; Wed, 26 Jan 2022 13:27:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=nvidia.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IsYJiaLrSAhe for <iommu@lists.linux-foundation.org>;
 Wed, 26 Jan 2022 13:27:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2059.outbound.protection.outlook.com [40.107.93.59])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AEC9D40132
 for <iommu@lists.linux-foundation.org>; Wed, 26 Jan 2022 13:27:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QGPhv7xiDEzFjl9OaNrBUigUusUk3OWNL9XD6x49vCKs5u2lXz3cF0RUFjMQxVg2tgDoPTecR45YFmppdxqZFu66XHrHlWYaUR1EbrQgYWqIEqBjP5KQLaJOSm99u0eHtHPBClXb/YNUVEpI7zTuZ8Z1gUnFt+3gqvyj2a/1OsNXGePi20he1a4UWU7Vgi+nZgpPKL0Fi7VizysDuj4KFu3oxFl2abGG0g12VcnWlKZ5LJy1BEijwyzFDinzQorNAT0lKZ5QAbG8sDGnqidarJFgfvW6yBPqOmZbiAPoPq8HQBjTk9GyDyrTyV7TZV3fSzTUGFkciJd+CNKb6rpD6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tMmAJ0UF0pM1+OXbTgPm9o3wFxSkuY9oBbgv34iLubc=;
 b=THB1FPjhixPfYLgHf0mPXQPBDnq5EqUitjAkQL2Hqfn5nGALh6mUlH2gapsR3BC/i7K5+i0SzwYJYk+XdZIc5w0fmgpLDFNFgA5ENslJKVCpbCfKm1l2G66PzuftGGpYI3AogaLMOquXgnhugmbo8Ma//3nQ9Ozm4kFnvugXBkyZImP4B/QmrUXLFTUqCXXbwoy0JGU6nAK9Y0Ft7YdUekuaFFvzZHMris8pDaA5DOFP8kkXXDVtNIdW/ffZMbBBW+lT/DIcj5pdWHg2Zw1lTkBXnXl3Av94nqODRuQ672jpHIJ1a19hl1QEUQJJRX4sVZHUg9m3WJnRZOqnFC19aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tMmAJ0UF0pM1+OXbTgPm9o3wFxSkuY9oBbgv34iLubc=;
 b=CJaB6Gpq1YB+WlqyJG7u5JK+QIiA2lQIixh7gBubKHlgSNCBD3OOD4aql5XP9IpGsWu3a+dWIPzKnFlG6bVc2b7O65O/2mhN5AgDufHKqDMzVezlA46nyITEpc5dyIUYaQ7ATDrd12INhSoAegk8Wk0Gew0YCGnL72bf//2F62W3zzSLthr5Vn5sbyiufCsm1ijy8+nd8HWs1Ul9pxo5UBSfPfduOY3h2ub2js2GI2Fctrd6WW1T2IDRYhSNDRpJLI29ZBYzbEGYJMx9xIueP40enuA92PqItUCtvIAtD69CNJuVd2xQkLc1jV2SjvnliBcS4+GBAnTrtGbqk7T6rA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by BL0PR12MB5540.namprd12.prod.outlook.com (2603:10b6:208:1cb::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Wed, 26 Jan
 2022 13:27:32 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::e8f4:9793:da37:1bd3]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::e8f4:9793:da37:1bd3%4]) with mapi id 15.20.4930.015; Wed, 26 Jan 2022
 13:27:32 +0000
Date: Wed, 26 Jan 2022 09:27:31 -0400
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH 0/7] iommu cleanup and refactoring
Message-ID: <20220126132731.GR84788@nvidia.com>
References: <20220124071103.2097118-1-baolu.lu@linux.intel.com>
 <BN9PR11MB52767F46CC13601306001B9E8C5E9@BN9PR11MB5276.namprd11.prod.outlook.com>
 <20220124174404.GG966497@nvidia.com>
 <7febcba4-f5bf-6bf6-6180-895b18d1b806@arm.com>
 <20220125151602.GL84788@nvidia.com>
 <a43279ba-8a18-a4a7-f317-a5e2091a0c74@linux.intel.com>
Content-Disposition: inline
In-Reply-To: <a43279ba-8a18-a4a7-f317-a5e2091a0c74@linux.intel.com>
X-ClientProxiedBy: MN2PR19CA0032.namprd19.prod.outlook.com
 (2603:10b6:208:178::45) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 601145d1-7070-4d13-ebe7-08d9e0cf9bbe
X-MS-TrafficTypeDiagnostic: BL0PR12MB5540:EE_
X-Microsoft-Antispam-PRVS: <BL0PR12MB5540C0E280067D07FB35AA88C2209@BL0PR12MB5540.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vPn+jhAEb8FOErWevBQGCox22NuxWZ0/2qOjc451/O+bxRMUP9qMe3KcAF3zNrnZzkRqYlVdTIfE8ruYtRdoxvR4mF3b8Dq/LPmBeisn18728NU7pOYRJlwQsC+CvWShE8LHgK2ARGxGOFdfPo0hAVEAgHgtNJWITDomASvd6XAvYn3RoOY/e75zmNdJu/E2zixaE+5v6INhJVSe/zElngYaUpjhAChh2Gf8fPdpyEzpaivC5SABDif8f94zbgjZ7SvkH9c4niEISLxb02A/l7isaDZKuOKmgpDrpIuWiHAce4xhmV++aJkufqoeY9LcQZg/KvSZNFDJ9dc0GIDjFoTczqjOtxquii1kwB3FvM4WIK1EyvcO5uHGc2dNAz4orfjQOYvf4CXlsqfGiyzY2EkmTIvJrDgEshAR8mCQN5Ak+s4mxb4nQnMtlvF0LkJFdofSBisCLBm7LUoG1RCiWYX6b81hi0mapEhDKg4UlXFIo4fAFcJgkPleFixJhnO3n4lpehTX9Os7om/TkTWa+/gwgsUkU1LIIYOuFhYJUmHu/m9fZswAObNmsY/KcR9Vs5u4GZEGcod+9juNCzpZCdoX7LHvaIdc3HxTq5SDnhf1oltr5Nj73d+cxa7YUGkCc6ltugi5DhwaAsKxd18WjIquvjDmqAxeYMIscvoy4kO0I6j1sank8EVQCRs8rclm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(316002)(66476007)(4326008)(8676002)(8936002)(26005)(54906003)(6916009)(33656002)(86362001)(38100700002)(1076003)(186003)(36756003)(2906002)(66946007)(6512007)(66556008)(7416002)(2616005)(6506007)(508600001)(6486002)(5660300002)(20210929001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?w5LpmnZrq/Ft1HGhvqo62vTEc5x8B85kRIfDdQTc/Qsf4rXD0hnGeyRyO361?=
 =?us-ascii?Q?WQOf6q5Ez1bJr9I3ctb1EGzMaYCar0CmhxMCA9DBquCL4hwnkxXaM0uIdzQY?=
 =?us-ascii?Q?ZxBBl5XicGJXBt/Bs8I9sZ/lbaxRT5cUiFEbJilmqcTrXg5H899hTesiKRzI?=
 =?us-ascii?Q?O86DhMLfhc9+Chd14Uo/yNyP7oN+mpkmIjA679ZtZp0pXYsSEbP+2bASYY1/?=
 =?us-ascii?Q?1LvD/NyPfltZMUhjnuPZ9tzDUnHBRdMtYaNNtWdEyADyW8WuQXZhUU0A6NyQ?=
 =?us-ascii?Q?WD5iHgnNDY2BKgiqdVLtEZcLhlujasrpam1cAZYUue7paTZWnvO2jfGVGAet?=
 =?us-ascii?Q?F9O4SRY0OqQ2s/RsQouW16ThK6AN9TYcBoB3roNUBxzzu8fO2xXxwNODpWxk?=
 =?us-ascii?Q?4BXNcgcHiKqw9QL1yK7YB/IupLoCP36prcIiIcDjyfnasugH/gw/XubmCjsc?=
 =?us-ascii?Q?droBLnmyqQlbelYLgYMNOh3Zgjx2MVb4D8N3XabacjZlUIDk9zWurd4EFSLd?=
 =?us-ascii?Q?sWyMS0dpbFV9XbmXSyizAMw5u78lMU6dYLaDQbW2nEdGyg9HDUVaxkAmsQC+?=
 =?us-ascii?Q?X2ZqKrmsZsZ8hZ4LXStPPyZXP1VVVZeBVMiaAUfieRvSAdPOFc5kNR7egG2A?=
 =?us-ascii?Q?klOHVvswPLigtRq9d97pJBl/9kiS9rFVE53Zk+JAJgJEi/XmEQOxyPSrJG9J?=
 =?us-ascii?Q?gbe85uFAz1H9FBh5jpHsplBxMs0nDx11M8FBi7X+iu+niobWl+2nc5thyyhc?=
 =?us-ascii?Q?nQngB8En5KZf/iJnYlOHWhophLeuvwqj4uPBLjeMUcVA2XDZRW7vAaUFtdCW?=
 =?us-ascii?Q?cFX4vr4w05fsqSs0Bckmf7M5C+KZBntNDlgUmB7vSKBMzSX683EUYi19yONQ?=
 =?us-ascii?Q?jA/aTyvhZbuJkLuNEzlhJ1oDvSHKkbcUudydXuhAA5fEB0t1r+JvHpsAy7gb?=
 =?us-ascii?Q?1KnMr9leIWREdEH07p9Y4bGtWZ2DtaBN2Wnu7qh5a2f8b50Ulh/rA30WAT7M?=
 =?us-ascii?Q?3QAK4+y9FpnOi91XkEvyj2srPCCe8B3sKnYPow58w3zRkhsc3hvnd64SPFD0?=
 =?us-ascii?Q?XyQKKW/EDJsBCeuL4bU5GV3FtWG8gfAL3TkEptcmTHtYLPAKZHUdlbW3m5YG?=
 =?us-ascii?Q?qUdekp7rd/H66mP2WrgNWr2sif4O7egw2zk2/ViOLCP7OS4cOcKPIc1fwu5V?=
 =?us-ascii?Q?BciFZOsi+fEM/jjOW67VzkwcEZHpt66+IAS2O01tAA1b7dQe2hnSoes9edsM?=
 =?us-ascii?Q?f+5XaWjcKs+QSuCiLgAnq+AXGcJ5RMGNuTKXLjpYdTv52IGsv4nCmbdnX/qZ?=
 =?us-ascii?Q?zVeS9be5tYpts2gP51xcAWRtErRZjTPxi4KmRpQXXXjzXVTMWIE+TfJCJg2x?=
 =?us-ascii?Q?VD0aKZPsKpWveaNhxYHI0ala7jdnRlyaf0ydTRXxOkyc9uQRd89FuUxX7hH5?=
 =?us-ascii?Q?Brwy0LUbOOPKxAZrZM04JazHF/94L5EaKtYS7VaJdxLe8mUilamvH7a6kSt+?=
 =?us-ascii?Q?KjoBpAEnIV2anu6XlGRo+lDU8e2xYZ7SR4qpQXzHbkHlFwhG1CUMsvCRpVnf?=
 =?us-ascii?Q?8YVMjc/d2l1ah8Uk4V4=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 601145d1-7070-4d13-ebe7-08d9e0cf9bbe
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 13:27:32.6562 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i4tXYswe1g7bYhnWlYWmuzGPOa4C7eBfwir2Z7IJ2KKj7qkr5SpnlTdFugdbJlBp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5540
Cc: "Tian, Kevin" <kevin.tian@intel.com>, "Raj, Ashok" <ashok.raj@intel.com>,
 David Airlie <airlied@linux.ie>, Will Deacon <will@kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Christoph Hellwig <hch@infradead.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Thierry Reding <thierry.reding@gmail.com>, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, Robin Murphy <robin.murphy@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Pan,
 Jacob jun" <jacob.jun.pan@intel.com>
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

On Wed, Jan 26, 2022 at 09:51:36AM +0800, Lu Baolu wrote:

> > > they are fundamentally different things in their own right, and the ideal
> > > API should give us the orthogonality to also bind a device to an SVA domain
> > > without PASID (e.g. for KVM stage 2, or userspace assignment of simpler
> > > fault/stall-tolerant devices), or attach PASIDs to regular iommu_domains.
> > 
> > Yes, these are orthogonal things. A iommu driver that supports PASID
> > ideally should support PASID enabled attach/detatch for every
> > iommu_domain type it supports.
> > 
> > SVA should not be entangled with PASID beyond that SVA is often used
> > with PASID - a SVA iommu_domain should be fully usable with a RID too.
> 
> The prototype of PASID enabled attach/detach ops could look like:
> 
>        int (*attach_dev_pasid)(struct iommu_domain *domain,
>                                struct device *dev, ioasid_t id);
>        void (*detach_dev_pasid)(struct iommu_domain *domain,
>                                 struct device *dev, ioasid_t id);

It seems reasonable and straightforward to me..

These would be domain ops?
 
> But the iommu driver should implement different callbacks for
> 
> 1) attaching an IOMMU DMA domain to a PASID on device;
>    - kernel DMA with PASID
>    - mdev-like device passthrough
>    - etc.
> 2) attaching a CPU-shared domain to a PASID on device;
>    - SVA
>    - guest PASID
>    - etc.

But this you mean domain->ops would be different? Seems fine, up to
the driver.

I'd hope to see some flow like:

 domain = device->bus->iommu_ops->alloc_sva_domain(dev)
 domain->ops->attach_dev_pasid(domain, dev, current->pasid)

To duplicate the current SVA APIs

Jason
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
