Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF6C3A1858
	for <lists.iommu@lfdr.de>; Wed,  9 Jun 2021 17:00:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5647606E5;
	Wed,  9 Jun 2021 15:00:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O7yiY5B67GKw; Wed,  9 Jun 2021 15:00:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id C992060663;
	Wed,  9 Jun 2021 15:00:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8F3C6C0024;
	Wed,  9 Jun 2021 15:00:17 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0C9B7C000B
 for <iommu@lists.linux-foundation.org>; Wed,  9 Jun 2021 15:00:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E62F340137
 for <iommu@lists.linux-foundation.org>; Wed,  9 Jun 2021 15:00:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=nvidia.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DKlEOhMAi0Yd for <iommu@lists.linux-foundation.org>;
 Wed,  9 Jun 2021 15:00:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2060f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8b::60f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E4461400CB
 for <iommu@lists.linux-foundation.org>; Wed,  9 Jun 2021 15:00:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UVhBK/JlUuBR7A/pmG2JBye+fLrutcvAqKZxoR7myJxh7p9OwRMSgwx8s7wavJkeDyvEgJ4f+f4d13BptgPlVsZGPyKjiW9Ja4tWz0TQZ2m80zx4CWCt6w5deZ23jv3vnIpaLKxtU8i3VveovtSHuGiP5iiY4hAkJYgielvtPuu5BSe9mkXaC4bxfxF8EgsuFgo2qdwnurvUEE5fcUqvBLtT0v6HKxLgTGWfbBfhOsqaiv6kb/tKhAK0lVDxrn+0swsaYQZ3cv+F+mzU0orG1fflo4Sst9GU1857p8gDWnDq29cw2JvBc93ax4Y0VP767MYXEJpnpDD9jfuJHsyAmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iaZBTm1WPUdt+B6AuCN5rxUczaWqIL4BsBBVSaVi3CQ=;
 b=eUWfAepYtCxevjfu6GstIO2b46qYqbm7HHzhmVxRk8sKnxcH6+Nk88TGvSXw7dZbpVBxRqhma6fCKMzkJglg301s08vaSZdlt6cjZ+B2afQxjfG2ldCauPWqffSB7n5QRUW7ukmoFYMx6h4SappbubgKHHpTw4T2za/pIRW6PNdteGdPYaHDNhugeQBvZzZTnAgY+Pwm+Qx1zi/ZOPNgMBaCszs0IggWvMiExDP8LTGXEIHQnkz3Kvtl1QumJYaJ1oGqZKbsWqb/ZHDc/ZkO7aFsQ+8oetfdWE8Ev+kXoPTXSfQsEYYkImS6DJMR6YMRo1aJFPpYQ+rPyR1k0k5cXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iaZBTm1WPUdt+B6AuCN5rxUczaWqIL4BsBBVSaVi3CQ=;
 b=cgpDcM8hctmDG+cbQju7UmcHXPuySQnYjeHZrEsMr58w89Nj90EyW5WcMHTLE+wkuVv982vORPYN0Eeh1Ec8bLNt5gsLh7WWFi1lO90g6WWQp8E/HjbT15ympp4tFW3fvJZHkNHvD7BnQ/GXVVskM5bv8bMnsZBHhCWiXyupOzBWlwcKY/O9+s7E74CWT3fF7HyCsMmf9Df6w0IhAQ2HAH5r7nS+PIs5W1AjnT/JK41UBRaYTkgIqM/EjP9dINgZTiNfJ+P7vpZajcZfZ6TzM2B00hSer1bMbC2wzcUFxpGX9jcdJb0G4DXypWpD84H0fiwinmA/icovEPVJX+MEKg==
Authentication-Results: 8bytes.org; dkim=none (message not signed)
 header.d=none;8bytes.org; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5349.namprd12.prod.outlook.com (2603:10b6:208:31f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20; Wed, 9 Jun
 2021 15:00:11 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::3d51:a3b9:8611:684e]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::3d51:a3b9:8611:684e%7]) with mapi id 15.20.4219.021; Wed, 9 Jun 2021
 15:00:10 +0000
Date: Wed, 9 Jun 2021 12:00:09 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: Plan for /dev/ioasid RFC v2
Message-ID: <20210609150009.GE1002214@nvidia.com>
References: <MWHPR11MB188699D0B9C10EB51686C4138C389@MWHPR11MB1886.namprd11.prod.outlook.com>
 <YMCy48Xnt/aphfh3@8bytes.org> <20210609123919.GA1002214@nvidia.com>
 <YMDC8tOMvw4FtSek@8bytes.org>
Content-Disposition: inline
In-Reply-To: <YMDC8tOMvw4FtSek@8bytes.org>
X-Originating-IP: [47.55.113.94]
X-ClientProxiedBy: BL1PR13CA0084.namprd13.prod.outlook.com
 (2603:10b6:208:2b8::29) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (47.55.113.94) by
 BL1PR13CA0084.namprd13.prod.outlook.com (2603:10b6:208:2b8::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.9 via Frontend
 Transport; Wed, 9 Jun 2021 15:00:10 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1lqzgf-004eaJ-Ob; Wed, 09 Jun 2021 12:00:09 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e398b361-d770-457a-66f2-08d92b57471a
X-MS-TrafficTypeDiagnostic: BL1PR12MB5349:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB5349F2A04075633B3901CECCC2369@BL1PR12MB5349.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ojnXo7QbiNT06iPlMv8EQJPAYoxfco5tSa4szgHPODYpxQuYpv8x9Fw8b4zsJWLNFieegM9fKKRuf/ffVB1Ybo5Zd6noXTHb6/hHHXjAngXqdiGkh+Qy7nFtjo+r3vWpUzhXv8e/snrlJLooP7RWhNhu3RTVnLsR32CPnlAeJYSFtZfY76goIXveZ9+KW1+pTytYSmDyUE60ewDQq0TzqbTn+P9Bo3SQ67P/28xxpzlA74DRiUdzZ7j+UH5Qa7/ON95RvYz/SfMepMkkSb4+QQeEzaZTLjTm/9s3qmv/g3aPj8a4lKdg68epU+vPAstCb9bghsxCV3LME8eTGaHiORSZnjA5okG1E6R0GQBaWCoIzpgZZpey5jtSmbxfAmpzufD5pPPrtKbPjZFu/hP1gcIU7dklmhT8Fsap2Xxw0Bdb4xSZ5tGn/uo/dTPNtUESIAuE2mlQLYkESto9JZNbtsspnu8KwCWJkXiGgf8tKLxNuPYE6ycejipBRnyZQW+GrDsUEM2jzYPNqDtZMd62tSMm4PtUM6aP8l3XM54Hx/Hh1AvqVR4qY911rL0lWG9TQHLsNzBSKt0CNZIIJqwo3jPaKM0j4vQzuk5O7psvGP0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66556008)(9746002)(2906002)(8676002)(26005)(33656002)(54906003)(186003)(36756003)(5660300002)(8936002)(38100700002)(426003)(6916009)(2616005)(1076003)(83380400001)(498600001)(66476007)(66946007)(4326008)(7416002)(86362001)(9786002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EnV1lZw3tD3lRydRfwEBtxn9DTFQemwtozi8H/WwAXd8HQ65Q/mcTz1CUl++?=
 =?us-ascii?Q?l4bt6O5+cY5JddXSaP42K5614kXJPBFvT3N+AVAtkEdOaV1s8NiSTQaywN95?=
 =?us-ascii?Q?YO5jKvYqUBSi1hnDVLFBLkwkPPuWE/JWXJEcLfZkNndry+ZZYqNMu5Rdv5Uj?=
 =?us-ascii?Q?H8gjL65A2lEY/GXqgXBhUFxrRovLCWK7g/MWYOnakKblset/DGK955tQRmP+?=
 =?us-ascii?Q?8Qj2jJ0ju4VPnh74kjucCU8WSx0SVjP6APWhekVSRDsjyjvqCmc2S4JUqZ/x?=
 =?us-ascii?Q?Y+SfjBAVCkPdu+uNL4Jxk/5h9LScQEi84Dx5vaIF86QoyucH7ejGbQUjN1fP?=
 =?us-ascii?Q?2pn9exoEh8LPZUBUhRdpG0GLuC9o1WTtiSx4qZAN8BUujT5u+CGpPtsBdCv1?=
 =?us-ascii?Q?sIAfJT5daNQs6Ojdox/UEJL1id872MUcXyQjrSo5DBFKcwhn+TkoRdFh5xQ6?=
 =?us-ascii?Q?khr7SE1mkC9zsanuFk1US9q+fwNj3Hx8wsf3WLJSyvTN1L2BKP/N7wMAEoRg?=
 =?us-ascii?Q?4vOzXuQ3wiuOll37nf5o892KSjGtXo41Y+TualYp4ArEass8Xvv9RCUlaeEY?=
 =?us-ascii?Q?htoC9boSyglqczyCeXwl5FTfnXSw7pA6g6vG+LRWvgNzkFirzMwiKkhYBFpI?=
 =?us-ascii?Q?Ue57oP/i1qxTOP15vxlKthv6KXw+SbftngSa6wW7i9Tmt09uBf3VnGp7qRCJ?=
 =?us-ascii?Q?Cyxrf7h8j3ZvngOp7LWVVSY1EMIDojBvor+O6copiiH8PwwA1AkGrQcJ/61n?=
 =?us-ascii?Q?sLmpq/YoNu7bp7c0sjoukWZ+oQi0ZATieWB7BZSygKdFFotXLAYw18OQvXA7?=
 =?us-ascii?Q?93HlMrJu1mQTSvg3rIh1za6R7D0E7wnMTuCD23tMtzvITlowDgIbWCP+DPet?=
 =?us-ascii?Q?K5CufhNf2R9kPGh9/OfMWOhdTvVyXD7MjwWYvR8FPSirRZI5xX1TThhMc1Oc?=
 =?us-ascii?Q?Z1oAZc5puUEveAa3HaRh/Yh3hHuH36jdQnXU+S6j5rJE9zBJx67CSkVEkkfY?=
 =?us-ascii?Q?6Qn56DdaRmfv4ltP7JAbeSVaJR302L+Cwhz9czBm0tkSebG3DfsqkVktwg21?=
 =?us-ascii?Q?AYPz64WXjfPwDrN8P0bjS2KDtdj1yrVTKnN986yr7pmGT05ZyKz30jSh9OjL?=
 =?us-ascii?Q?oMZNNh1v9Nj5zu5cyXFhv/1Ae929f0z4fe2fXSHwTLv7gYL2/knMJmLnM0V1?=
 =?us-ascii?Q?4NGy378I5+AmvVSi9AIW+6w7vMcyLNlSDKUtGa1yY2WhwXzlhDvd3eiBupo7?=
 =?us-ascii?Q?481uGa3TFR9fwQNraC8rxR1BYrPU4EcxSxF0YXK8KZVPUBGo+bwKWJwC+e1m?=
 =?us-ascii?Q?ElEh+FLCpreR7mMQbouF1lj0?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e398b361-d770-457a-66f2-08d92b57471a
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2021 15:00:10.6768 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mBsBqeUz84ibAt75kBWda+/qF+jQ1ujtle0iXhpXNKcgcEhNw3e8x8hcejop5Ip+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5349
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Jason Wang <jasowang@redhat.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, "Jiang,
 Dave" <dave.jiang@intel.com>, "Raj, Ashok" <ashok.raj@intel.com>,
 Jonathan Corbet <corbet@lwn.net>, "Tian, Kevin" <kevin.tian@intel.com>,
 "parav@mellanox.com" <parav@mellanox.com>,
 "Alex Williamson \(alex.williamson@redhat.com\)" <alex.williamson@redhat.com>,
 "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
 David Gibson <david@gibson.dropbear.id.au>,
 Robin Murphy <robin.murphy@arm.com>, LKML <linux-kernel@vger.kernel.org>,
 Shenming Lu <lushenming@huawei.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Paolo Bonzini <pbonzini@redhat.com>, David Woodhouse <dwmw2@infradead.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Wed, Jun 09, 2021 at 03:32:34PM +0200, Joerg Roedel wrote:

> > The group is causing all this mess because the group knows nothing
> > about what the device drivers contained in the group actually want.
> 
> There are devices in the group, not drivers.

Well exactly, that is the whole problem.

Only *drivers* know what the actual device is going to do, devices do
not. Since the group doesn't have drivers it is the wrong layer to be
making choices about how to configure the IOMMU.

As I've said trying to cram these necessary choices through the group
has made mess. I think if people want to keep the group then they need
to come up with a reasonable in-kernel API that gets the driver
involved in the required decisions. ie figure out how to do PASID
support on VFIO type1 that isn't grotequesly hardwired to mdev like
today.

The device centric approach is my attempt at this, and it is pretty
clean, I think.

> > Further being group centric eliminates the possibility of working in
> > cases like !ACS. How do I use PASID functionality of a device behind a
> > !ACS switch if the uAPI forces all IOASID's to be linked to a group,
> > not a device?
> 
> You don't use it, because it is not secure for devices which are not
> behind an ACS bridge.

All ACS does is prevent P2P operations, if you assign all the group
devices into the same /dev/iommu then you may not care about that
security isolation property. At the very least it is policy for user
to decide, not kernel.

> > Device centric with an report that "all devices in the group must use
> > the same IOASID" covers all the new functionality, keep the old, and
> > has a better chance to keep going as a uAPI into the future.
> 
> If all devices in the group have to use the same IOASID anyway, 

That isn't true! That is true *today* due to the API design but
nothing about the HW forces this, and with PASID it starts to become
problematic.

Groups should be primarily about isolation security, not about IOASID
matching.

Again, there is no reason to block PASID support in the vIOMMU if all
the devices in the group are assigned into the same VM, and the HW can
properly match the (RID,PASID). PASID can't transit a PCI-PCIe bridge,
PASID isn't supported by old IOMMUs that can't do RID matching, so
PASID scenarios should always be able to determine the source
regardless of what the group layout is.

Blocking this forever in the new uAPI just because group = IOASID is
some historical convenience makes no sense to me.

Jason
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
