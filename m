Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id D7617450584
	for <lists.iommu@lfdr.de>; Mon, 15 Nov 2021 14:31:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DE50607B1;
	Mon, 15 Nov 2021 13:31:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IpUCjTMezUfx; Mon, 15 Nov 2021 13:31:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 98E02607A7;
	Mon, 15 Nov 2021 13:31:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5E397C0012;
	Mon, 15 Nov 2021 13:31:13 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F2307C0012
 for <iommu@lists.linux-foundation.org>; Mon, 15 Nov 2021 13:31:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DABF340400
 for <iommu@lists.linux-foundation.org>; Mon, 15 Nov 2021 13:31:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=nvidia.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id seIZQ9FiO5qf for <iommu@lists.linux-foundation.org>;
 Mon, 15 Nov 2021 13:31:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2045.outbound.protection.outlook.com [40.107.223.45])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E9AC9402DF
 for <iommu@lists.linux-foundation.org>; Mon, 15 Nov 2021 13:31:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=beiqtNb0QKwjeiCMExGpqnFh9f2dLGBHjgSaoz/cZp+Dg+3ROV5KoxhiCvPCxcyYMxWcfbMqQSkApofnOB6QlK/cUWZvxUQnl/lV7eijQDYF5FTzr4c2OtE+O6A5ygXSRRpBnCV5Y63YrQ5UHIp8GN9hS11RjjmC/ndKpqZlcfO+TfJkL/opUty8Q+qV+csV6TBnatt9QAHZsvuCQen9SlGcVWWvTRaVINSV1JmiLNsUKZRpJCKX1AEPZuUzwetws+L9HFoKioF/Q+m8lTe/sFHyqmDtiWxw/WLjtNJf4MDcNVwcIspBamBb+H8q81Df9+4AvitQO2+s1J4FU3l8pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oTg4CS2UjJUujc0UNfP/W69DlMQx2SeG9afnRhR5gj8=;
 b=cT5NiWR+ebN5+3qgpxsXZMbcaLuKEFVfHnBxIreIJUkqmuXyaexbMqT8p6d8dry0X23OuW2GQW5YVDWt7uIHgKAMKi0qqr1vdsjS6n0XwnFCKeTG5/yLJtsbRAtCVFLSjgldGbwTJ+HlUIcHFt+TRJcrzerKmFPHNv7veGm3gmDBqgMXzgoaTki2Zpj9SwbIVc07BLBFuD7+rpq2bfQTa6J3wIY+nRZ1cXB7hsTYZ3HuLUdU+M92cHeJkRUlvwT7pjWwPbkV8o4VyzKnFms6qFMvvHXCMqzHyE9ifLVdqnlwopuibmbklgu4wG+A8fG4lOgcnWHnw+8mrI2f2wX5kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oTg4CS2UjJUujc0UNfP/W69DlMQx2SeG9afnRhR5gj8=;
 b=HHkzDhji0hSKNFHm1sbPmElCL07xPpt56Ow5eFAN1M79YPfcK/UHnkreG2D62akqFNy86MFEekC0gbkuoiNbbeZqij47ZNzz+usjv9vaDnj6bbls7epbMw6Uy4353VOP/EAtuZYzIx2HbXKWsHDaiOFRnF5iceSizvhiCOCYjDPR23ZB99i/VhdY8mOQxXCkUxJ0C1WvcO+sHmtViIUwEYVv32Pi3gQlsmNewwxcxpKdhW7geZ7V1r1v8gDOWl27PRbXax4Jn2FgXrFmu+RauRwLHkr6ALXBBJTNBdJxjoWc2zhg4vVTkF+iRpdx82JXUhWYM/N+EOZUQLnn8b73KQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5111.namprd12.prod.outlook.com (2603:10b6:208:31b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Mon, 15 Nov
 2021 13:31:08 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::5897:83b2:a704:7909]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::5897:83b2:a704:7909%7]) with mapi id 15.20.4690.027; Mon, 15 Nov 2021
 13:31:08 +0000
Date: Mon, 15 Nov 2021 09:31:07 -0400
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH 03/11] PCI: pci_stub: Suppress kernel DMA ownership
 auto-claiming
Message-ID: <20211115133107.GB2379906@nvidia.com>
References: <20211115020552.2378167-1-baolu.lu@linux.intel.com>
 <20211115020552.2378167-4-baolu.lu@linux.intel.com>
 <YZJe1jquP+osF+Wn@infradead.org>
Content-Disposition: inline
In-Reply-To: <YZJe1jquP+osF+Wn@infradead.org>
X-ClientProxiedBy: CH0PR03CA0256.namprd03.prod.outlook.com
 (2603:10b6:610:e5::21) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (206.223.160.26) by
 CH0PR03CA0256.namprd03.prod.outlook.com (2603:10b6:610:e5::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.25 via Frontend Transport; Mon, 15 Nov 2021 13:31:08 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mmc4h-009zJn-AX; Mon, 15 Nov 2021 09:31:07 -0400
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b43fa56c-5bbe-4d51-e342-08d9a83c2ed7
X-MS-TrafficTypeDiagnostic: BL1PR12MB5111:
X-Microsoft-Antispam-PRVS: <BL1PR12MB5111F36194186587C9B25B9DC2989@BL1PR12MB5111.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dSOvwjfVwx3xeLjt1sWkCY9okPdOSjVJ8cLliOKA7iFKO6eNbcXoeznCn/1M9Iz5p72oZRLTmQ4W02FnJOslRCkQ3xaa6UDWmiBV+pyVGkpqqVw9ouC1/l4AwN9WcZPmp5ZtaNuo2k/8gi3gB2N3Ns+T4bZaDakwqvO4EfrFeqt2PCLc5UQ9YnEu5kT/GX0I7kW+uTHh9oG2CXmTCnFtuO1eMl4m0trWR1pPolLy4lIvRPkOOgTHAd0AGwUxB+JDCQldwPXp9L3+i1IWrVcp15hktjo8RAcEijA8wWy+Gx/0fiPGz2RVMyBJiLZwMGYs13PfPGL5yaMcwpsO9toHRV9ycKH/qTWaXP0QIQ7AjXNzjIb2re0z4yqCj523JFA5Yq3KveB9a4SLtHUoLoeMIuZVpW26QytVtkjzY0y77HsGPafDs3e+Lq9LW9mhfaVhejVwHGx8mOQlZFbnlXKMyB/Ta9Iehc0ogF2NcWr4jtTW1bvrh84RJnhkGKvrvG53bTWC2R37XVqLx2sxQKPetf7zcM1aghjGpJaW+D8f8FgA1MEyRH1y4MzLI3sFYyvNRVXD/JMBQzHd5/TqreKBP12z6lYizjBCaWB0keIGyXTCpIwtiIIOMIhrENB5fleq0I7k+O2CbFzee/KYmo+i2Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38100700002)(66946007)(5660300002)(2906002)(316002)(1076003)(9746002)(9786002)(66556008)(186003)(54906003)(83380400001)(86362001)(508600001)(36756003)(7416002)(4326008)(426003)(26005)(6916009)(8676002)(33656002)(8936002)(66476007)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/95oejYvv8deT98VlAe+HKwPS7KhzFi30g0i8HFvo3J6uJ71VrnjhRUMiWve?=
 =?us-ascii?Q?SO75J1HbHqWYmli0uABO8gxpddDxFRMPxj+3wd4ypa0O+EmA0Q0HAbWmDpJk?=
 =?us-ascii?Q?cfuUzzKNJW6BHjjOHB942MmK6blEFKncGp2m/8GkjhDknGTjiENf/lBU+FLd?=
 =?us-ascii?Q?JCgbAz2chvkGwZp/e0GahYeXyQ/JR2IB4B8D2J521Ona00uXSRFOfKS1xHsz?=
 =?us-ascii?Q?XHXG8D7eAqVkeQV56CBG/pXrIzD2fPrnICdA2tZphnTIS1c8dL7220KoLzgm?=
 =?us-ascii?Q?4Om5VDVP7573B3eutagxzAZFZUMHS7ifdNPeXlZckCmrgxUCUKlmrcZgzecv?=
 =?us-ascii?Q?xBD2uLpvbxiHPwQeplTkaAujKUO4HkrhF4VfkfAiQmDjs20NI/PXLim3D/Xu?=
 =?us-ascii?Q?8wgoZghiQP/F4ZGmOLy2rGeC6LdX+Xm8sCZ3s4oMlCYh/W+f9WGTi6M/S2C2?=
 =?us-ascii?Q?vNEvThohDm1wQ1L4yft8EBTrKIMwJcznqJtiNryP1qKBit3W2P8eLfn/9neu?=
 =?us-ascii?Q?tValB9lYRtr/5aBtW2A8FNLbeNtKVqc61pPAbLlinqRQiedczv53n5KB0U7s?=
 =?us-ascii?Q?gsJiI1vi2Rd4M09zhG4F9ARmr1rzyv6r3gXJfOdO6nUZ90kuLfg9HR8S/oFE?=
 =?us-ascii?Q?LK/HJehjgt+MEJb+FGXjo7CLpDZTU9mgsy9aznW6HjWy5QAqMABJflvC+wIv?=
 =?us-ascii?Q?wphDCtOx5OJMuaOHSzaxTcLlDwmLMGNg0ihWV01NHxKSr+C4rSRot7n0rO7d?=
 =?us-ascii?Q?FkBkVnYndulEbX7SlsuzsX6/0WigMVePqvV4b+JK1Rf6Vveh4B6F84q5LBiZ?=
 =?us-ascii?Q?97S2ooMg1sDbRqscGFuD2UIVVPbLh0wcGH4XYz1wQX+8CeMgcOa4H3aaCwN7?=
 =?us-ascii?Q?vy/4ihf75dG1V8erKsbg6cyjNg/m0KOZQMFfocNaM8dv8hLWtYrgGzahLDyA?=
 =?us-ascii?Q?E0FeSTBoNI3Q6NGUsk/DDJEuhw/D3mdV+RPh3a4raVwnAeZ328Abi/F+nyWo?=
 =?us-ascii?Q?go0PnWEvOZuO7XPthjr524/Kw6zdYSzR/H+qE9wGdmguT+g5AYn/kn+3kHyx?=
 =?us-ascii?Q?qJegwVSgYojc7W9jun1YxFgRL+yLFi4WvkmStU8TUOL0spGwg7pMc/C4OHrd?=
 =?us-ascii?Q?JSaY8Q6WUsdAISKWzdIfOb8W/J8toDmN0g/jU8nrzVby6U98LWZRg3EkxR3b?=
 =?us-ascii?Q?FeVGvYJm72d57UsYq1r9WmNEGjOWee3/GSMO1WGFg5vjLnQClofAOsYLswsx?=
 =?us-ascii?Q?1ZpO9B2UAvXQGBS2c7goucHFA8JgVkKnQNhFsAqzQJtnws+gCkcAlsn8G5B1?=
 =?us-ascii?Q?1ty0r32YHelFRh0KUPKMEMcdiWIthrGcyjG1z7mFJn5f/fKI15cj0Nq6NnXZ?=
 =?us-ascii?Q?90tO+elebmVZyZx9hI0K47p+fKftlSOCjvzf68jJu5dJzviyfMLf3ScKu43x?=
 =?us-ascii?Q?r6B9Fhi4mCpMqyMpTQAg1CryeZUBTSlwMjEseu7Iv5y/8mnCG0G6fBWjCirh?=
 =?us-ascii?Q?2Uxr4S9wAo3iIVaePI5mz2Bx0QNees963iIAafH+ht8+qymNgSHZeVySv2mt?=
 =?us-ascii?Q?i9CPwHNk13EgRh8xbZI=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b43fa56c-5bbe-4d51-e342-08d9a83c2ed7
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 13:31:08.8543 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E8qaSVZ5FkxsD/tBAyfxAvudzWS6e6lbN6NLjRMlnmxKg+xCK1zdLWX418dCyoDA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5111
Cc: Kevin Tian <kevin.tian@intel.com>, Chaitanya Kulkarni <kch@nvidia.com>,
 Ashok Raj <ashok.raj@intel.com>, kvm@vger.kernel.org, rafael@kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Cornelia Huck <cohuck@redhat.com>, Will Deacon <will@kernel.org>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Alex Williamson <alex.williamson@redhat.com>,
 Jacob jun Pan <jacob.jun.pan@intel.com>, linux-pci@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, Diana Craciun <diana.craciun@oss.nxp.com>
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

On Mon, Nov 15, 2021 at 05:21:26AM -0800, Christoph Hellwig wrote:
> On Mon, Nov 15, 2021 at 10:05:44AM +0800, Lu Baolu wrote:
> > pci_stub allows the admin to block driver binding on a device and make
> > it permanently shared with userspace. Since pci_stub does not do DMA,
> > it is safe.
> 
> If an IOMMU is setup and dma-iommu or friends are not used nothing is
> unsafe anyway, it just is that IOMMU won't work..
> 
> > However the admin must understand that using pci_stub allows
> > userspace to attack whatever device it was bound to.
> 
> I don't understand this sentence at all.

If userspace has control of device A and can cause A to issue DMA to
arbitary DMA addresses then there are certain PCI topologies where A
can now issue peer to peer DMA and manipulate the MMMIO registers in
device B.

A kernel driver on device B is thus subjected to concurrent
manipulation of the device registers from userspace.

So, a 'safe' kernel driver is one that can tolerate this, and an
'unsafe' driver is one where userspace can break kernel integrity.

The second issue is DMA - because there is only one iommu_domain
underlying many devices if we give that iommu_domain to userspace it
means the kernel DMA API on other devices no longer works. 

So no kernel driver doing DMA can work at all, under any PCI topology,
if userspace owns the IO page table.

Jason
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
