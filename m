Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7404749872B
	for <lists.iommu@lfdr.de>; Mon, 24 Jan 2022 18:44:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0CC91401CA;
	Mon, 24 Jan 2022 17:44:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wS6srN8Guo4H; Mon, 24 Jan 2022 17:44:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id E3A5B404C1;
	Mon, 24 Jan 2022 17:44:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B51C3C007A;
	Mon, 24 Jan 2022 17:44:11 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 12D93C002F
 for <iommu@lists.linux-foundation.org>; Mon, 24 Jan 2022 17:44:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0078760A79
 for <iommu@lists.linux-foundation.org>; Mon, 24 Jan 2022 17:44:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=nvidia.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GSVu4B1y0fqs for <iommu@lists.linux-foundation.org>;
 Mon, 24 Jan 2022 17:44:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2055.outbound.protection.outlook.com [40.107.223.55])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AD22B60A4F
 for <iommu@lists.linux-foundation.org>; Mon, 24 Jan 2022 17:44:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RxjJe7TQnSTKiRts1xBuDqV1Pyhs4ooo/Li15hD5nQtbCDB2bcdPkx4lUEIW4v+TyNPzN4+un+i5hG4EEmjlBDSSoeJ3kCrbPRMob9D2o9zv2eLGn8TU8eD/5FrK8yKNgGAcYNaNv8jgjO0qhI+LpBZzK/8TR7SQ6Rx/8lbb6mQE7SVevv4/04dT624X2HxrCf1skcF5hVfJVZD4dGWur2tim7USOJbVBzk7/GAj3XnfT+4rO9H1Nm9ubbwDMCOhNj++psG00qwF1mbBjV2yaQIARbRDgxi8aEe/QAGfdNPGUz+orGdUnzNeNoZF9c9Io08KwmHlYvafp2bP0QastQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ndk1qn/lu6zpu9F24w9LurxYGIpa7uCLMJeZ1ZC+W/E=;
 b=NzdF3gopHk4WdHdNQ3Yb+9FK93j3cafJvY7qeLIedzsCOHLrmHCMWOun/VcPFFBI4DHUO0nXjL7pjM7EEdsfzzNe5ovutEufczdOGxkqZ9bhBOenrPqOlpwV7nKHnUXfe8r5aXtFLmeOHYxcbDWVTnxERfnnGZVTlUs9JylUiEPPXbaM82XsDfAyFWBf2ZpuYlpixy4M7qJXMAVQpy4aDLdR7vjGe1XQDWSFUPhWDDNKtJSrlmyRFIzX+JlPuCx9IIH/FogkHFjdoSzd0c1TDC5cMg2LUA3ZAF7zCxUGKezgWvrcOjJUiyY/EB5K7W6uBJP+v9U9l02xvzhUQyjmiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ndk1qn/lu6zpu9F24w9LurxYGIpa7uCLMJeZ1ZC+W/E=;
 b=c3A2xAeP070fXBM4uVcFpHUsYH8jH9cxQjziVOIeuz00OWcdiWnNDYpY4Lqt090IVXvdLZJ+NuYV98VG5C33qObpSN23o9LhL4Kh6lzIKW8Y4bDni/0zunM/GigD1VL6+4epcODxDbtZehQ547L5v0UKAwBrhn0EpjpbTkXUBd+cbEGMEMTsUKPLLQnxbtxU/mWIssf/MIRMdVGqGOO4Ece7+hKIJED2QNWUQh5THUx2lOd/9cwtF+IW3T/BlulTVIjcYygfdeRptyuo4+v+xBD+bKHGFhmJ4LnftfzR8X5bSVwx5PEd1SV68AMatnkzupeRzeLlOoR+JRffLR4CRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by CY4PR12MB1414.namprd12.prod.outlook.com (2603:10b6:903:3a::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.13; Mon, 24 Jan
 2022 17:44:06 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ad3f:373f:b7d3:19c2]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ad3f:373f:b7d3:19c2%7]) with mapi id 15.20.4909.017; Mon, 24 Jan 2022
 17:44:06 +0000
Date: Mon, 24 Jan 2022 13:44:04 -0400
To: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH 0/7] iommu cleanup and refactoring
Message-ID: <20220124174404.GG966497@nvidia.com>
References: <20220124071103.2097118-1-baolu.lu@linux.intel.com>
 <BN9PR11MB52767F46CC13601306001B9E8C5E9@BN9PR11MB5276.namprd11.prod.outlook.com>
Content-Disposition: inline
In-Reply-To: <BN9PR11MB52767F46CC13601306001B9E8C5E9@BN9PR11MB5276.namprd11.prod.outlook.com>
X-ClientProxiedBy: MN2PR05CA0039.namprd05.prod.outlook.com
 (2603:10b6:208:236::8) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 337d52bc-b07f-46ca-f55a-08d9df611e04
X-MS-TrafficTypeDiagnostic: CY4PR12MB1414:EE_
X-Microsoft-Antispam-PRVS: <CY4PR12MB141417CE3251E64436AD5395C25E9@CY4PR12MB1414.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 76lTBKx7qLmjALtU6533xcWHlgbnrd2YcBms9q/54EL6lrg1Ja1Kf/+PYvM5TiU8QdgFpXN07OZyogP7Y9VTLSY1vKiq+xcHvPwlsc0RUS98Ob4P1Dtodmi/TPMrxgvEz6N7u3twQ4bRM5exvlzUNkkryd/H477LZYUXH1e2hwJqfxOPVwQrkIR+gVAzu2m/GuoutEcQaieSTnigChsnK6MIOb/nARoN19/zU4/kqDjNBDKPbzqRtjRIbTHwTlemKqQ1klp/bRUWDkxopypqbxFw77ezi32p9sgA1xLwPySuP0FIGsvIWS15taFvpLMHPW3bmVK+gB/X2kJw4+Wg4ubisKaiAKxcr+hRDmGYm6DuPbX5AT3sFe5i5KNXWnUL8cmnXDjOiChdoA5Ij7LnX4sSj2UpSzW06G0SVM03nRyTiIvMX6WiFlv0Iuyi4wxkh0jCHEpIFYaVE9R9de3xFX+yA8ofk3d763hYBuz+qFvh5R4YrHy/FfdliIir3UlXFzwP7bB8eZwpc6YzV+6zKaj09JLvQGG6UYAMKkxWnDqzPrTpd4mxp/DYWsF2URd+gsfEFPViSIv66hwhOuNCqykDjpRduF8nHc5dkTHldgBgPB5ObFrC3TRJTjOT/H2951KPBDqXa8uTPfcH+jVvlcu3szG7kGz5bQmCPM5igE0x/CoYhvhJFMCroATUMSvYXWjrB7rFwqwkNe4TpSIwAg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(54906003)(7416002)(38100700002)(1076003)(6916009)(4326008)(6486002)(66476007)(2906002)(316002)(508600001)(66556008)(6512007)(5660300002)(26005)(2616005)(66946007)(36756003)(8676002)(186003)(33656002)(8936002)(6506007)(27376004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?x9c+b0dqvPgWhBcN2ETYktYqf5eZgjHWToXBZV47GSyb5h4J18tPgIEAZl1K?=
 =?us-ascii?Q?i0qQDFo4Sm8PXn51RzSTt3QzYbZuynD9Ur7PmnNDSU7YMB8KaX00hb4mXSED?=
 =?us-ascii?Q?p6yEtC9w7LB3iHRpP26ccZUvjvGDqMFajRGE62hD3x3sRFbkRM3++FeFCAKh?=
 =?us-ascii?Q?vV8FfzqnXbmVxKCx9RBJ4K8IkNXVFiJlODMXFyUbBdCu6uZ7RiQ9C4zPsjF7?=
 =?us-ascii?Q?ZM5Or54EFdHt0xF5sB8RMNpM+wGk9PcK2177BIK8oeX+sBlnniWDWjifjBLr?=
 =?us-ascii?Q?QFPt1JsfmWtwsefeOIEiO6NkhmEHa1x3p+eXcNLv0MmcfWWq6xloy+hgz3wS?=
 =?us-ascii?Q?TTxQxENqzJyvWibDxiq/azT95EIRjWgiYGBXflNWPFOhEwqxj8lj4zx2ox1h?=
 =?us-ascii?Q?pulLpBss+uSRkjGMnNi9FgMtTsbyvzZVxUHu9E9uw2qGc7lgItp0PjQlbEzb?=
 =?us-ascii?Q?mxfIsWOeeTAlkpEvtrs72O2ufwVSlaGGAgQn2bYsr4EM4f01HVk6n65sB1zE?=
 =?us-ascii?Q?U6ty7PAS9AWk8XEcL46sHl4Utx5niOP/95uYxcqpBTXj/rkGQOEVEq1Pml7b?=
 =?us-ascii?Q?qPvI48A+wA9/tXNs9QCHgEJzrMRSHFEo0rTVizEFCau+F77QTifQTg2f3Eli?=
 =?us-ascii?Q?X21qhrrzXknkD3AKRJjrZhEXQzBNKQtX5lFnYVr7Qh4CJue0XIvfgB5kldsx?=
 =?us-ascii?Q?uL/q18RyHEr3ZrxhrSv3AMQWGm+xsjw3QVY0+mGB/2lVX48LilItOG9AV/XW?=
 =?us-ascii?Q?Dq/KJ5Uvv1rUhL6DQeeuOC5wmKjT4iEpzKPX7QNHp2txpFXKdHxwCYTRs0E0?=
 =?us-ascii?Q?jcpgnF220hmtZladQkTvpuzTjyPsE0N+5OAsf7GdBrW+n3O+yp1mhJNsRBA3?=
 =?us-ascii?Q?EOthghz0kewsqS3O49V1W/cB8lEnioJU3I4wa4HvWjm5SNiKh2Zy9VHvtt7X?=
 =?us-ascii?Q?PfeE8KDMmR7oZHG8r0jX4ez+iiQ+LD3bM5/9TAEx8e4Tp9QGOzeK6/UcWBkZ?=
 =?us-ascii?Q?sLukC1H19WDTGv39k7UBugfiVvaOC3h6NbC1og8fJaIjy4XSJ1XRPoqiwsWS?=
 =?us-ascii?Q?uMWyBvvpkd8dWVk2TSUqqtN6uw46LWv8RYuiOOwQq72wu3JsXfOtDWjIYez+?=
 =?us-ascii?Q?t+B93QjIOu7tSyds61C62on0T6ozLQgiYTVgo7nXQe7zAdDW7pxoJllp04a/?=
 =?us-ascii?Q?EuLRIqV6vJGd8zq4KqyL00bj9Yr4rQPRDh8hPRYqfFHgYAvuztf7u4RiJ2Ze?=
 =?us-ascii?Q?KiTld2W8/jtbkKmmsforRq9F8NDbSsHghB7GMR8eq4GX48I3gdat3IbQbK97?=
 =?us-ascii?Q?Gs44KBRllZhRBumGoTVkNDuzZ89pwLSO7HfjEwFWiQ2SX0DXNB5jD1lhWmSK?=
 =?us-ascii?Q?fgxLh/ItiiGtljJznW/e5f49VJOlaT5Y8Kvp0E6yDkgx2l3ckBgKiP1fXEWY?=
 =?us-ascii?Q?3ZPHpIHtwnoylQnB6KQRa4bnt93TL495RJJChGZSMVOXpEDsuPPfqrAfWdd+?=
 =?us-ascii?Q?OPLDLtGeWJzH1X1NlEDGWK6KPntAHu6t3Ve65wZ+dKM37Yl3zwVvM3m041qB?=
 =?us-ascii?Q?iiE9r+nogw+Nqi4ksik=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 337d52bc-b07f-46ca-f55a-08d9df611e04
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2022 17:44:06.0285 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VJ/2QZf5FB7Q6+KU8w0nvgxJnsMojVHwxxoJdnpm0EiL3X2Up1ErbP/QWEEmBJS3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1414
Cc: "Raj, Ashok" <ashok.raj@intel.com>, David Airlie <airlied@linux.ie>,
 Robin Murphy <robin.murphy@arm.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, "Pan,
 Jacob jun" <jacob.jun.pan@intel.com>, Christoph Hellwig <hch@infradead.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Thierry Reding <thierry.reding@gmail.com>, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>,
 Will Deacon <will@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

On Mon, Jan 24, 2022 at 09:46:26AM +0000, Tian, Kevin wrote:
> > From: Lu Baolu <baolu.lu@linux.intel.com>
> > Sent: Monday, January 24, 2022 3:11 PM
> > 
> > Hi,
> > 
> > The guest pasid and aux-domain related code are dead code in current
> > iommu subtree. As we have reached a consensus that all these features
> > should be based on the new iommufd framework (which is under active
> > development), the first part of this series removes and cleanups all
> > the dead code.
> > 
> > The second part of this series refactors the iommu_domain by moving all
> > domain-specific ops from iommu_ops to a new domain_ops. This makes an
> > iommu_domain self-contained and represent the abstraction of an I/O
> > translation table in the IOMMU subsystem. With different type of
> > iommu_domain providing different set of ops, it's easier to support more
> > types of I/O translation tables.
> 
> You may want to give more background on this end goal. In general there
> are four IOPT types in iommufd discussions:
> 
> 1) The one currently tracked by iommu_domain, with a map/unmap semantics
> 2) The one managed by mm and shared to iommu via sva_bind/unbind ops
> 3) The one managed by userspace and bound to iommu via iommufd (require nesting)
> 4) The one managed by KVM (e.g. EPT) and shared to iommu via a TBD interface

Yes, at least from an iommufd perspective I'd like to see one struct
for all of these types, mainly so we can have a uniform alloc, attach
and detatch flow for all io page table types. 

If we want to use the iommu_domain, or make iommu_domain a sub-class
of a new struct, can be determined as we go along.

Regardless, I think this cleanup stands on its own. Moving the ops and
purging the dead code is clearly the right thing to do.

Thanks,
Jason
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
