Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id A538A4D9E2A
	for <lists.iommu@lfdr.de>; Tue, 15 Mar 2022 15:55:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BA0E81344;
	Tue, 15 Mar 2022 14:55:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w49m3ZiO_0kd; Tue, 15 Mar 2022 14:55:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 342C980E42;
	Tue, 15 Mar 2022 14:55:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0CEA0C000B;
	Tue, 15 Mar 2022 14:55:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2C216C000B
 for <iommu@lists.linux-foundation.org>; Tue, 15 Mar 2022 14:55:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 19F3641696
 for <iommu@lists.linux-foundation.org>; Tue, 15 Mar 2022 14:55:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=nvidia.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E66Vz39kGOmh for <iommu@lists.linux-foundation.org>;
 Tue, 15 Mar 2022 14:55:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::61f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C63A141695
 for <iommu@lists.linux-foundation.org>; Tue, 15 Mar 2022 14:55:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mhIwCkPcAmsqs3eZYJyDMoQG9b1CZY2oZaGTc7kfMFyHK/p7shn5OpVWOxXDPEehfPAGHT/ly0bgxnYsLWd65eyyoTFeTu0+h5YDC3Fe6F2l7C+BonUNoI6HI0ftyJiWBB01781pq0m5ZpBo5rg9pnaVExQhggEb64GO3Jr4qiHzHQ8AVtfSIXWzIciKoPaPW8+cuTCKD/eywd7CVYbI82M0hE+4PpM7e6z/xebNMdRil3vcr1Pg1pATPsBP8NL+A9p0KwJ/QBjHdJ6TMZbHb2rDKvvEwf463nhd3qK0+zJlppFio9u5awzuBzD/SG07Di6QRJbnBPnhGNDAPA2gQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QZvhT8Q2MfLirZhjy4LH8f866Yd9QTsfEX/k5YoJn9E=;
 b=MGihEQkUIoLxeTWBZRwDkNFE2btF+dGLl6yiDv7riyDtAA+97KVmaFjvKU2muCr48LhF4YBCLexodMD7ddEE7wPPZLAuPtJ5vI2YdVOuVGPBatIBCVmv7brjI/q8Ornr5xqgWwWIFPWiLelLqXlh9/JksB6GAOFnCDO0SXuvBEVDvQUyM+lCeJlshhJEcUmwjMhtEW7WkkHv12G7rSjjePO+mFq2f+W7nxgd7QzdD+KaNBp7B+k6HvItBJB5r83Xev2ZLBb0TZjzH3NjjUIpL6PW3p7jh7Xivob9Tpj9HGJyqsG6qlgZqYBFvcvYrjEwsG1tbx/HOpSnF+/aC06w6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QZvhT8Q2MfLirZhjy4LH8f866Yd9QTsfEX/k5YoJn9E=;
 b=HlFHELjb9X+aZYXZN5yQ6tCPaMj43rgRem4Jq7YBO7rUAJWeUSJeJeVCZHdfbtIz2ZEukO4IXPf5NrDWK+a8bvFXdFC1wpqMF5/eh+JCsV47eSvGJo7fFj9CGBmWGW30RFvGANS9EbVZJqXe9lIMRA+17l/yltvYJV1nHW7XKGNsbsTtA4czHxMq1misgc2VupEbEjhJArA2SIOel5YVJMYUjCT/ENCsNkC3MmSmbnDUiyXBQd3DUPAqSS1C/kvgugU5GLTRreQB31FImpDbQCEo4dpS5HJh+rSvLfqYkDw6eHg3ALzd/aYfAL2Il+s/LuxAyeuKCJoItoaYwt8pNw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by SA0PR12MB4400.namprd12.prod.outlook.com (2603:10b6:806:95::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Tue, 15 Mar
 2022 14:55:21 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::51a0:4aee:2b4c:ca28]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::51a0:4aee:2b4c:ca28%4]) with mapi id 15.20.5061.029; Tue, 15 Mar 2022
 14:55:21 +0000
Date: Tue, 15 Mar 2022 11:55:20 -0300
To: Matthew Rosato <mjrosato@linux.ibm.com>
Subject: Re: [PATCH v4 15/32] vfio: introduce KVM-owned IOMMU type
Message-ID: <20220315145520.GZ11336@nvidia.com>
References: <20220314194451.58266-1-mjrosato@linux.ibm.com>
 <20220314194451.58266-16-mjrosato@linux.ibm.com>
 <20220314165033.6d2291a5.alex.williamson@redhat.com>
 <20220314231801.GN11336@nvidia.com>
 <9618afae-2a91-6e4e-e8c3-cb83e2f5c3d9@linux.ibm.com>
Content-Disposition: inline
In-Reply-To: <9618afae-2a91-6e4e-e8c3-cb83e2f5c3d9@linux.ibm.com>
X-ClientProxiedBy: MN2PR07CA0028.namprd07.prod.outlook.com
 (2603:10b6:208:1a0::38) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ba429809-f903-42be-b5b8-08da0693d40e
X-MS-TrafficTypeDiagnostic: SA0PR12MB4400:EE_
X-Microsoft-Antispam-PRVS: <SA0PR12MB44005A379A2551CB4C19BECDC2109@SA0PR12MB4400.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c6oKRT1YECSbmdZaMCoLc74DMUH5WEoBuzRcL+b7ygLWzbpSry7TfSCj1LUM/NcM9JCpDvC6t8QpPeG7/sNuk1Kspj92ZzRYGfgm0jfbMOQJXwvVjo85W6TpRQTguNNT0IuTgXXjMSnMNQ8QEcRe6dzzG/0j9zpushq9XZijW9mKf/xu7jRIw7AyVt9s7VD0uKJGqlx6VWwZVUJwpLePrJQVp57YJM0uXg1RxMLvIpc+jTRl/966BiKxLpfgz0wx6lTGpVTxHbJmbbjU4fh0gT03LQfyWwWqAb+QJbUopFgk1tnd3HskTdIzViyAl34xdxTAlknidK5hDa7vwodPRUnSw/v+Ul/ExeKf1lXnfJWCRTyvgjI8UT24QKrp9nLLqB5guz+qBGK+6UFPExIZhFrZdsHiyZ7dbAM8baNVJVGpR5U+O5usMJuCM3DJR1f7fccz+S871TygLx7F1CKE8cNBgToAP2xvj3rhcRRI8t+q77yAsS/ljsMWDClY7Rh9I2XXQAp2Eaizk4yEV3c2CcXLn+u6KX8tZHNB3Z7xBCNyjnDAyRdCkaVBQ3gCbggqg+GuXOiNNDdokzDsGQz4V3wIi2HCyZtmYkwzC1gFFTqD+1flkNc9BV8oqGpw3Qt/BCTyFw+iPXlasgAQmwjpKg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(6486002)(186003)(26005)(5660300002)(8936002)(36756003)(1076003)(7416002)(508600001)(2616005)(4326008)(86362001)(33656002)(6506007)(316002)(6512007)(66946007)(66476007)(66556008)(8676002)(38100700002)(83380400001)(6916009);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BtjUqvv0m7dCNkhqZYQsLpaVjY98VZ9vS6rdlNFC5LGaaHvKwGIcf5Zm9+k3?=
 =?us-ascii?Q?VuXNflzfo2vkkGvsY5ecIK+WuKFZnTWqYB+/jB66AEEyLR4CAXFMjnUqZrg5?=
 =?us-ascii?Q?O2VVUWl2xSLdaGW94/ajkInXmqUOoa+hmSfjdCq62rXeSnjPzx9LYQwGDv27?=
 =?us-ascii?Q?FlT1JMxqrM8jMuNTE18PAGXgsRvZD3PXAhNDpLuOnIJT6I5hLMD3kzmW+upy?=
 =?us-ascii?Q?96nBvFmTBae4T+GSgMd8PB23WQfcClhMSoKBu0uX1I6dWUZbobdI+Oopw80U?=
 =?us-ascii?Q?gxvn6NUm6vA3w+WSJ+2wSqQwFNrn2xaeTmuG0l1yB2p0prpqGBahgRuFZds5?=
 =?us-ascii?Q?QO9AKwkpFwnpQj/K13Pw6xTRC/wTDaROWRfCchA/chJew9oG++3Cyc4OTByA?=
 =?us-ascii?Q?10EYHVr3K0zE3DrXwXhjA0/yFWsNlhKxqTRalROFrWw6/uR0mUxnY5lP98EZ?=
 =?us-ascii?Q?KEbBMI23c5Z8sFzx2daB8v/oDSZV9xpSWwkqerR5mue1e1GC3YhAPe1s+fwi?=
 =?us-ascii?Q?cQia7vkV5rn2ZzhaZ+EMa3tSaykprjqQwlf+xcnpkscVgVkAqCS1O2O8PDZ8?=
 =?us-ascii?Q?IPukwHqJB+mIrC0F05QhKyqxSvDhtDylVv6rm9XgpHA1G939iWFPgWUYKlp2?=
 =?us-ascii?Q?16PkfsIQhv3CIVntCU1AFzp4U7qQPx6wmnplKfJRftzrDOWgUHK/swqzW7ry?=
 =?us-ascii?Q?t1c3nErLy7g+Je8ffHhtX6VOhvBjpo5GMj8lf6kw1p5V/qDRwaYEV0CY2PdP?=
 =?us-ascii?Q?vvx16Q9OjmY/RqVJ8ZWm3dc7aXx7Jg2wQ3LVUAFrdgf0gciptCCUwvnwx3Cu?=
 =?us-ascii?Q?6YhKR0FxotcTkS4ZoWVIlicx0XAzebigSG3bTGpRMi065s4iLZHBpQSchZ+L?=
 =?us-ascii?Q?xYhAsrBi14RdlcPYZmXWEmXbPsvonUc7HBfE9Kv0kOLsLlcjlnXiNIwAbCH7?=
 =?us-ascii?Q?E6id6zHQ5WFOKUCoIS19I8ihco8K6UZm3b9QlWXbrfsfZnGMNZNzGiCtw+WH?=
 =?us-ascii?Q?XT/hLMxZifMeBciTmm/ICqJvie3se/O1sDWQ/BashCjHyfOt2VDDTIev+dhL?=
 =?us-ascii?Q?ccq4thRWJGhpV+u2gqU9grM92pQZHJZlaftZpsQbwnFFriZWvs78s882MqLJ?=
 =?us-ascii?Q?quDmqrAfsAGRcWENytOA4WR02ugs2C1UYQCVJodRnrI+3frPqlQgmDNEXEM+?=
 =?us-ascii?Q?tn/mtsoJ3ogENxnysJ6xcLIs8oqnZUGC9gCJdc9EE1S4xxNQIbwua0xhqFyy?=
 =?us-ascii?Q?sje36pGqhqGI+b5iF68bUxJngIFYX7cglshlKHsTVEW3N/Kd0Wqt9Y+R6xrw?=
 =?us-ascii?Q?7C2KI0OREKjocnJrufQXzIFhPwtOdM3Vfxy5mLJnc3LYx8KXip9MYIgbtvUe?=
 =?us-ascii?Q?0rEWsx2haooasfeJvRYNAzlJqcybK5wJkVvKwuMTLeNdFM4LDx2rOcLRsXel?=
 =?us-ascii?Q?gWQ5dLINpYSNqTPGbRC4QBMSP+IXPLeZ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba429809-f903-42be-b5b8-08da0693d40e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2022 14:55:21.6851 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zZeTAus+Jj9a8rYik82c8zFTSfysQrEceDu/t/PcdCgZRvqQj/yCNu2TdIuXC8Lh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4400
Cc: kvm@vger.kernel.org, david@redhat.com, thuth@redhat.com,
 linux-kernel@vger.kernel.org, vneethv@linux.ibm.com, agordeev@linux.ibm.com,
 imbrenda@linux.ibm.com, will@kernel.org, linux-s390@vger.kernel.org,
 frankja@linux.ibm.com, corbet@lwn.net, linux-doc@vger.kernel.org,
 pasic@linux.ibm.com, gerald.schaefer@linux.ibm.com, borntraeger@linux.ibm.com,
 farman@linux.ibm.com, gor@linux.ibm.com, schnelle@linux.ibm.com,
 hca@linux.ibm.com, Alex Williamson <alex.williamson@redhat.com>,
 freude@linux.ibm.com, pmorel@linux.ibm.com, cohuck@redhat.com,
 oberpar@linux.ibm.com, iommu@lists.linux-foundation.org, svens@linux.ibm.com,
 pbonzini@redhat.com
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

On Tue, Mar 15, 2022 at 09:36:08AM -0400, Matthew Rosato wrote:
> > If we do try to stick this into VFIO it should probably use the
> > VFIO_TYPE1_NESTING_IOMMU instead - however, we would like to delete
> > that flag entirely as it was never fully implemented, was never used,
> > and isn't part of what we are proposing for IOMMU nesting on ARM
> > anyhow. (So far I've found nobody to explain what the plan here was..)
> > 
> 
> I'm open to suggestions on how better to tie this into vfio.  The scenario
> basically plays out that:

Ideally I would like it to follow the same 'user space page table'
design that Eric and Kevin are working on for HW iommu.

You have an 1st iommu_domain that maps and pins the entire guest physical
address space.

You have an nested iommu_domain that represents the user page table
(the ioat in your language I think)

When the guest says it wants to set a user page table then you create
the nested iommu_domain representing that user page table and pass in
the anchor (guest address of the root IOPTE) to the kernel to do the
work.

The rule for all other HW's is that the user space page table is
translated by the top level kernel page table. So when you traverse it
you fetch the CPU page storing the guest's IOPTE by doing an IOVA
translation through the first level page table - not through KVM.

Since the first level page table an the KVM GPA should be 1:1 this is
an equivalent operation.

> 1) the iommu will be domain_alloc'd once VFIO_SET_IOMMU is issued -- so at
> that time (or earlier) we have to make the decision on whether to use the
> standard IOMMU or this alternate KVM/nested IOMMU.

So in terms of iommufd I would see it this would be an iommufd 'create
a device specific iomm_domain' IOCTL and you can pass in a S390
specific data blob to make it into this special mode.

> > This is why I said the second level should be an explicit iommu_domain
> > all on its own that is explicitly coupled to the KVM to read the page
> > tables, if necessary.
> 
> Maybe I misunderstood this.  Are you proposing 2 layers of IOMMU that
> interact with each other within host kernel space?
> 
> A second level runs the guest tables, pins the appropriate pieces from the
> guest to get the resulting phys_addr(s) which are then passed via iommu to a
> first level via map (or unmap)?


The first level iommu_domain has the 'type1' map and unmap and pins
the pages. This is the 1:1 map with the GPA and ends up pinning all
guest memory because the point is you don't want to take a memory pin
on your performance path

The second level iommu_domain points to a single IO page table in GPA
and is created/destroyed whenever the guest traps to the hypervisor to
manipulate the anchor (ie the GPA of the guest IO page table).

> > But I'm not sure that reading the userspace io page tables with KVM is
> > even the best thing to do - the iommu driver already has the pinned
> > memory, it would be faster and more modular to traverse the io page
> > tables through the pfns in the root iommu_domain than by having KVM do
> > the translations. Lets see what Matthew says..
> 
> OK, you lost me a bit here.  And this may be associated with the above.
> 
> So, what the current implementation is doing is reading the guest DMA tables
> (which we must pin the first time we access them) and then map the PTEs of
> the associated guest DMA entries into the associated host DMA table (so,
> again pin and place the address, or unpin and invalidate).  Basically we are
> shadowing the first level DMA table as a copy of the second level DMA table
> with the host address(es) of the pinned guest page(s).

You can't pin/unpin in this path, there is no real way to handle error
and ulimit stuff here, plus it is really slow. I didn't notice any of
this in your patches, so what do you mean by 'pin' above?

To be like other IOMMU nesting drivers the pages should already be
pinned and stored in the 1st iommu_domain, lets say in an xarray. This
xarray is populated by type1 map/unmap sytem calls like any
iommu_domain.

A nested iommu_domain should create the real HW IO page table and
associate it with the real HW IOMMU and record the parent 1st level iommu_domain.

When you do the shadowing you use the xarray of the 1st level
iommu_domain to translate from GPA to host physical and there is no
pinning/etc involved. After walking the guest table and learning the
final vIOVA it is translated through the xarray to a CPU physical and
then programmed into the real HW IO page table.

There is no reason to use KVM to do any of this, and is actively wrong
to place CPU pages from KVM into an IOPTE that did not come through
the type1 map/unmap calls that do all the proper validation and
accounting.

Jason
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
